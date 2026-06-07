-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:08:50 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_axi_sysid_0_0/system_axi_sysid_0_0_sim_netlist.vhdl
-- Design      : system_axi_sysid_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_sysid_0_0_up_axi is
  port (
    p_0_in : out STD_LOGIC;
    up_wreq_s : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    up_rreq_int : out STD_LOGIC;
    up_axi_rvalid_int_reg_0 : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    rom_addr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \up_wdata_int_reg[31]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    up_wack : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    up_rack_s : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    \up_rdata_s_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sys_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pr_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_sysid_0_0_up_axi : entity is "up_axi";
end system_axi_sysid_0_0_up_axi;

architecture STRUCTURE of system_axi_sysid_0_0_up_axi is
  signal data1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^p_0_in\ : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in7_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in_0 : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal p_5_in : STD_LOGIC;
  signal \^rom_addr\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal up_axi_arready_int_i_1_n_0 : STD_LOGIC;
  signal up_axi_arready_int_i_2_n_0 : STD_LOGIC;
  signal up_axi_awready_int_i_2_n_0 : STD_LOGIC;
  signal up_axi_bvalid_int_i_1_n_0 : STD_LOGIC;
  signal \up_axi_rdata_int[31]_i_1_n_0\ : STD_LOGIC;
  signal up_axi_rvalid_int_i_1_n_0 : STD_LOGIC;
  signal \^up_axi_rvalid_int_reg_0\ : STD_LOGIC;
  signal up_axi_wready_int_i_1_n_0 : STD_LOGIC;
  signal up_rack_d : STD_LOGIC;
  signal up_rack_s_1 : STD_LOGIC;
  signal up_raddr_int : STD_LOGIC_VECTOR ( 10 downto 9 );
  signal \up_rcount[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_rcount[1]_i_1_n_0\ : STD_LOGIC;
  signal \up_rcount[2]_i_1_n_0\ : STD_LOGIC;
  signal \up_rcount[3]_i_1_n_0\ : STD_LOGIC;
  signal \up_rcount[4]_i_1_n_0\ : STD_LOGIC;
  signal \up_rcount[4]_i_2_n_0\ : STD_LOGIC;
  signal \up_rcount_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_rcount_reg_n_0_[1]\ : STD_LOGIC;
  signal \up_rcount_reg_n_0_[2]\ : STD_LOGIC;
  signal \up_rcount_reg_n_0_[3]\ : STD_LOGIC;
  signal up_rdata_d : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \up_rdata_d[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[10]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[11]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[12]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[14]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[15]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[16]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[18]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[19]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[21]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[23]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[25]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[26]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[27]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[28]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[29]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[2]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[30]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[31]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[5]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[7]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[9]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_s[31]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata_s[31]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata_s[31]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata_s[31]_i_7_n_0\ : STD_LOGIC;
  signal \^up_rreq_int\ : STD_LOGIC;
  signal up_rreq_int_i_1_n_0 : STD_LOGIC;
  signal up_rsel_inv_i_1_n_0 : STD_LOGIC;
  signal \up_scratch[31]_i_2_n_0\ : STD_LOGIC;
  signal \up_scratch[31]_i_3_n_0\ : STD_LOGIC;
  signal up_wack_d : STD_LOGIC;
  signal up_wack_s : STD_LOGIC;
  signal up_waddr_s : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \up_wcount[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_wcount[2]_i_1_n_0\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[1]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[2]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[3]\ : STD_LOGIC;
  signal up_wreq_int_i_1_n_0 : STD_LOGIC;
  signal \^up_wreq_s\ : STD_LOGIC;
  signal up_wsel_inv_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of up_axi_awready_int_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of up_axi_wready_int_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \up_rcount[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \up_rcount[2]_i_1\ : label is "soft_lutpair1";
  attribute inverted : string;
  attribute inverted of up_rsel_reg_inv : label is "yes";
  attribute SOFT_HLUTNM of \up_wcount[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \up_wcount[2]_i_1\ : label is "soft_lutpair0";
  attribute inverted of up_wsel_reg_inv : label is "yes";
begin
  p_0_in <= \^p_0_in\;
  rom_addr(8 downto 0) <= \^rom_addr\(8 downto 0);
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_wready <= \^s_axi_wready\;
  up_axi_rvalid_int_reg_0 <= \^up_axi_rvalid_int_reg_0\;
  up_rreq_int <= \^up_rreq_int\;
  up_wreq_s <= \^up_wreq_s\;
up_axi_arready_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5540"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => up_rack_s,
      I2 => p_0_in6_in,
      I3 => up_axi_arready_int_i_2_n_0,
      O => up_axi_arready_int_i_1_n_0
    );
up_axi_arready_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \up_rcount_reg_n_0_[0]\,
      I1 => \up_rcount_reg_n_0_[1]\,
      I2 => \up_rcount_reg_n_0_[2]\,
      I3 => \up_rcount_reg_n_0_[3]\,
      I4 => p_0_in6_in,
      O => up_axi_arready_int_i_2_n_0
    );
up_axi_arready_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_axi_arready_int_i_1_n_0,
      Q => \^s_axi_arready\,
      R => \^p_0_in\
    );
up_axi_awready_int_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^p_0_in\
    );
up_axi_awready_int_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => up_wack_s,
      O => up_axi_awready_int_i_2_n_0
    );
up_axi_awready_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_axi_awready_int_i_2_n_0,
      Q => \^s_axi_awready\,
      R => \^p_0_in\
    );
up_axi_bvalid_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C88"
    )
        port map (
      I0 => up_wack_d,
      I1 => s_axi_aresetn,
      I2 => s_axi_bready,
      I3 => \^s_axi_bvalid\,
      O => up_axi_bvalid_int_i_1_n_0
    );
up_axi_bvalid_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_axi_bvalid_int_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => '0'
    );
