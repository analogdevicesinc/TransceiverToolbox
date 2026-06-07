-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:20:51 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_pl_sysmon_0/system_pl_sysmon_0_sim_netlist.vhdl
-- Design      : system_pl_sysmon_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_address_decoder is
  port (
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0\ : out STD_LOGIC;
    Bus_RNW_reg_reg_0 : out STD_LOGIC;
    local_reg_wrack0 : out STD_LOGIC;
    convst_rst_wrce_or_reduce : out STD_LOGIC;
    DWE : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 0 to 0 );
    local_reg_rdack0 : out STD_LOGIC;
    local_rdce_or_reduce : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 18 downto 0 );
    status_reg_rdack0 : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rst_ip2bus_error : out STD_LOGIC;
    reset_trig0 : out STD_LOGIC;
    sw_rst_cond : out STD_LOGIC;
    Intr2Bus_RdAck0 : out STD_LOGIC;
    irpt_rdack : out STD_LOGIC;
    interrupt_wrce_strb : out STD_LOGIC;
    irpt_wrack : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ : out STD_LOGIC;
    dummy_local_reg_rdack0 : out STD_LOGIC;
    dummy_local_reg_rdack_d10 : out STD_LOGIC;
    dummy_local_reg_wrack0 : out STD_LOGIC;
    dummy_local_reg_wrack_d10 : out STD_LOGIC;
    rst_ip2bus_rdack0 : out STD_LOGIC;
    \ip_irpt_status_reg1__0\ : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    \s_axi_wdata[31]\ : out STD_LOGIC;
    Q : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    local_reg_wrack_d1 : in STD_LOGIC;
    jtaglocked_i : in STD_LOGIC;
    local_reg_rdack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    p_1_in46_in : in STD_LOGIC;
    p_1_in43_in : in STD_LOGIC;
    p_1_in40_in : in STD_LOGIC;
    p_1_in37_in : in STD_LOGIC;
    p_1_in34_in : in STD_LOGIC;
    p_1_in31_in : in STD_LOGIC;
    p_1_in28_in : in STD_LOGIC;
    p_1_in25_in : in STD_LOGIC;
    p_1_in22_in : in STD_LOGIC;
    p_1_in19_in : in STD_LOGIC;
    p_1_in16_in : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\ : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    p_1_in13_in : in STD_LOGIC;
    p_1_in10_in : in STD_LOGIC;
    p_1_in7_in : in STD_LOGIC;
    p_1_in4_in : in STD_LOGIC;
    p_1_in1_in : in STD_LOGIC;
    p_1_in_0 : in STD_LOGIC;
    jtagmodified_i : in STD_LOGIC;
    jtagmodified_d1 : in STD_LOGIC;
    status_reg_rdack_d1 : in STD_LOGIC;
    \data_is_non_reset_match__3\ : in STD_LOGIC;
    sw_rst_cond_d1 : in STD_LOGIC;
    ipif_glbl_irpt_enable_reg_reg : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    ipif_glbl_irpt_enable_reg : in STD_LOGIC;
    bus2ip_be : in STD_LOGIC_VECTOR ( 0 to 0 );
    irpt_rdack_d1 : in STD_LOGIC;
    irpt_wrack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ : in STD_LOGIC;
    dummy_local_reg_rdack_d1 : in STD_LOGIC;
    dummy_local_reg_wrack_d1 : in STD_LOGIC;
    rst_ip2bus_rdack_d1 : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    hard_macro_rst_reg : in STD_LOGIC;
    ip2bus_wrack : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ip2bus_rdack : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );
end system_pl_sysmon_0_address_decoder;

architecture STRUCTURE of system_pl_sysmon_0_address_decoder is
  signal Bus_RNW_reg_i_1_n_0 : STD_LOGIC;
  signal \^bus_rnw_reg_reg_0\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\ : STD_LOGIC;
  signal \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0\ : STD_LOGIC;
  signal ce_expnd_i_1 : STD_LOGIC;
  signal ce_expnd_i_10 : STD_LOGIC;
  signal ce_expnd_i_11 : STD_LOGIC;
  signal ce_expnd_i_12 : STD_LOGIC;
  signal ce_expnd_i_13 : STD_LOGIC;
  signal ce_expnd_i_14 : STD_LOGIC;
  signal ce_expnd_i_15 : STD_LOGIC;
  signal ce_expnd_i_16 : STD_LOGIC;
  signal ce_expnd_i_17 : STD_LOGIC;
  signal ce_expnd_i_18 : STD_LOGIC;
  signal ce_expnd_i_19 : STD_LOGIC;
  signal ce_expnd_i_2 : STD_LOGIC;
  signal ce_expnd_i_20 : STD_LOGIC;
  signal ce_expnd_i_21 : STD_LOGIC;
  signal ce_expnd_i_22 : STD_LOGIC;
  signal ce_expnd_i_23 : STD_LOGIC;
  signal ce_expnd_i_24 : STD_LOGIC;
  signal ce_expnd_i_3 : STD_LOGIC;
  signal ce_expnd_i_4 : STD_LOGIC;
  signal ce_expnd_i_5 : STD_LOGIC;
  signal ce_expnd_i_6 : STD_LOGIC;
  signal ce_expnd_i_7 : STD_LOGIC;
  signal ce_expnd_i_8 : STD_LOGIC;
  signal ce_expnd_i_9 : STD_LOGIC;
  signal cs_ce_clr : STD_LOGIC;
  signal p_10_in : STD_LOGIC;
  signal p_11_in : STD_LOGIC;
  signal p_12_in : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal p_14_in : STD_LOGIC;
  signal p_15_in : STD_LOGIC;
  signal p_16_in : STD_LOGIC;
  signal p_17_in : STD_LOGIC;
  signal p_18_in : STD_LOGIC;
  signal p_19_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_20_in : STD_LOGIC;
  signal p_21_in : STD_LOGIC;
  signal p_22_in : STD_LOGIC;
  signal p_23_in : STD_LOGIC;
  signal p_24_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_6_in : STD_LOGIC;
  signal p_7_in : STD_LOGIC;
  signal p_8_in : STD_LOGIC;
  signal p_9_in : STD_LOGIC;
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Bus_RNW_reg_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[10].ce_out_i[10]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[11].ce_out_i[11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[12].ce_out_i[12]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[13].ce_out_i[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[14].ce_out_i[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[15].ce_out_i[15]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[9].ce_out_i[9]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_error_i_5\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of drdy_rd_ack_i_d1_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of drdy_wr_ack_i_d1_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of dummy_local_reg_rdack_d1_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of dummy_local_reg_rdack_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of dummy_local_reg_wrack_d1_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of dummy_local_reg_wrack_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of inst_sysmon_i_2 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \ip_irpt_enable_reg[17]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of local_reg_rdack_d1_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of local_reg_rdack_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of local_reg_wrack_d1_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of reset_trig_i_1 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of rst_ip2bus_rdack_i_1 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of status_reg_rdack_d1_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of status_reg_rdack_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of sw_rst_cond_d1_i_1 : label is "soft_lutpair19";
begin
  Bus_RNW_reg_reg_0 <= \^bus_rnw_reg_reg_0\;
  \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0\ <= \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\;
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
Bus_RNW_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ipif_glbl_irpt_enable_reg_reg,
      I1 => Q,
      I2 => \^bus_rnw_reg_reg_0\,
      O => Bus_RNW_reg_i_1_n_0
    );
Bus_RNW_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Bus_RNW_reg_i_1_n_0,
      Q => \^bus_rnw_reg_reg_0\,
      R => '0'
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_24
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_24,
      Q => p_24_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[10].ce_out_i[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_14
    );
\GEN_BKEND_CE_REGISTERS[10].ce_out_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_14,
      Q => p_14_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[11].ce_out_i[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_13
    );
\GEN_BKEND_CE_REGISTERS[11].ce_out_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_13,
      Q => p_13_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[12].ce_out_i[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_12
    );
\GEN_BKEND_CE_REGISTERS[12].ce_out_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_12,
      Q => p_12_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[13].ce_out_i[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_11
    );
\GEN_BKEND_CE_REGISTERS[13].ce_out_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_11,
      Q => p_11_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[14].ce_out_i[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_10
    );
\GEN_BKEND_CE_REGISTERS[14].ce_out_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_10,
      Q => p_10_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[15].ce_out_i[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_9
    );
\GEN_BKEND_CE_REGISTERS[15].ce_out_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_9,
      Q => p_9_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_8
    );
\GEN_BKEND_CE_REGISTERS[16].ce_out_i_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_8,
      Q => p_8_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_7
    );
\GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_7,
      Q => p_7_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_6
    );
\GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_6,
      Q => p_6_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_5
    );
\GEN_BKEND_CE_REGISTERS[19].ce_out_i_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_5,
      Q => p_5_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_23
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_23,
      Q => p_23_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_4
    );
\GEN_BKEND_CE_REGISTERS[20].ce_out_i_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_4,
      Q => p_4_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_3
    );
\GEN_BKEND_CE_REGISTERS[21].ce_out_i_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_3,
      Q => p_3_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_2
    );
\GEN_BKEND_CE_REGISTERS[22].ce_out_i_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_2,
      Q => p_2_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_1
    );
\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => Q,
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(8),
      I2 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(5),
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(6),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(7),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      O => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\
    );
\GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_1,
      Q => p_1_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[24].ce_out_i[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => ip2bus_wrack,
      I1 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\(0),
      I2 => ip2bus_rdack,
      I3 => s_axi_aresetn,
      O => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(8),
      Q => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[2].ce_out_i[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_22
    );
\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_22,
      Q => p_22_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_21
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_21,
      Q => p_21_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[4].ce_out_i[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_20
    );
\GEN_BKEND_CE_REGISTERS[4].ce_out_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_20,
      Q => p_20_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[5].ce_out_i[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_19
    );
\GEN_BKEND_CE_REGISTERS[5].ce_out_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_19,
      Q => p_19_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[6].ce_out_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_18
    );
\GEN_BKEND_CE_REGISTERS[6].ce_out_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_18,
      Q => p_18_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000000000000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(4),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_17
    );
\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(7),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(6),
      I2 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(5),
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(8),
      I4 => Q,
      O => \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0\
    );
\GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_17,
      Q => p_17_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_16
    );
\GEN_BKEND_CE_REGISTERS[8].ce_out_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_16,
      Q => p_16_in,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[9].ce_out_i[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(2),
      O => ce_expnd_i_15
    );
\GEN_BKEND_CE_REGISTERS[9].ce_out_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_15,
      Q => p_15_in,
      R => cs_ce_clr
    );
\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => irpt_wrack_d1,
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => bus2ip_be(0),
      I3 => p_8_in,
      O => \ip_irpt_status_reg1__0\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\,
      I2 => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\,
      O => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0\,
      I1 => p_2_in,
      I2 => p_3_in,
      I3 => p_16_in,
      I4 => p_1_in,
      I5 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0\,
      O => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_14_in,
      I1 => p_15_in,
      I2 => p_12_in,
      I3 => p_13_in,
      O => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => p_7_in,
      I1 => p_11_in,
      I2 => p_10_in,
      I3 => p_4_in,
      I4 => p_5_in,
      O => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0\
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0\,
      I2 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\,
      O => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => p_6_in,
      I1 => p_8_in,
      I2 => ipif_glbl_irpt_enable_reg,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => p_9_in,
      I5 => bus2ip_be(0),
      O => D(18)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in_0,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      O => D(17)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000A80000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I1 => jtagmodified_i,
      I2 => jtagmodified_d1,
      I3 => p_22_in,
      I4 => \^bus_rnw_reg_reg_0\,
      I5 => p_23_in,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_8_in,
      I2 => s_axi_wstrb(0),
      I3 => ipif_glbl_irpt_enable_reg_reg,
      O => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A80000"
    )
        port map (
      I0 => p_6_in,
      I1 => ipif_glbl_irpt_enable_reg_reg,
      I2 => s_axi_wstrb(0),
      I3 => p_8_in,
      I4 => \^bus_rnw_reg_reg_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(16),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      I3 => jtaglocked_i,
      I4 => p_1_in1_in,
      I5 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      O => D(16)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I1 => p_22_in,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => p_23_in,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(15),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15),
      I4 => p_1_in4_in,
      I5 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      O => D(15)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I1 => p_1_in7_in,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(14),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0\,
      O => D(14)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14),
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(14),
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => p_23_in,
      I1 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => p_22_in,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I1 => p_1_in10_in,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(13),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0\,
      O => D(13)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(13),
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(13),
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I1 => p_1_in13_in,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(12),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0\,
      O => D(12)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(12),
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(12),
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in16_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11),
      O => D(11)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(11),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(11),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(11),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I1 => p_23_in,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => p_22_in,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in19_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(10),
      O => D(10)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(10),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(10),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(10),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in22_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(9),
      O => D(9)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(9),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(9),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(9),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in25_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(8),
      O => D(8)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(8),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(8),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(8),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in28_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(7),
      O => D(7)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(7),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(7),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(7),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in31_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(6),
      O => D(6)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(6),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(6),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(6),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in34_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(5),
      O => D(5)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(5),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(5),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(5),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in37_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(4),
      O => D(4)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(4),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(4),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(4),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in40_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(3),
      O => D(3)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(3),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(3),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(3),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in43_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(2),
      O => D(2)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(2),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(2),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(2),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => p_1_in46_in,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(1),
      O => D(1)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(1),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(1),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(1),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0\,
      I1 => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out\,
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0\,
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(0),
      O => D(0)
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0\,
      I1 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(0),
      I2 => \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0\,
      I3 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(0),
      I4 => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(0),
      I5 => \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0\,
      O => \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0\
    );
\INTR_CTRLR_GEN_I.ip2bus_error_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_24_in,
      I2 => \data_is_non_reset_match__3\,
      O => rst_ip2bus_error
    );
Intr2Bus_RdAck_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A0A0A080"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_8_in,
      I2 => bus2ip_be(0),
      I3 => p_6_in,
      I4 => p_9_in,
      I5 => irpt_rdack_d1,
      O => Intr2Bus_RdAck0
    );
Intr2Bus_WrAck_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000050505040"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_9_in,
      I2 => bus2ip_be(0),
      I3 => p_6_in,
      I4 => p_8_in,
      I5 => irpt_wrack_d1,
      O => interrupt_wrce_strb
    );
drdy_rd_ack_i_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_rdce(0)
    );
drdy_wr_ack_i_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_wrce(0)
    );
dummy_local_reg_rdack_d1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE00"
    )
        port map (
      I0 => p_19_in,
      I1 => p_18_in,
      I2 => p_17_in,
      I3 => \^bus_rnw_reg_reg_0\,
      O => dummy_local_reg_rdack_d10
    );
dummy_local_reg_rdack_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAA8"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_17_in,
      I2 => p_18_in,
      I3 => p_19_in,
      I4 => dummy_local_reg_rdack_d1,
      O => dummy_local_reg_rdack0
    );
dummy_local_reg_wrack_d1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => p_19_in,
      I1 => p_18_in,
      I2 => p_17_in,
      I3 => \^bus_rnw_reg_reg_0\,
      O => dummy_local_reg_wrack_d10
    );
dummy_local_reg_wrack_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005554"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_17_in,
      I2 => p_18_in,
      I3 => p_19_in,
      I4 => dummy_local_reg_wrack_d1,
      O => dummy_local_reg_wrack0
    );
hard_macro_rst_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => s_axi_wdata(0),
      I1 => p_20_in,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => p_21_in,
      I4 => hard_macro_rst_reg,
      O => s_axi_wdata_0_sn_1
    );
