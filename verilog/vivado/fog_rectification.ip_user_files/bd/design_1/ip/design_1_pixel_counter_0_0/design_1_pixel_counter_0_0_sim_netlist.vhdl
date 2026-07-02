-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue May 19 23:00:29 2026
-- Host        : DESKTOP-9LEFS2P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/facultate/licenta/fog_scratch2/src/bd/design_1/ip/design_1_pixel_counter_0_0/design_1_pixel_counter_0_0_sim_netlist.vhdl
-- Design      : design_1_pixel_counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pixel_counter_0_0_pixel_counter is
  port (
    hsync_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vsync_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tuser_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    flag : out STD_LOGIC;
    aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tuser : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pixel_counter_0_0_pixel_counter : entity is "pixel_counter";
end design_1_pixel_counter_0_0_pixel_counter;

architecture STRUCTURE of design_1_pixel_counter_0_0_pixel_counter is
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal \counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \^flag\ : STD_LOGIC;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal flag_i_2_n_0 : STD_LOGIC;
  signal flag_i_3_n_0 : STD_LOGIC;
  signal flag_i_4_n_0 : STD_LOGIC;
  signal flag_i_5_n_0 : STD_LOGIC;
  signal flag_i_6_n_0 : STD_LOGIC;
  signal \^hsync_cnt\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hsync_cnt02_out : STD_LOGIC;
  signal \hsync_cnt[31]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[31]_i_3_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \hsync_cnt_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \^tuser_cnt\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \tuser_cnt[31]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[31]_i_3_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \tuser_cnt_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \^vsync_cnt\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal vsync_cnt0 : STD_LOGIC;
  signal \vsync_cnt[31]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt[31]_i_2_n_0\ : STD_LOGIC;
  signal \vsync_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[31]_i_3_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \vsync_cnt_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_counter_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_hsync_cnt_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tuser_cnt_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_vsync_cnt_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of flag_i_5 : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \hsync_cnt_reg[7]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \tuser_cnt_reg[7]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \vsync_cnt_reg[7]_i_1\ : label is 35;
begin
  flag <= \^flag\;
  hsync_cnt(31 downto 0) <= \^hsync_cnt\(31 downto 0);
  tuser_cnt(31 downto 0) <= \^tuser_cnt\(31 downto 0);
  vsync_cnt(31 downto 0) <= \^vsync_cnt\(31 downto 0);
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80000000FFFFFFFF"
    )
        port map (
      I0 => flag_i_3_n_0,
      I1 => flag_i_4_n_0,
      I2 => flag_i_2_n_0,
      I3 => flag_i_6_n_0,
      I4 => \counter[0]_i_3_n_0\,
      I5 => aresetn,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(1),
      I2 => counter_reg(0),
      O => \counter[0]_i_3_n_0\
    );
\counter[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_4_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2_n_0\,
      CO(2) => \counter_reg[0]_i_2_n_1\,
      CO(1) => \counter_reg[0]_i_2_n_2\,
      CO(0) => \counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2_n_4\,
      O(2) => \counter_reg[0]_i_2_n_5\,
      O(1) => \counter_reg[0]_i_2_n_6\,
      O(0) => \counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_4_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[24]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[24]_i_1_O_UNCONNECTED\(3),
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => counter_reg(26 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[0]_i_2_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1_n_0\
    );
flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => flag_i_2_n_0,
      I1 => flag_i_3_n_0,
      I2 => flag_i_4_n_0,
      I3 => flag_i_5_n_0,
      I4 => flag_i_6_n_0,
      O => flag_i_1_n_0
    );
flag_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => counter_reg(18),
      I1 => counter_reg(17),
      I2 => counter_reg(15),
      I3 => counter_reg(16),
      I4 => counter_reg(20),
      I5 => counter_reg(19),
      O => flag_i_2_n_0
    );
