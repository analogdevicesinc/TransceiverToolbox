-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:23:52 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_util_dac_1_upack_0/system_util_dac_1_upack_0_sim_netlist.vhdl
-- Design      : system_util_dac_1_upack_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_util_dac_1_upack_0_pack_network is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ctrl_reg[3]_0\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \ctrl_reg[8]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ctrl_reg[11]_0\ : in STD_LOGIC;
    fifo_rd_en : in STD_LOGIC;
    s_axis_valid : in STD_LOGIC;
    clk : in STD_LOGIC;
    \fifo_rd_data_reg[32]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \fifo_rd_data_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_util_dac_1_upack_0_pack_network : entity is "pack_network";
end system_util_dac_1_upack_0_pack_network;

architecture STRUCTURE of system_util_dac_1_upack_0_pack_network is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ctrl[0]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[10]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[11]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[1]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[2]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[3]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[0]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[10]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[11]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[1]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[2]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[3]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[8]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[9]\ : STD_LOGIC;
  signal \fifo_rd_data[0]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[0]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[10]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[10]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[11]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[11]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[12]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[12]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[13]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[13]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[14]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[14]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[15]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[15]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[1]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[1]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[2]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[2]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[3]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[3]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[4]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[4]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[5]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[5]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[6]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[6]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[7]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[7]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[8]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[8]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[9]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_rd_data[9]_i_3_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_2_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ctrl[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ctrl[10]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ctrl[11]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ctrl[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ctrl[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ctrl[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \fifo_rd_data[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \fifo_rd_data[10]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_rd_data[11]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_rd_data[12]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_rd_data[13]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \fifo_rd_data[14]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \fifo_rd_data[15]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \fifo_rd_data[16]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \fifo_rd_data[17]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \fifo_rd_data[18]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \fifo_rd_data[19]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \fifo_rd_data[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \fifo_rd_data[20]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \fifo_rd_data[21]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \fifo_rd_data[22]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_rd_data[23]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \fifo_rd_data[24]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \fifo_rd_data[25]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \fifo_rd_data[26]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_rd_data[27]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_rd_data[28]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_rd_data[29]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \fifo_rd_data[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \fifo_rd_data[30]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \fifo_rd_data[31]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \fifo_rd_data[32]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \fifo_rd_data[33]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \fifo_rd_data[34]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \fifo_rd_data[35]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \fifo_rd_data[36]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \fifo_rd_data[37]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \fifo_rd_data[38]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \fifo_rd_data[39]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \fifo_rd_data[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \fifo_rd_data[40]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \fifo_rd_data[41]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \fifo_rd_data[42]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \fifo_rd_data[43]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \fifo_rd_data[44]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \fifo_rd_data[45]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \fifo_rd_data[46]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \fifo_rd_data[47]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \fifo_rd_data[48]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \fifo_rd_data[49]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \fifo_rd_data[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \fifo_rd_data[50]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \fifo_rd_data[51]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \fifo_rd_data[52]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \fifo_rd_data[53]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \fifo_rd_data[54]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \fifo_rd_data[55]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \fifo_rd_data[56]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \fifo_rd_data[57]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \fifo_rd_data[58]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \fifo_rd_data[59]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \fifo_rd_data[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \fifo_rd_data[60]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \fifo_rd_data[61]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \fifo_rd_data[62]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \fifo_rd_data[63]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \fifo_rd_data[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_rd_data[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \fifo_rd_data[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \fifo_rd_data[9]_i_1\ : label is "soft_lutpair12";
begin
  E(0) <= \^e\(0);
\ctrl[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \ctrl_reg[8]_0\(0),
      I1 => \ctrl_reg[8]_0\(1),
      O => \ctrl[0]_i_1_n_0\
    );
\ctrl[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \ctrl_reg[8]_0\(0),
      I1 => Q(0),
      I2 => Q(1),
      I3 => \ctrl_reg[8]_0\(1),
      O => \ctrl[10]_i_1_n_0\
    );
\ctrl[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F20DDF20"
    )
        port map (
      I0 => Q(0),
      I1 => \ctrl_reg[8]_0\(0),
      I2 => Q(1),
      I3 => D(0),
      I4 => \ctrl_reg[8]_0\(1),
      O => \ctrl[11]_i_1_n_0\
    );
\ctrl[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => D(0),
      I1 => \ctrl_reg[8]_0\(1),
      I2 => \ctrl_reg[8]_0\(0),
      O => \ctrl[1]_i_1_n_0\
    );
\ctrl[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D22D"
    )
        port map (
      I0 => \ctrl_reg[8]_0\(0),
      I1 => Q(0),
      I2 => \ctrl_reg[8]_0\(1),
      I3 => Q(1),
      O => \ctrl[2]_i_1_n_0\
    );
\ctrl[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0FB4F04"
    )
        port map (
      I0 => Q(0),
      I1 => \ctrl_reg[8]_0\(0),
      I2 => Q(1),
      I3 => \ctrl_reg[8]_0\(1),
      I4 => D(0),
      O => \ctrl[3]_i_1_n_0\
    );
\ctrl_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[0]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[0]\,
      R => '0'
    );
\ctrl_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[10]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[10]\,
      R => '0'
    );
\ctrl_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[11]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[11]\,
      R => '0'
    );
\ctrl_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[1]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[1]\,
      R => '0'
    );
\ctrl_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[2]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[2]\,
      R => '0'
    );
\ctrl_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl[3]_i_1_n_0\,
      Q => \ctrl_reg_n_0_[3]\,
      R => '0'
    );
\ctrl_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => \ctrl_reg[8]_0\(1),
      Q => \ctrl_reg_n_0_[8]\,
      R => '0'
    );
\ctrl_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => D(0),
      Q => \ctrl_reg_n_0_[9]\,
      R => '0'
    );
\fifo_rd_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[0]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[0]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(0)
    );
\fifo_rd_data[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(0),
      I1 => s_axis_data(32),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(0),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[0]_i_2_n_0\
    );
\fifo_rd_data[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(16),
      I1 => s_axis_data(48),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(16),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[0]_i_3_n_0\
    );
\fifo_rd_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[10]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[10]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(10)
    );
\fifo_rd_data[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(10),
      I1 => s_axis_data(42),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(10),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[10]_i_2_n_0\
    );
\fifo_rd_data[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(26),
      I1 => s_axis_data(58),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(26),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[10]_i_3_n_0\
    );
\fifo_rd_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[11]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[11]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(11)
    );
\fifo_rd_data[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(11),
      I1 => s_axis_data(43),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(11),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[11]_i_2_n_0\
    );
\fifo_rd_data[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(27),
      I1 => s_axis_data(59),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(27),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[11]_i_3_n_0\
    );
\fifo_rd_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[12]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[12]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(12)
    );
\fifo_rd_data[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(12),
      I1 => s_axis_data(44),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(12),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[12]_i_2_n_0\
    );
\fifo_rd_data[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(28),
      I1 => s_axis_data(60),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(28),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[12]_i_3_n_0\
    );
\fifo_rd_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[13]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[13]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(13)
    );
