

`timescale 1ns/1ps

module dark_channel #(
    parameter IMG_WIDTH = 1024
)(
    input              clk,
    input              rst,
    input  [15:0]      in_data,
    input              in_hs,
    input              in_vs,
    input              in_de,

    output [7:0]       dc_out,
    output [7:0]       r_out,
    output [7:0]       g_out,
    output [7:0]       b_out,
    output             hs_out,
    output             vs_out,
    output             de_out
);

//bit replication
wire [7:0] r_in = {in_data[15:11], in_data[15:13]};
wire [7:0] g_in = {in_data[10:5],  in_data[10:9] };
wire [7:0] b_in = {in_data[4:0],   in_data[4:2]  };

//minim pixeli
wire [7:0] rg_min  = (r_in < g_in)  ? r_in  : g_in;
wire [7:0] pix_min = (rg_min < b_in) ? rg_min : b_in;



reg [7:0] pix_min_s1, r_s1, g_s1, b_s1;
reg       hs_s1, vs_s1, de_s1;
always @(posedge clk or posedge rst) begin
    if (rst) pix_min_s1 <= 8'd0;
    else     pix_min_s1 <= pix_min;
end

always @(posedge clk or posedge rst) begin
    if (rst) r_s1 <= 8'd0;
    else     r_s1 <= r_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s1 <= 8'd0;
    else     g_s1 <= g_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s1 <= 8'd0;
    else     b_s1 <= b_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_s1 <= 1'b0;
    else     hs_s1 <= in_hs;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_s1 <= 1'b0;
    else     vs_s1 <= in_vs;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_s1 <= 1'b0;
    else     de_s1 <= in_de;
end
//avem nev de reg pt line buffere

reg vs_d;
always @(posedge clk) vs_d <= vs_s1;
wire vs_fall = vs_d & ~vs_s1; //detector front(cadru nou, vezi curs tv)

reg [10:0] col;
always @(posedge clk or posedge rst) begin
    if (rst)            col <= 11'd0;
    else if (vs_fall)   col <= 11'd0;
    else if (de_s1)     col <= (col == IMG_WIDTH-1) ? 11'd0 : col + 11'd1;
end


(* ram_style = "block" *) reg [7:0] line0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] line1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] line2 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] line3 [0:IMG_WIDTH-1];
//aici practic se formeaza fereastra de 5x5, momentan doar partea pe verticala


reg [7:0] line0_rd, line1_rd, line2_rd, line3_rd;
reg [7:0] pix_min_d;   

always @(posedge clk) begin
    if (de_s1) begin
    pix_min_d <= pix_min_s1;
    line0_rd <= line0[col];
    line1_rd <= line1[col];
    line2_rd <= line2[col];
    line3_rd <= line3[col];
    line0[col] <= pix_min_s1;
    line1[col] <= line0[col];
    line2[col] <= line1[col];
    line3[col] <= line2[col];
    end
end

(* ram_style = "block" *) reg [7:0] rline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] rline1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] gline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] gline1 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] bline0 [0:IMG_WIDTH-1];
(* ram_style = "block" *) reg [7:0] bline1 [0:IMG_WIDTH-1];
//line buffere, rgb pt etapele urmatoare(valorile trebuie sincronizate)

reg [7:0] r_l2, g_l2, b_l2;   
always @(posedge clk) begin
    if (de_s1) begin
    r_l2 <= rline1[col];
    g_l2 <= gline1[col];
    b_l2 <= bline1[col];
    rline0[col] <= r_s1;
    rline1[col] <= rline0[col];
    gline0[col] <= g_s1;
    gline1[col] <= gline0[col];
    bline0[col] <= b_s1;
    bline1[col] <= bline0[col];
    end
end


reg [7:0] row4_s2;   // cel mai nou(pixelul curent)
reg [7:0] row3_s2;
reg [7:0] row2_s2;
reg [7:0] row1_s2;
reg [7:0] row0_s2;   // cel mai vechi


reg [7:0] r_s2, g_s2, b_s2;
reg       hs_s2, vs_s2, de_s2;
always @(posedge clk or posedge rst) begin
    if (rst) row4_s2 <= 8'd0;
    else     row4_s2 <= pix_min_d;   
end

always @(posedge clk or posedge rst) begin
    if (rst) row3_s2 <= 8'd0;
    else     row3_s2 <= line0_rd;
end

always @(posedge clk or posedge rst) begin
    if (rst) row2_s2 <= 8'd0;
    else     row2_s2 <= line1_rd;
end

always @(posedge clk or posedge rst) begin
    if (rst) row1_s2 <= 8'd0;
    else     row1_s2 <= line2_rd;
end

always @(posedge clk or posedge rst) begin
    if (rst) row0_s2 <= 8'd0;
    else     row0_s2 <= line3_rd;
end
//delay sincronizari

always @(posedge clk or posedge rst) begin
    if (rst) r_s2 <= 8'd0;
    else     r_s2 <= r_l2;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s2 <= 8'd0;
    else     g_s2 <= g_l2;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s2 <= 8'd0;
    else     b_s2 <= b_l2;
end

reg [7:0] r_s3, g_s3, b_s3;
reg [7:0] r_s4, g_s4, b_s4;

always @(posedge clk or posedge rst) begin
    if (rst) r_s3 <= 8'd0;
    else     r_s3 <= r_s2;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s3 <= 8'd0;
    else     g_s3 <= g_s2;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s3 <= 8'd0;
    else     b_s3 <= b_s2;
end

always @(posedge clk or posedge rst) begin
    if (rst) r_s4 <= 8'd0;
    else     r_s4 <= r_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s4 <= 8'd0;
    else     g_s4 <= g_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s4 <= 8'd0;
    else     b_s4 <= b_s3;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_s2 <= 1'b0;
    else     hs_s2 <= hs_s1;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_s2 <= 1'b0;
    else     vs_s2 <= vs_s1;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_s2 <= 1'b0;
    else     de_s2 <= de_s1;
end

reg [7:0] row0 [0:4];
reg [7:0] row1 [0:4];
reg [7:0] row2 [0:4];
reg [7:0] row3 [0:4];
reg [7:0] row4 [0:4];

reg [7:0] r_s7, g_s7, b_s7;
reg       hs_s7, vs_s7, de_s7;

integer k;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (k = 0; k < 5; k = k + 1) begin
            row0[k] <= 8'd0; row1[k] <= 8'd0; row2[k] <= 8'd0;
            row3[k] <= 8'd0; row4[k] <= 8'd0;
        end
        r_s7 <= 8'd0; g_s7 <= 8'd0; b_s7 <= 8'd0;
        hs_s7 <= 1'b0; vs_s7 <= 1'b0; de_s7 <= 1'b0;
    end else begin
        row0[0] <= row0_s2; row0[1] <= row0[0]; row0[2] <= row0[1]; row0[3] <= row0[2]; row0[4] <= row0[3];
        row1[0] <= row1_s2; row1[1] <= row1[0]; row1[2] <= row1[1]; row1[3] <= row1[2]; row1[4] <= row1[3];
        row2[0] <= row2_s2; row2[1] <= row2[0]; row2[2] <= row2[1]; row2[3] <= row2[2]; row2[4] <= row2[3];
        row3[0] <= row3_s2; row3[1] <= row3[0]; row3[2] <= row3[1]; row3[3] <= row3[2]; row3[4] <= row3[3];
        row4[0] <= row4_s2; row4[1] <= row4[0]; row4[2] <= row4[1]; row4[3] <= row4[2]; row4[4] <= row4[3];
        r_s7 <= r_s4; g_s7 <= g_s4; b_s7 <= b_s4;
        hs_s7 <= hs_s2; vs_s7 <= vs_s2; de_s7 <= de_s2;
    end
end


function [7:0] min5;
    input [7:0] a, b, c, d, e;
    reg   [7:0] ab, cd, abcd;
    begin
        ab   = (a < b) ? a : b;
        cd   = (c < d) ? c : d;
        abcd = (ab < cd) ? ab : cd;
        min5 = (abcd < e) ? abcd : e;
    end
endfunction
//se face minimul iarasi

reg [7:0] row_min [0:4];
reg [7:0] r_s8, g_s8, b_s8;
reg       hs_s8, vs_s8, de_s8;
always @(posedge clk or posedge rst) begin
    if (rst) row_min[0] <= 8'd0;
    else     row_min[0] <= min5(row0[0], row0[1], row0[2], row0[3], row0[4]);
end

always @(posedge clk or posedge rst) begin
    if (rst) row_min[1] <= 8'd0;
    else     row_min[1] <= min5(row1[0], row1[1], row1[2], row1[3], row1[4]);
end

always @(posedge clk or posedge rst) begin
    if (rst) row_min[2] <= 8'd0;
    else     row_min[2] <= min5(row2[0], row2[1], row2[2], row2[3], row2[4]);
end

always @(posedge clk or posedge rst) begin
    if (rst) row_min[3] <= 8'd0;
    else     row_min[3] <= min5(row3[0], row3[1], row3[2], row3[3], row3[4]);
end

always @(posedge clk or posedge rst) begin
    if (rst) row_min[4] <= 8'd0;
    else     row_min[4] <= min5(row4[0], row4[1], row4[2], row4[3], row4[4]);
end

always @(posedge clk or posedge rst) begin
    if (rst) r_s8 <= 8'd0;
    else     r_s8 <= r_s7;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s8 <= 8'd0;
    else     g_s8 <= g_s7;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s8 <= 8'd0;
    else     b_s8 <= b_s7;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_s8 <= 1'b0;
    else     hs_s8 <= hs_s7;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_s8 <= 1'b0;
    else     vs_s8 <= vs_s7;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_s8 <= 1'b0;
    else     de_s8 <= de_s7;
end


reg [7:0] dc_s9;
reg [7:0] r_s9, g_s9, b_s9;
reg       hs_s9, vs_s9, de_s9;
always @(posedge clk or posedge rst) begin
    if (rst) dc_s9 <= 8'd0;
    else     dc_s9 <= min5(row_min[0], row_min[1], row_min[2], row_min[3], row_min[4]);
end
//val efectiva pt dark channel

always @(posedge clk or posedge rst) begin
    if (rst) r_s9 <= 8'd0;
    else     r_s9 <= r_s8;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_s9 <= 8'd0;
    else     g_s9 <= g_s8;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_s9 <= 8'd0;
    else     b_s9 <= b_s8;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_s9 <= 1'b0;
    else     hs_s9 <= hs_s8;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_s9 <= 1'b0;
    else     vs_s9 <= vs_s8;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_s9 <= 1'b0;
    else     de_s9 <= de_s8;
end


assign dc_out = dc_s9;
assign r_out  = r_s9;
assign g_out  = g_s9;
assign b_out  = b_s9;
assign hs_out = hs_s9;
assign vs_out = vs_s9;
assign de_out = de_s9;

endmodule