flag_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100000000000"
    )
        port map (
      I0 => counter_reg(23),
      I1 => counter_reg(24),
      I2 => counter_reg(21),
      I3 => counter_reg(22),
      I4 => counter_reg(25),
      I5 => counter_reg(26),
      O => flag_i_3_n_0
    );
flag_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => counter_reg(12),
      I1 => counter_reg(11),
      I2 => counter_reg(9),
      I3 => counter_reg(10),
      I4 => counter_reg(14),
      I5 => counter_reg(13),
      O => flag_i_4_n_0
    );
flag_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => counter_reg(0),
      I1 => aresetn,
      I2 => counter_reg(2),
      I3 => counter_reg(1),
      O => flag_i_5_n_0
    );
flag_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => counter_reg(5),
      I1 => counter_reg(6),
      I2 => counter_reg(3),
      I3 => counter_reg(4),
      I4 => counter_reg(7),
      I5 => counter_reg(8),
      O => flag_i_6_n_0
    );
flag_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => flag_i_1_n_0,
      Q => \^flag\,
      R => '0'
    );
\hsync_cnt[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => m_axis_tready,
      I2 => s_axis_tlast,
      I3 => aresetn,
      O => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => m_axis_tready,
      I1 => s_axis_tvalid,
      O => hsync_cnt02_out
    );
\hsync_cnt[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^hsync_cnt\(0),
      O => \hsync_cnt[3]_i_2_n_0\
    );
\hsync_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[3]_i_1_n_7\,
      Q => \^hsync_cnt\(0),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[11]_i_1_n_5\,
      Q => \^hsync_cnt\(10),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[11]_i_1_n_4\,
      Q => \^hsync_cnt\(11),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[7]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[11]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[11]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[11]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[11]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[11]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[11]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(11 downto 8)
    );
\hsync_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[15]_i_1_n_7\,
      Q => \^hsync_cnt\(12),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[15]_i_1_n_6\,
      Q => \^hsync_cnt\(13),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[15]_i_1_n_5\,
      Q => \^hsync_cnt\(14),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[15]_i_1_n_4\,
      Q => \^hsync_cnt\(15),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[11]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[15]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[15]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[15]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[15]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[15]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[15]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(15 downto 12)
    );
\hsync_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[19]_i_1_n_7\,
      Q => \^hsync_cnt\(16),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[19]_i_1_n_6\,
      Q => \^hsync_cnt\(17),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[19]_i_1_n_5\,
      Q => \^hsync_cnt\(18),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[19]_i_1_n_4\,
      Q => \^hsync_cnt\(19),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[15]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[19]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[19]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[19]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[19]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[19]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[19]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(19 downto 16)
    );
\hsync_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[3]_i_1_n_6\,
      Q => \^hsync_cnt\(1),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[23]_i_1_n_7\,
      Q => \^hsync_cnt\(20),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[23]_i_1_n_6\,
      Q => \^hsync_cnt\(21),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[23]_i_1_n_5\,
      Q => \^hsync_cnt\(22),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[23]_i_1_n_4\,
      Q => \^hsync_cnt\(23),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[19]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[23]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[23]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[23]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[23]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[23]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[23]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(23 downto 20)
    );
\hsync_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[27]_i_1_n_7\,
      Q => \^hsync_cnt\(24),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[27]_i_1_n_6\,
      Q => \^hsync_cnt\(25),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[27]_i_1_n_5\,
      Q => \^hsync_cnt\(26),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[27]_i_1_n_4\,
      Q => \^hsync_cnt\(27),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[23]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[27]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[27]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[27]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[27]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[27]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[27]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[27]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(27 downto 24)
    );