\up_axi_rdata_int[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^up_axi_rvalid_int_reg_0\,
      I2 => s_axi_aresetn,
      O => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(0),
      Q => s_axi_rdata(0),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(10),
      Q => s_axi_rdata(10),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(11),
      Q => s_axi_rdata(11),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(12),
      Q => s_axi_rdata(12),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(13),
      Q => s_axi_rdata(13),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(14),
      Q => s_axi_rdata(14),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(15),
      Q => s_axi_rdata(15),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(16),
      Q => s_axi_rdata(16),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(17),
      Q => s_axi_rdata(17),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(18),
      Q => s_axi_rdata(18),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(19),
      Q => s_axi_rdata(19),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(1),
      Q => s_axi_rdata(1),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(20),
      Q => s_axi_rdata(20),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(21),
      Q => s_axi_rdata(21),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(22),
      Q => s_axi_rdata(22),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(23),
      Q => s_axi_rdata(23),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(24),
      Q => s_axi_rdata(24),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(25),
      Q => s_axi_rdata(25),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(26),
      Q => s_axi_rdata(26),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(27),
      Q => s_axi_rdata(27),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(28),
      Q => s_axi_rdata(28),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(29),
      Q => s_axi_rdata(29),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(2),
      Q => s_axi_rdata(2),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(30),
      Q => s_axi_rdata(30),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(31),
      Q => s_axi_rdata(31),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(3),
      Q => s_axi_rdata(3),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(4),
      Q => s_axi_rdata(4),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(5),
      Q => s_axi_rdata(5),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(6),
      Q => s_axi_rdata(6),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(7),
      Q => s_axi_rdata(7),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(8),
      Q => s_axi_rdata(8),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
\up_axi_rdata_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rack_d,
      D => up_rdata_d(9),
      Q => s_axi_rdata(9),
      R => \up_axi_rdata_int[31]_i_1_n_0\
    );
up_axi_rvalid_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08C8"
    )
        port map (
      I0 => up_rack_d,
      I1 => s_axi_aresetn,
      I2 => \^up_axi_rvalid_int_reg_0\,
      I3 => s_axi_rready,
      O => up_axi_rvalid_int_i_1_n_0
    );
up_axi_rvalid_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_axi_rvalid_int_i_1_n_0,
      Q => \^up_axi_rvalid_int_reg_0\,
      R => '0'
    );
up_axi_wready_int_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => up_wack_s,
      O => up_axi_wready_int_i_1_n_0
    );
up_axi_wready_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_axi_wready_int_i_1_n_0,
      Q => \^s_axi_wready\,
      R => \^p_0_in\
    );
up_rack_d_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C888888888888888"
    )
        port map (
      I0 => up_rack_s,
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[0]\,
      I3 => \up_rcount_reg_n_0_[1]\,
      I4 => \up_rcount_reg_n_0_[2]\,
      I5 => \up_rcount_reg_n_0_[3]\,
      O => up_rack_s_1
    );
up_rack_d_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rack_s_1,
      Q => up_rack_d,
      R => \^p_0_in\
    );
\up_raddr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(0),
      Q => \^rom_addr\(0),
      R => \^p_0_in\
    );
\up_raddr_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(10),
      Q => up_raddr_int(10),
      R => \^p_0_in\
    );
\up_raddr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(1),
      Q => \^rom_addr\(1),
      R => \^p_0_in\
    );
\up_raddr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(2),
      Q => \^rom_addr\(2),
      R => \^p_0_in\
    );
\up_raddr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(3),
      Q => \^rom_addr\(3),
      R => \^p_0_in\
    );
\up_raddr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(4),
      Q => \^rom_addr\(4),
      R => \^p_0_in\
    );
\up_raddr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(5),
      Q => \^rom_addr\(5),
      R => \^p_0_in\
    );
\up_raddr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(6),
      Q => \^rom_addr\(6),
      R => \^p_0_in\
    );
\up_raddr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(7),
      Q => \^rom_addr\(7),
      R => \^p_0_in\
    );
\up_raddr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(8),
      Q => \^rom_addr\(8),
      R => \^p_0_in\
    );
\up_raddr_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in_0,
      D => s_axi_araddr(9),
      Q => up_raddr_int(9),
      R => \^p_0_in\
    );
\up_rcount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => up_rack_s,
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[0]\,
      O => \up_rcount[0]_i_1_n_0\
    );
\up_rcount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => up_rack_s,
      I1 => \up_rcount_reg_n_0_[0]\,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => p_0_in6_in,
      O => \up_rcount[1]_i_1_n_0\
    );
\up_rcount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14440000"
    )
        port map (
      I0 => up_rack_s,
      I1 => \up_rcount_reg_n_0_[2]\,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      I4 => p_0_in6_in,
      O => \up_rcount[2]_i_1_n_0\
    );
\up_rcount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1444444400000000"
    )
        port map (
      I0 => up_rack_s,
      I1 => \up_rcount_reg_n_0_[3]\,
      I2 => \up_rcount_reg_n_0_[0]\,
      I3 => \up_rcount_reg_n_0_[1]\,
      I4 => \up_rcount_reg_n_0_[2]\,
      I5 => p_0_in6_in,
      O => \up_rcount[3]_i_1_n_0\
    );
\up_rcount[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^up_rreq_int\,
      O => \up_rcount[4]_i_1_n_0\
    );
\up_rcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF7FFFFFFF"
    )
        port map (
      I0 => \up_rcount_reg_n_0_[3]\,
      I1 => \up_rcount_reg_n_0_[2]\,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      I4 => p_0_in6_in,
      I5 => up_rack_s,
      O => \up_rcount[4]_i_2_n_0\
    );
\up_rcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_rcount[4]_i_1_n_0\,
      D => \up_rcount[0]_i_1_n_0\,
      Q => \up_rcount_reg_n_0_[0]\,
      R => \^p_0_in\
    );