inst_sysmon_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \^gen_bkend_ce_registers[24].ce_out_i_reg[24]_0\,
      I2 => jtaglocked_i,
      O => DWE
    );
\ip_irpt_enable_reg[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4440"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_6_in,
      I2 => s_axi_wstrb(0),
      I3 => ipif_glbl_irpt_enable_reg_reg,
      O => E(0)
    );
ipif_glbl_irpt_enable_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF20202000"
    )
        port map (
      I0 => s_axi_wdata(1),
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => p_9_in,
      I3 => s_axi_wstrb(0),
      I4 => ipif_glbl_irpt_enable_reg_reg,
      I5 => ipif_glbl_irpt_enable_reg,
      O => \s_axi_wdata[31]\
    );
irpt_rdack_d1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0EEE000000000"
    )
        port map (
      I0 => p_9_in,
      I1 => p_6_in,
      I2 => ipif_glbl_irpt_enable_reg_reg,
      I3 => s_axi_wstrb(0),
      I4 => p_8_in,
      I5 => \^bus_rnw_reg_reg_0\,
      O => irpt_rdack
    );
irpt_wrack_d1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF0EEE0"
    )
        port map (
      I0 => p_8_in,
      I1 => p_6_in,
      I2 => ipif_glbl_irpt_enable_reg_reg,
      I3 => s_axi_wstrb(0),
      I4 => p_9_in,
      I5 => \^bus_rnw_reg_reg_0\,
      O => irpt_wrack
    );
local_reg_rdack_d1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F0E0"
    )
        port map (
      I0 => p_22_in,
      I1 => p_20_in,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => p_21_in,
      O => local_rdce_or_reduce
    );
local_reg_rdack_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000CCC8"
    )
        port map (
      I0 => p_21_in,
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => p_20_in,
      I3 => p_22_in,
      I4 => local_reg_rdack_d1,
      O => local_reg_rdack0
    );
local_reg_wrack_d1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00FE"
    )
        port map (
      I0 => p_22_in,
      I1 => p_23_in,
      I2 => p_21_in,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => p_20_in,
      O => convst_rst_wrce_or_reduce
    );
local_reg_wrack_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033333332"
    )
        port map (
      I0 => p_20_in,
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => p_21_in,
      I3 => p_23_in,
      I4 => p_22_in,
      I5 => local_reg_wrack_d1,
      O => local_reg_wrack0
    );
reset_trig_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \data_is_non_reset_match__3\,
      I1 => p_24_in,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => sw_rst_cond_d1,
      O => reset_trig0
    );
rst_ip2bus_rdack_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_24_in,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_rdce(2)
    );
rst_ip2bus_rdack_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => rst_ip2bus_rdack_d1,
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => p_24_in,
      O => rst_ip2bus_rdack0
    );
status_reg_rdack_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_23_in,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_rdce(1)
    );
status_reg_rdack_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_23_in,
      I2 => status_reg_rdack_d1,
      O => status_reg_rdack0
    );
sw_rst_cond_d1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => p_24_in,
      I2 => \data_is_non_reset_match__3\,
      O => sw_rst_cond
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_interrupt_control is
  port (
    irpt_wrack_d1 : out STD_LOGIC;
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0\ : out STD_LOGIC;
    p_1_in46_in : out STD_LOGIC;
    p_1_in43_in : out STD_LOGIC;
    p_1_in40_in : out STD_LOGIC;
    p_1_in37_in : out STD_LOGIC;
    p_1_in34_in : out STD_LOGIC;
    p_1_in31_in : out STD_LOGIC;
    p_1_in28_in : out STD_LOGIC;
    p_1_in25_in : out STD_LOGIC;
    p_1_in22_in : out STD_LOGIC;
    p_1_in19_in : out STD_LOGIC;
    p_1_in16_in : out STD_LOGIC;
    p_1_in13_in : out STD_LOGIC;
    p_1_in10_in : out STD_LOGIC;
    p_1_in7_in : out STD_LOGIC;
    p_1_in4_in : out STD_LOGIC;
    p_1_in1_in : out STD_LOGIC;
    p_1_in : out STD_LOGIC;
    irpt_rdack_d1 : out STD_LOGIC;
    intr_ip2bus_rdack : out STD_LOGIC;
    ipif_glbl_irpt_enable_reg : out STD_LOGIC;
    ip2bus_wrack_int1 : out STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 17 downto 0 );
    reset2ip_reset : in STD_LOGIC;
    irpt_wrack : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    eos_out : in STD_LOGIC;
    eoc_out : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    jtagmodified_i : in STD_LOGIC;
    interrupt_status_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    interrupt_wrce_strb : in STD_LOGIC;
    irpt_rdack : in STD_LOGIC;
    Intr2Bus_RdAck0 : in STD_LOGIC;
    ipif_glbl_irpt_enable_reg_reg_0 : in STD_LOGIC;
    dummy_local_reg_wrack : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\ : in STD_LOGIC;
    wrack : in STD_LOGIC;
    rst_ip2bus_error : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_wrack_reg\ : in STD_LOGIC;
    \ip_irpt_status_reg1__0\ : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 17 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end system_pl_sysmon_0_interrupt_control;

architecture STRUCTURE of system_pl_sysmon_0_interrupt_control is
  signal \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1\ : STD_LOGIC;
  signal \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \^gen_ip_irpt_status_reg[0].gen_reg_status.ip_irpt_status_reg_reg[0]_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal intr_ip2bus_wrack : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_1_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_2_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_3_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_4_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_5_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_6_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_7_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_8_n_0 : STD_LOGIC;
  signal ip2intc_irpt_INST_0_i_9_n_0 : STD_LOGIC;
  signal \^ipif_glbl_irpt_enable_reg\ : STD_LOGIC;
  signal \^p_1_in\ : STD_LOGIC;
  signal \^p_1_in10_in\ : STD_LOGIC;
  signal \^p_1_in13_in\ : STD_LOGIC;
  signal \^p_1_in16_in\ : STD_LOGIC;
  signal \^p_1_in19_in\ : STD_LOGIC;
  signal \^p_1_in1_in\ : STD_LOGIC;
  signal \^p_1_in22_in\ : STD_LOGIC;
  signal \^p_1_in25_in\ : STD_LOGIC;
  signal \^p_1_in28_in\ : STD_LOGIC;
  signal \^p_1_in31_in\ : STD_LOGIC;
  signal \^p_1_in34_in\ : STD_LOGIC;
  signal \^p_1_in37_in\ : STD_LOGIC;
  signal \^p_1_in40_in\ : STD_LOGIC;
  signal \^p_1_in43_in\ : STD_LOGIC;
  signal \^p_1_in46_in\ : STD_LOGIC;
  signal \^p_1_in4_in\ : STD_LOGIC;
  signal \^p_1_in7_in\ : STD_LOGIC;
begin
  \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0\ <= \^gen_ip_irpt_status_reg[0].gen_reg_status.ip_irpt_status_reg_reg[0]_0\;
  Q(17 downto 0) <= \^q\(17 downto 0);
  ipif_glbl_irpt_enable_reg <= \^ipif_glbl_irpt_enable_reg\;
  p_1_in <= \^p_1_in\;
  p_1_in10_in <= \^p_1_in10_in\;
  p_1_in13_in <= \^p_1_in13_in\;
  p_1_in16_in <= \^p_1_in16_in\;
  p_1_in19_in <= \^p_1_in19_in\;
  p_1_in1_in <= \^p_1_in1_in\;
  p_1_in22_in <= \^p_1_in22_in\;
  p_1_in25_in <= \^p_1_in25_in\;
  p_1_in28_in <= \^p_1_in28_in\;
  p_1_in31_in <= \^p_1_in31_in\;
  p_1_in34_in <= \^p_1_in34_in\;
  p_1_in37_in <= \^p_1_in37_in\;
  p_1_in40_in <= \^p_1_in40_in\;
  p_1_in43_in <= \^p_1_in43_in\;
  p_1_in46_in <= \^p_1_in46_in\;
  p_1_in4_in <= \^p_1_in4_in\;
  p_1_in7_in <= \^p_1_in7_in\;
\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(0),
      Q => \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(4),
      Q => \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(5),
      Q => \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(6),
      Q => \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(7),
      Q => \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(8),
      Q => \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(9),
      Q => \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(10),
      Q => \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(11),
      Q => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(1),
      Q => \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(2),
      Q => \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(3),
      Q => \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eos_out,
      Q => \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eoc_out,
      Q => \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => jtagmodified_i,
      Q => \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => interrupt_status_i(1),
      Q => \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => interrupt_status_i(0),
      Q => \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1\,
      S => reset2ip_reset
    );
\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2_reg\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1\,
      Q => \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2\,
      S => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(0),
      I4 => \^gen_ip_irpt_status_reg[0].gen_reg_status.ip_irpt_status_reg_reg[0]_0\,
      O => \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0\,
      Q => \^gen_ip_irpt_status_reg[0].gen_reg_status.ip_irpt_status_reg_reg[0]_0\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(10),
      I4 => \^p_1_in19_in\,
      O => \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0\,
      Q => \^p_1_in19_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(11),
      I4 => \^p_1_in16_in\,
      O => \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0\,
      Q => \^p_1_in16_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(12),
      I4 => \^p_1_in13_in\,
      O => \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0\,
      Q => \^p_1_in13_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(13),
      I4 => \^p_1_in10_in\,
      O => \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0\,
      Q => \^p_1_in10_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(14),
      I4 => \^p_1_in7_in\,
      O => \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0\,
      Q => \^p_1_in7_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(15),
      I4 => \^p_1_in4_in\,
      O => \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0\,
      Q => \^p_1_in4_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(16),
      I4 => \^p_1_in1_in\,
      O => \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0\,
      Q => \^p_1_in1_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(17),
      I4 => \^p_1_in\,
      O => \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0\,
      Q => \^p_1_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(1),
      I4 => \^p_1_in46_in\,
      O => \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0\,
      Q => \^p_1_in46_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(2),
      I4 => \^p_1_in43_in\,
      O => \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0\,
      Q => \^p_1_in43_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(3),
      I4 => \^p_1_in40_in\,
      O => \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0\,
      Q => \^p_1_in40_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(4),
      I4 => \^p_1_in37_in\,
      O => \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0\,
      Q => \^p_1_in37_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(5),
      I4 => \^p_1_in34_in\,
      O => \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0\,
      Q => \^p_1_in34_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(6),
      I4 => \^p_1_in31_in\,
      O => \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0\,
      Q => \^p_1_in31_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(7),
      I4 => \^p_1_in28_in\,
      O => \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0\,
      Q => \^p_1_in28_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(8),
      I4 => \^p_1_in25_in\,
      O => \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0\,
      Q => \^p_1_in25_in\,
      R => reset2ip_reset
    );
\GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FFBA30"
    )
        port map (
      I0 => \ip_irpt_status_reg1__0\,
      I1 => \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2\,
      I2 => \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1\,
      I3 => s_axi_wdata(9),
      I4 => \^p_1_in22_in\,
      O => \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0\
    );
\GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0\,
      Q => \^p_1_in22_in\,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_wrack_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => dummy_local_reg_wrack,
      I1 => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\,
      I2 => intr_ip2bus_wrack,
      I3 => wrack,
      I4 => rst_ip2bus_error,
      I5 => \INTR_CTRLR_GEN_I.ip2bus_wrack_reg\,
      O => ip2bus_wrack_int1
    );
Intr2Bus_RdAck_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Intr2Bus_RdAck0,
      Q => intr_ip2bus_rdack,
      R => reset2ip_reset
    );
Intr2Bus_WrAck_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => interrupt_wrce_strb,
      Q => intr_ip2bus_wrack,
      R => reset2ip_reset
    );
ip2intc_irpt_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => ip2intc_irpt_INST_0_i_1_n_0,
      I1 => ip2intc_irpt_INST_0_i_2_n_0,
      I2 => ip2intc_irpt_INST_0_i_3_n_0,
      I3 => ip2intc_irpt_INST_0_i_4_n_0,
      I4 => ip2intc_irpt_INST_0_i_5_n_0,
      I5 => \^ipif_glbl_irpt_enable_reg\,
      O => ip2intc_irpt
    );
ip2intc_irpt_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^p_1_in28_in\,
      I2 => \^q\(8),
      I3 => \^p_1_in25_in\,
      O => ip2intc_irpt_INST_0_i_1_n_0
    );
ip2intc_irpt_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \^p_1_in19_in\,
      I1 => \^q\(10),
      I2 => \^p_1_in22_in\,
      I3 => \^q\(9),
      I4 => ip2intc_irpt_INST_0_i_6_n_0,
      O => ip2intc_irpt_INST_0_i_2_n_0
    );
ip2intc_irpt_INST_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \^p_1_in7_in\,
      I1 => \^q\(14),
      I2 => \^p_1_in10_in\,
      I3 => \^q\(13),
      I4 => ip2intc_irpt_INST_0_i_7_n_0,
      O => ip2intc_irpt_INST_0_i_3_n_0
    );
ip2intc_irpt_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(17),
      I1 => \^p_1_in\,
      I2 => \^q\(0),
      I3 => \^gen_ip_irpt_status_reg[0].gen_reg_status.ip_irpt_status_reg_reg[0]_0\,
      O => ip2intc_irpt_INST_0_i_4_n_0
    );
ip2intc_irpt_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => ip2intc_irpt_INST_0_i_8_n_0,
      I1 => \^q\(3),
      I2 => \^p_1_in40_in\,
      I3 => \^q\(4),
      I4 => \^p_1_in37_in\,
      I5 => ip2intc_irpt_INST_0_i_9_n_0,
      O => ip2intc_irpt_INST_0_i_5_n_0
    );
ip2intc_irpt_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(11),
      I1 => \^p_1_in16_in\,
      I2 => \^q\(12),
      I3 => \^p_1_in13_in\,
      O => ip2intc_irpt_INST_0_i_6_n_0
    );
ip2intc_irpt_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(15),
      I1 => \^p_1_in4_in\,
      I2 => \^q\(16),
      I3 => \^p_1_in1_in\,
      O => ip2intc_irpt_INST_0_i_7_n_0
    );
ip2intc_irpt_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^p_1_in34_in\,
      I2 => \^q\(6),
      I3 => \^p_1_in31_in\,
      O => ip2intc_irpt_INST_0_i_8_n_0
    );
ip2intc_irpt_INST_0_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^p_1_in46_in\,
      I2 => \^q\(2),
      I3 => \^p_1_in43_in\,
      O => ip2intc_irpt_INST_0_i_9_n_0
    );
\ip_irpt_enable_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(0),
      Q => \^q\(0),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(10),
      Q => \^q\(10),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(11),
      Q => \^q\(11),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(12),
      Q => \^q\(12),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(13),
      Q => \^q\(13),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(14),
      Q => \^q\(14),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(15),
      Q => \^q\(15),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(16),
      Q => \^q\(16),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(17),
      Q => \^q\(17),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(1),
      Q => \^q\(1),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(2),
      Q => \^q\(2),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(3),
      Q => \^q\(3),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(4),
      Q => \^q\(4),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(5),
      Q => \^q\(5),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(6),
      Q => \^q\(6),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(7),
      Q => \^q\(7),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(8),
      Q => \^q\(8),
      R => reset2ip_reset
    );
\ip_irpt_enable_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      D => s_axi_wdata(9),
      Q => \^q\(9),
      R => reset2ip_reset
    );
