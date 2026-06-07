-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:18:07 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_util_adc_1_pack_0_sim_netlist.vhdl
-- Design      : system_util_adc_1_pack_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \fifo_wr_data_1[15]\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    \ctrl_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \ctrl_reg[0]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \ctrl_reg[0]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \ctrl_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    \packed_fifo_wr_data_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \packed_fifo_wr_data_reg[31]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    fifo_wr_data_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network is
  signal \^d\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ctrl[1]_i_2_n_0\ : STD_LOGIC;
  signal \ctrl[3]_i_2_n_0\ : STD_LOGIC;
  signal \ctrl[5]_i_2_n_0\ : STD_LOGIC;
  signal \ctrl[7]_i_2_n_0\ : STD_LOGIC;
  signal \ctrl_\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ctrl_s : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ctrl[1]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ctrl[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ctrl[5]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ctrl[7]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[10]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[11]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[12]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[14]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[15]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[16]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[17]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[18]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[19]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[20]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[21]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[22]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[23]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[24]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[25]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[26]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[27]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[28]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[29]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[30]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[31]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[9]_i_1\ : label is "soft_lutpair5";
begin
  D(31 downto 0) <= \^d\(31 downto 0);
  E(0) <= \^e\(0);
\ctrl[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFB7E0B7ED"
    )
        port map (
      I0 => \ctrl_reg[0]_0\(1),
      I1 => \ctrl_reg[0]_0\(0),
      I2 => \ctrl_reg[0]_1\(1),
      I3 => \ctrl_reg[0]_1\(0),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl[1]_i_2_n_0\,
      O => ctrl_s(0)
    );
\ctrl[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAFFFFFFFFAEFFAE"
    )
        port map (
      I0 => \ctrl[1]_i_2_n_0\,
      I1 => \ctrl_reg[0]_0\(1),
      I2 => \ctrl_reg[0]_0\(0),
      I3 => \ctrl_reg[0]_1\(1),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl_reg[0]_1\(0),
      O => ctrl_s(1)
    );
\ctrl[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0960"
    )
        port map (
      I0 => \ctrl_reg[1]_0\(1),
      I1 => \ctrl_reg[0]_1\(1),
      I2 => \ctrl_reg[1]_0\(0),
      I3 => \ctrl_reg[0]_1\(0),
      O => \ctrl[1]_i_2_n_0\
    );
\ctrl[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFE07BED7B"
    )
        port map (
      I0 => \ctrl_reg[0]_0\(1),
      I1 => \ctrl_reg[0]_0\(0),
      I2 => \ctrl_reg[0]_1\(1),
      I3 => \ctrl_reg[0]_1\(0),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl[3]_i_2_n_0\,
      O => ctrl_s(2)
    );
\ctrl[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAEFFBAFFAEFFFF"
    )
        port map (
      I0 => \ctrl[3]_i_2_n_0\,
      I1 => \ctrl_reg[0]_0\(1),
      I2 => \ctrl_reg[0]_0\(0),
      I3 => \ctrl_reg[0]_1\(1),
      I4 => \ctrl_reg[0]_1\(0),
      I5 => \ctrl_reg[0]_2\(0),
      O => ctrl_s(3)
    );
\ctrl[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => \ctrl_reg[1]_0\(1),
      I1 => \ctrl_reg[0]_1\(1),
      I2 => \ctrl_reg[0]_1\(0),
      I3 => \ctrl_reg[1]_0\(0),
      O => \ctrl[3]_i_2_n_0\
    );
\ctrl[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7B0E7BDE"
    )
        port map (
      I0 => \ctrl_reg[0]_0\(1),
      I1 => \ctrl_reg[0]_0\(0),
      I2 => \ctrl_reg[0]_1\(1),
      I3 => \ctrl_reg[0]_1\(0),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl[5]_i_2_n_0\,
      O => ctrl_s(4)
    );
\ctrl[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBAFFFFAEFFAEFF"
    )
        port map (
      I0 => \ctrl[5]_i_2_n_0\,
      I1 => \ctrl_reg[0]_0\(1),
      I2 => \ctrl_reg[0]_0\(0),
      I3 => \ctrl_reg[0]_1\(1),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl_reg[0]_1\(0),
      O => ctrl_s(5)
    );
\ctrl[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0690"
    )
        port map (
      I0 => \ctrl_reg[1]_0\(1),
      I1 => \ctrl_reg[0]_1\(1),
      I2 => \ctrl_reg[1]_0\(0),
      I3 => \ctrl_reg[0]_1\(0),
      O => \ctrl[5]_i_2_n_0\
    );
\ctrl[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0EB7DEB7"
    )
        port map (
      I0 => \ctrl_reg[0]_0\(1),
      I1 => \ctrl_reg[0]_0\(0),
      I2 => \ctrl_reg[0]_1\(1),
      I3 => \ctrl_reg[0]_1\(0),
      I4 => \ctrl_reg[0]_2\(0),
      I5 => \ctrl[7]_i_2_n_0\,
      O => ctrl_s(6)
    );
\ctrl[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEFFBAFFAEFFFFFF"
    )
        port map (
      I0 => \ctrl[7]_i_2_n_0\,
      I1 => \ctrl_reg[0]_0\(1),
      I2 => \ctrl_reg[0]_0\(0),
      I3 => \ctrl_reg[0]_1\(1),
      I4 => \ctrl_reg[0]_1\(0),
      I5 => \ctrl_reg[0]_2\(0),
      O => ctrl_s(7)
    );
\ctrl[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \ctrl_reg[1]_0\(1),
      I1 => \ctrl_reg[0]_1\(1),
      I2 => \ctrl_reg[0]_1\(0),
      I3 => \ctrl_reg[1]_0\(0),
      O => \ctrl[7]_i_2_n_0\
    );
\ctrl_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(0),
      Q => \ctrl_\(0),
      R => '0'
    );
\ctrl_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(1),
      Q => \ctrl_\(1),
      R => '0'
    );
\ctrl_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(2),
      Q => \ctrl_\(2),
      R => '0'
    );
\ctrl_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(3),
      Q => \ctrl_\(3),
      R => '0'
    );
\ctrl_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(4),
      Q => \ctrl_\(4),
      R => '0'
    );
\ctrl_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(5),
      Q => \ctrl_\(5),
      R => '0'
    );
\ctrl_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(6),
      Q => \ctrl_\(6),
      R => '0'
    );
\ctrl_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^e\(0),
      D => ctrl_s(7),
      Q => \ctrl_\(7),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(0),
      I1 => fifo_wr_data_0(0),
      I2 => fifo_wr_data_3(0),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(0),
      O => \^d\(0)
    );