\fifo_rd_data[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(13),
      I1 => s_axis_data(45),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(13),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[13]_i_2_n_0\
    );
\fifo_rd_data[13]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(29),
      I1 => s_axis_data(61),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(29),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[13]_i_3_n_0\
    );
\fifo_rd_data[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[14]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[14]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(14)
    );
\fifo_rd_data[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(14),
      I1 => s_axis_data(46),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(14),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[14]_i_2_n_0\
    );
\fifo_rd_data[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(30),
      I1 => s_axis_data(62),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(30),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[14]_i_3_n_0\
    );
\fifo_rd_data[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[15]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[15]_i_4_n_0\,
      O => \ctrl_reg[3]_0\(15)
    );
\fifo_rd_data[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(15),
      I1 => s_axis_data(47),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(15),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[15]_i_3_n_0\
    );
\fifo_rd_data[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(31),
      I1 => s_axis_data(63),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(31),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[15]_i_4_n_0\
    );
\fifo_rd_data[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[0]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[0]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(16)
    );
\fifo_rd_data[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[1]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[1]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(17)
    );
\fifo_rd_data[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[2]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[2]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(18)
    );
\fifo_rd_data[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[3]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[3]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(19)
    );
\fifo_rd_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[1]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[1]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(1)
    );
\fifo_rd_data[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(1),
      I1 => s_axis_data(33),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(1),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[1]_i_2_n_0\
    );
\fifo_rd_data[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(17),
      I1 => s_axis_data(49),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(17),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[1]_i_3_n_0\
    );
\fifo_rd_data[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[4]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[4]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(20)
    );
\fifo_rd_data[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[5]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[5]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(21)
    );
\fifo_rd_data[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[6]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[6]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(22)
    );
\fifo_rd_data[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[7]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[7]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(23)
    );
\fifo_rd_data[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[8]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[8]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(24)
    );
\fifo_rd_data[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[9]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[9]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(25)
    );
\fifo_rd_data[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[10]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[10]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(26)
    );
\fifo_rd_data[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[11]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[11]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(27)
    );
\fifo_rd_data[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[12]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[12]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(28)
    );
\fifo_rd_data[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[13]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[13]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(29)
    );
\fifo_rd_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[2]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[2]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(2)
    );
\fifo_rd_data[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(2),
      I1 => s_axis_data(34),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(2),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[2]_i_2_n_0\
    );
\fifo_rd_data[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(18),
      I1 => s_axis_data(50),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(18),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[2]_i_3_n_0\
    );
\fifo_rd_data[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[14]_i_3_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[14]_i_2_n_0\,
      O => \ctrl_reg[3]_0\(30)
    );
\fifo_rd_data[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[15]_i_4_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[15]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(31)
    );
\fifo_rd_data[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(0),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(0),
      O => \ctrl_reg[3]_0\(32)
    );
\fifo_rd_data[32]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(0),
      I1 => s_axis_data(32),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(0),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(0)
    );
\fifo_rd_data[32]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(16),
      I1 => s_axis_data(48),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(16),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(0)
    );
\fifo_rd_data[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(1),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(1),
      O => \ctrl_reg[3]_0\(33)
    );
\fifo_rd_data[33]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(1),
      I1 => s_axis_data(33),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(1),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(1)
    );
\fifo_rd_data[33]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(17),
      I1 => s_axis_data(49),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(17),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(1)
    );
\fifo_rd_data[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(2),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(2),
      O => \ctrl_reg[3]_0\(34)
    );
\fifo_rd_data[34]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(2),
      I1 => s_axis_data(34),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(2),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(2)
    );
\fifo_rd_data[34]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(18),
      I1 => s_axis_data(50),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(18),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(2)
    );
\fifo_rd_data[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(3),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(3),
      O => \ctrl_reg[3]_0\(35)
    );
\fifo_rd_data[35]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(3),
      I1 => s_axis_data(35),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(3),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(3)
    );
\fifo_rd_data[35]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(19),
      I1 => s_axis_data(51),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(19),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(3)
    );
\fifo_rd_data[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(4),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(4),
      O => \ctrl_reg[3]_0\(36)
    );
\fifo_rd_data[36]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(4),
      I1 => s_axis_data(36),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(4),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(4)
    );
\fifo_rd_data[36]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(20),
      I1 => s_axis_data(52),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(20),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(4)
    );