ipif_glbl_irpt_enable_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => ipif_glbl_irpt_enable_reg_reg_0,
      Q => \^ipif_glbl_irpt_enable_reg\,
      R => reset2ip_reset
    );
irpt_rdack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => irpt_rdack,
      Q => irpt_rdack_d1,
      R => reset2ip_reset
    );
irpt_wrack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => irpt_wrack,
      Q => irpt_wrack_d1,
      R => reset2ip_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_soft_reset is
  port (
    sw_rst_cond_d1 : out STD_LOGIC;
    wrack : out STD_LOGIC;
    \RESET_FLOPS[15].RST_FLOPS_0\ : out STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    sw_rst_cond : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    reset_trig0 : in STD_LOGIC
  );
end system_pl_sysmon_0_soft_reset;

architecture STRUCTURE of system_pl_sysmon_0_soft_reset is
  signal FF_WRACK_i_1_n_0 : STD_LOGIC;
  signal \RESET_FLOPS[10].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[11].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[12].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[13].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[14].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \^reset_flops[15].rst_flops_0\ : STD_LOGIC;
  signal \RESET_FLOPS[15].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[1].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[2].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[3].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[4].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[5].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[6].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[7].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[8].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal \RESET_FLOPS[9].RST_FLOPS_i_1_n_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal flop_q_chain_1 : STD_LOGIC;
  signal flop_q_chain_10 : STD_LOGIC;
  signal flop_q_chain_11 : STD_LOGIC;
  signal flop_q_chain_12 : STD_LOGIC;
  signal flop_q_chain_13 : STD_LOGIC;
  signal flop_q_chain_14 : STD_LOGIC;
  signal flop_q_chain_15 : STD_LOGIC;
  signal flop_q_chain_2 : STD_LOGIC;
  signal flop_q_chain_3 : STD_LOGIC;
  signal flop_q_chain_4 : STD_LOGIC;
  signal flop_q_chain_5 : STD_LOGIC;
  signal flop_q_chain_6 : STD_LOGIC;
  signal flop_q_chain_7 : STD_LOGIC;
  signal flop_q_chain_8 : STD_LOGIC;
  signal flop_q_chain_9 : STD_LOGIC;
  attribute IS_CE_INVERTED : string;
  attribute IS_CE_INVERTED of FF_WRACK : label is "1'b0";
  attribute IS_S_INVERTED : string;
  attribute IS_S_INVERTED of FF_WRACK : label is "1'b0";
  attribute box_type : string;
  attribute box_type of FF_WRACK : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of FF_WRACK_i_1 : label is "soft_lutpair45";
  attribute IS_CE_INVERTED of \RESET_FLOPS[0].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[0].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[0].RST_FLOPS\ : label is "PRIMITIVE";
  attribute IS_CE_INVERTED of \RESET_FLOPS[10].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[10].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[10].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[10].RST_FLOPS_i_1\ : label is "soft_lutpair42";
  attribute IS_CE_INVERTED of \RESET_FLOPS[11].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[11].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[11].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[11].RST_FLOPS_i_1\ : label is "soft_lutpair43";
  attribute IS_CE_INVERTED of \RESET_FLOPS[12].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[12].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[12].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[12].RST_FLOPS_i_1\ : label is "soft_lutpair43";
  attribute IS_CE_INVERTED of \RESET_FLOPS[13].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[13].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[13].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[13].RST_FLOPS_i_1\ : label is "soft_lutpair44";
  attribute IS_CE_INVERTED of \RESET_FLOPS[14].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[14].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[14].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[14].RST_FLOPS_i_1\ : label is "soft_lutpair44";
  attribute IS_CE_INVERTED of \RESET_FLOPS[15].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[15].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[15].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[15].RST_FLOPS_i_1\ : label is "soft_lutpair45";
  attribute IS_CE_INVERTED of \RESET_FLOPS[1].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[1].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[1].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[1].RST_FLOPS_i_1\ : label is "soft_lutpair38";
  attribute IS_CE_INVERTED of \RESET_FLOPS[2].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[2].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[2].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[2].RST_FLOPS_i_1\ : label is "soft_lutpair38";
  attribute IS_CE_INVERTED of \RESET_FLOPS[3].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[3].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[3].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[3].RST_FLOPS_i_1\ : label is "soft_lutpair39";
  attribute IS_CE_INVERTED of \RESET_FLOPS[4].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[4].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[4].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[4].RST_FLOPS_i_1\ : label is "soft_lutpair39";
  attribute IS_CE_INVERTED of \RESET_FLOPS[5].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[5].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[5].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[5].RST_FLOPS_i_1\ : label is "soft_lutpair40";
  attribute IS_CE_INVERTED of \RESET_FLOPS[6].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[6].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[6].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[6].RST_FLOPS_i_1\ : label is "soft_lutpair40";
  attribute IS_CE_INVERTED of \RESET_FLOPS[7].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[7].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[7].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[7].RST_FLOPS_i_1\ : label is "soft_lutpair41";
  attribute IS_CE_INVERTED of \RESET_FLOPS[8].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[8].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[8].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[8].RST_FLOPS_i_1\ : label is "soft_lutpair41";
  attribute IS_CE_INVERTED of \RESET_FLOPS[9].RST_FLOPS\ : label is "1'b0";
  attribute IS_S_INVERTED of \RESET_FLOPS[9].RST_FLOPS\ : label is "1'b0";
  attribute box_type of \RESET_FLOPS[9].RST_FLOPS\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \RESET_FLOPS[9].RST_FLOPS_i_1\ : label is "soft_lutpair42";
begin
  \RESET_FLOPS[15].RST_FLOPS_0\ <= \^reset_flops[15].rst_flops_0\;
FF_WRACK: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => FF_WRACK_i_1_n_0,
      Q => wrack,
      R => bus2ip_reset_active_high
    );
FF_WRACK_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^reset_flops[15].rst_flops_0\,
      I1 => flop_q_chain_1,
      O => FF_WRACK_i_1_n_0
    );
\RESET_FLOPS[0].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => S,
      Q => flop_q_chain_15,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[10].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[10].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_5,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[10].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_6,
      O => \RESET_FLOPS[10].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[11].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[11].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_4,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[11].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_5,
      O => \RESET_FLOPS[11].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[12].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[12].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_3,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[12].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_4,
      O => \RESET_FLOPS[12].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[13].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[13].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_2,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[13].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_3,
      O => \RESET_FLOPS[13].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[14].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[14].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_1,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[14].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_2,
      O => \RESET_FLOPS[14].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[15].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[15].RST_FLOPS_i_1_n_0\,
      Q => \^reset_flops[15].rst_flops_0\,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[15].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_1,
      O => \RESET_FLOPS[15].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[1].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[1].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_14,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[1].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_15,
      O => \RESET_FLOPS[1].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[2].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[2].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_13,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[2].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_14,
      O => \RESET_FLOPS[2].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[3].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[3].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_12,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[3].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_13,
      O => \RESET_FLOPS[3].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[4].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[4].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_11,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[4].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_12,
      O => \RESET_FLOPS[4].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[5].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[5].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_10,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[5].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_11,
      O => \RESET_FLOPS[5].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[6].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[6].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_9,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[6].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_10,
      O => \RESET_FLOPS[6].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[7].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[7].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_8,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[7].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_9,
      O => \RESET_FLOPS[7].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[8].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[8].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_7,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[8].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_8,
      O => \RESET_FLOPS[8].RST_FLOPS_i_1_n_0\
    );
\RESET_FLOPS[9].RST_FLOPS\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \RESET_FLOPS[9].RST_FLOPS_i_1_n_0\,
      Q => flop_q_chain_6,
      R => bus2ip_reset_active_high
    );
\RESET_FLOPS[9].RST_FLOPS_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => S,
      I1 => flop_q_chain_7,
      O => \RESET_FLOPS[9].RST_FLOPS_i_1_n_0\
    );
reset_trig_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => reset_trig0,
      Q => S,
      R => bus2ip_reset_active_high
    );
sw_rst_cond_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => sw_rst_cond,
      Q => sw_rst_cond_d1,
      R => bus2ip_reset_active_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_xadc_core_drp is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    jtagmodified_i : out STD_LOGIC;
    inst_sysmon_0 : out STD_LOGIC_VECTOR ( 12 downto 0 );
    local_reg_wrack_d1 : out STD_LOGIC;
    local_reg_rdack_d1 : out STD_LOGIC;
    status_reg_rdack_d1 : out STD_LOGIC;
    jtagmodified_d1 : out STD_LOGIC;
    hard_macro_rst_reg : out STD_LOGIC;
    ip2bus_error_int1 : out STD_LOGIC;
    drdy_wr_ack_i_reg_0 : out STD_LOGIC;
    ip2bus_rdack_int1 : out STD_LOGIC;
    interrupt_status_i : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \do_reg_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \alarm_reg_reg[14]_0\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    \status_reg_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    vauxp0 : in STD_LOGIC;
    vauxn0 : in STD_LOGIC;
    vauxp1 : in STD_LOGIC;
    vauxn1 : in STD_LOGIC;
    vauxp2 : in STD_LOGIC;
    vauxn2 : in STD_LOGIC;
    vauxp3 : in STD_LOGIC;
    vauxn3 : in STD_LOGIC;
    vauxp4 : in STD_LOGIC;
    vauxn4 : in STD_LOGIC;
    vauxp5 : in STD_LOGIC;
    vauxn5 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp8 : in STD_LOGIC;
    vauxn8 : in STD_LOGIC;
    vauxp9 : in STD_LOGIC;
    vauxn9 : in STD_LOGIC;
    vauxp10 : in STD_LOGIC;
    vauxn10 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    DWE : in STD_LOGIC;
    RESET : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    reset2ip_reset : in STD_LOGIC;
    convst_rst_wrce_or_reduce : in STD_LOGIC;
    local_reg_wrack0 : in STD_LOGIC;
    bus2ip_wrce : in STD_LOGIC_VECTOR ( 0 to 0 );
    local_rdce_or_reduce : in STD_LOGIC;
    local_reg_rdack0 : in STD_LOGIC;
    bus2ip_rdce : in STD_LOGIC_VECTOR ( 1 downto 0 );
    status_reg_rdack0 : in STD_LOGIC;
    hard_macro_rst_reg_reg_0 : in STD_LOGIC;
    drdy_wr_ack_i_reg_1 : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    and_reduce_be : in STD_LOGIC;
    rst_ip2bus_error : in STD_LOGIC;
    dummy_local_reg_rdack : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\ : in STD_LOGIC;
    rst_ip2bus_rdack : in STD_LOGIC;
    intr_ip2bus_rdack : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    jtagmodified_d1_reg_0 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end system_pl_sysmon_0_xadc_core_drp;

architecture STRUCTURE of system_pl_sysmon_0_xadc_core_drp is
  signal \^d\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal DEN : STD_LOGIC;
  signal VAUXN : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal VAUXP : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal alarm_0_d1 : STD_LOGIC;
  signal daddr_C_master_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of daddr_C_master_reg : signal is std.standard.true;
  signal daddr_C_master_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH of daddr_C_master_reg2 : signal is std.standard.true;
  signal daddr_C_slave0_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH of daddr_C_slave0_reg : signal is std.standard.true;
  signal daddr_C_slave0_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH of daddr_C_slave0_reg2 : signal is std.standard.true;
  signal daddr_C_slave1_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH of daddr_C_slave1_reg : signal is std.standard.true;
  signal daddr_C_slave1_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute DONT_TOUCH of daddr_C_slave1_reg2 : signal is std.standard.true;
  signal den_d1 : STD_LOGIC;
  signal di_C_master_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_master_reg : signal is std.standard.true;
  signal di_C_master_reg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_master_reg2 : signal is std.standard.true;
  signal di_C_slave0_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_slave0_reg : signal is std.standard.true;
  signal di_C_slave0_reg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_slave0_reg2 : signal is std.standard.true;
  signal di_C_slave1_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_slave1_reg : signal is std.standard.true;
  signal di_C_slave1_reg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH of di_C_slave1_reg2 : signal is std.standard.true;
  signal do_C : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal drdy_C : STD_LOGIC;
  signal drdy_rd_ack_i : STD_LOGIC;
  signal drdy_rd_ack_i_d1 : STD_LOGIC;
  signal drdy_rd_ack_i_d2 : STD_LOGIC;
  signal drdy_rd_ack_i_i_1_n_0 : STD_LOGIC;
  signal drdy_wr_ack_i : STD_LOGIC;
  signal drdy_wr_ack_i_d1 : STD_LOGIC;
  signal drdy_wr_ack_i_d2 : STD_LOGIC;
  signal drdy_wr_ack_i_i_1_n_0 : STD_LOGIC;
  signal dwe_C_master_reg : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_master_reg : signal is std.standard.true;
  signal dwe_C_master_reg2 : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_master_reg2 : signal is std.standard.true;
  signal dwe_C_slave0_reg : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_slave0_reg : signal is std.standard.true;
  signal dwe_C_slave0_reg2 : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_slave0_reg2 : signal is std.standard.true;
  signal dwe_C_slave1_reg : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_slave1_reg : signal is std.standard.true;
  signal dwe_C_slave1_reg2 : STD_LOGIC;
  attribute DONT_TOUCH of dwe_C_slave1_reg2 : signal is std.standard.true;
  signal eoc_d1 : STD_LOGIC;
  signal eoc_d1_i_1_n_0 : STD_LOGIC;
  signal \^eoc_out\ : STD_LOGIC;
  signal eos_d1 : STD_LOGIC;
  signal eos_d1_i_1_n_0 : STD_LOGIC;
  signal \^eos_out\ : STD_LOGIC;
  signal \^inst_sysmon_0\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal inst_sysmon_n_27 : STD_LOGIC;
  signal inst_sysmon_n_28 : STD_LOGIC;
  signal inst_sysmon_n_29 : STD_LOGIC;
  signal inst_sysmon_n_30 : STD_LOGIC;
  signal jtagbusy_i : STD_LOGIC;
  signal \^jtagmodified_d1\ : STD_LOGIC;
  signal jtagmodified_d1_i_1_n_0 : STD_LOGIC;
  signal \^jtagmodified_i\ : STD_LOGIC;
  signal local_reg_rdack : STD_LOGIC;
  signal local_reg_wrack : STD_LOGIC;
  signal ot_d1 : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_out : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \status_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal status_reg_rdack : STD_LOGIC;
  signal xadc_ip2bus_rdack : STD_LOGIC;
  signal NLW_inst_sysmon_I2C_SCLK_TS_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_sysmon_I2C_SDA_TS_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_sysmon_SMBALERT_TS_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_sysmon_ADC_DATA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_inst_sysmon_MUXADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_error_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_error_i_4\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_wrack_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of den_d1_i_1 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of eoc_d1_i_1 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of eos_d1_i_1 : label is "soft_lutpair36";
  attribute box_type : string;
  attribute box_type of ibuf_an_vauxn0 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn1 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn10 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn2 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn3 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn4 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn5 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn6 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn7 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn8 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxn9 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp0 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp1 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp10 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp2 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp3 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp4 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp5 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp6 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp7 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp8 : label is "PRIMITIVE";
  attribute box_type of ibuf_an_vauxp9 : label is "PRIMITIVE";
  attribute box_type of inst_sysmon : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of inst_sysmon_i_1 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \status_reg[7]_i_1\ : label is "soft_lutpair36";
begin
  D(7 downto 0) <= \^d\(7 downto 0);
  eoc_out <= \^eoc_out\;
  eos_out <= \^eos_out\;
  inst_sysmon_0(12 downto 0) <= \^inst_sysmon_0\(12 downto 0);
  jtagmodified_d1 <= \^jtagmodified_d1\;
  jtagmodified_i <= \^jtagmodified_i\;
