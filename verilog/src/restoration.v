//     I(x) = t(x) * J(x) + (1 - t(x)) * A
//   =>
//     J(x) = (I(x) - A) * (255 / t(x)) + A
`timescale 1ns/1ps

module restoration (
    input              clk,
    input              rst,
    input  [7:0]       t_in,        
    input  [7:0]       r_in,
    input  [7:0]       g_in,
    input  [7:0]       b_in,
    input  [7:0]       ar_in,       // airlight R
    input  [7:0]       ag_in,       // airlight G
    input  [7:0]       ab_in,       // airlight B
    input              hs_in,
    input              vs_in,
    input              de_in,

    output reg [15:0]  rgb565_out,  
    output reg         hs_out,
    output reg         vs_out,
    output reg         de_out
);


//de revazut, intreaba andrei
reg [12:0] inv_t_lut [0:255];

genvar i;
generate
    for (i = 0; i < 256; i = i + 1) begin : INV_T_INIT
        initial inv_t_lut[i] = (i == 0) ? 13'd2611 : (65280 / i);
    end
endgenerate



reg [12:0] inv_t_s1;
always @(posedge clk or posedge rst) begin
    if (rst) inv_t_s1 <= 13'd256;         
    else     inv_t_s1 <= inv_t_lut[t_in];
end



reg [7:0] r_s1;
always @(posedge clk or posedge rst) begin
    if (rst) r_s1 <= 8'd0;
    else     r_s1 <= r_in;
end

reg [7:0] g_s1;
always @(posedge clk or posedge rst) begin
    if (rst) g_s1 <= 8'd0;
    else     g_s1 <= g_in;
end

reg [7:0] b_s1;
always @(posedge clk or posedge rst) begin
    if (rst) b_s1 <= 8'd0;
    else     b_s1 <= b_in;
end

reg [7:0] ar_s1;
always @(posedge clk or posedge rst) begin
    if (rst) ar_s1 <= 8'd255;
    else     ar_s1 <= ar_in;
end

reg [7:0] ag_s1;
always @(posedge clk or posedge rst) begin
    if (rst) ag_s1 <= 8'd255;
    else     ag_s1 <= ag_in;
end

reg [7:0] ab_s1;
always @(posedge clk or posedge rst) begin
    if (rst) ab_s1 <= 8'd255;
    else     ab_s1 <= ab_in;
end

reg hs_s1;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s1 <= 1'b0;
    else     hs_s1 <= hs_in;
end

reg vs_s1;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s1 <= 1'b0;
    else     vs_s1 <= vs_in;
end

reg de_s1;
always @(posedge clk or posedge rst) begin
    if (rst) de_s1 <= 1'b0;
    else     de_s1 <= de_in;
end
//delay sincronizari

//(I-A) poate fi negativ
//la intrare 8b unsigned, e nev de signed 9bit ca sa avem valori intre -255 + 255
wire signed [8:0] diff_r = $signed({1'b0, r_s1}) - $signed({1'b0, ar_s1});
wire signed [8:0] diff_g = $signed({1'b0, g_s1}) - $signed({1'b0, ag_s1});
wire signed [8:0] diff_b = $signed({1'b0, b_s1}) - $signed({1'b0, ab_s1});

reg signed [8:0] diff_r_s2;
always @(posedge clk or posedge rst) begin
    if (rst) diff_r_s2 <= 9'sd0;
    else     diff_r_s2 <= diff_r;
end

reg signed [8:0] diff_g_s2;
always @(posedge clk or posedge rst) begin
    if (rst) diff_g_s2 <= 9'sd0;
    else     diff_g_s2 <= diff_g;
end

reg signed [8:0] diff_b_s2;
always @(posedge clk or posedge rst) begin
    if (rst) diff_b_s2 <= 9'sd0;
    else     diff_b_s2 <= diff_b;
end


reg [12:0] inv_t_s2;
always @(posedge clk or posedge rst) begin
    if (rst) inv_t_s2 <= 13'd256;
    else     inv_t_s2 <= inv_t_s1;
end

reg [7:0] ar_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ar_s2 <= 8'd255;
    else     ar_s2 <= ar_s1;
end

reg [7:0] ag_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ag_s2 <= 8'd255;
    else     ag_s2 <= ag_s1;
end

reg [7:0] ab_s2;
always @(posedge clk or posedge rst) begin
    if (rst) ab_s2 <= 8'd255;
    else     ab_s2 <= ab_s1;
end

reg hs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s2 <= 1'b0;
    else     hs_s2 <= hs_s1;
end

reg vs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s2 <= 1'b0;
    else     vs_s2 <= vs_s1;
end

reg de_s2;
always @(posedge clk or posedge rst) begin
    if (rst) de_s2 <= 1'b0;
    else     de_s2 <= de_s1;
end


//(I - A) * (255/t)
//signed 9b * unsigned13b = signed 23b
wire signed [22:0] mul_r = diff_r_s2 * $signed({1'b0, inv_t_s2});
wire signed [22:0] mul_g = diff_g_s2 * $signed({1'b0, inv_t_s2});
wire signed [22:0] mul_b = diff_b_s2 * $signed({1'b0, inv_t_s2});

//practic shiftare de biti, pastram doar ce avem nev
wire signed [14:0] scaled_r = mul_r[22:8];
wire signed [14:0] scaled_g = mul_g[22:8];
wire signed [14:0] scaled_b = mul_b[22:8];


reg signed [14:0] scaled_r_s3;
always @(posedge clk or posedge rst) begin
    if (rst) scaled_r_s3 <= 15'sd0;
    else     scaled_r_s3 <= scaled_r;
end

reg signed [14:0] scaled_g_s3;
always @(posedge clk or posedge rst) begin
    if (rst) scaled_g_s3 <= 15'sd0;
    else     scaled_g_s3 <= scaled_g;
end

reg signed [14:0] scaled_b_s3;
always @(posedge clk or posedge rst) begin
    if (rst) scaled_b_s3 <= 15'sd0;
    else     scaled_b_s3 <= scaled_b;
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



//     J = (I - A) * 255/t + A   (per channel)
//se aduna val airlight
wire signed [15:0] sum_r = scaled_r_s3 + $signed({8'b0, ar_s3});
wire signed [15:0] sum_g = scaled_g_s3 + $signed({8'b0, ag_s3});
wire signed [15:0] sum_b = scaled_b_s3 + $signed({8'b0, ab_s3});


// clamping la valori intre 0 si 255
wire [7:0] clamp_r = (sum_r < 0)         ? 8'd0   :
                     (sum_r > 16'sd255)  ? 8'd255 :
                                           sum_r[7:0];

wire [7:0] clamp_g = (sum_g < 0)         ? 8'd0   :
                     (sum_g > 16'sd255)  ? 8'd255 :
                                           sum_g[7:0];

wire [7:0] clamp_b = (sum_b < 0)         ? 8'd0   :
                     (sum_b > 16'sd255)  ? 8'd255 :
                                           sum_b[7:0];


wire [15:0] rgb565_packed = {clamp_r[7:3], clamp_g[7:2], clamp_b[7:3]};



always @(posedge clk or posedge rst) begin
    if (rst) rgb565_out <= 16'd0;
    else     rgb565_out <= rgb565_packed;
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

endmodule