\up_rcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_rcount[4]_i_1_n_0\,
      D => \up_rcount[1]_i_1_n_0\,
      Q => \up_rcount_reg_n_0_[1]\,
      R => \^p_0_in\
    );
\up_rcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_rcount[4]_i_1_n_0\,
      D => \up_rcount[2]_i_1_n_0\,
      Q => \up_rcount_reg_n_0_[2]\,
      R => \^p_0_in\
    );
\up_rcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_rcount[4]_i_1_n_0\,
      D => \up_rcount[3]_i_1_n_0\,
      Q => \up_rcount_reg_n_0_[3]\,
      R => \^p_0_in\
    );
\up_rcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_rcount[4]_i_1_n_0\,
      D => \up_rcount[4]_i_2_n_0\,
      Q => p_0_in6_in,
      R => \^p_0_in\
    );
\up_rdata_d[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(0),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[0]_i_1_n_0\
    );
\up_rdata_d[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(10),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[10]_i_1_n_0\
    );
\up_rdata_d[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(11),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[11]_i_1_n_0\
    );
\up_rdata_d[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(12),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[12]_i_1_n_0\
    );
\up_rdata_d[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(14),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[14]_i_1_n_0\
    );
\up_rdata_d[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(15),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[15]_i_1_n_0\
    );
\up_rdata_d[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(16),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[16]_i_1_n_0\
    );
\up_rdata_d[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(18),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[18]_i_1_n_0\
    );
\up_rdata_d[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(19),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[19]_i_1_n_0\
    );
\up_rdata_d[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(21),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[21]_i_1_n_0\
    );
\up_rdata_d[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(23),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[23]_i_1_n_0\
    );
\up_rdata_d[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(25),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[25]_i_1_n_0\
    );
\up_rdata_d[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(26),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[26]_i_1_n_0\
    );
\up_rdata_d[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(27),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[27]_i_1_n_0\
    );
\up_rdata_d[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(28),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[28]_i_1_n_0\
    );
\up_rdata_d[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80000000FFFFFFFF"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \up_rcount_reg_n_0_[3]\,
      I2 => \up_rcount_reg_n_0_[2]\,
      I3 => \up_rcount_reg_n_0_[1]\,
      I4 => \up_rcount_reg_n_0_[0]\,
      I5 => s_axi_aresetn,
      O => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(2),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[2]_i_1_n_0\
    );
\up_rdata_d[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(30),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[30]_i_1_n_0\
    );
\up_rdata_d[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(31),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(3),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[3]_i_1_n_0\
    );
\up_rdata_d[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(5),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[5]_i_1_n_0\
    );
\up_rdata_d[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(7),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[7]_i_1_n_0\
    );
\up_rdata_d[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => Q(9),
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[2]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[0]\,
      O => \up_rdata_d[9]_i_1_n_0\
    );
\up_rdata_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[0]_i_1_n_0\,
      Q => up_rdata_d(0),
      R => \^p_0_in\
    );
\up_rdata_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[10]_i_1_n_0\,
      Q => up_rdata_d(10),
      R => \^p_0_in\
    );
\up_rdata_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[11]_i_1_n_0\,
      Q => up_rdata_d(11),
      R => \^p_0_in\
    );
\up_rdata_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[12]_i_1_n_0\,
      Q => up_rdata_d(12),
      R => \^p_0_in\
    );
\up_rdata_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(13),
      Q => up_rdata_d(13),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[14]_i_1_n_0\,
      Q => up_rdata_d(14),
      R => \^p_0_in\
    );
\up_rdata_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[15]_i_1_n_0\,
      Q => up_rdata_d(15),
      R => \^p_0_in\
    );
\up_rdata_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[16]_i_1_n_0\,
      Q => up_rdata_d(16),
      R => \^p_0_in\
    );
\up_rdata_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(17),
      Q => up_rdata_d(17),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[18]_i_1_n_0\,
      Q => up_rdata_d(18),
      R => \^p_0_in\
    );
\up_rdata_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[19]_i_1_n_0\,
      Q => up_rdata_d(19),
      R => \^p_0_in\
    );
\up_rdata_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(1),
      Q => up_rdata_d(1),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(20),
      Q => up_rdata_d(20),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[21]_i_1_n_0\,
      Q => up_rdata_d(21),
      R => \^p_0_in\
    );
\up_rdata_d_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(22),
      Q => up_rdata_d(22),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[23]_i_1_n_0\,
      Q => up_rdata_d(23),
      R => \^p_0_in\
    );
\up_rdata_d_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(24),
      Q => up_rdata_d(24),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[25]_i_1_n_0\,
      Q => up_rdata_d(25),
      R => \^p_0_in\
    );
\up_rdata_d_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[26]_i_1_n_0\,
      Q => up_rdata_d(26),
      R => \^p_0_in\
    );
\up_rdata_d_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[27]_i_1_n_0\,
      Q => up_rdata_d(27),
      R => \^p_0_in\
    );
\up_rdata_d_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[28]_i_1_n_0\,
      Q => up_rdata_d(28),
      R => \^p_0_in\
    );
\up_rdata_d_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(29),
      Q => up_rdata_d(29),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[2]_i_1_n_0\,
      Q => up_rdata_d(2),
      R => \^p_0_in\
    );
\up_rdata_d_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[30]_i_1_n_0\,
      Q => up_rdata_d(30),
      R => \^p_0_in\
    );
\up_rdata_d_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[31]_i_1_n_0\,
      Q => up_rdata_d(31),
      R => \^p_0_in\
    );
\up_rdata_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[3]_i_1_n_0\,
      Q => up_rdata_d(3),
      R => \^p_0_in\
    );
\up_rdata_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(4),
      Q => up_rdata_d(4),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[5]_i_1_n_0\,
      Q => up_rdata_d(5),
      R => \^p_0_in\
    );
