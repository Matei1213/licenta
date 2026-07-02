// 1D kernel: [1, 4, 6, 4, 1] 

`timescale 1ns/1ps

module gaussian_filter_t #(
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
//coeficienti gaussian 


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
//sincronizare


reg vs_d;
always @(posedge clk) vs_d <= vs_s1;
wire vs_fall = vs_d & ~vs_s1;


reg [10:0] wcol;
always @(posedge clk or posedge rst) begin
    if (rst)
        wcol <= 11'd0;
    else if (vs_fall)
        wcol <= 11'd0;                                  // frame nou
    else if (de_s1)
        wcol <= (wcol == IMG_WIDTH-1) ? 11'd0 : wcol + 11'd1;
end
//facem iarasi fereastra 5x5, vezi detalii dark channel
(* ram_style = "block" *) reg [7:0] lmem0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem2 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] lmem3 [0:IMG_WIDTH-1];

reg [7:0] lmem0_rd, lmem1_rd, lmem2_rd, lmem3_rd;
reg [7:0] t_s1_d;   // de-gated copy of t_s1, so row4 is sampled at the SAME
                    // column as the line-buffer reads (rows 3..0)

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

// -----------------------------------------------------------------------------
// RGB alignment line buffers
// -----------------------------------------------------------------------------
// The smoothed t emitted for the CENTRE of the 5x5 window corresponds to a
// pixel 2 image rows (and a few columns) before the most recent input. The
// (R, G, B) passed to restoration must refer to that same centre pixel, so
// they are delayed through their own 2-line buffer here, then through a
// register chain sized to match the t centre path exactly (11 stages total,
// see the latency budget comment at the r_d chain below).
//
// The airlight channels (ar/ag/ab) are NOT line-buffered: airlight is
// constant across a frame except for brief mid-frame updates of the running
// max, so a 2-row vertical offset on it has no visible effect. They get the
// same 11-register chain for column alignment only.
(* ram_style = "block" *) reg [7:0] rline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] rline1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] gline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] gline1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] bline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] bline1 [0:IMG_WIDTH-1];

reg [7:0] r_l2, g_l2, b_l2;   // RGB from 2 image rows back (window centre row)
always @(posedge clk) begin
    if (de_s1) begin
    r_l2 <= rline1[wcol];
    g_l2 <= gline1[wcol];
    b_l2 <= bline1[wcol];
    rline0[wcol] <= r_d0;
    rline1[wcol] <= rline0[wcol];
    gline0[wcol] <= g_d0;
    gline1[wcol] <= gline0[wcol];
    bline0[wcol] <= b_d0;
    bline1[wcol] <= bline0[wcol];
    end
end


reg [7:0] row0, row1, row2, row3, row4;

always @(posedge clk) begin
    if (de_s1) row4 <= t_s1_d;	// de-gated copy: same column as rows 3..0
end

always @(posedge clk) begin
    if (de_s1) row3 <= lmem0_rd;
end

always @(posedge clk) begin
    if (de_s1) row2 <= lmem1_rd;
end

always @(posedge clk) begin
    if (de_s1) row1 <= lmem2_rd;
end

always @(posedge clk) begin
    if (de_s1) row0 <= lmem3_rd;  //cel mai vechi
end


reg hs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s2 <= 1'b0; 
    else hs_s2 <= hs_s1; 
end
reg vs_s2;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s2 <= 1'b0; 
    else vs_s2 <= vs_s1; 
end
reg de_s2;
always @(posedge clk or posedge rst) begin
    if (rst) de_s2 <= 1'b0; 
    else de_s2 <= de_s1; 
end
//sincronizare



reg [7:0] h0_0, h0_1, h0_2, h0_3, h0_4;
reg [7:0] h1_0, h1_1, h1_2, h1_3, h1_4;
reg [7:0] h2_0, h2_1, h2_2, h2_3, h2_4;
reg [7:0] h3_0, h3_1, h3_2, h3_3, h3_4;
reg [7:0] h4_0, h4_1, h4_2, h4_3, h4_4;

always @(posedge clk or posedge rst) begin
    if (rst) h0_0 <= 0; 
    else h0_0 <= row0;
end

always @(posedge clk or posedge rst) begin
    if (rst) h0_1 <= 0; 
    else h0_1 <= h0_0; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h0_2 <= 0; 
    else h0_2 <= h0_1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h0_3 <= 0; 
    else h0_3 <= h0_2; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h0_4 <= 0; 
    else h0_4 <= h0_3; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h1_0 <= 0; 
    else h1_0 <= row1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h1_1 <= 0; 
    else h1_1 <= h1_0; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h1_2 <= 0; 
    else h1_2 <= h1_1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h1_3 <= 0; 
    else h1_3 <= h1_2; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h1_4 <= 0; 
    else h1_4 <= h1_3; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h2_0 <= 0; 
    else h2_0 <= row2; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h2_1 <= 0; 
    else h2_1 <= h2_0; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h2_2 <= 0; 
    else h2_2 <= h2_1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h2_3 <= 0; 
    else h2_3 <= h2_2; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h2_4 <= 0; 
    else h2_4 <= h2_3; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h3_0 <= 0; 
    else h3_0 <= row3; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h3_1 <= 0; 
    else h3_1 <= h3_0; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h3_2 <= 0; 
    else h3_2 <= h3_1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h3_3 <= 0; 
    else h3_3 <= h3_2; 
end
	
always @(posedge clk or posedge rst) begin
    if (rst) h3_4 <= 0; 
    else h3_4 <= h3_3; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h4_0 <= 0; 
    else h4_0 <= row4; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h4_1 <= 0; 
    else h4_1 <= h4_0; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h4_2 <= 0; 
    else h4_2 <= h4_1; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h4_3 <= 0; 
    else h4_3 <= h4_2; 
end

always @(posedge clk or posedge rst) begin
    if (rst) h4_4 <= 0; 
    else h4_4 <= h4_3; 
end

reg hs_s3;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s3 <= 0; 
    else hs_s3 <= hs_s2; 
end

reg vs_s3;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s3 <= 0; 
    else vs_s3 <= vs_s2; 
end

reg de_s3;
always @(posedge clk or posedge rst) begin
    if (rst) de_s3 <= 0; 
    else de_s3 <= de_s2; 
end


reg [13:0] hs0, hs1, hs2, hs3, hs4;

always @(posedge clk or posedge rst) begin
    if (rst) hs0 <= 0;
    else     hs0 <= K0*h0_4 + K1*h0_3 + K2*h0_2 + K3*h0_1 + K4*h0_0;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs1 <= 0;
    else     hs1 <= K0*h1_4 + K1*h1_3 + K2*h1_2 + K3*h1_1 + K4*h1_0;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs2 <= 0;
    else     hs2 <= K0*h2_4 + K1*h2_3 + K2*h2_2 + K3*h2_1 + K4*h2_0;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs3 <= 0;
    else     hs3 <= K0*h3_4 + K1*h3_3 + K2*h3_2 + K3*h3_1 + K4*h3_0;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs4 <= 0;
    else     hs4 <= K0*h4_4 + K1*h4_3 + K2*h4_2 + K3*h4_1 + K4*h4_0;
end
//filtru gaussian separabil -> putem face mai intai convolutie orizontal, apoi vertical

reg hs_s4;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s4 <= 0;
    else hs_s4 <= hs_s3;
end
reg vs_s4;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s4 <= 0;
    else vs_s4 <= vs_s3;
end
reg de_s4;
always @(posedge clk or posedge rst) begin
    if (rst) de_s4 <= 0;
    else de_s4 <= de_s3;
end
//delay

reg [17:0] vsum;
always @(posedge clk or posedge rst) begin
    if (rst) vsum <= 0;
    else     vsum <= K0*hs0 + K1*hs1 + K2*hs2 + K3*hs3 + K4*hs4;
end
//facem convolutie pe vertical
wire [7:0] gauss_t = vsum[15:8];
//normalizare

reg [7:0] t_s5;
always @(posedge clk or posedge rst) begin
    if (rst) t_s5 <= 8'd255;
    else     t_s5 <= gauss_t;
end

reg hs_s5;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s5 <= 0;
    else hs_s5 <= hs_s4;
end
reg vs_s5;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s5 <= 0;
    else vs_s5 <= vs_s4;
end
reg de_s5;
always @(posedge clk or posedge rst) begin
    if (rst) de_s5 <= 0;
    else de_s5 <= de_s4;
end


reg [7:0] t_s6;
always @(posedge clk or posedge rst) begin
    if (rst) t_s6 <= 8'd255;
    else t_s6 <= t_s5;
end
reg hs_s6;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s6 <= 0;
    else hs_s6 <= hs_s5;
end
reg vs_s6;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s6 <= 0;
    else vs_s6 <= vs_s5;
end
reg de_s6;
always @(posedge clk or posedge rst) begin
    if (rst) de_s6 <= 0;
    else de_s6 <= de_s5;
end

reg [7:0] t_s7;
always @(posedge clk or posedge rst) begin
    if (rst) t_s7 <= 8'd255;
    else t_s7 <= t_s6;
end
reg hs_s7;
always @(posedge clk or posedge rst) begin
    if (rst) hs_s7 <= 0;
    else hs_s7 <= hs_s6;
end
reg vs_s7;
always @(posedge clk or posedge rst) begin
    if (rst) vs_s7 <= 0;
    else vs_s7 <= vs_s6;
end
reg de_s7;
always @(posedge clk or posedge rst) begin
    if (rst) de_s7 <= 0;
    else de_s7 <= de_s6;
end



reg [7:0] r_d0, r_d1, r_d2, r_d3, r_d4, r_d5, r_d6;
always @(posedge clk or posedge rst) begin
    if (rst) r_d0 <= 0;
    else r_d0 <= r_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d1 <= 0;
    else r_d1 <= r_l2;   // from the 2-line alignment buffer
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d2 <= 0;
    else r_d2 <= r_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d3 <= 0;
    else r_d3 <= r_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d4 <= 0;
    else r_d4 <= r_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d5 <= 0;
    else r_d5 <= r_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d6 <= 0;
    else r_d6 <= r_d5;
end
reg [7:0] r_d7, r_d8, r_d9;
always @(posedge clk or posedge rst) begin
    if (rst) r_d7 <= 0;
    else r_d7 <= r_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d8 <= 0;
    else r_d8 <= r_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) r_d9 <= 0;
    else r_d9 <= r_d8;
end

reg [7:0] g_d0, g_d1, g_d2, g_d3, g_d4, g_d5, g_d6;
always @(posedge clk or posedge rst) begin
    if (rst) g_d0 <= 0;
    else g_d0 <= g_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d1 <= 0;
    else g_d1 <= g_l2;   // from the 2-line alignment buffer
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d2 <= 0;
    else g_d2 <= g_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d3 <= 0;
    else g_d3 <= g_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d4 <= 0;
    else g_d4 <= g_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d5 <= 0;
    else g_d5 <= g_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d6 <= 0;
    else g_d6 <= g_d5;
end
reg [7:0] g_d7, g_d8, g_d9;
always @(posedge clk or posedge rst) begin
    if (rst) g_d7 <= 0;
    else g_d7 <= g_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d8 <= 0;
    else g_d8 <= g_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) g_d9 <= 0;
    else g_d9 <= g_d8;
end

reg [7:0] b_d0, b_d1, b_d2, b_d3, b_d4, b_d5, b_d6;
always @(posedge clk or posedge rst) begin
    if (rst) b_d0 <= 0;
    else b_d0 <= b_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d1 <= 0;
    else b_d1 <= b_l2;   // from the 2-line alignment buffer
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d2 <= 0;
    else b_d2 <= b_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d3 <= 0;
    else b_d3 <= b_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d4 <= 0;
    else b_d4 <= b_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d5 <= 0;
    else b_d5 <= b_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d6 <= 0;
    else b_d6 <= b_d5;
end
reg [7:0] b_d7, b_d8, b_d9;
always @(posedge clk or posedge rst) begin
    if (rst) b_d7 <= 0;
    else b_d7 <= b_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d8 <= 0;
    else b_d8 <= b_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) b_d9 <= 0;
    else b_d9 <= b_d8;
end

reg [7:0] ar_d0, ar_d1, ar_d2, ar_d3, ar_d4, ar_d5, ar_d6;
always @(posedge clk or posedge rst) begin
    if (rst) ar_d0 <= 8'd255;
    else ar_d0 <= ar_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d1 <= 8'd255;
    else ar_d1 <= ar_d0;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d2 <= 8'd255;
    else ar_d2 <= ar_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d3 <= 8'd255;
    else ar_d3 <= ar_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d4 <= 8'd255;
    else ar_d4 <= ar_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d5 <= 8'd255;
    else ar_d5 <= ar_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d6 <= 8'd255;
    else ar_d6 <= ar_d5;
end
reg [7:0] ar_d7, ar_d8, ar_d9, ar_d10;
always @(posedge clk or posedge rst) begin
    if (rst) ar_d7 <= 8'd255;
    else ar_d7 <= ar_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d8 <= 8'd255;
    else ar_d8 <= ar_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d9 <= 8'd255;
    else ar_d9 <= ar_d8;
end
always @(posedge clk or posedge rst) begin
    if (rst) ar_d10 <= 8'd255;
    else ar_d10 <= ar_d9;
end

reg [7:0] ag_d0, ag_d1, ag_d2, ag_d3, ag_d4, ag_d5, ag_d6;
always @(posedge clk or posedge rst) begin
    if (rst) ag_d0 <= 8'd255;
    else ag_d0 <= ag_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d1 <= 8'd255;
    else ag_d1 <= ag_d0;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d2 <= 8'd255;
    else ag_d2 <= ag_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d3 <= 8'd255;
    else ag_d3 <= ag_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d4 <= 8'd255;
    else ag_d4 <= ag_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d5 <= 8'd255;
    else ag_d5 <= ag_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d6 <= 8'd255;
    else ag_d6 <= ag_d5;
end
reg [7:0] ag_d7, ag_d8, ag_d9, ag_d10;
always @(posedge clk or posedge rst) begin
    if (rst) ag_d7 <= 8'd255;
    else ag_d7 <= ag_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d8 <= 8'd255;
    else ag_d8 <= ag_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d9 <= 8'd255;
    else ag_d9 <= ag_d8;
end
always @(posedge clk or posedge rst) begin
    if (rst) ag_d10 <= 8'd255;
    else ag_d10 <= ag_d9;
end

reg [7:0] ab_d0, ab_d1, ab_d2, ab_d3, ab_d4, ab_d5, ab_d6;
always @(posedge clk or posedge rst) begin
    if (rst) ab_d0 <= 8'd255;
    else ab_d0 <= ab_in;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d1 <= 8'd255;
    else ab_d1 <= ab_d0;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d2 <= 8'd255;
    else ab_d2 <= ab_d1;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d3 <= 8'd255;
    else ab_d3 <= ab_d2;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d4 <= 8'd255;
    else ab_d4 <= ab_d3;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d5 <= 8'd255;
    else ab_d5 <= ab_d4;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d6 <= 8'd255;
    else ab_d6 <= ab_d5;
end
reg [7:0] ab_d7, ab_d8, ab_d9, ab_d10;
always @(posedge clk or posedge rst) begin
    if (rst) ab_d7 <= 8'd255;
    else ab_d7 <= ab_d6;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d8 <= 8'd255;
    else ab_d8 <= ab_d7;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d9 <= 8'd255;
    else ab_d9 <= ab_d8;
end
always @(posedge clk or posedge rst) begin
    if (rst) ab_d10 <= 8'd255;
    else ab_d10 <= ab_d9;
end

assign t_out  = t_s7;
assign r_out  = r_d9;  
assign g_out  = g_d9;
assign b_out  = b_d9;
assign ar_out = ar_d10;  
assign ag_out = ag_d10;
assign ab_out = ab_d10;
assign hs_out = hs_s7;
assign vs_out = vs_s7;
assign de_out = de_s7;

endmodule
