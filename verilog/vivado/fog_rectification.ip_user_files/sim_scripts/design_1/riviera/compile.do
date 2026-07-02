transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axis_infrastructure_v1_1_1
vlib riviera/axis_register_slice_v1_1_35
vlib riviera/xil_defaultlib
vlib riviera/axis_subset_converter_v1_1_36
vlib riviera/mipi_dphy_v4_3_17
vlib riviera/mipi_csi2_rx_ctrl_v1_0_14
vlib riviera/axis_switch_v1_1_35
vlib riviera/vfb_v1_0_29
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/gigantic_mux
vlib riviera/xlconstant_v1_1_10

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axis_infrastructure_v1_1_1 riviera/axis_infrastructure_v1_1_1
vmap axis_register_slice_v1_1_35 riviera/axis_register_slice_v1_1_35
vmap xil_defaultlib riviera/xil_defaultlib
vmap axis_subset_converter_v1_1_36 riviera/axis_subset_converter_v1_1_36
vmap mipi_dphy_v4_3_17 riviera/mipi_dphy_v4_3_17
vmap mipi_csi2_rx_ctrl_v1_0_14 riviera/mipi_csi2_rx_ctrl_v1_0_14
vmap axis_switch_v1_1_35 riviera/axis_switch_v1_1_35
vmap vfb_v1_0_29 riviera/vfb_v1_0_29
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap gigantic_mux riviera/gigantic_mux
vmap xlconstant_v1_1_10 riviera/xlconstant_v1_1_10

vlog -work xilinx_vip  -incr "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"F:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"F:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"F:/AMDDesignTools/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_1  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/434f/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_35  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/be12/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tdata_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tuser_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tstrb_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tkeep_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tid_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tdest_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/tlast_design_1_axis_subset_converter_0_0.v" \

vlog -work axis_subset_converter_v1_1_36  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/5e96/hdl/axis_subset_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/hdl/top_design_1_axis_subset_converter_0_0.v" \
"../../../bd/design_1/ip/design_1_axis_subset_converter_0_0/sim/design_1_axis_subset_converter_0_0.v" \

vlog -work mipi_dphy_v4_3_17  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_sync_cell.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_sync_cell.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_data_lane_sm.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_csi_rx_data_lane_sm.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_opt_rx_data_lane_sm.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_ppm_fifo.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_sot_det_align.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_opt_rx_sot_det_align.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_sot_det_align_deskew.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_calib_cntrl.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_sot_det_align_ppm.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_data_lane_sm.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_data_lane_sm_trim.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_esc_datapath.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_hs_datapath.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_hs_datapath_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_rst_logic.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_rst_logic.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_rst_logic_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_support_rst_logic.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_support_rst_logic.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_clk_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_csi_rx_clk_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_opt_rx_clk_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_data_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_dphy_reg.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_clk_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_clk_lane_trim.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_clk_lane_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_data_lane.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_dphy_reg.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_fab_top.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_fab_top.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_ioi.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_ioi.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_ioi_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_dly_ctrl_wrap.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_serdes_idelay_ddr.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_phy_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_tx_ioi_7series.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rxtx_splitter.v" \

vlog -work mipi_dphy_v4_3_17  -incr "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_deskew_top.sv" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_deskew_main.sv" \

vlog -work mipi_dphy_v4_3_17  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_versal_deskew_top.v" \
"../../../../../src/bd/design_1/ipshared/8977/hdl/src/verilog/mipi_dphy_v4_3_rx_versal_deskew_main.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_0/bd_bf15_phy_0/support/bd_bf15_phy_0_support.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_0/bd_bf15_phy_0/support/bd_bf15_phy_0_clock_module.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_0/bd_bf15_phy_0_c1.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_0/bd_bf15_phy_0_core.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_0/bd_bf15_phy_0.v" \