\up_rdata_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(6),
      Q => up_rdata_d(6),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[7]_i_1_n_0\,
      Q => up_rdata_d(7),
      R => \^p_0_in\
    );
\up_rdata_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => Q(8),
      Q => up_rdata_d(8),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[9]_i_1_n_0\,
      Q => up_rdata_d(9),
      R => \^p_0_in\
    );
\up_rdata_s[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA00BBF3"
    )
        port map (
      I0 => data1(0),
      I1 => \up_rdata_s[31]_i_6_n_0\,
      I2 => \up_rdata_s_reg[31]\(0),
      I3 => \up_rdata_s[31]_i_4_n_0\,
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(0)
    );
\up_rdata_s[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(0),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(0),
      O => data1(0)
    );
\up_rdata_s[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(10),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(10),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(10)
    );
\up_rdata_s[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(10),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(10),
      O => data1(10)
    );
\up_rdata_s[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(11),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(11),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(11)
    );
\up_rdata_s[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(11),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(11),
      O => data1(11)
    );
\up_rdata_s[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(12),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(12),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(12)
    );
\up_rdata_s[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(12),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(12),
      O => data1(12)
    );
\up_rdata_s[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(13),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(13),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(13)
    );
\up_rdata_s[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(13),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(13),
      O => data1(13)
    );
\up_rdata_s[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(14),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(14),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(14)
    );
\up_rdata_s[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(14),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(14),
      O => data1(14)
    );
\up_rdata_s[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(15),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(15),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(15)
    );
\up_rdata_s[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(15),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(15),
      O => data1(15)
    );
\up_rdata_s[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAF83AC83"
    )
        port map (
      I0 => data1(16),
      I1 => \up_rdata_s[31]_i_5_n_0\,
      I2 => \up_rdata_s[31]_i_4_n_0\,
      I3 => \up_rdata_s[31]_i_6_n_0\,
      I4 => \up_rdata_s_reg[31]\(16),
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(16)
    );
\up_rdata_s[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(16),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(16),
      O => data1(16)
    );
\up_rdata_s[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(17),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(17),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(17)
    );
\up_rdata_s[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(17),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(17),
      O => data1(17)
    );
\up_rdata_s[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(18),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(18),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(18)
    );
\up_rdata_s[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(18),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(18),
      O => data1(18)
    );
\up_rdata_s[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(19),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(19),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(19)
    );
\up_rdata_s[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(19),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(19),
      O => data1(19)
    );
\up_rdata_s[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(1),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(1),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(1)
    );
\up_rdata_s[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(1),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(1),
      O => data1(1)
    );
\up_rdata_s[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(20),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(20),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(20)
    );
\up_rdata_s[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(20),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(20),
      O => data1(20)
    );
\up_rdata_s[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(21),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(21),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(21)
    );
\up_rdata_s[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(21),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(21),
      O => data1(21)
    );
\up_rdata_s[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(22),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(22),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(22)
    );
\up_rdata_s[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(22),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(22),
      O => data1(22)
    );
\up_rdata_s[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(23),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(23),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(23)
    );
\up_rdata_s[23]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(23),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(23),
      O => data1(23)
    );
\up_rdata_s[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(24),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(24),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(24)
    );
\up_rdata_s[24]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(24),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(24),
      O => data1(24)
    );
\up_rdata_s[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(25),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(25),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(25)
    );
\up_rdata_s[25]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(25),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(25),
      O => data1(25)
    );
\up_rdata_s[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(26),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(26),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(26)
    );
\up_rdata_s[26]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(26),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(26),
      O => data1(26)
    );
\up_rdata_s[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(27),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(27),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(27)
    );
\up_rdata_s[27]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(27),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(27),
      O => data1(27)
    );
\up_rdata_s[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(28),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(28),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(28)
    );
\up_rdata_s[28]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(28),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(28),
      O => data1(28)
    );
\up_rdata_s[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(29),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(29),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(29)
    );
\up_rdata_s[29]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(29),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(29),
      O => data1(29)
    );
\up_rdata_s[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(2),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(2),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(2)
    );
\up_rdata_s[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(2),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(2),
      O => data1(2)
    );
\up_rdata_s[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8B080"
    )
        port map (
      I0 => data1(30),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_6_n_0\,
      I3 => \up_rdata_s_reg[31]\(30),
      I4 => \up_rdata_s[31]_i_5_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(30)
    );
\up_rdata_s[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(30),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(30),
      O => data1(30)
    );
\up_rdata_s[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(31),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(31),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(31)
    );
\up_rdata_s[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(31),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(31),
      O => data1(31)
    );
\up_rdata_s[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^rom_addr\(3),
      I1 => \^rom_addr\(2),
      I2 => \^rom_addr\(4),
      O => \up_rdata_s[31]_i_4_n_0\
    );