\fifo_rd_data[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(5),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(5),
      O => \ctrl_reg[3]_0\(37)
    );
\fifo_rd_data[37]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(5),
      I1 => s_axis_data(37),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(5),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(5)
    );
\fifo_rd_data[37]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(21),
      I1 => s_axis_data(53),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(21),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(5)
    );
\fifo_rd_data[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(6),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(6),
      O => \ctrl_reg[3]_0\(38)
    );
\fifo_rd_data[38]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(6),
      I1 => s_axis_data(38),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(6),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(6)
    );
\fifo_rd_data[38]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(22),
      I1 => s_axis_data(54),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(22),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(6)
    );
\fifo_rd_data[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(7),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(7),
      O => \ctrl_reg[3]_0\(39)
    );
\fifo_rd_data[39]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(7),
      I1 => s_axis_data(39),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(7),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(7)
    );
\fifo_rd_data[39]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(23),
      I1 => s_axis_data(55),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(23),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(7)
    );
\fifo_rd_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[3]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[3]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(3)
    );
\fifo_rd_data[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(3),
      I1 => s_axis_data(35),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(3),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[3]_i_2_n_0\
    );
\fifo_rd_data[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(19),
      I1 => s_axis_data(51),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(19),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[3]_i_3_n_0\
    );
\fifo_rd_data[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(8),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(8),
      O => \ctrl_reg[3]_0\(40)
    );
\fifo_rd_data[40]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(8),
      I1 => s_axis_data(40),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(8),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(8)
    );
\fifo_rd_data[40]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(24),
      I1 => s_axis_data(56),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(24),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(8)
    );
\fifo_rd_data[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(9),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(9),
      O => \ctrl_reg[3]_0\(41)
    );
\fifo_rd_data[41]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(9),
      I1 => s_axis_data(41),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(9),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(9)
    );
\fifo_rd_data[41]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(25),
      I1 => s_axis_data(57),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(25),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(9)
    );
\fifo_rd_data[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(10),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(10),
      O => \ctrl_reg[3]_0\(42)
    );
\fifo_rd_data[42]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(10),
      I1 => s_axis_data(42),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(10),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(10)
    );
\fifo_rd_data[42]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(26),
      I1 => s_axis_data(58),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(26),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(10)
    );
\fifo_rd_data[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(11),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(11),
      O => \ctrl_reg[3]_0\(43)
    );
\fifo_rd_data[43]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(11),
      I1 => s_axis_data(43),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(11),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(11)
    );
\fifo_rd_data[43]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(27),
      I1 => s_axis_data(59),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(27),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(11)
    );
\fifo_rd_data[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(12),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(12),
      O => \ctrl_reg[3]_0\(44)
    );
\fifo_rd_data[44]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(12),
      I1 => s_axis_data(44),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(12),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(12)
    );
\fifo_rd_data[44]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(28),
      I1 => s_axis_data(60),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(28),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(12)
    );
\fifo_rd_data[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(13),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(13),
      O => \ctrl_reg[3]_0\(45)
    );
\fifo_rd_data[45]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(13),
      I1 => s_axis_data(45),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(13),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(13)
    );
\fifo_rd_data[45]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(29),
      I1 => s_axis_data(61),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(29),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(13)
    );
\fifo_rd_data[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(14),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(14),
      O => \ctrl_reg[3]_0\(46)
    );
\fifo_rd_data[46]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(14),
      I1 => s_axis_data(46),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(14),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(14)
    );
\fifo_rd_data[46]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(30),
      I1 => s_axis_data(62),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(30),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(14)
    );
\fifo_rd_data[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_2_in(15),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_1_in(15),
      O => \ctrl_reg[3]_0\(47)
    );
\fifo_rd_data[47]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(15),
      I1 => s_axis_data(47),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => s_axis_data(15),
      I4 => \ctrl_reg_n_0_[3]\,
      O => p_2_in(15)
    );
\fifo_rd_data[47]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(31),
      I1 => s_axis_data(63),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => s_axis_data(31),
      I4 => \ctrl_reg_n_0_[11]\,
      O => p_1_in(15)
    );
\fifo_rd_data[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(0),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(0),
      O => \ctrl_reg[3]_0\(48)
    );
\fifo_rd_data[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(1),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(1),
      O => \ctrl_reg[3]_0\(49)
    );
\fifo_rd_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[4]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[4]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(4)
    );
\fifo_rd_data[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(4),
      I1 => s_axis_data(36),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(4),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[4]_i_2_n_0\
    );
\fifo_rd_data[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(20),
      I1 => s_axis_data(52),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(20),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[4]_i_3_n_0\
    );
\fifo_rd_data[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(2),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(2),
      O => \ctrl_reg[3]_0\(50)
    );
\fifo_rd_data[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(3),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(3),
      O => \ctrl_reg[3]_0\(51)
    );
\fifo_rd_data[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(4),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(4),
      O => \ctrl_reg[3]_0\(52)
    );
\fifo_rd_data[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(5),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(5),
      O => \ctrl_reg[3]_0\(53)
    );
\fifo_rd_data[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(6),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(6),
      O => \ctrl_reg[3]_0\(54)
    );
\fifo_rd_data[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(7),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(7),
      O => \ctrl_reg[3]_0\(55)
    );
\fifo_rd_data[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(8),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(8),
      O => \ctrl_reg[3]_0\(56)
    );
\fifo_rd_data[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(9),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(9),
      O => \ctrl_reg[3]_0\(57)
    );
\fifo_rd_data[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(10),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(10),
      O => \ctrl_reg[3]_0\(58)
    );
\fifo_rd_data[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(11),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(11),
      O => \ctrl_reg[3]_0\(59)
    );
\fifo_rd_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[5]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[5]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(5)
    );