\hsync_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[31]_i_3_n_7\,
      Q => \^hsync_cnt\(28),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[31]_i_3_n_6\,
      Q => \^hsync_cnt\(29),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[3]_i_1_n_5\,
      Q => \^hsync_cnt\(2),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[31]_i_3_n_5\,
      Q => \^hsync_cnt\(30),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[31]_i_3_n_4\,
      Q => \^hsync_cnt\(31),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[27]_i_1_n_0\,
      CO(3) => \NLW_hsync_cnt_reg[31]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \hsync_cnt_reg[31]_i_3_n_1\,
      CO(1) => \hsync_cnt_reg[31]_i_3_n_2\,
      CO(0) => \hsync_cnt_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[31]_i_3_n_4\,
      O(2) => \hsync_cnt_reg[31]_i_3_n_5\,
      O(1) => \hsync_cnt_reg[31]_i_3_n_6\,
      O(0) => \hsync_cnt_reg[31]_i_3_n_7\,
      S(3 downto 0) => \^hsync_cnt\(31 downto 28)
    );
\hsync_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[3]_i_1_n_4\,
      Q => \^hsync_cnt\(3),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \hsync_cnt_reg[3]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[3]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[3]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \hsync_cnt_reg[3]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[3]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[3]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^hsync_cnt\(3 downto 1),
      S(0) => \hsync_cnt[3]_i_2_n_0\
    );
\hsync_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[7]_i_1_n_7\,
      Q => \^hsync_cnt\(4),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[7]_i_1_n_6\,
      Q => \^hsync_cnt\(5),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[7]_i_1_n_5\,
      Q => \^hsync_cnt\(6),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[7]_i_1_n_4\,
      Q => \^hsync_cnt\(7),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hsync_cnt_reg[3]_i_1_n_0\,
      CO(3) => \hsync_cnt_reg[7]_i_1_n_0\,
      CO(2) => \hsync_cnt_reg[7]_i_1_n_1\,
      CO(1) => \hsync_cnt_reg[7]_i_1_n_2\,
      CO(0) => \hsync_cnt_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hsync_cnt_reg[7]_i_1_n_4\,
      O(2) => \hsync_cnt_reg[7]_i_1_n_5\,
      O(1) => \hsync_cnt_reg[7]_i_1_n_6\,
      O(0) => \hsync_cnt_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^hsync_cnt\(7 downto 4)
    );
\hsync_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[11]_i_1_n_7\,
      Q => \^hsync_cnt\(8),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\hsync_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => hsync_cnt02_out,
      D => \hsync_cnt_reg[11]_i_1_n_6\,
      Q => \^hsync_cnt\(9),
      R => \hsync_cnt[31]_i_1_n_0\
    );
\tuser_cnt[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAFFFF"
    )
        port map (
      I0 => \^flag\,
      I1 => m_axis_tready,
      I2 => s_axis_tvalid,
      I3 => s_axis_tuser,
      I4 => aresetn,
      O => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => s_axis_tvalid,
      I2 => m_axis_tready,
      O => vsync_cnt0
    );
\tuser_cnt[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^tuser_cnt\(0),
      O => \tuser_cnt[3]_i_2_n_0\
    );
\tuser_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[3]_i_1_n_7\,
      Q => \^tuser_cnt\(0),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[11]_i_1_n_5\,
      Q => \^tuser_cnt\(10),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[11]_i_1_n_4\,
      Q => \^tuser_cnt\(11),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[7]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[11]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[11]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[11]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[11]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[11]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[11]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(11 downto 8)
    );
\tuser_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[15]_i_1_n_7\,
      Q => \^tuser_cnt\(12),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[15]_i_1_n_6\,
      Q => \^tuser_cnt\(13),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[15]_i_1_n_5\,
      Q => \^tuser_cnt\(14),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[15]_i_1_n_4\,
      Q => \^tuser_cnt\(15),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[11]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[15]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[15]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[15]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[15]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[15]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[15]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(15 downto 12)
    );
\tuser_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[19]_i_1_n_7\,
      Q => \^tuser_cnt\(16),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[19]_i_1_n_6\,
      Q => \^tuser_cnt\(17),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[19]_i_1_n_5\,
      Q => \^tuser_cnt\(18),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[19]_i_1_n_4\,
      Q => \^tuser_cnt\(19),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[15]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[19]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[19]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[19]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[19]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[19]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[19]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(19 downto 16)
    );
