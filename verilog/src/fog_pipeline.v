`timescale 1ns/1ps

module fog_pipeline #(
    parameter IMG_WIDTH = 1024
)(
    input              clk,
    input              rst,
    input              filter_select,     // 0 = Gaussian ,1 = Bilateral
    input  [15:0]      in_data,
    input              in_hs,
    input              in_vs,
    input              in_de,

    output [15:0]      out_data,
    output             out_hs,
    output             out_vs,
    output             out_de,
    output [7:0]       dc_vis,            // dark channel (KEY1)
    output [7:0]       tm_vis,            // transmission map dupa Gaussian (KEY3)
    output [7:0]       tm_raw_vis,        // transmission map inainte de Gaussian (KEY2)
    output [7:0]       airlight_r_vis,    // airlight RGB
    output [7:0]       airlight_g_vis,    
    output [7:0]       airlight_b_vis
);


wire [7:0] dc_dc, dc_r, dc_g, dc_b;
wire       dc_hs, dc_vs, dc_de;

dark_channel #(.IMG_WIDTH(IMG_WIDTH)) u_dark_channel (
    .clk      (clk),
    .rst      (rst),
    .in_data  (in_data),
    .in_hs    (in_hs),
    .in_vs    (in_vs),
    .in_de    (in_de),
    .dc_out   (dc_dc),
    .r_out    (dc_r),
    .g_out    (dc_g),
    .b_out    (dc_b),
    .hs_out   (dc_hs),
    .vs_out   (dc_vs),
    .de_out   (dc_de)
);


wire [7:0] al_ar, al_ag, al_ab, al_a_dc;
wire [7:0] al_dc, al_r, al_g, al_b;
wire       al_hs, al_vs, al_de;

airlight u_airlight (
    .clk         (clk),
    .rst         (rst),
    .dc_in       (dc_dc),
    .r_in        (dc_r),
    .g_in        (dc_g),
    .b_in        (dc_b),
    .hs_in       (dc_hs),
    .vs_in       (dc_vs),
    .de_in       (dc_de),
    .airlight_r  (al_ar),
    .airlight_g  (al_ag),
    .airlight_b  (al_ab),
    .airlight_dc (al_a_dc),
    .r_out       (al_r),
    .g_out       (al_g),
    .b_out       (al_b),
    .dc_out      (al_dc),
    .hs_out      (al_hs),
    .vs_out      (al_vs),
    .de_out      (al_de)
);



wire [7:0] tm_t, tm_r, tm_g, tm_b, tm_ar, tm_ag, tm_ab;
wire       tm_hs, tm_vs, tm_de;

transmission_map u_transmission_map (
    .clk         (clk),
    .rst         (rst),
    .dc_in       (al_dc),
    .r_in        (al_r),
    .g_in        (al_g),
    .b_in        (al_b),
    .airlight_r  (al_ar),
    .airlight_g  (al_ag),
    .airlight_b  (al_ab),
    .hs_in       (al_hs),
    .vs_in       (al_vs),
    .de_in       (al_de),
    .t_out       (tm_t),
    .r_out       (tm_r),
    .g_out       (tm_g),
    .b_out       (tm_b),
    .ar_out      (tm_ar),
    .ag_out      (tm_ag),
    .ab_out      (tm_ab),
    .hs_out      (tm_hs),
    .vs_out      (tm_vs),
    .de_out      (tm_de)
);


wire [7:0] gf_t, gf_r, gf_g, gf_b, gf_ar, gf_ag, gf_ab;
wire       gf_hs, gf_vs, gf_de;

gaussian_filter_t #(.IMG_WIDTH(IMG_WIDTH)) u_gaussian_filter_t (
    .clk     (clk),
    .rst     (rst),
    .t_in    (tm_t),
    .r_in    (tm_r),
    .g_in    (tm_g),
    .b_in    (tm_b),
    .ar_in   (tm_ar),
    .ag_in   (tm_ag),
    .ab_in   (tm_ab),
    .hs_in   (tm_hs),
    .vs_in   (tm_vs),
    .de_in   (tm_de),
    .t_out   (gf_t),
    .r_out   (gf_r),
    .g_out   (gf_g),
    .b_out   (gf_b),
    .ar_out  (gf_ar),
    .ag_out  (gf_ag),
    .ab_out  (gf_ab),
    .hs_out  (gf_hs),
    .vs_out  (gf_vs),
    .de_out  (gf_de)
);


wire [7:0] bf_t, bf_r, bf_g, bf_b, bf_ar, bf_ag, bf_ab;
wire       bf_hs, bf_vs, bf_de;

bilateral_filter_t #(.IMG_WIDTH(IMG_WIDTH)) u_bilateral_filter_t (
    .clk     (clk),
    .rst     (rst),
    .t_in    (tm_t),
    .r_in    (tm_r),
    .g_in    (tm_g),
    .b_in    (tm_b),
    .ar_in   (tm_ar),
    .ag_in   (tm_ag),
    .ab_in   (tm_ab),
    .hs_in   (tm_hs),
    .vs_in   (tm_vs),
    .de_in   (tm_de),
    .t_out   (bf_t),
    .r_out   (bf_r),
    .g_out   (bf_g),
    .b_out   (bf_b),
    .ar_out  (bf_ar),
    .ag_out  (bf_ag),
    .ab_out  (bf_ab),
    .hs_out  (bf_hs),
    .vs_out  (bf_vs),
    .de_out  (bf_de)
);

//doar t difera pentru filtrare
wire [7:0] sel_t  = filter_select ? bf_t  : gf_t;
wire [7:0] sel_r  = gf_r;
wire [7:0] sel_g  = gf_g;
wire [7:0] sel_b  = gf_b;
wire [7:0] sel_ar = gf_ar;
wire [7:0] sel_ag = gf_ag;
wire [7:0] sel_ab = gf_ab;
wire       sel_hs = gf_hs;
wire       sel_vs = gf_vs;
wire       sel_de = gf_de;


wire [15:0] rest_data;
wire        rest_hs, rest_vs, rest_de;

restoration u_restoration (
    .clk        (clk),
    .rst        (rst),
    .t_in       (sel_t),
    .r_in       (sel_r),
    .g_in       (sel_g),
    .b_in       (sel_b),
    .ar_in      (sel_ar),
    .ag_in      (sel_ag),
    .ab_in      (sel_ab),
    .hs_in      (sel_hs),
    .vs_in      (sel_vs),
    .de_in      (sel_de),
    .rgb565_out (rest_data),
    .hs_out     (rest_hs),
    .vs_out     (rest_vs),
    .de_out     (rest_de)
);


contrast_stretch u_contrast_stretch (
    .clk      (clk),
    .rst      (rst),
    .in_data  (rest_data),
    .hs_in    (rest_hs),
    .vs_in    (rest_vs),
    .de_in    (rest_de),
    .out_data (out_data),
    .hs_out   (out_hs),
    .vs_out   (out_vs),
    .de_out   (out_de)
);



assign dc_vis         = dc_dc;     
assign tm_vis         = sel_t;     
assign tm_raw_vis     = tm_t;      
assign airlight_r_vis = al_ar;
assign airlight_g_vis = al_ag;
assign airlight_b_vis = al_ab;

endmodule