\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ot_d1,
      I1 => \^inst_sysmon_0\(0),
      O => interrupt_status_i(1)
    );
\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => alarm_0_d1,
      I1 => \^inst_sysmon_0\(1),
      O => interrupt_status_i(0)
    );
\INTR_CTRLR_GEN_I.ip2bus_error_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5554"
    )
        port map (
      I0 => and_reduce_be,
      I1 => local_reg_wrack,
      I2 => drdy_wr_ack_i,
      I3 => xadc_ip2bus_rdack,
      I4 => rst_ip2bus_error,
      O => ip2bus_error_int1
    );
\INTR_CTRLR_GEN_I.ip2bus_error_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => local_reg_rdack,
      I1 => status_reg_rdack,
      I2 => drdy_rd_ack_i,
      O => xadc_ip2bus_rdack
    );
\INTR_CTRLR_GEN_I.ip2bus_rdack_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => xadc_ip2bus_rdack,
      I1 => dummy_local_reg_rdack,
      I2 => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\,
      I3 => rst_ip2bus_rdack,
      I4 => intr_ip2bus_rdack,
      O => ip2bus_rdack_int1
    );
\INTR_CTRLR_GEN_I.ip2bus_wrack_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => drdy_wr_ack_i,
      I1 => local_reg_wrack,
      O => drdy_wr_ack_i_reg_0
    );
alarm_0_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(1),
      Q => alarm_0_d1,
      R => '0'
    );
\alarm_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(0),
      Q => \alarm_reg_reg[14]_0\(0),
      R => reset2ip_reset
    );
\alarm_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(10),
      Q => \alarm_reg_reg[14]_0\(10),
      R => reset2ip_reset
    );
\alarm_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(11),
      Q => \alarm_reg_reg[14]_0\(11),
      R => reset2ip_reset
    );
\alarm_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(12),
      Q => \alarm_reg_reg[14]_0\(12),
      R => reset2ip_reset
    );
\alarm_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => inst_sysmon_n_30,
      Q => \alarm_reg_reg[14]_0\(13),
      R => reset2ip_reset
    );
\alarm_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => inst_sysmon_n_29,
      Q => \alarm_reg_reg[14]_0\(14),
      R => reset2ip_reset
    );
\alarm_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(1),
      Q => \alarm_reg_reg[14]_0\(1),
      R => reset2ip_reset
    );
\alarm_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(2),
      Q => \alarm_reg_reg[14]_0\(2),
      R => reset2ip_reset
    );
\alarm_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(3),
      Q => \alarm_reg_reg[14]_0\(3),
      R => reset2ip_reset
    );
\alarm_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(4),
      Q => \alarm_reg_reg[14]_0\(4),
      R => reset2ip_reset
    );
\alarm_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(5),
      Q => \alarm_reg_reg[14]_0\(5),
      R => reset2ip_reset
    );
\alarm_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(6),
      Q => \alarm_reg_reg[14]_0\(6),
      R => reset2ip_reset
    );
\alarm_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(7),
      Q => \alarm_reg_reg[14]_0\(7),
      R => reset2ip_reset
    );
\alarm_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(8),
      Q => \alarm_reg_reg[14]_0\(8),
      R => reset2ip_reset
    );
\alarm_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(9),
      Q => \alarm_reg_reg[14]_0\(9),
      R => reset2ip_reset
    );
den_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \^d\(7),
      I1 => drdy_wr_ack_i_reg_1,
      O => p_4_in
    );
den_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_4_in,
      Q => den_d1,
      R => '0'
    );
\do_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(0),
      Q => \do_reg_reg[15]_0\(0),
      R => SR(0)
    );
\do_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(10),
      Q => \do_reg_reg[15]_0\(10),
      R => SR(0)
    );
\do_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(11),
      Q => \do_reg_reg[15]_0\(11),
      R => SR(0)
    );
\do_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(12),
      Q => \do_reg_reg[15]_0\(12),
      R => SR(0)
    );
\do_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(13),
      Q => \do_reg_reg[15]_0\(13),
      R => SR(0)
    );
\do_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(14),
      Q => \do_reg_reg[15]_0\(14),
      R => SR(0)
    );
\do_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(15),
      Q => \do_reg_reg[15]_0\(15),
      R => SR(0)
    );
\do_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(1),
      Q => \do_reg_reg[15]_0\(1),
      R => SR(0)
    );
\do_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(2),
      Q => \do_reg_reg[15]_0\(2),
      R => SR(0)
    );
\do_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(3),
      Q => \do_reg_reg[15]_0\(3),
      R => SR(0)
    );
\do_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(4),
      Q => \do_reg_reg[15]_0\(4),
      R => SR(0)
    );
\do_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(5),
      Q => \do_reg_reg[15]_0\(5),
      R => SR(0)
    );
\do_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(6),
      Q => \do_reg_reg[15]_0\(6),
      R => SR(0)
    );
\do_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(7),
      Q => \do_reg_reg[15]_0\(7),
      R => SR(0)
    );
\do_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(8),
      Q => \do_reg_reg[15]_0\(8),
      R => SR(0)
    );
\do_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_C(9),
      Q => \do_reg_reg[15]_0\(9),
      R => SR(0)
    );
drdy_rd_ack_i_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^d\(7),
      D => bus2ip_rdce(0),
      Q => drdy_rd_ack_i_d1,
      R => reset2ip_reset
    );
drdy_rd_ack_i_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^d\(7),
      D => drdy_rd_ack_i_d1,
      Q => drdy_rd_ack_i_d2,
      R => reset2ip_reset
    );
drdy_rd_ack_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22222222F0000000"
    )
        port map (
      I0 => drdy_rd_ack_i_d1,
      I1 => drdy_rd_ack_i_d2,
      I2 => drdy_wr_ack_i_reg_1,
      I3 => Bus_RNW_reg,
      I4 => drdy_C,
      I5 => \^d\(7),
      O => drdy_rd_ack_i_i_1_n_0
    );
drdy_rd_ack_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => drdy_rd_ack_i_i_1_n_0,
      Q => drdy_rd_ack_i,
      R => reset2ip_reset
    );
drdy_wr_ack_i_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^d\(7),
      D => bus2ip_wrce(0),
      Q => drdy_wr_ack_i_d1,
      R => reset2ip_reset
    );
drdy_wr_ack_i_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^d\(7),
      D => drdy_wr_ack_i_d1,
      Q => drdy_wr_ack_i_d2,
      R => reset2ip_reset
    );
drdy_wr_ack_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222200F00000"
    )
        port map (
      I0 => drdy_wr_ack_i_d1,
      I1 => drdy_wr_ack_i_d2,
      I2 => drdy_wr_ack_i_reg_1,
      I3 => Bus_RNW_reg,
      I4 => drdy_C,
      I5 => \^d\(7),
      O => drdy_wr_ack_i_i_1_n_0
    );
drdy_wr_ack_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => drdy_wr_ack_i_i_1_n_0,
      Q => drdy_wr_ack_i,
      R => reset2ip_reset
    );
eoc_d1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^eoc_out\,
      I1 => status_reg_rdack,
      I2 => eoc_d1,
      O => eoc_d1_i_1_n_0
    );
eoc_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eoc_d1_i_1_n_0,
      Q => eoc_d1,
      R => reset2ip_reset
    );
eos_d1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^eos_out\,
      I1 => status_reg_rdack,
      I2 => eos_d1,
      O => eos_d1_i_1_n_0
    );
eos_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eos_d1_i_1_n_0,
      Q => eos_d1,
      R => reset2ip_reset
    );
hard_macro_rst_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => hard_macro_rst_reg_reg_0,
      Q => hard_macro_rst_reg,
      R => reset2ip_reset
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(7)
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(6)
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(13)
    );
i_100: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(7)
    );
i_101: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(6)
    );
i_102: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(5)
    );
i_103: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(4)
    );
i_104: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(3)
    );
i_105: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(2)
    );
i_106: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(1)
    );
i_107: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg2(0)
    );
i_108: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(15)
    );
i_109: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(14)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(12)
    );
i_110: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(13)
    );
i_111: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(12)
    );
i_112: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(11)
    );
i_113: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(10)
    );
i_114: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(9)
    );
i_115: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(8)
    );
i_116: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(7)
    );
i_117: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(6)
    );
i_118: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(5)
    );
i_119: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(4)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(11)
    );
i_120: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(3)
    );
i_121: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(2)
    );
i_122: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(1)
    );
i_123: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg2(0)
    );
i_124: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_slave0_reg2
    );
i_125: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(7)
    );
i_126: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(6)
    );
i_127: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(5)
    );
i_128: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(4)
    );
i_129: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(3)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(10)
    );
i_130: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(2)
    );
i_131: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(1)
    );
i_132: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg2(0)
    );
i_133: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(15)
    );
i_134: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(14)
    );
i_135: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(13)
    );
i_136: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(12)
    );
i_137: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(11)
    );
i_138: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(10)
    );
i_139: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(9)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(9)
    );
i_140: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(8)
    );
i_141: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(7)
    );
i_142: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(6)
    );
i_143: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(5)
    );
i_144: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(4)
    );
i_145: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(3)
    );
i_146: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(2)
    );
i_147: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(1)
    );
i_148: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg2(0)
    );
i_149: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_slave1_reg2
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(8)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(7)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(6)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(5)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(4)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(5)
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(3)
    );
i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(2)
    );
i_22: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(1)
    );
i_23: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(0)
    );
i_24: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_master_reg
    );
i_25: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(7)
    );
i_26: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(6)
    );
i_27: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(5)
    );
i_28: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(4)
    );
i_29: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(3)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(4)
    );
i_30: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(2)
    );
i_31: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(1)
    );
i_32: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave0_reg(0)
    );
i_33: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(15)
    );
i_34: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(14)
    );
i_35: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(13)
    );
i_36: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(12)
    );
i_37: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(11)
    );
i_38: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(10)
    );
i_39: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(9)
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(3)
    );
i_40: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(8)
    );
i_41: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(7)
    );
i_42: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(6)
    );
i_43: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(5)
    );
i_44: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(4)
    );
i_45: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(3)
    );
i_46: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(2)
    );
i_47: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(1)
    );
i_48: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave0_reg(0)
    );
i_49: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_slave0_reg
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(2)
    );
i_50: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(7)
    );
i_51: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(6)
    );
i_52: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(5)
    );
i_53: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(4)
    );
i_54: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(3)
    );
i_55: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(2)
    );
i_56: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(1)
    );
i_57: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_slave1_reg(0)
    );
i_58: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(15)
    );
i_59: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(14)
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(1)
    );
i_60: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(13)
    );
i_61: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(12)
    );
i_62: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(11)
    );
i_63: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(10)
    );
i_64: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(9)
    );
i_65: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(8)
    );
i_66: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(7)
    );
i_67: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(6)
    );
i_68: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(5)
    );
i_69: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(4)
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg(0)
    );
i_70: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(3)
    );
i_71: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(2)
    );
i_72: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(1)
    );
i_73: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_slave1_reg(0)
    );
i_74: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_slave1_reg
    );
i_75: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(7)
    );
i_76: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(6)
    );
i_77: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(5)
    );
i_78: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(4)
    );
i_79: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(3)
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(15)
    );
i_80: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(2)
    );
i_81: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(1)
    );
i_82: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => daddr_C_master_reg2(0)
    );
i_83: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(15)
    );
i_84: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(14)
    );
i_85: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(13)
    );
i_86: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(12)
    );
i_87: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(11)
    );
i_88: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(10)
    );
i_89: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(9)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg(14)
    );
i_90: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(8)
    );
i_91: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(7)
    );
i_92: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(6)
    );
i_93: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(5)
    );
i_94: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(4)
    );
i_95: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(3)
    );
i_96: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(2)
    );
i_97: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(1)
    );
i_98: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => di_C_master_reg2(0)
    );
i_99: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => dwe_C_master_reg2
    );
ibuf_an_vauxn0: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn0,
      O => VAUXN(0)
    );
ibuf_an_vauxn1: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn1,
      O => VAUXN(1)
    );
ibuf_an_vauxn10: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn10,
      O => VAUXN(10)
    );
ibuf_an_vauxn2: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn2,
      O => VAUXN(2)
    );
ibuf_an_vauxn3: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn3,
      O => VAUXN(3)
    );
ibuf_an_vauxn4: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn4,
      O => VAUXN(4)
    );
ibuf_an_vauxn5: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn5,
      O => VAUXN(5)
    );
ibuf_an_vauxn6: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn6,
      O => VAUXN(6)
    );
ibuf_an_vauxn7: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn7,
      O => VAUXN(7)
    );
ibuf_an_vauxn8: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn8,
      O => VAUXN(8)
    );
ibuf_an_vauxn9: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxn9,
      O => VAUXN(9)
    );
ibuf_an_vauxp0: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp0,
      O => VAUXP(0)
    );
ibuf_an_vauxp1: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp1,
      O => VAUXP(1)
    );
ibuf_an_vauxp10: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp10,
      O => VAUXP(10)
    );
ibuf_an_vauxp2: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp2,
      O => VAUXP(2)
    );
ibuf_an_vauxp3: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp3,
      O => VAUXP(3)
    );
ibuf_an_vauxp4: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp4,
      O => VAUXP(4)
    );
ibuf_an_vauxp5: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp5,
      O => VAUXP(5)
    );
ibuf_an_vauxp6: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp6,
      O => VAUXP(6)
    );
ibuf_an_vauxp7: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp7,
      O => VAUXP(7)
    );
ibuf_an_vauxp8: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp8,
      O => VAUXP(8)
    );
ibuf_an_vauxp9: unisim.vcomponents.IBUF_ANALOG
     port map (
      I => vauxp9,
      O => VAUXP(9)
    );