\gen_pack.gen_output_buffer.data_d1[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(10),
      I1 => fifo_wr_data_0(10),
      I2 => fifo_wr_data_3(10),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(10),
      O => \^d\(10)
    );
\gen_pack.gen_output_buffer.data_d1[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(11),
      I1 => fifo_wr_data_0(11),
      I2 => fifo_wr_data_3(11),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(11),
      O => \^d\(11)
    );
\gen_pack.gen_output_buffer.data_d1[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(12),
      I1 => fifo_wr_data_0(12),
      I2 => fifo_wr_data_3(12),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(12),
      O => \^d\(12)
    );
\gen_pack.gen_output_buffer.data_d1[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(13),
      I1 => fifo_wr_data_0(13),
      I2 => fifo_wr_data_3(13),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(13),
      O => \^d\(13)
    );
\gen_pack.gen_output_buffer.data_d1[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(14),
      I1 => fifo_wr_data_0(14),
      I2 => fifo_wr_data_3(14),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(14),
      O => \^d\(14)
    );
\gen_pack.gen_output_buffer.data_d1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(15),
      I1 => fifo_wr_data_0(15),
      I2 => fifo_wr_data_3(15),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(15),
      O => \^d\(15)
    );
\gen_pack.gen_output_buffer.data_d1[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(0),
      I1 => fifo_wr_data_0(0),
      I2 => fifo_wr_data_3(0),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(0),
      O => \^d\(16)
    );
\gen_pack.gen_output_buffer.data_d1[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(1),
      I1 => fifo_wr_data_0(1),
      I2 => fifo_wr_data_3(1),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(1),
      O => \^d\(17)
    );
\gen_pack.gen_output_buffer.data_d1[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(2),
      I1 => fifo_wr_data_0(2),
      I2 => fifo_wr_data_3(2),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(2),
      O => \^d\(18)
    );
\gen_pack.gen_output_buffer.data_d1[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(3),
      I1 => fifo_wr_data_0(3),
      I2 => fifo_wr_data_3(3),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(3),
      O => \^d\(19)
    );
\gen_pack.gen_output_buffer.data_d1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(1),
      I1 => fifo_wr_data_0(1),
      I2 => fifo_wr_data_3(1),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(1),
      O => \^d\(1)
    );
\gen_pack.gen_output_buffer.data_d1[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(4),
      I1 => fifo_wr_data_0(4),
      I2 => fifo_wr_data_3(4),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(4),
      O => \^d\(20)
    );
\gen_pack.gen_output_buffer.data_d1[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(5),
      I1 => fifo_wr_data_0(5),
      I2 => fifo_wr_data_3(5),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(5),
      O => \^d\(21)
    );
\gen_pack.gen_output_buffer.data_d1[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(6),
      I1 => fifo_wr_data_0(6),
      I2 => fifo_wr_data_3(6),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(6),
      O => \^d\(22)
    );
\gen_pack.gen_output_buffer.data_d1[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(7),
      I1 => fifo_wr_data_0(7),
      I2 => fifo_wr_data_3(7),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(7),
      O => \^d\(23)
    );
\gen_pack.gen_output_buffer.data_d1[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(8),
      I1 => fifo_wr_data_0(8),
      I2 => fifo_wr_data_3(8),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(8),
      O => \^d\(24)
    );
\gen_pack.gen_output_buffer.data_d1[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(9),
      I1 => fifo_wr_data_0(9),
      I2 => fifo_wr_data_3(9),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(9),
      O => \^d\(25)
    );
\gen_pack.gen_output_buffer.data_d1[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(10),
      I1 => fifo_wr_data_0(10),
      I2 => fifo_wr_data_3(10),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(10),
      O => \^d\(26)
    );
\gen_pack.gen_output_buffer.data_d1[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(11),
      I1 => fifo_wr_data_0(11),
      I2 => fifo_wr_data_3(11),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(11),
      O => \^d\(27)
    );
\gen_pack.gen_output_buffer.data_d1[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(12),
      I1 => fifo_wr_data_0(12),
      I2 => fifo_wr_data_3(12),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(12),
      O => \^d\(28)
    );
\gen_pack.gen_output_buffer.data_d1[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(13),
      I1 => fifo_wr_data_0(13),
      I2 => fifo_wr_data_3(13),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(13),
      O => \^d\(29)
    );
\gen_pack.gen_output_buffer.data_d1[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(2),
      I1 => fifo_wr_data_0(2),
      I2 => fifo_wr_data_3(2),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(2),
      O => \^d\(2)
    );
\gen_pack.gen_output_buffer.data_d1[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(14),
      I1 => fifo_wr_data_0(14),
      I2 => fifo_wr_data_3(14),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(14),
      O => \^d\(30)
    );
\gen_pack.gen_output_buffer.data_d1[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(15),
      I1 => fifo_wr_data_0(15),
      I2 => fifo_wr_data_3(15),
      I3 => \ctrl_\(3),
      I4 => \ctrl_\(2),
      I5 => fifo_wr_data_2(15),
      O => \^d\(31)
    );
\gen_pack.gen_output_buffer.data_d1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(3),
      I1 => fifo_wr_data_0(3),
      I2 => fifo_wr_data_3(3),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(3),
      O => \^d\(3)
    );
\gen_pack.gen_output_buffer.data_d1[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(4),
      I1 => fifo_wr_data_0(4),
      I2 => fifo_wr_data_3(4),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(4),
      O => \^d\(4)
    );
\gen_pack.gen_output_buffer.data_d1[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(5),
      I1 => fifo_wr_data_0(5),
      I2 => fifo_wr_data_3(5),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(5),
      O => \^d\(5)
    );
\gen_pack.gen_output_buffer.data_d1[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(6),
      I1 => fifo_wr_data_0(6),
      I2 => fifo_wr_data_3(6),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(6),
      O => \^d\(6)
    );
\gen_pack.gen_output_buffer.data_d1[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(7),
      I1 => fifo_wr_data_0(7),
      I2 => fifo_wr_data_3(7),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(7),
      O => \^d\(7)
    );
\gen_pack.gen_output_buffer.data_d1[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(8),
      I1 => fifo_wr_data_0(8),
      I2 => fifo_wr_data_3(8),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(8),
      O => \^d\(8)
    );
\gen_pack.gen_output_buffer.data_d1[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(9),
      I1 => fifo_wr_data_0(9),
      I2 => fifo_wr_data_3(9),
      I3 => \ctrl_\(1),
      I4 => \ctrl_\(0),
      I5 => fifo_wr_data_2(9),
      O => \^d\(9)
    );