\fifo_rd_data[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(5),
      I1 => s_axis_data(37),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(5),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[5]_i_2_n_0\
    );
\fifo_rd_data[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(21),
      I1 => s_axis_data(53),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(21),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[5]_i_3_n_0\
    );
\fifo_rd_data[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(12),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(12),
      O => \ctrl_reg[3]_0\(60)
    );
\fifo_rd_data[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(13),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(13),
      O => \ctrl_reg[3]_0\(61)
    );
\fifo_rd_data[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(14),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(14),
      O => \ctrl_reg[3]_0\(62)
    );
\fifo_rd_data[63]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(15),
      I1 => \fifo_rd_data_reg[32]\(1),
      I2 => p_2_in(15),
      O => \ctrl_reg[3]_0\(63)
    );
\fifo_rd_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[6]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[6]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(6)
    );
\fifo_rd_data[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(6),
      I1 => s_axis_data(38),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(6),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[6]_i_2_n_0\
    );
\fifo_rd_data[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(22),
      I1 => s_axis_data(54),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(22),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[6]_i_3_n_0\
    );
\fifo_rd_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[7]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[7]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(7)
    );
\fifo_rd_data[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(7),
      I1 => s_axis_data(39),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(7),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[7]_i_2_n_0\
    );
\fifo_rd_data[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(23),
      I1 => s_axis_data(55),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(23),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[7]_i_3_n_0\
    );
\fifo_rd_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[8]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[8]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(8)
    );
\fifo_rd_data[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(8),
      I1 => s_axis_data(40),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(8),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[8]_i_2_n_0\
    );
\fifo_rd_data[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(24),
      I1 => s_axis_data(56),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(24),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[8]_i_3_n_0\
    );
\fifo_rd_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_rd_data[9]_i_2_n_0\,
      I1 => \fifo_rd_data_reg[32]\(0),
      I2 => \fifo_rd_data[9]_i_3_n_0\,
      O => \ctrl_reg[3]_0\(9)
    );
\fifo_rd_data[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(9),
      I1 => s_axis_data(41),
      I2 => \ctrl_reg_n_0_[0]\,
      I3 => s_axis_data(9),
      I4 => \ctrl_reg_n_0_[1]\,
      O => \fifo_rd_data[9]_i_2_n_0\
    );
\fifo_rd_data[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \fifo_rd_data_reg[31]\(25),
      I1 => s_axis_data(57),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => s_axis_data(25),
      I4 => \ctrl_reg_n_0_[9]\,
      O => \fifo_rd_data[9]_i_3_n_0\
    );
\gen_input_buffer.rotate_next[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \ctrl_reg[11]_0\,
      I1 => fifo_rd_en,
      I2 => s_axis_valid,
      O => \^e\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_util_dac_1_upack_0_pack_network__parameterized0\ is
  port (
    \ctrl_reg[3]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ctrl_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_prefix_count[3].prefix_count_reg\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_util_dac_1_upack_0_pack_network__parameterized0\ : entity is "pack_network";
end \system_util_dac_1_upack_0_pack_network__parameterized0\;

architecture STRUCTURE of \system_util_dac_1_upack_0_pack_network__parameterized0\ is
  signal \ctrl[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \ctrl[3]_i_1__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ctrl[1]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \ctrl[3]_i_1__0\ : label is "soft_lutpair35";
begin
\ctrl[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Q(0),
      I1 => \ctrl_reg[1]_0\(0),
      O => \ctrl[1]_i_1__0_n_0\
    );
\ctrl[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \gen_prefix_count[3].prefix_count_reg\,
      I1 => \ctrl_reg[1]_0\(0),
      O => \ctrl[3]_i_1__0_n_0\
    );
\ctrl_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \ctrl[1]_i_1__0_n_0\,
      Q => \ctrl_reg[3]_0\(0),
      R => '0'
    );
\ctrl_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => E(0),
      D => \ctrl[3]_i_1__0_n_0\,
      Q => \ctrl_reg[3]_0\(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_util_dac_1_upack_0_pack_shell is
  port (
    reset_data_reg_0 : out STD_LOGIC;
    fifo_rd_valid0 : out STD_LOGIC;
    s_axis_ready : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ctrl_reg[3]\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_rd_en : in STD_LOGIC;
    s_axis_valid : in STD_LOGIC;
    reset : in STD_LOGIC;
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_util_dac_1_upack_0_pack_shell : entity is "pack_shell";
end system_util_dac_1_upack_0_pack_shell;

architecture STRUCTURE of system_util_dac_1_upack_0_pack_shell is
  signal ce_ctrl : STD_LOGIC;
  signal enable_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \enable_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \enable_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[0]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[1]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[2]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d10\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[10]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[11]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[12]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[13]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[14]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[15]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[2]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[4]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[5]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[6]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[7]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[8]\ : STD_LOGIC;
  signal \gen_input_buffer.data_d1_reg_n_0_[9]\ : STD_LOGIC;
  signal \gen_input_buffer.ready_i_1_n_0\ : STD_LOGIC;
  signal \gen_input_buffer.rotate_msb\ : STD_LOGIC;
  signal \gen_input_buffer.rotate_next\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \gen_input_buffer.rotate_next[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_input_buffer.rotate_next[1]_i_1_n_0\ : STD_LOGIC;
  signal \gen_input_buffer.rotate_next_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_input_buffer.rotate_next_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_prefix_count[2].prefix_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \gen_prefix_count[2].prefix_count_reg\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_prefix_count[3].prefix_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \gen_prefix_count[3].prefix_count_reg\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \prefix_count_s[2]\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal ready : STD_LOGIC;
  signal ready0 : STD_LOGIC;
  signal reset_ctrl : STD_LOGIC;
  signal reset_ctrl0 : STD_LOGIC;
  signal reset_ctrl_i_2_n_0 : STD_LOGIC;
  signal reset_ctrl_i_3_n_0 : STD_LOGIC;
  signal reset_data : STD_LOGIC;
  signal reset_data_i_1_n_0 : STD_LOGIC;
  signal rotate : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal startup_ctrl : STD_LOGIC;
  signal startup_ctrl2 : STD_LOGIC;
  signal startup_ctrl2_i_1_n_0 : STD_LOGIC;
  signal startup_ctrl_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \enable_count[0]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \enable_count[1]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \fifo_rd_data[15]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of fifo_rd_underflow_i_1 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of fifo_rd_valid_i_2 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \gen_input_buffer.rotate_msb_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gen_input_buffer.rotate_next[0]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gen_input_buffer.rotate_next[1]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gen_input_buffer.rotate_next[2]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gen_prefix_count[2].prefix_count[4]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gen_prefix_count[3].prefix_count[6]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of s_axis_ready_INST_0 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of startup_ctrl2_i_1 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of startup_ctrl_i_1 : label is "soft_lutpair36";
begin
\enable_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \enable_int_reg_n_0_[1]\,
      I1 => \enable_int_reg_n_0_[0]\,
      I2 => \enable_int_reg_n_0_[3]\,
      I3 => \enable_int_reg_n_0_[2]\,
      O => \enable_count[0]_i_1_n_0\
    );
\enable_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E881"
    )
        port map (
      I0 => \enable_int_reg_n_0_[2]\,
      I1 => \enable_int_reg_n_0_[3]\,
      I2 => \enable_int_reg_n_0_[1]\,
      I3 => \enable_int_reg_n_0_[0]\,
      O => \enable_count[1]_i_1_n_0\
    );
\enable_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \enable_count[0]_i_1_n_0\,
      Q => enable_count(0),
      R => '0'
    );
\enable_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \enable_count[1]_i_1_n_0\,
      Q => enable_count(1),
      R => '0'
    );
\enable_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => D(0),
      Q => \enable_int_reg_n_0_[0]\,
      R => reset
    );