inst_sysmon: unisim.vcomponents.SYSMONE4
    generic map(
      COMMON_N_SOURCE => X"FFFF",
      INIT_40 => X"0000",
      INIT_41 => X"2F9E",
      INIT_42 => X"1400",
      INIT_43 => X"200F",
      INIT_44 => X"0002",
      INIT_45 => X"AECA",
      INIT_46 => X"0003",
      INIT_47 => X"0000",
      INIT_48 => X"0701",
      INIT_49 => X"07FF",
      INIT_4A => X"0000",
      INIT_4B => X"0000",
      INIT_4C => X"0000",
      INIT_4D => X"0000",
      INIT_4E => X"0000",
      INIT_4F => X"0000",
      INIT_50 => X"B794",
      INIT_51 => X"4E81",
      INIT_52 => X"A147",
      INIT_53 => X"CBA3",
      INIT_54 => X"AB02",
      INIT_55 => X"4963",
      INIT_56 => X"9555",
      INIT_57 => X"B00A",
      INIT_58 => X"4E81",
      INIT_59 => X"4963",
      INIT_5A => X"4963",
      INIT_5B => X"9A74",
      INIT_5C => X"4963",
      INIT_5D => X"451E",
      INIT_5E => X"451E",
      INIT_5F => X"91EB",
      INIT_60 => X"9A74",
      INIT_61 => X"339F",
      INIT_62 => X"9A74",
      INIT_63 => X"9A74",
      INIT_64 => X"0000",
      INIT_65 => X"0000",
      INIT_66 => X"0000",
      INIT_67 => X"0000",
      INIT_68 => X"98BF",
      INIT_69 => X"32C5",
      INIT_6A => X"98BF",
      INIT_6B => X"98BF",
      INIT_6C => X"0000",
      INIT_6D => X"0000",
      INIT_6E => X"0000",
      INIT_6F => X"0000",
      INIT_70 => X"0000",
      INIT_71 => X"0000",
      INIT_72 => X"0000",
      INIT_73 => X"0000",
      INIT_74 => X"0000",
      INIT_75 => X"0000",
      INIT_76 => X"0000",
      INIT_77 => X"0000",
      INIT_78 => X"0000",
      INIT_79 => X"0000",
      INIT_7A => X"0000",
      INIT_7B => X"0000",
      INIT_7C => X"0000",
      INIT_7D => X"0000",
      INIT_7E => X"0000",
      INIT_7F => X"0000",
      IS_CONVSTCLK_INVERTED => '0',
      IS_DCLK_INVERTED => '0',
      SIM_DEVICE => "ZYNQ_ULTRASCALE",
      SIM_MONITOR_FILE => "design.dat",
      SYSMON_VUSER0_BANK => 66,
      SYSMON_VUSER0_MONITOR => "VCCO",
      SYSMON_VUSER1_BANK => 26,
      SYSMON_VUSER1_MONITOR => "VCCO",
      SYSMON_VUSER2_BANK => 0,
      SYSMON_VUSER2_MONITOR => "NONE",
      SYSMON_VUSER3_BANK => 0,
      SYSMON_VUSER3_MONITOR => "NONE"
    )
        port map (
      ADC_DATA(15 downto 0) => NLW_inst_sysmon_ADC_DATA_UNCONNECTED(15 downto 0),
      ALM(15) => inst_sysmon_n_27,
      ALM(14) => inst_sysmon_n_28,
      ALM(13) => inst_sysmon_n_29,
      ALM(12) => inst_sysmon_n_30,
      ALM(11 downto 0) => \^inst_sysmon_0\(12 downto 1),
      BUSY => \^d\(6),
      CHANNEL(5 downto 0) => \^d\(5 downto 0),
      CONVST => '0',
      CONVSTCLK => '0',
      DADDR(7 downto 0) => Q(7 downto 0),
      DCLK => s_axi_aclk,
      DEN => DEN,
      DI(15 downto 0) => s_axi_wdata(15 downto 0),
      DO(15 downto 0) => do_C(15 downto 0),
      DRDY => drdy_C,
      DWE => DWE,
      EOC => \^eoc_out\,
      EOS => \^eos_out\,
      I2C_SCLK => '0',
      I2C_SCLK_TS => NLW_inst_sysmon_I2C_SCLK_TS_UNCONNECTED,
      I2C_SDA => '0',
      I2C_SDA_TS => NLW_inst_sysmon_I2C_SDA_TS_UNCONNECTED,
      JTAGBUSY => jtagbusy_i,
      JTAGLOCKED => \^d\(7),
      JTAGMODIFIED => \^jtagmodified_i\,
      MUXADDR(4 downto 0) => NLW_inst_sysmon_MUXADDR_UNCONNECTED(4 downto 0),
      OT => \^inst_sysmon_0\(0),
      RESET => RESET,
      SMBALERT_TS => NLW_inst_sysmon_SMBALERT_TS_UNCONNECTED,
      VAUXN(15 downto 11) => B"00000",
      VAUXN(10 downto 0) => VAUXN(10 downto 0),
      VAUXP(15 downto 11) => B"00000",
      VAUXP(10 downto 0) => VAUXP(10 downto 0),
      VN => '0',
      VP => '0'
    );
inst_sysmon_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => drdy_wr_ack_i_reg_1,
      I1 => \^d\(7),
      I2 => den_d1,
      O => DEN
    );
jtagmodified_d1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01010100"
    )
        port map (
      I0 => bus2ip_reset_active_high,
      I1 => jtagmodified_d1_reg_0,
      I2 => drdy_rd_ack_i,
      I3 => \^jtagmodified_d1\,
      I4 => \^jtagmodified_i\,
      O => jtagmodified_d1_i_1_n_0
    );
jtagmodified_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => jtagmodified_d1_i_1_n_0,
      Q => \^jtagmodified_d1\,
      R => '0'
    );
local_reg_rdack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => local_rdce_or_reduce,
      Q => local_reg_rdack_d1,
      R => reset2ip_reset
    );
local_reg_rdack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => local_reg_rdack0,
      Q => local_reg_rdack,
      R => reset2ip_reset
    );
local_reg_wrack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => convst_rst_wrce_or_reduce,
      Q => local_reg_wrack_d1,
      R => reset2ip_reset
    );
local_reg_wrack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => local_reg_wrack0,
      Q => local_reg_wrack,
      R => reset2ip_reset
    );
ot_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^inst_sysmon_0\(0),
      Q => ot_d1,
      R => '0'
    );
\status_reg[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^jtagmodified_d1\,
      I1 => \^jtagmodified_i\,
      O => \status_reg[10]_i_1_n_0\
    );
\status_reg[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => eoc_d1,
      I1 => \^eoc_out\,
      O => p_5_out(6)
    );
\status_reg[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => eos_d1,
      I1 => \^eos_out\,
      O => p_5_out(7)
    );
status_reg_rdack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rdce(1),
      Q => status_reg_rdack_d1,
      R => reset2ip_reset
    );
status_reg_rdack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => status_reg_rdack0,
      Q => status_reg_rdack,
      R => reset2ip_reset
    );
\status_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(0),
      Q => \status_reg_reg[11]_0\(0),
      R => reset2ip_reset
    );
\status_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \status_reg[10]_i_1_n_0\,
      Q => \status_reg_reg[11]_0\(10),
      R => reset2ip_reset
    );
\status_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => jtagbusy_i,
      Q => \status_reg_reg[11]_0\(11),
      R => reset2ip_reset
    );
\status_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(1),
      Q => \status_reg_reg[11]_0\(1),
      R => reset2ip_reset
    );
\status_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(2),
      Q => \status_reg_reg[11]_0\(2),
      R => reset2ip_reset
    );
\status_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(3),
      Q => \status_reg_reg[11]_0\(3),
      R => reset2ip_reset
    );
\status_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(4),
      Q => \status_reg_reg[11]_0\(4),
      R => reset2ip_reset
    );
\status_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(5),
      Q => \status_reg_reg[11]_0\(5),
      R => reset2ip_reset
    );
\status_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_5_out(6),
      Q => \status_reg_reg[11]_0\(6),
      R => reset2ip_reset
    );
\status_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_5_out(7),
      Q => \status_reg_reg[11]_0\(7),
      R => reset2ip_reset
    );
\status_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(6),
      Q => \status_reg_reg[11]_0\(8),
      R => reset2ip_reset
    );
\status_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^d\(7),
      Q => \status_reg_reg[11]_0\(9),
      R => reset2ip_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_slave_attachment is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\ : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    Bus_RNW_reg_reg : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    local_reg_wrack0 : out STD_LOGIC;
    convst_rst_wrce_or_reduce : out STD_LOGIC;
    DWE : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 0 to 0 );
    local_reg_rdack0 : out STD_LOGIC;
    local_rdce_or_reduce : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 18 downto 0 );
    status_reg_rdack0 : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 2 downto 0 );
    reset2ip_reset : out STD_LOGIC;
    rst_ip2bus_error : out STD_LOGIC;
    reset_trig0 : out STD_LOGIC;
    sw_rst_cond : out STD_LOGIC;
    and_reduce_be : out STD_LOGIC;
    Intr2Bus_RdAck0 : out STD_LOGIC;
    irpt_rdack : out STD_LOGIC;
    interrupt_wrce_strb : out STD_LOGIC;
    irpt_wrack : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ : out STD_LOGIC;
    dummy_local_reg_rdack0 : out STD_LOGIC;
    dummy_local_reg_rdack_d10 : out STD_LOGIC;
    dummy_local_reg_wrack0 : out STD_LOGIC;
    dummy_local_reg_wrack_d10 : out STD_LOGIC;
    rst_ip2bus_rdack0 : out STD_LOGIC;
    \ip_irpt_status_reg1__0\ : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    \s_axi_wdata[31]\ : out STD_LOGIC;
    RESET : out STD_LOGIC;
    rst_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 18 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    local_reg_wrack_d1 : in STD_LOGIC;
    jtaglocked_i : in STD_LOGIC;
    local_reg_rdack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    p_1_in46_in : in STD_LOGIC;
    p_1_in43_in : in STD_LOGIC;
    p_1_in40_in : in STD_LOGIC;
    p_1_in37_in : in STD_LOGIC;
    p_1_in34_in : in STD_LOGIC;
    p_1_in31_in : in STD_LOGIC;
    p_1_in28_in : in STD_LOGIC;
    p_1_in25_in : in STD_LOGIC;
    p_1_in22_in : in STD_LOGIC;
    p_1_in19_in : in STD_LOGIC;
    p_1_in16_in : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\ : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    p_1_in13_in : in STD_LOGIC;
    p_1_in10_in : in STD_LOGIC;
    p_1_in7_in : in STD_LOGIC;
    p_1_in4_in : in STD_LOGIC;
    p_1_in1_in : in STD_LOGIC;
    p_1_in_0 : in STD_LOGIC;
    jtagmodified_i : in STD_LOGIC;
    jtagmodified_d1 : in STD_LOGIC;
    status_reg_rdack_d1 : in STD_LOGIC;
    \do_reg_reg[15]\ : in STD_LOGIC;
    sw_rst_cond_d1 : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ipif_glbl_irpt_enable_reg : in STD_LOGIC;
    irpt_rdack_d1 : in STD_LOGIC;
    irpt_wrack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ : in STD_LOGIC;
    dummy_local_reg_rdack_d1 : in STD_LOGIC;
    dummy_local_reg_wrack_d1 : in STD_LOGIC;
    rst_ip2bus_rdack_d1 : in STD_LOGIC;
    ip2bus_rdack : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2bus_wrack : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    hard_macro_rst_reg : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    \s_axi_rdata_i_reg[31]_0\ : in STD_LOGIC_VECTOR ( 18 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
end system_pl_sysmon_0_slave_attachment;

architecture STRUCTURE of system_pl_sysmon_0_slave_attachment is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \SOFT_RESET_I/data_is_non_reset_match__3\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bus2ip_addr : STD_LOGIC_VECTOR ( 10 to 10 );
  signal \bus2ip_addr_i[10]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[10]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[8]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[9]_i_1_n_0\ : STD_LOGIC;
  signal bus2ip_be : STD_LOGIC_VECTOR ( 3 to 3 );
  signal bus2ip_rnw_i_reg_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal rst_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axi_bresp_i : STD_LOGIC;
  signal \s_axi_bresp_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal s_axi_bvalid_i_i_1_n_0 : STD_LOGIC;
  signal s_axi_rresp_i : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal s_axi_rvalid_i_i_1_n_0 : STD_LOGIC;
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
  signal start2 : STD_LOGIC;
  signal start2_i_1_n_0 : STD_LOGIC;
  signal \state1__2\ : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal timeout : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1\ : label is "soft_lutpair24";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_data_int[0]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_error_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \INTR_CTRLR_GEN_I.ip2bus_error_i_3\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[10]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[3]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[4]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[6]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[7]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[8]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[9]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \do_reg[15]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of start2_i_1 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair25";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  SR(0) <= \^sr\(0);
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_rvalid <= \^s_axi_rvalid\;
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF150015001500"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => \state1__2\,
      I5 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888F8888"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => ip2bus_rdack,
      I3 => timeout,
      I4 => s_axi_rresp_i,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800FFFF08000800"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_awvalid,
      I2 => s_axi_arvalid,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => \^s_axi_awready\,
      I5 => s_axi_bresp_i,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F888FFFFF888"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => s_axi_bresp_i,
      I2 => s_axi_rresp_i,
      I3 => \^s_axi_arready\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      I5 => \state1__2\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^s_axi_bvalid\,
      I2 => s_axi_rready,
      I3 => \^s_axi_rvalid\,
      O => \state1__2\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      S => \^sr\(0)
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => s_axi_rresp_i,
      R => \^sr\(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => s_axi_bresp_i,
      R => \^sr\(0)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\,
      R => \^sr\(0)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      O => plusOp(0)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      O => plusOp(1)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      O => plusOp(2)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\,
      O => plusOp(3)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\,
      I4 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4]\,
      O => plusOp(4)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      I4 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4]\,
      I5 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5]\,
      O => plusOp(5)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \state_reg_n_0_[0]\,
      I1 => \state_reg_n_0_[1]\,
      O => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5]\,
      I2 => timeout,
      O => plusOp(6)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4]\,
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      I4 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\,
      O => \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(0),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(1),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(2),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(3),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(4),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(5),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5]\,
      R => clear
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(6),
      Q => timeout,
      R => clear
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => bus2ip_rnw_i_reg_n_0,
      I1 => s_axi_wstrb(3),
      O => bus2ip_be(3)
    );
\INTR_CTRLR_GEN_I.ip2bus_error_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \do_reg_reg[15]\,
      O => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_error_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => s_axi_wstrb(0),
      I1 => s_axi_wstrb(1),
      I2 => s_axi_wstrb(2),
      I3 => s_axi_wstrb(3),
      I4 => bus2ip_rnw_i_reg_n_0,
      O => and_reduce_be
    );
I_DECODER: entity work.system_pl_sysmon_0_address_decoder
     port map (
      Bus_RNW_reg_reg_0 => Bus_RNW_reg_reg,
      D(18 downto 0) => D(18 downto 0),
      DWE => DWE,
      E(0) => E(0),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\(0) => timeout,
      \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0\ => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\,
      \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(8) => bus2ip_addr(10),
      \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1\(7 downto 0) => \^q\(7 downto 0),
      \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\,
      \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\,
      Intr2Bus_RdAck0 => Intr2Bus_RdAck0,
      Q => start2,
      bus2ip_be(0) => bus2ip_be(3),
      bus2ip_rdce(2 downto 0) => bus2ip_rdce(2 downto 0),
      bus2ip_wrce(0) => bus2ip_wrce(0),
      convst_rst_wrce_or_reduce => convst_rst_wrce_or_reduce,
      \data_is_non_reset_match__3\ => \SOFT_RESET_I/data_is_non_reset_match__3\,
      dummy_local_reg_rdack0 => dummy_local_reg_rdack0,
      dummy_local_reg_rdack_d1 => dummy_local_reg_rdack_d1,
      dummy_local_reg_rdack_d10 => dummy_local_reg_rdack_d10,
      dummy_local_reg_wrack0 => dummy_local_reg_wrack0,
      dummy_local_reg_wrack_d1 => dummy_local_reg_wrack_d1,
      dummy_local_reg_wrack_d10 => dummy_local_reg_wrack_d10,
      hard_macro_rst_reg => hard_macro_rst_reg,
      interrupt_wrce_strb => interrupt_wrce_strb,
      ip2bus_rdack => ip2bus_rdack,
      ip2bus_wrack => ip2bus_wrack,
      \ip_irpt_status_reg1__0\ => \ip_irpt_status_reg1__0\,
      ipif_glbl_irpt_enable_reg => ipif_glbl_irpt_enable_reg,
      ipif_glbl_irpt_enable_reg_reg => bus2ip_rnw_i_reg_n_0,
      irpt_rdack => irpt_rdack,
      irpt_rdack_d1 => irpt_rdack_d1,
      irpt_wrack => irpt_wrack,
      irpt_wrack_d1 => irpt_wrack_d1,
      jtaglocked_i => jtaglocked_i,
      jtagmodified_d1 => jtagmodified_d1,
      jtagmodified_i => jtagmodified_i,
      local_rdce_or_reduce => local_rdce_or_reduce,
      local_reg_rdack0 => local_reg_rdack0,
      local_reg_rdack_d1 => local_reg_rdack_d1,
      local_reg_wrack0 => local_reg_wrack0,
      local_reg_wrack_d1 => local_reg_wrack_d1,
      p_1_in10_in => p_1_in10_in,
      p_1_in13_in => p_1_in13_in,
      p_1_in16_in => p_1_in16_in,
      p_1_in19_in => p_1_in19_in,
      p_1_in1_in => p_1_in1_in,
      p_1_in22_in => p_1_in22_in,
      p_1_in25_in => p_1_in25_in,
      p_1_in28_in => p_1_in28_in,
      p_1_in31_in => p_1_in31_in,
      p_1_in34_in => p_1_in34_in,
      p_1_in37_in => p_1_in37_in,
      p_1_in40_in => p_1_in40_in,
      p_1_in43_in => p_1_in43_in,
      p_1_in46_in => p_1_in46_in,
      p_1_in4_in => p_1_in4_in,
      p_1_in7_in => p_1_in7_in,
      p_1_in_0 => p_1_in_0,
      reset_trig0 => reset_trig0,
      rst_ip2bus_error => rst_ip2bus_error,
      rst_ip2bus_rdack0 => rst_ip2bus_rdack0,
      rst_ip2bus_rdack_d1 => rst_ip2bus_rdack_d1,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(1) => s_axi_wdata(4),
      s_axi_wdata(0) => s_axi_wdata(0),
      \s_axi_wdata[31]\ => \s_axi_wdata[31]\,
      s_axi_wdata_0_sp_1 => s_axi_wdata_0_sn_1,
      s_axi_wstrb(0) => s_axi_wstrb(3),
      status_reg_rdack0 => status_reg_rdack0,
      status_reg_rdack_d1 => status_reg_rdack_d1,
      sw_rst_cond => sw_rst_cond,
      sw_rst_cond_d1 => sw_rst_cond_d1
    );