\packed_fifo_wr_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(0),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(0),
      O => \fifo_wr_data_1[15]\(0)
    );
\packed_fifo_wr_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(10),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(10),
      O => \fifo_wr_data_1[15]\(10)
    );
\packed_fifo_wr_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(11),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(11),
      O => \fifo_wr_data_1[15]\(11)
    );
\packed_fifo_wr_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(12),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(12),
      O => \fifo_wr_data_1[15]\(12)
    );
\packed_fifo_wr_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(13),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(13),
      O => \fifo_wr_data_1[15]\(13)
    );
\packed_fifo_wr_data[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(14),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(14),
      O => \fifo_wr_data_1[15]\(14)
    );
\packed_fifo_wr_data[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(15),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(15),
      O => \fifo_wr_data_1[15]\(15)
    );
\packed_fifo_wr_data[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(16),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(16),
      O => \fifo_wr_data_1[15]\(16)
    );
\packed_fifo_wr_data[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(17),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(17),
      O => \fifo_wr_data_1[15]\(17)
    );
\packed_fifo_wr_data[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(18),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(18),
      O => \fifo_wr_data_1[15]\(18)
    );
\packed_fifo_wr_data[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(19),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(19),
      O => \fifo_wr_data_1[15]\(19)
    );
\packed_fifo_wr_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(1),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(1),
      O => \fifo_wr_data_1[15]\(1)
    );
\packed_fifo_wr_data[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(20),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(20),
      O => \fifo_wr_data_1[15]\(20)
    );
\packed_fifo_wr_data[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(21),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(21),
      O => \fifo_wr_data_1[15]\(21)
    );
\packed_fifo_wr_data[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(22),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(22),
      O => \fifo_wr_data_1[15]\(22)
    );
\packed_fifo_wr_data[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(23),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(23),
      O => \fifo_wr_data_1[15]\(23)
    );
\packed_fifo_wr_data[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(24),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(24),
      O => \fifo_wr_data_1[15]\(24)
    );
\packed_fifo_wr_data[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(25),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(25),
      O => \fifo_wr_data_1[15]\(25)
    );
\packed_fifo_wr_data[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(26),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(26),
      O => \fifo_wr_data_1[15]\(26)
    );
\packed_fifo_wr_data[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(27),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(27),
      O => \fifo_wr_data_1[15]\(27)
    );
\packed_fifo_wr_data[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(28),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(28),
      O => \fifo_wr_data_1[15]\(28)
    );
\packed_fifo_wr_data[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(29),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(29),
      O => \fifo_wr_data_1[15]\(29)
    );
\packed_fifo_wr_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(2),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(2),
      O => \fifo_wr_data_1[15]\(2)
    );
\packed_fifo_wr_data[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(30),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(30),
      O => \fifo_wr_data_1[15]\(30)
    );
\packed_fifo_wr_data[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(31),
      I1 => \packed_fifo_wr_data_reg[31]_0\(1),
      I2 => \^d\(31),
      O => \fifo_wr_data_1[15]\(31)
    );
\packed_fifo_wr_data[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(0),
      I1 => fifo_wr_data_0(0),
      I2 => fifo_wr_data_3(0),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(0),
      O => \fifo_wr_data_1[15]\(32)
    );
\packed_fifo_wr_data[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(1),
      I1 => fifo_wr_data_0(1),
      I2 => fifo_wr_data_3(1),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(1),
      O => \fifo_wr_data_1[15]\(33)
    );
\packed_fifo_wr_data[34]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(2),
      I1 => fifo_wr_data_0(2),
      I2 => fifo_wr_data_3(2),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(2),
      O => \fifo_wr_data_1[15]\(34)
    );
\packed_fifo_wr_data[35]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(3),
      I1 => fifo_wr_data_0(3),
      I2 => fifo_wr_data_3(3),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(3),
      O => \fifo_wr_data_1[15]\(35)
    );
\packed_fifo_wr_data[36]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(4),
      I1 => fifo_wr_data_0(4),
      I2 => fifo_wr_data_3(4),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(4),
      O => \fifo_wr_data_1[15]\(36)
    );
\packed_fifo_wr_data[37]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(5),
      I1 => fifo_wr_data_0(5),
      I2 => fifo_wr_data_3(5),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(5),
      O => \fifo_wr_data_1[15]\(37)
    );
\packed_fifo_wr_data[38]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(6),
      I1 => fifo_wr_data_0(6),
      I2 => fifo_wr_data_3(6),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(6),
      O => \fifo_wr_data_1[15]\(38)
    );
\packed_fifo_wr_data[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(7),
      I1 => fifo_wr_data_0(7),
      I2 => fifo_wr_data_3(7),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(7),
      O => \fifo_wr_data_1[15]\(39)
    );
\packed_fifo_wr_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(3),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(3),
      O => \fifo_wr_data_1[15]\(3)
    );
\packed_fifo_wr_data[40]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(8),
      I1 => fifo_wr_data_0(8),
      I2 => fifo_wr_data_3(8),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(8),
      O => \fifo_wr_data_1[15]\(40)
    );
\packed_fifo_wr_data[41]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(9),
      I1 => fifo_wr_data_0(9),
      I2 => fifo_wr_data_3(9),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(9),
      O => \fifo_wr_data_1[15]\(41)
    );
\packed_fifo_wr_data[42]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(10),
      I1 => fifo_wr_data_0(10),
      I2 => fifo_wr_data_3(10),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(10),
      O => \fifo_wr_data_1[15]\(42)
    );
\packed_fifo_wr_data[43]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(11),
      I1 => fifo_wr_data_0(11),
      I2 => fifo_wr_data_3(11),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(11),
      O => \fifo_wr_data_1[15]\(43)
    );
\packed_fifo_wr_data[44]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(12),
      I1 => fifo_wr_data_0(12),
      I2 => fifo_wr_data_3(12),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(12),
      O => \fifo_wr_data_1[15]\(44)
    );
\packed_fifo_wr_data[45]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(13),
      I1 => fifo_wr_data_0(13),
      I2 => fifo_wr_data_3(13),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(13),
      O => \fifo_wr_data_1[15]\(45)
    );
\packed_fifo_wr_data[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(14),
      I1 => fifo_wr_data_0(14),
      I2 => fifo_wr_data_3(14),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(14),
      O => \fifo_wr_data_1[15]\(46)
    );
