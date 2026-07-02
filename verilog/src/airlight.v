//     I(x) = t(x) * J(x) + (1 - t(x)) * A
//
//   I(x) = ce vede camera (pixel cu ceata)
//   J(x) = ce trebuie vazut (imaginea corectata)
//   t(x) = transmission (1 = fara ceata, 0 = ceata)
//   A    = airlight (ce "culoare" are ceata)
//
// t -> 0 => pixelii au valori asem. cu A (In a foggy region, the dark channel is high BECAUSE the pixel's smallest
//                                         channel is fog-coloured. The pixel itself is "the foggy area", so its RGB
//                                         is a good estimate of the fog colour. Picking the brightest dark-channel
//                                         pixel finds the foggiest area in the frame.)
//RUNNING MAX:
//   retinem valoarile maxime dc (si rgb) a fiecarui pixel, actualizam constant 
//   cand avem cadru nou (folosim detectorul de front)
//   folosim valoarea rgb corespunzatoare valorilor maxime dc

`timescale 1ns/1ps

module airlight (
    input              clk,
    input              rst,
    input  [7:0]       dc_in,
    input  [7:0]       r_in,
    input  [7:0]       g_in,
    input  [7:0]       b_in,
    input              hs_in,
    input              vs_in,
    input              de_in,

   
    output reg [7:0]   airlight_r,
    output reg [7:0]   airlight_g,
    output reg [7:0]   airlight_b,
    output reg [7:0]   airlight_dc,   
 //aceste valori se actualizeaza pe frontul cazator al vs_in   
    
    output reg [7:0]   r_out,
    output reg [7:0]   g_out,
    output reg [7:0]   b_out,
    output reg [7:0]   dc_out,
    output reg         hs_out,
    output reg         vs_out,
    output reg         de_out
);


localparam [7:0] DC_MIN_FOG   = 8'd60;
//valoarea minima pt care consideram ca un pixel e afectat de ceata

localparam [7:0] AIRLIGHT_CAP = 8'd180;
//valoarea maxima pt care consideram ca un pixel este airlight, depasirea acestuia rezulta in probleme la restoration

reg [7:0] run_max_dc;
reg [7:0] run_max_r;
reg [7:0] run_max_g;
reg [7:0] run_max_b;


reg vs_d;
always @(posedge clk) begin
    vs_d <= vs_in;
end
wire vs_edge = vs_d & ~vs_in;


wire pixel_is_new_max = de_in
                      & (dc_in > run_max_dc)
                      & (dc_in > DC_MIN_FOG);
//intermediar, pt a actualiza valori running max

always @(posedge clk or posedge rst) begin
    if (rst)
        run_max_dc <= 8'd0;
    else if (vs_edge)
        run_max_dc <= run_max_dc - (run_max_dc >> 3);    //folosit pt a nu avea acelasi maxim mereu(altfel, ceata ar putea fi inlaturata pt valorile "initiale"), aplicam doar atunci cand avem cadru nou
    else if (pixel_is_new_max)
        run_max_dc <= dc_in;                             
end


always @(posedge clk or posedge rst) begin
    if (rst)
        run_max_r <= 8'd128; //folosim 128 pt ca altfel vom avea probleme in transmission map
    else if (vs_edge)
        run_max_r <= run_max_r - (run_max_r >> 3);
    else if (pixel_is_new_max)
        run_max_r <= r_in;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        run_max_g <= 8'd128;
    else if (vs_edge)
        run_max_g <= run_max_g - (run_max_g >> 3);
    else if (pixel_is_new_max)
        run_max_g <= g_in;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        run_max_b <= 8'd128;
    else if (vs_edge)
        run_max_b <= run_max_b - (run_max_b >> 3);
    else if (pixel_is_new_max)
        run_max_b <= b_in;
end
//actualizam valorile dc maxime echivalente pe culori


always @(posedge clk or posedge rst) begin
    if (rst) airlight_dc <= 8'd0;
    else     airlight_dc <= run_max_dc;
end

always @(posedge clk or posedge rst) begin
    if (rst) airlight_r <= AIRLIGHT_CAP; //la valori airlight cap in transmission map practic se considera ca imaginea nu trebuie sa fie corectata
    else     airlight_r <= (run_max_r > AIRLIGHT_CAP) ? AIRLIGHT_CAP : run_max_r;
end

always @(posedge clk or posedge rst) begin
    if (rst) airlight_g <= AIRLIGHT_CAP;
    else     airlight_g <= (run_max_g > AIRLIGHT_CAP) ? AIRLIGHT_CAP : run_max_g;
end

always @(posedge clk or posedge rst) begin
    if (rst) airlight_b <= AIRLIGHT_CAP;
    else     airlight_b <= (run_max_b > AIRLIGHT_CAP) ? AIRLIGHT_CAP : run_max_b;
end
//actualizam doar la cadru nou pt nu a avea efecte de flickering/screen tearing

always @(posedge clk or posedge rst) begin
    if (rst) r_out <= 8'd0;
    else     r_out <= r_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) g_out <= 8'd0;
    else     g_out <= g_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) b_out <= 8'd0;
    else     b_out <= b_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) dc_out <= 8'd0;
    else     dc_out <= dc_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) hs_out <= 1'b0;
    else     hs_out <= hs_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) vs_out <= 1'b0;
    else     vs_out <= vs_in;
end

always @(posedge clk or posedge rst) begin
    if (rst) de_out <= 1'b0;
    else     de_out <= de_in;
end
//delay pt sincronizare

endmodule