\bus2ip_addr_i[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000EA"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_awvalid,
      I2 => s_axi_wvalid,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      O => \bus2ip_addr_i[10]_i_1_n_0\
    );
\bus2ip_addr_i[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(8),
      I1 => s_axi_awaddr(8),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[10]_i_2_n_0\
    );
\bus2ip_addr_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_awaddr(0),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[2]_i_1_n_0\
    );
\bus2ip_addr_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_awaddr(1),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[3]_i_1_n_0\
    );
\bus2ip_addr_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_awaddr(2),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[4]_i_1_n_0\
    );
\bus2ip_addr_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_awaddr(3),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[5]_i_1_n_0\
    );
\bus2ip_addr_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_awaddr(4),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[6]_i_1_n_0\
    );
\bus2ip_addr_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_awaddr(5),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[7]_i_1_n_0\
    );
\bus2ip_addr_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(6),
      I1 => s_axi_awaddr(6),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[8]_i_1_n_0\
    );
\bus2ip_addr_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => s_axi_araddr(7),
      I1 => s_axi_awaddr(7),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[9]_i_1_n_0\
    );
\bus2ip_addr_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[10]_i_2_n_0\,
      Q => bus2ip_addr(10),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[2]_i_1_n_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[3]_i_1_n_0\,
      Q => \^q\(1),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[4]_i_1_n_0\,
      Q => \^q\(2),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[5]_i_1_n_0\,
      Q => \^q\(3),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[6]_i_1_n_0\,
      Q => \^q\(4),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[7]_i_1_n_0\,
      Q => \^q\(5),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[8]_i_1_n_0\,
      Q => \^q\(6),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => \bus2ip_addr_i[9]_i_1_n_0\,
      Q => \^q\(7),
      R => \^sr\(0)
    );
bus2ip_rnw_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[10]_i_1_n_0\,
      D => s_axi_arvalid,
      Q => bus2ip_rnw_i_reg_n_0,
      R => \^sr\(0)
    );
\do_reg[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \do_reg_reg[15]\,
      I2 => jtaglocked_i,
      O => rst_reg_0(0)
    );
inst_sysmon_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \do_reg_reg[15]\,
      I2 => hard_macro_rst_reg,
      O => RESET
    );
rst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => rst_i_1_n_0
    );
rst_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => rst_i_1_n_0,
      Q => \^sr\(0),
      R => '0'
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ip2bus_rdack,
      I1 => timeout,
      O => \^s_axi_arready\
    );
\s_axi_bresp_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in(0),
      I1 => s_axi_bresp_i,
      I2 => \^s_axi_bresp\(0),
      O => \s_axi_bresp_i[1]_i_1_n_0\
    );
\s_axi_bresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \s_axi_bresp_i[1]_i_1_n_0\,
      Q => \^s_axi_bresp\(0),
      R => \^sr\(0)
    );
s_axi_bvalid_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E0FFFF00E000E0"
    )
        port map (
      I0 => ip2bus_wrack,
      I1 => timeout,
      I2 => \state_reg_n_0_[1]\,
      I3 => \state_reg_n_0_[0]\,
      I4 => s_axi_bready,
      I5 => \^s_axi_bvalid\,
      O => s_axi_bvalid_i_i_1_n_0
    );
s_axi_bvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_bvalid_i_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(0),
      Q => s_axi_rdata(0),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(10),
      Q => s_axi_rdata(10),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(11),
      Q => s_axi_rdata(11),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(12),
      Q => s_axi_rdata(12),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(13),
      Q => s_axi_rdata(13),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(14),
      Q => s_axi_rdata(14),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(15),
      Q => s_axi_rdata(15),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(16),
      Q => s_axi_rdata(16),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(17),
      Q => s_axi_rdata(17),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(1),
      Q => s_axi_rdata(1),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(2),
      Q => s_axi_rdata(2),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(18),
      Q => s_axi_rdata(18),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(3),
      Q => s_axi_rdata(3),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(4),
      Q => s_axi_rdata(4),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(5),
      Q => s_axi_rdata(5),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(6),
      Q => s_axi_rdata(6),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(7),
      Q => s_axi_rdata(7),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(8),
      Q => s_axi_rdata(8),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \s_axi_rdata_i_reg[31]_0\(9),
      Q => s_axi_rdata(9),
      R => \^sr\(0)
    );
\s_axi_rresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => p_1_in(0),
      Q => s_axi_rresp(0),
      R => \^sr\(0)
    );
s_axi_rvalid_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E0FFFF00E000E0"
    )
        port map (
      I0 => ip2bus_rdack,
      I1 => timeout,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => s_axi_rready,
      I5 => \^s_axi_rvalid\,
      O => s_axi_rvalid_i_i_1_n_0
    );
s_axi_rvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_rvalid_i_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => \^sr\(0)
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ip2bus_wrack,
      I1 => timeout,
      O => \^s_axi_awready\
    );
start2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000F8"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_arvalid,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      O => start2_i_1_n_0
    );
start2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => start2_i_1_n_0,
      Q => start2,
      R => \^sr\(0)
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFCAAFFFFFCAA"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => ip2bus_wrack,
      I2 => timeout,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      I5 => \state1__2\,
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FFFF0C5500FF0C"
    )
        port map (
      I0 => \state1__2\,
      I1 => p_2_in,
      I2 => s_axi_arvalid,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[0]\,
      I5 => \^s_axi_arready\,
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      O => p_2_in
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => \state_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => \state_reg_n_0_[1]\,
      R => \^sr\(0)
    );
