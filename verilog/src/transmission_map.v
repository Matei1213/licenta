//   t(x) = 1  -> pixelul nu e afectat de ceata, camera vede scena "ideal"
//   t(x) = 0  -> ceata completa, camera vede doar airlight
//
//     t(x) = 1 - omega * DC(x) / A_max
//
//   A_max  = max(airlight_R, airlight_G, airlight_B) 
//   omega  = 0.95  (haze factor, daca ar fi 1 imaginea ar ajunge sa fie supra saturata)
//
// transmission pe 8 biti:  0 = ceata complet,  255 = fara ceata. (vezi valori 128/255 airlight)
`timescale 1ns/1ps

module transmission_map (
    input              clk,
    input              rst,
	input  [7:0]       dc_in,
    input  [7:0]       r_in,
    input  [7:0]       g_in,
    input  [7:0]       b_in,
    input  [7:0]       airlight_r,
    input  [7:0]       airlight_g,
    input  [7:0]       airlight_b,
    input              hs_in,
    input              vs_in,
    input              de_in,

    output reg [7:0]   t_out,
    output reg [7:0]   r_out,
    output reg [7:0]   g_out,
    output reg [7:0]   b_out,
    output reg [7:0]   ar_out,
    output reg [7:0]   ag_out,
    output reg [7:0]   ab_out,
    output reg         hs_out,
    output reg         vs_out,
    output reg         de_out
);

wire [7:0] arg_max  = (airlight_r > airlight_g) ? airlight_r : airlight_g;
wire [7:0] argb_max = (arg_max    > airlight_b) ? arg_max    : airlight_b;
//folosim doar maximul valorii airlight, pt ca scuteste irosirea de resurse

reg [7:0] a_max;
always @(posedge clk or posedge rst) begin
    if (rst) a_max <= 8'd255; //explicatie in airlight
    else     a_max <= argb_max;
end

//de revazut, m-a ajutat andrei
reg [15:0] recip_lut [0:255];

initial begin
    recip_lut[0] = 16'd0;        // divide-by-zero guard

    
    recip_lut[1]   = 16'd62016;  recip_lut[2]   = 16'd31008;
    recip_lut[3]   = 16'd20672;  recip_lut[4]   = 16'd15504;
    recip_lut[5]   = 16'd12403;  recip_lut[6]   = 16'd10336;
    recip_lut[7]   = 16'd8859;   recip_lut[8]   = 16'd7752;
    recip_lut[9]   = 16'd6891;   recip_lut[10]  = 16'd6201;
    recip_lut[11]  = 16'd5638;   recip_lut[12]  = 16'd5168;
    recip_lut[13]  = 16'd4770;   recip_lut[14]  = 16'd4429;
    recip_lut[15]  = 16'd4134;   recip_lut[16]  = 16'd3876;
end


genvar idx;
generate
    for (idx = 17; idx < 256; idx = idx + 1) begin : LUT_INIT
        initial recip_lut[idx] = (62016 + (idx >> 1)) / idx;
    end
endgenerate


reg [15:0] recip_amax;
always @(posedge clk or posedge rst) begin
    if (rst) recip_amax <= 16'd0;
    else     recip_amax <= recip_lut[a_max];
end
//luam valori din lut

reg [7:0] dc_s2;
always @(posedge clk or posedge rst) begin
    if (rst) dc_s2 <= 8'd0;
    else     dc_s2 <= dc_in;
end

reg [7:0] r_s2;
always @(posedge clk or posedge rst) begin
    if (rst) r_s2 <= 8'd0;
    else     r_s2 <= r_in;
end

reg [7:0] g_s2;
always @(posedge clk or posedge rst) begin
    if (rst) g_s2 <= 8'd0;
    else     g_s2 <= g_in;
end

reg [7:0] b_s2;
always @(posedge clk or posedge rst) begin
    if (rst) b_s2 <= 8'd0;
    else     b_s2 <= b_in;
end

reg [7:0] ar_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ar_s2 <= 8'd255;
    else     ar_s2 <= airlight_r;
end

reg [7:0] ag_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ag_s2 <= 8'd255;
    else     ag_s2 <= airlight_g;
end

reg [7:0] ab_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ab_s2 <= 8'd255;
    else     ab_s2 <= airlight_b;
end

reg hs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s2 <= 1'b0;
    else     hs_s2 <= hs_in;
end

reg vs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s2 <= 1'b0;
    else     vs_s2 <= vs_in;
end

reg de_s2;
always @(posedge clk or posedge rst) begin
    if (rst) de_s2 <= 1'b0;
    else     de_s2 <= de_in;
end
//delay sincronizari


wire [23:0] mult_full       = dc_s2 * recip_amax;  //8bit(img dc) * 16b ( recip) ( DC * omega/A_max)
wire        mult_overflow   = (mult_full[23:16] != 8'd0);
wire [7:0]  omega_dc_over_a = mult_overflow ? 8'd255 : mult_full[15:8];
//normalizare


reg [7:0] omega_dc_s3;
always @(posedge clk or posedge rst) begin
    if (rst) omega_dc_s3 <= 8'd0;
    else     omega_dc_s3 <= omega_dc_over_a;
end


reg [7:0] r_s3;
always @(posedge clk or posedge rst) begin
    if (rst) r_s3 <= 8'd0;
    else     r_s3 <= r_s2;
end

reg [7:0] g_s3;
always @(posedge clk or posedge rst) begin
    if (rst) g_s3 <= 8'd0;
    else     g_s3 <= g_s2;
end

reg [7:0] b_s3;
always @(posedge clk or posedge rst) begin
    if (rst) b_s3 <= 8'd0;
    else     b_s3 <= b_s2;
end

reg [7:0] ar_s3;
always @(posedge clk or posedge rst) begin
    if (rst) ar_s3 <= 8'd255;
    else     ar_s3 <= ar_s2;
end

reg [7:0] ag_s3;
always @(posedge clk or posedge rst) begin
    if (rst) ag_s3 <= 8'd255;
    else     ag_s3 <= ag_s2;
end

reg [7:0] ab_s3;
always @(posedge clk or posedge rst) begin
    if (rst) ab_s3 <= 8'd255;
    else     ab_s3 <= ab_s2;
end

reg hs_s3;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s3 <= 1'b0;
    else     hs_s3 <= hs_s2;
end

reg vs_s3;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s3 <= 1'b0;
    else     vs_s3 <= vs_s2;
end

reg de_s3;
always @(posedge clk or posedge rst) begin
    if (rst) de_s3 <= 1'b0;
    else     de_s3 <= de_s2;
end
//delay pt sincronizari

wire [7:0] t_unclamped = 8'd255 - omega_dc_s3;  // aici avem scaderea t = 1 - omega * ... (calculata cu lut)
wire [7:0] t_clamped   = (t_unclamped < 8'd10) ? 8'd10 : t_unclamped;  // in cazul in care t ajunge ~= cu 0


always @(posedge clk or posedge rst) begin
    if (rst) t_out <= 8'd255;
    else     t_out <= t_clamped;
end

always @(posedge clk or posedge rst) begin
    if (rst) r_out <= 8'd0;
    else     r_out <= r_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_out <= 8'd0;
    else     g_out <= g_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_out <= 8'd0;
    else     b_out <= b_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) ar_out <= 8'd255;
    else     ar_out <= ar_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) ag_out <= 8'd255;
    else     ag_out <= ag_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) ab_out <= 8'd255;
    else     ab_out <= ab_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_out <= 1'b0;
    else     hs_out <= hs_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_out <= 1'b0;
    else     vs_out <= vs_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_out <= 1'b0;
    else     de_out <= de_s3;
end
//delay sincronizari

endmodule