\enable_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => D(1),
      Q => \enable_int_reg_n_0_[1]\,
      R => reset
    );
\enable_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => D(2),
      Q => \enable_int_reg_n_0_[2]\,
      R => reset
    );
\enable_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => D(3),
      Q => \enable_int_reg_n_0_[3]\,
      R => reset
    );
\fifo_rd_data[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => reset_data,
      I1 => s_axis_valid,
      I2 => fifo_rd_en,
      O => SR(0)
    );
fifo_rd_underflow_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_data,
      I1 => s_axis_valid,
      O => reset_data_reg_0
    );
fifo_rd_valid_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axis_valid,
      I1 => reset_data,
      O => fifo_rd_valid0
    );
\gen_input_buffer.data_d1[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => fifo_rd_en,
      I1 => s_axis_valid,
      I2 => ready,
      O => \gen_input_buffer.data_d10\
    );
\gen_input_buffer.data_d1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(32),
      Q => \gen_input_buffer.data_d1_reg_n_0_[0]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(42),
      Q => \gen_input_buffer.data_d1_reg_n_0_[10]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(43),
      Q => \gen_input_buffer.data_d1_reg_n_0_[11]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(44),
      Q => \gen_input_buffer.data_d1_reg_n_0_[12]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(45),
      Q => \gen_input_buffer.data_d1_reg_n_0_[13]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(46),
      Q => \gen_input_buffer.data_d1_reg_n_0_[14]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(47),
      Q => \gen_input_buffer.data_d1_reg_n_0_[15]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(48),
      Q => p_3_in(0),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(49),
      Q => p_3_in(1),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(50),
      Q => p_3_in(2),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(51),
      Q => p_3_in(3),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(33),
      Q => \gen_input_buffer.data_d1_reg_n_0_[1]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(52),
      Q => p_3_in(4),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(53),
      Q => p_3_in(5),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(54),
      Q => p_3_in(6),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(55),
      Q => p_3_in(7),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(56),
      Q => p_3_in(8),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(57),
      Q => p_3_in(9),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(58),
      Q => p_3_in(10),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(59),
      Q => p_3_in(11),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(60),
      Q => p_3_in(12),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(61),
      Q => p_3_in(13),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(34),
      Q => \gen_input_buffer.data_d1_reg_n_0_[2]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(62),
      Q => p_3_in(14),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(63),
      Q => p_3_in(15),
      R => '0'
    );
\gen_input_buffer.data_d1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(35),
      Q => \gen_input_buffer.data_d1_reg_n_0_[3]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(36),
      Q => \gen_input_buffer.data_d1_reg_n_0_[4]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(37),
      Q => \gen_input_buffer.data_d1_reg_n_0_[5]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(38),
      Q => \gen_input_buffer.data_d1_reg_n_0_[6]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(39),
      Q => \gen_input_buffer.data_d1_reg_n_0_[7]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(40),
      Q => \gen_input_buffer.data_d1_reg_n_0_[8]\,
      R => '0'
    );
\gen_input_buffer.data_d1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \gen_input_buffer.data_d10\,
      D => s_axis_data(41),
      Q => \gen_input_buffer.data_d1_reg_n_0_[9]\,
      R => '0'
    );