sw_rst_cond_d1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF1FFFFFFFFFFFF"
    )
        port map (
      I0 => bus2ip_rnw_i_reg_n_0,
      I1 => s_axi_wstrb(0),
      I2 => s_axi_wdata(2),
      I3 => s_axi_wdata(0),
      I4 => s_axi_wdata(1),
      I5 => s_axi_wdata(3),
      O => \SOFT_RESET_I/data_is_non_reset_match__3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_axi_lite_ipif is
  port (
    bus2ip_reset_active_high : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    Bus_RNW_reg : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    local_reg_wrack0 : out STD_LOGIC;
    convst_rst_wrce_or_reduce : out STD_LOGIC;
    DWE : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 0 to 0 );
    local_reg_rdack0 : out STD_LOGIC;
    local_rdce_or_reduce : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 18 downto 0 );
    status_reg_rdack0 : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 2 downto 0 );
    reset2ip_reset : out STD_LOGIC;
    rst_ip2bus_error : out STD_LOGIC;
    reset_trig0 : out STD_LOGIC;
    sw_rst_cond : out STD_LOGIC;
    and_reduce_be : out STD_LOGIC;
    Intr2Bus_RdAck0 : out STD_LOGIC;
    irpt_rdack : out STD_LOGIC;
    interrupt_wrce_strb : out STD_LOGIC;
    irpt_wrack : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ : out STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ : out STD_LOGIC;
    dummy_local_reg_rdack0 : out STD_LOGIC;
    dummy_local_reg_rdack_d10 : out STD_LOGIC;
    dummy_local_reg_wrack0 : out STD_LOGIC;
    dummy_local_reg_wrack_d10 : out STD_LOGIC;
    rst_ip2bus_rdack0 : out STD_LOGIC;
    \ip_irpt_status_reg1__0\ : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    \s_axi_wdata[31]\ : out STD_LOGIC;
    RESET : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 18 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    p_1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    local_reg_wrack_d1 : in STD_LOGIC;
    jtaglocked_i : in STD_LOGIC;
    local_reg_rdack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    p_1_in46_in : in STD_LOGIC;
    p_1_in43_in : in STD_LOGIC;
    p_1_in40_in : in STD_LOGIC;
    p_1_in37_in : in STD_LOGIC;
    p_1_in34_in : in STD_LOGIC;
    p_1_in31_in : in STD_LOGIC;
    p_1_in28_in : in STD_LOGIC;
    p_1_in25_in : in STD_LOGIC;
    p_1_in22_in : in STD_LOGIC;
    p_1_in19_in : in STD_LOGIC;
    p_1_in16_in : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\ : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    p_1_in13_in : in STD_LOGIC;
    p_1_in10_in : in STD_LOGIC;
    p_1_in7_in : in STD_LOGIC;
    p_1_in4_in : in STD_LOGIC;
    p_1_in1_in : in STD_LOGIC;
    p_1_in_0 : in STD_LOGIC;
    jtagmodified_i : in STD_LOGIC;
    jtagmodified_d1 : in STD_LOGIC;
    status_reg_rdack_d1 : in STD_LOGIC;
    \do_reg_reg[15]\ : in STD_LOGIC;
    sw_rst_cond_d1 : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ipif_glbl_irpt_enable_reg : in STD_LOGIC;
    irpt_rdack_d1 : in STD_LOGIC;
    irpt_wrack_d1 : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ : in STD_LOGIC;
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ : in STD_LOGIC;
    dummy_local_reg_rdack_d1 : in STD_LOGIC;
    dummy_local_reg_wrack_d1 : in STD_LOGIC;
    rst_ip2bus_rdack_d1 : in STD_LOGIC;
    ip2bus_rdack : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2bus_wrack : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    hard_macro_rst_reg : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    \s_axi_rdata_i_reg[31]\ : in STD_LOGIC_VECTOR ( 18 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
end system_pl_sysmon_0_axi_lite_ipif;

architecture STRUCTURE of system_pl_sysmon_0_axi_lite_ipif is
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
begin
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
I_SLAVE_ATTACHMENT: entity work.system_pl_sysmon_0_slave_attachment
     port map (
      Bus_RNW_reg_reg => Bus_RNW_reg,
      D(18 downto 0) => D(18 downto 0),
      DWE => DWE,
      E(0) => E(0),
      \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\ => \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\,
      \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\,
      \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11 downto 0) => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ => \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\,
      Intr2Bus_RdAck0 => Intr2Bus_RdAck0,
      Q(7 downto 0) => Q(7 downto 0),
      RESET => RESET,
      SR(0) => bus2ip_reset_active_high,
      and_reduce_be => and_reduce_be,
      bus2ip_rdce(2 downto 0) => bus2ip_rdce(2 downto 0),
      bus2ip_wrce(0) => bus2ip_wrce(0),
      convst_rst_wrce_or_reduce => convst_rst_wrce_or_reduce,
      \do_reg_reg[15]\ => \do_reg_reg[15]\,
      dummy_local_reg_rdack0 => dummy_local_reg_rdack0,
      dummy_local_reg_rdack_d1 => dummy_local_reg_rdack_d1,
      dummy_local_reg_rdack_d10 => dummy_local_reg_rdack_d10,
      dummy_local_reg_wrack0 => dummy_local_reg_wrack0,
      dummy_local_reg_wrack_d1 => dummy_local_reg_wrack_d1,
      dummy_local_reg_wrack_d10 => dummy_local_reg_wrack_d10,
      hard_macro_rst_reg => hard_macro_rst_reg,
      interrupt_wrce_strb => interrupt_wrce_strb,
      ip2bus_rdack => ip2bus_rdack,
      ip2bus_wrack => ip2bus_wrack,
      \ip_irpt_status_reg1__0\ => \ip_irpt_status_reg1__0\,
      ipif_glbl_irpt_enable_reg => ipif_glbl_irpt_enable_reg,
      irpt_rdack => irpt_rdack,
      irpt_rdack_d1 => irpt_rdack_d1,
      irpt_wrack => irpt_wrack,
      irpt_wrack_d1 => irpt_wrack_d1,
      jtaglocked_i => jtaglocked_i,
      jtagmodified_d1 => jtagmodified_d1,
      jtagmodified_i => jtagmodified_i,
      local_rdce_or_reduce => local_rdce_or_reduce,
      local_reg_rdack0 => local_reg_rdack0,
      local_reg_rdack_d1 => local_reg_rdack_d1,
      local_reg_wrack0 => local_reg_wrack0,
      local_reg_wrack_d1 => local_reg_wrack_d1,
      p_1_in(0) => p_1_in(0),
      p_1_in10_in => p_1_in10_in,
      p_1_in13_in => p_1_in13_in,
      p_1_in16_in => p_1_in16_in,
      p_1_in19_in => p_1_in19_in,
      p_1_in1_in => p_1_in1_in,
      p_1_in22_in => p_1_in22_in,
      p_1_in25_in => p_1_in25_in,
      p_1_in28_in => p_1_in28_in,
      p_1_in31_in => p_1_in31_in,
      p_1_in34_in => p_1_in34_in,
      p_1_in37_in => p_1_in37_in,
      p_1_in40_in => p_1_in40_in,
      p_1_in43_in => p_1_in43_in,
      p_1_in46_in => p_1_in46_in,
      p_1_in4_in => p_1_in4_in,
      p_1_in7_in => p_1_in7_in,
      p_1_in_0 => p_1_in_0,
      reset2ip_reset => reset2ip_reset,
      reset_trig0 => reset_trig0,
      rst_ip2bus_error => rst_ip2bus_error,
      rst_ip2bus_rdack0 => rst_ip2bus_rdack0,
      rst_ip2bus_rdack_d1 => rst_ip2bus_rdack_d1,
      rst_reg_0(0) => SR(0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(8 downto 0) => s_axi_araddr(8 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(8 downto 0) => s_axi_awaddr(8 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(18 downto 0) => s_axi_rdata(18 downto 0),
      \s_axi_rdata_i_reg[31]_0\(18 downto 0) => \s_axi_rdata_i_reg[31]\(18 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(4 downto 0) => s_axi_wdata(4 downto 0),
      \s_axi_wdata[31]\ => \s_axi_wdata[31]\,
      s_axi_wdata_0_sp_1 => s_axi_wdata_0_sn_1,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      status_reg_rdack0 => status_reg_rdack0,
      status_reg_rdack_d1 => status_reg_rdack_d1,
      sw_rst_cond => sw_rst_cond,
      sw_rst_cond_d1 => sw_rst_cond_d1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0_axi_xadc is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    vauxp0 : in STD_LOGIC;
    vauxn0 : in STD_LOGIC;
    vauxp1 : in STD_LOGIC;
    vauxn1 : in STD_LOGIC;
    vauxp2 : in STD_LOGIC;
    vauxn2 : in STD_LOGIC;
    vauxp3 : in STD_LOGIC;
    vauxn3 : in STD_LOGIC;
    vauxp4 : in STD_LOGIC;
    vauxn4 : in STD_LOGIC;
    vauxp5 : in STD_LOGIC;
    vauxn5 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp8 : in STD_LOGIC;
    vauxn8 : in STD_LOGIC;
    vauxp9 : in STD_LOGIC;
    vauxn9 : in STD_LOGIC;
    vauxp10 : in STD_LOGIC;
    vauxn10 : in STD_LOGIC;
    vp : in STD_LOGIC;
    vn : in STD_LOGIC;
    busy_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute C_FAMILY : string;
  attribute C_FAMILY of system_pl_sysmon_0_axi_xadc : entity is "virtex7";
  attribute C_INCLUDE_INTR : integer;
  attribute C_INCLUDE_INTR of system_pl_sysmon_0_axi_xadc : entity is 1;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of system_pl_sysmon_0_axi_xadc : entity is "system_pl_sysmon_0_axi_xadc";
  attribute C_SIM_MONITOR_FILE : string;
  attribute C_SIM_MONITOR_FILE of system_pl_sysmon_0_axi_xadc : entity is "design.txt";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of system_pl_sysmon_0_axi_xadc : entity is 13;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of system_pl_sysmon_0_axi_xadc : entity is 32;
  attribute hdl : string;
  attribute hdl of system_pl_sysmon_0_axi_xadc : entity is "VHDL";
  attribute ip_group : string;
  attribute ip_group of system_pl_sysmon_0_axi_xadc : entity is "LOGICORE";
  attribute iptype : string;
  attribute iptype of system_pl_sysmon_0_axi_xadc : entity is "PERIPHERAL";
end system_pl_sysmon_0_axi_xadc;

architecture STRUCTURE of system_pl_sysmon_0_axi_xadc is
  signal \<const0>\ : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_1 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_63 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_64 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_66 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_11 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_12 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_13 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_14 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_16 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_17 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_18 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_19 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_20 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_21 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_22 : STD_LOGIC;
  signal AXI_SYSMON_CORE_I_n_30 : STD_LOGIC;
  signal DWE : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ : STD_LOGIC;
  signal \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\ : STD_LOGIC;
  signal Intr2Bus_RdAck0 : STD_LOGIC;
  signal RESET : STD_LOGIC;
  signal SOFT_RESET_I_n_2 : STD_LOGIC;
  signal \^alarm_out\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal alarm_reg : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal and_reduce_be : STD_LOGIC;
  signal bus2ip_addr : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal bus2ip_rdce : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal bus2ip_reset_active_high : STD_LOGIC;
  signal bus2ip_wrce : STD_LOGIC_VECTOR ( 0 to 0 );
  signal convst_rst_wrce_or_reduce : STD_LOGIC;
  signal do_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal dummy_local_reg_rdack : STD_LOGIC;
  signal dummy_local_reg_rdack0 : STD_LOGIC;
  signal dummy_local_reg_rdack_d1 : STD_LOGIC;
  signal dummy_local_reg_rdack_d10 : STD_LOGIC;
  signal dummy_local_reg_wrack : STD_LOGIC;
  signal dummy_local_reg_wrack0 : STD_LOGIC;
  signal dummy_local_reg_wrack_d1 : STD_LOGIC;
  signal dummy_local_reg_wrack_d10 : STD_LOGIC;
  signal \^eoc_out\ : STD_LOGIC;
  signal \^eos_out\ : STD_LOGIC;
  signal hard_macro_rst_reg : STD_LOGIC;
  signal interrupt_status_i : STD_LOGIC_VECTOR ( 8 to 9 );
  signal interrupt_wrce_strb : STD_LOGIC;
  signal intr_ip2bus_data : STD_LOGIC_VECTOR ( 0 to 0 );
  signal intr_ip2bus_rdack : STD_LOGIC;
  signal ip2bus_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ip2bus_data_int1 : STD_LOGIC_VECTOR ( 14 to 31 );
  signal ip2bus_error_int1 : STD_LOGIC;
  signal ip2bus_rdack : STD_LOGIC;
  signal ip2bus_rdack_int1 : STD_LOGIC;
  signal ip2bus_wrack : STD_LOGIC;
  signal ip2bus_wrack_int1 : STD_LOGIC;
  signal \ip_irpt_status_reg1__0\ : STD_LOGIC;
  signal ipif_glbl_irpt_enable_reg : STD_LOGIC;
  signal irpt_rdack : STD_LOGIC;
  signal irpt_rdack_d1 : STD_LOGIC;
  signal irpt_wrack : STD_LOGIC;
  signal irpt_wrack_d1 : STD_LOGIC;
  signal irpt_wrack_d11 : STD_LOGIC;
  signal jtaglocked_i : STD_LOGIC;
  signal jtagmodified_d1 : STD_LOGIC;
  signal jtagmodified_i : STD_LOGIC;
  signal local_rdce_or_reduce : STD_LOGIC;
  signal local_reg_rdack0 : STD_LOGIC;
  signal local_reg_rdack_d1 : STD_LOGIC;
  signal local_reg_wrack0 : STD_LOGIC;
  signal local_reg_wrack_d1 : STD_LOGIC;
  signal \^ot_out\ : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in14_in : STD_LOGIC;
  signal p_0_in17_in : STD_LOGIC;
  signal p_0_in20_in : STD_LOGIC;
  signal p_0_in23_in : STD_LOGIC;
  signal p_0_in29_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_0_in32_in : STD_LOGIC;
  signal p_0_in35_in : STD_LOGIC;
  signal p_0_in38_in : STD_LOGIC;
  signal p_0_in44_in : STD_LOGIC;
  signal p_0_in47_in : STD_LOGIC;
  signal p_0_in5_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 1 to 1 );
  signal p_1_in10_in : STD_LOGIC;
  signal p_1_in13_in : STD_LOGIC;
  signal p_1_in16_in : STD_LOGIC;
  signal p_1_in19_in : STD_LOGIC;
  signal p_1_in1_in : STD_LOGIC;
  signal p_1_in22_in : STD_LOGIC;
  signal p_1_in25_in : STD_LOGIC;
  signal p_1_in28_in : STD_LOGIC;
  signal p_1_in31_in : STD_LOGIC;
  signal p_1_in34_in : STD_LOGIC;
  signal p_1_in37_in : STD_LOGIC;
  signal p_1_in40_in : STD_LOGIC;
  signal p_1_in43_in : STD_LOGIC;
  signal p_1_in46_in : STD_LOGIC;
  signal p_1_in4_in : STD_LOGIC;
  signal p_1_in7_in : STD_LOGIC;
  signal p_1_in_0 : STD_LOGIC;
  signal reset2ip_reset : STD_LOGIC;
  signal reset_trig0 : STD_LOGIC;
  signal rst_ip2bus_error : STD_LOGIC;
  signal rst_ip2bus_rdack : STD_LOGIC;
  signal rst_ip2bus_rdack0 : STD_LOGIC;
  signal rst_ip2bus_rdack_d1 : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal status_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal status_reg_rdack0 : STD_LOGIC;
  signal status_reg_rdack_d1 : STD_LOGIC;
  signal sw_rst_cond : STD_LOGIC;
  signal sw_rst_cond_d1 : STD_LOGIC;
  signal wrack : STD_LOGIC;
  attribute sigis : string;
  attribute sigis of ip2intc_irpt : signal is "INTR_LEVEL_HIGH";
  attribute sigis of s_axi_aclk : signal is "Clk";
  attribute sigis of s_axi_aresetn : signal is "Rst";
begin
  alarm_out(15) <= \<const0>\;
  alarm_out(14) <= \<const0>\;
  alarm_out(13) <= \<const0>\;
  alarm_out(12) <= \<const0>\;
  alarm_out(11) <= \<const0>\;
  alarm_out(10) <= \<const0>\;
  alarm_out(9) <= \<const0>\;
  alarm_out(8) <= \<const0>\;
  alarm_out(7) <= \^alarm_out\(7);
  alarm_out(6) <= \<const0>\;
  alarm_out(5) <= \<const0>\;
  alarm_out(4) <= \<const0>\;
  alarm_out(3) <= \<const0>\;
  alarm_out(2) <= \<const0>\;
  alarm_out(1) <= \<const0>\;
  alarm_out(0) <= \<const0>\;
  eoc_out <= \^eoc_out\;
  eos_out <= \^eos_out\;
  ot_out <= \^ot_out\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rdata(31) <= \^s_axi_rdata\(31);
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17 downto 0) <= \^s_axi_rdata\(17 downto 0);
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
  s_axi_wready <= \^s_axi_awready\;
AXI_LITE_IPIF_I: entity work.system_pl_sysmon_0_axi_lite_ipif
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      D(18) => intr_ip2bus_data(0),
      D(17) => ip2bus_data_int1(14),
      D(16) => ip2bus_data_int1(15),
      D(15) => ip2bus_data_int1(16),
      D(14) => ip2bus_data_int1(17),
      D(13) => ip2bus_data_int1(18),
      D(12) => ip2bus_data_int1(19),
      D(11) => ip2bus_data_int1(20),
      D(10) => ip2bus_data_int1(21),
      D(9) => ip2bus_data_int1(22),
      D(8) => ip2bus_data_int1(23),
      D(7) => ip2bus_data_int1(24),
      D(6) => ip2bus_data_int1(25),
      D(5) => ip2bus_data_int1(26),
      D(4) => ip2bus_data_int1(27),
      D(3) => ip2bus_data_int1(28),
      D(2) => ip2bus_data_int1(29),
      D(1) => ip2bus_data_int1(30),
      D(0) => ip2bus_data_int1(31),
      DWE => DWE,
      E(0) => irpt_wrack_d11,
      \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]\ => AXI_LITE_IPIF_I_n_1,
      \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\,
      \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\ => \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(17) => p_0_in47_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(16) => p_0_in44_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(15) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(14) => p_0_in38_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(13) => p_0_in35_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(12) => p_0_in32_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(11) => p_0_in29_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(10) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(9) => p_0_in23_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(8) => p_0_in20_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(7) => p_0_in17_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(6) => p_0_in14_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(5) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(4) => p_0_in8_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(3) => p_0_in5_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(2) => p_0_in2_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(1) => p_0_in0_in,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\(0) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41\,
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\(15 downto 0) => do_reg(15 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\(14 downto 0) => alarm_reg(14 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\(11 downto 0) => status_reg(11 downto 0),
      \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\ => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1\,
      Intr2Bus_RdAck0 => Intr2Bus_RdAck0,
      Q(7 downto 0) => bus2ip_addr(9 downto 2),
      RESET => RESET,
      SR(0) => AXI_LITE_IPIF_I_n_66,
      and_reduce_be => and_reduce_be,
      bus2ip_rdce(2 downto 1) => bus2ip_rdce(24 downto 23),
      bus2ip_rdce(0) => bus2ip_rdce(0),
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_wrce(0) => bus2ip_wrce(0),
      convst_rst_wrce_or_reduce => convst_rst_wrce_or_reduce,
      \do_reg_reg[15]\ => SOFT_RESET_I_n_2,
      dummy_local_reg_rdack0 => dummy_local_reg_rdack0,
      dummy_local_reg_rdack_d1 => dummy_local_reg_rdack_d1,
      dummy_local_reg_rdack_d10 => dummy_local_reg_rdack_d10,
      dummy_local_reg_wrack0 => dummy_local_reg_wrack0,
      dummy_local_reg_wrack_d1 => dummy_local_reg_wrack_d1,
      dummy_local_reg_wrack_d10 => dummy_local_reg_wrack_d10,
      hard_macro_rst_reg => hard_macro_rst_reg,
      interrupt_wrce_strb => interrupt_wrce_strb,
      ip2bus_rdack => ip2bus_rdack,
      ip2bus_wrack => ip2bus_wrack,
      \ip_irpt_status_reg1__0\ => \ip_irpt_status_reg1__0\,
      ipif_glbl_irpt_enable_reg => ipif_glbl_irpt_enable_reg,
      irpt_rdack => irpt_rdack,
      irpt_rdack_d1 => irpt_rdack_d1,
      irpt_wrack => irpt_wrack,
      irpt_wrack_d1 => irpt_wrack_d1,
      jtaglocked_i => jtaglocked_i,
      jtagmodified_d1 => jtagmodified_d1,
      jtagmodified_i => jtagmodified_i,
      local_rdce_or_reduce => local_rdce_or_reduce,
      local_reg_rdack0 => local_reg_rdack0,
      local_reg_rdack_d1 => local_reg_rdack_d1,
      local_reg_wrack0 => local_reg_wrack0,
      local_reg_wrack_d1 => local_reg_wrack_d1,
      p_1_in(0) => p_1_in(1),
      p_1_in10_in => p_1_in10_in,
      p_1_in13_in => p_1_in13_in,
      p_1_in16_in => p_1_in16_in,
      p_1_in19_in => p_1_in19_in,
      p_1_in1_in => p_1_in1_in,
      p_1_in22_in => p_1_in22_in,
      p_1_in25_in => p_1_in25_in,
      p_1_in28_in => p_1_in28_in,
      p_1_in31_in => p_1_in31_in,
      p_1_in34_in => p_1_in34_in,
      p_1_in37_in => p_1_in37_in,
      p_1_in40_in => p_1_in40_in,
      p_1_in43_in => p_1_in43_in,
      p_1_in46_in => p_1_in46_in,
      p_1_in4_in => p_1_in4_in,
      p_1_in7_in => p_1_in7_in,
      p_1_in_0 => p_1_in_0,
      reset2ip_reset => reset2ip_reset,
      reset_trig0 => reset_trig0,
      rst_ip2bus_error => rst_ip2bus_error,
      rst_ip2bus_rdack0 => rst_ip2bus_rdack0,
      rst_ip2bus_rdack_d1 => rst_ip2bus_rdack_d1,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(8 downto 0) => s_axi_araddr(10 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(8 downto 0) => s_axi_awaddr(10 downto 2),
      s_axi_awready => \^s_axi_awready\,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(18) => \^s_axi_rdata\(31),
      s_axi_rdata(17 downto 0) => \^s_axi_rdata\(17 downto 0),
      \s_axi_rdata_i_reg[31]\(18) => ip2bus_data(31),
      \s_axi_rdata_i_reg[31]\(17 downto 0) => ip2bus_data(17 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(4) => s_axi_wdata(31),
      s_axi_wdata(3 downto 0) => s_axi_wdata(3 downto 0),
      \s_axi_wdata[31]\ => AXI_LITE_IPIF_I_n_64,
      s_axi_wdata_0_sp_1 => AXI_LITE_IPIF_I_n_63,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      status_reg_rdack0 => status_reg_rdack0,
      status_reg_rdack_d1 => status_reg_rdack_d1,
      sw_rst_cond => sw_rst_cond,
      sw_rst_cond_d1 => sw_rst_cond_d1
    );
AXI_SYSMON_CORE_I: entity work.system_pl_sysmon_0_xadc_core_drp
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      D(7) => jtaglocked_i,
      D(6) => busy_out,
      D(5 downto 0) => channel_out(5 downto 0),
      DWE => DWE,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\,
      Q(7 downto 0) => bus2ip_addr(9 downto 2),
      RESET => RESET,
      SR(0) => AXI_LITE_IPIF_I_n_66,
      \alarm_reg_reg[14]_0\(14 downto 0) => alarm_reg(14 downto 0),
      and_reduce_be => and_reduce_be,
      bus2ip_rdce(1) => bus2ip_rdce(23),
      bus2ip_rdce(0) => bus2ip_rdce(0),
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_wrce(0) => bus2ip_wrce(0),
      convst_rst_wrce_or_reduce => convst_rst_wrce_or_reduce,
      \do_reg_reg[15]_0\(15 downto 0) => do_reg(15 downto 0),
      drdy_wr_ack_i_reg_0 => AXI_SYSMON_CORE_I_n_30,
      drdy_wr_ack_i_reg_1 => AXI_LITE_IPIF_I_n_1,
      dummy_local_reg_rdack => dummy_local_reg_rdack,
      eoc_out => \^eoc_out\,
      eos_out => \^eos_out\,
      hard_macro_rst_reg => hard_macro_rst_reg,
      hard_macro_rst_reg_reg_0 => AXI_LITE_IPIF_I_n_63,
      inst_sysmon_0(12) => AXI_SYSMON_CORE_I_n_11,
      inst_sysmon_0(11) => AXI_SYSMON_CORE_I_n_12,
      inst_sysmon_0(10) => AXI_SYSMON_CORE_I_n_13,
      inst_sysmon_0(9) => AXI_SYSMON_CORE_I_n_14,
      inst_sysmon_0(8) => \^alarm_out\(7),
      inst_sysmon_0(7) => AXI_SYSMON_CORE_I_n_16,
      inst_sysmon_0(6) => AXI_SYSMON_CORE_I_n_17,
      inst_sysmon_0(5) => AXI_SYSMON_CORE_I_n_18,
      inst_sysmon_0(4) => AXI_SYSMON_CORE_I_n_19,
      inst_sysmon_0(3) => AXI_SYSMON_CORE_I_n_20,
      inst_sysmon_0(2) => AXI_SYSMON_CORE_I_n_21,
      inst_sysmon_0(1) => AXI_SYSMON_CORE_I_n_22,
      inst_sysmon_0(0) => \^ot_out\,
      interrupt_status_i(1) => interrupt_status_i(8),
      interrupt_status_i(0) => interrupt_status_i(9),
      intr_ip2bus_rdack => intr_ip2bus_rdack,
      ip2bus_error_int1 => ip2bus_error_int1,
      ip2bus_rdack_int1 => ip2bus_rdack_int1,
      jtagmodified_d1 => jtagmodified_d1,
      jtagmodified_d1_reg_0 => SOFT_RESET_I_n_2,
      jtagmodified_i => jtagmodified_i,
      local_rdce_or_reduce => local_rdce_or_reduce,
      local_reg_rdack0 => local_reg_rdack0,
      local_reg_rdack_d1 => local_reg_rdack_d1,
      local_reg_wrack0 => local_reg_wrack0,
      local_reg_wrack_d1 => local_reg_wrack_d1,
      reset2ip_reset => reset2ip_reset,
      rst_ip2bus_error => rst_ip2bus_error,
      rst_ip2bus_rdack => rst_ip2bus_rdack,
      s_axi_aclk => s_axi_aclk,
      s_axi_wdata(15 downto 0) => s_axi_wdata(15 downto 0),
      status_reg_rdack0 => status_reg_rdack0,
      status_reg_rdack_d1 => status_reg_rdack_d1,
      \status_reg_reg[11]_0\(11 downto 0) => status_reg(11 downto 0),
      vauxn0 => vauxn0,
      vauxn1 => vauxn1,
      vauxn10 => vauxn10,
      vauxn2 => vauxn2,
      vauxn3 => vauxn3,
      vauxn4 => vauxn4,
      vauxn5 => vauxn5,
      vauxn6 => vauxn6,
      vauxn7 => vauxn7,
      vauxn8 => vauxn8,
      vauxn9 => vauxn9,
      vauxp0 => vauxp0,
      vauxp1 => vauxp1,
      vauxp10 => vauxp10,
      vauxp2 => vauxp2,
      vauxp3 => vauxp3,
      vauxp4 => vauxp4,
      vauxp5 => vauxp5,
      vauxp6 => vauxp6,
      vauxp7 => vauxp7,
      vauxp8 => vauxp8,
      vauxp9 => vauxp9
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I\: entity work.system_pl_sysmon_0_interrupt_control
     port map (
      D(0) => jtaglocked_i,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(11) => AXI_SYSMON_CORE_I_n_11,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(10) => AXI_SYSMON_CORE_I_n_12,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(9) => AXI_SYSMON_CORE_I_n_13,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(8) => AXI_SYSMON_CORE_I_n_14,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(7) => AXI_SYSMON_CORE_I_n_16,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(6) => AXI_SYSMON_CORE_I_n_17,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(5) => AXI_SYSMON_CORE_I_n_18,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(4) => AXI_SYSMON_CORE_I_n_19,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(3) => AXI_SYSMON_CORE_I_n_20,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(2) => AXI_SYSMON_CORE_I_n_21,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(1) => AXI_SYSMON_CORE_I_n_22,
      \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0\(0) => \^ot_out\,
      E(0) => irpt_wrack_d11,
      \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0\ => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1\,
      \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\ => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\,
      \INTR_CTRLR_GEN_I.ip2bus_wrack_reg\ => AXI_SYSMON_CORE_I_n_30,
      Intr2Bus_RdAck0 => Intr2Bus_RdAck0,
      Q(17) => p_0_in47_in,
      Q(16) => p_0_in44_in,
      Q(15) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26\,
      Q(14) => p_0_in38_in,
      Q(13) => p_0_in35_in,
      Q(12) => p_0_in32_in,
      Q(11) => p_0_in29_in,
      Q(10) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31\,
      Q(9) => p_0_in23_in,
      Q(8) => p_0_in20_in,
      Q(7) => p_0_in17_in,
      Q(6) => p_0_in14_in,
      Q(5) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36\,
      Q(4) => p_0_in8_in,
      Q(3) => p_0_in5_in,
      Q(2) => p_0_in2_in,
      Q(1) => p_0_in0_in,
      Q(0) => \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41\,
      dummy_local_reg_wrack => dummy_local_reg_wrack,
      eoc_out => \^eoc_out\,
      eos_out => \^eos_out\,
      interrupt_status_i(1) => interrupt_status_i(8),
      interrupt_status_i(0) => interrupt_status_i(9),
      interrupt_wrce_strb => interrupt_wrce_strb,
      intr_ip2bus_rdack => intr_ip2bus_rdack,
      ip2bus_wrack_int1 => ip2bus_wrack_int1,
      ip2intc_irpt => ip2intc_irpt,
      \ip_irpt_status_reg1__0\ => \ip_irpt_status_reg1__0\,
      ipif_glbl_irpt_enable_reg => ipif_glbl_irpt_enable_reg,
      ipif_glbl_irpt_enable_reg_reg_0 => AXI_LITE_IPIF_I_n_64,
      irpt_rdack => irpt_rdack,
      irpt_rdack_d1 => irpt_rdack_d1,
      irpt_wrack => irpt_wrack,
      irpt_wrack_d1 => irpt_wrack_d1,
      jtagmodified_i => jtagmodified_i,
      p_1_in => p_1_in_0,
      p_1_in10_in => p_1_in10_in,
      p_1_in13_in => p_1_in13_in,
      p_1_in16_in => p_1_in16_in,
      p_1_in19_in => p_1_in19_in,
      p_1_in1_in => p_1_in1_in,
      p_1_in22_in => p_1_in22_in,
      p_1_in25_in => p_1_in25_in,
      p_1_in28_in => p_1_in28_in,
      p_1_in31_in => p_1_in31_in,
      p_1_in34_in => p_1_in34_in,
      p_1_in37_in => p_1_in37_in,
      p_1_in40_in => p_1_in40_in,
      p_1_in43_in => p_1_in43_in,
      p_1_in46_in => p_1_in46_in,
      p_1_in4_in => p_1_in4_in,
      p_1_in7_in => p_1_in7_in,
      reset2ip_reset => reset2ip_reset,
      rst_ip2bus_error => rst_ip2bus_error,
      s_axi_aclk => s_axi_aclk,
      s_axi_wdata(17 downto 0) => s_axi_wdata(17 downto 0),
      wrack => wrack
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr\,
      Q => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1\,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0\,
      Q => \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack\,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr\,
      Q => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1\,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0\,
      Q => \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack\,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => intr_ip2bus_data(0),
      Q => ip2bus_data(31),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(14),
      Q => ip2bus_data(17),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(15),
      Q => ip2bus_data(16),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(16),
      Q => ip2bus_data(15),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(17),
      Q => ip2bus_data(14),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(18),
      Q => ip2bus_data(13),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(19),
      Q => ip2bus_data(12),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(20),
      Q => ip2bus_data(11),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(21),
      Q => ip2bus_data(10),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(22),
      Q => ip2bus_data(9),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(23),
      Q => ip2bus_data(8),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(24),
      Q => ip2bus_data(7),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(25),
      Q => ip2bus_data(6),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(26),
      Q => ip2bus_data(5),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(27),
      Q => ip2bus_data(4),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(28),
      Q => ip2bus_data(3),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(29),
      Q => ip2bus_data(2),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(30),
      Q => ip2bus_data(1),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_data_int1(31),
      Q => ip2bus_data(0),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_error_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_error_int1,
      Q => p_1_in(1),
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_rdack_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_rdack_int1,
      Q => ip2bus_rdack,
      R => reset2ip_reset
    );
\INTR_CTRLR_GEN_I.ip2bus_wrack_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => ip2bus_wrack_int1,
      Q => ip2bus_wrack,
      R => reset2ip_reset
    );
SOFT_RESET_I: entity work.system_pl_sysmon_0_soft_reset
     port map (
      \RESET_FLOPS[15].RST_FLOPS_0\ => SOFT_RESET_I_n_2,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      reset_trig0 => reset_trig0,
      s_axi_aclk => s_axi_aclk,
      sw_rst_cond => sw_rst_cond,
      sw_rst_cond_d1 => sw_rst_cond_d1,
      wrack => wrack
    );
dummy_local_reg_rdack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => dummy_local_reg_rdack_d10,
      Q => dummy_local_reg_rdack_d1,
      R => reset2ip_reset
    );
dummy_local_reg_rdack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => dummy_local_reg_rdack0,
      Q => dummy_local_reg_rdack,
      R => reset2ip_reset
    );
dummy_local_reg_wrack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => dummy_local_reg_wrack_d10,
      Q => dummy_local_reg_wrack_d1,
      R => reset2ip_reset
    );
dummy_local_reg_wrack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => dummy_local_reg_wrack0,
      Q => dummy_local_reg_wrack,
      R => reset2ip_reset
    );