\packed_fifo_wr_data[47]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(15),
      I1 => fifo_wr_data_0(15),
      I2 => fifo_wr_data_3(15),
      I3 => \ctrl_\(5),
      I4 => \ctrl_\(4),
      I5 => fifo_wr_data_2(15),
      O => \fifo_wr_data_1[15]\(47)
    );
\packed_fifo_wr_data[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(0),
      I1 => fifo_wr_data_0(0),
      I2 => fifo_wr_data_3(0),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(0),
      O => \fifo_wr_data_1[15]\(48)
    );
\packed_fifo_wr_data[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(1),
      I1 => fifo_wr_data_0(1),
      I2 => fifo_wr_data_3(1),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(1),
      O => \fifo_wr_data_1[15]\(49)
    );
\packed_fifo_wr_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(4),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(4),
      O => \fifo_wr_data_1[15]\(4)
    );
\packed_fifo_wr_data[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(2),
      I1 => fifo_wr_data_0(2),
      I2 => fifo_wr_data_3(2),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(2),
      O => \fifo_wr_data_1[15]\(50)
    );
\packed_fifo_wr_data[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(3),
      I1 => fifo_wr_data_0(3),
      I2 => fifo_wr_data_3(3),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(3),
      O => \fifo_wr_data_1[15]\(51)
    );
\packed_fifo_wr_data[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(4),
      I1 => fifo_wr_data_0(4),
      I2 => fifo_wr_data_3(4),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(4),
      O => \fifo_wr_data_1[15]\(52)
    );
\packed_fifo_wr_data[53]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(5),
      I1 => fifo_wr_data_0(5),
      I2 => fifo_wr_data_3(5),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(5),
      O => \fifo_wr_data_1[15]\(53)
    );
\packed_fifo_wr_data[54]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(6),
      I1 => fifo_wr_data_0(6),
      I2 => fifo_wr_data_3(6),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(6),
      O => \fifo_wr_data_1[15]\(54)
    );
\packed_fifo_wr_data[55]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(7),
      I1 => fifo_wr_data_0(7),
      I2 => fifo_wr_data_3(7),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(7),
      O => \fifo_wr_data_1[15]\(55)
    );
\packed_fifo_wr_data[56]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(8),
      I1 => fifo_wr_data_0(8),
      I2 => fifo_wr_data_3(8),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(8),
      O => \fifo_wr_data_1[15]\(56)
    );
\packed_fifo_wr_data[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(9),
      I1 => fifo_wr_data_0(9),
      I2 => fifo_wr_data_3(9),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(9),
      O => \fifo_wr_data_1[15]\(57)
    );
\packed_fifo_wr_data[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(10),
      I1 => fifo_wr_data_0(10),
      I2 => fifo_wr_data_3(10),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(10),
      O => \fifo_wr_data_1[15]\(58)
    );
\packed_fifo_wr_data[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(11),
      I1 => fifo_wr_data_0(11),
      I2 => fifo_wr_data_3(11),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(11),
      O => \fifo_wr_data_1[15]\(59)
    );
\packed_fifo_wr_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(5),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(5),
      O => \fifo_wr_data_1[15]\(5)
    );
\packed_fifo_wr_data[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(12),
      I1 => fifo_wr_data_0(12),
      I2 => fifo_wr_data_3(12),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(12),
      O => \fifo_wr_data_1[15]\(60)
    );
\packed_fifo_wr_data[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(13),
      I1 => fifo_wr_data_0(13),
      I2 => fifo_wr_data_3(13),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(13),
      O => \fifo_wr_data_1[15]\(61)
    );
\packed_fifo_wr_data[62]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(14),
      I1 => fifo_wr_data_0(14),
      I2 => fifo_wr_data_3(14),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(14),
      O => \fifo_wr_data_1[15]\(62)
    );
\packed_fifo_wr_data[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => fifo_wr_data_1(15),
      I1 => fifo_wr_data_0(15),
      I2 => fifo_wr_data_3(15),
      I3 => \ctrl_\(7),
      I4 => \ctrl_\(6),
      I5 => fifo_wr_data_2(15),
      O => \fifo_wr_data_1[15]\(63)
    );
\packed_fifo_wr_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(6),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(6),
      O => \fifo_wr_data_1[15]\(6)
    );
\packed_fifo_wr_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(7),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(7),
      O => \fifo_wr_data_1[15]\(7)
    );
\packed_fifo_wr_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(8),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(8),
      O => \fifo_wr_data_1[15]\(8)
    );
\packed_fifo_wr_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \packed_fifo_wr_data_reg[31]\(9),
      I1 => \packed_fifo_wr_data_reg[31]_0\(0),
      I2 => \^d\(9),
      O => \fifo_wr_data_1[15]\(9)
    );