\gen_input_buffer.i_ext_ctrl_interconnect\: entity work.system_util_dac_1_upack_0_pack_network
     port map (
      D(0) => \gen_input_buffer.rotate_msb\,
      E(0) => ce_ctrl,
      Q(1 downto 0) => \gen_prefix_count[2].prefix_count_reg\(1 downto 0),
      clk => clk,
      \ctrl_reg[11]_0\ => startup_ctrl,
      \ctrl_reg[3]_0\(63 downto 0) => \ctrl_reg[3]\(63 downto 0),
      \ctrl_reg[8]_0\(1 downto 0) => rotate(1 downto 0),
      \fifo_rd_data_reg[31]\(31 downto 16) => p_3_in(15 downto 0),
      \fifo_rd_data_reg[31]\(15) => \gen_input_buffer.data_d1_reg_n_0_[15]\,
      \fifo_rd_data_reg[31]\(14) => \gen_input_buffer.data_d1_reg_n_0_[14]\,
      \fifo_rd_data_reg[31]\(13) => \gen_input_buffer.data_d1_reg_n_0_[13]\,
      \fifo_rd_data_reg[31]\(12) => \gen_input_buffer.data_d1_reg_n_0_[12]\,
      \fifo_rd_data_reg[31]\(11) => \gen_input_buffer.data_d1_reg_n_0_[11]\,
      \fifo_rd_data_reg[31]\(10) => \gen_input_buffer.data_d1_reg_n_0_[10]\,
      \fifo_rd_data_reg[31]\(9) => \gen_input_buffer.data_d1_reg_n_0_[9]\,
      \fifo_rd_data_reg[31]\(8) => \gen_input_buffer.data_d1_reg_n_0_[8]\,
      \fifo_rd_data_reg[31]\(7) => \gen_input_buffer.data_d1_reg_n_0_[7]\,
      \fifo_rd_data_reg[31]\(6) => \gen_input_buffer.data_d1_reg_n_0_[6]\,
      \fifo_rd_data_reg[31]\(5) => \gen_input_buffer.data_d1_reg_n_0_[5]\,
      \fifo_rd_data_reg[31]\(4) => \gen_input_buffer.data_d1_reg_n_0_[4]\,
      \fifo_rd_data_reg[31]\(3) => \gen_input_buffer.data_d1_reg_n_0_[3]\,
      \fifo_rd_data_reg[31]\(2) => \gen_input_buffer.data_d1_reg_n_0_[2]\,
      \fifo_rd_data_reg[31]\(1) => \gen_input_buffer.data_d1_reg_n_0_[1]\,
      \fifo_rd_data_reg[31]\(0) => \gen_input_buffer.data_d1_reg_n_0_[0]\,
      \fifo_rd_data_reg[32]\(1) => p_1_in,
      \fifo_rd_data_reg[32]\(0) => p_0_in,
      fifo_rd_en => fifo_rd_en,
      s_axis_data(63 downto 0) => s_axis_data(63 downto 0),
      s_axis_valid => s_axis_valid
    );
\gen_input_buffer.ready_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEEE2E22"
    )
        port map (
      I0 => ready,
      I1 => ce_ctrl,
      I2 => \gen_input_buffer.rotate_msb\,
      I3 => \gen_input_buffer.rotate_next\(2),
      I4 => ready0,
      I5 => reset_ctrl,
      O => \gen_input_buffer.ready_i_1_n_0\
    );
\gen_input_buffer.ready_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \gen_input_buffer.ready_i_1_n_0\,
      Q => ready,
      R => '0'
    );
\gen_input_buffer.rotate_msb_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F880"
    )
        port map (
      I0 => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      I1 => enable_count(0),
      I2 => enable_count(1),
      I3 => \gen_input_buffer.rotate_next_reg_n_0_[1]\,
      O => ready0
    );
\gen_input_buffer.rotate_msb_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => ready0,
      Q => \gen_input_buffer.rotate_msb\,
      R => reset_ctrl
    );
\gen_input_buffer.rotate_next[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => enable_count(0),
      I1 => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      O => \gen_input_buffer.rotate_next[0]_i_1_n_0\
    );
\gen_input_buffer.rotate_next[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E11E"
    )
        port map (
      I0 => enable_count(0),
      I1 => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      I2 => enable_count(1),
      I3 => \gen_input_buffer.rotate_next_reg_n_0_[1]\,
      O => \gen_input_buffer.rotate_next[1]_i_1_n_0\
    );
\gen_input_buffer.rotate_next[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEE8"
    )
        port map (
      I0 => enable_count(1),
      I1 => \gen_input_buffer.rotate_next_reg_n_0_[1]\,
      I2 => enable_count(0),
      I3 => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      O => p_0_in1_in
    );
\gen_input_buffer.rotate_next_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_input_buffer.rotate_next[0]_i_1_n_0\,
      Q => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      R => reset_ctrl
    );
\gen_input_buffer.rotate_next_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_input_buffer.rotate_next[1]_i_1_n_0\,
      Q => \gen_input_buffer.rotate_next_reg_n_0_[1]\,
      R => reset_ctrl
    );
\gen_input_buffer.rotate_next_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ce_ctrl,
      D => p_0_in1_in,
      Q => \gen_input_buffer.rotate_next\(2),
      R => reset_ctrl
    );
\gen_input_buffer.rotate_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_input_buffer.rotate_next_reg_n_0_[0]\,
      Q => rotate(0),
      R => reset_ctrl
    );
\gen_input_buffer.rotate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_input_buffer.rotate_next_reg_n_0_[1]\,
      Q => rotate(1),
      R => reset_ctrl
    );
\gen_network[1].i_ctrl_interconnect\: entity work.\system_util_dac_1_upack_0_pack_network__parameterized0\
     port map (
      E(0) => ce_ctrl,
      Q(0) => \enable_int_reg_n_0_[0]\,
      clk => clk,
      \ctrl_reg[1]_0\(0) => rotate(0),
      \ctrl_reg[3]_0\(1) => p_1_in,
      \ctrl_reg[3]_0\(0) => p_0_in,
      \gen_prefix_count[3].prefix_count_reg\ => \gen_prefix_count[3].prefix_count_reg\
    );