\up_rdata_s[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
        port map (
      I0 => \^rom_addr\(2),
      I1 => \^rom_addr\(0),
      I2 => \^rom_addr\(1),
      I3 => \^rom_addr\(4),
      I4 => \^rom_addr\(3),
      O => \up_rdata_s[31]_i_5_n_0\
    );
\up_rdata_s[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^rom_addr\(4),
      I1 => \^rom_addr\(3),
      I2 => \^rom_addr\(1),
      I3 => \^rom_addr\(2),
      O => \up_rdata_s[31]_i_6_n_0\
    );
\up_rdata_s[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => up_raddr_int(9),
      I1 => up_raddr_int(10),
      I2 => \^rom_addr\(6),
      I3 => \^rom_addr\(5),
      I4 => \^rom_addr\(8),
      I5 => \^rom_addr\(7),
      O => \up_rdata_s[31]_i_7_n_0\
    );
\up_rdata_s[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888C8C"
    )
        port map (
      I0 => data1(3),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(3),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(3)
    );
\up_rdata_s[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(3),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(3),
      O => data1(3)
    );
\up_rdata_s[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(4),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(4),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(4)
    );
\up_rdata_s[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(4),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(4),
      O => data1(4)
    );
\up_rdata_s[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888383"
    )
        port map (
      I0 => data1(5),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(5),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(5)
    );
\up_rdata_s[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(5),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(5),
      O => data1(5)
    );
\up_rdata_s[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAF83AC83"
    )
        port map (
      I0 => data1(6),
      I1 => \up_rdata_s[31]_i_5_n_0\,
      I2 => \up_rdata_s[31]_i_4_n_0\,
      I3 => \up_rdata_s[31]_i_6_n_0\,
      I4 => \up_rdata_s_reg[31]\(6),
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(6)
    );
\up_rdata_s[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(6),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(6),
      O => data1(6)
    );
\up_rdata_s[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(7),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(7),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(7)
    );
\up_rdata_s[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(7),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(7),
      O => data1(7)
    );
\up_rdata_s[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAF83AC83"
    )
        port map (
      I0 => data1(8),
      I1 => \up_rdata_s[31]_i_5_n_0\,
      I2 => \up_rdata_s[31]_i_4_n_0\,
      I3 => \up_rdata_s[31]_i_6_n_0\,
      I4 => \up_rdata_s_reg[31]\(8),
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(8)
    );
\up_rdata_s[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(8),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(8),
      O => data1(8)
    );
\up_rdata_s[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA8B888080"
    )
        port map (
      I0 => data1(9),
      I1 => \up_rdata_s[31]_i_4_n_0\,
      I2 => \up_rdata_s[31]_i_5_n_0\,
      I3 => \up_rdata_s_reg[31]\(9),
      I4 => \up_rdata_s[31]_i_6_n_0\,
      I5 => \up_rdata_s[31]_i_7_n_0\,
      O => D(9)
    );
\up_rdata_s[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => sys_rom_data(9),
      I1 => up_raddr_int(9),
      I2 => up_raddr_int(10),
      I3 => pr_rom_data(9),
      O => data1(9)
    );
up_rreq_int_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => p_1_in_0,
      I1 => s_axi_arvalid,
      I2 => s_axi_aresetn,
      O => up_rreq_int_i_1_n_0
    );
up_rreq_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rreq_int_i_1_n_0,
      Q => \^up_rreq_int\,
      R => '0'
    );
up_rsel_inv_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55C0"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_rready,
      I2 => \^up_axi_rvalid_int_reg_0\,
      I3 => p_1_in_0,
      O => up_rsel_inv_i_1_n_0
    );
up_rsel_reg_inv: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rsel_inv_i_1_n_0,
      Q => p_1_in_0,
      S => \^p_0_in\
    );
\up_scratch[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => up_waddr_s(4),
      I1 => \^up_wreq_s\,
      I2 => up_waddr_s(1),
      I3 => up_waddr_s(10),
      I4 => \up_scratch[31]_i_2_n_0\,
      I5 => \up_scratch[31]_i_3_n_0\,
      O => E(0)
    );
\up_scratch[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => up_waddr_s(7),
      I1 => up_waddr_s(5),
      I2 => up_waddr_s(8),
      I3 => up_waddr_s(6),
      O => \up_scratch[31]_i_2_n_0\
    );
\up_scratch[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => up_waddr_s(9),
      I1 => up_waddr_s(0),
      I2 => up_waddr_s(3),
      I3 => up_waddr_s(2),
      O => \up_scratch[31]_i_3_n_0\
    );
up_wack_d_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000080000000"
    )
        port map (
      I0 => \up_wcount_reg_n_0_[3]\,
      I1 => \up_wcount_reg_n_0_[2]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => \up_wcount_reg_n_0_[0]\,
      I4 => p_0_in7_in,
      I5 => up_wack,
      O => up_wack_s
    );
up_wack_d_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_wack_s,
      Q => up_wack_d,
      R => \^p_0_in\
    );
\up_waddr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(0),
      Q => up_waddr_s(0),
      R => \^p_0_in\
    );
\up_waddr_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(10),
      Q => up_waddr_s(10),
      R => \^p_0_in\
    );
\up_waddr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(1),
      Q => up_waddr_s(1),
      R => \^p_0_in\
    );
\up_waddr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(2),
      Q => up_waddr_s(2),
      R => \^p_0_in\
    );
\up_waddr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(3),
      Q => up_waddr_s(3),
      R => \^p_0_in\
    );
\up_waddr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(4),
      Q => up_waddr_s(4),
      R => \^p_0_in\
    );
\up_waddr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(5),
      Q => up_waddr_s(5),
      R => \^p_0_in\
    );
\up_waddr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(6),
      Q => up_waddr_s(6),
      R => \^p_0_in\
    );
\up_waddr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(7),
      Q => up_waddr_s(7),
      R => \^p_0_in\
    );
\up_waddr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(8),
      Q => up_waddr_s(8),
      R => \^p_0_in\
    );
\up_waddr_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(9),
      Q => up_waddr_s(9),
      R => \^p_0_in\
    );
\up_wcount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => up_wack,
      I1 => p_0_in7_in,
      I2 => \up_wcount_reg_n_0_[0]\,
      O => \up_wcount[0]_i_1_n_0\
    );
\up_wcount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => up_wack,
      I1 => \up_wcount_reg_n_0_[0]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => p_0_in7_in,
      O => p_2_in(1)
    );
\up_wcount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14440000"
    )
        port map (
      I0 => up_wack,
      I1 => \up_wcount_reg_n_0_[2]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => \up_wcount_reg_n_0_[0]\,
      I4 => p_0_in7_in,
      O => \up_wcount[2]_i_1_n_0\
    );
\up_wcount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1444444400000000"
    )
        port map (
      I0 => up_wack,
      I1 => \up_wcount_reg_n_0_[3]\,
      I2 => \up_wcount_reg_n_0_[0]\,
      I3 => \up_wcount_reg_n_0_[1]\,
      I4 => \up_wcount_reg_n_0_[2]\,
      I5 => p_0_in7_in,
      O => p_2_in(3)
    );
