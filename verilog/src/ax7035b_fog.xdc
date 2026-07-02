# ax7035b_fog.xdc
# Based directly on original test_mipi io_constraints.xdc
# All pins verified against AX7035B user manual and original project
# XC7A35T-2FGG484I

############## Bitstream config ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

############## System clock (50 MHz, pin Y18, BANK14) ##################
create_clock -period 20.000 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN Y18 [get_ports sys_clk]

############## Reset (active low, RESET button, pin F20, BANK16) ##################
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN F20 [get_ports rst_n]

############## HDMI output (BANK35, VCCO=3.3V) ##################
set_property PACKAGE_PIN D1 [get_ports tmds_clk_n]
set_property IOSTANDARD TMDS_33 [get_ports tmds_clk_n]
set_property PACKAGE_PIN E1 [get_ports tmds_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports tmds_clk_p]

set_property PACKAGE_PIN F1 [get_ports {tmds_data_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[0]}]
set_property PACKAGE_PIN G1 [get_ports {tmds_data_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_p[0]}]

set_property PACKAGE_PIN G2 [get_ports {tmds_data_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[1]}]
set_property PACKAGE_PIN H2 [get_ports {tmds_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_p[1]}]

set_property PACKAGE_PIN J1 [get_ports {tmds_data_n[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_n[2]}]
set_property PACKAGE_PIN K1 [get_ports {tmds_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {tmds_data_p[2]}]

set_property PACKAGE_PIN M6 [get_ports HDMI1_OEN]
set_property IOSTANDARD LVCMOS33 [get_ports HDMI1_OEN]

############## Camera I2C and control (BANK15, VCCO=3.3V) ##################
set_property PACKAGE_PIN J14 [get_ports cmos1_scl]
set_property IOSTANDARD LVCMOS33 [get_ports cmos1_scl]
set_property PULLUP true [get_ports cmos1_scl]
set_property DRIVE 12 [get_ports cmos1_scl]

set_property PACKAGE_PIN G13 [get_ports cmos1_sda]
set_property IOSTANDARD LVCMOS33 [get_ports cmos1_sda]
set_property PULLUP true [get_ports cmos1_sda]
set_property DRIVE 12 [get_ports cmos1_sda]

set_property PACKAGE_PIN H13 [get_ports cmos1_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports cmos1_rst_n]

# NOTE: cmos1_pwdn removed from design entirely.
# H14 (CAM_CLK) is an input to camera - not driven by FPGA.
# AN5641 uses internal oscillator (R9=NC on module schematic).

############## MIPI CSI-2 (BANK35, VCCO=3.3V) ##################
# HS clock differential pair (LVDS)
set_property PACKAGE_PIN H3 [get_ports mipi_phy_if_clk_hs_p]
set_property IOSTANDARD LVDS_25 [get_ports mipi_phy_if_clk_hs_p]
set_property PACKAGE_PIN G3 [get_ports mipi_phy_if_clk_hs_n]
set_property IOSTANDARD LVDS_25 [get_ports mipi_phy_if_clk_hs_n]

# LP clock - separate single-ended HSUL_12 pins (verified from original project)
set_property PACKAGE_PIN B1 [get_ports mipi_phy_if_clk_lp_p]
set_property IOSTANDARD HSUL_12 [get_ports mipi_phy_if_clk_lp_p]
set_property PACKAGE_PIN A1 [get_ports mipi_phy_if_clk_lp_n]
set_property IOSTANDARD HSUL_12 [get_ports mipi_phy_if_clk_lp_n]

# HS data lane 0
set_property PACKAGE_PIN E2 [get_ports {mipi_phy_if_data_hs_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_phy_if_data_hs_p[0]}]
set_property PACKAGE_PIN D2 [get_ports {mipi_phy_if_data_hs_n[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_phy_if_data_hs_n[0]}]

# HS data lane 1
set_property PACKAGE_PIN F3 [get_ports {mipi_phy_if_data_hs_p[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_phy_if_data_hs_p[1]}]
set_property PACKAGE_PIN E3 [get_ports {mipi_phy_if_data_hs_n[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_phy_if_data_hs_n[1]}]

# LP data lane 0 - separate single-ended HSUL_12 pins (verified from original project)
set_property PACKAGE_PIN C2 [get_ports {mipi_phy_if_data_lp_p[0]}]
set_property IOSTANDARD HSUL_12 [get_ports {mipi_phy_if_data_lp_p[0]}]
set_property PACKAGE_PIN B2 [get_ports {mipi_phy_if_data_lp_n[0]}]
set_property IOSTANDARD HSUL_12 [get_ports {mipi_phy_if_data_lp_n[0]}]

# LP data lane 1 - separate single-ended HSUL_12 pins (verified from original project)
set_property PACKAGE_PIN K2 [get_ports {mipi_phy_if_data_lp_p[1]}]
set_property IOSTANDARD HSUL_12 [get_ports {mipi_phy_if_data_lp_p[1]}]
set_property PACKAGE_PIN J2 [get_ports {mipi_phy_if_data_lp_n[1]}]
set_property IOSTANDARD HSUL_12 [get_ports {mipi_phy_if_data_lp_n[1]}]

# Internal VREF for bank 35 (required for HSUL_12)
set_property INTERNAL_VREF 0.6 [get_iobanks 35]

############## LEDs (BANK16, VCCO=3.3V) ##################
set_property PACKAGE_PIN F19 [get_ports {led[0]}]
set_property PACKAGE_PIN E21 [get_ports {led[1]}]
set_property PACKAGE_PIN D20 [get_ports {led[2]}]
set_property PACKAGE_PIN C20 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]

############## DDR3 (BANK34, VCCO=1.5V) ##################
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[*]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[*]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[*]}]
set_property IOSTANDARD SSTL15 [get_ports ddr3_ras_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_cas_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_we_n]
set_property IOSTANDARD LVCMOS15 [get_ports ddr3_reset_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_p[*]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_n[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cs_n[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[*]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[*]}]

set_property PACKAGE_PIN V4  [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN AB2 [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN AB3 [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN AA1 [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN AA5 [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN Y4  [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN AB5 [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN AA4 [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN V2  [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN Y1  [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN U1  [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN Y2  [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN T1  [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN W1  [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN U2  [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN U3  [get_ports {ddr3_dq[15]}]
set_property PACKAGE_PIN Y3  [get_ports {ddr3_dqs_p[0]}]
set_property PACKAGE_PIN AA3 [get_ports {ddr3_dqs_n[0]}]
set_property PACKAGE_PIN R3  [get_ports {ddr3_dqs_p[1]}]
set_property PACKAGE_PIN R2  [get_ports {ddr3_dqs_n[1]}]
set_property PACKAGE_PIN AB1 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN W2  [get_ports {ddr3_dm[1]}]
set_property PACKAGE_PIN AA8 [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN U5  [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN Y9  [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN Y8  [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN V5  [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN W7  [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN U6  [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN V7  [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN T5  [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN W9  [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN AA6 [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN T6  [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN Y6  [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN R6  [get_ports {ddr3_addr[13]}]
set_property PACKAGE_PIN AB8 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN W5  [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN Y7  [get_ports {ddr3_ba[2]}]
set_property PACKAGE_PIN U7  [get_ports {ddr3_cs_n[0]}]
set_property PACKAGE_PIN AB7 [get_ports ddr3_ras_n]
set_property PACKAGE_PIN T4  [get_ports ddr3_cas_n]
set_property PACKAGE_PIN W6  [get_ports ddr3_we_n]
set_property PACKAGE_PIN AB6 [get_ports {ddr3_odt[0]}]
set_property PACKAGE_PIN T3  [get_ports ddr3_reset_n]
set_property PACKAGE_PIN V9  [get_ports {ddr3_ck_p[0]}]
set_property PACKAGE_PIN V8  [get_ports {ddr3_ck_n[0]}]
set_property PACKAGE_PIN R4  [get_ports {ddr3_cke[0]}]

############## Timing false paths ##################
set_false_path -through [get_pins -filter {NAME =~ */SyncAsync*/oSyncStages*/PRE || NAME =~ */SyncAsync*/oSyncStages*/CLR} -hier]
set_false_path -through [get_pins -filter {NAME =~ *SyncAsync*/oSyncStages_reg[0]/D} -hier]

set_false_path -from [get_clocks -of_objects [get_pins video_pll_m0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]]
set_false_path -from [get_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]] -to [get_clocks -of_objects [get_pins video_pll_m0/inst/mmcm_adv_inst/CLKOUT0]]



############## User Key for filter selection ##################
# KEY1 — released = Gaussian filter, pressed = Bilateral filter
set_property PACKAGE_PIN M13 [get_ports key1]
set_property IOSTANDARD LVCMOS33 [get_ports key1]
set_property PULLUP true [get_ports key1]

set_property PACKAGE_PIN K14 [get_ports key2]
set_property IOSTANDARD LVCMOS33 [get_ports key2]
set_property PULLUP true [get_ports key2]

set_property PACKAGE_PIN K13 [get_ports key3]
set_property IOSTANDARD LVCMOS33 [get_ports key3]
set_property PULLUP true [get_ports key3]

set_property PACKAGE_PIN L13 [get_ports key4]
set_property IOSTANDARD LVCMOS33 [get_ports key4]
set_property PULLUP true [get_ports key4]