\gen_prefix_count[2].prefix_count[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \enable_int_reg_n_0_[1]\,
      I1 => \enable_int_reg_n_0_[0]\,
      O => \gen_prefix_count[2].prefix_count[4]_i_1_n_0\
    );
\gen_prefix_count[2].prefix_count[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \enable_int_reg_n_0_[1]\,
      I1 => \enable_int_reg_n_0_[0]\,
      O => \prefix_count_s[2]\(1)
    );
\gen_prefix_count[2].prefix_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \gen_prefix_count[2].prefix_count[4]_i_1_n_0\,
      Q => \gen_prefix_count[2].prefix_count_reg\(0),
      R => '0'
    );
\gen_prefix_count[2].prefix_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \prefix_count_s[2]\(1),
      Q => \gen_prefix_count[2].prefix_count_reg\(1),
      R => '0'
    );
\gen_prefix_count[3].prefix_count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \enable_int_reg_n_0_[2]\,
      I1 => \enable_int_reg_n_0_[0]\,
      I2 => \enable_int_reg_n_0_[1]\,
      O => \gen_prefix_count[3].prefix_count[6]_i_1_n_0\
    );
\gen_prefix_count[3].prefix_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \gen_prefix_count[3].prefix_count[6]_i_1_n_0\,
      Q => \gen_prefix_count[3].prefix_count_reg\,
      R => '0'
    );
reset_ctrl_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => reset,
      I1 => D(1),
      I2 => D(0),
      I3 => D(2),
      I4 => D(3),
      O => reset_ctrl0
    );
reset_ctrl_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F6"
    )
        port map (
      I0 => D(3),
      I1 => \enable_int_reg_n_0_[3]\,
      I2 => reset_ctrl_i_3_n_0,
      O => reset_ctrl_i_2_n_0
    );
reset_ctrl_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => D(0),
      I1 => \enable_int_reg_n_0_[0]\,
      I2 => \enable_int_reg_n_0_[2]\,
      I3 => D(2),
      I4 => \enable_int_reg_n_0_[1]\,
      I5 => D(1),
      O => reset_ctrl_i_3_n_0
    );
reset_ctrl_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => reset_ctrl_i_2_n_0,
      Q => reset_ctrl,
      S => reset_ctrl0
    );
reset_data_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBE"
    )
        port map (
      I0 => startup_ctrl2,
      I1 => D(3),
      I2 => \enable_int_reg_n_0_[3]\,
      I3 => reset_ctrl_i_3_n_0,
      I4 => reset_ctrl0,
      O => reset_data_i_1_n_0
    );
reset_data_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => reset_data_i_1_n_0,
      Q => reset_data,
      R => '0'
    );
s_axis_ready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ready,
      I1 => fifo_rd_en,
      I2 => s_axis_valid,
      O => s_axis_ready
    );
startup_ctrl2_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFE"
    )
        port map (
      I0 => reset_ctrl,
      I1 => reset_ctrl_i_3_n_0,
      I2 => \enable_int_reg_n_0_[3]\,
      I3 => D(3),
      O => startup_ctrl2_i_1_n_0
    );
startup_ctrl2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => startup_ctrl2_i_1_n_0,
      Q => startup_ctrl2,
      R => reset_ctrl0
    );
startup_ctrl_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFE"
    )
        port map (
      I0 => startup_ctrl2,
      I1 => reset_ctrl,
      I2 => reset_ctrl_i_3_n_0,
      I3 => \enable_int_reg_n_0_[3]\,
      I4 => D(3),
      O => startup_ctrl_i_1_n_0
    );
startup_ctrl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => startup_ctrl_i_1_n_0,
      Q => startup_ctrl,
      R => reset_ctrl0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_util_dac_1_upack_0_util_upack2_impl is
  port (
    fifo_rd_valid : out STD_LOGIC;
    fifo_rd_underflow : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_ready : out STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_rd_en : in STD_LOGIC;
    s_axis_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_util_dac_1_upack_0_util_upack2_impl : entity is "util_upack2_impl";
end system_util_dac_1_upack_0_util_upack2_impl;

architecture STRUCTURE of system_util_dac_1_upack_0_util_upack2_impl is
  signal deinterleaved_data : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_rd_valid0 : STD_LOGIC;
  signal fifo_rd_valid_i_1_n_0 : STD_LOGIC;
  signal i_pack_shell_n_0 : STD_LOGIC;
  signal i_pack_shell_n_3 : STD_LOGIC;
begin
\fifo_rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(0),
      Q => Q(0),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(10),
      Q => Q(10),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(11),
      Q => Q(11),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(12),
      Q => Q(12),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(13),
      Q => Q(13),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(14),
      Q => Q(14),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(15),
      Q => Q(15),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(16),
      Q => Q(16),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(17),
      Q => Q(17),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(18),
      Q => Q(18),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(19),
      Q => Q(19),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(1),
      Q => Q(1),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(20),
      Q => Q(20),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(21),
      Q => Q(21),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(22),
      Q => Q(22),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(23),
      Q => Q(23),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(24),
      Q => Q(24),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(25),
      Q => Q(25),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(26),
      Q => Q(26),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(27),
      Q => Q(27),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(28),
      Q => Q(28),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(29),
      Q => Q(29),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(2),
      Q => Q(2),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(30),
      Q => Q(30),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(31),
      Q => Q(31),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(32),
      Q => Q(32),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(33),
      Q => Q(33),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(34),
      Q => Q(34),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(35),
      Q => Q(35),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(36),
      Q => Q(36),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(37),
      Q => Q(37),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(38),
      Q => Q(38),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(39),
      Q => Q(39),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(3),
      Q => Q(3),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(40),
      Q => Q(40),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(41),
      Q => Q(41),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(42),
      Q => Q(42),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(43),
      Q => Q(43),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(44),
      Q => Q(44),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(45),
      Q => Q(45),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(46),
      Q => Q(46),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(47),
      Q => Q(47),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(48),
      Q => Q(48),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(49),
      Q => Q(49),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(4),
      Q => Q(4),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(50),
      Q => Q(50),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(51),
      Q => Q(51),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(52),
      Q => Q(52),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(53),
      Q => Q(53),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(54),
      Q => Q(54),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(55),
      Q => Q(55),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(56),
      Q => Q(56),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(57),
      Q => Q(57),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(58),
      Q => Q(58),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(59),
      Q => Q(59),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(5),
      Q => Q(5),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(60),
      Q => Q(60),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(61),
      Q => Q(61),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(62),
      Q => Q(62),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(63),
      Q => Q(63),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(6),
      Q => Q(6),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(7),
      Q => Q(7),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(8),
      Q => Q(8),
      R => i_pack_shell_n_3
    );