rst_ip2bus_rdack_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rdce(24),
      Q => rst_ip2bus_rdack_d1,
      R => reset2ip_reset
    );
rst_ip2bus_rdack_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => rst_ip2bus_rdack0,
      Q => rst_ip2bus_rdack,
      R => reset2ip_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_pl_sysmon_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    vauxp0 : in STD_LOGIC;
    vauxn0 : in STD_LOGIC;
    vauxp1 : in STD_LOGIC;
    vauxn1 : in STD_LOGIC;
    vauxp2 : in STD_LOGIC;
    vauxn2 : in STD_LOGIC;
    vauxp3 : in STD_LOGIC;
    vauxn3 : in STD_LOGIC;
    vauxp4 : in STD_LOGIC;
    vauxn4 : in STD_LOGIC;
    vauxp5 : in STD_LOGIC;
    vauxn5 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp8 : in STD_LOGIC;
    vauxn8 : in STD_LOGIC;
    vauxp9 : in STD_LOGIC;
    vauxn9 : in STD_LOGIC;
    vauxp10 : in STD_LOGIC;
    vauxn10 : in STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    busy_out : out STD_LOGIC;
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_pl_sysmon_0 : entity is true;
end system_pl_sysmon_0;

architecture STRUCTURE of system_pl_sysmon_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_inst_alarm_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 18 );
  signal NLW_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "virtex7";
  attribute C_INCLUDE_INTR : integer;
  attribute C_INCLUDE_INTR of inst : label is 1;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of inst : label is "system_pl_sysmon_0_axi_xadc";
  attribute C_SIM_MONITOR_FILE : string;
  attribute C_SIM_MONITOR_FILE of inst : label is "design.txt";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of inst : label is 13;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute hdl : string;
  attribute hdl of inst : label is "VHDL";
  attribute ip_group : string;
  attribute ip_group of inst : label is "LOGICORE";
  attribute iptype : string;
  attribute iptype of inst : label is "PERIPHERAL";
begin
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rdata(31) <= \^s_axi_rdata\(31);
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17 downto 0) <= \^s_axi_rdata\(17 downto 0);
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_pl_sysmon_0_axi_xadc
     port map (
      alarm_out(15 downto 8) => NLW_inst_alarm_out_UNCONNECTED(15 downto 8),
      alarm_out(7) => alarm_out,
      alarm_out(6 downto 0) => NLW_inst_alarm_out_UNCONNECTED(6 downto 0),
      busy_out => busy_out,
      channel_out(5 downto 0) => channel_out(5 downto 0),
      eoc_out => eoc_out,
      eos_out => eos_out,
      ip2intc_irpt => ip2intc_irpt,
      ot_out => ot_out,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(12 downto 11) => B"00",
      s_axi_araddr(10 downto 2) => s_axi_araddr(10 downto 2),
      s_axi_araddr(1 downto 0) => B"00",
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(12 downto 11) => B"00",
      s_axi_awaddr(10 downto 2) => s_axi_awaddr(10 downto 2),
      s_axi_awaddr(1 downto 0) => B"00",
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1) => \^s_axi_bresp\(1),
      s_axi_bresp(0) => NLW_inst_s_axi_bresp_UNCONNECTED(0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31) => \^s_axi_rdata\(31),
      s_axi_rdata(30 downto 18) => NLW_inst_s_axi_rdata_UNCONNECTED(30 downto 18),
      s_axi_rdata(17 downto 0) => \^s_axi_rdata\(17 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1) => \^s_axi_rresp\(1),
      s_axi_rresp(0) => NLW_inst_s_axi_rresp_UNCONNECTED(0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31) => s_axi_wdata(31),
      s_axi_wdata(30 downto 18) => B"0000000000000",
      s_axi_wdata(17 downto 0) => s_axi_wdata(17 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      vauxn0 => vauxn0,
      vauxn1 => vauxn1,
      vauxn10 => vauxn10,
      vauxn2 => vauxn2,
      vauxn3 => vauxn3,
      vauxn4 => vauxn4,
      vauxn5 => vauxn5,
      vauxn6 => vauxn6,
      vauxn7 => vauxn7,
      vauxn8 => vauxn8,
      vauxn9 => vauxn9,
      vauxp0 => vauxp0,
      vauxp1 => vauxp1,
      vauxp10 => vauxp10,
      vauxp2 => vauxp2,
      vauxp3 => vauxp3,
      vauxp4 => vauxp4,
      vauxp5 => vauxp5,
      vauxp6 => vauxp6,
      vauxp7 => vauxp7,
      vauxp8 => vauxp8,
      vauxp9 => vauxp9,
      vn => '0',
      vp => '0'
    );
end STRUCTURE;
