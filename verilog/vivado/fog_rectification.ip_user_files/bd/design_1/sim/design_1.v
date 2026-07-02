//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Sat May 23 14:21:59 2026
//Host        : DESKTOP-9LEFS2P running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (dphy_clk_200M,
    m_axis_tdata,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tuser,
    m_axis_tvalid,
    mipi_phy_if_clk_hs_n,
    mipi_phy_if_clk_hs_p,
    mipi_phy_if_clk_lp_n,
    mipi_phy_if_clk_lp_p,
    mipi_phy_if_data_hs_n,
    mipi_phy_if_data_hs_p,
    mipi_phy_if_data_lp_n,
    mipi_phy_if_data_lp_p,
    video_aclk,
    video_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DPHY_CLK_200M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DPHY_CLK_200M, CLK_DOMAIN design_1_dphy_clk_200M, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input dphy_clk_200M;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, CLK_DOMAIN design_1_video_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) output [15:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *) output [0:0]m_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_HS_N" *) (* X_INTERFACE_MODE = "Slave" *) input mipi_phy_if_clk_hs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_HS_P" *) input mipi_phy_if_clk_hs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_LP_N" *) input mipi_phy_if_clk_lp_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_LP_P" *) input mipi_phy_if_clk_lp_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_HS_N" *) input [1:0]mipi_phy_if_data_hs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_HS_P" *) input [1:0]mipi_phy_if_data_hs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_LP_N" *) input [1:0]mipi_phy_if_data_lp_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_LP_P" *) input [1:0]mipi_phy_if_data_lp_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_ACLK, ASSOCIATED_BUSIF m_axis, ASSOCIATED_RESET video_aresetn, CLK_DOMAIN design_1_video_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input video_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.VIDEO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.VIDEO_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input video_aresetn;

  wire [31:0]AXI_BayerToRGB_0_AXI_Stream_Master_TDATA;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TLAST;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TREADY;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TUSER;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TVALID;
  wire dphy_clk_200M;
  wire [15:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [39:0]mipi_csi2_rx_subsystem_0_video_out_TDATA;
  wire mipi_csi2_rx_subsystem_0_video_out_TLAST;
  wire mipi_csi2_rx_subsystem_0_video_out_TREADY;
  wire [0:0]mipi_csi2_rx_subsystem_0_video_out_TUSER;
  wire mipi_csi2_rx_subsystem_0_video_out_TVALID;
  wire mipi_phy_if_clk_hs_n;
  wire mipi_phy_if_clk_hs_p;
  wire mipi_phy_if_clk_lp_n;
  wire mipi_phy_if_clk_lp_p;
  wire [1:0]mipi_phy_if_data_hs_n;
  wire [1:0]mipi_phy_if_data_hs_p;
  wire [1:0]mipi_phy_if_data_lp_n;
  wire [1:0]mipi_phy_if_data_lp_p;
  wire pixel_counter_0_flag;
  wire [31:0]pixel_counter_0_hsync_cnt;
  wire [39:0]pixel_counter_0_m_axis_TDATA;
  wire pixel_counter_0_m_axis_TLAST;
  wire pixel_counter_0_m_axis_TREADY;
  wire pixel_counter_0_m_axis_TUSER;
  wire pixel_counter_0_m_axis_TVALID;
  wire [31:0]pixel_counter_0_tuser_cnt;
  wire [31:0]pixel_counter_0_vsync_cnt;
  wire video_aclk_1;
  wire video_aresetn_1;
  wire [0:0]xlconstant_0_dout;

  assign video_aclk_1 = video_aclk;
  assign video_aresetn_1 = video_aresetn;
  design_1_AXI_BayerToRGB_0_2 AXI_BayerToRGB_0
       (.StreamClk(video_aclk_1),
        .m_axis_video_tdata(AXI_BayerToRGB_0_AXI_Stream_Master_TDATA),
        .m_axis_video_tlast(AXI_BayerToRGB_0_AXI_Stream_Master_TLAST),
        .m_axis_video_tready(AXI_BayerToRGB_0_AXI_Stream_Master_TREADY),
        .m_axis_video_tuser(AXI_BayerToRGB_0_AXI_Stream_Master_TUSER),
        .m_axis_video_tvalid(AXI_BayerToRGB_0_AXI_Stream_Master_TVALID),
        .sStreamReset_n(video_aresetn_1),
        .s_axis_video_tdata(pixel_counter_0_m_axis_TDATA),
        .s_axis_video_tlast(pixel_counter_0_m_axis_TLAST),
        .s_axis_video_tready(pixel_counter_0_m_axis_TREADY),
        .s_axis_video_tuser(pixel_counter_0_m_axis_TUSER),
        .s_axis_video_tvalid(pixel_counter_0_m_axis_TVALID));
  design_1_axis_subset_converter_0_0 axis_subset_converter_0
       (.aclk(video_aclk_1),
        .aresetn(video_aresetn_1),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(AXI_BayerToRGB_0_AXI_Stream_Master_TDATA),
        .s_axis_tlast(AXI_BayerToRGB_0_AXI_Stream_Master_TLAST),
        .s_axis_tready(AXI_BayerToRGB_0_AXI_Stream_Master_TREADY),
        .s_axis_tuser(AXI_BayerToRGB_0_AXI_Stream_Master_TUSER),
        .s_axis_tvalid(AXI_BayerToRGB_0_AXI_Stream_Master_TVALID));
  design_1_mipi_csi2_rx_subsystem_0_0 mipi_csi2_rx_subsystem_0
       (.csirxss_s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .csirxss_s_axi_arvalid(1'b0),
        .csirxss_s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .csirxss_s_axi_awvalid(1'b0),
        .csirxss_s_axi_bready(1'b0),
        .csirxss_s_axi_rready(1'b0),
        .csirxss_s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .csirxss_s_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .csirxss_s_axi_wvalid(1'b0),
        .dphy_clk_200M(dphy_clk_200M),
        .lite_aclk(video_aclk_1),
        .lite_aresetn(xlconstant_0_dout),
        .mipi_phy_if_clk_hs_n(mipi_phy_if_clk_hs_n),
        .mipi_phy_if_clk_hs_p(mipi_phy_if_clk_hs_p),
        .mipi_phy_if_clk_lp_n(mipi_phy_if_clk_lp_n),
        .mipi_phy_if_clk_lp_p(mipi_phy_if_clk_lp_p),
        .mipi_phy_if_data_hs_n(mipi_phy_if_data_hs_n),
        .mipi_phy_if_data_hs_p(mipi_phy_if_data_hs_p),
        .mipi_phy_if_data_lp_n(mipi_phy_if_data_lp_n),
        .mipi_phy_if_data_lp_p(mipi_phy_if_data_lp_p),
        .video_aclk(video_aclk_1),
        .video_aresetn(xlconstant_0_dout),
        .video_out_tdata(mipi_csi2_rx_subsystem_0_video_out_TDATA),
        .video_out_tlast(mipi_csi2_rx_subsystem_0_video_out_TLAST),
        .video_out_tready(mipi_csi2_rx_subsystem_0_video_out_TREADY),
        .video_out_tuser(mipi_csi2_rx_subsystem_0_video_out_TUSER),
        .video_out_tvalid(mipi_csi2_rx_subsystem_0_video_out_TVALID));
  design_1_pixel_counter_0_0 pixel_counter_0
       (.aclk(video_aclk_1),
        .aresetn(video_aresetn_1),
        .flag(pixel_counter_0_flag),
        .hsync_cnt(pixel_counter_0_hsync_cnt),
        .m_axis_tdata(pixel_counter_0_m_axis_TDATA),
        .m_axis_tlast(pixel_counter_0_m_axis_TLAST),
        .m_axis_tready(pixel_counter_0_m_axis_TREADY),
        .m_axis_tuser(pixel_counter_0_m_axis_TUSER),
        .m_axis_tvalid(pixel_counter_0_m_axis_TVALID),
        .s_axis_tdata(mipi_csi2_rx_subsystem_0_video_out_TDATA),
        .s_axis_tlast(mipi_csi2_rx_subsystem_0_video_out_TLAST),
        .s_axis_tready(mipi_csi2_rx_subsystem_0_video_out_TREADY),
        .s_axis_tuser(mipi_csi2_rx_subsystem_0_video_out_TUSER),
        .s_axis_tvalid(mipi_csi2_rx_subsystem_0_video_out_TVALID),
        .tuser_cnt(pixel_counter_0_tuser_cnt),
        .vsync_cnt(pixel_counter_0_vsync_cnt));
  design_1_system_ila_0_0 system_ila_0
       (.SLOT_0_AXIS_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(1'b1),
        .SLOT_0_AXIS_tvalid(1'b0),
        .clk(video_aclk_1),
        .probe0(pixel_counter_0_hsync_cnt),
        .probe1(pixel_counter_0_vsync_cnt),
        .probe2(pixel_counter_0_tuser_cnt),
        .probe3(pixel_counter_0_flag),
        .resetn(video_aresetn_1));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