\up_wcount[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in7_in,
      I1 => \^up_wreq_s\,
      O => p_1_in
    );
\up_wcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3777777777777777"
    )
        port map (
      I0 => up_wack,
      I1 => p_0_in7_in,
      I2 => \up_wcount_reg_n_0_[0]\,
      I3 => \up_wcount_reg_n_0_[1]\,
      I4 => \up_wcount_reg_n_0_[2]\,
      I5 => \up_wcount_reg_n_0_[3]\,
      O => p_2_in(4)
    );
\up_wcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => \up_wcount[0]_i_1_n_0\,
      Q => \up_wcount_reg_n_0_[0]\,
      R => \^p_0_in\
    );
\up_wcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => p_2_in(1),
      Q => \up_wcount_reg_n_0_[1]\,
      R => \^p_0_in\
    );
\up_wcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => \up_wcount[2]_i_1_n_0\,
      Q => \up_wcount_reg_n_0_[2]\,
      R => \^p_0_in\
    );
\up_wcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => p_2_in(3),
      Q => \up_wcount_reg_n_0_[3]\,
      R => \^p_0_in\
    );
\up_wcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => p_2_in(4),
      Q => p_0_in7_in,
      R => \^p_0_in\
    );
\up_wdata_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(0),
      Q => \up_wdata_int_reg[31]_0\(0),
      R => \^p_0_in\
    );
\up_wdata_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(10),
      Q => \up_wdata_int_reg[31]_0\(10),
      R => \^p_0_in\
    );
\up_wdata_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(11),
      Q => \up_wdata_int_reg[31]_0\(11),
      R => \^p_0_in\
    );
\up_wdata_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(12),
      Q => \up_wdata_int_reg[31]_0\(12),
      R => \^p_0_in\
    );
\up_wdata_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(13),
      Q => \up_wdata_int_reg[31]_0\(13),
      R => \^p_0_in\
    );
\up_wdata_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(14),
      Q => \up_wdata_int_reg[31]_0\(14),
      R => \^p_0_in\
    );
\up_wdata_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(15),
      Q => \up_wdata_int_reg[31]_0\(15),
      R => \^p_0_in\
    );
\up_wdata_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(16),
      Q => \up_wdata_int_reg[31]_0\(16),
      R => \^p_0_in\
    );
\up_wdata_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(17),
      Q => \up_wdata_int_reg[31]_0\(17),
      R => \^p_0_in\
    );
\up_wdata_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(18),
      Q => \up_wdata_int_reg[31]_0\(18),
      R => \^p_0_in\
    );
\up_wdata_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(19),
      Q => \up_wdata_int_reg[31]_0\(19),
      R => \^p_0_in\
    );
\up_wdata_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(1),
      Q => \up_wdata_int_reg[31]_0\(1),
      R => \^p_0_in\
    );
\up_wdata_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(20),
      Q => \up_wdata_int_reg[31]_0\(20),
      R => \^p_0_in\
    );
\up_wdata_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(21),
      Q => \up_wdata_int_reg[31]_0\(21),
      R => \^p_0_in\
    );
\up_wdata_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(22),
      Q => \up_wdata_int_reg[31]_0\(22),
      R => \^p_0_in\
    );
\up_wdata_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(23),
      Q => \up_wdata_int_reg[31]_0\(23),
      R => \^p_0_in\
    );
\up_wdata_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(24),
      Q => \up_wdata_int_reg[31]_0\(24),
      R => \^p_0_in\
    );
\up_wdata_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(25),
      Q => \up_wdata_int_reg[31]_0\(25),
      R => \^p_0_in\
    );
\up_wdata_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(26),
      Q => \up_wdata_int_reg[31]_0\(26),
      R => \^p_0_in\
    );
\up_wdata_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(27),
      Q => \up_wdata_int_reg[31]_0\(27),
      R => \^p_0_in\
    );
\up_wdata_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(28),
      Q => \up_wdata_int_reg[31]_0\(28),
      R => \^p_0_in\
    );
\up_wdata_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(29),
      Q => \up_wdata_int_reg[31]_0\(29),
      R => \^p_0_in\
    );
\up_wdata_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(2),
      Q => \up_wdata_int_reg[31]_0\(2),
      R => \^p_0_in\
    );
\up_wdata_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(30),
      Q => \up_wdata_int_reg[31]_0\(30),
      R => \^p_0_in\
    );
\up_wdata_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(31),
      Q => \up_wdata_int_reg[31]_0\(31),
      R => \^p_0_in\
    );
\up_wdata_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(3),
      Q => \up_wdata_int_reg[31]_0\(3),
      R => \^p_0_in\
    );
\up_wdata_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(4),
      Q => \up_wdata_int_reg[31]_0\(4),
      R => \^p_0_in\
    );
\up_wdata_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(5),
      Q => \up_wdata_int_reg[31]_0\(5),
      R => \^p_0_in\
    );
\up_wdata_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(6),
      Q => \up_wdata_int_reg[31]_0\(6),
      R => \^p_0_in\
    );
\up_wdata_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(7),
      Q => \up_wdata_int_reg[31]_0\(7),
      R => \^p_0_in\
    );
\up_wdata_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(8),
      Q => \up_wdata_int_reg[31]_0\(8),
      R => \^p_0_in\
    );
\up_wdata_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(9),
      Q => \up_wdata_int_reg[31]_0\(9),
      R => \^p_0_in\
    );
up_wreq_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_5_in,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      I3 => s_axi_aresetn,
      O => up_wreq_int_i_1_n_0
    );
up_wreq_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_wreq_int_i_1_n_0,
      Q => \^up_wreq_s\,
      R => '0'
    );