\rotate[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Q,
      I1 => fifo_wr_en,
      O => \^e\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell is
  port (
    reset_data : out STD_LOGIC;
    \fifo_wr_data_1[15]\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_wr_en_0 : out STD_LOGIC;
    packed_fifo_wr_en0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_data_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell is
  signal ce_ctrl : STD_LOGIC;
  signal enable_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \enable_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \enable_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[0]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[1]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[2]\ : STD_LOGIC;
  signal \enable_int_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_pack.gen_output_buffer.data_d1\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \gen_pack.gen_output_buffer.prev_valid_d1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_pack.gen_output_buffer.sync_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.prev_valid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_pack.prev_valid[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.prev_valid[1]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.valid[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.valid[1]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.valid[2]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.valid[3]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pack.valid_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_pack.valid_reg_n_0_[2]\ : STD_LOGIC;
  signal \gen_pack.valid_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_prefix_count[2].prefix_count_reg\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_prefix_count[3].prefix_count_reg\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal out_sync : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal packed_fifo_wr_data1 : STD_LOGIC;
  signal \prefix_count_s[2]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \prefix_count_s[3]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ready : STD_LOGIC;
  signal ready0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal reset_ctrl : STD_LOGIC;
  signal reset_ctrl0 : STD_LOGIC;
  signal reset_ctrl_i_2_n_0 : STD_LOGIC;
  signal reset_ctrl_i_3_n_0 : STD_LOGIC;
  signal reset_data_i_1_n_0 : STD_LOGIC;
  signal rotate : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal startup_ctrl : STD_LOGIC;
  signal startup_ctrl2 : STD_LOGIC;
  signal startup_ctrl_i_1_n_0 : STD_LOGIC;
  signal startup_ctrl_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \enable_count[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \enable_count[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gen_pack.prev_valid[0]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gen_pack.prev_valid[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gen_pack.valid[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gen_pack.valid[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gen_pack.valid[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gen_pack.valid[3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gen_prefix_count[2].prefix_count[5]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gen_prefix_count[3].prefix_count[6]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gen_prefix_count[3].prefix_count[7]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[15]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[31]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[47]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \packed_fifo_wr_data[63]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of packed_fifo_wr_en_i_1 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of packed_sync_i_1 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of ready_i_1 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of reset_ctrl_i_2 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of reset_ctrl_i_3 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rotate[1]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of startup_ctrl_i_2 : label is "soft_lutpair18";
begin
\enable_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \enable_int_reg_n_0_[3]\,
      I1 => \enable_int_reg_n_0_[1]\,
      I2 => \enable_int_reg_n_0_[0]\,
      I3 => \enable_int_reg_n_0_[2]\,
      O => \enable_count[0]_i_1_n_0\
    );
\enable_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E881"
    )
        port map (
      I0 => \enable_int_reg_n_0_[2]\,
      I1 => \enable_int_reg_n_0_[1]\,
      I2 => \enable_int_reg_n_0_[0]\,
      I3 => \enable_int_reg_n_0_[3]\,
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
\gen_network[0].i_ctrl_interconnect\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network
     port map (
      D(31 downto 0) => p_1_in(31 downto 0),
      E(0) => ce_ctrl,
      Q => startup_ctrl,
      clk => clk,
      \ctrl_reg[0]_0\(1 downto 0) => \gen_prefix_count[2].prefix_count_reg\(1 downto 0),
      \ctrl_reg[0]_1\(1 downto 0) => rotate(1 downto 0),
      \ctrl_reg[0]_2\(0) => \enable_int_reg_n_0_[0]\,
      \ctrl_reg[1]_0\(1 downto 0) => \gen_prefix_count[3].prefix_count_reg\(1 downto 0),
      fifo_wr_data_0(15 downto 0) => fifo_wr_data_0(15 downto 0),
      fifo_wr_data_1(15 downto 0) => fifo_wr_data_1(15 downto 0),
      \fifo_wr_data_1[15]\(63 downto 0) => \fifo_wr_data_1[15]\(63 downto 0),
      fifo_wr_data_2(15 downto 0) => fifo_wr_data_2(15 downto 0),
      fifo_wr_data_3(15 downto 0) => fifo_wr_data_3(15 downto 0),
      fifo_wr_en => fifo_wr_en,
      \packed_fifo_wr_data_reg[31]\(31 downto 0) => \gen_pack.gen_output_buffer.data_d1\(31 downto 0),
      \packed_fifo_wr_data_reg[31]_0\(1 downto 0) => \gen_pack.gen_output_buffer.prev_valid_d1\(1 downto 0)
    );
\gen_pack.gen_output_buffer.data_d1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(0),
      Q => \gen_pack.gen_output_buffer.data_d1\(0),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(10),
      Q => \gen_pack.gen_output_buffer.data_d1\(10),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(11),
      Q => \gen_pack.gen_output_buffer.data_d1\(11),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(12),
      Q => \gen_pack.gen_output_buffer.data_d1\(12),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(13),
      Q => \gen_pack.gen_output_buffer.data_d1\(13),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(14),
      Q => \gen_pack.gen_output_buffer.data_d1\(14),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(15),
      Q => \gen_pack.gen_output_buffer.data_d1\(15),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(16),
      Q => \gen_pack.gen_output_buffer.data_d1\(16),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(17),
      Q => \gen_pack.gen_output_buffer.data_d1\(17),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(18),
      Q => \gen_pack.gen_output_buffer.data_d1\(18),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(19),
      Q => \gen_pack.gen_output_buffer.data_d1\(19),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(1),
      Q => \gen_pack.gen_output_buffer.data_d1\(1),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(20),
      Q => \gen_pack.gen_output_buffer.data_d1\(20),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(21),
      Q => \gen_pack.gen_output_buffer.data_d1\(21),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(22),
      Q => \gen_pack.gen_output_buffer.data_d1\(22),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(23),
      Q => \gen_pack.gen_output_buffer.data_d1\(23),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(24),
      Q => \gen_pack.gen_output_buffer.data_d1\(24),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(25),
      Q => \gen_pack.gen_output_buffer.data_d1\(25),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(26),
      Q => \gen_pack.gen_output_buffer.data_d1\(26),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(27),
      Q => \gen_pack.gen_output_buffer.data_d1\(27),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(28),
      Q => \gen_pack.gen_output_buffer.data_d1\(28),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(29),
      Q => \gen_pack.gen_output_buffer.data_d1\(29),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(2),
      Q => \gen_pack.gen_output_buffer.data_d1\(2),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(30),
      Q => \gen_pack.gen_output_buffer.data_d1\(30),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(31),
      Q => \gen_pack.gen_output_buffer.data_d1\(31),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(3),
      Q => \gen_pack.gen_output_buffer.data_d1\(3),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(4),
      Q => \gen_pack.gen_output_buffer.data_d1\(4),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(5),
      Q => \gen_pack.gen_output_buffer.data_d1\(5),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(6),
      Q => \gen_pack.gen_output_buffer.data_d1\(6),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(7),
      Q => \gen_pack.gen_output_buffer.data_d1\(7),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(8),
      Q => \gen_pack.gen_output_buffer.data_d1\(8),
      R => '0'
    );
\gen_pack.gen_output_buffer.data_d1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => fifo_wr_en,
      D => p_1_in(9),
      Q => \gen_pack.gen_output_buffer.data_d1\(9),
      R => '0'
    );
\gen_pack.gen_output_buffer.prev_valid_d1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.prev_valid\(0),
      Q => \gen_pack.gen_output_buffer.prev_valid_d1\(0),
      R => '0'
    );
\gen_pack.gen_output_buffer.prev_valid_d1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.prev_valid\(1),
      Q => \gen_pack.gen_output_buffer.prev_valid_d1\(1),
      R => '0'
    );
\gen_pack.gen_output_buffer.sync_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEEEAEEEAEEEFEEE"
    )
        port map (
      I0 => reset_ctrl,
      I1 => out_sync,
      I2 => ready,
      I3 => fifo_wr_en,
      I4 => rotate(0),
      I5 => rotate(1),
      O => \gen_pack.gen_output_buffer.sync_i_1_n_0\
    );
\gen_pack.gen_output_buffer.sync_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \gen_pack.gen_output_buffer.sync_i_1_n_0\,
      Q => out_sync,
      R => '0'
    );
\gen_pack.prev_valid[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA80"
    )
        port map (
      I0 => enable_count(1),
      I1 => rotate(0),
      I2 => enable_count(0),
      I3 => rotate(1),
      O => \gen_pack.prev_valid[0]_i_1_n_0\
    );
\gen_pack.prev_valid[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => rotate(1),
      I1 => enable_count(1),
      I2 => enable_count(0),
      I3 => rotate(0),
      O => \gen_pack.prev_valid[1]_i_1_n_0\
    );
\gen_pack.prev_valid_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.prev_valid[0]_i_1_n_0\,
      Q => \gen_pack.prev_valid\(0),
      R => '0'
    );
\gen_pack.prev_valid_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.prev_valid[1]_i_1_n_0\,
      Q => \gen_pack.prev_valid\(1),
      R => '0'
    );
\gen_pack.valid[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => rotate(1),
      I1 => rotate(0),
      I2 => \gen_pack.prev_valid\(0),
      O => \gen_pack.valid[0]_i_1_n_0\
    );
\gen_pack.valid[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5554"
    )
        port map (
      I0 => rotate(1),
      I1 => rotate(0),
      I2 => enable_count(1),
      I3 => enable_count(0),
      I4 => \gen_pack.prev_valid\(1),
      O => \gen_pack.valid[1]_i_1_n_0\
    );
\gen_pack.valid[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F4A"
    )
        port map (
      I0 => rotate(1),
      I1 => enable_count(0),
      I2 => rotate(0),
      I3 => enable_count(1),
      O => \gen_pack.valid[2]_i_1_n_0\
    );
\gen_pack.valid[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEA8"
    )
        port map (
      I0 => rotate(1),
      I1 => rotate(0),
      I2 => enable_count(0),
      I3 => enable_count(1),
      O => \gen_pack.valid[3]_i_1_n_0\
    );
\gen_pack.valid_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.valid[0]_i_1_n_0\,
      Q => \gen_pack.valid_reg_n_0_[0]\,
      R => '0'
    );
\gen_pack.valid_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.valid[1]_i_1_n_0\,
      Q => packed_fifo_wr_data1,
      R => '0'
    );