\fifo_rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => fifo_rd_en,
      D => deinterleaved_data(9),
      Q => Q(9),
      R => i_pack_shell_n_3
    );
fifo_rd_underflow_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => i_pack_shell_n_0,
      Q => fifo_rd_underflow,
      R => fifo_rd_valid_i_1_n_0
    );
fifo_rd_valid_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_rd_en,
      O => fifo_rd_valid_i_1_n_0
    );
fifo_rd_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => fifo_rd_valid0,
      Q => fifo_rd_valid,
      R => fifo_rd_valid_i_1_n_0
    );
i_pack_shell: entity work.system_util_dac_1_upack_0_pack_shell
     port map (
      D(3 downto 0) => D(3 downto 0),
      SR(0) => i_pack_shell_n_3,
      clk => clk,
      \ctrl_reg[3]\(63 downto 0) => deinterleaved_data(63 downto 0),
      fifo_rd_en => fifo_rd_en,
      fifo_rd_valid0 => fifo_rd_valid0,
      reset => reset,
      reset_data_reg_0 => i_pack_shell_n_0,
      s_axis_data(63 downto 0) => s_axis_data(63 downto 0),
      s_axis_ready => s_axis_ready,
      s_axis_valid => s_axis_valid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_util_dac_1_upack_0_util_upack2 is
  port (
    fifo_rd_valid : out STD_LOGIC;
    fifo_rd_underflow : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_ready : out STD_LOGIC;
    reset : in STD_LOGIC;
    enable_3 : in STD_LOGIC;
    clk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_rd_en : in STD_LOGIC;
    s_axis_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_util_dac_1_upack_0_util_upack2 : entity is "util_upack2";
end system_util_dac_1_upack_0_util_upack2;

architecture STRUCTURE of system_util_dac_1_upack_0_util_upack2 is
begin
i_upack: entity work.system_util_dac_1_upack_0_util_upack2_impl
     port map (
      D(3) => enable_3,
      D(2 downto 0) => D(2 downto 0),
      Q(63 downto 0) => Q(63 downto 0),
      clk => clk,
      fifo_rd_en => fifo_rd_en,
      fifo_rd_underflow => fifo_rd_underflow,
      fifo_rd_valid => fifo_rd_valid,
      reset => reset,
      s_axis_data(63 downto 0) => s_axis_data(63 downto 0),
      s_axis_ready => s_axis_ready,
      s_axis_valid => s_axis_valid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_util_dac_1_upack_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable_0 : in STD_LOGIC;
    enable_1 : in STD_LOGIC;
    enable_2 : in STD_LOGIC;
    enable_3 : in STD_LOGIC;
    fifo_rd_en : in STD_LOGIC;
    fifo_rd_valid : out STD_LOGIC;
    fifo_rd_underflow : out STD_LOGIC;
    fifo_rd_data_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_rd_data_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_rd_data_2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_rd_data_3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_valid : in STD_LOGIC;
    s_axis_ready : out STD_LOGIC;
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_util_dac_1_upack_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_util_dac_1_upack_0 : entity is "system_util_dac_1_upack_0,util_upack2,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_util_dac_1_upack_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_util_dac_1_upack_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_util_dac_1_upack_0 : entity is "util_upack2,Vivado 2025.1";
end system_util_dac_1_upack_0;

architecture STRUCTURE of system_util_dac_1_upack_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 s_axis_signal_clock CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME s_axis_signal_clock, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 s_axis_signal_reset RST";
  attribute X_INTERFACE_MODE of reset : signal is "slave";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME s_axis_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_ready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_valid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_MODE of s_axis_valid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_valid : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_data : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
begin
inst: entity work.system_util_dac_1_upack_0_util_upack2
     port map (
      D(2) => enable_2,
      D(1) => enable_1,
      D(0) => enable_0,
      Q(63 downto 48) => fifo_rd_data_3(15 downto 0),
      Q(47 downto 32) => fifo_rd_data_2(15 downto 0),
      Q(31 downto 16) => fifo_rd_data_1(15 downto 0),
      Q(15 downto 0) => fifo_rd_data_0(15 downto 0),
      clk => clk,
      enable_3 => enable_3,
      fifo_rd_en => fifo_rd_en,
      fifo_rd_underflow => fifo_rd_underflow,
      fifo_rd_valid => fifo_rd_valid,
      reset => reset,
      s_axis_data(63 downto 0) => s_axis_data(63 downto 0),
      s_axis_ready => s_axis_ready,
      s_axis_valid => s_axis_valid
    );
end STRUCTURE;
