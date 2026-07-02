`timescale 1ns/1ps
`define VIDEO_1024_768

module top(
    input                        sys_clk,
    input                        rst_n,
    input                        key1,   // KEY1 - dark channel
    input                        key2,   // KEY2 - transmission map
    input                        key3,   // KEY3 - Gaussian/Bilateral
    input                        key4,   // KEY4 - direct camera

    // MIPI CSI-2
    input                        mipi_phy_if_clk_hs_n,
    input                        mipi_phy_if_clk_hs_p,
    input                        mipi_phy_if_clk_lp_n,
    input                        mipi_phy_if_clk_lp_p,
    input  [1:0]                 mipi_phy_if_data_hs_n,
    input  [1:0]                 mipi_phy_if_data_hs_p,
    input  [1:0]                 mipi_phy_if_data_lp_n,
    input  [1:0]                 mipi_phy_if_data_lp_p,

    // Camera I2C + control
    inout                        cmos1_scl,
    inout                        cmos1_sda,
    output                       cmos1_rst_n,

    // HDMI output
    output                       tmds_clk_p,
    output                       tmds_clk_n,
    output [2:0]                 tmds_data_p,
    output [2:0]                 tmds_data_n,
    output                       HDMI1_OEN,

    // DDR3
    inout  [15:0]                ddr3_dq,
    inout  [1:0]                 ddr3_dqs_p,
    inout  [1:0]                 ddr3_dqs_n,
    output [13:0]                ddr3_addr,
    output [2:0]                 ddr3_ba,
    output                       ddr3_ras_n,
    output                       ddr3_cas_n,
    output                       ddr3_we_n,
    output                       ddr3_reset_n,
    output [0:0]                 ddr3_ck_p,
    output [0:0]                 ddr3_ck_n,
    output [0:0]                 ddr3_cke,
    output [0:0]                 ddr3_cs_n,
    output [1:0]                 ddr3_dm,
    output [0:0]                 ddr3_odt,

    // LEDs
    output [3:0]                 led
);

parameter MEM_DATA_BITS  = 64;
parameter ADDR_BITS      = 25;
parameter BUSRT_BITS     = 10;

// 1024 * 768 * 16 / 64 = 196608
parameter FRAME_LEN      = 24'd196608;

assign HDMI1_OEN  = 1'b1;
//altfel se reseteaza camera singura
assign cmos1_rst_n = 1'b1;

wire clk_200MHz;
wire video_clk;
wire video_clk5x;
wire locked_200;


wire sys_clk_buf;

IBUFG sys_clk_ibufg_i (
    .I (sys_clk),
    .O (sys_clk_buf)
);