\gen_pack.valid_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.valid[2]_i_1_n_0\,
      Q => \gen_pack.valid_reg_n_0_[2]\,
      R => '0'
    );
\gen_pack.valid_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => \gen_pack.valid[3]_i_1_n_0\,
      Q => \gen_pack.valid_reg_n_0_[3]\,
      R => '0'
    );
\gen_prefix_count[2].prefix_count[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \enable_int_reg_n_0_[1]\,
      I1 => \enable_int_reg_n_0_[0]\,
      O => \prefix_count_s[2]\(0)
    );
\gen_prefix_count[2].prefix_count[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \enable_int_reg_n_0_[0]\,
      I1 => \enable_int_reg_n_0_[1]\,
      O => \prefix_count_s[2]\(1)
    );
\gen_prefix_count[2].prefix_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \prefix_count_s[2]\(0),
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
      I0 => \enable_int_reg_n_0_[0]\,
      I1 => \enable_int_reg_n_0_[1]\,
      I2 => \enable_int_reg_n_0_[2]\,
      O => \prefix_count_s[3]\(0)
    );
\gen_prefix_count[3].prefix_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => \enable_int_reg_n_0_[2]\,
      I1 => \enable_int_reg_n_0_[0]\,
      I2 => \enable_int_reg_n_0_[1]\,
      O => \prefix_count_s[3]\(1)
    );
\gen_prefix_count[3].prefix_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \prefix_count_s[3]\(0),
      Q => \gen_prefix_count[3].prefix_count_reg\(0),
      R => '0'
    );
\gen_prefix_count[3].prefix_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \prefix_count_s[3]\(1),
      Q => \gen_prefix_count[3].prefix_count_reg\(1),
      R => '0'
    );
\packed_fifo_wr_data[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => fifo_wr_en,
      I1 => \gen_pack.valid_reg_n_0_[0]\,
      O => E(0)
    );
\packed_fifo_wr_data[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => fifo_wr_en,
      I1 => packed_fifo_wr_data1,
      O => E(1)
    );
\packed_fifo_wr_data[47]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => fifo_wr_en,
      I1 => \gen_pack.valid_reg_n_0_[2]\,
      O => E(2)
    );
\packed_fifo_wr_data[63]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => fifo_wr_en,
      I1 => \gen_pack.valid_reg_n_0_[3]\,
      O => E(3)
    );
packed_fifo_wr_en_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ready,
      I1 => fifo_wr_en,
      O => packed_fifo_wr_en0
    );
packed_sync_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => fifo_wr_en,
      I1 => ready,
      I2 => out_sync,
      O => fifo_wr_en_0
    );
ready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEE0"
    )
        port map (
      I0 => rotate(0),
      I1 => enable_count(0),
      I2 => enable_count(1),
      I3 => rotate(1),
      O => ready0(2)
    );
ready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => ready0(2),
      Q => ready,
      R => reset_ctrl
    );
reset_ctrl_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => D(2),
      I1 => D(3),
      I2 => D(0),
      I3 => D(1),
      I4 => reset,
      O => reset_ctrl0
    );
reset_ctrl_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => \enable_int_reg_n_0_[1]\,
      I1 => D(1),
      I2 => \enable_int_reg_n_0_[2]\,
      I3 => D(2),
      I4 => reset_ctrl_i_3_n_0,
      O => reset_ctrl_i_2_n_0
    );
reset_ctrl_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => D(0),
      I1 => \enable_int_reg_n_0_[0]\,
      I2 => D(3),
      I3 => \enable_int_reg_n_0_[3]\,
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
reset_data_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => startup_ctrl_i_2_n_0,
      I1 => reset_ctrl_i_3_n_0,
      I2 => reset_ctrl0,
      I3 => startup_ctrl2,
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
\rotate[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rotate(0),
      I1 => enable_count(0),
      O => ready0(0)
    );
\rotate[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E11E"
    )
        port map (
      I0 => rotate(0),
      I1 => enable_count(0),
      I2 => enable_count(1),
      I3 => rotate(1),
      O => ready0(1)
    );
\rotate_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => ready0(0),
      Q => rotate(0),
      R => reset_ctrl
    );
\rotate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => ce_ctrl,
      D => ready0(1),
      Q => rotate(1),
      R => reset_ctrl
    );
startup_ctrl2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => reset_ctrl_i_2_n_0,
      Q => startup_ctrl2,
      R => reset_ctrl0
    );