up_wsel_inv_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7777F000"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_bready,
      I3 => \^s_axi_bvalid\,
      I4 => p_5_in,
      O => up_wsel_inv_i_1_n_0
    );
up_wsel_reg_inv: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_wsel_inv_i_1_n_0,
      Q => p_5_in,
      S => \^p_0_in\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_sysid_0_0_axi_sysid is
  port (
    up_axi_rvalid_int_reg : out STD_LOGIC;
    rom_addr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_bready : in STD_LOGIC;
    sys_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pr_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_sysid_0_0_axi_sysid : entity is "axi_sysid";
end system_axi_sysid_0_0_axi_sysid;

architecture STRUCTURE of system_axi_sysid_0_0_axi_sysid is
  signal i_up_axi_n_100 : STD_LOGIC;
  signal i_up_axi_n_101 : STD_LOGIC;
  signal i_up_axi_n_102 : STD_LOGIC;
  signal i_up_axi_n_103 : STD_LOGIC;
  signal i_up_axi_n_104 : STD_LOGIC;
  signal i_up_axi_n_105 : STD_LOGIC;
  signal i_up_axi_n_106 : STD_LOGIC;
  signal i_up_axi_n_107 : STD_LOGIC;
  signal i_up_axi_n_108 : STD_LOGIC;
  signal i_up_axi_n_109 : STD_LOGIC;
  signal i_up_axi_n_110 : STD_LOGIC;
  signal i_up_axi_n_111 : STD_LOGIC;
  signal i_up_axi_n_112 : STD_LOGIC;
  signal i_up_axi_n_113 : STD_LOGIC;
  signal i_up_axi_n_81 : STD_LOGIC;
  signal i_up_axi_n_82 : STD_LOGIC;
  signal i_up_axi_n_83 : STD_LOGIC;
  signal i_up_axi_n_84 : STD_LOGIC;
  signal i_up_axi_n_85 : STD_LOGIC;
  signal i_up_axi_n_86 : STD_LOGIC;
  signal i_up_axi_n_87 : STD_LOGIC;
  signal i_up_axi_n_88 : STD_LOGIC;
  signal i_up_axi_n_89 : STD_LOGIC;
  signal i_up_axi_n_90 : STD_LOGIC;
  signal i_up_axi_n_91 : STD_LOGIC;
  signal i_up_axi_n_92 : STD_LOGIC;
  signal i_up_axi_n_93 : STD_LOGIC;
  signal i_up_axi_n_94 : STD_LOGIC;
  signal i_up_axi_n_95 : STD_LOGIC;
  signal i_up_axi_n_96 : STD_LOGIC;
  signal i_up_axi_n_97 : STD_LOGIC;
  signal i_up_axi_n_98 : STD_LOGIC;
  signal i_up_axi_n_99 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal up_rack_s : STD_LOGIC;
  signal up_rdata_s : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \up_rdata_s[31]_i_1_n_0\ : STD_LOGIC;
  signal up_rreq_int : STD_LOGIC;
  signal up_rreq_s_d : STD_LOGIC;
  signal up_scratch : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal up_wack : STD_LOGIC;
  signal up_wdata_int : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal up_wreq_s : STD_LOGIC;
begin
i_up_axi: entity work.system_axi_sysid_0_0_up_axi
     port map (
      D(31) => i_up_axi_n_82,
      D(30) => i_up_axi_n_83,
      D(29) => i_up_axi_n_84,
      D(28) => i_up_axi_n_85,
      D(27) => i_up_axi_n_86,
      D(26) => i_up_axi_n_87,
      D(25) => i_up_axi_n_88,
      D(24) => i_up_axi_n_89,
      D(23) => i_up_axi_n_90,
      D(22) => i_up_axi_n_91,
      D(21) => i_up_axi_n_92,
      D(20) => i_up_axi_n_93,
      D(19) => i_up_axi_n_94,
      D(18) => i_up_axi_n_95,
      D(17) => i_up_axi_n_96,
      D(16) => i_up_axi_n_97,
      D(15) => i_up_axi_n_98,
      D(14) => i_up_axi_n_99,
      D(13) => i_up_axi_n_100,
      D(12) => i_up_axi_n_101,
      D(11) => i_up_axi_n_102,
      D(10) => i_up_axi_n_103,
      D(9) => i_up_axi_n_104,
      D(8) => i_up_axi_n_105,
      D(7) => i_up_axi_n_106,
      D(6) => i_up_axi_n_107,
      D(5) => i_up_axi_n_108,
      D(4) => i_up_axi_n_109,
      D(3) => i_up_axi_n_110,
      D(2) => i_up_axi_n_111,
      D(1) => i_up_axi_n_112,
      D(0) => i_up_axi_n_113,
      E(0) => i_up_axi_n_81,
      Q(31 downto 0) => up_rdata_s(31 downto 0),
      p_0_in => p_0_in,
      pr_rom_data(31 downto 0) => pr_rom_data(31 downto 0),
      rom_addr(8 downto 0) => rom_addr(8 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(10 downto 0) => s_axi_araddr(10 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(10 downto 0) => s_axi_awaddr(10 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      sys_rom_data(31 downto 0) => sys_rom_data(31 downto 0),
      up_axi_rvalid_int_reg_0 => up_axi_rvalid_int_reg,
      up_rack_s => up_rack_s,
      \up_rdata_s_reg[31]\(31 downto 0) => up_scratch(31 downto 0),
      up_rreq_int => up_rreq_int,
      up_wack => up_wack,
      \up_wdata_int_reg[31]_0\(31 downto 0) => up_wdata_int(31 downto 0),
      up_wreq_s => up_wreq_s
    );
up_rack_s_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rreq_s_d,
      Q => up_rack_s,
      R => p_0_in
    );
\up_rdata_s[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => up_rreq_s_d,
      O => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_113,
      Q => up_rdata_s(0),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_103,
      Q => up_rdata_s(10),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_102,
      Q => up_rdata_s(11),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_101,
      Q => up_rdata_s(12),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_100,
      Q => up_rdata_s(13),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_99,
      Q => up_rdata_s(14),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_98,
      Q => up_rdata_s(15),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_97,
      Q => up_rdata_s(16),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_96,
      Q => up_rdata_s(17),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_95,
      Q => up_rdata_s(18),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_94,
      Q => up_rdata_s(19),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_112,
      Q => up_rdata_s(1),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_93,
      Q => up_rdata_s(20),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_92,
      Q => up_rdata_s(21),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_91,
      Q => up_rdata_s(22),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_90,
      Q => up_rdata_s(23),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_89,
      Q => up_rdata_s(24),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_88,
      Q => up_rdata_s(25),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_87,
      Q => up_rdata_s(26),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_86,
      Q => up_rdata_s(27),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_85,
      Q => up_rdata_s(28),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_84,
      Q => up_rdata_s(29),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_111,
      Q => up_rdata_s(2),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_83,
      Q => up_rdata_s(30),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_82,
      Q => up_rdata_s(31),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_110,
      Q => up_rdata_s(3),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_109,
      Q => up_rdata_s(4),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_108,
      Q => up_rdata_s(5),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_107,
      Q => up_rdata_s(6),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_106,
      Q => up_rdata_s(7),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_105,
      Q => up_rdata_s(8),
      R => \up_rdata_s[31]_i_1_n_0\
    );
\up_rdata_s_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_104,
      Q => up_rdata_s(9),
      R => \up_rdata_s[31]_i_1_n_0\
    );
up_rreq_s_d_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rreq_int,
      Q => up_rreq_s_d,
      R => '0'
    );
\up_scratch_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(0),
      Q => up_scratch(0),
      R => p_0_in
    );