clk_200M clk_refm0 (
    .clk_in1  (sys_clk_buf),
    .clk_out1 (clk_200MHz),
    .reset    (1'b0),
    .locked   (locked_200)
);

video_pll video_pll_m0 (
    .clk_in1  (sys_clk_buf),
    .clk_out1 (video_clk),
    .clk_out2 (video_clk5x),
    .reset    (1'b0),
    .locked   ()
);

wire         ui_clk;
wire         ui_clk_sync_rst;
wire         init_calib_complete;

wire                          rd_burst_req;
wire [BUSRT_BITS-1:0]         rd_burst_len;
wire [ADDR_BITS-1:0]          rd_burst_addr;
wire                          rd_burst_data_valid;
wire [MEM_DATA_BITS-1:0]      rd_burst_data;
wire                          rd_burst_finish;
wire                          wr_burst_req;
wire [BUSRT_BITS-1:0]         wr_burst_len;
wire [ADDR_BITS-1:0]          wr_burst_addr;
wire                          wr_burst_data_req;
wire [MEM_DATA_BITS-1:0]      wr_burst_data;
wire                          wr_burst_finish;
//ddr3 controller


wire [3:0]   s00_axi_awid;
wire [63:0]  s00_axi_awaddr;
wire [7:0]   s00_axi_awlen;
wire [2:0]   s00_axi_awsize;
wire [1:0]   s00_axi_awburst;
wire         s00_axi_awlock;
wire [3:0]   s00_axi_awcache;
wire [2:0]   s00_axi_awprot;
wire [3:0]   s00_axi_awqos;
wire [0:0]   s00_axi_awuser;
wire         s00_axi_awvalid;
wire         s00_axi_awready;
wire [63:0]  s00_axi_wdata;
wire [7:0]   s00_axi_wstrb;
wire         s00_axi_wlast;
wire [0:0]   s00_axi_wuser;
wire         s00_axi_wvalid;
wire         s00_axi_wready;
wire [3:0]   s00_axi_bid;
wire [1:0]   s00_axi_bresp;
wire [0:0]   s00_axi_buser;
wire         s00_axi_bvalid;
wire         s00_axi_bready;
wire [3:0]   s00_axi_arid;
wire [63:0]  s00_axi_araddr;
wire [7:0]   s00_axi_arlen;
wire [2:0]   s00_axi_arsize;
wire [1:0]   s00_axi_arburst;
wire [1:0]   s00_axi_arlock;
wire [3:0]   s00_axi_arcache;
wire [2:0]   s00_axi_arprot;
wire [3:0]   s00_axi_arqos;
wire [0:0]   s00_axi_aruser;
wire         s00_axi_arvalid;
wire         s00_axi_arready;
wire [3:0]   s00_axi_rid;
wire [63:0]  s00_axi_rdata;
wire [1:0]   s00_axi_rresp;
wire         s00_axi_rlast;
wire [0:0]   s00_axi_ruser;
wire         s00_axi_rvalid;
wire         s00_axi_rready;
//axi master

wire [15:0]  m_axis_tdata;
wire         m_axis_tvalid;
wire         m_axis_tready;
wire         m_axis_tlast;
wire [0:0]   m_axis_tuser;

assign m_axis_tready = 1'b1;

wire         write_req;
wire         write_req_ack;
wire [1:0]   write_addr_index;
wire [1:0]   read_addr_index;
wire         write_en   = m_axis_tvalid & m_axis_tready;
wire [15:0]  write_data = m_axis_tdata;
//camera

wire [15:0]  vout_data;
wire         hs, vs, de;
wire         read_req;
wire         read_req_ack;
wire         read_en;
wire [15:0]  read_data;
//citire ddr3

wire [15:0]  fog_data;
wire         fog_hs, fog_vs, fog_de;
wire [7:0]   fog_dc_vis;
wire [7:0]   fog_tm_vis;
wire [7:0]   fog_tm_raw_vis;
wire [7:0]   fog_ar_vis, fog_ag_vis, fog_ab_vis; 

wire [9:0]   cmos1_lut_index;
wire [31:0]  cmos1_lut_data;

i2c_config i2c_config_m0 (
    .rst          (~rst_n),
    .clk          (sys_clk_buf),
    .clk_div_cnt  (16'd99),
    .i2c_addr_2byte(1'b1),
    .lut_index    (cmos1_lut_index),
    .lut_dev_addr (cmos1_lut_data[31:24]),
    .lut_reg_addr (cmos1_lut_data[23:8]),
    .lut_reg_data (cmos1_lut_data[7:0]),
    .error        (),
    .done         (),
    .i2c_scl      (cmos1_scl),
    .i2c_sda      (cmos1_sda)
);

lut_ov5640_rgb565_1024_768 lut_ov5640_rgb565_1024_768_m0 (
    .lut_index    (cmos1_lut_index),
    .lut_data     (cmos1_lut_data)
);
//ov5640 idc

design_1_wrapper design_1_wrapper_i (
    .dphy_clk_200M           (clk_200MHz),
    .mipi_phy_if_clk_hs_p    (mipi_phy_if_clk_hs_p),
    .mipi_phy_if_clk_hs_n    (mipi_phy_if_clk_hs_n),
    .mipi_phy_if_clk_lp_p    (mipi_phy_if_clk_lp_p),
    .mipi_phy_if_clk_lp_n    (mipi_phy_if_clk_lp_n),
    .mipi_phy_if_data_hs_p   (mipi_phy_if_data_hs_p),
    .mipi_phy_if_data_hs_n   (mipi_phy_if_data_hs_n),
    .mipi_phy_if_data_lp_p   (mipi_phy_if_data_lp_p),
    .mipi_phy_if_data_lp_n   (mipi_phy_if_data_lp_n),
    .m_axis_tdata            (m_axis_tdata),
    .m_axis_tlast            (m_axis_tlast),
    .m_axis_tready           (m_axis_tready),
    .m_axis_tuser            (m_axis_tuser),
    .m_axis_tvalid           (m_axis_tvalid),
    .video_aclk              (ui_clk),
    .video_aresetn           (rst_n)
);
//mipi csi-2 ip block

cmos_write_req_gen cmos_write_req_gen_m0 (
    .rst              (~rst_n),
    .pclk             (ui_clk),
    .m_axis_tvalid    (m_axis_tvalid),
    .m_axis_tready    (m_axis_tready),
    .m_axis_tuser     (m_axis_tuser),
    .write_req        (write_req),
    .write_addr_index (write_addr_index),
    .read_addr_index  (read_addr_index),
    .write_req_ack    (write_req_ack)
);

video_timing_data video_timing_data_m0 (
    .video_clk    (video_clk),
    .rst          (~rst_n),
    .read_req     (read_req),
    .read_req_ack (read_req_ack),
    .read_en      (read_en),
    .read_data    (read_data),
    .hs           (hs),
    .vs           (vs),
    .de           (de),
    .vout_data    (vout_data)
);


reg [1:0] key1_ff, key2_ff, key3_ff, key4_ff;

always @(posedge video_clk) begin
    key1_ff <= {key1_ff[0], key1};
end

always @(posedge video_clk) begin
    key2_ff <= {key2_ff[0], key2};
end

always @(posedge video_clk) begin
    key3_ff <= {key3_ff[0], key3};
end

always @(posedge video_clk) begin
    key4_ff <= {key4_ff[0], key4};
end

wire key1_s = key1_ff[1];
wire key2_s = key2_ff[1];
wire key3_s = key3_ff[1];
wire key4_s = key4_ff[1];

fog_pipeline #(.IMG_WIDTH(1024)) fog_pipeline_m0 (
    .clk            (video_clk),
    .rst            (~rst_n),
    .filter_select  (~key3_s),      
    .in_data        (vout_data),
    .in_hs          (hs),
    .in_vs          (vs),
    .in_de          (de),
    .out_data       (fog_data),
    .out_hs         (fog_hs),
    .out_vs         (fog_vs),
    .out_de         (fog_de),
    .dc_vis         (fog_dc_vis),
    .tm_vis         (fog_tm_vis),
    .tm_raw_vis     (fog_tm_raw_vis),
    .airlight_r_vis (fog_ar_vis),
    .airlight_g_vis (fog_ag_vis),
    .airlight_b_vis (fog_ab_vis)
);

rgb2dvi
#(
    .kGenerateSerialClk (1'b0),
    .kClkRange          (1),
    .kRstActiveHigh     (1'b1)
)
rgb2dvi_m0 (
    .TMDS_Clk_p  (tmds_clk_p),
    .TMDS_Clk_n  (tmds_clk_n),
    .TMDS_Data_p (tmds_data_p),
    .TMDS_Data_n (tmds_data_n),
    .aRst        (1'b0),
    .aRst_n      (1'b1),
    .vid_pData   (
        ~key4_s ? {vout_data[15:11], 3'd0,    
                 vout_data[10:5],  2'd0, 
                 vout_data[4:0],   3'd0} : 
        ~key1_s ? {fog_dc_vis, fog_dc_vis, fog_dc_vis} :
        ~key2_s ? {fog_tm_vis, fog_tm_vis, fog_tm_vis} :
                {fog_data[15:11], 3'd0,
                 fog_data[10:5],  2'd0,
                 fog_data[4:0],   3'd0}),              
    .vid_pVDE    (de),
    .vid_pHSync  (hs),
    .vid_pVSync  (vs),
    .PixelClk    (video_clk),
    .SerialClk   (video_clk5x)
);

frame_read_write frame_read_write_m0 (
    .rst                  (~rst_n),
    .mem_clk              (ui_clk),
    .rd_burst_req         (rd_burst_req),
    .rd_burst_len         (rd_burst_len),
    .rd_burst_addr        (rd_burst_addr),
    .rd_burst_data_valid  (rd_burst_data_valid),
    .rd_burst_data        (rd_burst_data),
    .rd_burst_finish      (rd_burst_finish),
    .read_clk             (video_clk),
    .read_req             (read_req),
    .read_req_ack         (read_req_ack),
    .read_finish          (),
    .read_addr_0          (24'd0),
    .read_addr_1          (24'd2073600),
    .read_addr_2          (24'd4147200),
    .read_addr_3          (24'd6220800),
    .read_addr_index      (read_addr_index),
    .read_len             (FRAME_LEN),
    .read_en              (read_en),
    .read_data            (read_data),
    .wr_burst_req         (wr_burst_req),
    .wr_burst_len         (wr_burst_len),
    .wr_burst_addr        (wr_burst_addr),
    .wr_burst_data_req    (wr_burst_data_req),
    .wr_burst_data        (wr_burst_data),
    .wr_burst_finish      (wr_burst_finish),
    .write_clk            (ui_clk),
    .write_req            (write_req),
    .write_req_ack        (write_req_ack),
    .write_finish         (),
    .write_addr_0         (24'd0),
    .write_addr_1         (24'd2073600),
    .write_addr_2         (24'd4147200),
    .write_addr_3         (24'd6220800),
    .write_addr_index     (write_addr_index),
    .write_len            (FRAME_LEN),
    .write_en             (write_en),
    .write_data           (write_data)
);
//ddr3 aribiter

aq_axi_master u_aq_axi_master (
    .ARESETN        (~ui_clk_sync_rst),
    .ACLK           (ui_clk),
    .M_AXI_AWID     (s00_axi_awid),
    .M_AXI_AWADDR   (s00_axi_awaddr),
    .M_AXI_AWLEN    (s00_axi_awlen),
    .M_AXI_AWSIZE   (s00_axi_awsize),
    .M_AXI_AWBURST  (s00_axi_awburst),
    .M_AXI_AWLOCK   (s00_axi_awlock),
    .M_AXI_AWCACHE  (s00_axi_awcache),
    .M_AXI_AWPROT   (s00_axi_awprot),
    .M_AXI_AWQOS    (s00_axi_awqos),
    .M_AXI_AWUSER   (s00_axi_awuser),
    .M_AXI_AWVALID  (s00_axi_awvalid),
    .M_AXI_AWREADY  (s00_axi_awready),
    .M_AXI_WDATA    (s00_axi_wdata),
    .M_AXI_WSTRB    (s00_axi_wstrb),
    .M_AXI_WLAST    (s00_axi_wlast),
    .M_AXI_WUSER    (s00_axi_wuser),
    .M_AXI_WVALID   (s00_axi_wvalid),
    .M_AXI_WREADY   (s00_axi_wready),
    .M_AXI_BID      (s00_axi_bid),
    .M_AXI_BRESP    (s00_axi_bresp),
    .M_AXI_BUSER    (s00_axi_buser),
    .M_AXI_BVALID   (s00_axi_bvalid),
    .M_AXI_BREADY   (s00_axi_bready),
    .M_AXI_ARID     (s00_axi_arid),
    .M_AXI_ARADDR   (s00_axi_araddr),
    .M_AXI_ARLEN    (s00_axi_arlen),
    .M_AXI_ARSIZE   (s00_axi_arsize),
    .M_AXI_ARBURST  (s00_axi_arburst),
    .M_AXI_ARLOCK   (s00_axi_arlock),
    .M_AXI_ARCACHE  (s00_axi_arcache),
    .M_AXI_ARPROT   (s00_axi_arprot),
    .M_AXI_ARQOS    (s00_axi_arqos),
    .M_AXI_ARUSER   (s00_axi_aruser),
    .M_AXI_ARVALID  (s00_axi_arvalid),
    .M_AXI_ARREADY  (s00_axi_arready),
    .M_AXI_RID      (s00_axi_rid),
    .M_AXI_RDATA    (s00_axi_rdata),
    .M_AXI_RRESP    (s00_axi_rresp),
    .M_AXI_RLAST    (s00_axi_rlast),
    .M_AXI_RUSER    (s00_axi_ruser),
    .M_AXI_RVALID   (s00_axi_rvalid),
    .M_AXI_RREADY   (s00_axi_rready),
    .MASTER_RST     (1'b0),
    .WR_START       (wr_burst_req),
    .WR_ADRS        ({wr_burst_addr, 3'd0}),
    .WR_LEN         ({wr_burst_len,  3'd0}),
    .WR_READY       (),
    .WR_FIFO_RE     (wr_burst_data_req),
    .WR_FIFO_EMPTY  (1'b0),
    .WR_FIFO_AEMPTY (1'b0),
    .WR_FIFO_DATA   (wr_burst_data),
    .WR_DONE        (wr_burst_finish),
    .RD_START       (rd_burst_req),
    .RD_ADRS        ({rd_burst_addr, 3'd0}),
    .RD_LEN         ({rd_burst_len,  3'd0}),
    .RD_READY       (),
    .RD_FIFO_WE     (rd_burst_data_valid),
    .RD_FIFO_FULL   (1'b0),
    .RD_FIFO_AFULL  (1'b0),
    .RD_FIFO_DATA   (rd_burst_data),
    .RD_DONE        (rd_burst_finish),
    .DEBUG          ()
);
//axi master

ddr3 u_ddr3 (
    .ddr3_addr           (ddr3_addr),
    .ddr3_ba             (ddr3_ba),
    .ddr3_cas_n          (ddr3_cas_n),
    .ddr3_ck_n           (ddr3_ck_n),
    .ddr3_ck_p           (ddr3_ck_p),
    .ddr3_cke            (ddr3_cke),
    .ddr3_ras_n          (ddr3_ras_n),
    .ddr3_reset_n        (ddr3_reset_n),
    .ddr3_we_n           (ddr3_we_n),
    .ddr3_dq             (ddr3_dq),
    .ddr3_dqs_n          (ddr3_dqs_n),
    .ddr3_dqs_p          (ddr3_dqs_p),
    .init_calib_complete (init_calib_complete),
    .ddr3_cs_n           (ddr3_cs_n),
    .ddr3_dm             (ddr3_dm),
    .ddr3_odt            (ddr3_odt),
    .ui_clk              (ui_clk),
    .ui_clk_sync_rst     (ui_clk_sync_rst),
    .mmcm_locked         (),
    .aresetn             (1'b1),
    .app_sr_req          (1'b0),
    .app_ref_req         (1'b0),
    .app_zq_req          (1'b0),
    .app_sr_active       (),
    .app_ref_ack         (),
    .app_zq_ack          (),
    .s_axi_awid          (s00_axi_awid),
    .s_axi_awaddr        (s00_axi_awaddr),
    .s_axi_awlen         (s00_axi_awlen),
    .s_axi_awsize        (s00_axi_awsize),
    .s_axi_awburst       (s00_axi_awburst),
    .s_axi_awlock        (s00_axi_awlock),
    .s_axi_awcache       (s00_axi_awcache),
    .s_axi_awprot        (s00_axi_awprot),
    .s_axi_awqos         (s00_axi_awqos),
    .s_axi_awvalid       (s00_axi_awvalid),
    .s_axi_awready       (s00_axi_awready),
    .s_axi_wdata         (s00_axi_wdata),
    .s_axi_wstrb         (s00_axi_wstrb),
    .s_axi_wlast         (s00_axi_wlast),
    .s_axi_wvalid        (s00_axi_wvalid),
    .s_axi_wready        (s00_axi_wready),
    .s_axi_bid           (s00_axi_bid),
    .s_axi_bresp         (s00_axi_bresp),
    .s_axi_bvalid        (s00_axi_bvalid),
    .s_axi_bready        (s00_axi_bready),
    .s_axi_arid          (s00_axi_arid),
    .s_axi_araddr        (s00_axi_araddr),
    .s_axi_arlen         (s00_axi_arlen),
    .s_axi_arsize        (s00_axi_arsize),
    .s_axi_arburst       (s00_axi_arburst),
    .s_axi_arlock        (s00_axi_arlock),
    .s_axi_arcache       (s00_axi_arcache),
    .s_axi_arprot        (s00_axi_arprot),
    .s_axi_arqos         (s00_axi_arqos),
    .s_axi_arvalid       (s00_axi_arvalid),
    .s_axi_arready       (s00_axi_arready),
    .s_axi_rid           (s00_axi_rid),
    .s_axi_rdata         (s00_axi_rdata),
    .s_axi_rresp         (s00_axi_rresp),
    .s_axi_rlast         (s00_axi_rlast),
    .s_axi_rvalid        (s00_axi_rvalid),
    .s_axi_rready        (s00_axi_rready),
    .sys_clk_i           (clk_200MHz),
    .sys_rst             (rst_n)
);

assign led[0] = ~init_calib_complete;  // aprins = DDR3 calibrat
assign led[1] = ~m_axis_tvalid;        // aprins = vin date de la camera
assign led[2] = ~de;                   // aprins = video timing ok
assign led[3] = ~fog_de;               // aprins = ar trebui sa mearga filtrul
//debug

endmodule