startup_ctrl_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => startup_ctrl2,
      I1 => reset_ctrl,
      I2 => reset_ctrl_i_3_n_0,
      I3 => startup_ctrl_i_2_n_0,
      O => startup_ctrl_i_1_n_0
    );
startup_ctrl_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => D(2),
      I1 => \enable_int_reg_n_0_[2]\,
      I2 => D(1),
      I3 => \enable_int_reg_n_0_[1]\,
      O => startup_ctrl_i_2_n_0
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
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2_impl is
  port (
    packed_fifo_wr_en : out STD_LOGIC;
    packed_fifo_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    packed_sync : out STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_data_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2_impl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2_impl is
  signal i_pack_shell_n_65 : STD_LOGIC;
  signal i_pack_shell_n_67 : STD_LOGIC;
  signal i_pack_shell_n_68 : STD_LOGIC;
  signal i_pack_shell_n_69 : STD_LOGIC;
  signal i_pack_shell_n_70 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal packed_fifo_wr_en0 : STD_LOGIC;
  signal reset_data : STD_LOGIC;
begin
i_pack_shell: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell
     port map (
      D(3 downto 0) => D(3 downto 0),
      E(3) => i_pack_shell_n_67,
      E(2) => i_pack_shell_n_68,
      E(1) => i_pack_shell_n_69,
      E(0) => i_pack_shell_n_70,
      clk => clk,
      fifo_wr_data_0(15 downto 0) => fifo_wr_data_0(15 downto 0),
      fifo_wr_data_1(15 downto 0) => fifo_wr_data_1(15 downto 0),
      \fifo_wr_data_1[15]\(63 downto 32) => p_1_in(63 downto 32),
      \fifo_wr_data_1[15]\(31 downto 0) => p_0_out(31 downto 0),
      fifo_wr_data_2(15 downto 0) => fifo_wr_data_2(15 downto 0),
      fifo_wr_data_3(15 downto 0) => fifo_wr_data_3(15 downto 0),
      fifo_wr_en => fifo_wr_en,
      fifo_wr_en_0 => i_pack_shell_n_65,
      packed_fifo_wr_en0 => packed_fifo_wr_en0,
      reset => reset,
      reset_data => reset_data
    );
\packed_fifo_wr_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(0),
      Q => packed_fifo_wr_data(0),
      R => '0'
    );
\packed_fifo_wr_data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(10),
      Q => packed_fifo_wr_data(10),
      R => '0'
    );
\packed_fifo_wr_data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(11),
      Q => packed_fifo_wr_data(11),
      R => '0'
    );
\packed_fifo_wr_data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(12),
      Q => packed_fifo_wr_data(12),
      R => '0'
    );
\packed_fifo_wr_data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(13),
      Q => packed_fifo_wr_data(13),
      R => '0'
    );
\packed_fifo_wr_data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(14),
      Q => packed_fifo_wr_data(14),
      R => '0'
    );
\packed_fifo_wr_data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(15),
      Q => packed_fifo_wr_data(15),
      R => '0'
    );
\packed_fifo_wr_data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(16),
      Q => packed_fifo_wr_data(16),
      R => '0'
    );
\packed_fifo_wr_data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(17),
      Q => packed_fifo_wr_data(17),
      R => '0'
    );
\packed_fifo_wr_data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(18),
      Q => packed_fifo_wr_data(18),
      R => '0'
    );
\packed_fifo_wr_data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(19),
      Q => packed_fifo_wr_data(19),
      R => '0'
    );
\packed_fifo_wr_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(1),
      Q => packed_fifo_wr_data(1),
      R => '0'
    );
\packed_fifo_wr_data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(20),
      Q => packed_fifo_wr_data(20),
      R => '0'
    );
\packed_fifo_wr_data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(21),
      Q => packed_fifo_wr_data(21),
      R => '0'
    );
\packed_fifo_wr_data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(22),
      Q => packed_fifo_wr_data(22),
      R => '0'
    );
\packed_fifo_wr_data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(23),
      Q => packed_fifo_wr_data(23),
      R => '0'
    );
\packed_fifo_wr_data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(24),
      Q => packed_fifo_wr_data(24),
      R => '0'
    );
\packed_fifo_wr_data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(25),
      Q => packed_fifo_wr_data(25),
      R => '0'
    );
\packed_fifo_wr_data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(26),
      Q => packed_fifo_wr_data(26),
      R => '0'
    );
\packed_fifo_wr_data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(27),
      Q => packed_fifo_wr_data(27),
      R => '0'
    );
\packed_fifo_wr_data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(28),
      Q => packed_fifo_wr_data(28),
      R => '0'
    );
\packed_fifo_wr_data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(29),
      Q => packed_fifo_wr_data(29),
      R => '0'
    );
\packed_fifo_wr_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(2),
      Q => packed_fifo_wr_data(2),
      R => '0'
    );
\packed_fifo_wr_data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(30),
      Q => packed_fifo_wr_data(30),
      R => '0'
    );
\packed_fifo_wr_data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_69,
      D => p_0_out(31),
      Q => packed_fifo_wr_data(31),
      R => '0'
    );
\packed_fifo_wr_data_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(32),
      Q => packed_fifo_wr_data(32),
      R => '0'
    );
\packed_fifo_wr_data_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(33),
      Q => packed_fifo_wr_data(33),
      R => '0'
    );
\packed_fifo_wr_data_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(34),
      Q => packed_fifo_wr_data(34),
      R => '0'
    );
\packed_fifo_wr_data_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(35),
      Q => packed_fifo_wr_data(35),
      R => '0'
    );
\packed_fifo_wr_data_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(36),
      Q => packed_fifo_wr_data(36),
      R => '0'
    );
\packed_fifo_wr_data_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(37),
      Q => packed_fifo_wr_data(37),
      R => '0'
    );
\packed_fifo_wr_data_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(38),
      Q => packed_fifo_wr_data(38),
      R => '0'
    );
\packed_fifo_wr_data_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(39),
      Q => packed_fifo_wr_data(39),
      R => '0'
    );
\packed_fifo_wr_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(3),
      Q => packed_fifo_wr_data(3),
      R => '0'
    );
\packed_fifo_wr_data_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(40),
      Q => packed_fifo_wr_data(40),
      R => '0'
    );
\packed_fifo_wr_data_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(41),
      Q => packed_fifo_wr_data(41),
      R => '0'
    );
\packed_fifo_wr_data_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(42),
      Q => packed_fifo_wr_data(42),
      R => '0'
    );
\packed_fifo_wr_data_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(43),
      Q => packed_fifo_wr_data(43),
      R => '0'
    );