\up_scratch_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(10),
      Q => up_scratch(10),
      R => p_0_in
    );
\up_scratch_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(11),
      Q => up_scratch(11),
      R => p_0_in
    );
\up_scratch_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(12),
      Q => up_scratch(12),
      R => p_0_in
    );
\up_scratch_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(13),
      Q => up_scratch(13),
      R => p_0_in
    );
\up_scratch_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(14),
      Q => up_scratch(14),
      R => p_0_in
    );
\up_scratch_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(15),
      Q => up_scratch(15),
      R => p_0_in
    );
\up_scratch_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(16),
      Q => up_scratch(16),
      R => p_0_in
    );
\up_scratch_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(17),
      Q => up_scratch(17),
      R => p_0_in
    );
\up_scratch_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(18),
      Q => up_scratch(18),
      R => p_0_in
    );
\up_scratch_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(19),
      Q => up_scratch(19),
      R => p_0_in
    );
\up_scratch_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(1),
      Q => up_scratch(1),
      R => p_0_in
    );
\up_scratch_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(20),
      Q => up_scratch(20),
      R => p_0_in
    );
\up_scratch_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(21),
      Q => up_scratch(21),
      R => p_0_in
    );
\up_scratch_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(22),
      Q => up_scratch(22),
      R => p_0_in
    );
\up_scratch_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(23),
      Q => up_scratch(23),
      R => p_0_in
    );
\up_scratch_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(24),
      Q => up_scratch(24),
      R => p_0_in
    );
\up_scratch_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(25),
      Q => up_scratch(25),
      R => p_0_in
    );
\up_scratch_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(26),
      Q => up_scratch(26),
      R => p_0_in
    );
\up_scratch_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(27),
      Q => up_scratch(27),
      R => p_0_in
    );
\up_scratch_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(28),
      Q => up_scratch(28),
      R => p_0_in
    );
\up_scratch_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(29),
      Q => up_scratch(29),
      R => p_0_in
    );
\up_scratch_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(2),
      Q => up_scratch(2),
      R => p_0_in
    );
\up_scratch_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(30),
      Q => up_scratch(30),
      R => p_0_in
    );
\up_scratch_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(31),
      Q => up_scratch(31),
      R => p_0_in
    );
\up_scratch_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(3),
      Q => up_scratch(3),
      R => p_0_in
    );
\up_scratch_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(4),
      Q => up_scratch(4),
      R => p_0_in
    );
\up_scratch_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(5),
      Q => up_scratch(5),
      R => p_0_in
    );
\up_scratch_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(6),
      Q => up_scratch(6),
      R => p_0_in
    );
\up_scratch_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(7),
      Q => up_scratch(7),
      R => p_0_in
    );
\up_scratch_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(8),
      Q => up_scratch(8),
      R => p_0_in
    );
\up_scratch_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_wdata_int(9),
      Q => up_scratch(9),
      R => p_0_in
    );
up_wack_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_wreq_s,
      Q => up_wack,
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_sysid_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    sys_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pr_rom_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rom_addr : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_axi_sysid_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_axi_sysid_0_0 : entity is "system_axi_sysid_0_0,axi_sysid,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_axi_sysid_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_axi_sysid_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_axi_sysid_0_0 : entity is "axi_sysid,Vivado 2025.1";
end system_axi_sysid_0_0;

architecture STRUCTURE of system_axi_sysid_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute X_INTERFACE_MODE of s_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi AWVALID";
  attribute X_INTERFACE_MODE of s_axi_awvalid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awvalid : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi RREADY";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi WVALID";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s_axi ARPROT";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi AWADDR";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi AWPROT";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi WSTRB";
begin
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_axi_sysid_0_0_axi_sysid
     port map (
      pr_rom_data(31 downto 0) => pr_rom_data(31 downto 0),
      rom_addr(8 downto 0) => rom_addr(8 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(10 downto 0) => s_axi_araddr(12 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(10 downto 0) => s_axi_awaddr(12 downto 2),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      sys_rom_data(31 downto 0) => sys_rom_data(31 downto 0),
      up_axi_rvalid_int_reg => s_axi_rvalid
    );
end STRUCTURE;
