//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Tue Jun  3 14:42:14 2025
//Host        : DESKTOP-AOVMD3L running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (RefClk,
    aRst,
    dphy_clk_lp_n,
    dphy_clk_lp_p,
    dphy_data_hs_n,
    dphy_data_hs_p,
    dphy_data_lp_n,
    dphy_data_lp_p,
    dphy_hs_clock_clk_n,
    dphy_hs_clock_clk_p,
    m_axis_tdata,
    m_axis_tlast,
    m_axis_tready,
    m_axis_tuser,
    m_axis_tvalid,
    video_aclk,
    video_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.REFCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.REFCLK, ASSOCIATED_RESET aRst, CLK_DOMAIN design_1_RefClk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input RefClk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARST, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aRst;
  input dphy_clk_lp_n;
  input dphy_clk_lp_p;
  input [1:0]dphy_data_hs_n;
  input [1:0]dphy_data_hs_p;
  input [1:0]dphy_data_lp_n;
  input [1:0]dphy_data_lp_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dphy_hs_clock CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dphy_hs_clock, CAN_DEBUG false, FREQ_HZ 100000000" *) input dphy_hs_clock_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dphy_hs_clock CLK_P" *) input dphy_hs_clock_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, CLK_DOMAIN design_1_video_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) output [15:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *) output [0:0]m_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_ACLK, ASSOCIATED_BUSIF m_axis, ASSOCIATED_RESET video_aresetn, CLK_DOMAIN design_1_video_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input video_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.VIDEO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.VIDEO_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input video_aresetn;

  wire [31:0]AXI_BayerToRGB_0_AXI_Stream_Master_TDATA;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TLAST;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TREADY;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TUSER;
  wire AXI_BayerToRGB_0_AXI_Stream_Master_TVALID;
  (* CONN_BUS_INFO = "MIPI_CSI_2_RX_0_m_axis_video xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [39:0]MIPI_CSI_2_RX_0_m_axis_video_TDATA;
  (* CONN_BUS_INFO = "MIPI_CSI_2_RX_0_m_axis_video xilinx.com:interface:axis:1.0 None TLAST" *) (* DONT_TOUCH *) wire MIPI_CSI_2_RX_0_m_axis_video_TLAST;
  (* CONN_BUS_INFO = "MIPI_CSI_2_RX_0_m_axis_video xilinx.com:interface:axis:1.0 None TUSER" *) (* DONT_TOUCH *) wire [0:0]MIPI_CSI_2_RX_0_m_axis_video_TUSER;
  (* CONN_BUS_INFO = "MIPI_CSI_2_RX_0_m_axis_video xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire MIPI_CSI_2_RX_0_m_axis_video_TVALID;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_CL_ENABLE;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_CL_RXCLKACTIVEHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_CL_STOPSTATE;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_ENABLE;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXACTIVEHS;
  wire [7:0]MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXDATAHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXSYNCHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXVALIDHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_ENABLE;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXACTIVEHS;
  wire [7:0]MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXDATAHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXSYNCHS;
  wire MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXVALIDHS;
  wire MIPI_D_PHY_RX_0_RxByteClkHS;
  wire RefClk_1;
  wire aRst_1;
  wire [15:0]axis_subset_converter_0_M_AXIS_TDATA;
  wire axis_subset_converter_0_M_AXIS_TLAST;
  wire axis_subset_converter_0_M_AXIS_TREADY;
  wire [0:0]axis_subset_converter_0_M_AXIS_TUSER;
  wire axis_subset_converter_0_M_AXIS_TVALID;
  wire dphy_clk_lp_n_1;
  wire dphy_clk_lp_p_1;
  wire [1:0]dphy_data_hs_n_1;
  wire [1:0]dphy_data_hs_p_1;
  wire [1:0]dphy_data_lp_n_1;
  wire [1:0]dphy_data_lp_p_1;
  wire dphy_hs_clock_1_CLK_N;
  wire dphy_hs_clock_1_CLK_P;
  wire [0:0]rst_video_aclk_100M_peripheral_aresetn;
  wire video_aclk_1;
  wire video_aresetn_1;

  assign RefClk_1 = RefClk;
  assign aRst_1 = aRst;
  assign axis_subset_converter_0_M_AXIS_TREADY = m_axis_tready;
  assign dphy_clk_lp_n_1 = dphy_clk_lp_n;
  assign dphy_clk_lp_p_1 = dphy_clk_lp_p;
  assign dphy_data_hs_n_1 = dphy_data_hs_n[1:0];
  assign dphy_data_hs_p_1 = dphy_data_hs_p[1:0];
  assign dphy_data_lp_n_1 = dphy_data_lp_n[1:0];
  assign dphy_data_lp_p_1 = dphy_data_lp_p[1:0];
  assign dphy_hs_clock_1_CLK_N = dphy_hs_clock_clk_n;
  assign dphy_hs_clock_1_CLK_P = dphy_hs_clock_clk_p;
  assign m_axis_tdata[15:0] = axis_subset_converter_0_M_AXIS_TDATA;
  assign m_axis_tlast = axis_subset_converter_0_M_AXIS_TLAST;
  assign m_axis_tuser[0] = axis_subset_converter_0_M_AXIS_TUSER;
  assign m_axis_tvalid = axis_subset_converter_0_M_AXIS_TVALID;
  assign video_aclk_1 = video_aclk;
  assign video_aresetn_1 = video_aresetn;
  design_1_AXI_BayerToRGB_0_0 AXI_BayerToRGB_0
       (.StreamClk(video_aclk_1),
        .m_axis_video_tdata(AXI_BayerToRGB_0_AXI_Stream_Master_TDATA),
        .m_axis_video_tlast(AXI_BayerToRGB_0_AXI_Stream_Master_TLAST),
        .m_axis_video_tready(AXI_BayerToRGB_0_AXI_Stream_Master_TREADY),
        .m_axis_video_tuser(AXI_BayerToRGB_0_AXI_Stream_Master_TUSER),
        .m_axis_video_tvalid(AXI_BayerToRGB_0_AXI_Stream_Master_TVALID),
        .sStreamReset_n(video_aresetn_1),
        .s_axis_video_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_video_tlast(1'b0),
        .s_axis_video_tuser(1'b0),
        .s_axis_video_tvalid(1'b0));
  design_1_MIPI_CSI_2_RX_0_0 MIPI_CSI_2_RX_0
       (.RxActiveHSD0(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXACTIVEHS),
        .RxActiveHSD1(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXACTIVEHS),
        .RxActiveHSD2(1'b0),
        .RxActiveHSD3(1'b0),
        .RxByteClkHS(MIPI_D_PHY_RX_0_RxByteClkHS),
        .RxDataHSD0(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXDATAHS),
        .RxDataHSD1(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXDATAHS),
        .RxDataHSD2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RxDataHSD3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RxSyncHSD0(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXSYNCHS),
        .RxSyncHSD1(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXSYNCHS),
        .RxSyncHSD2(1'b0),
        .RxSyncHSD3(1'b0),
        .RxValidHSD0(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXVALIDHS),
        .RxValidHSD1(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXVALIDHS),
        .RxValidHSD2(1'b0),
        .RxValidHSD3(1'b0),
        .aClkEnable(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_ENABLE),
        .aClkStopstate(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_STOPSTATE),
        .aD0Enable(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_ENABLE),
        .aD1Enable(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_ENABLE),
        .aRxClkActiveHS(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_RXCLKACTIVEHS),
        .m_axis_video_tdata(MIPI_CSI_2_RX_0_m_axis_video_TDATA),
        .m_axis_video_tlast(MIPI_CSI_2_RX_0_m_axis_video_TLAST),
        .m_axis_video_tready(1'b1),
        .m_axis_video_tuser(MIPI_CSI_2_RX_0_m_axis_video_TUSER),
        .m_axis_video_tvalid(MIPI_CSI_2_RX_0_m_axis_video_TVALID),
        .video_aclk(video_aclk_1),
        .video_aresetn(video_aresetn_1));
  design_1_MIPI_D_PHY_RX_0_0 MIPI_D_PHY_RX_0
       (.RefClk(RefClk_1),
        .RxByteClkHS(MIPI_D_PHY_RX_0_RxByteClkHS),
        .aClkEnable(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_ENABLE),
        .aClkForceRxmode(1'b0),
        .aClkStopstate(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_STOPSTATE),
        .aD0Enable(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_ENABLE),
        .aD0ForceRxmode(1'b0),
        .aD1Enable(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_ENABLE),
        .aD1ForceRxmode(1'b0),
        .aRst(aRst_1),
        .aRxClkActiveHS(MIPI_D_PHY_RX_0_D_PHY_PPI_CL_RXCLKACTIVEHS),
        .dphy_clk_hs_n(dphy_hs_clock_1_CLK_N),
        .dphy_clk_hs_p(dphy_hs_clock_1_CLK_P),
        .dphy_clk_lp_n(dphy_clk_lp_n_1),
        .dphy_clk_lp_p(dphy_clk_lp_p_1),
        .dphy_data_hs_n(dphy_data_hs_n_1),
        .dphy_data_hs_p(dphy_data_hs_p_1),
        .dphy_data_lp_n(dphy_data_lp_n_1),
        .dphy_data_lp_p(dphy_data_lp_p_1),
        .rbD0RxActiveHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXACTIVEHS),
        .rbD0RxDataHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXDATAHS),
        .rbD0RxSyncHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXSYNCHS),
        .rbD0RxValidHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL0_RXVALIDHS),
        .rbD1RxActiveHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXACTIVEHS),
        .rbD1RxDataHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXDATAHS),
        .rbD1RxSyncHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXSYNCHS),
        .rbD1RxValidHS(MIPI_D_PHY_RX_0_D_PHY_PPI_DL1_RXVALIDHS));
  design_1_axis_subset_converter_0_0 axis_subset_converter_0
       (.aclk(video_aclk_1),
        .aresetn(video_aresetn_1),
        .m_axis_tdata(axis_subset_converter_0_M_AXIS_TDATA),
        .m_axis_tlast(axis_subset_converter_0_M_AXIS_TLAST),
        .m_axis_tready(axis_subset_converter_0_M_AXIS_TREADY),
        .m_axis_tuser(axis_subset_converter_0_M_AXIS_TUSER),
        .m_axis_tvalid(axis_subset_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(AXI_BayerToRGB_0_AXI_Stream_Master_TDATA),
        .s_axis_tlast(AXI_BayerToRGB_0_AXI_Stream_Master_TLAST),
        .s_axis_tready(AXI_BayerToRGB_0_AXI_Stream_Master_TREADY),
        .s_axis_tuser(AXI_BayerToRGB_0_AXI_Stream_Master_TUSER),
        .s_axis_tvalid(AXI_BayerToRGB_0_AXI_Stream_Master_TVALID));
  design_1_rst_video_aclk_100M_0 rst_video_aclk_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(1'b0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_video_aclk_100M_peripheral_aresetn),
        .slowest_sync_clk(video_aclk_1));
  design_1_system_ila_0_1 system_ila_0
       (.SLOT_0_AXIS_tdata(MIPI_CSI_2_RX_0_m_axis_video_TDATA),
        .SLOT_0_AXIS_tlast(MIPI_CSI_2_RX_0_m_axis_video_TLAST),
        .SLOT_0_AXIS_tready(1'b1),
        .SLOT_0_AXIS_tuser(MIPI_CSI_2_RX_0_m_axis_video_TUSER),
        .SLOT_0_AXIS_tvalid(MIPI_CSI_2_RX_0_m_axis_video_TVALID),
        .clk(video_aclk_1),
        .resetn(rst_video_aclk_100M_peripheral_aresetn));
endmodule
