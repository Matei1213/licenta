`timescale 1ns/1ps

module contrast_stretch (
    input              clk,
    input              rst,
    input  [15:0]      in_data,
    input              hs_in,
    input              vs_in,
    input              de_in,

 
    output reg [15:0]  out_data,
    output reg         hs_out,
    output reg         vs_out,
    output reg         de_out
);

//limiteaza luminanta
localparam [7:0] MIN_RANGE = 8'd64;

// ALPHA: chroma retention (value / 256).
//   256 = 1.00 (colour fully preserved)
//   179 = 0.70 (default - tames the over-saturation)
//   128 = 0.50 (noticeably muted)
//     0 = grayscale
localparam [8:0] ALPHA = 9'd179;

//bit replication ca in dc
wire [7:0] r_in = {in_data[15:11], in_data[15:13]};
wire [7:0] g_in = {in_data[10:5],  in_data[10:9] };
wire [7:0] b_in = {in_data[4:0],   in_data[4:2]  };


wire [9:0] y_sum = {2'b00, r_in} + {1'b0, g_in, 1'b0} + {2'b00, b_in};
wire [7:0] y_in  = y_sum[9:2];

//detector front
reg vs_d;
always @(posedge clk) begin
    vs_d <= vs_in;
end
wire vs_fall = vs_d & ~vs_in;   // detecteaza schimbarea cadrului


//pt luminanta min
reg [7:0] track_min;
always @(posedge clk or posedge rst) begin
    if (rst)
        track_min <= 8'd255;                    
    else if (vs_fall)
        track_min <= 8'd255;                    
    else if (de_in && (y_in < track_min))
        track_min <= y_in;
end

//pt luminanta max
reg [7:0] track_max;
always @(posedge clk or posedge rst) begin
    if (rst)
        track_max <= 8'd0;                      
    else if (vs_fall)
        track_max <= 8'd0;                      
    else if (de_in && (y_in > track_max))
        track_max <= y_in;
end


reg [7:0] stretch_min;
always @(posedge clk or posedge rst) begin
    if (rst)
        stretch_min <= 8'd0;
    else if (vs_fall)
        stretch_min <= (track_min < track_max) ? track_min : 8'd0;
end

reg [7:0] stretch_range;
always @(posedge clk or posedge rst) begin
    if (rst)
        stretch_range <= 8'd255;
    else if (vs_fall)
        stretch_range <= (track_max > track_min) ?
                         (((track_max - track_min) < MIN_RANGE) ? MIN_RANGE
                                                                : (track_max - track_min))
                         : 8'd255;   //(max <= min) nu se extinde
end

reg [12:0] recip_lut [0:255];

genvar i;
generate
    for (i = 0; i < 256; i = i + 1) begin : RECIP_INIT
        initial recip_lut[i] = (i == 0) ? 13'd256 : (65280 / i);
    end
endgenerate

reg [12:0] recip_range;
always @(posedge clk or posedge rst) begin
    if (rst) recip_range <= 13'd256;            
    else     recip_range <= recip_lut[stretch_range];
end

//se salveaza luminanta pixelului de la intrare
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

reg [7:0] y_s1;
always @(posedge clk or posedge rst) begin
    if (rst) y_s1 <= 8'd0;
    else     y_s1 <= y_in;
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

//se aplica formula y`
wire [7:0]  y_diff   = (y_s1 > stretch_min) ? (y_s1 - stretch_min) : 8'd0;
wire [20:0] y_mul    = y_diff * recip_range;
wire [12:0] y_shift  = y_mul[20:8];
wire [7:0]  y_str    = (y_shift > 13'd255) ? 8'd255 : y_shift[7:0];

reg [7:0] yp_s2;
always @(posedge clk or posedge rst) begin
    if (rst) yp_s2 <= 8'd0;
    else     yp_s2 <= y_str;
end

reg signed [8:0] chroma_r_s2;
always @(posedge clk or posedge rst) begin
    if (rst) chroma_r_s2 <= 9'sd0;
    else     chroma_r_s2 <= $signed({1'b0, r_s1}) - $signed({1'b0, y_s1});
end

reg signed [8:0] chroma_g_s2;
always @(posedge clk or posedge rst) begin
    if (rst) chroma_g_s2 <= 9'sd0;
    else     chroma_g_s2 <= $signed({1'b0, g_s1}) - $signed({1'b0, y_s1});
end

reg signed [8:0] chroma_b_s2;
always @(posedge clk or posedge rst) begin
    if (rst) chroma_b_s2 <= 9'sd0;
    else     chroma_b_s2 <= $signed({1'b0, b_s1}) - $signed({1'b0, y_s1});
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

//calcul out_ch
wire signed [17:0] sc_r = $signed({1'b0, ALPHA}) * chroma_r_s2;   // 10b * 9b signed
wire signed [17:0] sc_g = $signed({1'b0, ALPHA}) * chroma_g_s2;
wire signed [17:0] sc_b = $signed({1'b0, ALPHA}) * chroma_b_s2;

wire signed [10:0] add_r = sc_r >>> 8;
wire signed [10:0] add_g = sc_g >>> 8;
wire signed [10:0] add_b = sc_b >>> 8;

wire signed [11:0] sum_r = $signed({4'b0000, yp_s2}) + {add_r[10], add_r};
wire signed [11:0] sum_g = $signed({4'b0000, yp_s2}) + {add_g[10], add_g};
wire signed [11:0] sum_b = $signed({4'b0000, yp_s2}) + {add_b[10], add_b};

wire [7:0] clamp_r = (sum_r < 0) ? 8'd0 : (sum_r > 12'sd255) ? 8'd255 : sum_r[7:0];
wire [7:0] clamp_g = (sum_g < 0) ? 8'd0 : (sum_g > 12'sd255) ? 8'd255 : sum_g[7:0];
wire [7:0] clamp_b = (sum_b < 0) ? 8'd0 : (sum_b > 12'sd255) ? 8'd255 : sum_b[7:0];

///rgb888->RGB565
wire [15:0] rgb565_packed = {clamp_r[7:3], clamp_g[7:2], clamp_b[7:3]};

always @(posedge clk or posedge rst) begin
    if (rst) out_data <= 16'd0;
    else     out_data <= rgb565_packed;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_out <= 1'b0;
    else     hs_out <= hs_s2;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_out <= 1'b0;
    else     vs_out <= vs_s2;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_out <= 1'b0;
    else     de_out <= de_s2;
end

endmodule