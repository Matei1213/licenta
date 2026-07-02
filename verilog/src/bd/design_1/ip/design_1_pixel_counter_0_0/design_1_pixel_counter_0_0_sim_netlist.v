// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue May 19 23:00:29 2026
// Host        : DESKTOP-9LEFS2P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/facultate/licenta/fog_scratch2/src/bd/design_1/ip/design_1_pixel_counter_0_0/design_1_pixel_counter_0_0_sim_netlist.v
// Design      : design_1_pixel_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_pixel_counter_0_0,pixel_counter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "pixel_counter,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module design_1_pixel_counter_0_0
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tdata,
    s_axis_tuser,
    s_axis_tlast,
    s_axis_tready,
    m_axis_tvalid,
    m_axis_tdata,
    m_axis_tuser,
    m_axis_tlast,
    m_axis_tready,
    hsync_cnt,
    vsync_cnt,
    tuser_cnt,
    flag);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) input [39:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TUSER" *) input s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) output [39:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *) output m_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  output [31:0]hsync_cnt;
  output [31:0]vsync_cnt;
  output [31:0]tuser_cnt;
  output flag;

  wire aclk;
  wire aresetn;
  wire flag;
  wire [31:0]hsync_cnt;
  wire m_axis_tready;
  wire [39:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tuser;
  wire s_axis_tvalid;
  wire [31:0]tuser_cnt;
  wire [31:0]vsync_cnt;

  assign m_axis_tdata[39:0] = s_axis_tdata;
  assign m_axis_tlast = s_axis_tlast;
  assign m_axis_tuser = s_axis_tuser;
  assign m_axis_tvalid = s_axis_tvalid;
  assign s_axis_tready = m_axis_tready;
  design_1_pixel_counter_0_0_pixel_counter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .flag(flag),
        .hsync_cnt(hsync_cnt),
        .m_axis_tready(m_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .tuser_cnt(tuser_cnt),
        .vsync_cnt(vsync_cnt));
endmodule

(* ORIG_REF_NAME = "pixel_counter" *) 
module design_1_pixel_counter_0_0_pixel_counter
   (hsync_cnt,
    vsync_cnt,
    tuser_cnt,
    flag,
    aclk,
    s_axis_tvalid,
    m_axis_tready,
    s_axis_tlast,
    aresetn,
    s_axis_tuser);
  output [31:0]hsync_cnt;
  output [31:0]vsync_cnt;
  output [31:0]tuser_cnt;
  output flag;
  input aclk;
  input s_axis_tvalid;
  input m_axis_tready;
  input s_axis_tlast;
  input aresetn;
  input s_axis_tuser;

  wire aclk;
  wire aresetn;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire [26:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire flag;
  wire flag_i_1_n_0;
  wire flag_i_2_n_0;
  wire flag_i_3_n_0;
  wire flag_i_4_n_0;
  wire flag_i_5_n_0;
  wire flag_i_6_n_0;
  wire [31:0]hsync_cnt;
  wire hsync_cnt02_out;
  wire \hsync_cnt[31]_i_1_n_0 ;
  wire \hsync_cnt[3]_i_2_n_0 ;
  wire \hsync_cnt_reg[11]_i_1_n_0 ;
  wire \hsync_cnt_reg[11]_i_1_n_1 ;
  wire \hsync_cnt_reg[11]_i_1_n_2 ;
  wire \hsync_cnt_reg[11]_i_1_n_3 ;
  wire \hsync_cnt_reg[11]_i_1_n_4 ;
  wire \hsync_cnt_reg[11]_i_1_n_5 ;
  wire \hsync_cnt_reg[11]_i_1_n_6 ;
  wire \hsync_cnt_reg[11]_i_1_n_7 ;
  wire \hsync_cnt_reg[15]_i_1_n_0 ;
  wire \hsync_cnt_reg[15]_i_1_n_1 ;
  wire \hsync_cnt_reg[15]_i_1_n_2 ;
  wire \hsync_cnt_reg[15]_i_1_n_3 ;
  wire \hsync_cnt_reg[15]_i_1_n_4 ;
  wire \hsync_cnt_reg[15]_i_1_n_5 ;
  wire \hsync_cnt_reg[15]_i_1_n_6 ;
  wire \hsync_cnt_reg[15]_i_1_n_7 ;
  wire \hsync_cnt_reg[19]_i_1_n_0 ;
  wire \hsync_cnt_reg[19]_i_1_n_1 ;
  wire \hsync_cnt_reg[19]_i_1_n_2 ;
  wire \hsync_cnt_reg[19]_i_1_n_3 ;
  wire \hsync_cnt_reg[19]_i_1_n_4 ;
  wire \hsync_cnt_reg[19]_i_1_n_5 ;
  wire \hsync_cnt_reg[19]_i_1_n_6 ;
  wire \hsync_cnt_reg[19]_i_1_n_7 ;
  wire \hsync_cnt_reg[23]_i_1_n_0 ;
  wire \hsync_cnt_reg[23]_i_1_n_1 ;
  wire \hsync_cnt_reg[23]_i_1_n_2 ;
  wire \hsync_cnt_reg[23]_i_1_n_3 ;
  wire \hsync_cnt_reg[23]_i_1_n_4 ;
  wire \hsync_cnt_reg[23]_i_1_n_5 ;
  wire \hsync_cnt_reg[23]_i_1_n_6 ;
  wire \hsync_cnt_reg[23]_i_1_n_7 ;
  wire \hsync_cnt_reg[27]_i_1_n_0 ;
  wire \hsync_cnt_reg[27]_i_1_n_1 ;
  wire \hsync_cnt_reg[27]_i_1_n_2 ;
  wire \hsync_cnt_reg[27]_i_1_n_3 ;
  wire \hsync_cnt_reg[27]_i_1_n_4 ;
  wire \hsync_cnt_reg[27]_i_1_n_5 ;
  wire \hsync_cnt_reg[27]_i_1_n_6 ;
  wire \hsync_cnt_reg[27]_i_1_n_7 ;
  wire \hsync_cnt_reg[31]_i_3_n_1 ;
  wire \hsync_cnt_reg[31]_i_3_n_2 ;
  wire \hsync_cnt_reg[31]_i_3_n_3 ;
  wire \hsync_cnt_reg[31]_i_3_n_4 ;
  wire \hsync_cnt_reg[31]_i_3_n_5 ;
  wire \hsync_cnt_reg[31]_i_3_n_6 ;
  wire \hsync_cnt_reg[31]_i_3_n_7 ;
  wire \hsync_cnt_reg[3]_i_1_n_0 ;
  wire \hsync_cnt_reg[3]_i_1_n_1 ;
  wire \hsync_cnt_reg[3]_i_1_n_2 ;
  wire \hsync_cnt_reg[3]_i_1_n_3 ;
  wire \hsync_cnt_reg[3]_i_1_n_4 ;
  wire \hsync_cnt_reg[3]_i_1_n_5 ;
  wire \hsync_cnt_reg[3]_i_1_n_6 ;
  wire \hsync_cnt_reg[3]_i_1_n_7 ;
  wire \hsync_cnt_reg[7]_i_1_n_0 ;
  wire \hsync_cnt_reg[7]_i_1_n_1 ;
  wire \hsync_cnt_reg[7]_i_1_n_2 ;
  wire \hsync_cnt_reg[7]_i_1_n_3 ;
  wire \hsync_cnt_reg[7]_i_1_n_4 ;
  wire \hsync_cnt_reg[7]_i_1_n_5 ;
  wire \hsync_cnt_reg[7]_i_1_n_6 ;
  wire \hsync_cnt_reg[7]_i_1_n_7 ;
  wire m_axis_tready;
  wire s_axis_tlast;
  wire s_axis_tuser;
  wire s_axis_tvalid;
  wire [31:0]tuser_cnt;
  wire \tuser_cnt[31]_i_1_n_0 ;
  wire \tuser_cnt[3]_i_2_n_0 ;
  wire \tuser_cnt_reg[11]_i_1_n_0 ;
  wire \tuser_cnt_reg[11]_i_1_n_1 ;
  wire \tuser_cnt_reg[11]_i_1_n_2 ;
  wire \tuser_cnt_reg[11]_i_1_n_3 ;
  wire \tuser_cnt_reg[11]_i_1_n_4 ;
  wire \tuser_cnt_reg[11]_i_1_n_5 ;
  wire \tuser_cnt_reg[11]_i_1_n_6 ;
  wire \tuser_cnt_reg[11]_i_1_n_7 ;
  wire \tuser_cnt_reg[15]_i_1_n_0 ;
  wire \tuser_cnt_reg[15]_i_1_n_1 ;
  wire \tuser_cnt_reg[15]_i_1_n_2 ;
  wire \tuser_cnt_reg[15]_i_1_n_3 ;
  wire \tuser_cnt_reg[15]_i_1_n_4 ;
  wire \tuser_cnt_reg[15]_i_1_n_5 ;
  wire \tuser_cnt_reg[15]_i_1_n_6 ;
  wire \tuser_cnt_reg[15]_i_1_n_7 ;
  wire \tuser_cnt_reg[19]_i_1_n_0 ;
  wire \tuser_cnt_reg[19]_i_1_n_1 ;
  wire \tuser_cnt_reg[19]_i_1_n_2 ;
  wire \tuser_cnt_reg[19]_i_1_n_3 ;
  wire \tuser_cnt_reg[19]_i_1_n_4 ;
  wire \tuser_cnt_reg[19]_i_1_n_5 ;
  wire \tuser_cnt_reg[19]_i_1_n_6 ;
  wire \tuser_cnt_reg[19]_i_1_n_7 ;
  wire \tuser_cnt_reg[23]_i_1_n_0 ;
  wire \tuser_cnt_reg[23]_i_1_n_1 ;
  wire \tuser_cnt_reg[23]_i_1_n_2 ;
  wire \tuser_cnt_reg[23]_i_1_n_3 ;
  wire \tuser_cnt_reg[23]_i_1_n_4 ;
  wire \tuser_cnt_reg[23]_i_1_n_5 ;
  wire \tuser_cnt_reg[23]_i_1_n_6 ;
  wire \tuser_cnt_reg[23]_i_1_n_7 ;
  wire \tuser_cnt_reg[27]_i_1_n_0 ;
  wire \tuser_cnt_reg[27]_i_1_n_1 ;
  wire \tuser_cnt_reg[27]_i_1_n_2 ;
  wire \tuser_cnt_reg[27]_i_1_n_3 ;
  wire \tuser_cnt_reg[27]_i_1_n_4 ;
  wire \tuser_cnt_reg[27]_i_1_n_5 ;
  wire \tuser_cnt_reg[27]_i_1_n_6 ;
  wire \tuser_cnt_reg[27]_i_1_n_7 ;
  wire \tuser_cnt_reg[31]_i_3_n_1 ;
  wire \tuser_cnt_reg[31]_i_3_n_2 ;
  wire \tuser_cnt_reg[31]_i_3_n_3 ;
  wire \tuser_cnt_reg[31]_i_3_n_4 ;
  wire \tuser_cnt_reg[31]_i_3_n_5 ;
  wire \tuser_cnt_reg[31]_i_3_n_6 ;
  wire \tuser_cnt_reg[31]_i_3_n_7 ;
  wire \tuser_cnt_reg[3]_i_1_n_0 ;
  wire \tuser_cnt_reg[3]_i_1_n_1 ;
  wire \tuser_cnt_reg[3]_i_1_n_2 ;
  wire \tuser_cnt_reg[3]_i_1_n_3 ;
  wire \tuser_cnt_reg[3]_i_1_n_4 ;
  wire \tuser_cnt_reg[3]_i_1_n_5 ;
  wire \tuser_cnt_reg[3]_i_1_n_6 ;
  wire \tuser_cnt_reg[3]_i_1_n_7 ;
  wire \tuser_cnt_reg[7]_i_1_n_0 ;
  wire \tuser_cnt_reg[7]_i_1_n_1 ;
  wire \tuser_cnt_reg[7]_i_1_n_2 ;
  wire \tuser_cnt_reg[7]_i_1_n_3 ;
  wire \tuser_cnt_reg[7]_i_1_n_4 ;
  wire \tuser_cnt_reg[7]_i_1_n_5 ;
  wire \tuser_cnt_reg[7]_i_1_n_6 ;
  wire \tuser_cnt_reg[7]_i_1_n_7 ;
  wire [31:0]vsync_cnt;
  wire vsync_cnt0;
  wire \vsync_cnt[31]_i_1_n_0 ;
  wire \vsync_cnt[31]_i_2_n_0 ;
  wire \vsync_cnt[3]_i_2_n_0 ;
  wire \vsync_cnt_reg[11]_i_1_n_0 ;
  wire \vsync_cnt_reg[11]_i_1_n_1 ;
  wire \vsync_cnt_reg[11]_i_1_n_2 ;
  wire \vsync_cnt_reg[11]_i_1_n_3 ;
  wire \vsync_cnt_reg[11]_i_1_n_4 ;
  wire \vsync_cnt_reg[11]_i_1_n_5 ;
  wire \vsync_cnt_reg[11]_i_1_n_6 ;
  wire \vsync_cnt_reg[11]_i_1_n_7 ;
  wire \vsync_cnt_reg[15]_i_1_n_0 ;
  wire \vsync_cnt_reg[15]_i_1_n_1 ;
  wire \vsync_cnt_reg[15]_i_1_n_2 ;
  wire \vsync_cnt_reg[15]_i_1_n_3 ;
  wire \vsync_cnt_reg[15]_i_1_n_4 ;
  wire \vsync_cnt_reg[15]_i_1_n_5 ;
  wire \vsync_cnt_reg[15]_i_1_n_6 ;
  wire \vsync_cnt_reg[15]_i_1_n_7 ;
  wire \vsync_cnt_reg[19]_i_1_n_0 ;
  wire \vsync_cnt_reg[19]_i_1_n_1 ;
  wire \vsync_cnt_reg[19]_i_1_n_2 ;
  wire \vsync_cnt_reg[19]_i_1_n_3 ;
  wire \vsync_cnt_reg[19]_i_1_n_4 ;
  wire \vsync_cnt_reg[19]_i_1_n_5 ;
  wire \vsync_cnt_reg[19]_i_1_n_6 ;
  wire \vsync_cnt_reg[19]_i_1_n_7 ;
  wire \vsync_cnt_reg[23]_i_1_n_0 ;
  wire \vsync_cnt_reg[23]_i_1_n_1 ;
  wire \vsync_cnt_reg[23]_i_1_n_2 ;
  wire \vsync_cnt_reg[23]_i_1_n_3 ;
  wire \vsync_cnt_reg[23]_i_1_n_4 ;
  wire \vsync_cnt_reg[23]_i_1_n_5 ;
  wire \vsync_cnt_reg[23]_i_1_n_6 ;
  wire \vsync_cnt_reg[23]_i_1_n_7 ;
  wire \vsync_cnt_reg[27]_i_1_n_0 ;
  wire \vsync_cnt_reg[27]_i_1_n_1 ;
  wire \vsync_cnt_reg[27]_i_1_n_2 ;
  wire \vsync_cnt_reg[27]_i_1_n_3 ;
  wire \vsync_cnt_reg[27]_i_1_n_4 ;
  wire \vsync_cnt_reg[27]_i_1_n_5 ;
  wire \vsync_cnt_reg[27]_i_1_n_6 ;
  wire \vsync_cnt_reg[27]_i_1_n_7 ;
  wire \vsync_cnt_reg[31]_i_3_n_1 ;
  wire \vsync_cnt_reg[31]_i_3_n_2 ;
  wire \vsync_cnt_reg[31]_i_3_n_3 ;
  wire \vsync_cnt_reg[31]_i_3_n_4 ;
  wire \vsync_cnt_reg[31]_i_3_n_5 ;
  wire \vsync_cnt_reg[31]_i_3_n_6 ;
  wire \vsync_cnt_reg[31]_i_3_n_7 ;
  wire \vsync_cnt_reg[3]_i_1_n_0 ;
  wire \vsync_cnt_reg[3]_i_1_n_1 ;
  wire \vsync_cnt_reg[3]_i_1_n_2 ;
  wire \vsync_cnt_reg[3]_i_1_n_3 ;
  wire \vsync_cnt_reg[3]_i_1_n_4 ;
  wire \vsync_cnt_reg[3]_i_1_n_5 ;
  wire \vsync_cnt_reg[3]_i_1_n_6 ;
  wire \vsync_cnt_reg[3]_i_1_n_7 ;
  wire \vsync_cnt_reg[7]_i_1_n_0 ;
  wire \vsync_cnt_reg[7]_i_1_n_1 ;
  wire \vsync_cnt_reg[7]_i_1_n_2 ;
  wire \vsync_cnt_reg[7]_i_1_n_3 ;
  wire \vsync_cnt_reg[7]_i_1_n_4 ;
  wire \vsync_cnt_reg[7]_i_1_n_5 ;
  wire \vsync_cnt_reg[7]_i_1_n_6 ;
  wire \vsync_cnt_reg[7]_i_1_n_7 ;
  wire [3:2]\NLW_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[24]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_hsync_cnt_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_tuser_cnt_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_vsync_cnt_reg[31]_i_3_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h80000000FFFFFFFF)) 
    \counter[0]_i_1 
       (.I0(flag_i_3_n_0),
        .I1(flag_i_4_n_0),
        .I2(flag_i_2_n_0),
        .I3(flag_i_6_n_0),
        .I4(\counter[0]_i_3_n_0 ),
        .I5(aresetn),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \counter[0]_i_3 
       (.I0(counter_reg[2]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .O(\counter[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_4 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_4_n_0 ));
  FDRE \counter_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_4_n_0 }));
  FDRE \counter_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[12] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[14] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[15] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[16] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[18] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[19] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[20] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[22] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[23] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[24] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\NLW_counter_reg[24]_i_1_CO_UNCONNECTED [3:2],\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[24]_i_1_O_UNCONNECTED [3],\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S({1'b0,counter_reg[26:24]}));
  FDRE \counter_reg[25] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[26] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE \counter_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    flag_i_1
       (.I0(flag_i_2_n_0),
        .I1(flag_i_3_n_0),
        .I2(flag_i_4_n_0),
        .I3(flag_i_5_n_0),
        .I4(flag_i_6_n_0),
        .O(flag_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    flag_i_2
       (.I0(counter_reg[18]),
        .I1(counter_reg[17]),
        .I2(counter_reg[15]),
        .I3(counter_reg[16]),
        .I4(counter_reg[20]),
        .I5(counter_reg[19]),
        .O(flag_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    flag_i_3
       (.I0(counter_reg[23]),
        .I1(counter_reg[24]),
        .I2(counter_reg[21]),
        .I3(counter_reg[22]),
        .I4(counter_reg[25]),
        .I5(counter_reg[26]),
        .O(flag_i_3_n_0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    flag_i_4
       (.I0(counter_reg[12]),
        .I1(counter_reg[11]),
        .I2(counter_reg[9]),
        .I3(counter_reg[10]),
        .I4(counter_reg[14]),
        .I5(counter_reg[13]),
        .O(flag_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    flag_i_5
       (.I0(counter_reg[0]),
        .I1(aresetn),
        .I2(counter_reg[2]),
        .I3(counter_reg[1]),
        .O(flag_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    flag_i_6
       (.I0(counter_reg[5]),
        .I1(counter_reg[6]),
        .I2(counter_reg[3]),
        .I3(counter_reg[4]),
        .I4(counter_reg[7]),
        .I5(counter_reg[8]),
        .O(flag_i_6_n_0));
  FDRE flag_reg
       (.C(aclk),
        .CE(1'b1),
        .D(flag_i_1_n_0),
        .Q(flag),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h80FF)) 
    \hsync_cnt[31]_i_1 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .I2(s_axis_tlast),
        .I3(aresetn),
        .O(\hsync_cnt[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \hsync_cnt[31]_i_2 
       (.I0(m_axis_tready),
        .I1(s_axis_tvalid),
        .O(hsync_cnt02_out));
  LUT1 #(
    .INIT(2'h1)) 
    \hsync_cnt[3]_i_2 
       (.I0(hsync_cnt[0]),
        .O(\hsync_cnt[3]_i_2_n_0 ));
  FDRE \hsync_cnt_reg[0] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[3]_i_1_n_7 ),
        .Q(hsync_cnt[0]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[10] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[11]_i_1_n_5 ),
        .Q(hsync_cnt[10]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[11] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[11]_i_1_n_4 ),
        .Q(hsync_cnt[11]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[11]_i_1 
       (.CI(\hsync_cnt_reg[7]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[11]_i_1_n_0 ,\hsync_cnt_reg[11]_i_1_n_1 ,\hsync_cnt_reg[11]_i_1_n_2 ,\hsync_cnt_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[11]_i_1_n_4 ,\hsync_cnt_reg[11]_i_1_n_5 ,\hsync_cnt_reg[11]_i_1_n_6 ,\hsync_cnt_reg[11]_i_1_n_7 }),
        .S(hsync_cnt[11:8]));
  FDRE \hsync_cnt_reg[12] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[15]_i_1_n_7 ),
        .Q(hsync_cnt[12]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[13] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[15]_i_1_n_6 ),
        .Q(hsync_cnt[13]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[14] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[15]_i_1_n_5 ),
        .Q(hsync_cnt[14]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[15] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[15]_i_1_n_4 ),
        .Q(hsync_cnt[15]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[15]_i_1 
       (.CI(\hsync_cnt_reg[11]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[15]_i_1_n_0 ,\hsync_cnt_reg[15]_i_1_n_1 ,\hsync_cnt_reg[15]_i_1_n_2 ,\hsync_cnt_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[15]_i_1_n_4 ,\hsync_cnt_reg[15]_i_1_n_5 ,\hsync_cnt_reg[15]_i_1_n_6 ,\hsync_cnt_reg[15]_i_1_n_7 }),
        .S(hsync_cnt[15:12]));
  FDRE \hsync_cnt_reg[16] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[19]_i_1_n_7 ),
        .Q(hsync_cnt[16]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[17] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[19]_i_1_n_6 ),
        .Q(hsync_cnt[17]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[18] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[19]_i_1_n_5 ),
        .Q(hsync_cnt[18]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[19] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[19]_i_1_n_4 ),
        .Q(hsync_cnt[19]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[19]_i_1 
       (.CI(\hsync_cnt_reg[15]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[19]_i_1_n_0 ,\hsync_cnt_reg[19]_i_1_n_1 ,\hsync_cnt_reg[19]_i_1_n_2 ,\hsync_cnt_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[19]_i_1_n_4 ,\hsync_cnt_reg[19]_i_1_n_5 ,\hsync_cnt_reg[19]_i_1_n_6 ,\hsync_cnt_reg[19]_i_1_n_7 }),
        .S(hsync_cnt[19:16]));
  FDRE \hsync_cnt_reg[1] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[3]_i_1_n_6 ),
        .Q(hsync_cnt[1]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[20] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[23]_i_1_n_7 ),
        .Q(hsync_cnt[20]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[21] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[23]_i_1_n_6 ),
        .Q(hsync_cnt[21]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[22] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[23]_i_1_n_5 ),
        .Q(hsync_cnt[22]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[23] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[23]_i_1_n_4 ),
        .Q(hsync_cnt[23]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[23]_i_1 
       (.CI(\hsync_cnt_reg[19]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[23]_i_1_n_0 ,\hsync_cnt_reg[23]_i_1_n_1 ,\hsync_cnt_reg[23]_i_1_n_2 ,\hsync_cnt_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[23]_i_1_n_4 ,\hsync_cnt_reg[23]_i_1_n_5 ,\hsync_cnt_reg[23]_i_1_n_6 ,\hsync_cnt_reg[23]_i_1_n_7 }),
        .S(hsync_cnt[23:20]));
  FDRE \hsync_cnt_reg[24] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[27]_i_1_n_7 ),
        .Q(hsync_cnt[24]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[25] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[27]_i_1_n_6 ),
        .Q(hsync_cnt[25]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[26] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[27]_i_1_n_5 ),
        .Q(hsync_cnt[26]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[27] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[27]_i_1_n_4 ),
        .Q(hsync_cnt[27]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[27]_i_1 
       (.CI(\hsync_cnt_reg[23]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[27]_i_1_n_0 ,\hsync_cnt_reg[27]_i_1_n_1 ,\hsync_cnt_reg[27]_i_1_n_2 ,\hsync_cnt_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[27]_i_1_n_4 ,\hsync_cnt_reg[27]_i_1_n_5 ,\hsync_cnt_reg[27]_i_1_n_6 ,\hsync_cnt_reg[27]_i_1_n_7 }),
        .S(hsync_cnt[27:24]));
  FDRE \hsync_cnt_reg[28] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[31]_i_3_n_7 ),
        .Q(hsync_cnt[28]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[29] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[31]_i_3_n_6 ),
        .Q(hsync_cnt[29]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[2] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[3]_i_1_n_5 ),
        .Q(hsync_cnt[2]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[30] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[31]_i_3_n_5 ),
        .Q(hsync_cnt[30]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[31] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[31]_i_3_n_4 ),
        .Q(hsync_cnt[31]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[31]_i_3 
       (.CI(\hsync_cnt_reg[27]_i_1_n_0 ),
        .CO({\NLW_hsync_cnt_reg[31]_i_3_CO_UNCONNECTED [3],\hsync_cnt_reg[31]_i_3_n_1 ,\hsync_cnt_reg[31]_i_3_n_2 ,\hsync_cnt_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[31]_i_3_n_4 ,\hsync_cnt_reg[31]_i_3_n_5 ,\hsync_cnt_reg[31]_i_3_n_6 ,\hsync_cnt_reg[31]_i_3_n_7 }),
        .S(hsync_cnt[31:28]));
  FDRE \hsync_cnt_reg[3] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[3]_i_1_n_4 ),
        .Q(hsync_cnt[3]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\hsync_cnt_reg[3]_i_1_n_0 ,\hsync_cnt_reg[3]_i_1_n_1 ,\hsync_cnt_reg[3]_i_1_n_2 ,\hsync_cnt_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\hsync_cnt_reg[3]_i_1_n_4 ,\hsync_cnt_reg[3]_i_1_n_5 ,\hsync_cnt_reg[3]_i_1_n_6 ,\hsync_cnt_reg[3]_i_1_n_7 }),
        .S({hsync_cnt[3:1],\hsync_cnt[3]_i_2_n_0 }));
  FDRE \hsync_cnt_reg[4] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[7]_i_1_n_7 ),
        .Q(hsync_cnt[4]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[5] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[7]_i_1_n_6 ),
        .Q(hsync_cnt[5]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[6] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[7]_i_1_n_5 ),
        .Q(hsync_cnt[6]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[7] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[7]_i_1_n_4 ),
        .Q(hsync_cnt[7]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \hsync_cnt_reg[7]_i_1 
       (.CI(\hsync_cnt_reg[3]_i_1_n_0 ),
        .CO({\hsync_cnt_reg[7]_i_1_n_0 ,\hsync_cnt_reg[7]_i_1_n_1 ,\hsync_cnt_reg[7]_i_1_n_2 ,\hsync_cnt_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hsync_cnt_reg[7]_i_1_n_4 ,\hsync_cnt_reg[7]_i_1_n_5 ,\hsync_cnt_reg[7]_i_1_n_6 ,\hsync_cnt_reg[7]_i_1_n_7 }),
        .S(hsync_cnt[7:4]));
  FDRE \hsync_cnt_reg[8] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[11]_i_1_n_7 ),
        .Q(hsync_cnt[8]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  FDRE \hsync_cnt_reg[9] 
       (.C(aclk),
        .CE(hsync_cnt02_out),
        .D(\hsync_cnt_reg[11]_i_1_n_6 ),
        .Q(hsync_cnt[9]),
        .R(\hsync_cnt[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AAAFFFF)) 
    \tuser_cnt[31]_i_1 
       (.I0(flag),
        .I1(m_axis_tready),
        .I2(s_axis_tvalid),
        .I3(s_axis_tuser),
        .I4(aresetn),
        .O(\tuser_cnt[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \tuser_cnt[31]_i_2 
       (.I0(s_axis_tuser),
        .I1(s_axis_tvalid),
        .I2(m_axis_tready),
        .O(vsync_cnt0));
  LUT1 #(
    .INIT(2'h1)) 
    \tuser_cnt[3]_i_2 
       (.I0(tuser_cnt[0]),
        .O(\tuser_cnt[3]_i_2_n_0 ));
  FDRE \tuser_cnt_reg[0] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[3]_i_1_n_7 ),
        .Q(tuser_cnt[0]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[10] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[11]_i_1_n_5 ),
        .Q(tuser_cnt[10]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[11] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[11]_i_1_n_4 ),
        .Q(tuser_cnt[11]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[11]_i_1 
       (.CI(\tuser_cnt_reg[7]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[11]_i_1_n_0 ,\tuser_cnt_reg[11]_i_1_n_1 ,\tuser_cnt_reg[11]_i_1_n_2 ,\tuser_cnt_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[11]_i_1_n_4 ,\tuser_cnt_reg[11]_i_1_n_5 ,\tuser_cnt_reg[11]_i_1_n_6 ,\tuser_cnt_reg[11]_i_1_n_7 }),
        .S(tuser_cnt[11:8]));
  FDRE \tuser_cnt_reg[12] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[15]_i_1_n_7 ),
        .Q(tuser_cnt[12]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[13] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[15]_i_1_n_6 ),
        .Q(tuser_cnt[13]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[14] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[15]_i_1_n_5 ),
        .Q(tuser_cnt[14]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[15] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[15]_i_1_n_4 ),
        .Q(tuser_cnt[15]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[15]_i_1 
       (.CI(\tuser_cnt_reg[11]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[15]_i_1_n_0 ,\tuser_cnt_reg[15]_i_1_n_1 ,\tuser_cnt_reg[15]_i_1_n_2 ,\tuser_cnt_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[15]_i_1_n_4 ,\tuser_cnt_reg[15]_i_1_n_5 ,\tuser_cnt_reg[15]_i_1_n_6 ,\tuser_cnt_reg[15]_i_1_n_7 }),
        .S(tuser_cnt[15:12]));
  FDRE \tuser_cnt_reg[16] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[19]_i_1_n_7 ),
        .Q(tuser_cnt[16]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[17] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[19]_i_1_n_6 ),
        .Q(tuser_cnt[17]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[18] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[19]_i_1_n_5 ),
        .Q(tuser_cnt[18]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[19] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[19]_i_1_n_4 ),
        .Q(tuser_cnt[19]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[19]_i_1 
       (.CI(\tuser_cnt_reg[15]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[19]_i_1_n_0 ,\tuser_cnt_reg[19]_i_1_n_1 ,\tuser_cnt_reg[19]_i_1_n_2 ,\tuser_cnt_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[19]_i_1_n_4 ,\tuser_cnt_reg[19]_i_1_n_5 ,\tuser_cnt_reg[19]_i_1_n_6 ,\tuser_cnt_reg[19]_i_1_n_7 }),
        .S(tuser_cnt[19:16]));
  FDRE \tuser_cnt_reg[1] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[3]_i_1_n_6 ),
        .Q(tuser_cnt[1]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[20] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[23]_i_1_n_7 ),
        .Q(tuser_cnt[20]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[21] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[23]_i_1_n_6 ),
        .Q(tuser_cnt[21]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[22] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[23]_i_1_n_5 ),
        .Q(tuser_cnt[22]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[23] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[23]_i_1_n_4 ),
        .Q(tuser_cnt[23]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[23]_i_1 
       (.CI(\tuser_cnt_reg[19]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[23]_i_1_n_0 ,\tuser_cnt_reg[23]_i_1_n_1 ,\tuser_cnt_reg[23]_i_1_n_2 ,\tuser_cnt_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[23]_i_1_n_4 ,\tuser_cnt_reg[23]_i_1_n_5 ,\tuser_cnt_reg[23]_i_1_n_6 ,\tuser_cnt_reg[23]_i_1_n_7 }),
        .S(tuser_cnt[23:20]));
  FDRE \tuser_cnt_reg[24] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[27]_i_1_n_7 ),
        .Q(tuser_cnt[24]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[25] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[27]_i_1_n_6 ),
        .Q(tuser_cnt[25]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[26] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[27]_i_1_n_5 ),
        .Q(tuser_cnt[26]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[27] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[27]_i_1_n_4 ),
        .Q(tuser_cnt[27]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[27]_i_1 
       (.CI(\tuser_cnt_reg[23]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[27]_i_1_n_0 ,\tuser_cnt_reg[27]_i_1_n_1 ,\tuser_cnt_reg[27]_i_1_n_2 ,\tuser_cnt_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[27]_i_1_n_4 ,\tuser_cnt_reg[27]_i_1_n_5 ,\tuser_cnt_reg[27]_i_1_n_6 ,\tuser_cnt_reg[27]_i_1_n_7 }),
        .S(tuser_cnt[27:24]));
  FDRE \tuser_cnt_reg[28] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[31]_i_3_n_7 ),
        .Q(tuser_cnt[28]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[29] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[31]_i_3_n_6 ),
        .Q(tuser_cnt[29]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[2] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[3]_i_1_n_5 ),
        .Q(tuser_cnt[2]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[30] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[31]_i_3_n_5 ),
        .Q(tuser_cnt[30]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[31] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[31]_i_3_n_4 ),
        .Q(tuser_cnt[31]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[31]_i_3 
       (.CI(\tuser_cnt_reg[27]_i_1_n_0 ),
        .CO({\NLW_tuser_cnt_reg[31]_i_3_CO_UNCONNECTED [3],\tuser_cnt_reg[31]_i_3_n_1 ,\tuser_cnt_reg[31]_i_3_n_2 ,\tuser_cnt_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[31]_i_3_n_4 ,\tuser_cnt_reg[31]_i_3_n_5 ,\tuser_cnt_reg[31]_i_3_n_6 ,\tuser_cnt_reg[31]_i_3_n_7 }),
        .S(tuser_cnt[31:28]));
  FDRE \tuser_cnt_reg[3] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[3]_i_1_n_4 ),
        .Q(tuser_cnt[3]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\tuser_cnt_reg[3]_i_1_n_0 ,\tuser_cnt_reg[3]_i_1_n_1 ,\tuser_cnt_reg[3]_i_1_n_2 ,\tuser_cnt_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\tuser_cnt_reg[3]_i_1_n_4 ,\tuser_cnt_reg[3]_i_1_n_5 ,\tuser_cnt_reg[3]_i_1_n_6 ,\tuser_cnt_reg[3]_i_1_n_7 }),
        .S({tuser_cnt[3:1],\tuser_cnt[3]_i_2_n_0 }));
  FDRE \tuser_cnt_reg[4] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[7]_i_1_n_7 ),
        .Q(tuser_cnt[4]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[5] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[7]_i_1_n_6 ),
        .Q(tuser_cnt[5]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[6] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[7]_i_1_n_5 ),
        .Q(tuser_cnt[6]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[7] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[7]_i_1_n_4 ),
        .Q(tuser_cnt[7]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \tuser_cnt_reg[7]_i_1 
       (.CI(\tuser_cnt_reg[3]_i_1_n_0 ),
        .CO({\tuser_cnt_reg[7]_i_1_n_0 ,\tuser_cnt_reg[7]_i_1_n_1 ,\tuser_cnt_reg[7]_i_1_n_2 ,\tuser_cnt_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\tuser_cnt_reg[7]_i_1_n_4 ,\tuser_cnt_reg[7]_i_1_n_5 ,\tuser_cnt_reg[7]_i_1_n_6 ,\tuser_cnt_reg[7]_i_1_n_7 }),
        .S(tuser_cnt[7:4]));
  FDRE \tuser_cnt_reg[8] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[11]_i_1_n_7 ),
        .Q(tuser_cnt[8]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  FDRE \tuser_cnt_reg[9] 
       (.C(aclk),
        .CE(vsync_cnt0),
        .D(\tuser_cnt_reg[11]_i_1_n_6 ),
        .Q(tuser_cnt[9]),
        .R(\tuser_cnt[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h80FF)) 
    \vsync_cnt[31]_i_1 
       (.I0(s_axis_tuser),
        .I1(s_axis_tvalid),
        .I2(m_axis_tready),
        .I3(aresetn),
        .O(\vsync_cnt[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \vsync_cnt[31]_i_2 
       (.I0(s_axis_tlast),
        .I1(m_axis_tready),
        .I2(s_axis_tvalid),
        .O(\vsync_cnt[31]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \vsync_cnt[3]_i_2 
       (.I0(vsync_cnt[0]),
        .O(\vsync_cnt[3]_i_2_n_0 ));
  FDRE \vsync_cnt_reg[0] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[3]_i_1_n_7 ),
        .Q(vsync_cnt[0]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[10] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[11]_i_1_n_5 ),
        .Q(vsync_cnt[10]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[11] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[11]_i_1_n_4 ),
        .Q(vsync_cnt[11]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[11]_i_1 
       (.CI(\vsync_cnt_reg[7]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[11]_i_1_n_0 ,\vsync_cnt_reg[11]_i_1_n_1 ,\vsync_cnt_reg[11]_i_1_n_2 ,\vsync_cnt_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[11]_i_1_n_4 ,\vsync_cnt_reg[11]_i_1_n_5 ,\vsync_cnt_reg[11]_i_1_n_6 ,\vsync_cnt_reg[11]_i_1_n_7 }),
        .S(vsync_cnt[11:8]));
  FDRE \vsync_cnt_reg[12] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[15]_i_1_n_7 ),
        .Q(vsync_cnt[12]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[13] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[15]_i_1_n_6 ),
        .Q(vsync_cnt[13]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[14] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[15]_i_1_n_5 ),
        .Q(vsync_cnt[14]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[15] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[15]_i_1_n_4 ),
        .Q(vsync_cnt[15]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[15]_i_1 
       (.CI(\vsync_cnt_reg[11]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[15]_i_1_n_0 ,\vsync_cnt_reg[15]_i_1_n_1 ,\vsync_cnt_reg[15]_i_1_n_2 ,\vsync_cnt_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[15]_i_1_n_4 ,\vsync_cnt_reg[15]_i_1_n_5 ,\vsync_cnt_reg[15]_i_1_n_6 ,\vsync_cnt_reg[15]_i_1_n_7 }),
        .S(vsync_cnt[15:12]));
  FDRE \vsync_cnt_reg[16] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[19]_i_1_n_7 ),
        .Q(vsync_cnt[16]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[17] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[19]_i_1_n_6 ),
        .Q(vsync_cnt[17]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[18] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[19]_i_1_n_5 ),
        .Q(vsync_cnt[18]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[19] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[19]_i_1_n_4 ),
        .Q(vsync_cnt[19]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[19]_i_1 
       (.CI(\vsync_cnt_reg[15]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[19]_i_1_n_0 ,\vsync_cnt_reg[19]_i_1_n_1 ,\vsync_cnt_reg[19]_i_1_n_2 ,\vsync_cnt_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[19]_i_1_n_4 ,\vsync_cnt_reg[19]_i_1_n_5 ,\vsync_cnt_reg[19]_i_1_n_6 ,\vsync_cnt_reg[19]_i_1_n_7 }),
        .S(vsync_cnt[19:16]));
  FDRE \vsync_cnt_reg[1] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[3]_i_1_n_6 ),
        .Q(vsync_cnt[1]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[20] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[23]_i_1_n_7 ),
        .Q(vsync_cnt[20]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[21] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[23]_i_1_n_6 ),
        .Q(vsync_cnt[21]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[22] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[23]_i_1_n_5 ),
        .Q(vsync_cnt[22]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[23] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[23]_i_1_n_4 ),
        .Q(vsync_cnt[23]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[23]_i_1 
       (.CI(\vsync_cnt_reg[19]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[23]_i_1_n_0 ,\vsync_cnt_reg[23]_i_1_n_1 ,\vsync_cnt_reg[23]_i_1_n_2 ,\vsync_cnt_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[23]_i_1_n_4 ,\vsync_cnt_reg[23]_i_1_n_5 ,\vsync_cnt_reg[23]_i_1_n_6 ,\vsync_cnt_reg[23]_i_1_n_7 }),
        .S(vsync_cnt[23:20]));
  FDRE \vsync_cnt_reg[24] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[27]_i_1_n_7 ),
        .Q(vsync_cnt[24]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[25] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[27]_i_1_n_6 ),
        .Q(vsync_cnt[25]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[26] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[27]_i_1_n_5 ),
        .Q(vsync_cnt[26]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[27] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[27]_i_1_n_4 ),
        .Q(vsync_cnt[27]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[27]_i_1 
       (.CI(\vsync_cnt_reg[23]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[27]_i_1_n_0 ,\vsync_cnt_reg[27]_i_1_n_1 ,\vsync_cnt_reg[27]_i_1_n_2 ,\vsync_cnt_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[27]_i_1_n_4 ,\vsync_cnt_reg[27]_i_1_n_5 ,\vsync_cnt_reg[27]_i_1_n_6 ,\vsync_cnt_reg[27]_i_1_n_7 }),
        .S(vsync_cnt[27:24]));
  FDRE \vsync_cnt_reg[28] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[31]_i_3_n_7 ),
        .Q(vsync_cnt[28]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[29] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[31]_i_3_n_6 ),
        .Q(vsync_cnt[29]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[2] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[3]_i_1_n_5 ),
        .Q(vsync_cnt[2]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[30] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[31]_i_3_n_5 ),
        .Q(vsync_cnt[30]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[31] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[31]_i_3_n_4 ),
        .Q(vsync_cnt[31]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[31]_i_3 
       (.CI(\vsync_cnt_reg[27]_i_1_n_0 ),
        .CO({\NLW_vsync_cnt_reg[31]_i_3_CO_UNCONNECTED [3],\vsync_cnt_reg[31]_i_3_n_1 ,\vsync_cnt_reg[31]_i_3_n_2 ,\vsync_cnt_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[31]_i_3_n_4 ,\vsync_cnt_reg[31]_i_3_n_5 ,\vsync_cnt_reg[31]_i_3_n_6 ,\vsync_cnt_reg[31]_i_3_n_7 }),
        .S(vsync_cnt[31:28]));
  FDRE \vsync_cnt_reg[3] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[3]_i_1_n_4 ),
        .Q(vsync_cnt[3]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\vsync_cnt_reg[3]_i_1_n_0 ,\vsync_cnt_reg[3]_i_1_n_1 ,\vsync_cnt_reg[3]_i_1_n_2 ,\vsync_cnt_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\vsync_cnt_reg[3]_i_1_n_4 ,\vsync_cnt_reg[3]_i_1_n_5 ,\vsync_cnt_reg[3]_i_1_n_6 ,\vsync_cnt_reg[3]_i_1_n_7 }),
        .S({vsync_cnt[3:1],\vsync_cnt[3]_i_2_n_0 }));
  FDRE \vsync_cnt_reg[4] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[7]_i_1_n_7 ),
        .Q(vsync_cnt[4]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[5] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[7]_i_1_n_6 ),
        .Q(vsync_cnt[5]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[6] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[7]_i_1_n_5 ),
        .Q(vsync_cnt[6]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[7] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[7]_i_1_n_4 ),
        .Q(vsync_cnt[7]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \vsync_cnt_reg[7]_i_1 
       (.CI(\vsync_cnt_reg[3]_i_1_n_0 ),
        .CO({\vsync_cnt_reg[7]_i_1_n_0 ,\vsync_cnt_reg[7]_i_1_n_1 ,\vsync_cnt_reg[7]_i_1_n_2 ,\vsync_cnt_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\vsync_cnt_reg[7]_i_1_n_4 ,\vsync_cnt_reg[7]_i_1_n_5 ,\vsync_cnt_reg[7]_i_1_n_6 ,\vsync_cnt_reg[7]_i_1_n_7 }),
        .S(vsync_cnt[7:4]));
  FDRE \vsync_cnt_reg[8] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[11]_i_1_n_7 ),
        .Q(vsync_cnt[8]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
  FDRE \vsync_cnt_reg[9] 
       (.C(aclk),
        .CE(\vsync_cnt[31]_i_2_n_0 ),
        .D(\vsync_cnt_reg[11]_i_1_n_6 ),
        .Q(vsync_cnt[9]),
        .R(\vsync_cnt[31]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