\packed_fifo_wr_data_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(44),
      Q => packed_fifo_wr_data(44),
      R => '0'
    );
\packed_fifo_wr_data_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(45),
      Q => packed_fifo_wr_data(45),
      R => '0'
    );
\packed_fifo_wr_data_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(46),
      Q => packed_fifo_wr_data(46),
      R => '0'
    );
\packed_fifo_wr_data_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_68,
      D => p_1_in(47),
      Q => packed_fifo_wr_data(47),
      R => '0'
    );
\packed_fifo_wr_data_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(48),
      Q => packed_fifo_wr_data(48),
      R => '0'
    );
\packed_fifo_wr_data_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(49),
      Q => packed_fifo_wr_data(49),
      R => '0'
    );
\packed_fifo_wr_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(4),
      Q => packed_fifo_wr_data(4),
      R => '0'
    );
\packed_fifo_wr_data_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(50),
      Q => packed_fifo_wr_data(50),
      R => '0'
    );
\packed_fifo_wr_data_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(51),
      Q => packed_fifo_wr_data(51),
      R => '0'
    );
\packed_fifo_wr_data_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(52),
      Q => packed_fifo_wr_data(52),
      R => '0'
    );
\packed_fifo_wr_data_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(53),
      Q => packed_fifo_wr_data(53),
      R => '0'
    );
\packed_fifo_wr_data_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(54),
      Q => packed_fifo_wr_data(54),
      R => '0'
    );
\packed_fifo_wr_data_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(55),
      Q => packed_fifo_wr_data(55),
      R => '0'
    );
\packed_fifo_wr_data_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(56),
      Q => packed_fifo_wr_data(56),
      R => '0'
    );
\packed_fifo_wr_data_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(57),
      Q => packed_fifo_wr_data(57),
      R => '0'
    );
\packed_fifo_wr_data_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(58),
      Q => packed_fifo_wr_data(58),
      R => '0'
    );
\packed_fifo_wr_data_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(59),
      Q => packed_fifo_wr_data(59),
      R => '0'
    );
\packed_fifo_wr_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(5),
      Q => packed_fifo_wr_data(5),
      R => '0'
    );
\packed_fifo_wr_data_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(60),
      Q => packed_fifo_wr_data(60),
      R => '0'
    );
\packed_fifo_wr_data_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(61),
      Q => packed_fifo_wr_data(61),
      R => '0'
    );
\packed_fifo_wr_data_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(62),
      Q => packed_fifo_wr_data(62),
      R => '0'
    );
\packed_fifo_wr_data_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_67,
      D => p_1_in(63),
      Q => packed_fifo_wr_data(63),
      R => '0'
    );
\packed_fifo_wr_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(6),
      Q => packed_fifo_wr_data(6),
      R => '0'
    );
\packed_fifo_wr_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(7),
      Q => packed_fifo_wr_data(7),
      R => '0'
    );
\packed_fifo_wr_data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(8),
      Q => packed_fifo_wr_data(8),
      R => '0'
    );
\packed_fifo_wr_data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => i_pack_shell_n_70,
      D => p_0_out(9),
      Q => packed_fifo_wr_data(9),
      R => '0'
    );
packed_fifo_wr_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => packed_fifo_wr_en0,
      Q => packed_fifo_wr_en,
      R => reset_data
    );
packed_sync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => i_pack_shell_n_65,
      Q => packed_sync,
      R => reset_data
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2 is
  port (
    packed_fifo_wr_en : out STD_LOGIC;
    packed_fifo_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    packed_sync : out STD_LOGIC;
    reset : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_data_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2 is
begin
i_cpack: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2_impl
     port map (
      D(3 downto 0) => D(3 downto 0),
      clk => clk,
      fifo_wr_data_0(15 downto 0) => fifo_wr_data_0(15 downto 0),
      fifo_wr_data_1(15 downto 0) => fifo_wr_data_1(15 downto 0),
      fifo_wr_data_2(15 downto 0) => fifo_wr_data_2(15 downto 0),
      fifo_wr_data_3(15 downto 0) => fifo_wr_data_3(15 downto 0),
      fifo_wr_en => fifo_wr_en,
      packed_fifo_wr_data(63 downto 0) => packed_fifo_wr_data(63 downto 0),
      packed_fifo_wr_en => packed_fifo_wr_en,
      packed_sync => packed_sync,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable_0 : in STD_LOGIC;
    enable_1 : in STD_LOGIC;
    enable_2 : in STD_LOGIC;
    enable_3 : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_overflow : out STD_LOGIC;
    fifo_wr_data_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    fifo_wr_data_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    packed_fifo_wr_en : out STD_LOGIC;
    packed_fifo_wr_overflow : in STD_LOGIC;
    packed_fifo_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    packed_sync : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_util_adc_1_pack_0,util_cpack2,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "util_cpack2,Vivado 2025.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^packed_fifo_wr_overflow\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 packed_fifo_wr_signal_clock CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME packed_fifo_wr_signal_clock, ASSOCIATED_BUSIF packed_fifo_wr, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of packed_fifo_wr_en : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr EN";
  attribute X_INTERFACE_MODE of packed_fifo_wr_en : signal is "master";
  attribute X_INTERFACE_INFO of packed_fifo_wr_overflow : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr OVERFLOW";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 packed_fifo_wr_signal_reset RST";
  attribute X_INTERFACE_MODE of reset : signal is "slave";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME packed_fifo_wr_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of packed_fifo_wr_data : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr DATA";
begin
  \^packed_fifo_wr_overflow\ <= packed_fifo_wr_overflow;
  fifo_wr_overflow <= \^packed_fifo_wr_overflow\;
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_cpack2
     port map (
      D(3) => enable_3,
      D(2) => enable_2,
      D(1) => enable_1,
      D(0) => enable_0,
      clk => clk,
      fifo_wr_data_0(15 downto 0) => fifo_wr_data_0(15 downto 0),
      fifo_wr_data_1(15 downto 0) => fifo_wr_data_1(15 downto 0),
      fifo_wr_data_2(15 downto 0) => fifo_wr_data_2(15 downto 0),
      fifo_wr_data_3(15 downto 0) => fifo_wr_data_3(15 downto 0),
      fifo_wr_en => fifo_wr_en,
      packed_fifo_wr_data(63 downto 0) => packed_fifo_wr_data(63 downto 0),
      packed_fifo_wr_en => packed_fifo_wr_en,
      packed_sync => packed_sync,
      reset => reset
    );
end STRUCTURE;