\tuser_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[3]_i_1_n_6\,
      Q => \^tuser_cnt\(1),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[23]_i_1_n_7\,
      Q => \^tuser_cnt\(20),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[23]_i_1_n_6\,
      Q => \^tuser_cnt\(21),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[23]_i_1_n_5\,
      Q => \^tuser_cnt\(22),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[23]_i_1_n_4\,
      Q => \^tuser_cnt\(23),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[19]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[23]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[23]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[23]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[23]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[23]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[23]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(23 downto 20)
    );
\tuser_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[27]_i_1_n_7\,
      Q => \^tuser_cnt\(24),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[27]_i_1_n_6\,
      Q => \^tuser_cnt\(25),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[27]_i_1_n_5\,
      Q => \^tuser_cnt\(26),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[27]_i_1_n_4\,
      Q => \^tuser_cnt\(27),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[23]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[27]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[27]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[27]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[27]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[27]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[27]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[27]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(27 downto 24)
    );
\tuser_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[31]_i_3_n_7\,
      Q => \^tuser_cnt\(28),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[31]_i_3_n_6\,
      Q => \^tuser_cnt\(29),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[3]_i_1_n_5\,
      Q => \^tuser_cnt\(2),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[31]_i_3_n_5\,
      Q => \^tuser_cnt\(30),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[31]_i_3_n_4\,
      Q => \^tuser_cnt\(31),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[27]_i_1_n_0\,
      CO(3) => \NLW_tuser_cnt_reg[31]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \tuser_cnt_reg[31]_i_3_n_1\,
      CO(1) => \tuser_cnt_reg[31]_i_3_n_2\,
      CO(0) => \tuser_cnt_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[31]_i_3_n_4\,
      O(2) => \tuser_cnt_reg[31]_i_3_n_5\,
      O(1) => \tuser_cnt_reg[31]_i_3_n_6\,
      O(0) => \tuser_cnt_reg[31]_i_3_n_7\,
      S(3 downto 0) => \^tuser_cnt\(31 downto 28)
    );
\tuser_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[3]_i_1_n_4\,
      Q => \^tuser_cnt\(3),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tuser_cnt_reg[3]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[3]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[3]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \tuser_cnt_reg[3]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[3]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[3]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^tuser_cnt\(3 downto 1),
      S(0) => \tuser_cnt[3]_i_2_n_0\
    );
\tuser_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[7]_i_1_n_7\,
      Q => \^tuser_cnt\(4),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[7]_i_1_n_6\,
      Q => \^tuser_cnt\(5),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[7]_i_1_n_5\,
      Q => \^tuser_cnt\(6),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[7]_i_1_n_4\,
      Q => \^tuser_cnt\(7),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tuser_cnt_reg[3]_i_1_n_0\,
      CO(3) => \tuser_cnt_reg[7]_i_1_n_0\,
      CO(2) => \tuser_cnt_reg[7]_i_1_n_1\,
      CO(1) => \tuser_cnt_reg[7]_i_1_n_2\,
      CO(0) => \tuser_cnt_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \tuser_cnt_reg[7]_i_1_n_4\,
      O(2) => \tuser_cnt_reg[7]_i_1_n_5\,
      O(1) => \tuser_cnt_reg[7]_i_1_n_6\,
      O(0) => \tuser_cnt_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^tuser_cnt\(7 downto 4)
    );
\tuser_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[11]_i_1_n_7\,
      Q => \^tuser_cnt\(8),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\tuser_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vsync_cnt0,
      D => \tuser_cnt_reg[11]_i_1_n_6\,
      Q => \^tuser_cnt\(9),
      R => \tuser_cnt[31]_i_1_n_0\
    );
