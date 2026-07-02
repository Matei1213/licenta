transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1  -L xil_defaultlib -L xilinx_vip -L xpm -L axis_infrastructure_v1_1_1 -L axis_register_slice_v1_1_35 -L axis_subset_converter_v1_1_36 -L mipi_dphy_v4_3_17 -L mipi_csi2_rx_ctrl_v1_0_14 -L axis_switch_v1_1_35 -L vfb_v1_0_29 -L proc_sys_reset_v5_0_17 -L gigantic_mux -L xlconstant_v1_1_10 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1 xil_defaultlib.glbl

do {design_1.udo}

run 1000ns

endsim

quit -force