vlog -work mipi_csi2_rx_ctrl_v1_0_14  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_crc0.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_crc_8b.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_gen_spkt_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_crc_32b.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_isr_cdc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_pulse_cdc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_non_vfb_stream_iface.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cdc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_reg_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_reg_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_gsp.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_pkt_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_pipeline.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_ppi_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_line_buffer.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_line_buffer_dst.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_stream.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_phecc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_hdr_bridge.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_ppi_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_stream_switch.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_data.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_crc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_control.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_lane_merger.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_lane_merger.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_ppi_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_ppi_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_lane_merger_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_pkt_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_crc0.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_crc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_phecc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_data.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_control.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_control_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_2lane_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_3lane_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32_cphy_1lane_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32_cphy_2lane_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32_cphy_3lane_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_crc0.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_crc_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_hdr_crc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_line_buffer.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_stream.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_16bit_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_ppi_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_dphy_ppi_inf.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_ppi_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_cphy_lane_merger.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_dphy_lane_merger.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_lane_merger_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_lm_async_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_processing.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_crc_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_byte2pixel.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_emb_data.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rst_logic.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw8_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb888_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb666_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb565_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb555_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb444_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw6_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw7_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw10_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw12_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw14_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw16_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw20_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv422_8bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv422_10bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv420_8bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_byte2pixel.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw6_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw7_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw8_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw10_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw12_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw14_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw16_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_raw20_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_rgb888_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_rgb666_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_rgb565_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_rgb555_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_rgb444_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_yuv422_8bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_yuv422_10bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_32bit_yuv420_8bit_b2p.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rx_ctrl_phecc.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_stream_async_fifo.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_ppc_axis_stream_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw8_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb888_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb666_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb565_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb555_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_rgb444_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw6_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw7_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw10_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw12_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw14_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw16_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_raw20_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv422_8_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv422_10_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_yuv420_8_axis_blk.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_top.v" \
"../../../../../src/bd/design_1/ipshared/3f5a/hdl/mipi_csi2_rx_ctrl_v1_0_rxphy_top.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_1/bd_bf15_rx_0.v" \

vlog -work axis_switch_v1_1_35  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/4eea/hdl/axis_switch_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/ip_0/sim/bd_bf15_vfb_0_0_axisswitch.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/ip_1/sim/bd_bf15_vfb_0_0_sli.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/ip_2/sim/bd_bf15_vfb_0_0_slo.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_fifo.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_axis_ycomp_dconverter.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_fifo_ycomp.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_DT_Demux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_DT_Mux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_vc4_mux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_vc4_demux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_vc16_mux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_YUV420_vc16_demux.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_fifo_yuv.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_fifo_sb.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0/src/verilog/bd_bf15_vfb_0_0_axis_dconverter.v" \

vlog -work vfb_v1_0_29  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/ce4e/hdl/vfb_v1_0_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0_core.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_2/bd_bf15_vfb_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../../src/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/ip/ip_3/sim/bd_bf15_r_sync_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/bd_0/sim/bd_bf15.v" \
"../../../bd/design_1/ip/design_1_mipi_csi2_rx_subsystem_0_0/sim/design_1_mipi_csi2_rx_subsystem_0_0.v" \
"../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/sim/bd_f60c.v" \
"../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_0/sim/bd_f60c_ila_lib_0.v" \

vlog -work gigantic_mux  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/b2b0/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_1/bd_f60c_g_inst_0_gigantic_mux.v" \
"../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_1/sim/bd_f60c_g_inst_0.v" \
"../../../bd/design_1/ip/design_1_system_ila_0_0/sim/design_1_system_ila_0_0.v" \

vlog -work xlconstant_v1_1_10  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../../../src/bd/design_1/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_pixel_counter_0_0/sim/design_1_pixel_counter_0_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ipshared/40b8/hdl/LineBuffer.vhd" \
"../../../bd/design_1/ipshared/40b8/hdl/AXI_BayerToRGB.vhd" \
"../../../bd/design_1/ip/design_1_AXI_BayerToRGB_0_2/sim/design_1_AXI_BayerToRGB_0_2.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../src/bd/design_1/ipshared/434f/hdl" "+incdir+../../../../../src/bd/design_1/ipshared/3f5a/hdl" "+incdir+../../../../../../../../AMDDesignTools/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../../../src/bd/design_1/ipshared/5431/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/4e08/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/0568/hdl/verilog" "+incdir+../../../../../src/bd/design_1/ipshared/3556/hdl/verilog" "+incdir+F:/AMDDesignTools/2025.2/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axis_infrastructure_v1_1_1 -l axis_register_slice_v1_1_35 -l xil_defaultlib -l axis_subset_converter_v1_1_36 -l mipi_dphy_v4_3_17 -l mipi_csi2_rx_ctrl_v1_0_14 -l axis_switch_v1_1_35 -l vfb_v1_0_29 -l proc_sys_reset_v5_0_17 -l gigantic_mux -l xlconstant_v1_1_10 \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