\vsync_cnt[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => s_axis_tvalid,
      I2 => m_axis_tready,
      I3 => aresetn,
      O => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axis_tlast,
      I1 => m_axis_tready,
      I2 => s_axis_tvalid,
      O => \vsync_cnt[31]_i_2_n_0\
    );
\vsync_cnt[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^vsync_cnt\(0),
      O => \vsync_cnt[3]_i_2_n_0\
    );
\vsync_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[3]_i_1_n_7\,
      Q => \^vsync_cnt\(0),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[11]_i_1_n_5\,
      Q => \^vsync_cnt\(10),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[11]_i_1_n_4\,
      Q => \^vsync_cnt\(11),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[7]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[11]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[11]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[11]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[11]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[11]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[11]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(11 downto 8)
    );
\vsync_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[15]_i_1_n_7\,
      Q => \^vsync_cnt\(12),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[15]_i_1_n_6\,
      Q => \^vsync_cnt\(13),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[15]_i_1_n_5\,
      Q => \^vsync_cnt\(14),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[15]_i_1_n_4\,
      Q => \^vsync_cnt\(15),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[11]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[15]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[15]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[15]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[15]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[15]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[15]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(15 downto 12)
    );
\vsync_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[19]_i_1_n_7\,
      Q => \^vsync_cnt\(16),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[19]_i_1_n_6\,
      Q => \^vsync_cnt\(17),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[19]_i_1_n_5\,
      Q => \^vsync_cnt\(18),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[19]_i_1_n_4\,
      Q => \^vsync_cnt\(19),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[15]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[19]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[19]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[19]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[19]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[19]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[19]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(19 downto 16)
    );
\vsync_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[3]_i_1_n_6\,
      Q => \^vsync_cnt\(1),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[23]_i_1_n_7\,
      Q => \^vsync_cnt\(20),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[23]_i_1_n_6\,
      Q => \^vsync_cnt\(21),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[23]_i_1_n_5\,
      Q => \^vsync_cnt\(22),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[23]_i_1_n_4\,
      Q => \^vsync_cnt\(23),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[19]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[23]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[23]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[23]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[23]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[23]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[23]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(23 downto 20)
    );
\vsync_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[27]_i_1_n_7\,
      Q => \^vsync_cnt\(24),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[27]_i_1_n_6\,
      Q => \^vsync_cnt\(25),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[27]_i_1_n_5\,
      Q => \^vsync_cnt\(26),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[27]_i_1_n_4\,
      Q => \^vsync_cnt\(27),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[23]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[27]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[27]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[27]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[27]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[27]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[27]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[27]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(27 downto 24)
    );
\vsync_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[31]_i_3_n_7\,
      Q => \^vsync_cnt\(28),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[31]_i_3_n_6\,
      Q => \^vsync_cnt\(29),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[3]_i_1_n_5\,
      Q => \^vsync_cnt\(2),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[31]_i_3_n_5\,
      Q => \^vsync_cnt\(30),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[31]_i_3_n_4\,
      Q => \^vsync_cnt\(31),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[27]_i_1_n_0\,
      CO(3) => \NLW_vsync_cnt_reg[31]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \vsync_cnt_reg[31]_i_3_n_1\,
      CO(1) => \vsync_cnt_reg[31]_i_3_n_2\,
      CO(0) => \vsync_cnt_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[31]_i_3_n_4\,
      O(2) => \vsync_cnt_reg[31]_i_3_n_5\,
      O(1) => \vsync_cnt_reg[31]_i_3_n_6\,
      O(0) => \vsync_cnt_reg[31]_i_3_n_7\,
      S(3 downto 0) => \^vsync_cnt\(31 downto 28)
    );
\vsync_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[3]_i_1_n_4\,
      Q => \^vsync_cnt\(3),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \vsync_cnt_reg[3]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[3]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[3]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \vsync_cnt_reg[3]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[3]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[3]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^vsync_cnt\(3 downto 1),
      S(0) => \vsync_cnt[3]_i_2_n_0\
    );
