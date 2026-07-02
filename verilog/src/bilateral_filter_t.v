
//   BF[t](x) = (1/W) * sum over neighbours n in window:
//                 G_s(||x - n||) * G_r(|t(x) - t(n)|) * t(n)
//
//   G_s = spatial Gaussian 
//   G_r = range  Gaussian   (intensitate)
//   W   = suma de G_s * G_r pe toata fereastra (normalising factor)
`timescale 1ns/1ps

module bilateral_filter_t #(
    parameter IMG_WIDTH = 1024
)(
    input              clk,
    input              rst,

   
    input  [7:0]       t_in,
    input  [7:0]       r_in,
    input  [7:0]       g_in,
    input  [7:0]       b_in,
    input  [7:0]       ar_in,
    input  [7:0]       ag_in,
    input  [7:0]       ab_in,
    input              hs_in,
    input              vs_in,
    input              de_in,


    output [7:0]       t_out,
    output [7:0]       r_out,
    output [7:0]       g_out,
    output [7:0]       b_out,
    output [7:0]       ar_out,
    output [7:0]       ag_out,
    output [7:0]       ab_out,
    output             hs_out,
    output             vs_out,
    output             de_out
);

localparam K0 = 4'd1;
localparam K1 = 4'd4;
localparam K2 = 4'd6;
localparam K3 = 4'd4;
localparam K4 = 4'd1;
//coeficienti bilateral

reg [7:0] range_lut [0:31];

initial begin
    range_lut[0]  = 8'd255;  range_lut[1]  = 8'd247;
    range_lut[2]  = 8'd226;  range_lut[3]  = 8'd194;
    range_lut[4]  = 8'd156;  range_lut[5]  = 8'd116;
    range_lut[6]  = 8'd80;   range_lut[7]  = 8'd51;
    range_lut[8]  = 8'd30;   range_lut[9]  = 8'd16;
    range_lut[10] = 8'd8;    range_lut[11] = 8'd4;
    range_lut[12] = 8'd1;    range_lut[13] = 8'd0;
    range_lut[14] = 8'd0;    range_lut[15] = 8'd0;
    range_lut[16] = 8'd0;    range_lut[17] = 8'd0;
    range_lut[18] = 8'd0;    range_lut[19] = 8'd0;
    range_lut[20] = 8'd0;    range_lut[21] = 8'd0;
    range_lut[22] = 8'd0;    range_lut[23] = 8'd0;
    range_lut[24] = 8'd0;    range_lut[25] = 8'd0;
    range_lut[26] = 8'd0;    range_lut[27] = 8'd0;
    range_lut[28] = 8'd0;    range_lut[29] = 8'd0;
    range_lut[30] = 8'd0;    range_lut[31] = 8'd0;
end



reg [7:0] t_s1;
always @(posedge clk or posedge rst) begin
    if (rst) t_s1 <= 8'd0;
    else     t_s1 <= t_in;
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



reg vs_d;
always @(posedge clk) vs_d <= vs_s1;
wire vs_fall = vs_d & ~vs_s1;
//detector front

reg [10:0] wcol;
always @(posedge clk or posedge rst) begin
    if (rst)
        wcol <= 11'd0;
    else if (vs_fall)
        wcol <= 11'd0;                                  // frame nou
    else if (de_s1)
        wcol <= (wcol == IMG_WIDTH-1) ? 11'd0 : wcol + 11'd1;
end
//counter coloane(poz pe orizontala)


(* ram_style = "block" *) reg [7:0] lmem0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem2 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem3 [0:IMG_WIDTH-1];

//line buffere vezi dc
reg [7:0] lmem0_rd, lmem1_rd, lmem2_rd, lmem3_rd;
reg [7:0] t_s1_d;   

always @(posedge clk) begin
    if (de_s1) begin
        t_s1_d   <= t_s1;
        lmem0_rd <= lmem0[wcol];
        lmem1_rd <= lmem1[wcol];
        lmem2_rd <= lmem2[wcol];
        lmem3_rd <= lmem3[wcol];
        lmem0[wcol] <= t_s1;
        lmem1[wcol] <= lmem0[wcol];
        lmem2[wcol] <= lmem1[wcol];
        lmem3[wcol] <= lmem2[wcol];
    end
end

reg [7:0] row0, row1, row2, row3, row4;
always @(posedge clk) begin if (de_s1) row4 <= t_s1_d;   end  
always @(posedge clk) begin if (de_s1) row3 <= lmem0_rd; end
always @(posedge clk) begin if (de_s1) row2 <= lmem1_rd; end
always @(posedge clk) begin if (de_s1) row1 <= lmem2_rd; end
always @(posedge clk) begin if (de_s1) row0 <= lmem3_rd; end

.
reg hs_s2;
always @(posedge clk or posedge rst) begin if (rst) hs_s2 <= 1'b0; else hs_s2 <= hs_s1; end
reg vs_s2;
always @(posedge clk or posedge rst) begin if (rst) vs_s2 <= 1'b0; else vs_s2 <= vs_s1; end
reg de_s2;
always @(posedge clk or posedge rst) begin if (rst) de_s2 <= 1'b0; else de_s2 <= de_s1; end
//delay sincronizare



reg [7:0] h0_0, h0_1, h0_2, h0_3, h0_4;
reg [7:0] h1_0, h1_1, h1_2, h1_3, h1_4;
reg [7:0] h2_0, h2_1, h2_2, h2_3, h2_4;
reg [7:0] h3_0, h3_1, h3_2, h3_3, h3_4;
reg [7:0] h4_0, h4_1, h4_2, h4_3, h4_4;

//shiftare pozitii
always @(posedge clk or posedge rst) begin if (rst) h0_0 <= 0; else h0_0 <= row0; end
always @(posedge clk or posedge rst) begin if (rst) h0_1 <= 0; else h0_1 <= h0_0; end
always @(posedge clk or posedge rst) begin if (rst) h0_2 <= 0; else h0_2 <= h0_1; end
always @(posedge clk or posedge rst) begin if (rst) h0_3 <= 0; else h0_3 <= h0_2; end
always @(posedge clk or posedge rst) begin if (rst) h0_4 <= 0; else h0_4 <= h0_3; end

always @(posedge clk or posedge rst) begin if (rst) h1_0 <= 0; else h1_0 <= row1; end
always @(posedge clk or posedge rst) begin if (rst) h1_1 <= 0; else h1_1 <= h1_0; end
always @(posedge clk or posedge rst) begin if (rst) h1_2 <= 0; else h1_2 <= h1_1; end
always @(posedge clk or posedge rst) begin if (rst) h1_3 <= 0; else h1_3 <= h1_2; end
always @(posedge clk or posedge rst) begin if (rst) h1_4 <= 0; else h1_4 <= h1_3; end

always @(posedge clk or posedge rst) begin if (rst) h2_0 <= 0; else h2_0 <= row2; end
always @(posedge clk or posedge rst) begin if (rst) h2_1 <= 0; else h2_1 <= h2_0; end
always @(posedge clk or posedge rst) begin if (rst) h2_2 <= 0; else h2_2 <= h2_1; end
always @(posedge clk or posedge rst) begin if (rst) h2_3 <= 0; else h2_3 <= h2_2; end
always @(posedge clk or posedge rst) begin if (rst) h2_4 <= 0; else h2_4 <= h2_3; end

always @(posedge clk or posedge rst) begin if (rst) h3_0 <= 0; else h3_0 <= row3; end
always @(posedge clk or posedge rst) begin if (rst) h3_1 <= 0; else h3_1 <= h3_0; end
always @(posedge clk or posedge rst) begin if (rst) h3_2 <= 0; else h3_2 <= h3_1; end
always @(posedge clk or posedge rst) begin if (rst) h3_3 <= 0; else h3_3 <= h3_2; end
always @(posedge clk or posedge rst) begin if (rst) h3_4 <= 0; else h3_4 <= h3_3; end

always @(posedge clk or posedge rst) begin if (rst) h4_0 <= 0; else h4_0 <= row4; end
always @(posedge clk or posedge rst) begin if (rst) h4_1 <= 0; else h4_1 <= h4_0; end
always @(posedge clk or posedge rst) begin if (rst) h4_2 <= 0; else h4_2 <= h4_1; end
always @(posedge clk or posedge rst) begin if (rst) h4_3 <= 0; else h4_3 <= h4_2; end
always @(posedge clk or posedge rst) begin if (rst) h4_4 <= 0; else h4_4 <= h4_3; end

reg hs_s3;
always @(posedge clk or posedge rst) begin if (rst) hs_s3 <= 0; else hs_s3 <= hs_s2; end
reg vs_s3;
always @(posedge clk or posedge rst) begin if (rst) vs_s3 <= 0; else vs_s3 <= vs_s2; end
reg de_s3;
always @(posedge clk or posedge rst) begin if (rst) de_s3 <= 0; else de_s3 <= de_s2; end

function [7:0] absdiff;
    input [7:0] a;
    input [7:0] b;
    begin
        absdiff = (a > b) ? (a - b) : (b - a);
    end
endfunction
//ponderi filtru bilateral 

wire [7:0] d00 = absdiff(h0_0, h2_2); //fiecare poz comparata cu centru( pt intensitate filtru gaussian)
wire [7:0] d01 = absdiff(h0_1, h2_2);
wire [7:0] d02 = absdiff(h0_2, h2_2);
wire [7:0] d03 = absdiff(h0_3, h2_2);
wire [7:0] d04 = absdiff(h0_4, h2_2);

wire [7:0] d10 = absdiff(h1_0, h2_2);
wire [7:0] d11 = absdiff(h1_1, h2_2);
wire [7:0] d12 = absdiff(h1_2, h2_2);
wire [7:0] d13 = absdiff(h1_3, h2_2);
wire [7:0] d14 = absdiff(h1_4, h2_2);

wire [7:0] d20 = absdiff(h2_0, h2_2);
wire [7:0] d21 = absdiff(h2_1, h2_2);
wire [7:0] d23 = absdiff(h2_3, h2_2);
wire [7:0] d24 = absdiff(h2_4, h2_2);

wire [7:0] d30 = absdiff(h3_0, h2_2);
wire [7:0] d31 = absdiff(h3_1, h2_2);
wire [7:0] d32 = absdiff(h3_2, h2_2);
wire [7:0] d33 = absdiff(h3_3, h2_2);
wire [7:0] d34 = absdiff(h3_4, h2_2);

wire [7:0] d40 = absdiff(h4_0, h2_2);
wire [7:0] d41 = absdiff(h4_1, h2_2);
wire [7:0] d42 = absdiff(h4_2, h2_2);
wire [7:0] d43 = absdiff(h4_3, h2_2);
wire [7:0] d44 = absdiff(h4_4, h2_2);

reg [13:0] w00, w01, w02, w03, w04;
reg [13:0] w10, w11, w12, w13, w14;
reg [13:0] w20, w21, w22, w23, w24;
reg [13:0] w30, w31, w32, w33, w34;
reg [13:0] w40, w41, w42, w43, w44;


always @(posedge clk or posedge rst) begin if (rst) w00 <= 0; else w00 <= K0*K0 * range_lut[d00[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w01 <= 0; else w01 <= K0*K1 * range_lut[d01[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w02 <= 0; else w02 <= K0*K2 * range_lut[d02[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w03 <= 0; else w03 <= K0*K3 * range_lut[d03[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w04 <= 0; else w04 <= K0*K4 * range_lut[d04[7:3]]; end

always @(posedge clk or posedge rst) begin if (rst) w10 <= 0; else w10 <= K1*K0 * range_lut[d10[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w11 <= 0; else w11 <= K1*K1 * range_lut[d11[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w12 <= 0; else w12 <= K1*K2 * range_lut[d12[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w13 <= 0; else w13 <= K1*K3 * range_lut[d13[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w14 <= 0; else w14 <= K1*K4 * range_lut[d14[7:3]]; end

always @(posedge clk or posedge rst) begin if (rst) w20 <= 0; else w20 <= K2*K0 * range_lut[d20[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w21 <= 0; else w21 <= K2*K1 * range_lut[d21[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w22 <= 0; else w22 <= K2*K2 * range_lut[0];        end // centru: delta=0
always @(posedge clk or posedge rst) begin if (rst) w23 <= 0; else w23 <= K2*K3 * range_lut[d23[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w24 <= 0; else w24 <= K2*K4 * range_lut[d24[7:3]]; end

always @(posedge clk or posedge rst) begin if (rst) w30 <= 0; else w30 <= K3*K0 * range_lut[d30[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w31 <= 0; else w31 <= K3*K1 * range_lut[d31[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w32 <= 0; else w32 <= K3*K2 * range_lut[d32[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w33 <= 0; else w33 <= K3*K3 * range_lut[d33[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w34 <= 0; else w34 <= K3*K4 * range_lut[d34[7:3]]; end

always @(posedge clk or posedge rst) begin if (rst) w40 <= 0; else w40 <= K4*K0 * range_lut[d40[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w41 <= 0; else w41 <= K4*K1 * range_lut[d41[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w42 <= 0; else w42 <= K4*K2 * range_lut[d42[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w43 <= 0; else w43 <= K4*K3 * range_lut[d43[7:3]]; end
always @(posedge clk or posedge rst) begin if (rst) w44 <= 0; else w44 <= K4*K4 * range_lut[d44[7:3]]; end


reg [7:0] p00,p01,p02,p03,p04;
reg [7:0] p10,p11,p12,p13,p14;
reg [7:0] p20,p21,p22,p23,p24;
reg [7:0] p30,p31,p32,p33,p34;
reg [7:0] p40,p41,p42,p43,p44;

always @(posedge clk or posedge rst) begin if (rst) p00<=0; else p00<=h0_0; end
always @(posedge clk or posedge rst) begin if (rst) p01<=0; else p01<=h0_1; end
always @(posedge clk or posedge rst) begin if (rst) p02<=0; else p02<=h0_2; end
always @(posedge clk or posedge rst) begin if (rst) p03<=0; else p03<=h0_3; end
always @(posedge clk or posedge rst) begin if (rst) p04<=0; else p04<=h0_4; end

always @(posedge clk or posedge rst) begin if (rst) p10<=0; else p10<=h1_0; end
always @(posedge clk or posedge rst) begin if (rst) p11<=0; else p11<=h1_1; end
always @(posedge clk or posedge rst) begin if (rst) p12<=0; else p12<=h1_2; end
always @(posedge clk or posedge rst) begin if (rst) p13<=0; else p13<=h1_3; end
always @(posedge clk or posedge rst) begin if (rst) p14<=0; else p14<=h1_4; end

always @(posedge clk or posedge rst) begin if (rst) p20<=0; else p20<=h2_0; end
always @(posedge clk or posedge rst) begin if (rst) p21<=0; else p21<=h2_1; end
always @(posedge clk or posedge rst) begin if (rst) p22<=0; else p22<=h2_2; end
always @(posedge clk or posedge rst) begin if (rst) p23<=0; else p23<=h2_3; end
always @(posedge clk or posedge rst) begin if (rst) p24<=0; else p24<=h2_4; end

always @(posedge clk or posedge rst) begin if (rst) p30<=0; else p30<=h3_0; end
always @(posedge clk or posedge rst) begin if (rst) p31<=0; else p31<=h3_1; end
always @(posedge clk or posedge rst) begin if (rst) p32<=0; else p32<=h3_2; end
always @(posedge clk or posedge rst) begin if (rst) p33<=0; else p33<=h3_3; end
always @(posedge clk or posedge rst) begin if (rst) p34<=0; else p34<=h3_4; end

always @(posedge clk or posedge rst) begin if (rst) p40<=0; else p40<=h4_0; end
always @(posedge clk or posedge rst) begin if (rst) p41<=0; else p41<=h4_1; end
always @(posedge clk or posedge rst) begin if (rst) p42<=0; else p42<=h4_2; end
always @(posedge clk or posedge rst) begin if (rst) p43<=0; else p43<=h4_3; end
always @(posedge clk or posedge rst) begin if (rst) p44<=0; else p44<=h4_4; end

reg hs_s4;
always @(posedge clk or posedge rst) begin if (rst) hs_s4 <= 0; else hs_s4 <= hs_s3; end
reg vs_s4;
always @(posedge clk or posedge rst) begin if (rst) vs_s4 <= 0; else vs_s4 <= vs_s3; end
reg de_s4;
always @(posedge clk or posedge rst) begin if (rst) de_s4 <= 0; else de_s4 <= de_s3; end

//W   = suma de G_s * G_r
reg [27:0] num_sum;
always @(posedge clk or posedge rst) begin
    if (rst) num_sum <= 0;
    else
        num_sum <=
            w00*p00 + w01*p01 + w02*p02 + w03*p03 + w04*p04 +
            w10*p10 + w11*p11 + w12*p12 + w13*p13 + w14*p14 +
            w20*p20 + w21*p21 + w22*p22 + w23*p23 + w24*p24 +
            w30*p30 + w31*p31 + w32*p32 + w33*p33 + w34*p34 +
            w40*p40 + w41*p41 + w42*p42 + w43*p43 + w44*p44;
end


reg [18:0] den_sum;
always @(posedge clk or posedge rst) begin
    if (rst) den_sum <= 0;
    else
        den_sum <=
            w00 + w01 + w02 + w03 + w04 +
            w10 + w11 + w12 + w13 + w14 +
            w20 + w21 + w22 + w23 + w24 +
            w30 + w31 + w32 + w33 + w34 +
            w40 + w41 + w42 + w43 + w44;
end

reg hs_s5;
always @(posedge clk or posedge rst) begin if (rst) hs_s5 <= 0; else hs_s5 <= hs_s4; end
reg vs_s5;
always @(posedge clk or posedge rst) begin if (rst) vs_s5 <= 0; else vs_s5 <= vs_s4; end
reg de_s5;
always @(posedge clk or posedge rst) begin if (rst) de_s5 <= 0; else de_s5 <= de_s4; end

// de revazut
reg [15:0] inv_lut [0:255];
genvar k;
generate
    for (k = 0; k < 256; k = k + 1) begin : INV_LUT_INIT
        initial inv_lut[k] = (k == 0) ? 16'd0 : (16'd65535 / k);
    end
endgenerate

//in caz ca se depaseste valoare de 16b
wire [7:0] den_idx = (den_sum > 19'd65535) ? 8'd255 : den_sum[18:11];

reg [15:0] inv_den;
always @(posedge clk or posedge rst) begin
    if (rst) inv_den <= 16'd0;
    else     inv_den <= inv_lut[den_idx];
end


reg [27:0] num_s6;
always @(posedge clk or posedge rst) begin
    if (rst) num_s6 <= 0;
    else     num_s6 <= num_sum;
end

reg hs_s6;
always @(posedge clk or posedge rst) begin if (rst) hs_s6 <= 0; else hs_s6 <= hs_s5; end
reg vs_s6;
always @(posedge clk or posedge rst) begin if (rst) vs_s6 <= 0; else vs_s6 <= vs_s5; end
reg de_s6;
always @(posedge clk or posedge rst) begin if (rst) de_s6 <= 0; else de_s6 <= de_s5; end

wire [43:0] mul_result = num_s6 * inv_den;

//normalizare de la 44b la 8b
wire [7:0]  bf_t = (mul_result[43:35] != 0) ? 8'd255 : mul_result[34:27];


reg [7:0] bf_t_r;
always @(posedge clk or posedge rst) begin
    if (rst) bf_t_r <= 8'd255;
    else     bf_t_r <= bf_t;
end

reg [7:0] t_s7;
always @(posedge clk or posedge rst) begin
    if (rst) t_s7 <= 8'd255;
    else     t_s7 <= bf_t_r;
end

reg hs_s7;
always @(posedge clk or posedge rst) begin if (rst) hs_s7 <= 0; else hs_s7 <= hs_s6; end
reg vs_s7;
always @(posedge clk or posedge rst) begin if (rst) vs_s7 <= 0; else vs_s7 <= vs_s6; end
reg de_s7;
always @(posedge clk or posedge rst) begin if (rst) de_s7 <= 0; else de_s7 <= de_s6; end


reg [7:0] r_d0,r_d1,r_d2,r_d3,r_d4,r_d5,r_d6;
always @(posedge clk or posedge rst) begin if (rst) r_d0 <= 0; else r_d0 <= r_in;  end
always @(posedge clk or posedge rst) begin if (rst) r_d1 <= 0; else r_d1 <= r_d0;  end
always @(posedge clk or posedge rst) begin if (rst) r_d2 <= 0; else r_d2 <= r_d1;  end
always @(posedge clk or posedge rst) begin if (rst) r_d3 <= 0; else r_d3 <= r_d2;  end
always @(posedge clk or posedge rst) begin if (rst) r_d4 <= 0; else r_d4 <= r_d3;  end
always @(posedge clk or posedge rst) begin if (rst) r_d5 <= 0; else r_d5 <= r_d4;  end
always @(posedge clk or posedge rst) begin if (rst) r_d6 <= 0; else r_d6 <= r_d5;  end

reg [7:0] g_d0,g_d1,g_d2,g_d3,g_d4,g_d5,g_d6;
always @(posedge clk or posedge rst) begin if (rst) g_d0 <= 0; else g_d0 <= g_in;  end
always @(posedge clk or posedge rst) begin if (rst) g_d1 <= 0; else g_d1 <= g_d0;  end
always @(posedge clk or posedge rst) begin if (rst) g_d2 <= 0; else g_d2 <= g_d1;  end
always @(posedge clk or posedge rst) begin if (rst) g_d3 <= 0; else g_d3 <= g_d2;  end
always @(posedge clk or posedge rst) begin if (rst) g_d4 <= 0; else g_d4 <= g_d3;  end
always @(posedge clk or posedge rst) begin if (rst) g_d5 <= 0; else g_d5 <= g_d4;  end
always @(posedge clk or posedge rst) begin if (rst) g_d6 <= 0; else g_d6 <= g_d5;  end

reg [7:0] b_d0,b_d1,b_d2,b_d3,b_d4,b_d5,b_d6;
always @(posedge clk or posedge rst) begin if (rst) b_d0 <= 0; else b_d0 <= b_in;  end
always @(posedge clk or posedge rst) begin if (rst) b_d1 <= 0; else b_d1 <= b_d0;  end
always @(posedge clk or posedge rst) begin if (rst) b_d2 <= 0; else b_d2 <= b_d1;  end
always @(posedge clk or posedge rst) begin if (rst) b_d3 <= 0; else b_d3 <= b_d2;  end
always @(posedge clk or posedge rst) begin if (rst) b_d4 <= 0; else b_d4 <= b_d3;  end
always @(posedge clk or posedge rst) begin if (rst) b_d5 <= 0; else b_d5 <= b_d4;  end
always @(posedge clk or posedge rst) begin if (rst) b_d6 <= 0; else b_d6 <= b_d5;  end

reg [7:0] ar_d0,ar_d1,ar_d2,ar_d3,ar_d4,ar_d5,ar_d6;
always @(posedge clk or posedge rst) begin if (rst) ar_d0 <= 8'd255; else ar_d0 <= ar_in; end
always @(posedge clk or posedge rst) begin if (rst) ar_d1 <= 8'd255; else ar_d1 <= ar_d0; end
always @(posedge clk or posedge rst) begin if (rst) ar_d2 <= 8'd255; else ar_d2 <= ar_d1; end
always @(posedge clk or posedge rst) begin if (rst) ar_d3 <= 8'd255; else ar_d3 <= ar_d2; end
always @(posedge clk or posedge rst) begin if (rst) ar_d4 <= 8'd255; else ar_d4 <= ar_d3; end
always @(posedge clk or posedge rst) begin if (rst) ar_d5 <= 8'd255; else ar_d5 <= ar_d4; end
always @(posedge clk or posedge rst) begin if (rst) ar_d6 <= 8'd255; else ar_d6 <= ar_d5; end

reg [7:0] ag_d0,ag_d1,ag_d2,ag_d3,ag_d4,ag_d5,ag_d6;
always @(posedge clk or posedge rst) begin if (rst) ag_d0 <= 8'd255; else ag_d0 <= ag_in; end
always @(posedge clk or posedge rst) begin if (rst) ag_d1 <= 8'd255; else ag_d1 <= ag_d0; end
always @(posedge clk or posedge rst) begin if (rst) ag_d2 <= 8'd255; else ag_d2 <= ag_d1; end
always @(posedge clk or posedge rst) begin if (rst) ag_d3 <= 8'd255; else ag_d3 <= ag_d2; end
always @(posedge clk or posedge rst) begin if (rst) ag_d4 <= 8'd255; else ag_d4 <= ag_d3; end
always @(posedge clk or posedge rst) begin if (rst) ag_d5 <= 8'd255; else ag_d5 <= ag_d4; end
always @(posedge clk or posedge rst) begin if (rst) ag_d6 <= 8'd255; else ag_d6 <= ag_d5; end

reg [7:0] ab_d0,ab_d1,ab_d2,ab_d3,ab_d4,ab_d5,ab_d6;
always @(posedge clk or posedge rst) begin if (rst) ab_d0 <= 8'd255; else ab_d0 <= ab_in; end
always @(posedge clk or posedge rst) begin if (rst) ab_d1 <= 8'd255; else ab_d1 <= ab_d0; end
always @(posedge clk or posedge rst) begin if (rst) ab_d2 <= 8'd255; else ab_d2 <= ab_d1; end
always @(posedge clk or posedge rst) begin if (rst) ab_d3 <= 8'd255; else ab_d3 <= ab_d2; end
always @(posedge clk or posedge rst) begin if (rst) ab_d4 <= 8'd255; else ab_d4 <= ab_d3; end
always @(posedge clk or posedge rst) begin if (rst) ab_d5 <= 8'd255; else ab_d5 <= ab_d4; end
always @(posedge clk or posedge rst) begin if (rst) ab_d6 <= 8'd255; else ab_d6 <= ab_d5; end

assign t_out  = t_s7;
assign r_out  = r_d6;
assign g_out  = g_d6;
assign b_out  = b_d6;
assign ar_out = ar_d6;
assign ag_out = ag_d6;
assign ab_out = ab_d6;
assign hs_out = hs_s7;
assign vs_out = vs_s7;
assign de_out = de_s7;

endmodule