\vsync_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[7]_i_1_n_7\,
      Q => \^vsync_cnt\(4),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[7]_i_1_n_6\,
      Q => \^vsync_cnt\(5),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[7]_i_1_n_5\,
      Q => \^vsync_cnt\(6),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[7]_i_1_n_4\,
      Q => \^vsync_cnt\(7),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \vsync_cnt_reg[3]_i_1_n_0\,
      CO(3) => \vsync_cnt_reg[7]_i_1_n_0\,
      CO(2) => \vsync_cnt_reg[7]_i_1_n_1\,
      CO(1) => \vsync_cnt_reg[7]_i_1_n_2\,
      CO(0) => \vsync_cnt_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \vsync_cnt_reg[7]_i_1_n_4\,
      O(2) => \vsync_cnt_reg[7]_i_1_n_5\,
      O(1) => \vsync_cnt_reg[7]_i_1_n_6\,
      O(0) => \vsync_cnt_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^vsync_cnt\(7 downto 4)
    );
\vsync_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[11]_i_1_n_7\,
      Q => \^vsync_cnt\(8),
      R => \vsync_cnt[31]_i_1_n_0\
    );
\vsync_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \vsync_cnt[31]_i_2_n_0\,
      D => \vsync_cnt_reg[11]_i_1_n_6\,
      Q => \^vsync_cnt\(9),
      R => \vsync_cnt[31]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pixel_counter_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axis_tuser : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axis_tuser : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    hsync_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vsync_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tuser_cnt : out STD_LOGIC_VECTOR ( 31 downto 0 );
    flag : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_pixel_counter_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_pixel_counter_0_0 : entity is "design_1_pixel_counter_0_0,pixel_counter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_pixel_counter_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_pixel_counter_0_0 : entity is "pixel_counter,Vivado 2025.2";
end design_1_pixel_counter_0_0;

architecture STRUCTURE of design_1_pixel_counter_0_0 is
  signal \^m_axis_tready\ : STD_LOGIC;
  signal \^s_axis_tdata\ : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal \^s_axis_tlast\ : STD_LOGIC;
  signal \^s_axis_tuser\ : STD_LOGIC;
  signal \^s_axis_tvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute X_INTERFACE_INFO of m_axis_tuser : signal is "xilinx.com:interface:axis:1.0 m_axis TUSER";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_MODE of m_axis_tvalid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_tvalid : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_tuser : signal is "xilinx.com:interface:axis:1.0 s_axis TUSER";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_MODE of s_axis_tvalid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tvalid : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_video_aclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
begin
  \^m_axis_tready\ <= m_axis_tready;
  \^s_axis_tdata\(39 downto 0) <= s_axis_tdata(39 downto 0);
  \^s_axis_tlast\ <= s_axis_tlast;
  \^s_axis_tuser\ <= s_axis_tuser;
  \^s_axis_tvalid\ <= s_axis_tvalid;
  m_axis_tdata(39 downto 0) <= \^s_axis_tdata\(39 downto 0);
  m_axis_tlast <= \^s_axis_tlast\;
  m_axis_tuser <= \^s_axis_tuser\;
  m_axis_tvalid <= \^s_axis_tvalid\;
  s_axis_tready <= \^m_axis_tready\;
inst: entity work.design_1_pixel_counter_0_0_pixel_counter
     port map (
      aclk => aclk,
      aresetn => aresetn,
      flag => flag,
      hsync_cnt(31 downto 0) => hsync_cnt(31 downto 0),
      m_axis_tready => \^m_axis_tready\,
      s_axis_tlast => \^s_axis_tlast\,
      s_axis_tuser => \^s_axis_tuser\,
      s_axis_tvalid => \^s_axis_tvalid\,
      tuser_cnt(31 downto 0) => tuser_cnt(31 downto 0),
      vsync_cnt(31 downto 0) => vsync_cnt(31 downto 0)
    );
end STRUCTURE;
