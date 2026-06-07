-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:16:42 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_axi_adrv9001_rx1_dma_0/system_axi_adrv9001_rx1_dma_0_sim_netlist.vhdl
-- Design      : system_axi_adrv9001_rx1_dma_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_ad_mem_asym is
  port (
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    ADDRARDADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADDRBWRADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_ram_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_ram_reg_1 : in STD_LOGIC;
    m_dest_axi_wready : in STD_LOGIC;
    dest_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_ad_mem_asym : entity is "ad_mem_asym";
end system_axi_adrv9001_rx1_dma_0_ad_mem_asym;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_ad_mem_asym is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_m_ram_reg_CASOUTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_m_ram_reg_CASOUTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_m_ram_reg_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_m_ram_reg_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_m_ram_reg_CASDINA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_m_ram_reg_CASDINB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_m_ram_reg_CASDINPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_CASDINPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_m_ram_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_m_ram_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_ram_reg_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_m_ram_reg_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of m_ram_reg : label is "p0_d64";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of m_ram_reg : label is "p0_d64";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of m_ram_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of m_ram_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of m_ram_reg : label is 8192;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of m_ram_reg : label is "axi_dmac/i_transfer/i_request_arb/i_store_and_forward/i_mem/m_ram_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of m_ram_reg : label is "block";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of m_ram_reg : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of m_ram_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of m_ram_reg : label is 511;
  attribute ram_offset : integer;
  attribute ram_offset of m_ram_reg : label is 384;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of m_ram_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of m_ram_reg : label is 63;
begin
  E(0) <= \^e\(0);
m_ram_reg: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(14 downto 13) => B"11",
      ADDRARDADDR(12 downto 6) => ADDRARDADDR(6 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(14 downto 13) => B"11",
      ADDRBWRADDR(12 downto 6) => ADDRBWRADDR(6 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => NLW_m_ram_reg_CASDINA_UNCONNECTED(31 downto 0),
      CASDINB(31 downto 0) => NLW_m_ram_reg_CASDINB_UNCONNECTED(31 downto 0),
      CASDINPA(3 downto 0) => NLW_m_ram_reg_CASDINPA_UNCONNECTED(3 downto 0),
      CASDINPB(3 downto 0) => NLW_m_ram_reg_CASDINPB_UNCONNECTED(3 downto 0),
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => NLW_m_ram_reg_CASDOUTA_UNCONNECTED(31 downto 0),
      CASDOUTB(31 downto 0) => NLW_m_ram_reg_CASDOUTB_UNCONNECTED(31 downto 0),
      CASDOUTPA(3 downto 0) => NLW_m_ram_reg_CASDOUTPA_UNCONNECTED(3 downto 0),
      CASDOUTPB(3 downto 0) => NLW_m_ram_reg_CASDOUTPB_UNCONNECTED(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => NLW_m_ram_reg_CASOUTDBITERR_UNCONNECTED,
      CASOUTSBITERR => NLW_m_ram_reg_CASOUTSBITERR_UNCONNECTED,
      CLKARDCLK => m_dest_axi_aclk,
      CLKBWRCLK => fifo_wr_clk,
      DBITERR => NLW_m_ram_reg_DBITERR_UNCONNECTED,
      DINADIN(31 downto 0) => fifo_wr_din(31 downto 0),
      DINBDIN(31 downto 0) => fifo_wr_din(63 downto 32),
      DINPADINP(3 downto 0) => B"1111",
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => m_dest_axi_wdata(31 downto 0),
      DOUTBDOUT(31 downto 0) => m_dest_axi_wdata(63 downto 32),
      DOUTPADOUTP(3 downto 0) => NLW_m_ram_reg_DOUTPADOUTP_UNCONNECTED(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => NLW_m_ram_reg_DOUTPBDOUTP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_m_ram_reg_ECCPARITY_UNCONNECTED(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \^e\(0),
      ENBWREN => '1',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => NLW_m_ram_reg_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_m_ram_reg_SBITERR_UNCONNECTED,
      SLEEP => '0',
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => m_ram_reg_0(0),
      WEBWE(6) => m_ram_reg_0(0),
      WEBWE(5) => m_ram_reg_0(0),
      WEBWE(4) => m_ram_reg_0(0),
      WEBWE(3) => m_ram_reg_0(0),
      WEBWE(2) => m_ram_reg_0(0),
      WEBWE(1) => m_ram_reg_0(0),
      WEBWE(0) => m_ram_reg_0(0)
    );
m_ram_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => m_ram_reg_1,
      I1 => m_dest_axi_wready,
      I2 => dest_valid,
      O => \^e\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_address_generator is
  port (
    addr_valid_reg_0 : out STD_LOGIC;
    \id_reg[3]_0\ : out STD_LOGIC;
    \id_reg[2]_0\ : out STD_LOGIC;
    \id_reg[1]_0\ : out STD_LOGIC;
    \id_reg[0]_0\ : out STD_LOGIC;
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 27 downto 0 );
    address_enabled : out STD_LOGIC;
    dest_bl_ready : out STD_LOGIC;
    req_ready_reg_0 : out STD_LOGIC;
    dest_burst_valid : out STD_LOGIC;
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    req_ready_reg_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dest_address_eot : in STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    dbg_ids0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dest_valid_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \out\ : in STD_LOGIC_VECTOR ( 27 downto 0 );
    dest_enable : in STD_LOGIC;
    dest_bl_valid : in STD_LOGIC;
    req_ready_reg_2 : in STD_LOGIC;
    req_ready_reg_3 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \last_burst_len_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_address_generator : entity is "address_generator";
end system_axi_adrv9001_rx1_dma_0_address_generator;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_address_generator is
  signal addr_valid_d1 : STD_LOGIC;
  signal addr_valid_i_1_n_0 : STD_LOGIC;
  signal addr_valid_i_2_n_0 : STD_LOGIC;
  signal addr_valid_i_3_n_0 : STD_LOGIC;
  signal addr_valid_i_4_n_0 : STD_LOGIC;
  signal \^addr_valid_reg_0\ : STD_LOGIC;
  signal \address[0]_i_1_n_0\ : STD_LOGIC;
  signal \address[10]_i_10_n_0\ : STD_LOGIC;
  signal \address[10]_i_2_n_0\ : STD_LOGIC;
  signal \address[10]_i_3_n_0\ : STD_LOGIC;
  signal \address[10]_i_4_n_0\ : STD_LOGIC;
  signal \address[10]_i_5_n_0\ : STD_LOGIC;
  signal \address[10]_i_6_n_0\ : STD_LOGIC;
  signal \address[10]_i_7_n_0\ : STD_LOGIC;
  signal \address[10]_i_8_n_0\ : STD_LOGIC;
  signal \address[10]_i_9_n_0\ : STD_LOGIC;
  signal \address[18]_i_2_n_0\ : STD_LOGIC;
  signal \address[18]_i_3_n_0\ : STD_LOGIC;
  signal \address[18]_i_4_n_0\ : STD_LOGIC;
  signal \address[18]_i_5_n_0\ : STD_LOGIC;
  signal \address[18]_i_6_n_0\ : STD_LOGIC;
  signal \address[18]_i_7_n_0\ : STD_LOGIC;
  signal \address[18]_i_8_n_0\ : STD_LOGIC;
  signal \address[18]_i_9_n_0\ : STD_LOGIC;
  signal \address[1]_i_1_n_0\ : STD_LOGIC;
  signal \address[26]_i_2_n_0\ : STD_LOGIC;
  signal \address[26]_i_3_n_0\ : STD_LOGIC;
  signal \address[26]_i_4_n_0\ : STD_LOGIC;
  signal \address[26]_i_5_n_0\ : STD_LOGIC;
  signal \address[26]_i_6_n_0\ : STD_LOGIC;
  signal \address[26]_i_7_n_0\ : STD_LOGIC;
  signal \address[26]_i_8_n_0\ : STD_LOGIC;
  signal \address[26]_i_9_n_0\ : STD_LOGIC;
  signal \address[27]_i_1_n_0\ : STD_LOGIC;
  signal \address[27]_i_3_n_0\ : STD_LOGIC;
  signal \address[2]_i_1_n_0\ : STD_LOGIC;
  signal \^address_enabled\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_10\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_11\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_12\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_13\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_14\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_15\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_4\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_8\ : STD_LOGIC;
  signal \address_reg[10]_i_1_n_9\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_0\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_1\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_10\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_11\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_12\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_13\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_14\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_15\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_2\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_3\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_4\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_5\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_6\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_7\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_8\ : STD_LOGIC;
  signal \address_reg[18]_i_1_n_9\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_0\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_1\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_10\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_11\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_12\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_13\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_14\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_15\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_2\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_3\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_4\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_5\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_6\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_7\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_8\ : STD_LOGIC;
  signal \address_reg[26]_i_1_n_9\ : STD_LOGIC;
  signal \address_reg[27]_i_2_n_15\ : STD_LOGIC;
  signal bl_ready_i_1_n_0 : STD_LOGIC;
  signal \^dest_bl_ready\ : STD_LOGIC;
  signal \dest_id_next[3]_i_4_n_0\ : STD_LOGIC;
  signal enabled_i_1_n_0 : STD_LOGIC;
  signal \id[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \id[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \id[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \^id_reg[0]_0\ : STD_LOGIC;
  signal \^id_reg[1]_0\ : STD_LOGIC;
  signal \^id_reg[2]_0\ : STD_LOGIC;
  signal \^id_reg[3]_0\ : STD_LOGIC;
  signal inc_id_return : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal last : STD_LOGIC;
  signal last_burst_len : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \length[3]_i_1_n_0\ : STD_LOGIC;
  signal \^m_dest_axi_awaddr\ : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal p_0_in0 : STD_LOGIC;
  signal req_ready_i_1_n_0 : STD_LOGIC;
  signal \^req_ready_reg_0\ : STD_LOGIC;
  signal \NLW_address_reg[27]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_address_reg[27]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of addr_valid_i_4 : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \address[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \address[1]_i_1\ : label is "soft_lutpair49";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \address_reg[10]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \address_reg[18]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \address_reg[26]_i_1\ : label is 16;
  attribute ADDER_THRESHOLD of \address_reg[27]_i_2\ : label is 16;
  attribute SOFT_HLUTNM of \id[0]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \id[1]_i_1__1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \id[2]_i_1__1\ : label is "soft_lutpair48";
begin
  addr_valid_reg_0 <= \^addr_valid_reg_0\;
  address_enabled <= \^address_enabled\;
  dest_bl_ready <= \^dest_bl_ready\;
  \id_reg[0]_0\ <= \^id_reg[0]_0\;
  \id_reg[1]_0\ <= \^id_reg[1]_0\;
  \id_reg[2]_0\ <= \^id_reg[2]_0\;
  \id_reg[3]_0\ <= \^id_reg[3]_0\;
  m_dest_axi_awaddr(27 downto 0) <= \^m_dest_axi_awaddr\(27 downto 0);
  req_ready_reg_0 <= \^req_ready_reg_0\;
addr_valid_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \^addr_valid_reg_0\,
      Q => addr_valid_d1,
      R => '0'
    );
addr_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500555540404040"
    )
        port map (
      I0 => req_ready_reg_1(0),
      I1 => addr_valid_i_2_n_0,
      I2 => addr_valid_i_3_n_0,
      I3 => \^req_ready_reg_0\,
      I4 => m_dest_axi_awready,
      I5 => \^addr_valid_reg_0\,
      O => addr_valid_i_1_n_0
    );
addr_valid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => dbg_ids0(0),
      I1 => \^id_reg[0]_0\,
      I2 => dbg_ids0(3),
      I3 => \^id_reg[3]_0\,
      I4 => addr_valid_i_4_n_0,
      O => addr_valid_i_2_n_0
    );
addr_valid_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => \^req_ready_reg_0\,
      I1 => dest_enable,
      I2 => \^dest_bl_ready\,
      I3 => dest_address_eot,
      O => addr_valid_i_3_n_0
    );
addr_valid_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => dbg_ids0(1),
      I2 => \^id_reg[2]_0\,
      I3 => dbg_ids0(2),
      O => addr_valid_i_4_n_0
    );
addr_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => addr_valid_i_1_n_0,
      Q => \^addr_valid_reg_0\,
      R => '0'
    );
\address[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(0),
      I1 => \out\(0),
      I2 => \^req_ready_reg_0\,
      O => \address[0]_i_1_n_0\
    );
\address[10]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(3),
      I1 => \out\(3),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_10_n_0\
    );
\address[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(4),
      I1 => \out\(4),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_2_n_0\
    );
\address[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(10),
      I1 => \out\(10),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_3_n_0\
    );
\address[10]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(9),
      I1 => \out\(9),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_4_n_0\
    );
\address[10]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(8),
      I1 => \out\(8),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_5_n_0\
    );
\address[10]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(7),
      I1 => \out\(7),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_6_n_0\
    );
\address[10]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(6),
      I1 => \out\(6),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_7_n_0\
    );
\address[10]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(5),
      I1 => \out\(5),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_8_n_0\
    );
\address[10]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A3"
    )
        port map (
      I0 => \out\(4),
      I1 => \^m_dest_axi_awaddr\(4),
      I2 => \^req_ready_reg_0\,
      O => \address[10]_i_9_n_0\
    );
\address[18]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(18),
      I1 => \out\(18),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_2_n_0\
    );
\address[18]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(17),
      I1 => \out\(17),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_3_n_0\
    );
\address[18]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(16),
      I1 => \out\(16),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_4_n_0\
    );
\address[18]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(15),
      I1 => \out\(15),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_5_n_0\
    );
\address[18]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(14),
      I1 => \out\(14),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_6_n_0\
    );
\address[18]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(13),
      I1 => \out\(13),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_7_n_0\
    );
\address[18]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(12),
      I1 => \out\(12),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_8_n_0\
    );
\address[18]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(11),
      I1 => \out\(11),
      I2 => \^req_ready_reg_0\,
      O => \address[18]_i_9_n_0\
    );
\address[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(1),
      I1 => \out\(1),
      I2 => \^req_ready_reg_0\,
      O => \address[1]_i_1_n_0\
    );
\address[26]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(26),
      I1 => \out\(26),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_2_n_0\
    );
\address[26]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(25),
      I1 => \out\(25),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_3_n_0\
    );
\address[26]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(24),
      I1 => \out\(24),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_4_n_0\
    );
\address[26]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(23),
      I1 => \out\(23),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_5_n_0\
    );
\address[26]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(22),
      I1 => \out\(22),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_6_n_0\
    );
\address[26]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(21),
      I1 => \out\(21),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_7_n_0\
    );
\address[26]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(20),
      I1 => \out\(20),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_8_n_0\
    );
\address[26]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(19),
      I1 => \out\(19),
      I2 => \^req_ready_reg_0\,
      O => \address[26]_i_9_n_0\
    );
\address[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \^req_ready_reg_0\,
      I1 => \^addr_valid_reg_0\,
      I2 => m_dest_axi_awready,
      O => \address[27]_i_1_n_0\
    );
\address[27]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(27),
      I1 => \out\(27),
      I2 => \^req_ready_reg_0\,
      O => \address[27]_i_3_n_0\
    );
\address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \^m_dest_axi_awaddr\(2),
      I1 => \out\(2),
      I2 => \^req_ready_reg_0\,
      O => \address[2]_i_1_n_0\
    );
\address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address[0]_i_1_n_0\,
      Q => \^m_dest_axi_awaddr\(0),
      R => '0'
    );
\address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_8\,
      Q => \^m_dest_axi_awaddr\(10),
      R => '0'
    );
\address_reg[10]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \address_reg[10]_i_1_n_0\,
      CO(6) => \address_reg[10]_i_1_n_1\,
      CO(5) => \address_reg[10]_i_1_n_2\,
      CO(4) => \address_reg[10]_i_1_n_3\,
      CO(3) => \address_reg[10]_i_1_n_4\,
      CO(2) => \address_reg[10]_i_1_n_5\,
      CO(1) => \address_reg[10]_i_1_n_6\,
      CO(0) => \address_reg[10]_i_1_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1) => \address[10]_i_2_n_0\,
      DI(0) => '0',
      O(7) => \address_reg[10]_i_1_n_8\,
      O(6) => \address_reg[10]_i_1_n_9\,
      O(5) => \address_reg[10]_i_1_n_10\,
      O(4) => \address_reg[10]_i_1_n_11\,
      O(3) => \address_reg[10]_i_1_n_12\,
      O(2) => \address_reg[10]_i_1_n_13\,
      O(1) => \address_reg[10]_i_1_n_14\,
      O(0) => \address_reg[10]_i_1_n_15\,
      S(7) => \address[10]_i_3_n_0\,
      S(6) => \address[10]_i_4_n_0\,
      S(5) => \address[10]_i_5_n_0\,
      S(4) => \address[10]_i_6_n_0\,
      S(3) => \address[10]_i_7_n_0\,
      S(2) => \address[10]_i_8_n_0\,
      S(1) => \address[10]_i_9_n_0\,
      S(0) => \address[10]_i_10_n_0\
    );
\address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_15\,
      Q => \^m_dest_axi_awaddr\(11),
      R => '0'
    );
\address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_14\,
      Q => \^m_dest_axi_awaddr\(12),
      R => '0'
    );
\address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_13\,
      Q => \^m_dest_axi_awaddr\(13),
      R => '0'
    );
\address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_12\,
      Q => \^m_dest_axi_awaddr\(14),
      R => '0'
    );
\address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_11\,
      Q => \^m_dest_axi_awaddr\(15),
      R => '0'
    );
\address_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_10\,
      Q => \^m_dest_axi_awaddr\(16),
      R => '0'
    );
\address_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_9\,
      Q => \^m_dest_axi_awaddr\(17),
      R => '0'
    );
\address_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[18]_i_1_n_8\,
      Q => \^m_dest_axi_awaddr\(18),
      R => '0'
    );
\address_reg[18]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \address_reg[10]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \address_reg[18]_i_1_n_0\,
      CO(6) => \address_reg[18]_i_1_n_1\,
      CO(5) => \address_reg[18]_i_1_n_2\,
      CO(4) => \address_reg[18]_i_1_n_3\,
      CO(3) => \address_reg[18]_i_1_n_4\,
      CO(2) => \address_reg[18]_i_1_n_5\,
      CO(1) => \address_reg[18]_i_1_n_6\,
      CO(0) => \address_reg[18]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \address_reg[18]_i_1_n_8\,
      O(6) => \address_reg[18]_i_1_n_9\,
      O(5) => \address_reg[18]_i_1_n_10\,
      O(4) => \address_reg[18]_i_1_n_11\,
      O(3) => \address_reg[18]_i_1_n_12\,
      O(2) => \address_reg[18]_i_1_n_13\,
      O(1) => \address_reg[18]_i_1_n_14\,
      O(0) => \address_reg[18]_i_1_n_15\,
      S(7) => \address[18]_i_2_n_0\,
      S(6) => \address[18]_i_3_n_0\,
      S(5) => \address[18]_i_4_n_0\,
      S(4) => \address[18]_i_5_n_0\,
      S(3) => \address[18]_i_6_n_0\,
      S(2) => \address[18]_i_7_n_0\,
      S(1) => \address[18]_i_8_n_0\,
      S(0) => \address[18]_i_9_n_0\
    );
\address_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_15\,
      Q => \^m_dest_axi_awaddr\(19),
      R => '0'
    );
\address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address[1]_i_1_n_0\,
      Q => \^m_dest_axi_awaddr\(1),
      R => '0'
    );
\address_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_14\,
      Q => \^m_dest_axi_awaddr\(20),
      R => '0'
    );
\address_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_13\,
      Q => \^m_dest_axi_awaddr\(21),
      R => '0'
    );
\address_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_12\,
      Q => \^m_dest_axi_awaddr\(22),
      R => '0'
    );
\address_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_11\,
      Q => \^m_dest_axi_awaddr\(23),
      R => '0'
    );
\address_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_10\,
      Q => \^m_dest_axi_awaddr\(24),
      R => '0'
    );
\address_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_9\,
      Q => \^m_dest_axi_awaddr\(25),
      R => '0'
    );
\address_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[26]_i_1_n_8\,
      Q => \^m_dest_axi_awaddr\(26),
      R => '0'
    );
\address_reg[26]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \address_reg[18]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \address_reg[26]_i_1_n_0\,
      CO(6) => \address_reg[26]_i_1_n_1\,
      CO(5) => \address_reg[26]_i_1_n_2\,
      CO(4) => \address_reg[26]_i_1_n_3\,
      CO(3) => \address_reg[26]_i_1_n_4\,
      CO(2) => \address_reg[26]_i_1_n_5\,
      CO(1) => \address_reg[26]_i_1_n_6\,
      CO(0) => \address_reg[26]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \address_reg[26]_i_1_n_8\,
      O(6) => \address_reg[26]_i_1_n_9\,
      O(5) => \address_reg[26]_i_1_n_10\,
      O(4) => \address_reg[26]_i_1_n_11\,
      O(3) => \address_reg[26]_i_1_n_12\,
      O(2) => \address_reg[26]_i_1_n_13\,
      O(1) => \address_reg[26]_i_1_n_14\,
      O(0) => \address_reg[26]_i_1_n_15\,
      S(7) => \address[26]_i_2_n_0\,
      S(6) => \address[26]_i_3_n_0\,
      S(5) => \address[26]_i_4_n_0\,
      S(4) => \address[26]_i_5_n_0\,
      S(3) => \address[26]_i_6_n_0\,
      S(2) => \address[26]_i_7_n_0\,
      S(1) => \address[26]_i_8_n_0\,
      S(0) => \address[26]_i_9_n_0\
    );
\address_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[27]_i_2_n_15\,
      Q => \^m_dest_axi_awaddr\(27),
      R => '0'
    );
\address_reg[27]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \address_reg[26]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 0) => \NLW_address_reg[27]_i_2_CO_UNCONNECTED\(7 downto 0),
      DI(7 downto 0) => B"00000000",
      O(7 downto 1) => \NLW_address_reg[27]_i_2_O_UNCONNECTED\(7 downto 1),
      O(0) => \address_reg[27]_i_2_n_15\,
      S(7 downto 1) => B"0000000",
      S(0) => \address[27]_i_3_n_0\
    );
\address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address[2]_i_1_n_0\,
      Q => \^m_dest_axi_awaddr\(2),
      R => '0'
    );
\address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_15\,
      Q => \^m_dest_axi_awaddr\(3),
      R => '0'
    );
\address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_14\,
      Q => \^m_dest_axi_awaddr\(4),
      R => '0'
    );
\address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_13\,
      Q => \^m_dest_axi_awaddr\(5),
      R => '0'
    );
\address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_12\,
      Q => \^m_dest_axi_awaddr\(6),
      R => '0'
    );
\address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_11\,
      Q => \^m_dest_axi_awaddr\(7),
      R => '0'
    );
\address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_10\,
      Q => \^m_dest_axi_awaddr\(8),
      R => '0'
    );
\address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \address[27]_i_1_n_0\,
      D => \address_reg[10]_i_1_n_9\,
      Q => \^m_dest_axi_awaddr\(9),
      R => '0'
    );
bl_ready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555550C000000"
    )
        port map (
      I0 => dest_bl_valid,
      I1 => addr_valid_i_2_n_0,
      I2 => \^addr_valid_reg_0\,
      I3 => dest_enable,
      I4 => dest_address_eot,
      I5 => \^dest_bl_ready\,
      O => bl_ready_i_1_n_0
    );
bl_ready_reg: unisim.vcomponents.FDSE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => bl_ready_i_1_n_0,
      Q => \^dest_bl_ready\,
      S => req_ready_reg_1(0)
    );
\dest_id_next[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => dest_valid_reg(0),
      I1 => \^id_reg[0]_0\,
      I2 => dest_valid_reg(3),
      I3 => \^id_reg[3]_0\,
      I4 => \dest_id_next[3]_i_4_n_0\,
      O => dest_burst_valid
    );
\dest_id_next[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => dest_valid_reg(1),
      I2 => \^id_reg[2]_0\,
      I3 => dest_valid_reg(2),
      O => \dest_id_next[3]_i_4_n_0\
    );
enabled_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => dest_enable,
      I1 => \^addr_valid_reg_0\,
      I2 => \^address_enabled\,
      O => enabled_i_1_n_0
    );
enabled_reg: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => enabled_i_1_n_0,
      Q => \^address_enabled\,
      R => req_ready_reg_1(0)
    );
\id[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[2]_0\,
      O => \id[0]_i_1__0_n_0\
    );
\id[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => \^id_reg[2]_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[0]_0\,
      I3 => \^id_reg[1]_0\,
      O => inc_id_return(1)
    );
\id[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F074"
    )
        port map (
      I0 => \^id_reg[3]_0\,
      I1 => \^id_reg[1]_0\,
      I2 => \^id_reg[2]_0\,
      I3 => \^id_reg[0]_0\,
      O => inc_id_return(2)
    );
\id[3]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^addr_valid_reg_0\,
      I1 => addr_valid_d1,
      O => \id[3]_i_1__2_n_0\
    );
\id[3]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE04"
    )
        port map (
      I0 => \^id_reg[0]_0\,
      I1 => \^id_reg[2]_0\,
      I2 => \^id_reg[1]_0\,
      I3 => \^id_reg[3]_0\,
      O => \id[3]_i_2__0_n_0\
    );
\id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \id[3]_i_1__2_n_0\,
      D => \id[0]_i_1__0_n_0\,
      Q => \^id_reg[0]_0\,
      R => req_ready_reg_1(0)
    );
\id_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \id[3]_i_1__2_n_0\,
      D => inc_id_return(1),
      Q => \^id_reg[1]_0\,
      R => req_ready_reg_1(0)
    );
\id_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \id[3]_i_1__2_n_0\,
      D => inc_id_return(2),
      Q => \^id_reg[2]_0\,
      R => req_ready_reg_1(0)
    );
\id_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \id[3]_i_1__2_n_0\,
      D => \id[3]_i_2__0_n_0\,
      Q => \^id_reg[3]_0\,
      R => req_ready_reg_1(0)
    );
\last_burst_len_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => E(0),
      D => \last_burst_len_reg[3]_0\(0),
      Q => last_burst_len(0),
      R => '0'
    );
\last_burst_len_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => E(0),
      D => \last_burst_len_reg[3]_0\(1),
      Q => last_burst_len(1),
      R => '0'
    );
\last_burst_len_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => E(0),
      D => \last_burst_len_reg[3]_0\(2),
      Q => last_burst_len(2),
      R => '0'
    );
\last_burst_len_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => E(0),
      D => \last_burst_len_reg[3]_0\(3),
      Q => last_burst_len(3),
      R => '0'
    );
last_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => p_0_in0,
      D => dest_address_eot,
      Q => last,
      R => '0'
    );
\length[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => dest_address_eot,
      I1 => \^addr_valid_reg_0\,
      O => \length[3]_i_1_n_0\
    );
\length[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^addr_valid_reg_0\,
      O => p_0_in0
    );
\length_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => p_0_in0,
      D => last_burst_len(0),
      Q => m_dest_axi_awlen(0),
      S => \length[3]_i_1_n_0\
    );
\length_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => p_0_in0,
      D => last_burst_len(1),
      Q => m_dest_axi_awlen(1),
      S => \length[3]_i_1_n_0\
    );
\length_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => p_0_in0,
      D => last_burst_len(2),
      Q => m_dest_axi_awlen(2),
      S => \length[3]_i_1_n_0\
    );
\length_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => p_0_in0,
      D => last_burst_len(3),
      Q => m_dest_axi_awlen(3),
      S => \length[3]_i_1_n_0\
    );
req_ready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99F0990099009900"
    )
        port map (
      I0 => req_ready_reg_2,
      I1 => req_ready_reg_3,
      I2 => last,
      I3 => \^req_ready_reg_0\,
      I4 => \^addr_valid_reg_0\,
      I5 => m_dest_axi_awready,
      O => req_ready_i_1_n_0
    );
req_ready_reg: unisim.vcomponents.FDSE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => req_ready_i_1_n_0,
      Q => \^req_ready_reg_0\,
      S => req_ready_reg_1(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_data_mover is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \id_reg[0]_0\ : out STD_LOGIC;
    \id_reg[1]_0\ : out STD_LOGIC;
    \id_reg[2]_0\ : out STD_LOGIC;
    \id_reg[3]_0\ : out STD_LOGIC;
    active_reg_0 : out STD_LOGIC;
    src_bl_valid : out STD_LOGIC;
    active_reg_1 : out STD_LOGIC;
    \beat_counter_reg[0]_0\ : out STD_LOGIC;
    last_non_eot_reg_0 : out STD_LOGIC;
    last_eot_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    last_non_eot_reg_1 : out STD_LOGIC;
    \measured_last_burst_length_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_clk : in STD_LOGIC;
    last_eot_reg_1 : in STD_LOGIC;
    active_reg_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    bl_valid_reg_0 : in STD_LOGIC;
    sync : in STD_LOGIC;
    src_enable : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    src_eot : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    active0 : in STD_LOGIC;
    active_reg_3 : in STD_LOGIC;
    src_req_spltr_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_data_mover : entity is "data_mover";
end system_axi_adrv9001_rx1_dma_0_data_mover;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_data_mover is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal active_i_1_n_0 : STD_LOGIC;
  signal \^active_reg_0\ : STD_LOGIC;
  signal beat_counter_minus_one : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \beat_counter_minus_one[3]_i_2_n_0\ : STD_LOGIC;
  signal beat_counter_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \g2b1_return__2\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal id_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^id_reg[0]_0\ : STD_LOGIC;
  signal \^id_reg[1]_0\ : STD_LOGIC;
  signal \^id_reg[2]_0\ : STD_LOGIC;
  signal \^id_reg[3]_0\ : STD_LOGIC;
  signal last_burst_length : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal last_eot : STD_LOGIC;
  signal last_eot_i_3_n_0 : STD_LOGIC;
  signal last_eot_i_4_n_0 : STD_LOGIC;
  signal \^last_eot_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal last_eot_reg_n_0 : STD_LOGIC;
  signal last_non_eot : STD_LOGIC;
  signal last_non_eot_i_1_n_0 : STD_LOGIC;
  signal \^last_non_eot_reg_0\ : STD_LOGIC;
  signal \measured_last_burst_length[3]_i_2_n_0\ : STD_LOGIC;
  signal needs_sync : STD_LOGIC;
  signal needs_sync_reg_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pending_burst : STD_LOGIC;
  signal pending_burst_i_1_n_0 : STD_LOGIC;
  signal pending_burst_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \beat_counter[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \beat_counter[2]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \beat_counter[3]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \beat_counter_minus_one[3]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \id[0]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \id[1]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \id[2]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \id[3]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of last_non_eot_i_1 : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \measured_last_burst_length[3]_i_2\ : label is "soft_lutpair72";
begin
  E(0) <= \^e\(0);
  SR(0) <= \^sr\(0);
  active_reg_0 <= \^active_reg_0\;
  \id_reg[0]_0\ <= \^id_reg[0]_0\;
  \id_reg[1]_0\ <= \^id_reg[1]_0\;
  \id_reg[2]_0\ <= \^id_reg[2]_0\;
  \id_reg[3]_0\ <= \^id_reg[3]_0\;
  last_eot_reg_0(0) <= \^last_eot_reg_0\(0);
  last_non_eot_reg_0 <= \^last_non_eot_reg_0\;
active_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAF8F0F0F0"
    )
        port map (
      I0 => active0,
      I1 => active_reg_3,
      I2 => \^active_reg_0\,
      I3 => src_req_spltr_valid,
      I4 => pending_burst,
      I5 => \^last_eot_reg_0\(0),
      O => active_i_1_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => active_i_1_n_0,
      Q => \^active_reg_0\,
      R => active_reg_2(0)
    );
\beat_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => beat_counter_reg(0),
      O => p_0_in(0)
    );
\beat_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => beat_counter_reg(0),
      I1 => beat_counter_reg(1),
      O => p_0_in(1)
    );
\beat_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => beat_counter_reg(1),
      I1 => beat_counter_reg(0),
      I2 => beat_counter_reg(2),
      O => p_0_in(2)
    );
\beat_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => beat_counter_reg(0),
      I1 => beat_counter_reg(1),
      I2 => beat_counter_reg(2),
      I3 => beat_counter_reg(3),
      O => p_0_in(3)
    );
\beat_counter_minus_one[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55D50000"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => src_eot,
      I2 => last_eot_reg_n_0,
      I3 => \beat_counter_minus_one[3]_i_2_n_0\,
      I4 => pending_burst,
      O => \^sr\(0)
    );
\beat_counter_minus_one[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2F"
    )
        port map (
      I0 => needs_sync_reg_n_0,
      I1 => sync,
      I2 => fifo_wr_en,
      O => \beat_counter_minus_one[3]_i_2_n_0\
    );
\beat_counter_minus_one_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => beat_counter_reg(0),
      Q => beat_counter_minus_one(0),
      R => \^sr\(0)
    );
\beat_counter_minus_one_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => beat_counter_reg(1),
      Q => beat_counter_minus_one(1),
      R => \^sr\(0)
    );
\beat_counter_minus_one_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => beat_counter_reg(2),
      Q => beat_counter_minus_one(2),
      R => \^sr\(0)
    );
\beat_counter_minus_one_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => beat_counter_reg(3),
      Q => beat_counter_minus_one(3),
      R => \^sr\(0)
    );
\beat_counter_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => p_0_in(0),
      Q => beat_counter_reg(0),
      S => \^sr\(0)
    );
\beat_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => p_0_in(1),
      Q => beat_counter_reg(1),
      R => \^sr\(0)
    );
\beat_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => p_0_in(2),
      Q => beat_counter_reg(2),
      R => \^sr\(0)
    );
\beat_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => p_0_in(3),
      Q => beat_counter_reg(3),
      R => \^sr\(0)
    );
bl_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => bl_valid_reg_0,
      Q => src_bl_valid,
      R => '0'
    );
burst_len_mem_reg_0_7_0_4_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^last_non_eot_reg_0\,
      O => last_non_eot_reg_1
    );
\id[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEEB1441"
    )
        port map (
      I0 => \^last_non_eot_reg_0\,
      I1 => \^id_reg[1]_0\,
      I2 => \^id_reg[3]_0\,
      I3 => \^id_reg[2]_0\,
      I4 => \^id_reg[0]_0\,
      O => id_next(0)
    );
\id[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EBFF4100"
    )
        port map (
      I0 => \^last_non_eot_reg_0\,
      I1 => \^id_reg[2]_0\,
      I2 => \^id_reg[3]_0\,
      I3 => \^id_reg[0]_0\,
      I4 => \^id_reg[1]_0\,
      O => id_next(1)
    );
\id[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00BF10"
    )
        port map (
      I0 => \^last_non_eot_reg_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[1]_0\,
      I3 => \^id_reg[2]_0\,
      I4 => \^id_reg[0]_0\,
      O => id_next(2)
    );
\id[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0010"
    )
        port map (
      I0 => \^last_non_eot_reg_0\,
      I1 => \^id_reg[0]_0\,
      I2 => \^id_reg[2]_0\,
      I3 => \^id_reg[1]_0\,
      I4 => \^id_reg[3]_0\,
      O => id_next(3)
    );
\id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => id_next(0),
      Q => \^id_reg[0]_0\,
      R => active_reg_2(0)
    );
\id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => id_next(1),
      Q => \^id_reg[1]_0\,
      R => active_reg_2(0)
    );
\id_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => id_next(2),
      Q => \^id_reg[2]_0\,
      R => active_reg_2(0)
    );
\id_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => id_next(3),
      Q => \^id_reg[3]_0\,
      R => active_reg_2(0)
    );
\last_burst_length_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^sr\(0),
      D => \out\(1),
      Q => last_burst_length(0),
      R => '0'
    );
\last_burst_length_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^sr\(0),
      D => \out\(2),
      Q => last_burst_length(1),
      R => '0'
    );
\last_burst_length_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^sr\(0),
      D => \out\(3),
      Q => last_burst_length(2),
      R => '0'
    );
\last_burst_length_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^sr\(0),
      D => \out\(4),
      Q => last_burst_length(3),
      R => '0'
    );
last_eot_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8200008200000000"
    )
        port map (
      I0 => last_eot_i_3_n_0,
      I1 => beat_counter_reg(0),
      I2 => last_burst_length(0),
      I3 => beat_counter_reg(1),
      I4 => last_burst_length(1),
      I5 => last_eot_i_4_n_0,
      O => \beat_counter_reg[0]_0\
    );
last_eot_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => beat_counter_reg(2),
      I1 => last_burst_length(2),
      I2 => beat_counter_reg(3),
      I3 => last_burst_length(3),
      O => last_eot_i_3_n_0
    );
last_eot_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8AAAFFFF"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => \beat_counter_minus_one[3]_i_2_n_0\,
      I2 => last_eot_reg_n_0,
      I3 => src_eot,
      I4 => pending_burst,
      O => last_eot_i_4_n_0
    );
last_eot_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => last_eot,
      D => last_eot_reg_1,
      Q => last_eot_reg_n_0,
      R => '0'
    );
last_non_eot_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => beat_counter_reg(1),
      I1 => beat_counter_reg(0),
      I2 => beat_counter_reg(3),
      I3 => beat_counter_reg(2),
      O => last_non_eot_i_1_n_0
    );
last_non_eot_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \^e\(0),
      D => last_non_eot_i_1_n_0,
      Q => last_non_eot,
      R => \^sr\(0)
    );
m_ram_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D0000000"
    )
        port map (
      I0 => needs_sync_reg_n_0,
      I1 => sync,
      I2 => fifo_wr_en,
      I3 => pending_burst,
      I4 => \^active_reg_0\,
      O => \^e\(0)
    );
\measured_last_burst_length[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => src_eot,
      I1 => last_eot_reg_n_0,
      I2 => \measured_last_burst_length[3]_i_2_n_0\,
      O => \^last_eot_reg_0\(0)
    );
\measured_last_burst_length[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF7F7F"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => pending_burst,
      I2 => fifo_wr_en,
      I3 => sync,
      I4 => needs_sync_reg_n_0,
      O => \measured_last_burst_length[3]_i_2_n_0\
    );
\measured_last_burst_length_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \^last_eot_reg_0\(0),
      D => beat_counter_minus_one(0),
      Q => \measured_last_burst_length_reg[3]_0\(0),
      R => '0'
    );
\measured_last_burst_length_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \^last_eot_reg_0\(0),
      D => beat_counter_minus_one(1),
      Q => \measured_last_burst_length_reg[3]_0\(1),
      R => '0'
    );
\measured_last_burst_length_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \^last_eot_reg_0\(0),
      D => beat_counter_minus_one(2),
      Q => \measured_last_burst_length_reg[3]_0\(2),
      R => '0'
    );
\measured_last_burst_length_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \^last_eot_reg_0\(0),
      D => beat_counter_minus_one(3),
      Q => \measured_last_burst_length_reg[3]_0\(3),
      R => '0'
    );
needs_sync_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7550000"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => needs_sync_reg_n_0,
      I2 => sync,
      I3 => fifo_wr_en,
      I4 => pending_burst,
      O => last_eot
    );
needs_sync_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^sr\(0),
      I1 => \out\(0),
      O => needs_sync
    );
needs_sync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => last_eot,
      D => needs_sync,
      Q => needs_sync_reg_n_0,
      R => '0'
    );
overflow_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77F7FFFF00000000"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => pending_burst,
      I2 => needs_sync_reg_n_0,
      I3 => sync,
      I4 => src_enable,
      I5 => fifo_wr_en,
      O => active_reg_1
    );
pending_burst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEFFFFBE"
    )
        port map (
      I0 => pending_burst_i_2_n_0,
      I1 => Q(2),
      I2 => id_next(2),
      I3 => Q(1),
      I4 => id_next(1),
      O => pending_burst_i_1_n_0
    );
pending_burst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F66FFF6F6FF666F"
    )
        port map (
      I0 => id_next(3),
      I1 => Q(3),
      I2 => \^last_non_eot_reg_0\,
      I3 => \g2b1_return__2\(1),
      I4 => \^id_reg[0]_0\,
      I5 => Q(0),
      O => pending_burst_i_2_n_0
    );
pending_burst_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[2]_0\,
      O => \g2b1_return__2\(1)
    );
pending_burst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => pending_burst_i_1_n_0,
      Q => pending_burst,
      R => '0'
    );
\src_id[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \measured_last_burst_length[3]_i_2_n_0\,
      I1 => last_non_eot,
      I2 => src_eot,
      I3 => last_eot_reg_n_0,
      O => \^last_non_eot_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_request_generator is
  port (
    req_gen_ready : out STD_LOGIC;
    request_eot : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_state_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    \burst_count_reg[0]_0\ : in STD_LOGIC;
    response_id : in STD_LOGIC_VECTOR ( 3 downto 0 );
    up_dma_req_x_length : in STD_LOGIC_VECTOR ( 16 downto 0 );
    \FSM_sequential_state_reg[0]_1\ : in STD_LOGIC;
    req_ready_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_request_generator : entity is "request_generator";
end system_axi_adrv9001_rx1_dma_0_request_generator;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_request_generator is
  signal \FSM_sequential_state[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_9_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b2g4_return01_out : STD_LOGIC;
  signal b2g4_return03_out : STD_LOGIC;
  signal burst_count : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \burst_count0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_1\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_2\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_3\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_4\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_5\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_6\ : STD_LOGIC;
  signal \burst_count0_carry__0_n_7\ : STD_LOGIC;
  signal burst_count0_carry_i_1_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_2_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_3_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_4_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_5_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_6_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_7_n_0 : STD_LOGIC;
  signal burst_count0_carry_i_8_n_0 : STD_LOGIC;
  signal burst_count0_carry_n_0 : STD_LOGIC;
  signal burst_count0_carry_n_1 : STD_LOGIC;
  signal burst_count0_carry_n_2 : STD_LOGIC;
  signal burst_count0_carry_n_3 : STD_LOGIC;
  signal burst_count0_carry_n_4 : STD_LOGIC;
  signal burst_count0_carry_n_5 : STD_LOGIC;
  signal burst_count0_carry_n_6 : STD_LOGIC;
  signal burst_count0_carry_n_7 : STD_LOGIC;
  signal \burst_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[10]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[11]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[12]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[13]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[14]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[15]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[16]_i_2_n_0\ : STD_LOGIC;
  signal \burst_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[7]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[8]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[9]_i_1_n_0\ : STD_LOGIC;
  signal burst_count_0 : STD_LOGIC;
  signal \g2b4_return__2\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \id[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \id[3]_i_1__0_n_0\ : STD_LOGIC;
  signal in10 : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal \nx_state__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_1_in2_in : STD_LOGIC;
  signal \req_ready_i_1__0_n_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_burst_count0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_7\ : label is "soft_lutpair55";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "STATE_REWIND_ID:010,STATE_GEN_ID:001,STATE_WAIT_LAST:100,STATE_IDLE:000,STATE_CONSUME:011";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of burst_count0_carry : label is 35;
  attribute ADDER_THRESHOLD of \burst_count0_carry__0\ : label is 35;
  attribute SOFT_HLUTNM of \burst_count[10]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \burst_count[11]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \burst_count[12]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \burst_count[13]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \burst_count[14]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \burst_count[15]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \burst_count[16]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \burst_count[1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \burst_count[2]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \burst_count[3]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \burst_count[4]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \burst_count[5]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \burst_count[6]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \burst_count[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \burst_count[8]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \burst_count[9]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \id[1]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \id[2]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \id[3]_i_2\ : label is "soft_lutpair55";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\FSM_sequential_state[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0F0BFF0"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2__0_n_0\,
      I1 => \FSM_sequential_state[0]_i_3_n_0\,
      I2 => state(0),
      I3 => \burst_count_reg[0]_0\,
      I4 => \FSM_sequential_state_reg[0]_1\,
      O => \nx_state__0\(0)
    );
\FSM_sequential_state[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => burst_count(4),
      I1 => burst_count(3),
      I2 => burst_count(6),
      I3 => burst_count(5),
      I4 => \FSM_sequential_state[0]_i_5_n_0\,
      I5 => \FSM_sequential_state[0]_i_6_n_0\,
      O => \FSM_sequential_state[0]_i_2__0_n_0\
    );
\FSM_sequential_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF9FF9"
    )
        port map (
      I0 => \g2b4_return__2\(1),
      I1 => response_id(0),
      I2 => p_1_in2_in,
      I3 => response_id(3),
      I4 => \FSM_sequential_state[0]_i_8_n_0\,
      O => \FSM_sequential_state[0]_i_3_n_0\
    );
\FSM_sequential_state[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => burst_count(0),
      I1 => burst_count(15),
      I2 => burst_count(16),
      I3 => burst_count(2),
      I4 => burst_count(1),
      O => \FSM_sequential_state[0]_i_5_n_0\
    );
\FSM_sequential_state[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => burst_count(9),
      I1 => burst_count(10),
      I2 => burst_count(7),
      I3 => burst_count(8),
      I4 => \FSM_sequential_state[0]_i_9_n_0\,
      O => \FSM_sequential_state[0]_i_6_n_0\
    );
\FSM_sequential_state[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      O => \g2b4_return__2\(1)
    );
\FSM_sequential_state[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7B7BEDEDD7BBD7EE"
    )
        port map (
      I0 => response_id(1),
      I1 => response_id(2),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(0),
      O => \FSM_sequential_state[0]_i_8_n_0\
    );
\FSM_sequential_state[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => burst_count(12),
      I1 => burst_count(11),
      I2 => burst_count(14),
      I3 => burst_count(13),
      O => \FSM_sequential_state[0]_i_9_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \nx_state__0\(0),
      Q => state(0),
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
burst_count0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => burst_count(0),
      CI_TOP => '0',
      CO(7) => burst_count0_carry_n_0,
      CO(6) => burst_count0_carry_n_1,
      CO(5) => burst_count0_carry_n_2,
      CO(4) => burst_count0_carry_n_3,
      CO(3) => burst_count0_carry_n_4,
      CO(2) => burst_count0_carry_n_5,
      CO(1) => burst_count0_carry_n_6,
      CO(0) => burst_count0_carry_n_7,
      DI(7 downto 0) => burst_count(8 downto 1),
      O(7 downto 0) => in10(8 downto 1),
      S(7) => burst_count0_carry_i_1_n_0,
      S(6) => burst_count0_carry_i_2_n_0,
      S(5) => burst_count0_carry_i_3_n_0,
      S(4) => burst_count0_carry_i_4_n_0,
      S(3) => burst_count0_carry_i_5_n_0,
      S(2) => burst_count0_carry_i_6_n_0,
      S(1) => burst_count0_carry_i_7_n_0,
      S(0) => burst_count0_carry_i_8_n_0
    );
\burst_count0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => burst_count0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \NLW_burst_count0_carry__0_CO_UNCONNECTED\(7),
      CO(6) => \burst_count0_carry__0_n_1\,
      CO(5) => \burst_count0_carry__0_n_2\,
      CO(4) => \burst_count0_carry__0_n_3\,
      CO(3) => \burst_count0_carry__0_n_4\,
      CO(2) => \burst_count0_carry__0_n_5\,
      CO(1) => \burst_count0_carry__0_n_6\,
      CO(0) => \burst_count0_carry__0_n_7\,
      DI(7) => '0',
      DI(6 downto 0) => burst_count(15 downto 9),
      O(7 downto 0) => in10(16 downto 9),
      S(7) => \burst_count0_carry__0_i_1_n_0\,
      S(6) => \burst_count0_carry__0_i_2_n_0\,
      S(5) => \burst_count0_carry__0_i_3_n_0\,
      S(4) => \burst_count0_carry__0_i_4_n_0\,
      S(3) => \burst_count0_carry__0_i_5_n_0\,
      S(2) => \burst_count0_carry__0_i_6_n_0\,
      S(1) => \burst_count0_carry__0_i_7_n_0\,
      S(0) => \burst_count0_carry__0_i_8_n_0\
    );
\burst_count0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(16),
      O => \burst_count0_carry__0_i_1_n_0\
    );
\burst_count0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(15),
      O => \burst_count0_carry__0_i_2_n_0\
    );
\burst_count0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(14),
      O => \burst_count0_carry__0_i_3_n_0\
    );
\burst_count0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(13),
      O => \burst_count0_carry__0_i_4_n_0\
    );
\burst_count0_carry__0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(12),
      O => \burst_count0_carry__0_i_5_n_0\
    );
\burst_count0_carry__0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(11),
      O => \burst_count0_carry__0_i_6_n_0\
    );
\burst_count0_carry__0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(10),
      O => \burst_count0_carry__0_i_7_n_0\
    );
\burst_count0_carry__0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(9),
      O => \burst_count0_carry__0_i_8_n_0\
    );
burst_count0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(8),
      O => burst_count0_carry_i_1_n_0
    );
burst_count0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(7),
      O => burst_count0_carry_i_2_n_0
    );
burst_count0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(6),
      O => burst_count0_carry_i_3_n_0
    );
burst_count0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(5),
      O => burst_count0_carry_i_4_n_0
    );
burst_count0_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(4),
      O => burst_count0_carry_i_5_n_0
    );
burst_count0_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(3),
      O => burst_count0_carry_i_6_n_0
    );
burst_count0_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(2),
      O => burst_count0_carry_i_7_n_0
    );
burst_count0_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_count(1),
      O => burst_count0_carry_i_8_n_0
    );
\burst_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => up_dma_req_x_length(0),
      I1 => burst_count(0),
      I2 => state(0),
      O => \burst_count[0]_i_1_n_0\
    );
\burst_count[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(10),
      I1 => in10(10),
      I2 => state(0),
      O => \burst_count[10]_i_1_n_0\
    );
\burst_count[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(11),
      I1 => in10(11),
      I2 => state(0),
      O => \burst_count[11]_i_1_n_0\
    );
\burst_count[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(12),
      I1 => in10(12),
      I2 => state(0),
      O => \burst_count[12]_i_1_n_0\
    );
\burst_count[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(13),
      I1 => in10(13),
      I2 => state(0),
      O => \burst_count[13]_i_1_n_0\
    );
\burst_count[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(14),
      I1 => in10(14),
      I2 => state(0),
      O => \burst_count[14]_i_1_n_0\
    );
\burst_count[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(15),
      I1 => in10(15),
      I2 => state(0),
      O => \burst_count[15]_i_1_n_0\
    );
\burst_count[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_3_n_0\,
      I1 => \burst_count_reg[0]_0\,
      I2 => state(0),
      O => burst_count_0
    );
\burst_count[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(16),
      I1 => in10(16),
      I2 => state(0),
      O => \burst_count[16]_i_2_n_0\
    );
\burst_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(1),
      I1 => in10(1),
      I2 => state(0),
      O => \burst_count[1]_i_1_n_0\
    );
\burst_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(2),
      I1 => in10(2),
      I2 => state(0),
      O => \burst_count[2]_i_1_n_0\
    );
\burst_count[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(3),
      I1 => in10(3),
      I2 => state(0),
      O => \burst_count[3]_i_1_n_0\
    );
\burst_count[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(4),
      I1 => in10(4),
      I2 => state(0),
      O => \burst_count[4]_i_1_n_0\
    );
\burst_count[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(5),
      I1 => in10(5),
      I2 => state(0),
      O => \burst_count[5]_i_1_n_0\
    );
\burst_count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(6),
      I1 => in10(6),
      I2 => state(0),
      O => \burst_count[6]_i_1_n_0\
    );
\burst_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(7),
      I1 => in10(7),
      I2 => state(0),
      O => \burst_count[7]_i_1_n_0\
    );
\burst_count[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(8),
      I1 => in10(8),
      I2 => state(0),
      O => \burst_count[8]_i_1_n_0\
    );
\burst_count[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => up_dma_req_x_length(9),
      I1 => in10(9),
      I2 => state(0),
      O => \burst_count[9]_i_1_n_0\
    );
\burst_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[0]_i_1_n_0\,
      Q => burst_count(0),
      R => '0'
    );
\burst_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[10]_i_1_n_0\,
      Q => burst_count(10),
      R => '0'
    );
\burst_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[11]_i_1_n_0\,
      Q => burst_count(11),
      R => '0'
    );
\burst_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[12]_i_1_n_0\,
      Q => burst_count(12),
      R => '0'
    );
\burst_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[13]_i_1_n_0\,
      Q => burst_count(13),
      R => '0'
    );
\burst_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[14]_i_1_n_0\,
      Q => burst_count(14),
      R => '0'
    );
\burst_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[15]_i_1_n_0\,
      Q => burst_count(15),
      R => '0'
    );
\burst_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[16]_i_2_n_0\,
      Q => burst_count(16),
      R => '0'
    );
\burst_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[1]_i_1_n_0\,
      Q => burst_count(1),
      R => '0'
    );
\burst_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[2]_i_1_n_0\,
      Q => burst_count(2),
      R => '0'
    );
\burst_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[3]_i_1_n_0\,
      Q => burst_count(3),
      R => '0'
    );
\burst_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[4]_i_1_n_0\,
      Q => burst_count(4),
      R => '0'
    );
\burst_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[5]_i_1_n_0\,
      Q => burst_count(5),
      R => '0'
    );
\burst_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[6]_i_1_n_0\,
      Q => burst_count(6),
      R => '0'
    );
\burst_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[7]_i_1_n_0\,
      Q => burst_count(7),
      R => '0'
    );
\burst_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[8]_i_1_n_0\,
      Q => burst_count(8),
      R => '0'
    );
\burst_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => burst_count_0,
      D => \burst_count[9]_i_1_n_0\,
      Q => burst_count(9),
      R => '0'
    );
eot_mem_src_reg_0_15_0_0_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2__0_n_0\,
      O => request_eot
    );
\id[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      O => \id[0]_i_1__2_n_0\
    );
\id[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => b2g4_return01_out
    );
\id[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F074"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(0),
      O => b2g4_return03_out
    );
\id[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => state(0),
      I1 => \burst_count_reg[0]_0\,
      I2 => \FSM_sequential_state[0]_i_3_n_0\,
      O => \id[3]_i_1__0_n_0\
    );
\id[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE04"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(3),
      O => p_1_in2_in
    );
\id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \id[3]_i_1__0_n_0\,
      D => \id[0]_i_1__2_n_0\,
      Q => \^q\(0),
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
\id_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \id[3]_i_1__0_n_0\,
      D => b2g4_return01_out,
      Q => \^q\(1),
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
\id_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \id[3]_i_1__0_n_0\,
      D => b2g4_return03_out,
      Q => \^q\(2),
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
\id_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \id[3]_i_1__0_n_0\,
      D => p_1_in2_in,
      Q => \^q\(3),
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
\req_ready_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4400F0F0"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2__0_n_0\,
      I1 => \FSM_sequential_state[0]_i_3_n_0\,
      I2 => req_ready_reg_0,
      I3 => \burst_count_reg[0]_0\,
      I4 => state(0),
      O => \req_ready_i_1__0_n_0\
    );
req_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \req_ready_i_1__0_n_0\,
      Q => req_gen_ready,
      R => \FSM_sequential_state_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_response_handler is
  port (
    \id_reg[3]_0\ : out STD_LOGIC;
    \id_reg[0]_0\ : out STD_LOGIC;
    \id_reg[1]_0\ : out STD_LOGIC;
    \id_reg[2]_0\ : out STD_LOGIC;
    enabled : out STD_LOGIC;
    \id_reg[0]_1\ : out STD_LOGIC;
    enabled_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \zerodeep.cdc_sync_fifo_ram_reg0\ : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    enabled_reg_1 : in STD_LOGIC;
    enabled_reg_2 : in STD_LOGIC;
    m_dest_axi_bready_INST_0_i_1_0 : in STD_LOGIC;
    m_dest_axi_bready_INST_0_i_1_1 : in STD_LOGIC;
    address_enabled : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_response_handler : entity is "response_handler";
end system_axi_adrv9001_rx1_dma_0_response_handler;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_response_handler is
  signal \^enabled\ : STD_LOGIC;
  signal \enabled_i_1__0_n_0\ : STD_LOGIC;
  signal \id[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \id[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \^id_reg[0]_0\ : STD_LOGIC;
  signal \^id_reg[0]_1\ : STD_LOGIC;
  signal \^id_reg[1]_0\ : STD_LOGIC;
  signal \^id_reg[2]_0\ : STD_LOGIC;
  signal \^id_reg[3]_0\ : STD_LOGIC;
  signal inc_id0_return : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal m_dest_axi_bready_INST_0_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \id[0]_i_1__1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \id[1]_i_1__2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \id[2]_i_1__2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of m_dest_axi_bready_INST_0_i_2 : label is "soft_lutpair50";
begin
  enabled <= \^enabled\;
  \id_reg[0]_0\ <= \^id_reg[0]_0\;
  \id_reg[0]_1\ <= \^id_reg[0]_1\;
  \id_reg[1]_0\ <= \^id_reg[1]_0\;
  \id_reg[2]_0\ <= \^id_reg[2]_0\;
  \id_reg[3]_0\ <= \^id_reg[3]_0\;
\enabled_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => address_enabled,
      I1 => \^id_reg[0]_1\,
      I2 => \^enabled\,
      O => \enabled_i_1__0_n_0\
    );
enabled_reg: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \enabled_i_1__0_n_0\,
      Q => \^enabled\,
      R => enabled_reg_0(0)
    );
\id[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[2]_0\,
      O => \id[0]_i_1__1_n_0\
    );
\id[1]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => \^id_reg[2]_0\,
      I1 => \^id_reg[3]_0\,
      I2 => \^id_reg[0]_0\,
      I3 => \^id_reg[1]_0\,
      O => inc_id0_return(1)
    );
\id[2]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F074"
    )
        port map (
      I0 => \^id_reg[3]_0\,
      I1 => \^id_reg[1]_0\,
      I2 => \^id_reg[2]_0\,
      I3 => \^id_reg[0]_0\,
      O => inc_id0_return(2)
    );
\id[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE04"
    )
        port map (
      I0 => \^id_reg[0]_0\,
      I1 => \^id_reg[2]_0\,
      I2 => \^id_reg[1]_0\,
      I3 => \^id_reg[3]_0\,
      O => \id[3]_i_1__1_n_0\
    );
\id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => \id[0]_i_1__1_n_0\,
      Q => \^id_reg[0]_0\,
      R => enabled_reg_0(0)
    );
\id_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => inc_id0_return(1),
      Q => \^id_reg[1]_0\,
      R => enabled_reg_0(0)
    );
\id_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => inc_id0_return(2),
      Q => \^id_reg[2]_0\,
      R => enabled_reg_0(0)
    );
\id_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => \id[3]_i_1__1_n_0\,
      Q => \^id_reg[3]_0\,
      R => enabled_reg_0(0)
    );
m_dest_axi_bready_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => enabled_reg_1,
      I1 => \^id_reg[0]_0\,
      I2 => enabled_reg_2,
      I3 => \^id_reg[3]_0\,
      I4 => m_dest_axi_bready_INST_0_i_2_n_0,
      O => \^id_reg[0]_1\
    );
m_dest_axi_bready_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^id_reg[1]_0\,
      I1 => m_dest_axi_bready_INST_0_i_1_0,
      I2 => \^id_reg[2]_0\,
      I3 => m_dest_axi_bready_INST_0_i_1_1,
      O => m_dest_axi_bready_INST_0_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_sync_bits is
  port (
    dbg_status : out STD_LOGIC_VECTOR ( 0 to 0 );
    src_enable : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_sync_bits : entity is "sync_bits";
end system_axi_adrv9001_rx1_dma_0_sync_bits;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_sync_bits is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => src_enable,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => dbg_status(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0\ is
  port (
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    dbg_ids1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cdc_sync_stage1_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[1]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[2]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[3]\ : STD_LOGIC;
  signal \^dbg_ids1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \src_throttled_request_id[3]_i_5_n_0\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[3]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[3]\ : label is std.standard.true;
begin
  dbg_ids1(3 downto 0) <= \^dbg_ids1\(3 downto 0);
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[3]_0\(0),
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[3]_0\(1),
      Q => \cdc_sync_stage1_reg_n_0_[1]\,
      R => '0'
    );
\cdc_sync_stage1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[3]_0\(2),
      Q => \cdc_sync_stage1_reg_n_0_[2]\,
      R => '0'
    );
\cdc_sync_stage1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[3]_0\(3),
      Q => \cdc_sync_stage1_reg_n_0_[3]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \^dbg_ids1\(0),
      R => '0'
    );
\cdc_sync_stage2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[1]\,
      Q => \^dbg_ids1\(1),
      R => '0'
    );
\cdc_sync_stage2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[2]\,
      Q => \^dbg_ids1\(2),
      R => '0'
    );
\cdc_sync_stage2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[3]\,
      Q => \^dbg_ids1\(3),
      R => '0'
    );
\src_throttled_request_id[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF6FF6"
    )
        port map (
      I0 => \^dbg_ids1\(0),
      I1 => Q(0),
      I2 => \^dbg_ids1\(3),
      I3 => Q(3),
      I4 => \src_throttled_request_id[3]_i_5_n_0\,
      O => \cdc_sync_stage2_reg[0]_0\
    );
\src_throttled_request_id[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => Q(1),
      I1 => \^dbg_ids1\(1),
      I2 => Q(2),
      I3 => \^dbg_ids1\(2),
      O => \src_throttled_request_id[3]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__1\ is
  port (
    dbg_ids0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__1\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__1\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__1\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[1]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[2]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[3]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[3]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[3]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => Q(0),
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => Q(1),
      Q => \cdc_sync_stage1_reg_n_0_[1]\,
      R => '0'
    );
\cdc_sync_stage1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => Q(2),
      Q => \cdc_sync_stage1_reg_n_0_[2]\,
      R => '0'
    );
\cdc_sync_stage1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => Q(3),
      Q => \cdc_sync_stage1_reg_n_0_[3]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => dbg_ids0(0),
      R => '0'
    );
\cdc_sync_stage2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[1]\,
      Q => dbg_ids0(1),
      R => '0'
    );
\cdc_sync_stage2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[2]\,
      Q => dbg_ids0(2),
      R => '0'
    );
\cdc_sync_stage2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[3]\,
      Q => dbg_ids0(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__2\ is
  port (
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \src_throttled_request_id_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \src_throttled_request_id_reg[0]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__2\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__2\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__2\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[1]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[2]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[3]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[1]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal \src_throttled_request_id[3]_i_4_n_0\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[3]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[3]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => Q(0),
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => Q(1),
      Q => \cdc_sync_stage1_reg_n_0_[1]\,
      R => '0'
    );
\cdc_sync_stage1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => Q(2),
      Q => \cdc_sync_stage1_reg_n_0_[2]\,
      R => '0'
    );
\cdc_sync_stage1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => Q(3),
      Q => \cdc_sync_stage1_reg_n_0_[3]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[1]\,
      Q => \cdc_sync_stage2_reg_n_0_[1]\,
      R => '0'
    );
\cdc_sync_stage2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[2]\,
      Q => p_0_in0_in,
      R => '0'
    );
\cdc_sync_stage2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[3]\,
      Q => \cdc_sync_stage2_reg_n_0_[3]\,
      R => '0'
    );
\src_throttled_request_id[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF06060F0"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \src_throttled_request_id_reg[0]\(0),
      I2 => \src_throttled_request_id_reg[0]_0\,
      I3 => p_0_in0_in,
      I4 => \src_throttled_request_id_reg[0]\(2),
      I5 => \src_throttled_request_id[3]_i_4_n_0\,
      O => \cdc_sync_stage2_reg[0]_0\(0)
    );
\src_throttled_request_id[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90F0F090"
    )
        port map (
      I0 => \src_throttled_request_id_reg[0]\(3),
      I1 => \cdc_sync_stage2_reg_n_0_[3]\,
      I2 => \src_throttled_request_id_reg[0]_0\,
      I3 => \cdc_sync_stage2_reg_n_0_[1]\,
      I4 => \src_throttled_request_id_reg[0]\(1),
      O => \src_throttled_request_id[3]_i_4_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__3\ is
  port (
    response_id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    id0_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__3\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__3\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__3\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[1]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[2]\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[3]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[3]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[1]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[2]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[3]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => id0_in(0),
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => id0_in(1),
      Q => \cdc_sync_stage1_reg_n_0_[1]\,
      R => '0'
    );
\cdc_sync_stage1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => id0_in(2),
      Q => \cdc_sync_stage1_reg_n_0_[2]\,
      R => '0'
    );
\cdc_sync_stage1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => id0_in(3),
      Q => \cdc_sync_stage1_reg_n_0_[3]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => response_id(0),
      R => '0'
    );
\cdc_sync_stage2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[1]\,
      Q => response_id(1),
      R => '0'
    );
\cdc_sync_stage2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[2]\,
      Q => response_id(2),
      R => '0'
    );
\cdc_sync_stage2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[3]\,
      Q => response_id(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__1\ is
  port (
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage2_reg[0]_1\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_2\ : out STD_LOGIC;
    src_dest_valid_hs_reg : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[0]\ : in STD_LOGIC;
    src_dest_valid_hs : in STD_LOGIC;
    active0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__1\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__1\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__1\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \^cdc_sync_stage2_reg[0]_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_2 : label is "soft_lutpair53";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM of src_dest_valid_hs_i_1 : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \zerodeep.cdc_sync_fifo_ram[29]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \zerodeep.s_axis_waddr_i_1__1\ : label is "soft_lutpair53";
begin
  \cdc_sync_stage2_reg[0]_0\ <= \^cdc_sync_stage2_reg[0]_0\;
active_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^cdc_sync_stage2_reg[0]_0\,
      I1 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      O => \cdc_sync_stage2_reg[0]_1\
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \^cdc_sync_stage2_reg[0]_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
src_dest_valid_hs_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BE82"
    )
        port map (
      I0 => active0,
      I1 => \^cdc_sync_stage2_reg[0]_0\,
      I2 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      I3 => src_dest_valid_hs,
      O => \cdc_sync_stage2_reg[0]_2\
    );
\zerodeep.cdc_sync_fifo_ram[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"90"
    )
        port map (
      I0 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      I1 => \^cdc_sync_stage2_reg[0]_0\,
      I2 => src_dest_valid_hs,
      O => E(0)
    );
\zerodeep.s_axis_waddr_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"72"
    )
        port map (
      I0 => src_dest_valid_hs,
      I1 => \^cdc_sync_stage2_reg[0]_0\,
      I2 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      O => src_dest_valid_hs_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__10\ is
  port (
    src_enable : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__10\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__10\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__10\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_0\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => src_enable,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__11\ is
  port (
    dbg_status : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    enabled : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \state_reg[0]\ : in STD_LOGIC;
    \state_reg[0]_0\ : in STD_LOGIC;
    \state_reg[0]_1\ : in STD_LOGIC;
    \state_reg[0]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__11\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__11\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__11\ is
  signal \FSM_onehot_state[5]_i_2_n_0\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \^dbg_status\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
begin
  dbg_status(0) <= \^dbg_status\(0);
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFC8"
    )
        port map (
      I0 => Q(3),
      I1 => \state_reg[0]\,
      I2 => Q(1),
      I3 => \FSM_onehot_state[5]_i_2_n_0\,
      I4 => \state_reg[0]_0\,
      O => E(0)
    );
\FSM_onehot_state[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAAAAAAAAAAEAE"
    )
        port map (
      I0 => Q(0),
      I1 => Q(4),
      I2 => \state_reg[0]_1\,
      I3 => Q(2),
      I4 => \^dbg_status\(0),
      I5 => \state_reg[0]_2\(0),
      O => \FSM_onehot_state[5]_i_2_n_0\
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => enabled,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \^dbg_status\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__2\ is
  port (
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    req_ready_reg : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    dest_req_ready : in STD_LOGIC;
    \zerodeep.m_axis_raddr_reg\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__2\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__2\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__2\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \^cdc_sync_stage2_reg[0]_0\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
begin
  \cdc_sync_stage2_reg[0]_0\ <= \^cdc_sync_stage2_reg[0]_0\;
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \^cdc_sync_stage2_reg[0]_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\zerodeep.m_axis_raddr_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D8"
    )
        port map (
      I0 => dest_req_ready,
      I1 => \^cdc_sync_stage2_reg[0]_0\,
      I2 => \zerodeep.m_axis_raddr_reg\,
      O => req_ready_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__3\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_bready : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[0]\ : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__3\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__3\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__3\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of m_dest_axi_bready_INST_0 : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \zerodeep.s_axis_waddr_i_1\ : label is "soft_lutpair64";
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
m_dest_axi_bready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => \zerodeep.cdc_sync_fifo_ram_reg[0]_0\,
      I1 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      I2 => \cdc_sync_stage2_reg_n_0_[0]\,
      O => m_dest_axi_bready
    );
\zerodeep.s_axis_waddr_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8200"
    )
        port map (
      I0 => m_dest_axi_bvalid,
      I1 => \cdc_sync_stage2_reg_n_0_[0]\,
      I2 => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      I3 => \zerodeep.cdc_sync_fifo_ram_reg[0]_0\,
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__4\ is
  port (
    response_ready_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    response_dest_ready_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    response_dest_ready_reg_0 : in STD_LOGIC;
    up_response_ready : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_state_reg[1]\ : in STD_LOGIC;
    response_dest_ready : in STD_LOGIC;
    \zerodeep.m_axis_raddr_reg\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__4\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__4\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__4\ is
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  signal response_dest_valid : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of req_response_partial_i_1 : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \zerodeep.m_axis_raddr_i_1__2\ : label is "soft_lutpair65";
begin
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAEFFAEFFAAAAAA"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => Q(1),
      I2 => \FSM_sequential_state_reg[1]\,
      I3 => Q(2),
      I4 => up_response_ready,
      I5 => Q(0),
      O => D(0)
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002FF0203"
    )
        port map (
      I0 => response_dest_valid,
      I1 => Q(2),
      I2 => Q(1),
      I3 => response_dest_ready_reg_0,
      I4 => up_response_ready,
      I5 => Q(0),
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAEEEAF44"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => \FSM_sequential_state_reg[1]\,
      I3 => Q(1),
      I4 => up_response_ready,
      I5 => \FSM_sequential_state[1]_i_3_n_0\,
      O => D(1)
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000FFF0101"
    )
        port map (
      I0 => Q(2),
      I1 => response_dest_valid,
      I2 => response_dest_ready_reg_0,
      I3 => up_response_ready,
      I4 => Q(1),
      I5 => Q(0),
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
req_response_partial_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => response_dest_ready,
      I1 => \zerodeep.m_axis_raddr_reg\,
      I2 => \cdc_sync_stage2_reg_n_0_[0]\,
      O => response_dest_ready_reg(0)
    );
response_dest_ready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F000FC00F000044"
    )
        port map (
      I0 => response_dest_valid,
      I1 => response_dest_ready_reg_0,
      I2 => up_response_ready,
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => response_ready_reg
    );
response_dest_ready_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \zerodeep.m_axis_raddr_reg\,
      O => response_dest_valid
    );
\zerodeep.m_axis_raddr_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => response_dest_ready,
      I2 => \zerodeep.m_axis_raddr_reg\,
      O => \cdc_sync_stage2_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__5\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \zerodeep.s_axis_waddr_reg\ : out STD_LOGIC;
    bl_valid_reg : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \zerodeep.m_axis_raddr\ : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    \zerodeep.s_axis_waddr\ : in STD_LOGIC;
    src_bl_valid : in STD_LOGIC;
    bl_valid_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__5\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__5\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__5\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of bl_valid_i_1 : label is "soft_lutpair68";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM of \zerodeep.cdc_sync_fifo_ram[3]_i_1\ : label is "soft_lutpair68";
begin
bl_valid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF60"
    )
        port map (
      I0 => \zerodeep.s_axis_waddr\,
      I1 => \cdc_sync_stage2_reg_n_0_[0]\,
      I2 => src_bl_valid,
      I3 => bl_valid_reg_0(0),
      O => \zerodeep.s_axis_waddr_reg\
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \zerodeep.m_axis_raddr\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage2_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => \cdc_sync_stage2_reg[0]_0\(0)
    );
\zerodeep.cdc_sync_fifo_ram[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"90"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \zerodeep.s_axis_waddr\,
      I2 => src_bl_valid,
      O => E(0)
    );
\zerodeep.s_axis_waddr_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"72"
    )
        port map (
      I0 => src_bl_valid,
      I1 => \cdc_sync_stage2_reg_n_0_[0]\,
      I2 => \zerodeep.s_axis_waddr\,
      O => bl_valid_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__6\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    dest_bl_valid : out STD_LOGIC;
    bl_ready_reg : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \zerodeep.s_axis_waddr\ : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    \zerodeep.m_axis_raddr\ : in STD_LOGIC;
    dest_bl_ready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__6\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__6\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__6\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal cdc_sync_stage2 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \last_burst_len[3]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \zerodeep.m_axis_raddr_i_1\ : label is "soft_lutpair69";
begin
bl_ready_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cdc_sync_stage2,
      I1 => \zerodeep.m_axis_raddr\,
      O => dest_bl_valid
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \zerodeep.s_axis_waddr\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage2_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => cdc_sync_stage2,
      R => \cdc_sync_stage2_reg[0]_0\(0)
    );
\last_burst_len[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \zerodeep.m_axis_raddr\,
      I1 => cdc_sync_stage2,
      I2 => dest_bl_ready,
      O => E(0)
    );
\zerodeep.m_axis_raddr_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D8"
    )
        port map (
      I0 => dest_bl_ready,
      I1 => cdc_sync_stage2,
      I2 => \zerodeep.m_axis_raddr\,
      O => bl_ready_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__7\ is
  port (
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    up_dma_req_valid_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \zerodeep.s_axis_waddr_reg\ : in STD_LOGIC;
    req_gen_ready : in STD_LOGIC;
    up_dma_req_valid : in STD_LOGIC;
    \zerodeep.s_axis_waddr_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__7\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__7\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__7\ is
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \up_irq_source[0]_i_2\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \up_transfer_id[1]_i_1\ : label is "soft_lutpair75";
begin
\FSM_sequential_state[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FF7"
    )
        port map (
      I0 => up_dma_req_valid,
      I1 => req_gen_ready,
      I2 => \zerodeep.s_axis_waddr_reg\,
      I3 => \cdc_sync_stage2_reg_n_0_[0]\,
      O => up_dma_req_valid_reg
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\up_irq_source[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6FFFFFFF"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \zerodeep.s_axis_waddr_reg\,
      I2 => req_gen_ready,
      I3 => up_dma_req_valid,
      I4 => \zerodeep.s_axis_waddr_reg_0\,
      O => \cdc_sync_stage2_reg[0]_0\
    );
\up_transfer_id[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000080"
    )
        port map (
      I0 => \zerodeep.s_axis_waddr_reg_0\,
      I1 => up_dma_req_valid,
      I2 => req_gen_ready,
      I3 => \zerodeep.s_axis_waddr_reg\,
      I4 => \cdc_sync_stage2_reg_n_0_[0]\,
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__8\ is
  port (
    active0 : out STD_LOGIC;
    src_req_spltr_valid : out STD_LOGIC;
    \zerodeep.m_axis_raddr_reg\ : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]_1\ : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    \zerodeep.m_axis_raddr_reg_0\ : in STD_LOGIC;
    src_req_islast_cur_reg : in STD_LOGIC;
    src_req_islast_cur_reg_0 : in STD_LOGIC;
    src_req_ready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__8\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__8\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__8\ is
  signal \^active0\ : STD_LOGIC;
  signal \cdc_sync_stage1_reg_n_0_[0]\ : STD_LOGIC;
  signal \cdc_sync_stage2_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of active_i_3 : label is "soft_lutpair76";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
  attribute SOFT_HLUTNM of src_req_islast_cur_i_1 : label is "soft_lutpair76";
begin
  active0 <= \^active0\;
active_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \zerodeep.m_axis_raddr_reg_0\,
      O => src_req_spltr_valid
    );
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_1\,
      Q => \cdc_sync_stage1_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \cdc_sync_stage1_reg_n_0_[0]\,
      Q => \cdc_sync_stage2_reg_n_0_[0]\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
src_req_islast_cur_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"60060000"
    )
        port map (
      I0 => \cdc_sync_stage2_reg_n_0_[0]\,
      I1 => \zerodeep.m_axis_raddr_reg_0\,
      I2 => src_req_islast_cur_reg,
      I3 => src_req_islast_cur_reg_0,
      I4 => src_req_ready,
      O => \^active0\
    );
\zerodeep.m_axis_raddr_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^active0\,
      I1 => \zerodeep.m_axis_raddr_reg_0\,
      O => \zerodeep.m_axis_raddr_reg\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__9\ is
  port (
    dest_enable : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__9\ : entity is "sync_bits";
end \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__9\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__9\ is
  signal cdc_sync_stage1 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \cdc_sync_stage1_reg[0]\ : label is std.standard.true;
  attribute ASYNC_REG of \cdc_sync_stage2_reg[0]\ : label is std.standard.true;
begin
\cdc_sync_stage1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \cdc_sync_stage1_reg[0]_0\,
      Q => cdc_sync_stage1,
      R => '0'
    );
\cdc_sync_stage2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => cdc_sync_stage1,
      Q => dest_enable,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_up_axi is
  port (
    up_wreq : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    up_rreq : out STD_LOGIC;
    up_axi_rvalid_int_reg_0 : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    \up_wdata_int_reg[0]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \up_raddr_int_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \up_raddr_int_reg[0]_0\ : out STD_LOGIC;
    \up_raddr_int_reg[0]_1\ : out STD_LOGIC;
    \up_raddr_int_reg[1]_1\ : out STD_LOGIC;
    \up_raddr_int_reg[1]_2\ : out STD_LOGIC;
    \up_waddr_int_reg[5]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \up_waddr_int_reg[8]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \up_waddr_int_reg[1]_0\ : out STD_LOGIC;
    \up_waddr_int_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \up_wdata_int_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_waddr_int_reg[8]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    up_dma_cyclic : out STD_LOGIC;
    up_rreq_int_reg_0 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    up_dma_req_valid : in STD_LOGIC;
    up_dma_req_valid_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \up_irq_source_reg[0]\ : in STD_LOGIC;
    \up_rdata_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \up_rdata[1]_i_7_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_rdata[1]_i_3_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_irq_source_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_rdata_reg[1]\ : in STD_LOGIC_VECTOR ( 24 downto 0 );
    \up_rdata_reg[30]\ : in STD_LOGIC_VECTOR ( 32 downto 0 );
    \up_rdata_reg[8]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_awaddr : in STD_LOGIC_VECTOR ( 26 downto 0 );
    ADDRC : in STD_LOGIC_VECTOR ( 3 downto 0 );
    data5 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ctrl_pause : in STD_LOGIC;
    \up_rdata[1]_i_8_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dbg_status : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \up_rdata_reg[23]\ : in STD_LOGIC_VECTOR ( 22 downto 0 );
    \up_rdata_reg[10]\ : in STD_LOGIC;
    dbg_ids1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \up_rdata_reg[23]_0\ : in STD_LOGIC_VECTOR ( 16 downto 0 );
    \up_rdata_reg[9]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_rdata_reg[11]\ : in STD_LOGIC;
    \up_rdata_reg[8]_0\ : in STD_LOGIC;
    dbg_ids0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    g : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_3_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_rdata_reg[9]_0\ : in STD_LOGIC;
    \up_rdata_reg[10]_0\ : in STD_LOGIC;
    \up_rdata[8]_i_2_0\ : in STD_LOGIC;
    up_eot : in STD_LOGIC;
    up_wack : in STD_LOGIC;
    up_rack : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    \up_rdata_d_reg[31]_0\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    up_tlf_valid : in STD_LOGIC;
    \fifo._m_axis_valid\ : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_up_axi : entity is "up_axi";
end system_axi_adrv9001_rx1_dma_0_up_axi;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_up_axi is
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ctrl_enable_i_2_n_0 : STD_LOGIC;
  signal \i_regmap_request/up_dma_req_valid0\ : STD_LOGIC;
  signal \m_axis_raddr_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in7_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_5_in : STD_LOGIC;
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
  signal \up_dma_dest_address[30]_i_2_n_0\ : STD_LOGIC;
  signal \up_irq_source[1]_i_2_n_0\ : STD_LOGIC;
  signal up_rack_d : STD_LOGIC;
  signal up_rack_s : STD_LOGIC;
  signal up_raddr : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^up_raddr_int_reg[0]_0\ : STD_LOGIC;
  signal \^up_raddr_int_reg[0]_1\ : STD_LOGIC;
  signal \^up_raddr_int_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^up_raddr_int_reg[1]_1\ : STD_LOGIC;
  signal \^up_raddr_int_reg[1]_2\ : STD_LOGIC;
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
  signal \up_rdata[0]_i_10_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_11_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_12_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_13_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_14_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_15_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_16_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_8_n_0\ : STD_LOGIC;
  signal \up_rdata[0]_i_9_n_0\ : STD_LOGIC;
  signal \up_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[10]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[18]_i_8_n_0\ : STD_LOGIC;
  signal \up_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_10_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_11_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_12_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \up_rdata[1]_i_9_n_0\ : STD_LOGIC;
  signal \up_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[27]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[27]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[29]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[29]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[29]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[2]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[30]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[6]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_10_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_11_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_12_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_13_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_14_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_15_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_16_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_17_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_18_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_19_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_20_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_21_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_22_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_23_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_24_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_25_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_6_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_7_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_8_n_0\ : STD_LOGIC;
  signal \up_rdata[9]_i_9_n_0\ : STD_LOGIC;
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
  signal \up_rdata_d[31]_i_2_n_0\ : STD_LOGIC;
  signal \up_rdata_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[5]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[7]_i_1_n_0\ : STD_LOGIC;
  signal \up_rdata_d[9]_i_1_n_0\ : STD_LOGIC;
  signal \^up_rreq\ : STD_LOGIC;
  signal up_rreq_int_i_1_n_0 : STD_LOGIC;
  signal up_rsel_inv_i_1_n_0 : STD_LOGIC;
  signal up_wack_d : STD_LOGIC;
  signal up_wack_s : STD_LOGIC;
  signal up_waddr : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \up_wcount[4]_i_1_n_0\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[1]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[2]\ : STD_LOGIC;
  signal \up_wcount_reg_n_0_[3]\ : STD_LOGIC;
  signal \^up_wreq\ : STD_LOGIC;
  signal up_wreq_int_i_1_n_0 : STD_LOGIC;
  signal up_wsel_inv_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ctrl_enable_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \m_axis_raddr_reg[2]_i_6\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of up_axi_awready_int_i_2 : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of up_axi_wready_int_i_1 : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of up_dma_last_i_1 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of up_dma_req_valid_i_2 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \up_irq_mask[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \up_irq_source[1]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \up_rcount[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \up_rcount[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \up_rdata[0]_i_14\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \up_rdata[0]_i_15\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \up_rdata[0]_i_16\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \up_rdata[0]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \up_rdata[0]_i_6\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \up_rdata[10]_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \up_rdata[11]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \up_rdata[11]_i_5\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \up_rdata[14]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \up_rdata[18]_i_5\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \up_rdata[18]_i_6\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \up_rdata[18]_i_7\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \up_rdata[18]_i_8\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \up_rdata[19]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \up_rdata[1]_i_10\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \up_rdata[1]_i_11\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \up_rdata[22]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \up_rdata[26]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \up_rdata[27]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \up_rdata[28]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \up_rdata[29]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \up_rdata[29]_i_5\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \up_rdata[29]_i_6\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \up_rdata[2]_i_6\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \up_rdata[2]_i_7\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \up_rdata[30]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \up_rdata[30]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \up_rdata[30]_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \up_rdata[30]_i_5\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \up_rdata[31]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \up_rdata[31]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \up_rdata[31]_i_5\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \up_rdata[7]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \up_rdata[8]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \up_rdata[8]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_10\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_14\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_15\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_17\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_20\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_21\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_22\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_24\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_25\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \up_rdata[9]_i_5\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \up_rdata_d[0]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \up_rdata_d[10]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \up_rdata_d[11]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \up_rdata_d[12]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \up_rdata_d[14]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \up_rdata_d[15]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \up_rdata_d[16]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \up_rdata_d[18]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \up_rdata_d[19]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \up_rdata_d[21]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \up_rdata_d[23]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \up_rdata_d[25]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \up_rdata_d[26]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \up_rdata_d[27]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \up_rdata_d[28]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \up_rdata_d[2]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \up_rdata_d[30]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \up_rdata_d[31]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \up_rdata_d[3]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \up_rdata_d[5]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \up_rdata_d[7]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \up_rdata_d[9]_i_1\ : label is "soft_lutpair43";
  attribute inverted : string;
  attribute inverted of up_rsel_reg_inv : label is "yes";
  attribute SOFT_HLUTNM of \up_scratch[31]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \up_wcount[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \up_wcount[2]_i_1\ : label is "soft_lutpair23";
  attribute inverted of up_wsel_reg_inv : label is "yes";
begin
  Q(31 downto 0) <= \^q\(31 downto 0);
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_wready <= \^s_axi_wready\;
  up_axi_rvalid_int_reg_0 <= \^up_axi_rvalid_int_reg_0\;
  \up_raddr_int_reg[0]_0\ <= \^up_raddr_int_reg[0]_0\;
  \up_raddr_int_reg[0]_1\ <= \^up_raddr_int_reg[0]_1\;
  \up_raddr_int_reg[1]_0\(0) <= \^up_raddr_int_reg[1]_0\(0);
  \up_raddr_int_reg[1]_1\ <= \^up_raddr_int_reg[1]_1\;
  \up_raddr_int_reg[1]_2\ <= \^up_raddr_int_reg[1]_2\;
  up_rreq <= \^up_rreq\;
  up_wreq <= \^up_wreq\;
ctrl_enable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => up_waddr(1),
      I1 => up_waddr(5),
      I2 => up_waddr(8),
      I3 => up_waddr(0),
      I4 => ctrl_enable_i_2_n_0,
      O => \up_waddr_int_reg[1]_0\
    );
ctrl_enable_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => up_waddr(4),
      I1 => up_waddr(6),
      I2 => \^up_wreq\,
      I3 => up_waddr(7),
      I4 => up_waddr(3),
      I5 => up_waddr(2),
      O => ctrl_enable_i_2_n_0
    );
\fifo.valid_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFB0"
    )
        port map (
      I0 => \^up_raddr_int_reg[0]_0\,
      I1 => \^up_rreq\,
      I2 => up_tlf_valid,
      I3 => \fifo._m_axis_valid\,
      O => up_rreq_int_reg_0
    );
\m_axis_raddr_reg[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFFFFFFFFFF"
    )
        port map (
      I0 => up_raddr(0),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(4),
      I3 => \m_axis_raddr_reg[2]_i_6_n_0\,
      I4 => up_raddr(2),
      I5 => up_raddr(8),
      O => \^up_raddr_int_reg[0]_0\
    );
\m_axis_raddr_reg[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(6),
      I2 => up_raddr(7),
      I3 => up_raddr(3),
      O => \m_axis_raddr_reg[2]_i_6_n_0\
    );
up_axi_arready_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00C4"
    )
        port map (
      I0 => up_axi_arready_int_i_2_n_0,
      I1 => p_0_in6_in,
      I2 => up_rack,
      I3 => \^s_axi_arready\,
      O => up_axi_arready_int_i_1_n_0
    );
up_axi_arready_int_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \up_rcount_reg_n_0_[2]\,
      I1 => \up_rcount_reg_n_0_[0]\,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[3]\,
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
      R => SR(0)
    );
up_axi_awready_int_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => up_wack_s,
      I1 => \^s_axi_awready\,
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
      R => SR(0)
    );
up_axi_bvalid_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08A8"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => up_wack_d,
      I2 => \^s_axi_bvalid\,
      I3 => s_axi_bready,
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
      I0 => \^up_axi_rvalid_int_reg_0\,
      I1 => s_axi_rready,
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
      INIT => X"08A8"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => up_rack_d,
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
      INIT => X"2"
    )
        port map (
      I0 => up_wack_s,
      I1 => \^s_axi_wready\,
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
      R => SR(0)
    );
\up_dma_dest_address[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => up_waddr(5),
      I1 => up_waddr(8),
      I2 => up_waddr(0),
      I3 => up_waddr(2),
      I4 => up_waddr(1),
      I5 => \up_dma_dest_address[30]_i_2_n_0\,
      O => E(0)
    );
\up_dma_dest_address[30]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
        port map (
      I0 => up_waddr(3),
      I1 => up_waddr(7),
      I2 => \^up_wreq\,
      I3 => up_waddr(6),
      I4 => up_waddr(4),
      O => \up_dma_dest_address[30]_i_2_n_0\
    );
up_dma_last_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => up_waddr(8),
      I1 => up_waddr(5),
      I2 => up_waddr(0),
      I3 => up_waddr(1),
      I4 => ctrl_enable_i_2_n_0,
      O => up_dma_cyclic
    );
up_dma_req_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E000E000C0000000"
    )
        port map (
      I0 => \^q\(0),
      I1 => up_dma_req_valid,
      I2 => up_dma_req_valid_reg,
      I3 => s_axi_aresetn,
      I4 => \up_irq_source_reg[0]\,
      I5 => \i_regmap_request/up_dma_req_valid0\,
      O => \up_wdata_int_reg[0]_0\
    );
up_dma_req_valid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => up_waddr(1),
      I1 => up_waddr(5),
      I2 => up_waddr(8),
      I3 => up_waddr(0),
      I4 => ctrl_enable_i_2_n_0,
      O => \i_regmap_request/up_dma_req_valid0\
    );
\up_dma_src_address[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002000000"
    )
        port map (
      I0 => up_waddr(8),
      I1 => up_waddr(5),
      I2 => up_waddr(1),
      I3 => up_waddr(2),
      I4 => up_waddr(0),
      I5 => \up_dma_dest_address[30]_i_2_n_0\,
      O => \up_waddr_int_reg[8]_0\(0)
    );
\up_dma_x_length[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => up_waddr(5),
      I1 => up_waddr(8),
      I2 => up_waddr(0),
      I3 => up_waddr(1),
      I4 => up_waddr(2),
      I5 => \up_dma_dest_address[30]_i_2_n_0\,
      O => \up_waddr_int_reg[5]_0\(0)
    );
\up_irq_mask[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => ctrl_enable_i_2_n_0,
      I1 => up_waddr(8),
      I2 => up_waddr(1),
      I3 => up_waddr(5),
      I4 => up_waddr(0),
      O => \up_waddr_int_reg[8]_1\(0)
    );
\up_irq_source[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F575"
    )
        port map (
      I0 => \up_irq_source_reg[0]\,
      I1 => \^q\(0),
      I2 => \up_irq_source_reg[1]\(0),
      I3 => \up_irq_source[1]_i_2_n_0\,
      O => \up_wdata_int_reg[1]_0\(0)
    );
\up_irq_source[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FABA"
    )
        port map (
      I0 => up_eot,
      I1 => \^q\(1),
      I2 => \up_irq_source_reg[1]\(1),
      I3 => \up_irq_source[1]_i_2_n_0\,
      O => \up_wdata_int_reg[1]_0\(1)
    );
\up_irq_source[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => ctrl_enable_i_2_n_0,
      I1 => up_waddr(8),
      I2 => up_waddr(1),
      I3 => up_waddr(5),
      I4 => up_waddr(0),
      O => \up_irq_source[1]_i_2_n_0\
    );
up_rack_d_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C888888888888888"
    )
        port map (
      I0 => up_rack,
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[2]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[3]\,
      O => up_rack_s
    );
up_rack_d_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rack_s,
      Q => up_rack_d,
      R => SR(0)
    );
\up_raddr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(0),
      Q => up_raddr(0),
      R => SR(0)
    );
\up_raddr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(1),
      Q => \^up_raddr_int_reg[1]_0\(0),
      R => SR(0)
    );
\up_raddr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(2),
      Q => up_raddr(2),
      R => SR(0)
    );
\up_raddr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(3),
      Q => up_raddr(3),
      R => SR(0)
    );
\up_raddr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(4),
      Q => up_raddr(4),
      R => SR(0)
    );
\up_raddr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(5),
      Q => up_raddr(5),
      R => SR(0)
    );
\up_raddr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(6),
      Q => up_raddr(6),
      R => SR(0)
    );
\up_raddr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(7),
      Q => up_raddr(7),
      R => SR(0)
    );
\up_raddr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_1_in,
      D => s_axi_araddr(8),
      Q => up_raddr(8),
      R => SR(0)
    );
\up_rcount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => up_rack,
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[0]\,
      O => \up_rcount[0]_i_1_n_0\
    );
\up_rcount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => up_rack,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      O => \up_rcount[1]_i_1_n_0\
    );
\up_rcount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02222000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => up_rack,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      I4 => \up_rcount_reg_n_0_[2]\,
      O => \up_rcount[2]_i_1_n_0\
    );
\up_rcount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0220202020202020"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => up_rack,
      I2 => \up_rcount_reg_n_0_[3]\,
      I3 => \up_rcount_reg_n_0_[1]\,
      I4 => \up_rcount_reg_n_0_[0]\,
      I5 => \up_rcount_reg_n_0_[2]\,
      O => \up_rcount[3]_i_1_n_0\
    );
\up_rcount[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^up_rreq\,
      O => \up_rcount[4]_i_1_n_0\
    );
\up_rcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007FFFFFFFFFFF"
    )
        port map (
      I0 => \up_rcount_reg_n_0_[2]\,
      I1 => \up_rcount_reg_n_0_[0]\,
      I2 => \up_rcount_reg_n_0_[1]\,
      I3 => \up_rcount_reg_n_0_[3]\,
      I4 => up_rack,
      I5 => p_0_in6_in,
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
      R => SR(0)
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
      R => SR(0)
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
      R => SR(0)
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
      R => SR(0)
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
      R => SR(0)
    );
\up_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
        port map (
      I0 => \up_rdata[0]_i_2_n_0\,
      I1 => \up_rdata[0]_i_3_n_0\,
      I2 => \up_rdata[0]_i_4_n_0\,
      I3 => \up_rdata[0]_i_5_n_0\,
      I4 => \up_rdata[0]_i_6_n_0\,
      I5 => \up_rdata[0]_i_7_n_0\,
      O => D(0)
    );
\up_rdata[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000F00000"
    )
        port map (
      I0 => dbg_ids0(0),
      I1 => up_raddr(4),
      I2 => \up_rdata[27]_i_5_n_0\,
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => dbg_ids1(0),
      I5 => \up_rdata[2]_i_7_n_0\,
      O => \up_rdata[0]_i_10_n_0\
    );
\up_rdata[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80808080808080"
    )
        port map (
      I0 => \up_rdata[31]_i_4_n_0\,
      I1 => \up_rdata[2]_i_6_n_0\,
      I2 => \up_rdata[1]_i_3_0\(0),
      I3 => \up_rdata[0]_i_15_n_0\,
      I4 => \up_rdata[9]_i_15_n_0\,
      I5 => \up_irq_source_reg[1]\(0),
      O => \up_rdata[0]_i_11_n_0\
    );
\up_rdata[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88F8888888888888"
    )
        port map (
      I0 => data5(0),
      I1 => \up_rdata[31]_i_2_n_0\,
      I2 => \up_rdata[9]_i_11_n_0\,
      I3 => \up_rdata[0]_i_16_n_0\,
      I4 => up_dma_req_valid_reg,
      I5 => \up_rdata[9]_i_14_n_0\,
      O => \up_rdata[0]_i_12_n_0\
    );
\up_rdata[0]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F080808080808080"
    )
        port map (
      I0 => \up_rdata[9]_i_14_n_0\,
      I1 => \up_rdata[1]_i_8_0\(0),
      I2 => \up_rdata[27]_i_5_n_0\,
      I3 => up_dma_req_valid_reg,
      I4 => \up_rdata[18]_i_6_n_0\,
      I5 => \up_rdata[29]_i_6_n_0\,
      O => \up_rdata[0]_i_13_n_0\
    );
\up_rdata[0]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => up_raddr(4),
      I1 => up_raddr(0),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[0]_i_14_n_0\
    );
\up_rdata[0]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00030100"
    )
        port map (
      I0 => \up_rdata[1]_i_7_0\(0),
      I1 => up_raddr(8),
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      I4 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[0]_i_15_n_0\
    );
\up_rdata[0]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => up_raddr(3),
      I1 => up_raddr(4),
      O => \up_rdata[0]_i_16_n_0\
    );
\up_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_rdata[0]_i_8_n_0\,
      I1 => \up_rdata[0]_i_9_n_0\,
      I2 => \up_rdata[0]_i_10_n_0\,
      I3 => \up_rdata[0]_i_11_n_0\,
      I4 => \up_rdata[0]_i_12_n_0\,
      I5 => \up_rdata[0]_i_13_n_0\,
      O => \up_rdata[0]_i_2_n_0\
    );
\up_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888888888888888"
    )
        port map (
      I0 => \up_rdata_reg[31]\(0),
      I1 => \up_rdata[31]_i_5_n_0\,
      I2 => \up_rdata[0]_i_6_n_0\,
      I3 => up_dma_req_valid,
      I4 => \up_rdata[18]_i_6_n_0\,
      I5 => \up_rdata[0]_i_14_n_0\,
      O => \up_rdata[0]_i_3_n_0\
    );
\up_rdata[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0008"
    )
        port map (
      I0 => \up_rdata[18]_i_7_n_0\,
      I1 => \up_rdata[29]_i_6_n_0\,
      I2 => up_raddr(8),
      I3 => up_raddr(5),
      I4 => \up_rdata[6]_i_4_n_0\,
      O => \up_rdata[0]_i_4_n_0\
    );
\up_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \up_rdata[18]_i_6_n_0\,
      I1 => \up_irq_source_reg[1]\(0),
      I2 => \up_rdata[1]_i_7_0\(0),
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => up_raddr(0),
      I5 => up_raddr(4),
      O => \up_rdata[0]_i_5_n_0\
    );
\up_rdata[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => up_raddr(3),
      I1 => up_raddr(7),
      I2 => up_raddr(6),
      I3 => up_raddr(5),
      I4 => up_raddr(2),
      O => \up_rdata[0]_i_6_n_0\
    );
\up_rdata[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \up_rdata[6]_i_3_n_0\,
      I1 => \up_rdata[2]_i_3_n_0\,
      I2 => dbg_status(0),
      I3 => \up_rdata[8]_i_3_n_0\,
      O => \up_rdata[0]_i_7_n_0\
    );
\up_rdata[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(0),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(0),
      I4 => \^up_raddr_int_reg[0]_0\,
      I5 => \up_rdata_reg[1]\(23),
      O => \up_rdata[0]_i_8_n_0\
    );
\up_rdata[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF808080"
    )
        port map (
      I0 => \up_rdata[9]_i_15_n_0\,
      I1 => \up_rdata[29]_i_6_n_0\,
      I2 => \up_rdata[1]_i_7_0\(0),
      I3 => \up_rdata[9]_i_5_n_0\,
      I4 => \up_rdata[9]_i_13_n_0\,
      I5 => up_raddr(8),
      O => \up_rdata[0]_i_9_n_0\
    );
\up_rdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \up_rdata[10]_i_2_n_0\,
      I1 => \up_rdata[10]_i_3_n_0\,
      I2 => \up_rdata_reg[10]\,
      I3 => \up_rdata[10]_i_5_n_0\,
      O => D(10)
    );
\up_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(10),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(12),
      I4 => \up_rdata_reg[23]_0\(3),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[10]_i_2_n_0\
    );
\up_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAFFEA"
    )
        port map (
      I0 => \up_rdata[10]_i_6_n_0\,
      I1 => \^up_raddr_int_reg[0]_1\,
      I2 => up_raddr(4),
      I3 => \up_rdata[31]_i_5_n_0\,
      I4 => \^up_raddr_int_reg[1]_0\(0),
      I5 => \up_rdata[18]_i_6_n_0\,
      O => \up_rdata[10]_i_3_n_0\
    );
\up_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => \up_rdata_reg[10]_0\,
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(9),
      I4 => \up_rdata_reg[1]\(9),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[10]_i_5_n_0\
    );
\up_rdata[10]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => up_raddr(4),
      I1 => up_raddr(3),
      I2 => up_raddr(0),
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => \up_rdata[27]_i_5_n_0\,
      O => \up_rdata[10]_i_6_n_0\
    );
\up_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(10),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(10),
      I4 => \up_rdata[11]_i_3_n_0\,
      I5 => \up_rdata[11]_i_4_n_0\,
      O => D(11)
    );
\up_rdata[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      O => \^up_raddr_int_reg[1]_1\
    );
\up_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(11),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(13),
      I4 => \up_rdata_reg[23]_0\(4),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[11]_i_3_n_0\
    );
\up_rdata[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(7),
      I2 => \up_rdata[11]_i_5_n_0\,
      I3 => dbg_status(6),
      I4 => \up_rdata_reg[11]\,
      I5 => \up_rdata[27]_i_3_n_0\,
      O => \up_rdata[11]_i_4_n_0\
    );
\up_rdata[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => \^up_raddr_int_reg[0]_1\,
      O => \up_rdata[11]_i_5_n_0\
    );
\up_rdata[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \up_rdata[12]_i_2_n_0\,
      I1 => \up_rdata[12]_i_3_n_0\,
      O => D(12)
    );
\up_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(8),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(11),
      I4 => \up_rdata_reg[1]\(11),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[12]_i_2_n_0\
    );
\up_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(12),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(14),
      I4 => \up_rdata_reg[23]_0\(5),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[12]_i_3_n_0\
    );
\up_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEEE"
    )
        port map (
      I0 => \up_rdata[29]_i_4_n_0\,
      I1 => \up_rdata[13]_i_2_n_0\,
      I2 => m_dest_axi_awaddr(9),
      I3 => \up_rdata[30]_i_2_n_0\,
      I4 => \up_rdata[13]_i_3_n_0\,
      O => D(13)
    );
\up_rdata[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \up_rdata_reg[23]_0\(6),
      I1 => \up_rdata[2]_i_3_n_0\,
      I2 => \up_rdata_reg[31]\(13),
      I3 => \up_rdata[29]_i_3_n_0\,
      O => \up_rdata[13]_i_2_n_0\
    );
\up_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(12),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(12),
      I4 => \up_rdata_reg[30]\(15),
      I5 => \up_rdata[27]_i_4_n_0\,
      O => \up_rdata[13]_i_3_n_0\
    );
\up_rdata[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \up_rdata[30]_i_4_n_0\,
      I1 => \up_rdata[14]_i_2_n_0\,
      I2 => \up_rdata[14]_i_3_n_0\,
      O => D(14)
    );
\up_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_7_n_0\,
      I1 => \up_rdata_reg[31]\(14),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(16),
      I4 => \up_rdata_reg[23]_0\(7),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[14]_i_2_n_0\
    );
\up_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(10),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(13),
      I4 => \up_rdata_reg[1]\(13),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[14]_i_3_n_0\
    );
\up_rdata[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \up_rdata[15]_i_2_n_0\,
      I1 => \up_rdata[15]_i_3_n_0\,
      O => D(15)
    );
\up_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(11),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(14),
      I4 => \up_rdata_reg[1]\(14),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[15]_i_2_n_0\
    );
\up_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(15),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(17),
      I4 => \up_rdata_reg[23]_0\(8),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[15]_i_3_n_0\
    );
\up_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF8"
    )
        port map (
      I0 => \up_rdata[27]_i_4_n_0\,
      I1 => \up_rdata_reg[30]\(18),
      I2 => \up_rdata[29]_i_4_n_0\,
      I3 => \up_rdata[30]_i_4_n_0\,
      I4 => \up_rdata[16]_i_2_n_0\,
      I5 => \up_rdata[16]_i_3_n_0\,
      O => D(16)
    );
\up_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[1]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(16),
      I2 => \up_rdata[2]_i_3_n_0\,
      I3 => \up_rdata_reg[23]_0\(9),
      I4 => m_dest_axi_awaddr(12),
      I5 => \up_rdata[30]_i_2_n_0\,
      O => \up_rdata[16]_i_2_n_0\
    );
\up_rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => dbg_ids0(4),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(15),
      I4 => \up_rdata_reg[1]\(15),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[16]_i_3_n_0\
    );
\up_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEA"
    )
        port map (
      I0 => \up_rdata[17]_i_2_n_0\,
      I1 => \up_rdata_reg[30]\(19),
      I2 => \up_rdata[27]_i_4_n_0\,
      I3 => \up_rdata[29]_i_4_n_0\,
      I4 => \up_rdata[17]_i_3_n_0\,
      O => D(17)
    );
\up_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[29]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(17),
      I2 => \up_rdata[2]_i_3_n_0\,
      I3 => \up_rdata_reg[23]_0\(10),
      I4 => m_dest_axi_awaddr(13),
      I5 => \up_rdata[30]_i_2_n_0\,
      O => \up_rdata[17]_i_2_n_0\
    );
\up_rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => dbg_ids0(5),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(16),
      I4 => \up_rdata_reg[1]\(16),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[17]_i_3_n_0\
    );
\up_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \up_rdata[18]_i_2_n_0\,
      I1 => \up_rdata[18]_i_3_n_0\,
      I2 => \up_rdata[18]_i_4_n_0\,
      I3 => \up_rdata[27]_i_4_n_0\,
      I4 => \up_rdata_reg[30]\(20),
      O => D(18)
    );
\up_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(17),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(17),
      I4 => m_dest_axi_awaddr(14),
      I5 => \up_rdata[18]_i_5_n_0\,
      O => \up_rdata[18]_i_2_n_0\
    );
\up_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBAFFAAFFAA"
    )
        port map (
      I0 => \up_rdata[6]_i_4_n_0\,
      I1 => \up_rdata[18]_i_6_n_0\,
      I2 => \up_rdata[18]_i_7_n_0\,
      I3 => \up_rdata[6]_i_3_n_0\,
      I4 => \up_rdata[9]_i_5_n_0\,
      I5 => \up_rdata[18]_i_8_n_0\,
      O => \up_rdata[18]_i_3_n_0\
    );
\up_rdata[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(18),
      I2 => \up_rdata[2]_i_3_n_0\,
      I3 => \up_rdata_reg[23]_0\(11),
      I4 => dbg_ids0(6),
      I5 => \up_rdata[27]_i_3_n_0\,
      O => \up_rdata[18]_i_4_n_0\
    );
\up_rdata[18]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^up_raddr_int_reg[0]_1\,
      I1 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[18]_i_5_n_0\
    );
\up_rdata[18]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(8),
      O => \up_rdata[18]_i_6_n_0\
    );
\up_rdata[18]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => up_raddr(3),
      I1 => up_raddr(6),
      I2 => up_raddr(7),
      I3 => up_raddr(2),
      O => \up_rdata[18]_i_7_n_0\
    );
\up_rdata[18]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(0),
      I2 => up_raddr(4),
      I3 => up_raddr(8),
      O => \up_rdata[18]_i_8_n_0\
    );
\up_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEA"
    )
        port map (
      I0 => \up_rdata[19]_i_2_n_0\,
      I1 => \^up_raddr_int_reg[1]_2\,
      I2 => \up_rdata_reg[1]\(18),
      I3 => \up_rdata[30]_i_4_n_0\,
      I4 => \up_rdata[19]_i_4_n_0\,
      O => D(19)
    );
\up_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(15),
      I2 => \up_rdata[27]_i_3_n_0\,
      I3 => dbg_ids0(7),
      I4 => \up_rdata_reg[23]\(18),
      I5 => \^up_raddr_int_reg[1]_1\,
      O => \up_rdata[19]_i_2_n_0\
    );
\up_rdata[19]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      O => \^up_raddr_int_reg[1]_2\
    );
\up_rdata[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_7_n_0\,
      I1 => \up_rdata_reg[31]\(19),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(21),
      I4 => \up_rdata_reg[23]_0\(12),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[19]_i_4_n_0\
    );
\up_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
        port map (
      I0 => \up_rdata[1]_i_2_n_0\,
      I1 => \up_rdata[1]_i_3_n_0\,
      I2 => \up_rdata[1]_i_4_n_0\,
      I3 => \up_rdata_reg[31]\(1),
      I4 => \up_rdata[1]_i_5_n_0\,
      I5 => \up_rdata[1]_i_6_n_0\,
      O => D(1)
    );
\up_rdata[1]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(4),
      O => \up_rdata[1]_i_10_n_0\
    );
\up_rdata[1]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00030100"
    )
        port map (
      I0 => \up_rdata[1]_i_7_0\(1),
      I1 => up_raddr(8),
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      I4 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[1]_i_11_n_0\
    );
\up_rdata[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444400040004000"
    )
        port map (
      I0 => \up_rdata[0]_i_16_n_0\,
      I1 => \up_rdata[9]_i_14_n_0\,
      I2 => \up_rdata[9]_i_11_n_0\,
      I3 => ctrl_pause,
      I4 => \up_rdata[27]_i_5_n_0\,
      I5 => \up_rdata[1]_i_8_0\(1),
      O => \up_rdata[1]_i_12_n_0\
    );
\up_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => dbg_ids0(1),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(1),
      I4 => \up_rdata_reg[1]\(1),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[1]_i_2_n_0\
    );
\up_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFEFE"
    )
        port map (
      I0 => \up_rdata[1]_i_7_n_0\,
      I1 => \up_rdata[1]_i_8_n_0\,
      I2 => \up_rdata[1]_i_9_n_0\,
      I3 => \^up_raddr_int_reg[0]_0\,
      I4 => \up_rdata_reg[1]\(24),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[1]_i_3_n_0\
    );
\up_rdata[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00800000"
    )
        port map (
      I0 => \up_rdata[0]_i_6_n_0\,
      I1 => up_raddr(0),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => up_raddr(4),
      I4 => \up_rdata_reg[30]\(0),
      I5 => \up_rdata[29]_i_4_n_0\,
      O => \up_rdata[1]_i_4_n_0\
    );
\up_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000F20002"
    )
        port map (
      I0 => \up_rdata[1]_i_10_n_0\,
      I1 => up_raddr(2),
      I2 => up_raddr(5),
      I3 => up_raddr(8),
      I4 => \up_rdata[29]_i_6_n_0\,
      I5 => \m_axis_raddr_reg[2]_i_6_n_0\,
      O => \up_rdata[1]_i_5_n_0\
    );
\up_rdata[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_2_n_0\,
      I1 => data5(1),
      I2 => \up_rdata[11]_i_5_n_0\,
      I3 => dbg_status(1),
      I4 => dbg_ids1(1),
      I5 => \up_rdata[26]_i_2_n_0\,
      O => \up_rdata[1]_i_6_n_0\
    );
\up_rdata[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAAAAAEAEAAAAA"
    )
        port map (
      I0 => \up_rdata[30]_i_4_n_0\,
      I1 => \up_rdata[1]_i_7_0\(1),
      I2 => \up_rdata[18]_i_8_n_0\,
      I3 => \up_rdata[1]_i_11_n_0\,
      I4 => \up_rdata[9]_i_15_n_0\,
      I5 => \up_irq_source_reg[1]\(1),
      O => \up_rdata[1]_i_7_n_0\
    );
\up_rdata[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEAAAAAAAAAAA"
    )
        port map (
      I0 => \up_rdata[1]_i_12_n_0\,
      I1 => \up_rdata[31]_i_4_n_0\,
      I2 => up_raddr(0),
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => up_raddr(4),
      I5 => \up_rdata[1]_i_3_0\(1),
      O => \up_rdata[1]_i_8_n_0\
    );
\up_rdata[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80808C8000000000"
    )
        port map (
      I0 => ctrl_pause,
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => \up_rdata[18]_i_6_n_0\,
      I3 => \up_irq_source_reg[1]\(1),
      I4 => \up_rdata[1]_i_7_0\(1),
      I5 => \up_rdata[29]_i_6_n_0\,
      O => \up_rdata[1]_i_9_n_0\
    );
\up_rdata[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \up_rdata[20]_i_2_n_0\,
      I1 => \up_rdata[20]_i_3_n_0\,
      O => D(20)
    );
\up_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(16),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(19),
      I4 => \up_rdata_reg[1]\(19),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[20]_i_2_n_0\
    );
\up_rdata[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(20),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(22),
      I4 => \up_rdata_reg[23]_0\(13),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[20]_i_3_n_0\
    );
\up_rdata[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \up_rdata[21]_i_2_n_0\,
      I1 => \up_rdata[21]_i_3_n_0\,
      O => D(21)
    );
\up_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(17),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(20),
      I4 => \up_rdata_reg[1]\(20),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[21]_i_2_n_0\
    );
\up_rdata[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(21),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(23),
      I4 => \up_rdata_reg[23]_0\(14),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[21]_i_3_n_0\
    );
\up_rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \up_rdata[30]_i_4_n_0\,
      I1 => \up_rdata[22]_i_2_n_0\,
      I2 => \up_rdata[22]_i_3_n_0\,
      O => D(22)
    );
\up_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_7_n_0\,
      I1 => \up_rdata_reg[31]\(22),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(24),
      I4 => \up_rdata_reg[23]_0\(15),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[22]_i_2_n_0\
    );
\up_rdata[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(18),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(21),
      I4 => \up_rdata_reg[1]\(21),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[22]_i_3_n_0\
    );
\up_rdata[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \up_rdata[23]_i_2_n_0\,
      I1 => \up_rdata[23]_i_3_n_0\,
      O => D(23)
    );
\up_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(19),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(22),
      I4 => \up_rdata_reg[1]\(22),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[23]_i_2_n_0\
    );
\up_rdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(23),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(25),
      I4 => \up_rdata_reg[23]_0\(16),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[23]_i_3_n_0\
    );
\up_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \up_rdata[24]_i_2_n_0\,
      I1 => \up_rdata[26]_i_2_n_0\,
      I2 => g(0),
      I3 => ADDRC(0),
      I4 => \up_rdata[27]_i_3_n_0\,
      O => D(24)
    );
\up_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(24),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(26),
      I4 => m_dest_axi_awaddr(20),
      I5 => \up_rdata[30]_i_2_n_0\,
      O => \up_rdata[24]_i_2_n_0\
    );
\up_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \up_rdata[25]_i_2_n_0\,
      I1 => \up_rdata[26]_i_2_n_0\,
      I2 => g(1),
      I3 => ADDRC(1),
      I4 => \up_rdata[27]_i_3_n_0\,
      O => D(25)
    );
\up_rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(25),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(27),
      I4 => m_dest_axi_awaddr(21),
      I5 => \up_rdata[30]_i_2_n_0\,
      O => \up_rdata[25]_i_2_n_0\
    );
\up_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF888"
    )
        port map (
      I0 => \up_rdata[26]_i_2_n_0\,
      I1 => g(2),
      I2 => \up_rdata[27]_i_3_n_0\,
      I3 => ADDRC(2),
      I4 => \up_rdata[30]_i_4_n_0\,
      I5 => \up_rdata[26]_i_3_n_0\,
      O => D(26)
    );
\up_rdata[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => up_raddr(0),
      I3 => up_raddr(3),
      I4 => up_raddr(4),
      O => \up_rdata[26]_i_2_n_0\
    );
\up_rdata[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_7_n_0\,
      I1 => \up_rdata_reg[31]\(26),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(28),
      I4 => m_dest_axi_awaddr(22),
      I5 => \up_rdata[30]_i_2_n_0\,
      O => \up_rdata[26]_i_3_n_0\
    );
\up_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEAFFEAFFEA"
    )
        port map (
      I0 => \up_rdata[27]_i_2_n_0\,
      I1 => \up_rdata[27]_i_3_n_0\,
      I2 => ADDRC(3),
      I3 => \up_rdata[29]_i_4_n_0\,
      I4 => \up_rdata[27]_i_4_n_0\,
      I5 => \up_rdata_reg[30]\(29),
      O => D(27)
    );
\up_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[29]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(27),
      I2 => \up_rdata[30]_i_2_n_0\,
      I3 => m_dest_axi_awaddr(23),
      I4 => g(3),
      I5 => \up_rdata[26]_i_2_n_0\,
      O => \up_rdata[27]_i_2_n_0\
    );
\up_rdata[27]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44040000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => up_raddr(0),
      I3 => up_raddr(3),
      I4 => up_raddr(4),
      O => \up_rdata[27]_i_3_n_0\
    );
\up_rdata[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(6),
      I2 => up_raddr(7),
      I3 => up_raddr(3),
      I4 => up_raddr(2),
      I5 => \up_rdata[29]_i_6_n_0\,
      O => \up_rdata[27]_i_4_n_0\
    );
\up_rdata[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(5),
      I2 => up_raddr(6),
      I3 => up_raddr(7),
      I4 => up_raddr(3),
      I5 => up_raddr(8),
      O => \up_rdata[27]_i_5_n_0\
    );
\up_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \up_rdata[28]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(24),
      I2 => \up_rdata[30]_i_2_n_0\,
      I3 => \up_rdata_reg[31]\(28),
      I4 => \up_rdata[29]_i_3_n_0\,
      I5 => \up_rdata[29]_i_4_n_0\,
      O => D(28)
    );
\up_rdata[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata[27]_i_4_n_0\,
      I1 => \up_rdata_reg[30]\(30),
      O => \up_rdata[28]_i_2_n_0\
    );
\up_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \up_rdata[29]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(25),
      I2 => \up_rdata[30]_i_2_n_0\,
      I3 => \up_rdata_reg[31]\(29),
      I4 => \up_rdata[29]_i_3_n_0\,
      I5 => \up_rdata[29]_i_4_n_0\,
      O => D(29)
    );
\up_rdata[29]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata[27]_i_4_n_0\,
      I1 => \up_rdata_reg[30]\(31),
      O => \up_rdata[29]_i_2_n_0\
    );
\up_rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000C00"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(5),
      I2 => up_raddr(8),
      I3 => \up_rdata[29]_i_5_n_0\,
      I4 => \^up_raddr_int_reg[1]_0\(0),
      I5 => \m_axis_raddr_reg[2]_i_6_n_0\,
      O => \up_rdata[29]_i_3_n_0\
    );
\up_rdata[29]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \up_rdata[9]_i_5_n_0\,
      I1 => up_raddr(8),
      I2 => \up_rdata[29]_i_6_n_0\,
      O => \up_rdata[29]_i_4_n_0\
    );
\up_rdata[29]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => up_raddr(0),
      I1 => up_raddr(4),
      O => \up_rdata[29]_i_5_n_0\
    );
\up_rdata[29]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => up_raddr(4),
      I1 => up_raddr(0),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[29]_i_6_n_0\
    );
\up_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \up_rdata[2]_i_2_n_0\,
      I1 => \up_rdata[2]_i_3_n_0\,
      I2 => \up_rdata[10]_i_3_n_0\,
      I3 => \up_rdata[2]_i_4_n_0\,
      I4 => \up_rdata[2]_i_5_n_0\,
      O => D(2)
    );
\up_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(2),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(2),
      I4 => dbg_status(2),
      I5 => \up_rdata[8]_i_3_n_0\,
      O => \up_rdata[2]_i_2_n_0\
    );
\up_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(0),
      I2 => up_raddr(4),
      I3 => \m_axis_raddr_reg[2]_i_6_n_0\,
      I4 => up_raddr(2),
      I5 => up_raddr(8),
      O => \up_rdata[2]_i_3_n_0\
    );
\up_rdata[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808080F08080"
    )
        port map (
      I0 => \up_rdata[2]_i_6_n_0\,
      I1 => p_3_in(0),
      I2 => \up_rdata[27]_i_5_n_0\,
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => dbg_ids1(2),
      I5 => \up_rdata[2]_i_7_n_0\,
      O => \up_rdata[2]_i_4_n_0\
    );
\up_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(2),
      I2 => \up_rdata[31]_i_2_n_0\,
      I3 => data5(2),
      I4 => dbg_ids0(2),
      I5 => \up_rdata[27]_i_3_n_0\,
      O => \up_rdata[2]_i_5_n_0\
    );
\up_rdata[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(0),
      O => \up_rdata[2]_i_6_n_0\
    );
\up_rdata[2]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9F"
    )
        port map (
      I0 => up_raddr(4),
      I1 => up_raddr(3),
      I2 => up_raddr(0),
      O => \up_rdata[2]_i_7_n_0\
    );
\up_rdata[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(26),
      I2 => \up_rdata[30]_i_3_n_0\,
      I3 => \up_rdata[30]_i_4_n_0\,
      O => D(30)
    );
\up_rdata[30]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => \^up_raddr_int_reg[0]_1\,
      O => \up_rdata[30]_i_2_n_0\
    );
\up_rdata[30]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \up_rdata_reg[30]\(32),
      I1 => \up_rdata[30]_i_6_n_0\,
      I2 => \up_rdata_reg[31]\(30),
      I3 => \up_rdata[30]_i_7_n_0\,
      O => \up_rdata[30]_i_3_n_0\
    );
\up_rdata[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => \up_rdata[0]_i_6_n_0\,
      I1 => up_raddr(8),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => up_raddr(4),
      I4 => up_raddr(0),
      O => \up_rdata[30]_i_4_n_0\
    );
\up_rdata[30]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
        port map (
      I0 => \up_rdata[9]_i_11_n_0\,
      I1 => up_raddr(0),
      I2 => up_raddr(3),
      I3 => up_raddr(4),
      O => \^up_raddr_int_reg[0]_1\
    );
\up_rdata[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(0),
      I2 => up_raddr(4),
      I3 => \m_axis_raddr_reg[2]_i_6_n_0\,
      I4 => up_raddr(2),
      I5 => up_raddr(8),
      O => \up_rdata[30]_i_6_n_0\
    );
\up_rdata[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000041400000000"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(5),
      I3 => up_raddr(0),
      I4 => up_raddr(8),
      I5 => \up_rdata[0]_i_6_n_0\,
      O => \up_rdata[30]_i_7_n_0\
    );
\up_rdata[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => data5(4),
      I1 => \up_rdata[31]_i_2_n_0\,
      I2 => \up_rdata_reg[31]\(31),
      I3 => \up_rdata[31]_i_3_n_0\,
      O => D(31)
    );
\up_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \up_rdata[31]_i_4_n_0\,
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(0),
      I3 => up_raddr(4),
      O => \up_rdata[31]_i_2_n_0\
    );
\up_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8228"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(5),
      I3 => up_raddr(8),
      O => \up_rdata[31]_i_3_n_0\
    );
\up_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(8),
      I2 => up_raddr(7),
      I3 => up_raddr(6),
      I4 => up_raddr(5),
      I5 => up_raddr(3),
      O => \up_rdata[31]_i_4_n_0\
    );
\up_rdata[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => up_raddr(8),
      I1 => \up_rdata[0]_i_6_n_0\,
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      O => \up_rdata[31]_i_5_n_0\
    );
\up_rdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \up_rdata[3]_i_2_n_0\,
      I1 => \up_rdata[3]_i_3_n_0\,
      I2 => \up_rdata[3]_i_4_n_0\,
      O => D(3)
    );
\up_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(3),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(5),
      I4 => \up_rdata_reg[30]\(1),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[3]_i_2_n_0\
    );
\up_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_2_n_0\,
      I1 => data5(3),
      I2 => \up_rdata[30]_i_2_n_0\,
      I3 => m_dest_axi_awaddr(0),
      I4 => dbg_ids1(3),
      I5 => \up_rdata[26]_i_2_n_0\,
      O => \up_rdata[3]_i_3_n_0\
    );
\up_rdata[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => dbg_ids0(3),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(3),
      I4 => \up_rdata_reg[1]\(3),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[3]_i_4_n_0\
    );
\up_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFEFE"
    )
        port map (
      I0 => \up_rdata[4]_i_2_n_0\,
      I1 => \up_rdata[4]_i_3_n_0\,
      I2 => \up_rdata[7]_i_2_n_0\,
      I3 => \^up_raddr_int_reg[1]_2\,
      I4 => \up_rdata_reg[1]\(4),
      O => D(4)
    );
\up_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(4),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(6),
      I4 => \up_rdata_reg[30]\(2),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[4]_i_2_n_0\
    );
\up_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(1),
      I2 => \up_rdata[11]_i_5_n_0\,
      I3 => dbg_status(3),
      I4 => \up_rdata_reg[23]\(4),
      I5 => \^up_raddr_int_reg[1]_1\,
      O => \up_rdata[4]_i_3_n_0\
    );
\up_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \up_rdata[5]_i_2_n_0\,
      I1 => dbg_status(4),
      I2 => \up_rdata[8]_i_3_n_0\,
      I3 => \up_rdata[7]_i_2_n_0\,
      I4 => \up_rdata[10]_i_3_n_0\,
      I5 => \up_rdata[5]_i_3_n_0\,
      O => D(5)
    );
\up_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_1\,
      I1 => \up_rdata_reg[23]\(5),
      I2 => \^up_raddr_int_reg[1]_2\,
      I3 => \up_rdata_reg[1]\(5),
      I4 => m_dest_axi_awaddr(2),
      I5 => \up_rdata[18]_i_5_n_0\,
      O => \up_rdata[5]_i_2_n_0\
    );
\up_rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(5),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(7),
      I4 => \up_rdata_reg[30]\(3),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[5]_i_3_n_0\
    );
\up_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \up_rdata[6]_i_2_n_0\,
      I1 => \up_rdata[6]_i_3_n_0\,
      I2 => \up_rdata[6]_i_4_n_0\,
      I3 => \up_rdata[6]_i_5_n_0\,
      I4 => \up_rdata[6]_i_6_n_0\,
      O => D(6)
    );
\up_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_6_n_0\,
      I1 => \up_rdata_reg[30]\(8),
      I2 => \up_rdata[2]_i_3_n_0\,
      I3 => \up_rdata_reg[30]\(4),
      I4 => \up_rdata_reg[23]\(6),
      I5 => \^up_raddr_int_reg[1]_1\,
      O => \up_rdata[6]_i_2_n_0\
    );
\up_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00080C0000000000"
    )
        port map (
      I0 => up_raddr(3),
      I1 => up_raddr(0),
      I2 => up_raddr(4),
      I3 => \^up_raddr_int_reg[1]_0\(0),
      I4 => up_raddr(8),
      I5 => \up_rdata[0]_i_6_n_0\,
      O => \up_rdata[6]_i_3_n_0\
    );
\up_rdata[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(8),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => \up_rdata[0]_i_6_n_0\,
      I4 => up_raddr(4),
      I5 => \^up_raddr_int_reg[0]_1\,
      O => \up_rdata[6]_i_4_n_0\
    );
\up_rdata[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBAAABAAABAAA"
    )
        port map (
      I0 => \up_rdata[7]_i_2_n_0\,
      I1 => \up_rdata[18]_i_6_n_0\,
      I2 => \up_rdata[29]_i_6_n_0\,
      I3 => \up_rdata[6]_i_7_n_0\,
      I4 => \up_rdata_reg[31]\(6),
      I5 => \up_rdata[31]_i_5_n_0\,
      O => \up_rdata[6]_i_5_n_0\
    );
\up_rdata[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF888888F8F88888"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_2\,
      I1 => \up_rdata_reg[1]\(6),
      I2 => m_dest_axi_awaddr(3),
      I3 => dbg_status(5),
      I4 => \^up_raddr_int_reg[0]_1\,
      I5 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[6]_i_6_n_0\
    );
\up_rdata[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(5),
      I2 => up_raddr(6),
      I3 => up_raddr(7),
      I4 => up_raddr(3),
      I5 => up_raddr(8),
      O => \up_rdata[6]_i_7_n_0\
    );
\up_rdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \up_rdata[7]_i_2_n_0\,
      I1 => \up_rdata[7]_i_3_n_0\,
      I2 => \up_rdata[7]_i_4_n_0\,
      O => D(7)
    );
\up_rdata[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => up_raddr(8),
      I1 => up_raddr(4),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => up_raddr(0),
      I4 => \up_rdata[9]_i_5_n_0\,
      O => \up_rdata[7]_i_2_n_0\
    );
\up_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(7),
      I2 => \up_rdata[30]_i_6_n_0\,
      I3 => \up_rdata_reg[30]\(9),
      I4 => \up_rdata_reg[23]_0\(0),
      I5 => \up_rdata[2]_i_3_n_0\,
      O => \up_rdata[7]_i_3_n_0\
    );
\up_rdata[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[30]_i_2_n_0\,
      I1 => m_dest_axi_awaddr(4),
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(7),
      I4 => \up_rdata_reg[1]\(7),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[7]_i_4_n_0\
    );
\up_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEEFEEE"
    )
        port map (
      I0 => \up_rdata[8]_i_2_n_0\,
      I1 => \up_rdata[18]_i_3_n_0\,
      I2 => \up_rdata_reg[30]\(10),
      I3 => \up_rdata[27]_i_4_n_0\,
      I4 => \up_rdata_reg[8]\(0),
      I5 => \up_rdata[8]_i_3_n_0\,
      O => D(8)
    );
\up_rdata[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF40"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => \^up_raddr_int_reg[0]_1\,
      I2 => m_dest_axi_awaddr(5),
      I3 => \up_rdata_reg[8]_0\,
      I4 => \up_rdata[8]_i_5_n_0\,
      O => \up_rdata[8]_i_2_n_0\
    );
\up_rdata[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^up_raddr_int_reg[0]_1\,
      I1 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[8]_i_3_n_0\
    );
\up_rdata[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[31]_i_5_n_0\,
      I1 => \up_rdata_reg[31]\(8),
      I2 => \up_rdata[2]_i_3_n_0\,
      I3 => \up_rdata_reg[23]_0\(1),
      I4 => \up_rdata[8]_i_2_0\,
      I5 => \up_rdata[27]_i_3_n_0\,
      O => \up_rdata[8]_i_5_n_0\
    );
\up_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => \up_rdata[9]_i_2_n_0\,
      I1 => \up_rdata[9]_i_3_n_0\,
      I2 => \up_rdata[9]_i_4_n_0\,
      I3 => \up_rdata[9]_i_5_n_0\,
      I4 => \up_rdata[9]_i_6_n_0\,
      I5 => \up_rdata[9]_i_7_n_0\,
      O => D(9)
    );
\up_rdata[9]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata[30]_i_6_n_0\,
      I1 => \up_rdata_reg[30]\(11),
      O => \up_rdata[9]_i_10_n_0\
    );
\up_rdata[9]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => up_raddr(7),
      I1 => up_raddr(6),
      I2 => up_raddr(5),
      I3 => up_raddr(3),
      I4 => up_raddr(8),
      I5 => up_raddr(2),
      O => \up_rdata[9]_i_11_n_0\
    );
\up_rdata[9]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF4"
    )
        port map (
      I0 => \m_axis_raddr_reg[2]_i_6_n_0\,
      I1 => \up_rdata[9]_i_21_n_0\,
      I2 => \up_rdata[9]_i_19_n_0\,
      I3 => \up_rdata[9]_i_18_n_0\,
      I4 => \up_rdata[9]_i_22_n_0\,
      I5 => \up_rdata[9]_i_23_n_0\,
      O => \up_rdata[9]_i_12_n_0\
    );
\up_rdata[9]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(4),
      O => \up_rdata[9]_i_13_n_0\
    );
\up_rdata[9]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(0),
      O => \up_rdata[9]_i_14_n_0\
    );
\up_rdata[9]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(7),
      I2 => up_raddr(6),
      I3 => up_raddr(3),
      I4 => up_raddr(5),
      O => \up_rdata[9]_i_15_n_0\
    );
\up_rdata[9]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02020202FF020202"
    )
        port map (
      I0 => \up_rdata[27]_i_5_n_0\,
      I1 => \up_rdata[2]_i_7_n_0\,
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => \up_rdata[18]_i_7_n_0\,
      I4 => \up_rdata[29]_i_5_n_0\,
      I5 => up_raddr(8),
      O => \up_rdata[9]_i_16_n_0\
    );
\up_rdata[9]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888888"
    )
        port map (
      I0 => \up_rdata[9]_i_24_n_0\,
      I1 => \up_rdata[9]_i_25_n_0\,
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => \up_rdata[27]_i_5_n_0\,
      I4 => up_raddr(4),
      O => \up_rdata[9]_i_17_n_0\
    );
\up_rdata[9]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0009000000000000"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(8),
      I2 => up_raddr(4),
      I3 => up_raddr(0),
      I4 => \^up_raddr_int_reg[1]_0\(0),
      I5 => \up_rdata[0]_i_6_n_0\,
      O => \up_rdata[9]_i_18_n_0\
    );
\up_rdata[9]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \up_rdata[18]_i_6_n_0\,
      I1 => \up_rdata[29]_i_6_n_0\,
      I2 => up_raddr(2),
      I3 => up_raddr(7),
      I4 => up_raddr(6),
      I5 => up_raddr(3),
      O => \up_rdata[9]_i_19_n_0\
    );
\up_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88F8F888"
    )
        port map (
      I0 => \up_rdata[31]_i_3_n_0\,
      I1 => \up_rdata_reg[31]\(9),
      I2 => \up_rdata[30]_i_4_n_0\,
      I3 => \up_rdata[9]_i_8_n_0\,
      I4 => \up_rdata[9]_i_9_n_0\,
      I5 => \up_rdata[9]_i_10_n_0\,
      O => \up_rdata[9]_i_2_n_0\
    );
\up_rdata[9]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => up_raddr(8),
      I1 => up_raddr(4),
      I2 => \^up_raddr_int_reg[1]_0\(0),
      I3 => up_raddr(0),
      I4 => \m_axis_raddr_reg[2]_i_6_n_0\,
      O => \up_rdata[9]_i_20_n_0\
    );
\up_rdata[9]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => up_raddr(0),
      I1 => \^up_raddr_int_reg[1]_0\(0),
      I2 => up_raddr(4),
      I3 => up_raddr(8),
      O => \up_rdata[9]_i_21_n_0\
    );
\up_rdata[9]_i_22\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => up_raddr(4),
      I1 => \up_rdata[27]_i_5_n_0\,
      I2 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[9]_i_22_n_0\
    );
\up_rdata[9]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => \^up_raddr_int_reg[1]_0\(0),
      I1 => up_raddr(4),
      I2 => up_raddr(2),
      I3 => up_raddr(8),
      I4 => up_raddr(5),
      I5 => \up_rdata[9]_i_24_n_0\,
      O => \up_rdata[9]_i_23_n_0\
    );
\up_rdata[9]_i_24\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => up_raddr(7),
      I1 => up_raddr(6),
      I2 => up_raddr(3),
      O => \up_rdata[9]_i_24_n_0\
    );
\up_rdata[9]_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => up_raddr(5),
      I1 => up_raddr(8),
      I2 => up_raddr(2),
      I3 => up_raddr(4),
      I4 => \^up_raddr_int_reg[1]_0\(0),
      O => \up_rdata[9]_i_25_n_0\
    );
\up_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \up_rdata[2]_i_3_n_0\,
      I1 => \up_rdata_reg[23]_0\(2),
      I2 => \up_rdata[30]_i_2_n_0\,
      I3 => m_dest_axi_awaddr(6),
      I4 => \up_rdata_reg[9]\(0),
      I5 => \up_rdata[11]_i_5_n_0\,
      O => \up_rdata[9]_i_3_n_0\
    );
\up_rdata[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0015554000000000"
    )
        port map (
      I0 => up_raddr(8),
      I1 => up_raddr(0),
      I2 => \up_rdata[9]_i_11_n_0\,
      I3 => \up_rdata[9]_i_12_n_0\,
      I4 => \up_rdata[9]_i_8_n_0\,
      I5 => \up_rdata[9]_i_13_n_0\,
      O => \up_rdata[9]_i_4_n_0\
    );
\up_rdata[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => up_raddr(2),
      I1 => up_raddr(3),
      I2 => up_raddr(7),
      I3 => up_raddr(6),
      I4 => up_raddr(5),
      O => \up_rdata[9]_i_5_n_0\
    );
\up_rdata[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07F8000000000000"
    )
        port map (
      I0 => \up_rdata[9]_i_14_n_0\,
      I1 => \up_rdata[9]_i_11_n_0\,
      I2 => \up_rdata[9]_i_12_n_0\,
      I3 => \up_rdata[9]_i_8_n_0\,
      I4 => \up_rdata[18]_i_8_n_0\,
      I5 => \up_rdata[9]_i_15_n_0\,
      O => \up_rdata[9]_i_6_n_0\
    );
\up_rdata[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \up_rdata[27]_i_3_n_0\,
      I1 => \up_rdata_reg[9]_0\,
      I2 => \^up_raddr_int_reg[1]_1\,
      I3 => \up_rdata_reg[23]\(8),
      I4 => \up_rdata_reg[1]\(8),
      I5 => \^up_raddr_int_reg[1]_2\,
      O => \up_rdata[9]_i_7_n_0\
    );
\up_rdata[9]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF04"
    )
        port map (
      I0 => up_raddr(8),
      I1 => \up_rdata[29]_i_6_n_0\,
      I2 => \m_axis_raddr_reg[2]_i_6_n_0\,
      I3 => \^up_raddr_int_reg[0]_1\,
      I4 => \up_rdata[9]_i_16_n_0\,
      O => \up_rdata[9]_i_8_n_0\
    );
\up_rdata[9]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFE"
    )
        port map (
      I0 => \up_rdata[9]_i_17_n_0\,
      I1 => \up_rdata[9]_i_18_n_0\,
      I2 => \up_rdata[9]_i_19_n_0\,
      I3 => \up_rdata[9]_i_20_n_0\,
      I4 => \up_rdata[9]_i_11_n_0\,
      I5 => \up_rdata[9]_i_14_n_0\,
      O => \up_rdata[9]_i_9_n_0\
    );
\up_rdata_d[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(0),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[0]_i_1_n_0\
    );
\up_rdata_d[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(10),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[10]_i_1_n_0\
    );
\up_rdata_d[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(11),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[11]_i_1_n_0\
    );
\up_rdata_d[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(12),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[12]_i_1_n_0\
    );
\up_rdata_d[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(14),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[14]_i_1_n_0\
    );
\up_rdata_d[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(15),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[15]_i_1_n_0\
    );
\up_rdata_d[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(16),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[16]_i_1_n_0\
    );
\up_rdata_d[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(18),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[18]_i_1_n_0\
    );
\up_rdata_d[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(19),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[19]_i_1_n_0\
    );
\up_rdata_d[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(21),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[21]_i_1_n_0\
    );
\up_rdata_d[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(23),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[23]_i_1_n_0\
    );
\up_rdata_d[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(25),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[25]_i_1_n_0\
    );
\up_rdata_d[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(26),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[26]_i_1_n_0\
    );
\up_rdata_d[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(27),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[27]_i_1_n_0\
    );
\up_rdata_d[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(28),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[28]_i_1_n_0\
    );
\up_rdata_d[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80000000FFFFFFFF"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \up_rcount_reg_n_0_[2]\,
      I2 => \up_rcount_reg_n_0_[0]\,
      I3 => \up_rcount_reg_n_0_[1]\,
      I4 => \up_rcount_reg_n_0_[3]\,
      I5 => s_axi_aresetn,
      O => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(2),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[2]_i_1_n_0\
    );
\up_rdata_d[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(30),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[30]_i_1_n_0\
    );
\up_rdata_d[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => p_0_in6_in,
      I2 => \up_rcount_reg_n_0_[2]\,
      I3 => \up_rcount_reg_n_0_[0]\,
      I4 => \up_rcount_reg_n_0_[1]\,
      I5 => \up_rcount_reg_n_0_[3]\,
      O => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(31),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[31]_i_2_n_0\
    );
\up_rdata_d[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(3),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[3]_i_1_n_0\
    );
\up_rdata_d[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(5),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[5]_i_1_n_0\
    );
\up_rdata_d[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(7),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[7]_i_1_n_0\
    );
\up_rdata_d[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \up_rdata_d_reg[31]_0\(9),
      I1 => s_axi_aresetn,
      O => \up_rdata_d[9]_i_1_n_0\
    );
\up_rdata_d_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[0]_i_1_n_0\,
      Q => up_rdata_d(0),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[10]_i_1_n_0\,
      Q => up_rdata_d(10),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[11]_i_1_n_0\,
      Q => up_rdata_d(11),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[12]_i_1_n_0\,
      Q => up_rdata_d(12),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(13),
      Q => up_rdata_d(13),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[14]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[14]_i_1_n_0\,
      Q => up_rdata_d(14),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[15]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[15]_i_1_n_0\,
      Q => up_rdata_d(15),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[16]_i_1_n_0\,
      Q => up_rdata_d(16),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(17),
      Q => up_rdata_d(17),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[18]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[18]_i_1_n_0\,
      Q => up_rdata_d(18),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[19]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[19]_i_1_n_0\,
      Q => up_rdata_d(19),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(1),
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
      D => \up_rdata_d_reg[31]_0\(20),
      Q => up_rdata_d(20),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[21]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[21]_i_1_n_0\,
      Q => up_rdata_d(21),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(22),
      Q => up_rdata_d(22),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[23]_i_1_n_0\,
      Q => up_rdata_d(23),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(24),
      Q => up_rdata_d(24),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[25]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[25]_i_1_n_0\,
      Q => up_rdata_d(25),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[26]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[26]_i_1_n_0\,
      Q => up_rdata_d(26),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[27]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[27]_i_1_n_0\,
      Q => up_rdata_d(27),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[28]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[28]_i_1_n_0\,
      Q => up_rdata_d(28),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(29),
      Q => up_rdata_d(29),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[2]_i_1_n_0\,
      Q => up_rdata_d(2),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[30]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[30]_i_1_n_0\,
      Q => up_rdata_d(30),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[31]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[31]_i_2_n_0\,
      Q => up_rdata_d(31),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[3]_i_1_n_0\,
      Q => up_rdata_d(3),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(4),
      Q => up_rdata_d(4),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[5]_i_1_n_0\,
      Q => up_rdata_d(5),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(6),
      Q => up_rdata_d(6),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[7]_i_1_n_0\,
      Q => up_rdata_d(7),
      S => \up_rdata_d[31]_i_1_n_0\
    );
\up_rdata_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d_reg[31]_0\(8),
      Q => up_rdata_d(8),
      R => \up_rdata_d[29]_i_1_n_0\
    );
\up_rdata_d_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_rdata_d[9]_i_1_n_0\,
      Q => up_rdata_d(9),
      S => \up_rdata_d[31]_i_1_n_0\
    );
up_rreq_int_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_aresetn,
      I2 => p_1_in,
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
      Q => \^up_rreq\,
      R => '0'
    );
up_rsel_inv_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55C0"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \^up_axi_rvalid_int_reg_0\,
      I2 => s_axi_rready,
      I3 => p_1_in,
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
      Q => p_1_in,
      S => SR(0)
    );
\up_scratch[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => up_waddr(0),
      I1 => up_waddr(1),
      I2 => up_waddr(5),
      I3 => up_waddr(8),
      I4 => ctrl_enable_i_2_n_0,
      O => \up_waddr_int_reg[0]_0\(0)
    );
up_wack_d_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000000000"
    )
        port map (
      I0 => \up_wcount_reg_n_0_[2]\,
      I1 => \up_wcount_reg_n_0_[0]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => \up_wcount_reg_n_0_[3]\,
      I4 => up_wack,
      I5 => p_0_in7_in,
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
      R => SR(0)
    );
\up_waddr_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(0),
      Q => up_waddr(0),
      R => SR(0)
    );
\up_waddr_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(1),
      Q => up_waddr(1),
      R => SR(0)
    );
\up_waddr_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(2),
      Q => up_waddr(2),
      R => SR(0)
    );
\up_waddr_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(3),
      Q => up_waddr(3),
      R => SR(0)
    );
\up_waddr_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(4),
      Q => up_waddr(4),
      R => SR(0)
    );
\up_waddr_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(5),
      Q => up_waddr(5),
      R => SR(0)
    );
\up_waddr_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(6),
      Q => up_waddr(6),
      R => SR(0)
    );
\up_waddr_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(7),
      Q => up_waddr(7),
      R => SR(0)
    );
\up_waddr_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_awaddr(8),
      Q => up_waddr(8),
      R => SR(0)
    );
\up_wcount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => up_wack,
      I1 => p_0_in7_in,
      I2 => \up_wcount_reg_n_0_[0]\,
      O => p_2_in(0)
    );
\up_wcount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0028"
    )
        port map (
      I0 => p_0_in7_in,
      I1 => \up_wcount_reg_n_0_[0]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => up_wack,
      O => p_2_in(1)
    );
\up_wcount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002888"
    )
        port map (
      I0 => p_0_in7_in,
      I1 => \up_wcount_reg_n_0_[2]\,
      I2 => \up_wcount_reg_n_0_[0]\,
      I3 => \up_wcount_reg_n_0_[1]\,
      I4 => up_wack,
      O => p_2_in(2)
    );
\up_wcount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002AAA8000"
    )
        port map (
      I0 => p_0_in7_in,
      I1 => \up_wcount_reg_n_0_[2]\,
      I2 => \up_wcount_reg_n_0_[0]\,
      I3 => \up_wcount_reg_n_0_[1]\,
      I4 => \up_wcount_reg_n_0_[3]\,
      I5 => up_wack,
      O => p_2_in(3)
    );
\up_wcount[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in7_in,
      I1 => \^up_wreq\,
      O => \up_wcount[4]_i_1_n_0\
    );
\up_wcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => up_wack,
      I1 => \up_wcount_reg_n_0_[3]\,
      I2 => \up_wcount_reg_n_0_[1]\,
      I3 => \up_wcount_reg_n_0_[0]\,
      I4 => \up_wcount_reg_n_0_[2]\,
      I5 => p_0_in7_in,
      O => p_2_in(4)
    );
\up_wcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_wcount[4]_i_1_n_0\,
      D => p_2_in(0),
      Q => \up_wcount_reg_n_0_[0]\,
      R => SR(0)
    );
\up_wcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_wcount[4]_i_1_n_0\,
      D => p_2_in(1),
      Q => \up_wcount_reg_n_0_[1]\,
      R => SR(0)
    );
\up_wcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_wcount[4]_i_1_n_0\,
      D => p_2_in(2),
      Q => \up_wcount_reg_n_0_[2]\,
      R => SR(0)
    );
\up_wcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_wcount[4]_i_1_n_0\,
      D => p_2_in(3),
      Q => \up_wcount_reg_n_0_[3]\,
      R => SR(0)
    );
\up_wcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_wcount[4]_i_1_n_0\,
      D => p_2_in(4),
      Q => p_0_in7_in,
      R => SR(0)
    );
\up_wdata_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(0),
      Q => \^q\(0),
      R => SR(0)
    );
\up_wdata_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(10),
      Q => \^q\(10),
      R => SR(0)
    );
\up_wdata_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(11),
      Q => \^q\(11),
      R => SR(0)
    );
\up_wdata_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(12),
      Q => \^q\(12),
      R => SR(0)
    );
\up_wdata_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(13),
      Q => \^q\(13),
      R => SR(0)
    );
\up_wdata_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(14),
      Q => \^q\(14),
      R => SR(0)
    );
\up_wdata_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(15),
      Q => \^q\(15),
      R => SR(0)
    );
\up_wdata_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(16),
      Q => \^q\(16),
      R => SR(0)
    );
\up_wdata_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(17),
      Q => \^q\(17),
      R => SR(0)
    );
\up_wdata_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(18),
      Q => \^q\(18),
      R => SR(0)
    );
\up_wdata_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(19),
      Q => \^q\(19),
      R => SR(0)
    );
\up_wdata_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(1),
      Q => \^q\(1),
      R => SR(0)
    );
\up_wdata_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(20),
      Q => \^q\(20),
      R => SR(0)
    );
\up_wdata_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(21),
      Q => \^q\(21),
      R => SR(0)
    );
\up_wdata_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(22),
      Q => \^q\(22),
      R => SR(0)
    );
\up_wdata_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(23),
      Q => \^q\(23),
      R => SR(0)
    );
\up_wdata_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(24),
      Q => \^q\(24),
      R => SR(0)
    );
\up_wdata_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(25),
      Q => \^q\(25),
      R => SR(0)
    );
\up_wdata_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(26),
      Q => \^q\(26),
      R => SR(0)
    );
\up_wdata_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(27),
      Q => \^q\(27),
      R => SR(0)
    );
\up_wdata_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(28),
      Q => \^q\(28),
      R => SR(0)
    );
\up_wdata_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(29),
      Q => \^q\(29),
      R => SR(0)
    );
\up_wdata_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(2),
      Q => \^q\(2),
      R => SR(0)
    );
\up_wdata_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(30),
      Q => \^q\(30),
      R => SR(0)
    );
\up_wdata_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(31),
      Q => \^q\(31),
      R => SR(0)
    );
\up_wdata_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(3),
      Q => \^q\(3),
      R => SR(0)
    );
\up_wdata_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(4),
      Q => \^q\(4),
      R => SR(0)
    );
\up_wdata_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(5),
      Q => \^q\(5),
      R => SR(0)
    );
\up_wdata_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(6),
      Q => \^q\(6),
      R => SR(0)
    );
\up_wdata_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(7),
      Q => \^q\(7),
      R => SR(0)
    );
\up_wdata_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(8),
      Q => \^q\(8),
      R => SR(0)
    );
\up_wdata_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_5_in,
      D => s_axi_wdata(9),
      Q => \^q\(9),
      R => SR(0)
    );
up_wreq_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_5_in,
      I1 => s_axi_aresetn,
      I2 => s_axi_wvalid,
      I3 => s_axi_awvalid,
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
      Q => \^up_wreq\,
      R => '0'
    );
up_wsel_inv_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7777F000"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_awvalid,
      I2 => \^s_axi_bvalid\,
      I3 => s_axi_bready,
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
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_util_axis_fifo_address_generator is
  port (
    response_valid_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \m_axis_raddr_reg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \fifo._m_axis_valid\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    response_valid_reg_0 : out STD_LOGIC;
    up_tlf_s_valid_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    up_response_valid : in STD_LOGIC;
    response_ready_reg : in STD_LOGIC;
    \s_axis_waddr_reg_reg[2]_0\ : in STD_LOGIC;
    up_bl_partial : in STD_LOGIC;
    up_tlf_valid : in STD_LOGIC;
    \m_axis_raddr_reg_reg[0]_0\ : in STD_LOGIC;
    up_rreq : in STD_LOGIC;
    \s_axis_waddr_reg_reg[0]_0\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_util_axis_fifo_address_generator : entity is "util_axis_fifo_address_generator";
end system_axi_adrv9001_rx1_dma_0_util_axis_fifo_address_generator;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_util_axis_fifo_address_generator is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^fifo._m_axis_valid\ : STD_LOGIC;
  signal m_axis_raddr : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \m_axis_raddr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \^m_axis_raddr_reg_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal s_axis_waddr : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \s_axis_waddr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_axis_waddr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axis_waddr_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal up_tlf_s_ready : STD_LOGIC;
  signal \^up_tlf_s_valid_reg\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_axis_raddr_reg[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \m_axis_raddr_reg[2]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of response_ready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_axis_waddr_reg[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axis_waddr_reg[2]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of up_tlf_s_valid_i_1 : label is "soft_lutpair0";
begin
  E(0) <= \^e\(0);
  Q(1 downto 0) <= \^q\(1 downto 0);
  SR(0) <= \^sr\(0);
  \fifo._m_axis_valid\ <= \^fifo._m_axis_valid\;
  \m_axis_raddr_reg_reg[1]_0\(1 downto 0) <= \^m_axis_raddr_reg_reg[1]_0\(1 downto 0);
  up_tlf_s_valid_reg(0) <= \^up_tlf_s_valid_reg\(0);
\m_axis_raddr_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^m_axis_raddr_reg_reg[1]_0\(0),
      O => \m_axis_raddr_reg[0]_i_1_n_0\
    );
\m_axis_raddr_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^m_axis_raddr_reg_reg[1]_0\(0),
      I1 => \^m_axis_raddr_reg_reg[1]_0\(1),
      O => p_1_in(1)
    );
\m_axis_raddr_reg[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \s_axis_waddr_reg_reg[0]_0\,
      O => \^sr\(0)
    );
\m_axis_raddr_reg[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7500"
    )
        port map (
      I0 => up_tlf_valid,
      I1 => \m_axis_raddr_reg_reg[0]_0\,
      I2 => up_rreq,
      I3 => \^fifo._m_axis_valid\,
      O => \^e\(0)
    );
\m_axis_raddr_reg[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^m_axis_raddr_reg_reg[1]_0\(1),
      I1 => \^m_axis_raddr_reg_reg[1]_0\(0),
      I2 => m_axis_raddr(2),
      O => p_1_in(2)
    );
\m_axis_raddr_reg[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => m_axis_raddr(2),
      I1 => s_axis_waddr(2),
      I2 => \^m_axis_raddr_reg_reg[1]_0\(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^m_axis_raddr_reg_reg[1]_0\(0),
      O => \^fifo._m_axis_valid\
    );
\m_axis_raddr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => \m_axis_raddr_reg[0]_i_1_n_0\,
      Q => \^m_axis_raddr_reg_reg[1]_0\(0),
      R => \^sr\(0)
    );
\m_axis_raddr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(1),
      Q => \^m_axis_raddr_reg_reg[1]_0\(1),
      R => \^sr\(0)
    );
\m_axis_raddr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => p_1_in(2),
      Q => m_axis_raddr(2),
      R => \^sr\(0)
    );
response_ready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => up_response_valid,
      I1 => up_tlf_s_ready,
      I2 => response_ready_reg,
      O => response_valid_reg_0
    );
\s_axis_waddr_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \s_axis_waddr_reg[0]_i_1_n_0\
    );
\s_axis_waddr_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \s_axis_waddr_reg[1]_i_1_n_0\
    );
\s_axis_waddr_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => up_tlf_s_ready,
      I1 => \s_axis_waddr_reg_reg[2]_0\,
      O => \^up_tlf_s_valid_reg\(0)
    );
\s_axis_waddr_reg[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => s_axis_waddr(2),
      O => \s_axis_waddr_reg[2]_i_2_n_0\
    );
\s_axis_waddr_reg[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF9FF9F69FFFFF"
    )
        port map (
      I0 => s_axis_waddr(2),
      I1 => m_axis_raddr(2),
      I2 => \^m_axis_raddr_reg_reg[1]_0\(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^m_axis_raddr_reg_reg[1]_0\(0),
      O => up_tlf_s_ready
    );
\s_axis_waddr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^up_tlf_s_valid_reg\(0),
      D => \s_axis_waddr_reg[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\s_axis_waddr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^up_tlf_s_valid_reg\(0),
      D => \s_axis_waddr_reg[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \^sr\(0)
    );
\s_axis_waddr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^up_tlf_s_valid_reg\(0),
      D => \s_axis_waddr_reg[2]_i_2_n_0\,
      Q => s_axis_waddr(2),
      R => \^sr\(0)
    );
up_tlf_s_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D5C01500"
    )
        port map (
      I0 => up_tlf_s_ready,
      I1 => up_response_valid,
      I2 => response_ready_reg,
      I3 => \s_axis_waddr_reg_reg[2]_0\,
      I4 => up_bl_partial,
      O => response_valid_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_burst_memory is
  port (
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dest_burst_info_write : out STD_LOGIC;
    dest_mem_data_valid_reg_0 : out STD_LOGIC;
    m_dest_axi_wlast : out STD_LOGIC;
    \dest_id_next_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dest_burst_len_data_reg[6]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \cdc_sync_stage2_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    dbg_ids0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    dest_id_reduced_msb_next_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    src_id_reduced_msb_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \dest_burst_len_data_reg[4]_0\ : in STD_LOGIC;
    m_dest_axi_wready : in STD_LOGIC;
    \src_id_reg[2]_0\ : in STD_LOGIC;
    \src_throttled_request_id_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \src_throttled_request_id_reg[0]_0\ : in STD_LOGIC;
    dest_burst_valid : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_burst_memory : entity is "axi_dmac_burst_memory";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_burst_memory;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_burst_memory is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b2g3_return07_out : STD_LOGIC;
  signal b2g3_return09_out : STD_LOGIC;
  signal dest_beat : STD_LOGIC;
  signal dest_beat_counter0 : STD_LOGIC;
  signal dest_beat_counter_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_burst_len_data : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal \^dest_burst_len_data_reg[6]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_burst_ready : STD_LOGIC;
  signal \dest_id_next[0]_i_1_n_0\ : STD_LOGIC;
  signal \^dest_id_next_reg[3]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_id_reduced_msb : STD_LOGIC;
  signal dest_id_reduced_msb_next_i_1_n_0 : STD_LOGIC;
  signal dest_id_reduced_next : STD_LOGIC_VECTOR ( 2 to 2 );
  signal dest_last : STD_LOGIC;
  signal dest_mem_data_last_i_1_n_0 : STD_LOGIC;
  signal dest_mem_data_last_i_3_n_0 : STD_LOGIC;
  signal dest_mem_data_valid_i_1_n_0 : STD_LOGIC;
  signal \^dest_mem_data_valid_reg_0\ : STD_LOGIC;
  signal dest_valid : STD_LOGIC;
  signal dest_valid_i_1_n_0 : STD_LOGIC;
  signal id0 : STD_LOGIC;
  signal \^m_dest_axi_wlast\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal p_1_in8_in : STD_LOGIC;
  signal src_id_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal src_id_reduced : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal src_id_reduced_msb_i_1_n_0 : STD_LOGIC;
  signal \src_id_reg_n_0_[2]\ : STD_LOGIC;
  signal NLW_burst_len_mem_reg_0_7_0_4_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_burst_len_mem_reg_0_7_0_4_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of burst_len_mem_reg_0_7_0_4 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of burst_len_mem_reg_0_7_0_4 : label is 40;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of burst_len_mem_reg_0_7_0_4 : label is "axi_dmac/i_transfer/i_request_arb/i_store_and_forward/burst_len_mem_reg_0_7_0_4";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of burst_len_mem_reg_0_7_0_4 : label is "NONE";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of burst_len_mem_reg_0_7_0_4 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of burst_len_mem_reg_0_7_0_4 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of burst_len_mem_reg_0_7_0_4 : label is 7;
  attribute ram_offset : integer;
  attribute ram_offset of burst_len_mem_reg_0_7_0_4 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of burst_len_mem_reg_0_7_0_4 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of burst_len_mem_reg_0_7_0_4 : label is 2;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dest_beat_counter[1]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \dest_beat_counter[2]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \dest_beat_counter[3]_i_2\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \dest_id_next[1]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \dest_id_next[2]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \dest_id_next[3]_i_2\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of dest_id_reduced_msb_next_i_1 : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of dest_mem_data_last_i_3 : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of dest_mem_data_valid_i_1 : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of dest_valid_i_1 : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \src_beat_counter[0]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \src_beat_counter[1]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \src_beat_counter[2]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \src_beat_counter[3]_i_2\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \src_id[0]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \src_id[1]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \src_id[3]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of src_id_reduced_msb_i_1 : label is "soft_lutpair78";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  \dest_burst_len_data_reg[6]_0\(3 downto 0) <= \^dest_burst_len_data_reg[6]_0\(3 downto 0);
  \dest_id_next_reg[3]_0\(3 downto 0) <= \^dest_id_next_reg[3]_0\(3 downto 0);
  dest_mem_data_valid_reg_0 <= \^dest_mem_data_valid_reg_0\;
  m_dest_axi_wlast <= \^m_dest_axi_wlast\;
burst_len_mem_reg_0_7_0_4: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2) => dest_id_reduced_next(2),
      ADDRA(1 downto 0) => \^dest_id_next_reg[3]_0\(1 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2) => dest_id_reduced_next(2),
      ADDRB(1 downto 0) => \^dest_id_next_reg[3]_0\(1 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2) => dest_id_reduced_next(2),
      ADDRC(1 downto 0) => \^dest_id_next_reg[3]_0\(1 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => src_id_reduced(2 downto 0),
      DIA(1 downto 0) => p_0_in(1 downto 0),
      DIB(1 downto 0) => p_0_in(3 downto 2),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => dest_burst_len_data(4 downto 3),
      DOB(1 downto 0) => dest_burst_len_data(6 downto 5),
      DOC(1 downto 0) => NLW_burst_len_mem_reg_0_7_0_4_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_burst_len_mem_reg_0_7_0_4_DOD_UNCONNECTED(1 downto 0),
      WCLK => fifo_wr_clk,
      WE => \dest_burst_len_data_reg[4]_0\
    );
\dest_beat_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => dest_beat_counter_reg(0),
      O => \p_0_in__0\(0)
    );
\dest_beat_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dest_beat_counter_reg(0),
      I1 => dest_beat_counter_reg(1),
      O => \p_0_in__0\(1)
    );
\dest_beat_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => dest_beat_counter_reg(1),
      I1 => dest_beat_counter_reg(0),
      I2 => dest_beat_counter_reg(2),
      O => \p_0_in__0\(2)
    );
\dest_beat_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFA200"
    )
        port map (
      I0 => dest_last,
      I1 => \^dest_mem_data_valid_reg_0\,
      I2 => m_dest_axi_wready,
      I3 => dest_valid,
      I4 => dest_id_reduced_msb_next_reg_0(0),
      O => dest_beat_counter0
    );
\dest_beat_counter[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => dest_beat_counter_reg(0),
      I1 => dest_beat_counter_reg(1),
      I2 => dest_beat_counter_reg(2),
      I3 => dest_beat_counter_reg(3),
      O => \p_0_in__0\(3)
    );
\dest_beat_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_beat,
      D => \p_0_in__0\(0),
      Q => dest_beat_counter_reg(0),
      R => dest_beat_counter0
    );
\dest_beat_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_beat,
      D => \p_0_in__0\(1),
      Q => dest_beat_counter_reg(1),
      R => dest_beat_counter0
    );
\dest_beat_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_beat,
      D => \p_0_in__0\(2),
      Q => dest_beat_counter_reg(2),
      R => dest_beat_counter0
    );
\dest_beat_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_beat,
      D => \p_0_in__0\(3),
      Q => dest_beat_counter_reg(3),
      R => dest_beat_counter0
    );
dest_burst_info_write_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => id0,
      Q => dest_burst_info_write,
      R => '0'
    );
\dest_burst_len_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => dest_burst_len_data(3),
      Q => \^dest_burst_len_data_reg[6]_0\(0),
      R => '0'
    );
\dest_burst_len_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => dest_burst_len_data(4),
      Q => \^dest_burst_len_data_reg[6]_0\(1),
      R => '0'
    );
\dest_burst_len_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => dest_burst_len_data(5),
      Q => \^dest_burst_len_data_reg[6]_0\(2),
      R => '0'
    );
\dest_burst_len_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => dest_burst_len_data(6),
      Q => \^dest_burst_len_data_reg[6]_0\(3),
      R => '0'
    );
\dest_id[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B0FF"
    )
        port map (
      I0 => m_dest_axi_wready,
      I1 => \^dest_mem_data_valid_reg_0\,
      I2 => dest_last,
      I3 => dest_valid,
      O => dest_burst_ready
    );
\dest_id_next[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \^dest_id_next_reg[3]_0\(1),
      I1 => \^dest_id_next_reg[3]_0\(3),
      I2 => \^dest_id_next_reg[3]_0\(2),
      O => \dest_id_next[0]_i_1_n_0\
    );
\dest_id_next[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"99F0"
    )
        port map (
      I0 => \^dest_id_next_reg[3]_0\(2),
      I1 => \^dest_id_next_reg[3]_0\(3),
      I2 => \^dest_id_next_reg[3]_0\(1),
      I3 => \^dest_id_next_reg[3]_0\(0),
      O => b2g3_return07_out
    );
\dest_id_next[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF10"
    )
        port map (
      I0 => \^dest_id_next_reg[3]_0\(3),
      I1 => \^dest_id_next_reg[3]_0\(0),
      I2 => \^dest_id_next_reg[3]_0\(1),
      I3 => \^dest_id_next_reg[3]_0\(2),
      O => b2g3_return09_out
    );
\dest_id_next[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0FF0000"
    )
        port map (
      I0 => m_dest_axi_wready,
      I1 => \^dest_mem_data_valid_reg_0\,
      I2 => dest_last,
      I3 => dest_valid,
      I4 => dest_burst_valid,
      O => id0
    );
\dest_id_next[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE02"
    )
        port map (
      I0 => \^dest_id_next_reg[3]_0\(2),
      I1 => \^dest_id_next_reg[3]_0\(1),
      I2 => \^dest_id_next_reg[3]_0\(0),
      I3 => \^dest_id_next_reg[3]_0\(3),
      O => p_1_in8_in
    );
\dest_id_next_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => \dest_id_next[0]_i_1_n_0\,
      Q => \^dest_id_next_reg[3]_0\(0),
      R => dest_id_reduced_msb_next_reg_0(0)
    );
\dest_id_next_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => b2g3_return07_out,
      Q => \^dest_id_next_reg[3]_0\(1),
      R => dest_id_reduced_msb_next_reg_0(0)
    );
\dest_id_next_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => b2g3_return09_out,
      Q => \^dest_id_next_reg[3]_0\(2),
      R => dest_id_reduced_msb_next_reg_0(0)
    );
\dest_id_next_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => p_1_in8_in,
      Q => \^dest_id_next_reg[3]_0\(3),
      R => dest_id_reduced_msb_next_reg_0(0)
    );
dest_id_reduced_msb_next_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5CAC"
    )
        port map (
      I0 => \^dest_id_next_reg[3]_0\(2),
      I1 => \^dest_id_next_reg[3]_0\(1),
      I2 => \^dest_id_next_reg[3]_0\(0),
      I3 => \^dest_id_next_reg[3]_0\(3),
      O => dest_id_reduced_msb_next_i_1_n_0
    );
dest_id_reduced_msb_next_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => id0,
      D => dest_id_reduced_msb_next_i_1_n_0,
      Q => dest_id_reduced_next(2),
      R => dest_id_reduced_msb_next_reg_0(0)
    );
dest_id_reduced_msb_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_burst_ready,
      D => dest_id_reduced_next(2),
      Q => dest_id_reduced_msb,
      R => '0'
    );
\dest_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_burst_ready,
      D => \^dest_id_next_reg[3]_0\(0),
      Q => \^q\(0),
      R => '0'
    );
\dest_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_burst_ready,
      D => \^dest_id_next_reg[3]_0\(1),
      Q => \^q\(1),
      R => '0'
    );
\dest_id_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_burst_ready,
      D => \^dest_id_next_reg[3]_0\(2),
      Q => \^q\(2),
      R => '0'
    );
\dest_id_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => dest_burst_ready,
      D => \^dest_id_next_reg[3]_0\(3),
      Q => \^q\(3),
      R => '0'
    );
dest_mem_data_last_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444540400005500"
    )
        port map (
      I0 => dest_id_reduced_msb_next_reg_0(0),
      I1 => dest_last,
      I2 => \^dest_mem_data_valid_reg_0\,
      I3 => \^m_dest_axi_wlast\,
      I4 => m_dest_axi_wready,
      I5 => dest_valid,
      O => dest_mem_data_last_i_1_n_0
    );
dest_mem_data_last_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90090000"
    )
        port map (
      I0 => \^dest_burst_len_data_reg[6]_0\(3),
      I1 => dest_beat_counter_reg(3),
      I2 => \^dest_burst_len_data_reg[6]_0\(2),
      I3 => dest_beat_counter_reg(2),
      I4 => dest_mem_data_last_i_3_n_0,
      O => dest_last
    );
dest_mem_data_last_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => dest_beat_counter_reg(0),
      I1 => \^dest_burst_len_data_reg[6]_0\(0),
      I2 => dest_beat_counter_reg(1),
      I3 => \^dest_burst_len_data_reg[6]_0\(1),
      O => dest_mem_data_last_i_3_n_0
    );
dest_mem_data_last_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => dest_mem_data_last_i_1_n_0,
      Q => \^m_dest_axi_wlast\,
      R => '0'
    );
dest_mem_data_valid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DC"
    )
        port map (
      I0 => m_dest_axi_wready,
      I1 => dest_valid,
      I2 => \^dest_mem_data_valid_reg_0\,
      O => dest_mem_data_valid_i_1_n_0
    );
dest_mem_data_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => dest_mem_data_valid_i_1_n_0,
      Q => \^dest_mem_data_valid_reg_0\,
      R => dest_id_reduced_msb_next_reg_0(0)
    );
dest_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5D00"
    )
        port map (
      I0 => dest_last,
      I1 => \^dest_mem_data_valid_reg_0\,
      I2 => m_dest_axi_wready,
      I3 => dest_valid,
      I4 => dest_burst_valid,
      O => dest_valid_i_1_n_0
    );
dest_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => dest_valid_i_1_n_0,
      Q => dest_valid,
      R => dest_id_reduced_msb_next_reg_0(0)
    );
i_dest_sync_id: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__1\
     port map (
      Q(3) => p_1_in,
      Q(2) => \src_id_reg_n_0_[2]\,
      Q(1 downto 0) => src_id_reduced(1 downto 0),
      dbg_ids0(3 downto 0) => dbg_ids0(3 downto 0),
      m_dest_axi_aclk => m_dest_axi_aclk
    );
i_mem: entity work.system_axi_adrv9001_rx1_dma_0_ad_mem_asym
     port map (
      ADDRARDADDR(6) => dest_id_reduced_msb,
      ADDRARDADDR(5 downto 4) => \^q\(1 downto 0),
      ADDRARDADDR(3 downto 0) => dest_beat_counter_reg(3 downto 0),
      ADDRBWRADDR(6 downto 4) => src_id_reduced(2 downto 0),
      ADDRBWRADDR(3 downto 0) => p_0_in(3 downto 0),
      E(0) => dest_beat,
      dest_valid => dest_valid,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_din(63 downto 0) => fifo_wr_din(63 downto 0),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_wdata(63 downto 0) => m_dest_axi_wdata(63 downto 0),
      m_dest_axi_wready => m_dest_axi_wready,
      m_ram_reg_0(0) => E(0),
      m_ram_reg_1 => \^dest_mem_data_valid_reg_0\
    );
i_src_sync_id: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__2\
     port map (
      Q(3 downto 0) => \^q\(3 downto 0),
      \cdc_sync_stage2_reg[0]_0\(0) => \cdc_sync_stage2_reg[0]\(0),
      fifo_wr_clk => fifo_wr_clk,
      \src_throttled_request_id_reg[0]\(3 downto 0) => \src_throttled_request_id_reg[0]\(3 downto 0),
      \src_throttled_request_id_reg[0]_0\ => \src_throttled_request_id_reg[0]_0\
    );
\src_beat_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in(0),
      O => \p_0_in__1\(0)
    );
\src_beat_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      O => \p_0_in__1\(1)
    );
\src_beat_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      O => \p_0_in__1\(2)
    );
\src_beat_counter[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => p_0_in(2),
      I3 => p_0_in(3),
      O => \p_0_in__1\(3)
    );
\src_beat_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => E(0),
      D => \p_0_in__1\(0),
      Q => p_0_in(0),
      R => SR(0)
    );
\src_beat_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => E(0),
      D => \p_0_in__1\(1),
      Q => p_0_in(1),
      R => SR(0)
    );
\src_beat_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => E(0),
      D => \p_0_in__1\(2),
      Q => p_0_in(2),
      R => SR(0)
    );
\src_beat_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => E(0),
      D => \p_0_in__1\(3),
      Q => p_0_in(3),
      R => SR(0)
    );
\src_id[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEEB1441"
    )
        port map (
      I0 => \src_id_reg[2]_0\,
      I1 => src_id_reduced(1),
      I2 => p_1_in,
      I3 => \src_id_reg_n_0_[2]\,
      I4 => src_id_reduced(0),
      O => src_id_next(0)
    );
\src_id[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EBFF4100"
    )
        port map (
      I0 => \src_id_reg[2]_0\,
      I1 => \src_id_reg_n_0_[2]\,
      I2 => p_1_in,
      I3 => src_id_reduced(0),
      I4 => src_id_reduced(1),
      O => src_id_next(1)
    );
\src_id[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00BF10"
    )
        port map (
      I0 => \src_id_reg[2]_0\,
      I1 => p_1_in,
      I2 => src_id_reduced(1),
      I3 => \src_id_reg_n_0_[2]\,
      I4 => src_id_reduced(0),
      O => src_id_next(2)
    );
\src_id[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0010"
    )
        port map (
      I0 => \src_id_reg[2]_0\,
      I1 => src_id_reduced(0),
      I2 => \src_id_reg_n_0_[2]\,
      I3 => src_id_reduced(1),
      I4 => p_1_in,
      O => src_id_next(3)
    );
src_id_reduced_msb_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33CC72D8"
    )
        port map (
      I0 => src_id_reduced(0),
      I1 => \src_id_reg_n_0_[2]\,
      I2 => src_id_reduced(1),
      I3 => p_1_in,
      I4 => \src_id_reg[2]_0\,
      O => src_id_reduced_msb_i_1_n_0
    );
src_id_reduced_msb_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => src_id_reduced_msb_i_1_n_0,
      Q => src_id_reduced(2),
      R => src_id_reduced_msb_reg_0(0)
    );
\src_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => src_id_next(0),
      Q => src_id_reduced(0),
      R => src_id_reduced_msb_reg_0(0)
    );
\src_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => src_id_next(1),
      Q => src_id_reduced(1),
      R => src_id_reduced_msb_reg_0(0)
    );
\src_id_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => src_id_next(2),
      Q => \src_id_reg_n_0_[2]\,
      R => src_id_reduced_msb_reg_0(0)
    );
\src_id_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => src_id_next(3),
      Q => p_1_in,
      R => src_id_reduced_msb_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_reset_manager is
  port (
    do_enable_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \reset_gen[1].reset_sync_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    dbg_status : out STD_LOGIC_VECTOR ( 5 downto 0 );
    src_enable : out STD_LOGIC;
    dest_enable : out STD_LOGIC;
    \reset_gen[2].reset_sync_reg[0]_0\ : out STD_LOGIC;
    \reset_gen[2].reset_sync_reg[0]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    enabled : in STD_LOGIC;
    m_dest_axi_awaddr : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_rdata_reg[10]\ : in STD_LOGIC;
    \up_rdata_reg[10]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \src_beat_counter_reg[0]\ : in STD_LOGIC;
    ctrl_enable : in STD_LOGIC;
    ctrl_pause : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_reset_manager : entity is "axi_dmac_reset_manager";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_reset_manager;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_reset_manager is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dbg_status\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal do_enable0 : STD_LOGIC;
  signal \^do_enable_reg_0\ : STD_LOGIC;
  signal do_reset : STD_LOGIC;
  signal do_reset_0 : STD_LOGIC;
  signal needs_reset : STD_LOGIC;
  signal needs_reset_i_1_n_0 : STD_LOGIC;
  signal \reset_gen[0].reset_async_reg_n_0_[0]\ : STD_LOGIC;
  signal \reset_gen[0].reset_async_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_gen[0].reset_async_reg_n_0_[2]\ : STD_LOGIC;
  signal \reset_gen[0].reset_async_reg_n_0_[3]\ : STD_LOGIC;
  signal \reset_gen[0].reset_sync_in\ : STD_LOGIC;
  signal \reset_gen[0].reset_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_gen[1].reset_async_reg_n_0_[0]\ : STD_LOGIC;
  signal \reset_gen[1].reset_async_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_gen[1].reset_async_reg_n_0_[2]\ : STD_LOGIC;
  signal \reset_gen[1].reset_async_reg_n_0_[3]\ : STD_LOGIC;
  signal \reset_gen[1].reset_sync_in\ : STD_LOGIC;
  signal \^reset_gen[1].reset_sync_reg[0]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \reset_gen[1].reset_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_gen[2].reset_async_reg_n_0_[0]\ : STD_LOGIC;
  signal \reset_gen[2].reset_async_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_gen[2].reset_async_reg_n_0_[2]\ : STD_LOGIC;
  signal \reset_gen[2].reset_async_reg_n_0_[3]\ : STD_LOGIC;
  signal \reset_gen[2].reset_sync_in\ : STD_LOGIC;
  signal \^reset_gen[2].reset_sync_reg[0]_1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \reset_gen[2].reset_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \^src_enable\ : STD_LOGIC;
  signal state : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[2]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair89";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \reset_gen[0].reset_async_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_async_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[0].reset_async_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_async_reg[1]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[0].reset_async_reg[2]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_async_reg[2]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[0].reset_async_reg[3]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_async_reg[3]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[0].reset_sync_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[0].reset_sync_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[0].reset_sync_reg[1]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_async_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_async_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_async_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_async_reg[1]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_async_reg[2]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_async_reg[2]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_async_reg[3]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_async_reg[3]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_sync_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[1].reset_sync_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[1].reset_sync_reg[1]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_async_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_async_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_async_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_async_reg[1]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_async_reg[2]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_async_reg[2]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_async_reg[3]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_async_reg[3]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_sync_reg[0]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_sync_reg[0]\ : label is "no";
  attribute ASYNC_REG of \reset_gen[2].reset_sync_reg[1]\ : label is std.standard.true;
  attribute SHREG_EXTRACT of \reset_gen[2].reset_sync_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM of \state[0]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \state[2]_i_1\ : label is "soft_lutpair88";
begin
  Q(0) <= \^q\(0);
  dbg_status(5 downto 0) <= \^dbg_status\(5 downto 0);
  do_enable_reg_0 <= \^do_enable_reg_0\;
  \reset_gen[1].reset_sync_reg[0]_0\(0) <= \^reset_gen[1].reset_sync_reg[0]_0\(0);
  \reset_gen[2].reset_sync_reg[0]_1\(0) <= \^reset_gen[2].reset_sync_reg[0]_1\(0);
  src_enable <= \^src_enable\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \^dbg_status\(5),
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => needs_reset,
      I1 => \FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \^dbg_status\(5),
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => ctrl_enable,
      I1 => needs_reset,
      I2 => \^reset_gen[2].reset_sync_reg[0]_1\(0),
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => ctrl_pause,
      I5 => \FSM_onehot_state_reg_n_0_[4]\,
      O => \FSM_onehot_state[5]_i_3_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => do_reset_0,
      S => SS(0)
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => do_reset_0,
      Q => needs_reset,
      R => SS(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[2]\,
      R => SS(0)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\,
      R => SS(0)
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \FSM_onehot_state_reg_n_0_[3]\,
      Q => \FSM_onehot_state_reg_n_0_[4]\,
      R => SS(0)
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \FSM_onehot_state_reg_n_0_[4]\,
      Q => \FSM_onehot_state_reg_n_0_[5]\,
      R => SS(0)
    );
do_enable_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_state_reg_n_0_[3]\,
      O => do_enable0
    );
do_enable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_enable0,
      Q => \^do_enable_reg_0\,
      R => '0'
    );
do_reset_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => do_reset_0,
      Q => do_reset,
      R => '0'
    );
i_sync_control_dest: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__9\
     port map (
      \cdc_sync_stage1_reg[0]_0\ => \^do_enable_reg_0\,
      dest_enable => dest_enable,
      m_dest_axi_aclk => m_dest_axi_aclk
    );
i_sync_control_src: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__10\
     port map (
      \cdc_sync_stage1_reg[0]_0\ => \^do_enable_reg_0\,
      fifo_wr_clk => fifo_wr_clk,
      src_enable => \^src_enable\
    );
i_sync_status_dest: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__11\
     port map (
      E(0) => state,
      Q(4) => \FSM_onehot_state_reg_n_0_[5]\,
      Q(3) => \FSM_onehot_state_reg_n_0_[4]\,
      Q(2) => \FSM_onehot_state_reg_n_0_[3]\,
      Q(1) => \FSM_onehot_state_reg_n_0_[2]\,
      Q(0) => do_reset_0,
      dbg_status(0) => \^dbg_status\(3),
      enabled => enabled,
      s_axi_aclk => s_axi_aclk,
      \state_reg[0]\ => \^dbg_status\(5),
      \state_reg[0]_0\ => \FSM_onehot_state[5]_i_3_n_0\,
      \state_reg[0]_1\ => \^do_enable_reg_0\,
      \state_reg[0]_2\(0) => \^dbg_status\(4)
    );
i_sync_status_src: entity work.system_axi_adrv9001_rx1_dma_0_sync_bits
     port map (
      dbg_status(0) => \^dbg_status\(4),
      s_axi_aclk => s_axi_aclk,
      src_enable => \^src_enable\
    );
needs_reset_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => ctrl_enable,
      I1 => \^dbg_status\(5),
      I2 => needs_reset,
      O => needs_reset_i_1_n_0
    );
needs_reset_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => needs_reset_i_1_n_0,
      Q => \^dbg_status\(5),
      R => '0'
    );
\reset_gen[0].reset_async_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_async_reg_n_0_[1]\,
      PRE => do_reset,
      Q => \reset_gen[0].reset_async_reg_n_0_[0]\
    );
\reset_gen[0].reset_async_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_async_reg_n_0_[2]\,
      PRE => do_reset,
      Q => \reset_gen[0].reset_async_reg_n_0_[1]\
    );
\reset_gen[0].reset_async_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_async_reg_n_0_[3]\,
      PRE => do_reset,
      Q => \reset_gen[0].reset_async_reg_n_0_[2]\
    );
\reset_gen[0].reset_async_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => '0',
      PRE => do_reset,
      Q => \reset_gen[0].reset_async_reg_n_0_[3]\
    );
\reset_gen[0].reset_sync_in_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_async_reg_n_0_[0]\,
      PRE => \reset_gen[2].reset_async_reg_n_0_[0]\,
      Q => \reset_gen[0].reset_sync_in\
    );
\reset_gen[0].reset_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_sync_reg_n_0_[1]\,
      Q => \^q\(0),
      R => '0'
    );
\reset_gen[0].reset_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \reset_gen[0].reset_sync_in\,
      Q => \reset_gen[0].reset_sync_reg_n_0_[1]\,
      R => '0'
    );
\reset_gen[1].reset_async_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_async_reg_n_0_[1]\,
      PRE => do_reset,
      Q => \reset_gen[1].reset_async_reg_n_0_[0]\
    );
\reset_gen[1].reset_async_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_async_reg_n_0_[2]\,
      PRE => do_reset,
      Q => \reset_gen[1].reset_async_reg_n_0_[1]\
    );
\reset_gen[1].reset_async_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_async_reg_n_0_[3]\,
      PRE => do_reset,
      Q => \reset_gen[1].reset_async_reg_n_0_[2]\
    );
\reset_gen[1].reset_async_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[0].reset_async_reg_n_0_[0]\,
      PRE => do_reset,
      Q => \reset_gen[1].reset_async_reg_n_0_[3]\
    );
\reset_gen[1].reset_sync_in_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_async_reg_n_0_[0]\,
      PRE => \^q\(0),
      Q => \reset_gen[1].reset_sync_in\
    );
\reset_gen[1].reset_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_sync_reg_n_0_[1]\,
      Q => \^reset_gen[1].reset_sync_reg[0]_0\(0),
      R => '0'
    );
\reset_gen[1].reset_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \reset_gen[1].reset_sync_in\,
      Q => \reset_gen[1].reset_sync_reg_n_0_[1]\,
      R => '0'
    );
\reset_gen[2].reset_async_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_async_reg_n_0_[1]\,
      PRE => do_reset,
      Q => \reset_gen[2].reset_async_reg_n_0_[0]\
    );
\reset_gen[2].reset_async_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_async_reg_n_0_[2]\,
      PRE => do_reset,
      Q => \reset_gen[2].reset_async_reg_n_0_[1]\
    );
\reset_gen[2].reset_async_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_async_reg_n_0_[3]\,
      PRE => do_reset,
      Q => \reset_gen[2].reset_async_reg_n_0_[2]\
    );
\reset_gen[2].reset_async_reg[3]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[1].reset_async_reg_n_0_[0]\,
      PRE => do_reset,
      Q => \reset_gen[2].reset_async_reg_n_0_[3]\
    );
\reset_gen[2].reset_sync_in_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_async_reg_n_0_[0]\,
      PRE => \^reset_gen[1].reset_sync_reg[0]_0\(0),
      Q => \reset_gen[2].reset_sync_in\
    );
\reset_gen[2].reset_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_sync_reg_n_0_[1]\,
      Q => \^reset_gen[2].reset_sync_reg[0]_1\(0),
      R => '0'
    );
\reset_gen[2].reset_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \reset_gen[2].reset_sync_in\,
      Q => \reset_gen[2].reset_sync_reg_n_0_[1]\,
      R => '0'
    );
\src_beat_counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^reset_gen[1].reset_sync_reg[0]_0\(0),
      I1 => \src_beat_counter_reg[0]\,
      O => SR(0)
    );
\state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => \^dbg_status\(1),
      I1 => \^dbg_status\(5),
      I2 => \^dbg_status\(0),
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"26"
    )
        port map (
      I0 => \^dbg_status\(0),
      I1 => \^dbg_status\(1),
      I2 => \^dbg_status\(5),
      O => \state[1]_i_1_n_0\
    );
\state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_status\(1),
      I1 => \^dbg_status\(0),
      I2 => \^dbg_status\(2),
      O => \state[2]_i_1_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \state[0]_i_1_n_0\,
      Q => \^dbg_status\(0),
      R => SS(0)
    );
\state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \state[1]_i_1_n_0\,
      Q => \^dbg_status\(1),
      R => SS(0)
    );
\state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => state,
      D => \state[2]_i_1_n_0\,
      Q => \^dbg_status\(2),
      R => SS(0)
    );
\up_rdata[10]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"50C0"
    )
        port map (
      I0 => \^reset_gen[2].reset_sync_reg[0]_1\(0),
      I1 => m_dest_axi_awaddr(0),
      I2 => \up_rdata_reg[10]\,
      I3 => \up_rdata_reg[10]_0\(0),
      O => \reset_gen[2].reset_sync_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_dest_axi_mm is
  port (
    addr_valid_reg : out STD_LOGIC;
    ADDRC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \id_reg[3]\ : out STD_LOGIC;
    \id_reg[2]\ : out STD_LOGIC;
    \id_reg[1]\ : out STD_LOGIC;
    \id_reg[0]\ : out STD_LOGIC;
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 27 downto 0 );
    enabled : out STD_LOGIC;
    dest_bl_ready : out STD_LOGIC;
    dest_req_ready : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \id_reg[0]_0\ : out STD_LOGIC;
    dest_burst_valid : out STD_LOGIC;
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    enabled_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    \zerodeep.cdc_sync_fifo_ram_reg0\ : in STD_LOGIC;
    dest_burst_info_write : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \zerodeep.cdc_sync_fifo_ram_reg[5]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dest_address_eot : in STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    dbg_ids0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dest_valid_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \out\ : in STD_LOGIC_VECTOR ( 27 downto 0 );
    dest_enable : in STD_LOGIC;
    dest_bl_valid : in STD_LOGIC;
    req_ready_reg : in STD_LOGIC;
    req_ready_reg_0 : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \last_burst_len_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_dest_axi_mm : entity is "dest_axi_mm";
end system_axi_adrv9001_rx1_dma_0_dest_axi_mm;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_dest_axi_mm is
  signal \^addrc\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal address_enabled : STD_LOGIC;
  signal \^id_reg[0]\ : STD_LOGIC;
  signal \^id_reg[1]\ : STD_LOGIC;
  signal \^id_reg[2]\ : STD_LOGIC;
  signal \^id_reg[3]\ : STD_LOGIC;
  signal NLW_bl_mem_reg_0_15_0_7_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of bl_mem_reg_0_15_0_7 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of bl_mem_reg_0_15_0_7 : label is 128;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of bl_mem_reg_0_15_0_7 : label is "axi_dmac/i_transfer/i_request_arb/i_dest_dma_mm/bl_mem_reg_0_15_0_7";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of bl_mem_reg_0_15_0_7 : label is "NONE";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of bl_mem_reg_0_15_0_7 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of bl_mem_reg_0_15_0_7 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of bl_mem_reg_0_15_0_7 : label is 15;
  attribute ram_offset : integer;
  attribute ram_offset of bl_mem_reg_0_15_0_7 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of bl_mem_reg_0_15_0_7 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of bl_mem_reg_0_15_0_7 : label is 2;
begin
  ADDRC(3 downto 0) <= \^addrc\(3 downto 0);
  \id_reg[0]\ <= \^id_reg[0]\;
  \id_reg[1]\ <= \^id_reg[1]\;
  \id_reg[2]\ <= \^id_reg[2]\;
  \id_reg[3]\ <= \^id_reg[3]\;
bl_mem_reg_0_15_0_7: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000"
    )
        port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => \^addrc\(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => \^addrc\(3 downto 0),
      ADDRC(4) => '0',
      ADDRC(3 downto 0) => \^addrc\(3 downto 0),
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \zerodeep.cdc_sync_fifo_ram_reg[5]\(3 downto 0),
      DIA(1) => Q(0),
      DIA(0) => '1',
      DIB(1 downto 0) => Q(2 downto 1),
      DIC(1) => '0',
      DIC(0) => Q(3),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => D(2 downto 1),
      DOB(1 downto 0) => D(4 downto 3),
      DOC(1) => D(0),
      DOC(0) => D(5),
      DOD(1 downto 0) => NLW_bl_mem_reg_0_15_0_7_DOD_UNCONNECTED(1 downto 0),
      WCLK => m_dest_axi_aclk,
      WE => dest_burst_info_write
    );
i_addr_gen: entity work.system_axi_adrv9001_rx1_dma_0_address_generator
     port map (
      E(0) => E(0),
      addr_valid_reg_0 => addr_valid_reg,
      address_enabled => address_enabled,
      dbg_ids0(3 downto 0) => dbg_ids0(3 downto 0),
      dest_address_eot => dest_address_eot,
      dest_bl_ready => dest_bl_ready,
      dest_bl_valid => dest_bl_valid,
      dest_burst_valid => dest_burst_valid,
      dest_enable => dest_enable,
      dest_valid_reg(3 downto 0) => dest_valid_reg(3 downto 0),
      \id_reg[0]_0\ => \^id_reg[0]\,
      \id_reg[1]_0\ => \^id_reg[1]\,
      \id_reg[2]_0\ => \^id_reg[2]\,
      \id_reg[3]_0\ => \^id_reg[3]\,
      \last_burst_len_reg[3]_0\(3 downto 0) => \last_burst_len_reg[3]\(3 downto 0),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_awaddr(27 downto 0) => m_dest_axi_awaddr(27 downto 0),
      m_dest_axi_awlen(3 downto 0) => m_dest_axi_awlen(3 downto 0),
      m_dest_axi_awready => m_dest_axi_awready,
      \out\(27 downto 0) => \out\(27 downto 0),
      req_ready_reg_0 => dest_req_ready,
      req_ready_reg_1(0) => enabled_reg(0),
      req_ready_reg_2 => req_ready_reg,
      req_ready_reg_3 => req_ready_reg_0
    );
i_response_handler: entity work.system_axi_adrv9001_rx1_dma_0_response_handler
     port map (
      address_enabled => address_enabled,
      enabled => enabled,
      enabled_reg_0(0) => enabled_reg(0),
      enabled_reg_1 => \^id_reg[0]\,
      enabled_reg_2 => \^id_reg[3]\,
      \id_reg[0]_0\ => \^addrc\(0),
      \id_reg[0]_1\ => \id_reg[0]_0\,
      \id_reg[1]_0\ => \^addrc\(1),
      \id_reg[2]_0\ => \^addrc\(2),
      \id_reg[3]_0\ => \^addrc\(3),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_bready_INST_0_i_1_0 => \^id_reg[1]\,
      m_dest_axi_bready_INST_0_i_1_1 => \^id_reg[2]\,
      \zerodeep.cdc_sync_fifo_ram_reg0\ => \zerodeep.cdc_sync_fifo_ram_reg0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_src_fifo_inf is
  port (
    src_req_ready : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr_overflow : out STD_LOGIC;
    \id_reg[0]\ : out STD_LOGIC;
    \id_reg[1]\ : out STD_LOGIC;
    \id_reg[2]\ : out STD_LOGIC;
    \id_reg[3]\ : out STD_LOGIC;
    active_reg : out STD_LOGIC;
    src_bl_valid : out STD_LOGIC;
    \beat_counter_reg[0]\ : out STD_LOGIC;
    last_non_eot_reg : out STD_LOGIC;
    last_eot_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    last_non_eot_reg_0 : out STD_LOGIC;
    \measured_last_burst_length_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_clk : in STD_LOGIC;
    last_eot_reg_0 : in STD_LOGIC;
    active_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    bl_valid_reg : in STD_LOGIC;
    sync : in STD_LOGIC;
    src_enable : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    src_eot : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    active0 : in STD_LOGIC;
    active_reg_1 : in STD_LOGIC;
    src_req_spltr_valid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_src_fifo_inf : entity is "src_fifo_inf";
end system_axi_adrv9001_rx1_dma_0_src_fifo_inf;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_src_fifo_inf is
  signal i_data_mover_n_8 : STD_LOGIC;
begin
i_data_mover: entity work.system_axi_adrv9001_rx1_dma_0_data_mover
     port map (
      E(0) => E(0),
      Q(3 downto 0) => Q(3 downto 0),
      SR(0) => src_req_ready,
      active0 => active0,
      active_reg_0 => active_reg,
      active_reg_1 => i_data_mover_n_8,
      active_reg_2(0) => active_reg_0(0),
      active_reg_3 => active_reg_1,
      \beat_counter_reg[0]_0\ => \beat_counter_reg[0]\,
      bl_valid_reg_0 => bl_valid_reg,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_en => fifo_wr_en,
      \id_reg[0]_0\ => \id_reg[0]\,
      \id_reg[1]_0\ => \id_reg[1]\,
      \id_reg[2]_0\ => \id_reg[2]\,
      \id_reg[3]_0\ => \id_reg[3]\,
      last_eot_reg_0(0) => last_eot_reg(0),
      last_eot_reg_1 => last_eot_reg_0,
      last_non_eot_reg_0 => last_non_eot_reg,
      last_non_eot_reg_1 => last_non_eot_reg_0,
      \measured_last_burst_length_reg[3]_0\(3 downto 0) => \measured_last_burst_length_reg[3]\(3 downto 0),
      \out\(4 downto 0) => \out\(4 downto 0),
      src_bl_valid => src_bl_valid,
      src_enable => src_enable,
      src_eot => src_eot,
      src_req_spltr_valid => src_req_spltr_valid,
      sync => sync
    );
overflow_reg: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => '1',
      D => i_data_mover_n_8,
      Q => fifo_wr_overflow,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_util_axis_fifo is
  port (
    up_tlf_valid : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    response_valid_reg : out STD_LOGIC;
    \fifo._m_axis_valid\ : out STD_LOGIC;
    \fifo.sync_clocks.data_reg[8]_0\ : out STD_LOGIC;
    response_valid_reg_0 : out STD_LOGIC;
    \fifo.valid_reg_0\ : out STD_LOGIC;
    \fifo.sync_clocks.data_reg[25]_0\ : out STD_LOGIC_VECTOR ( 24 downto 0 );
    \fifo.valid_reg_1\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    up_response_valid : in STD_LOGIC;
    response_ready_reg : in STD_LOGIC;
    \s_axis_waddr_reg_reg[2]\ : in STD_LOGIC;
    up_bl_partial : in STD_LOGIC;
    \m_axis_raddr_reg_reg[0]\ : in STD_LOGIC;
    up_rreq : in STD_LOGIC;
    \up_rdata[8]_i_2\ : in STD_LOGIC;
    s_axis_data : in STD_LOGIC_VECTOR ( 25 downto 0 );
    \up_rdata[8]_i_2_0\ : in STD_LOGIC;
    \s_axis_waddr_reg_reg[0]\ : in STD_LOGIC;
    data5 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_util_axis_fifo : entity is "util_axis_fifo";
end system_axi_adrv9001_rx1_dma_0_util_axis_fifo;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_util_axis_fifo is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \fifo.m_mem_read\ : STD_LOGIC;
  signal \fifo.sync_clocks.data0\ : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \fifo.sync_clocks.data_reg_n_0_[8]\ : STD_LOGIC;
  signal m_axis_raddr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axis_waddr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axis_write_s : STD_LOGIC;
  signal \^up_tlf_valid\ : STD_LOGIC;
  signal \NLW_fifo.sync_clocks.ram_reg_0_3_0_13_DOH_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOG_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOH_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 104;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is "axi_dmac/i_regmap/i_regmap_request/i_transfer_lenghts_fifo/fifo.sync_clocks.ram_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 3;
  attribute ram_offset : integer;
  attribute ram_offset of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \fifo.sync_clocks.ram_reg_0_3_0_13\ : label is 13;
  attribute METHODOLOGY_DRC_VIOS of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is "";
  attribute RTL_RAM_BITS of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 104;
  attribute RTL_RAM_NAME of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is "axi_dmac/i_regmap/i_regmap_request/i_transfer_lenghts_fifo/fifo.sync_clocks.ram_reg";
  attribute RTL_RAM_STYLE of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is "auto";
  attribute RTL_RAM_TYPE of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is "RAM_SDP";
  attribute ram_addr_begin of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 0;
  attribute ram_addr_end of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 3;
  attribute ram_offset of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 0;
  attribute ram_slice_begin of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 14;
  attribute ram_slice_end of \fifo.sync_clocks.ram_reg_0_3_14_25\ : label is 25;
begin
  SR(0) <= \^sr\(0);
  up_tlf_valid <= \^up_tlf_valid\;
\fifo.i_address_gray\: entity work.system_axi_adrv9001_rx1_dma_0_util_axis_fifo_address_generator
     port map (
      E(0) => \fifo.m_mem_read\,
      Q(1 downto 0) => s_axis_waddr(1 downto 0),
      SR(0) => \^sr\(0),
      \fifo._m_axis_valid\ => \fifo._m_axis_valid\,
      \m_axis_raddr_reg_reg[0]_0\ => \m_axis_raddr_reg_reg[0]\,
      \m_axis_raddr_reg_reg[1]_0\(1 downto 0) => m_axis_raddr(1 downto 0),
      response_ready_reg => response_ready_reg,
      response_valid_reg => response_valid_reg,
      response_valid_reg_0 => response_valid_reg_0,
      s_axi_aclk => s_axi_aclk,
      \s_axis_waddr_reg_reg[0]_0\ => \s_axis_waddr_reg_reg[0]\,
      \s_axis_waddr_reg_reg[2]_0\ => \s_axis_waddr_reg_reg[2]\,
      up_bl_partial => up_bl_partial,
      up_response_valid => up_response_valid,
      up_rreq => up_rreq,
      up_tlf_s_valid_reg(0) => s_axis_write_s,
      up_tlf_valid => \^up_tlf_valid\
    );
\fifo.sync_clocks.data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(0),
      Q => \fifo.sync_clocks.data_reg[25]_0\(0),
      R => '0'
    );
\fifo.sync_clocks.data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(10),
      Q => \fifo.sync_clocks.data_reg[25]_0\(9),
      R => '0'
    );
\fifo.sync_clocks.data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(11),
      Q => \fifo.sync_clocks.data_reg[25]_0\(10),
      R => '0'
    );
\fifo.sync_clocks.data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(12),
      Q => \fifo.sync_clocks.data_reg[25]_0\(11),
      R => '0'
    );
\fifo.sync_clocks.data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(13),
      Q => \fifo.sync_clocks.data_reg[25]_0\(12),
      R => '0'
    );
\fifo.sync_clocks.data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(14),
      Q => \fifo.sync_clocks.data_reg[25]_0\(13),
      R => '0'
    );
\fifo.sync_clocks.data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(15),
      Q => \fifo.sync_clocks.data_reg[25]_0\(14),
      R => '0'
    );
\fifo.sync_clocks.data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(16),
      Q => \fifo.sync_clocks.data_reg[25]_0\(15),
      R => '0'
    );
\fifo.sync_clocks.data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(17),
      Q => \fifo.sync_clocks.data_reg[25]_0\(16),
      R => '0'
    );
\fifo.sync_clocks.data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(18),
      Q => \fifo.sync_clocks.data_reg[25]_0\(17),
      R => '0'
    );
\fifo.sync_clocks.data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(19),
      Q => \fifo.sync_clocks.data_reg[25]_0\(18),
      R => '0'
    );
\fifo.sync_clocks.data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(1),
      Q => \fifo.sync_clocks.data_reg[25]_0\(1),
      R => '0'
    );
\fifo.sync_clocks.data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(20),
      Q => \fifo.sync_clocks.data_reg[25]_0\(19),
      R => '0'
    );
\fifo.sync_clocks.data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(21),
      Q => \fifo.sync_clocks.data_reg[25]_0\(20),
      R => '0'
    );
\fifo.sync_clocks.data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(22),
      Q => \fifo.sync_clocks.data_reg[25]_0\(21),
      R => '0'
    );
\fifo.sync_clocks.data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(23),
      Q => \fifo.sync_clocks.data_reg[25]_0\(22),
      R => '0'
    );
\fifo.sync_clocks.data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(24),
      Q => \fifo.sync_clocks.data_reg[25]_0\(23),
      R => '0'
    );
\fifo.sync_clocks.data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(25),
      Q => \fifo.sync_clocks.data_reg[25]_0\(24),
      R => '0'
    );
\fifo.sync_clocks.data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(2),
      Q => \fifo.sync_clocks.data_reg[25]_0\(2),
      R => '0'
    );
\fifo.sync_clocks.data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(3),
      Q => \fifo.sync_clocks.data_reg[25]_0\(3),
      R => '0'
    );
\fifo.sync_clocks.data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(4),
      Q => \fifo.sync_clocks.data_reg[25]_0\(4),
      R => '0'
    );
\fifo.sync_clocks.data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(5),
      Q => \fifo.sync_clocks.data_reg[25]_0\(5),
      R => '0'
    );
\fifo.sync_clocks.data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(6),
      Q => \fifo.sync_clocks.data_reg[25]_0\(6),
      R => '0'
    );
\fifo.sync_clocks.data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(7),
      Q => \fifo.sync_clocks.data_reg[25]_0\(7),
      R => '0'
    );
\fifo.sync_clocks.data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(8),
      Q => \fifo.sync_clocks.data_reg_n_0_[8]\,
      R => '0'
    );
\fifo.sync_clocks.data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \fifo.m_mem_read\,
      D => \fifo.sync_clocks.data0\(9),
      Q => \fifo.sync_clocks.data_reg[25]_0\(8),
      R => '0'
    );
\fifo.sync_clocks.ram_reg_0_3_0_13\: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 2) => B"000",
      ADDRA(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRB(4 downto 2) => B"000",
      ADDRB(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRC(4 downto 2) => B"000",
      ADDRC(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRD(4 downto 2) => B"000",
      ADDRD(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRE(4 downto 2) => B"000",
      ADDRE(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRF(4 downto 2) => B"000",
      ADDRF(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRG(4 downto 2) => B"000",
      ADDRG(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRH(4 downto 2) => B"000",
      ADDRH(1 downto 0) => s_axis_waddr(1 downto 0),
      DIA(1 downto 0) => s_axis_data(1 downto 0),
      DIB(1 downto 0) => s_axis_data(3 downto 2),
      DIC(1 downto 0) => s_axis_data(5 downto 4),
      DID(1 downto 0) => s_axis_data(7 downto 6),
      DIE(1 downto 0) => s_axis_data(9 downto 8),
      DIF(1 downto 0) => s_axis_data(11 downto 10),
      DIG(1 downto 0) => s_axis_data(13 downto 12),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => \fifo.sync_clocks.data0\(1 downto 0),
      DOB(1 downto 0) => \fifo.sync_clocks.data0\(3 downto 2),
      DOC(1 downto 0) => \fifo.sync_clocks.data0\(5 downto 4),
      DOD(1 downto 0) => \fifo.sync_clocks.data0\(7 downto 6),
      DOE(1 downto 0) => \fifo.sync_clocks.data0\(9 downto 8),
      DOF(1 downto 0) => \fifo.sync_clocks.data0\(11 downto 10),
      DOG(1 downto 0) => \fifo.sync_clocks.data0\(13 downto 12),
      DOH(1 downto 0) => \NLW_fifo.sync_clocks.ram_reg_0_3_0_13_DOH_UNCONNECTED\(1 downto 0),
      WCLK => s_axi_aclk,
      WE => s_axis_write_s
    );
\fifo.sync_clocks.ram_reg_0_3_14_25\: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 2) => B"000",
      ADDRA(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRB(4 downto 2) => B"000",
      ADDRB(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRC(4 downto 2) => B"000",
      ADDRC(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRD(4 downto 2) => B"000",
      ADDRD(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRE(4 downto 2) => B"000",
      ADDRE(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRF(4 downto 2) => B"000",
      ADDRF(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRG(4 downto 2) => B"000",
      ADDRG(1 downto 0) => m_axis_raddr(1 downto 0),
      ADDRH(4 downto 2) => B"000",
      ADDRH(1 downto 0) => s_axis_waddr(1 downto 0),
      DIA(1 downto 0) => s_axis_data(15 downto 14),
      DIB(1 downto 0) => s_axis_data(17 downto 16),
      DIC(1 downto 0) => s_axis_data(19 downto 18),
      DID(1 downto 0) => s_axis_data(21 downto 20),
      DIE(1 downto 0) => s_axis_data(23 downto 22),
      DIF(1 downto 0) => s_axis_data(25 downto 24),
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => \fifo.sync_clocks.data0\(15 downto 14),
      DOB(1 downto 0) => \fifo.sync_clocks.data0\(17 downto 16),
      DOC(1 downto 0) => \fifo.sync_clocks.data0\(19 downto 18),
      DOD(1 downto 0) => \fifo.sync_clocks.data0\(21 downto 20),
      DOE(1 downto 0) => \fifo.sync_clocks.data0\(23 downto 22),
      DOF(1 downto 0) => \fifo.sync_clocks.data0\(25 downto 24),
      DOG(1 downto 0) => \NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOG_UNCONNECTED\(1 downto 0),
      DOH(1 downto 0) => \NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOH_UNCONNECTED\(1 downto 0),
      WCLK => s_axi_aclk,
      WE => s_axis_write_s
    );
\fifo.valid_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \fifo.valid_reg_1\,
      Q => \^up_tlf_valid\,
      R => \^sr\(0)
    );
up_partial_length_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFCFEECE"
    )
        port map (
      I0 => \^up_tlf_valid\,
      I1 => up_bl_partial,
      I2 => up_rreq,
      I3 => \m_axis_raddr_reg_reg[0]\,
      I4 => data5(0),
      O => \fifo.valid_reg_0\
    );
\up_rdata[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \fifo.sync_clocks.data_reg_n_0_[8]\,
      I1 => \up_rdata[8]_i_2\,
      I2 => s_axis_data(8),
      I3 => \up_rdata[8]_i_2_0\,
      O => \fifo.sync_clocks.data_reg[8]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized0\ is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    dest_bl_valid : out STD_LOGIC;
    \zerodeep.s_axis_waddr_reg_0\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    \cdc_sync_stage2_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr_clk : in STD_LOGIC;
    dest_bl_ready : in STD_LOGIC;
    src_bl_valid : in STD_LOGIC;
    bl_valid_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized0\ : entity is "util_axis_fifo";
end \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized0\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized0\ is
  signal \zerodeep.cdc_sync_fifo_ram\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \zerodeep.cdc_sync_fifo_ram\ : signal is "yes";
  signal \zerodeep.cdc_sync_fifo_ram_reg0\ : STD_LOGIC;
  signal \zerodeep.i_raddr_sync_n_2\ : STD_LOGIC;
  signal \zerodeep.i_waddr_sync_n_2\ : STD_LOGIC;
  signal \zerodeep.m_axis_raddr\ : STD_LOGIC;
  signal \zerodeep.s_axis_waddr\ : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[0]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[1]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[2]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[3]\ : label is "yes";
begin
  \out\(3 downto 0) <= \zerodeep.cdc_sync_fifo_ram\(3 downto 0);
\zerodeep.cdc_sync_fifo_ram_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => Q(0),
      Q => \zerodeep.cdc_sync_fifo_ram\(0),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => Q(1),
      Q => \zerodeep.cdc_sync_fifo_ram\(1),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => Q(2),
      Q => \zerodeep.cdc_sync_fifo_ram\(2),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => Q(3),
      Q => \zerodeep.cdc_sync_fifo_ram\(3),
      R => '0'
    );
\zerodeep.i_raddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__5\
     port map (
      E(0) => \zerodeep.cdc_sync_fifo_ram_reg0\,
      bl_valid_reg => \zerodeep.i_raddr_sync_n_2\,
      bl_valid_reg_0(0) => bl_valid_reg(0),
      \cdc_sync_stage2_reg[0]_0\(0) => \cdc_sync_stage2_reg[0]_0\(0),
      fifo_wr_clk => fifo_wr_clk,
      src_bl_valid => src_bl_valid,
      \zerodeep.m_axis_raddr\ => \zerodeep.m_axis_raddr\,
      \zerodeep.s_axis_waddr\ => \zerodeep.s_axis_waddr\,
      \zerodeep.s_axis_waddr_reg\ => \zerodeep.s_axis_waddr_reg_0\
    );
\zerodeep.i_waddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__6\
     port map (
      E(0) => E(0),
      bl_ready_reg => \zerodeep.i_waddr_sync_n_2\,
      \cdc_sync_stage2_reg[0]_0\(0) => \cdc_sync_stage2_reg[0]\(0),
      dest_bl_ready => dest_bl_ready,
      dest_bl_valid => dest_bl_valid,
      m_dest_axi_aclk => m_dest_axi_aclk,
      \zerodeep.m_axis_raddr\ => \zerodeep.m_axis_raddr\,
      \zerodeep.s_axis_waddr\ => \zerodeep.s_axis_waddr\
    );
\zerodeep.m_axis_raddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \zerodeep.i_waddr_sync_n_2\,
      Q => \zerodeep.m_axis_raddr\,
      R => \cdc_sync_stage2_reg[0]\(0)
    );
\zerodeep.s_axis_waddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \zerodeep.i_raddr_sync_n_2\,
      Q => \zerodeep.s_axis_waddr\,
      R => \cdc_sync_stage2_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized1\ is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 27 downto 0 );
    \zerodeep.s_axis_waddr_reg_0\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]\ : out STD_LOGIC;
    \zerodeep.m_axis_raddr_reg_0\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_0\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_1\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]_2\ : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr_clk : in STD_LOGIC;
    src_dest_valid_hs : in STD_LOGIC;
    active0 : in STD_LOGIC;
    dest_req_ready : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 29 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized1\ : entity is "util_axis_fifo";
end \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized1\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized1\ is
  signal \zerodeep.cdc_sync_fifo_ram\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \zerodeep.cdc_sync_fifo_ram\ : signal is "yes";
  signal \zerodeep.cdc_sync_fifo_ram_reg0\ : STD_LOGIC;
  signal \zerodeep.i_raddr_sync_n_4\ : STD_LOGIC;
  signal \zerodeep.i_waddr_sync_n_1\ : STD_LOGIC;
  signal \^zerodeep.m_axis_raddr_reg_0\ : STD_LOGIC;
  signal \^zerodeep.s_axis_waddr_reg_0\ : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[0]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[10]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[11]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[12]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[13]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[14]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[15]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[16]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[17]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[18]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[19]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[1]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[20]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[21]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[22]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[23]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[24]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[25]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[26]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[27]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[28]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[29]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[2]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[3]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[4]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[5]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[6]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[7]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[8]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[9]\ : label is "yes";
begin
  \out\(27 downto 0) <= \zerodeep.cdc_sync_fifo_ram\(29 downto 2);
  \zerodeep.m_axis_raddr_reg_0\ <= \^zerodeep.m_axis_raddr_reg_0\;
  \zerodeep.s_axis_waddr_reg_0\ <= \^zerodeep.s_axis_waddr_reg_0\;
\zerodeep.cdc_sync_fifo_ram_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(0),
      Q => \zerodeep.cdc_sync_fifo_ram\(0),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(10),
      Q => \zerodeep.cdc_sync_fifo_ram\(10),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(11),
      Q => \zerodeep.cdc_sync_fifo_ram\(11),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(12),
      Q => \zerodeep.cdc_sync_fifo_ram\(12),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(13),
      Q => \zerodeep.cdc_sync_fifo_ram\(13),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(14),
      Q => \zerodeep.cdc_sync_fifo_ram\(14),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(15),
      Q => \zerodeep.cdc_sync_fifo_ram\(15),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(16),
      Q => \zerodeep.cdc_sync_fifo_ram\(16),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(17),
      Q => \zerodeep.cdc_sync_fifo_ram\(17),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(18),
      Q => \zerodeep.cdc_sync_fifo_ram\(18),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(19),
      Q => \zerodeep.cdc_sync_fifo_ram\(19),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(1),
      Q => \zerodeep.cdc_sync_fifo_ram\(1),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(20),
      Q => \zerodeep.cdc_sync_fifo_ram\(20),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(21),
      Q => \zerodeep.cdc_sync_fifo_ram\(21),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(22),
      Q => \zerodeep.cdc_sync_fifo_ram\(22),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(23),
      Q => \zerodeep.cdc_sync_fifo_ram\(23),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(24),
      Q => \zerodeep.cdc_sync_fifo_ram\(24),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(25),
      Q => \zerodeep.cdc_sync_fifo_ram\(25),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(26),
      Q => \zerodeep.cdc_sync_fifo_ram\(26),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(27),
      Q => \zerodeep.cdc_sync_fifo_ram\(27),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(28),
      Q => \zerodeep.cdc_sync_fifo_ram\(28),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(29),
      Q => \zerodeep.cdc_sync_fifo_ram\(29),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(2),
      Q => \zerodeep.cdc_sync_fifo_ram\(2),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(3),
      Q => \zerodeep.cdc_sync_fifo_ram\(3),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(4),
      Q => \zerodeep.cdc_sync_fifo_ram\(4),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(5),
      Q => \zerodeep.cdc_sync_fifo_ram\(5),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(6),
      Q => \zerodeep.cdc_sync_fifo_ram\(6),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(7),
      Q => \zerodeep.cdc_sync_fifo_ram\(7),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(8),
      Q => \zerodeep.cdc_sync_fifo_ram\(8),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => \zerodeep.cdc_sync_fifo_ram_reg0\,
      D => D(9),
      Q => \zerodeep.cdc_sync_fifo_ram\(9),
      R => '0'
    );
\zerodeep.i_raddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__1\
     port map (
      E(0) => \zerodeep.cdc_sync_fifo_ram_reg0\,
      active0 => active0,
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]_0\(0),
      \cdc_sync_stage1_reg[0]_1\ => \^zerodeep.m_axis_raddr_reg_0\,
      \cdc_sync_stage2_reg[0]_0\ => \cdc_sync_stage2_reg[0]_0\,
      \cdc_sync_stage2_reg[0]_1\ => \cdc_sync_stage2_reg[0]_1\,
      \cdc_sync_stage2_reg[0]_2\ => \cdc_sync_stage2_reg[0]_2\,
      fifo_wr_clk => fifo_wr_clk,
      src_dest_valid_hs => src_dest_valid_hs,
      src_dest_valid_hs_reg => \zerodeep.i_raddr_sync_n_4\,
      \zerodeep.cdc_sync_fifo_ram_reg[0]\ => \^zerodeep.s_axis_waddr_reg_0\
    );
\zerodeep.i_waddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__2\
     port map (
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]\(0),
      \cdc_sync_stage1_reg[0]_1\ => \^zerodeep.s_axis_waddr_reg_0\,
      \cdc_sync_stage2_reg[0]_0\ => \cdc_sync_stage2_reg[0]\,
      dest_req_ready => dest_req_ready,
      m_dest_axi_aclk => m_dest_axi_aclk,
      req_ready_reg => \zerodeep.i_waddr_sync_n_1\,
      \zerodeep.m_axis_raddr_reg\ => \^zerodeep.m_axis_raddr_reg_0\
    );
\zerodeep.m_axis_raddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => '1',
      D => \zerodeep.i_waddr_sync_n_1\,
      Q => \^zerodeep.m_axis_raddr_reg_0\,
      R => \cdc_sync_stage1_reg[0]\(0)
    );
\zerodeep.s_axis_waddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \zerodeep.i_raddr_sync_n_4\,
      Q => \^zerodeep.s_axis_waddr_reg_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized2\ is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 34 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage2_reg[0]\ : out STD_LOGIC;
    up_dma_req_valid_reg : out STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[7]_0\ : out STD_LOGIC;
    active0 : out STD_LOGIC;
    src_req_spltr_valid : out STD_LOGIC;
    \cdc_sync_stage1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr_clk : in STD_LOGIC;
    req_gen_ready : in STD_LOGIC;
    up_dma_req_valid : in STD_LOGIC;
    \zerodeep.s_axis_waddr_reg_0\ : in STD_LOGIC;
    last_eot_reg : in STD_LOGIC;
    src_req_ready : in STD_LOGIC;
    src_req_islast_cur_reg : in STD_LOGIC;
    src_req_islast_cur_reg_0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 60 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized2\ : entity is "util_axis_fifo";
end \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized2\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized2\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \zerodeep.cdc_sync_fifo_ram\ : STD_LOGIC_VECTOR ( 65 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \zerodeep.cdc_sync_fifo_ram\ : signal is "yes";
  signal \zerodeep.i_waddr_sync_n_2\ : STD_LOGIC;
  signal \zerodeep.m_axis_raddr_reg_n_0\ : STD_LOGIC;
  signal \zerodeep.s_axis_waddr_i_1__0_n_0\ : STD_LOGIC;
  signal \zerodeep.s_axis_waddr_reg_n_0\ : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[0]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[10]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[11]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[12]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[13]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[14]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[15]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[16]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[17]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[18]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[19]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[1]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[20]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[21]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[22]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[23]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[24]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[25]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[26]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[27]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[28]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[29]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[2]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[30]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[31]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[32]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[33]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[34]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[35]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[36]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[37]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[38]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[39]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[3]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[40]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[41]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[42]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[43]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[44]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[45]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[46]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[47]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[48]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[49]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[4]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[50]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[51]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[52]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[53]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[54]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[55]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[56]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[57]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[58]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[59]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[5]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[60]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[61]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[62]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[63]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[64]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[65]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[6]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[7]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[8]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[9]\ : label is "yes";
begin
  E(0) <= \^e\(0);
  \out\(34 downto 7) <= \zerodeep.cdc_sync_fifo_ram\(65 downto 38);
  \out\(6 downto 3) <= \zerodeep.cdc_sync_fifo_ram\(9 downto 6);
  \out\(2 downto 0) <= \zerodeep.cdc_sync_fifo_ram\(2 downto 0);
last_eot_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAAE"
    )
        port map (
      I0 => last_eot_reg,
      I1 => src_req_ready,
      I2 => \zerodeep.cdc_sync_fifo_ram\(7),
      I3 => \zerodeep.cdc_sync_fifo_ram\(6),
      I4 => \zerodeep.cdc_sync_fifo_ram\(9),
      I5 => \zerodeep.cdc_sync_fifo_ram\(8),
      O => \zerodeep.cdc_sync_fifo_ram_reg[7]_0\
    );
\zerodeep.cdc_sync_fifo_ram_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => '0',
      Q => \zerodeep.cdc_sync_fifo_ram\(0),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(5),
      Q => \zerodeep.cdc_sync_fifo_ram\(10),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(6),
      Q => \zerodeep.cdc_sync_fifo_ram\(11),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(7),
      Q => \zerodeep.cdc_sync_fifo_ram\(12),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(8),
      Q => \zerodeep.cdc_sync_fifo_ram\(13),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(9),
      Q => \zerodeep.cdc_sync_fifo_ram\(14),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(10),
      Q => \zerodeep.cdc_sync_fifo_ram\(15),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(11),
      Q => \zerodeep.cdc_sync_fifo_ram\(16),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(12),
      Q => \zerodeep.cdc_sync_fifo_ram\(17),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(13),
      Q => \zerodeep.cdc_sync_fifo_ram\(18),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(14),
      Q => \zerodeep.cdc_sync_fifo_ram\(19),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(0),
      Q => \zerodeep.cdc_sync_fifo_ram\(1),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(15),
      Q => \zerodeep.cdc_sync_fifo_ram\(20),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(16),
      Q => \zerodeep.cdc_sync_fifo_ram\(21),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(17),
      Q => \zerodeep.cdc_sync_fifo_ram\(22),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(18),
      Q => \zerodeep.cdc_sync_fifo_ram\(23),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(19),
      Q => \zerodeep.cdc_sync_fifo_ram\(24),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(20),
      Q => \zerodeep.cdc_sync_fifo_ram\(25),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(21),
      Q => \zerodeep.cdc_sync_fifo_ram\(26),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(22),
      Q => \zerodeep.cdc_sync_fifo_ram\(27),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(23),
      Q => \zerodeep.cdc_sync_fifo_ram\(28),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(24),
      Q => \zerodeep.cdc_sync_fifo_ram\(29),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(2),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(25),
      Q => \zerodeep.cdc_sync_fifo_ram\(30),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(26),
      Q => \zerodeep.cdc_sync_fifo_ram\(31),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(27),
      Q => \zerodeep.cdc_sync_fifo_ram\(32),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(28),
      Q => \zerodeep.cdc_sync_fifo_ram\(33),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(29),
      Q => \zerodeep.cdc_sync_fifo_ram\(34),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(30),
      Q => \zerodeep.cdc_sync_fifo_ram\(35),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(31),
      Q => \zerodeep.cdc_sync_fifo_ram\(36),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(32),
      Q => \zerodeep.cdc_sync_fifo_ram\(37),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(33),
      Q => \zerodeep.cdc_sync_fifo_ram\(38),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(34),
      Q => \zerodeep.cdc_sync_fifo_ram\(39),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(3),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(35),
      Q => \zerodeep.cdc_sync_fifo_ram\(40),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(36),
      Q => \zerodeep.cdc_sync_fifo_ram\(41),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(37),
      Q => \zerodeep.cdc_sync_fifo_ram\(42),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(38),
      Q => \zerodeep.cdc_sync_fifo_ram\(43),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(39),
      Q => \zerodeep.cdc_sync_fifo_ram\(44),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(40),
      Q => \zerodeep.cdc_sync_fifo_ram\(45),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(41),
      Q => \zerodeep.cdc_sync_fifo_ram\(46),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(42),
      Q => \zerodeep.cdc_sync_fifo_ram\(47),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(43),
      Q => \zerodeep.cdc_sync_fifo_ram\(48),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(44),
      Q => \zerodeep.cdc_sync_fifo_ram\(49),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(4),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(45),
      Q => \zerodeep.cdc_sync_fifo_ram\(50),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(46),
      Q => \zerodeep.cdc_sync_fifo_ram\(51),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(47),
      Q => \zerodeep.cdc_sync_fifo_ram\(52),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(48),
      Q => \zerodeep.cdc_sync_fifo_ram\(53),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(49),
      Q => \zerodeep.cdc_sync_fifo_ram\(54),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(50),
      Q => \zerodeep.cdc_sync_fifo_ram\(55),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(51),
      Q => \zerodeep.cdc_sync_fifo_ram\(56),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(52),
      Q => \zerodeep.cdc_sync_fifo_ram\(57),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(53),
      Q => \zerodeep.cdc_sync_fifo_ram\(58),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(54),
      Q => \zerodeep.cdc_sync_fifo_ram\(59),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(5),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(55),
      Q => \zerodeep.cdc_sync_fifo_ram\(60),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(56),
      Q => \zerodeep.cdc_sync_fifo_ram\(61),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(57),
      Q => \zerodeep.cdc_sync_fifo_ram\(62),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(58),
      Q => \zerodeep.cdc_sync_fifo_ram\(63),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(59),
      Q => \zerodeep.cdc_sync_fifo_ram\(64),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(60),
      Q => \zerodeep.cdc_sync_fifo_ram\(65),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(1),
      Q => \zerodeep.cdc_sync_fifo_ram\(6),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(2),
      Q => \zerodeep.cdc_sync_fifo_ram\(7),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(3),
      Q => \zerodeep.cdc_sync_fifo_ram\(8),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => D(4),
      Q => \zerodeep.cdc_sync_fifo_ram\(9),
      R => '0'
    );
\zerodeep.i_raddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__7\
     port map (
      E(0) => \^e\(0),
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]\(0),
      \cdc_sync_stage1_reg[0]_1\ => \zerodeep.m_axis_raddr_reg_n_0\,
      \cdc_sync_stage2_reg[0]_0\ => \cdc_sync_stage2_reg[0]\,
      req_gen_ready => req_gen_ready,
      s_axi_aclk => s_axi_aclk,
      up_dma_req_valid => up_dma_req_valid,
      up_dma_req_valid_reg => up_dma_req_valid_reg,
      \zerodeep.s_axis_waddr_reg\ => \zerodeep.s_axis_waddr_reg_n_0\,
      \zerodeep.s_axis_waddr_reg_0\ => \zerodeep.s_axis_waddr_reg_0\
    );
\zerodeep.i_waddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__8\
     port map (
      active0 => active0,
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]_0\(0),
      \cdc_sync_stage1_reg[0]_1\ => \zerodeep.s_axis_waddr_reg_n_0\,
      fifo_wr_clk => fifo_wr_clk,
      src_req_islast_cur_reg => src_req_islast_cur_reg,
      src_req_islast_cur_reg_0 => src_req_islast_cur_reg_0,
      src_req_ready => src_req_ready,
      src_req_spltr_valid => src_req_spltr_valid,
      \zerodeep.m_axis_raddr_reg\ => \zerodeep.i_waddr_sync_n_2\,
      \zerodeep.m_axis_raddr_reg_0\ => \zerodeep.m_axis_raddr_reg_n_0\
    );
\zerodeep.m_axis_raddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => \zerodeep.i_waddr_sync_n_2\,
      Q => \zerodeep.m_axis_raddr_reg_n_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\zerodeep.s_axis_waddr_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \zerodeep.s_axis_waddr_reg_n_0\,
      O => \zerodeep.s_axis_waddr_i_1__0_n_0\
    );
\zerodeep.s_axis_waddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.s_axis_waddr_i_1__0_n_0\,
      Q => \zerodeep.s_axis_waddr_reg_n_0\,
      R => \cdc_sync_stage1_reg[0]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized3\ is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    response_ready_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_bready : out STD_LOGIC;
    response_dest_ready_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cdc_sync_stage1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    response_dest_ready_reg_0 : in STD_LOGIC;
    up_response_ready : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_state_reg[1]\ : in STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[0]_0\ : in STD_LOGIC;
    response_dest_ready : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[8]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized3\ : entity is "util_axis_fifo";
end \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized3\;

architecture STRUCTURE of \system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized3\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \zerodeep.cdc_sync_fifo_ram\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \zerodeep.cdc_sync_fifo_ram\ : signal is "yes";
  signal \zerodeep.i_waddr_sync_n_4\ : STD_LOGIC;
  signal \zerodeep.m_axis_raddr_reg_n_0\ : STD_LOGIC;
  signal \zerodeep.s_axis_waddr_i_2_n_0\ : STD_LOGIC;
  signal \zerodeep.s_axis_waddr_reg_n_0\ : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[0]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[1]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[2]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[3]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[4]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[5]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[6]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[7]\ : label is "yes";
  attribute KEEP of \zerodeep.cdc_sync_fifo_ram_reg[8]\ : label is "yes";
begin
  E(0) <= \^e\(0);
  \out\(8 downto 0) <= \zerodeep.cdc_sync_fifo_ram\(8 downto 0);
\zerodeep.cdc_sync_fifo_ram_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(0),
      Q => \zerodeep.cdc_sync_fifo_ram\(0),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(1),
      Q => \zerodeep.cdc_sync_fifo_ram\(1),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(2),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => '1',
      Q => \zerodeep.cdc_sync_fifo_ram\(3),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(2),
      Q => \zerodeep.cdc_sync_fifo_ram\(4),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(3),
      Q => \zerodeep.cdc_sync_fifo_ram\(5),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(4),
      Q => \zerodeep.cdc_sync_fifo_ram\(6),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(5),
      Q => \zerodeep.cdc_sync_fifo_ram\(7),
      R => '0'
    );
\zerodeep.cdc_sync_fifo_ram_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(6),
      Q => \zerodeep.cdc_sync_fifo_ram\(8),
      R => '0'
    );
\zerodeep.i_raddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__3\
     port map (
      E(0) => \^e\(0),
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]\(0),
      \cdc_sync_stage1_reg[0]_1\ => \zerodeep.m_axis_raddr_reg_n_0\,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      \zerodeep.cdc_sync_fifo_ram_reg[0]\ => \zerodeep.s_axis_waddr_reg_n_0\,
      \zerodeep.cdc_sync_fifo_ram_reg[0]_0\ => \zerodeep.cdc_sync_fifo_ram_reg[0]_0\
    );
\zerodeep.i_waddr_sync\: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__xdcDup__4\
     port map (
      D(1 downto 0) => D(1 downto 0),
      \FSM_sequential_state_reg[1]\ => \FSM_sequential_state_reg[1]\,
      Q(2 downto 0) => Q(2 downto 0),
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]_0\(0),
      \cdc_sync_stage1_reg[0]_1\ => \zerodeep.s_axis_waddr_reg_n_0\,
      \cdc_sync_stage2_reg[0]_0\ => \zerodeep.i_waddr_sync_n_4\,
      response_dest_ready => response_dest_ready,
      response_dest_ready_reg(0) => response_dest_ready_reg(0),
      response_dest_ready_reg_0 => response_dest_ready_reg_0,
      response_ready_reg => response_ready_reg,
      s_axi_aclk => s_axi_aclk,
      up_response_ready => up_response_ready,
      \zerodeep.m_axis_raddr_reg\ => \zerodeep.m_axis_raddr_reg_n_0\
    );
\zerodeep.m_axis_raddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \zerodeep.i_waddr_sync_n_4\,
      Q => \zerodeep.m_axis_raddr_reg_n_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\zerodeep.s_axis_waddr_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \zerodeep.s_axis_waddr_reg_n_0\,
      O => \zerodeep.s_axis_waddr_i_2_n_0\
    );
\zerodeep.s_axis_waddr_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_dest_axi_aclk,
      CE => \^e\(0),
      D => \zerodeep.s_axis_waddr_i_2_n_0\,
      Q => \zerodeep.s_axis_waddr_reg_n_0\,
      R => \cdc_sync_stage1_reg[0]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap_request is
  port (
    D : out STD_LOGIC_VECTOR ( 60 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_3_in : out STD_LOGIC_VECTOR ( 0 to 0 );
    up_tlf_valid : out STD_LOGIC;
    up_dma_req_valid : out STD_LOGIC;
    response_ready_reg_0 : out STD_LOGIC;
    data5 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \fifo._m_axis_valid\ : out STD_LOGIC;
    \fifo.sync_clocks.data_reg[8]\ : out STD_LOGIC;
    \up_measured_transfer_length_reg[23]_0\ : out STD_LOGIC_VECTOR ( 22 downto 0 );
    \up_transfer_id_eot_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_transfer_id_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \up_dma_x_length_reg[23]_0\ : out STD_LOGIC_VECTOR ( 16 downto 0 );
    \fifo.sync_clocks.data_reg[25]\ : out STD_LOGIC_VECTOR ( 24 downto 0 );
    up_dma_cyclic : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 29 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    dma_req_eot : in STD_LOGIC;
    \fifo.valid_reg\ : in STD_LOGIC;
    up_dma_req_valid_reg_0 : in STD_LOGIC;
    up_response_valid : in STD_LOGIC;
    up_bl_partial : in STD_LOGIC;
    \m_axis_raddr_reg_reg[0]\ : in STD_LOGIC;
    up_rreq : in STD_LOGIC;
    \up_rdata[8]_i_2\ : in STD_LOGIC;
    \up_rdata[8]_i_2_0\ : in STD_LOGIC;
    \s_axis_waddr_reg_reg[0]\ : in STD_LOGIC;
    up_eot : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_dma_x_length_reg[3]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_transfer_id_reg[1]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_dma_src_address_reg[30]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_transfer_done_bitmap_reg[0]_0\ : in STD_LOGIC;
    \up_measured_transfer_length_reg[7]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap_request : entity is "axi_dmac_regmap_request";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap_request;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap_request is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^data5\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal i_transfer_lenghts_fifo_n_1 : STD_LOGIC;
  signal i_transfer_lenghts_fifo_n_2 : STD_LOGIC;
  signal i_transfer_lenghts_fifo_n_5 : STD_LOGIC;
  signal i_transfer_lenghts_fifo_n_6 : STD_LOGIC;
  signal p_7_in : STD_LOGIC;
  signal \^response_ready_reg_0\ : STD_LOGIC;
  signal s_axis_data : STD_LOGIC_VECTOR ( 25 downto 8 );
  signal up_clear_tl : STD_LOGIC;
  signal \up_measured_transfer_length[23]_i_1_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_2_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_3_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_4_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_5_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_6_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_7_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length[7]_i_8_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_14\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_15\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \^up_measured_transfer_length_reg[23]_0\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \up_measured_transfer_length_reg[23]_i_2_n_1\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_10\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_11\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_12\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_13\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_14\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_15\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_2\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_3\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_4\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_5\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_6\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_7\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_8\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[23]_i_2_n_9\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_14\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_15\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \up_measured_transfer_length_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal up_tlf_s_valid_reg_n_0 : STD_LOGIC;
  signal \up_transfer_done_bitmap[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[0]_i_2_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[1]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[1]_i_2_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[2]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[2]_i_2_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[3]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_done_bitmap[3]_i_2_n_0\ : STD_LOGIC;
  signal \up_transfer_id[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_id[1]_i_2_n_0\ : STD_LOGIC;
  signal \up_transfer_id_eot[0]_i_1_n_0\ : STD_LOGIC;
  signal \up_transfer_id_eot[1]_i_2_n_0\ : STD_LOGIC;
  signal \^up_transfer_id_eot_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^up_transfer_id_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_up_measured_transfer_length_reg[23]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \up_measured_transfer_length_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \up_measured_transfer_length_reg[23]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \up_measured_transfer_length_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \up_transfer_done_bitmap[0]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \up_transfer_done_bitmap[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \up_transfer_done_bitmap[2]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \up_transfer_done_bitmap[3]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \up_transfer_id[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \up_transfer_id[1]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \up_transfer_id_eot[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \up_transfer_id_eot[1]_i_2\ : label is "soft_lutpair6";
begin
  SR(0) <= \^sr\(0);
  data5(4 downto 0) <= \^data5\(4 downto 0);
  response_ready_reg_0 <= \^response_ready_reg_0\;
  \up_measured_transfer_length_reg[23]_0\(22 downto 0) <= \^up_measured_transfer_length_reg[23]_0\(22 downto 0);
  \up_transfer_id_eot_reg[1]_0\(1 downto 0) <= \^up_transfer_id_eot_reg[1]_0\(1 downto 0);
  \up_transfer_id_reg[1]_0\(1 downto 0) <= \^up_transfer_id_reg[1]_0\(1 downto 0);
i_transfer_lenghts_fifo: entity work.system_axi_adrv9001_rx1_dma_0_util_axis_fifo
     port map (
      SR(0) => i_transfer_lenghts_fifo_n_1,
      data5(0) => \^data5\(4),
      \fifo._m_axis_valid\ => \fifo._m_axis_valid\,
      \fifo.sync_clocks.data_reg[25]_0\(24 downto 0) => \fifo.sync_clocks.data_reg[25]\(24 downto 0),
      \fifo.sync_clocks.data_reg[8]_0\ => \fifo.sync_clocks.data_reg[8]\,
      \fifo.valid_reg_0\ => i_transfer_lenghts_fifo_n_6,
      \fifo.valid_reg_1\ => \fifo.valid_reg\,
      \m_axis_raddr_reg_reg[0]\ => \m_axis_raddr_reg_reg[0]\,
      response_ready_reg => \^response_ready_reg_0\,
      response_valid_reg => i_transfer_lenghts_fifo_n_2,
      response_valid_reg_0 => i_transfer_lenghts_fifo_n_5,
      s_axi_aclk => s_axi_aclk,
      s_axis_data(25 downto 24) => s_axis_data(25 downto 24),
      s_axis_data(23 downto 9) => \^up_measured_transfer_length_reg[23]_0\(22 downto 8),
      s_axis_data(8) => s_axis_data(8),
      s_axis_data(7 downto 0) => \^up_measured_transfer_length_reg[23]_0\(7 downto 0),
      \s_axis_waddr_reg_reg[0]\ => \s_axis_waddr_reg_reg[0]\,
      \s_axis_waddr_reg_reg[2]\ => up_tlf_s_valid_reg_n_0,
      up_bl_partial => up_bl_partial,
      \up_rdata[8]_i_2\ => \up_rdata[8]_i_2\,
      \up_rdata[8]_i_2_0\ => \up_rdata[8]_i_2_0\,
      up_response_valid => up_response_valid,
      up_rreq => up_rreq,
      up_tlf_valid => up_tlf_valid
    );
response_ready_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_transfer_lenghts_fifo_n_5,
      Q => \^response_ready_reg_0\,
      S => i_transfer_lenghts_fifo_n_1
    );
up_axi_awready_int_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^sr\(0)
    );
up_clear_tl_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^response_ready_reg_0\,
      I1 => up_response_valid,
      O => p_7_in
    );
up_clear_tl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => dma_req_eot,
      Q => up_clear_tl,
      R => '0'
    );
\up_dma_dest_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(9),
      Q => D(40),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(10),
      Q => D(41),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(11),
      Q => D(42),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(12),
      Q => D(43),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(13),
      Q => D(44),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(14),
      Q => D(45),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(15),
      Q => D(46),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(16),
      Q => D(47),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(17),
      Q => D(48),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(18),
      Q => D(49),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(19),
      Q => D(50),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(20),
      Q => D(51),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(21),
      Q => D(52),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(22),
      Q => D(53),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(23),
      Q => D(54),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(24),
      Q => D(55),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(25),
      Q => D(56),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(26),
      Q => D(57),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(27),
      Q => D(58),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(28),
      Q => D(59),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(29),
      Q => D(60),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(2),
      Q => D(33),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(3),
      Q => D(34),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(4),
      Q => D(35),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(5),
      Q => D(36),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(6),
      Q => D(37),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(7),
      Q => D(38),
      R => \^sr\(0)
    );
\up_dma_dest_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => Q(8),
      Q => D(39),
      R => \^sr\(0)
    );
up_dma_enable_tlen_reporting_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_dma_cyclic,
      D => Q(1),
      Q => p_3_in(0),
      R => \^sr\(0)
    );
up_dma_last_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => up_dma_cyclic,
      D => Q(0),
      Q => D(0),
      S => \^sr\(0)
    );
up_dma_req_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_dma_req_valid_reg_0,
      Q => up_dma_req_valid,
      R => '0'
    );
\up_dma_src_address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(9),
      Q => D(12),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(10),
      Q => D(13),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(11),
      Q => D(14),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(12),
      Q => D(15),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(13),
      Q => D(16),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(14),
      Q => D(17),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(15),
      Q => D(18),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(16),
      Q => D(19),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(17),
      Q => D(20),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(18),
      Q => D(21),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(19),
      Q => D(22),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(20),
      Q => D(23),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(21),
      Q => D(24),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(22),
      Q => D(25),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(23),
      Q => D(26),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(24),
      Q => D(27),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(25),
      Q => D(28),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(26),
      Q => D(29),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(27),
      Q => D(30),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(28),
      Q => D(31),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(29),
      Q => D(32),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(2),
      Q => D(5),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(3),
      Q => D(6),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(4),
      Q => D(7),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(5),
      Q => D(8),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(6),
      Q => D(9),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(7),
      Q => D(10),
      R => \^sr\(0)
    );
\up_dma_src_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_src_address_reg[30]_0\(0),
      D => Q(8),
      Q => D(11),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(9),
      Q => \up_dma_x_length_reg[23]_0\(3),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(10),
      Q => \up_dma_x_length_reg[23]_0\(4),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(11),
      Q => \up_dma_x_length_reg[23]_0\(5),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(12),
      Q => \up_dma_x_length_reg[23]_0\(6),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(13),
      Q => \up_dma_x_length_reg[23]_0\(7),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(14),
      Q => \up_dma_x_length_reg[23]_0\(8),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(15),
      Q => \up_dma_x_length_reg[23]_0\(9),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(16),
      Q => \up_dma_x_length_reg[23]_0\(10),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(17),
      Q => \up_dma_x_length_reg[23]_0\(11),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(18),
      Q => \up_dma_x_length_reg[23]_0\(12),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(19),
      Q => \up_dma_x_length_reg[23]_0\(13),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(20),
      Q => \up_dma_x_length_reg[23]_0\(14),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(21),
      Q => \up_dma_x_length_reg[23]_0\(15),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(22),
      Q => \up_dma_x_length_reg[23]_0\(16),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(2),
      Q => D(1),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(3),
      Q => D(2),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(4),
      Q => D(3),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(5),
      Q => D(4),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(6),
      Q => \up_dma_x_length_reg[23]_0\(0),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(7),
      Q => \up_dma_x_length_reg[23]_0\(1),
      R => \^sr\(0)
    );
\up_dma_x_length_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_dma_x_length_reg[3]_0\(0),
      D => Q(8),
      Q => \up_dma_x_length_reg[23]_0\(2),
      R => \^sr\(0)
    );
\up_measured_transfer_length[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AFF"
    )
        port map (
      I0 => up_clear_tl,
      I1 => up_response_valid,
      I2 => \^response_ready_reg_0\,
      I3 => \s_axis_waddr_reg_reg[0]\,
      O => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(6),
      I1 => \up_measured_transfer_length_reg[7]_0\(6),
      O => \up_measured_transfer_length[7]_i_2_n_0\
    );
\up_measured_transfer_length[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(5),
      I1 => \up_measured_transfer_length_reg[7]_0\(5),
      O => \up_measured_transfer_length[7]_i_3_n_0\
    );
\up_measured_transfer_length[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(4),
      I1 => \up_measured_transfer_length_reg[7]_0\(4),
      O => \up_measured_transfer_length[7]_i_4_n_0\
    );
\up_measured_transfer_length[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(3),
      I1 => \up_measured_transfer_length_reg[7]_0\(3),
      O => \up_measured_transfer_length[7]_i_5_n_0\
    );
\up_measured_transfer_length[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(2),
      I1 => \up_measured_transfer_length_reg[7]_0\(2),
      O => \up_measured_transfer_length[7]_i_6_n_0\
    );
\up_measured_transfer_length[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(1),
      I1 => \up_measured_transfer_length_reg[7]_0\(1),
      O => \up_measured_transfer_length[7]_i_7_n_0\
    );
\up_measured_transfer_length[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_measured_transfer_length_reg[23]_0\(0),
      I1 => \up_measured_transfer_length_reg[7]_0\(0),
      O => \up_measured_transfer_length[7]_i_8_n_0\
    );
\up_measured_transfer_length_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_15\,
      Q => \^up_measured_transfer_length_reg[23]_0\(0),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_13\,
      Q => \^up_measured_transfer_length_reg[23]_0\(9),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_12\,
      Q => \^up_measured_transfer_length_reg[23]_0\(10),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_11\,
      Q => \^up_measured_transfer_length_reg[23]_0\(11),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_10\,
      Q => \^up_measured_transfer_length_reg[23]_0\(12),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_9\,
      Q => \^up_measured_transfer_length_reg[23]_0\(13),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_8\,
      Q => \^up_measured_transfer_length_reg[23]_0\(14),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \up_measured_transfer_length_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \up_measured_transfer_length_reg[15]_i_1_n_0\,
      CO(6) => \up_measured_transfer_length_reg[15]_i_1_n_1\,
      CO(5) => \up_measured_transfer_length_reg[15]_i_1_n_2\,
      CO(4) => \up_measured_transfer_length_reg[15]_i_1_n_3\,
      CO(3) => \up_measured_transfer_length_reg[15]_i_1_n_4\,
      CO(2) => \up_measured_transfer_length_reg[15]_i_1_n_5\,
      CO(1) => \up_measured_transfer_length_reg[15]_i_1_n_6\,
      CO(0) => \up_measured_transfer_length_reg[15]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \up_measured_transfer_length_reg[15]_i_1_n_8\,
      O(6) => \up_measured_transfer_length_reg[15]_i_1_n_9\,
      O(5) => \up_measured_transfer_length_reg[15]_i_1_n_10\,
      O(4) => \up_measured_transfer_length_reg[15]_i_1_n_11\,
      O(3) => \up_measured_transfer_length_reg[15]_i_1_n_12\,
      O(2) => \up_measured_transfer_length_reg[15]_i_1_n_13\,
      O(1) => \up_measured_transfer_length_reg[15]_i_1_n_14\,
      O(0) => \up_measured_transfer_length_reg[15]_i_1_n_15\,
      S(7 downto 1) => \^up_measured_transfer_length_reg[23]_0\(14 downto 8),
      S(0) => s_axis_data(8)
    );
\up_measured_transfer_length_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_15\,
      Q => \^up_measured_transfer_length_reg[23]_0\(15),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_14\,
      Q => \^up_measured_transfer_length_reg[23]_0\(16),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_13\,
      Q => \^up_measured_transfer_length_reg[23]_0\(17),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_12\,
      Q => \^up_measured_transfer_length_reg[23]_0\(18),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_14\,
      Q => \^up_measured_transfer_length_reg[23]_0\(1),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_11\,
      Q => \^up_measured_transfer_length_reg[23]_0\(19),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_10\,
      Q => \^up_measured_transfer_length_reg[23]_0\(20),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_9\,
      Q => \^up_measured_transfer_length_reg[23]_0\(21),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[23]_i_2_n_8\,
      Q => \^up_measured_transfer_length_reg[23]_0\(22),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[23]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \up_measured_transfer_length_reg[15]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_up_measured_transfer_length_reg[23]_i_2_CO_UNCONNECTED\(7),
      CO(6) => \up_measured_transfer_length_reg[23]_i_2_n_1\,
      CO(5) => \up_measured_transfer_length_reg[23]_i_2_n_2\,
      CO(4) => \up_measured_transfer_length_reg[23]_i_2_n_3\,
      CO(3) => \up_measured_transfer_length_reg[23]_i_2_n_4\,
      CO(2) => \up_measured_transfer_length_reg[23]_i_2_n_5\,
      CO(1) => \up_measured_transfer_length_reg[23]_i_2_n_6\,
      CO(0) => \up_measured_transfer_length_reg[23]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \up_measured_transfer_length_reg[23]_i_2_n_8\,
      O(6) => \up_measured_transfer_length_reg[23]_i_2_n_9\,
      O(5) => \up_measured_transfer_length_reg[23]_i_2_n_10\,
      O(4) => \up_measured_transfer_length_reg[23]_i_2_n_11\,
      O(3) => \up_measured_transfer_length_reg[23]_i_2_n_12\,
      O(2) => \up_measured_transfer_length_reg[23]_i_2_n_13\,
      O(1) => \up_measured_transfer_length_reg[23]_i_2_n_14\,
      O(0) => \up_measured_transfer_length_reg[23]_i_2_n_15\,
      S(7 downto 0) => \^up_measured_transfer_length_reg[23]_0\(22 downto 15)
    );
\up_measured_transfer_length_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_13\,
      Q => \^up_measured_transfer_length_reg[23]_0\(2),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_12\,
      Q => \^up_measured_transfer_length_reg[23]_0\(3),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_11\,
      Q => \^up_measured_transfer_length_reg[23]_0\(4),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_10\,
      Q => \^up_measured_transfer_length_reg[23]_0\(5),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_9\,
      Q => \^up_measured_transfer_length_reg[23]_0\(6),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[7]_i_1_n_8\,
      Q => \^up_measured_transfer_length_reg[23]_0\(7),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => \up_measured_transfer_length_reg[7]_i_1_n_0\,
      CO(6) => \up_measured_transfer_length_reg[7]_i_1_n_1\,
      CO(5) => \up_measured_transfer_length_reg[7]_i_1_n_2\,
      CO(4) => \up_measured_transfer_length_reg[7]_i_1_n_3\,
      CO(3) => \up_measured_transfer_length_reg[7]_i_1_n_4\,
      CO(2) => \up_measured_transfer_length_reg[7]_i_1_n_5\,
      CO(1) => \up_measured_transfer_length_reg[7]_i_1_n_6\,
      CO(0) => \up_measured_transfer_length_reg[7]_i_1_n_7\,
      DI(7) => '0',
      DI(6 downto 0) => \^up_measured_transfer_length_reg[23]_0\(6 downto 0),
      O(7) => \up_measured_transfer_length_reg[7]_i_1_n_8\,
      O(6) => \up_measured_transfer_length_reg[7]_i_1_n_9\,
      O(5) => \up_measured_transfer_length_reg[7]_i_1_n_10\,
      O(4) => \up_measured_transfer_length_reg[7]_i_1_n_11\,
      O(3) => \up_measured_transfer_length_reg[7]_i_1_n_12\,
      O(2) => \up_measured_transfer_length_reg[7]_i_1_n_13\,
      O(1) => \up_measured_transfer_length_reg[7]_i_1_n_14\,
      O(0) => \up_measured_transfer_length_reg[7]_i_1_n_15\,
      S(7) => \^up_measured_transfer_length_reg[23]_0\(7),
      S(6) => \up_measured_transfer_length[7]_i_2_n_0\,
      S(5) => \up_measured_transfer_length[7]_i_3_n_0\,
      S(4) => \up_measured_transfer_length[7]_i_4_n_0\,
      S(3) => \up_measured_transfer_length[7]_i_5_n_0\,
      S(2) => \up_measured_transfer_length[7]_i_6_n_0\,
      S(1) => \up_measured_transfer_length[7]_i_7_n_0\,
      S(0) => \up_measured_transfer_length[7]_i_8_n_0\
    );
\up_measured_transfer_length_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_15\,
      Q => s_axis_data(8),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
\up_measured_transfer_length_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \up_measured_transfer_length_reg[15]_i_1_n_14\,
      Q => \^up_measured_transfer_length_reg[23]_0\(8),
      R => \up_measured_transfer_length[23]_i_1_n_0\
    );
up_partial_length_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_transfer_lenghts_fifo_n_6,
      Q => \^data5\(4),
      R => i_transfer_lenghts_fifo_n_1
    );
up_tlf_s_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_transfer_lenghts_fifo_n_2,
      Q => up_tlf_s_valid_reg_n_0,
      R => '0'
    );
\up_transfer_done_bitmap[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEAAAA"
    )
        port map (
      I0 => \up_transfer_done_bitmap[0]_i_2_n_0\,
      I1 => \up_transfer_done_bitmap_reg[0]_0\,
      I2 => \^up_transfer_id_reg[1]_0\(0),
      I3 => \^up_transfer_id_reg[1]_0\(1),
      I4 => \^data5\(0),
      O => \up_transfer_done_bitmap[0]_i_1_n_0\
    );
\up_transfer_done_bitmap[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      I1 => up_eot,
      I2 => \^up_transfer_id_eot_reg[1]_0\(1),
      O => \up_transfer_done_bitmap[0]_i_2_n_0\
    );
\up_transfer_done_bitmap[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFAAAA"
    )
        port map (
      I0 => \up_transfer_done_bitmap[1]_i_2_n_0\,
      I1 => \up_transfer_done_bitmap_reg[0]_0\,
      I2 => \^up_transfer_id_reg[1]_0\(0),
      I3 => \^up_transfer_id_reg[1]_0\(1),
      I4 => \^data5\(1),
      O => \up_transfer_done_bitmap[1]_i_1_n_0\
    );
\up_transfer_done_bitmap[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      I1 => up_eot,
      I2 => \^up_transfer_id_eot_reg[1]_0\(1),
      O => \up_transfer_done_bitmap[1]_i_2_n_0\
    );
\up_transfer_done_bitmap[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFAAAA"
    )
        port map (
      I0 => \up_transfer_done_bitmap[2]_i_2_n_0\,
      I1 => \up_transfer_done_bitmap_reg[0]_0\,
      I2 => \^up_transfer_id_reg[1]_0\(1),
      I3 => \^up_transfer_id_reg[1]_0\(0),
      I4 => \^data5\(2),
      O => \up_transfer_done_bitmap[2]_i_1_n_0\
    );
\up_transfer_done_bitmap[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      I1 => up_eot,
      I2 => \^up_transfer_id_eot_reg[1]_0\(1),
      O => \up_transfer_done_bitmap[2]_i_2_n_0\
    );
\up_transfer_done_bitmap[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFAAAA"
    )
        port map (
      I0 => \up_transfer_done_bitmap[3]_i_2_n_0\,
      I1 => \up_transfer_done_bitmap_reg[0]_0\,
      I2 => \^up_transfer_id_reg[1]_0\(0),
      I3 => \^up_transfer_id_reg[1]_0\(1),
      I4 => \^data5\(3),
      O => \up_transfer_done_bitmap[3]_i_1_n_0\
    );
\up_transfer_done_bitmap[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      I1 => up_eot,
      I2 => \^up_transfer_id_eot_reg[1]_0\(1),
      O => \up_transfer_done_bitmap[3]_i_2_n_0\
    );
\up_transfer_done_bitmap_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_transfer_done_bitmap[0]_i_1_n_0\,
      Q => \^data5\(0),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_done_bitmap_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_transfer_done_bitmap[1]_i_1_n_0\,
      Q => \^data5\(1),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_done_bitmap_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_transfer_done_bitmap[2]_i_1_n_0\,
      Q => \^data5\(2),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_done_bitmap_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \up_transfer_done_bitmap[3]_i_1_n_0\,
      Q => \^data5\(3),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_id[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^up_transfer_id_reg[1]_0\(0),
      O => \up_transfer_id[0]_i_1_n_0\
    );
\up_transfer_id[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_transfer_id_reg[1]_0\(0),
      I1 => \^up_transfer_id_reg[1]_0\(1),
      O => \up_transfer_id[1]_i_2_n_0\
    );
\up_transfer_id_eot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      O => \up_transfer_id_eot[0]_i_1_n_0\
    );
\up_transfer_id_eot[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^up_transfer_id_eot_reg[1]_0\(0),
      I1 => \^up_transfer_id_eot_reg[1]_0\(1),
      O => \up_transfer_id_eot[1]_i_2_n_0\
    );
\up_transfer_id_eot_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \^up_transfer_id_eot_reg[1]_0\(0),
      Q => s_axis_data(24),
      R => '0'
    );
\up_transfer_id_eot_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => p_7_in,
      D => \^up_transfer_id_eot_reg[1]_0\(1),
      Q => s_axis_data(25),
      R => '0'
    );
\up_transfer_id_eot_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_eot,
      D => \up_transfer_id_eot[0]_i_1_n_0\,
      Q => \^up_transfer_id_eot_reg[1]_0\(0),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_id_eot_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_eot,
      D => \up_transfer_id_eot[1]_i_2_n_0\,
      Q => \^up_transfer_id_eot_reg[1]_0\(1),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_transfer_id_reg[1]_1\(0),
      D => \up_transfer_id[0]_i_1_n_0\,
      Q => \^up_transfer_id_reg[1]_0\(0),
      R => i_transfer_lenghts_fifo_n_1
    );
\up_transfer_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \up_transfer_id_reg[1]_1\(0),
      D => \up_transfer_id[1]_i_2_n_0\,
      Q => \^up_transfer_id_reg[1]_0\(1),
      R => i_transfer_lenghts_fifo_n_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_response_manager is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    response_valid_reg_0 : out STD_LOGIC;
    up_bl_partial : out STD_LOGIC;
    up_eot : out STD_LOGIC;
    dma_req_eot : out STD_LOGIC;
    m_dest_axi_bready : out STD_LOGIC;
    \measured_burst_length_reg[6]_0\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \cdc_sync_stage1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    \cdc_sync_stage1_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    p_3_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    up_response_ready : in STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    \zerodeep.cdc_sync_fifo_ram_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_response_manager : entity is "axi_dmac_response_manager";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_response_manager;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_response_manager is
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal i_dest_response_fifo_n_10 : STD_LOGIC;
  signal i_dest_response_fifo_n_8 : STD_LOGIC;
  signal \measured_burst_length[6]_i_1_n_0\ : STD_LOGIC;
  signal \measured_burst_length[6]_i_2_n_0\ : STD_LOGIC;
  signal \nx_state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal req_eot : STD_LOGIC;
  signal req_eot0 : STD_LOGIC;
  signal req_response_dest_data_burst_length : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal req_response_partial : STD_LOGIC;
  signal response_dest_data_burst_length : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal response_dest_partial : STD_LOGIC;
  signal response_dest_ready : STD_LOGIC;
  signal response_dest_ready_i_3_n_0 : STD_LOGIC;
  signal response_valid_i_1_n_0 : STD_LOGIC;
  signal \^response_valid_reg_0\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal to_complete_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \to_complete_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \to_complete_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \to_complete_count[1]_i_2_n_0\ : STD_LOGIC;
  signal transfer_id : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal transfer_id0 : STD_LOGIC;
  signal \transfer_id[0]_i_1_n_0\ : STD_LOGIC;
  signal \transfer_id[1]_i_2_n_0\ : STD_LOGIC;
  signal up_tlf_s_valid_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_2\ : label is "soft_lutpair67";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011";
  attribute SOFT_HLUTNM of response_dest_ready_i_3 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \to_complete_count[1]_i_2\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \transfer_id[1]_i_2\ : label is "soft_lutpair66";
begin
  response_valid_reg_0 <= \^response_valid_reg_0\;
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => to_complete_count(0),
      I1 => to_complete_count(1),
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFFE000E000"
    )
        port map (
      I0 => to_complete_count(0),
      I1 => to_complete_count(1),
      I2 => state(0),
      I3 => state(1),
      I4 => up_response_ready,
      I5 => state(2),
      O => \nx_state__0\(2)
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \nx_state__0\(0),
      Q => state(0),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \nx_state__0\(1),
      Q => state(1),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \nx_state__0\(2),
      Q => state(2),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
i_dest_response_fifo: entity work.\system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized3\
     port map (
      D(1 downto 0) => \nx_state__0\(1 downto 0),
      E(0) => E(0),
      \FSM_sequential_state_reg[1]\ => \FSM_sequential_state[1]_i_2_n_0\,
      Q(2 downto 0) => state(2 downto 0),
      \cdc_sync_stage1_reg[0]\(0) => \cdc_sync_stage1_reg[0]\(0),
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]_0\(0),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      \out\(8 downto 2) => response_dest_data_burst_length(6 downto 0),
      \out\(1) => response_dest_partial,
      \out\(0) => i_dest_response_fifo_n_8,
      response_dest_ready => response_dest_ready,
      response_dest_ready_reg(0) => req_eot0,
      response_dest_ready_reg_0 => response_dest_ready_i_3_n_0,
      response_ready_reg => i_dest_response_fifo_n_10,
      s_axi_aclk => s_axi_aclk,
      up_response_ready => up_response_ready,
      \zerodeep.cdc_sync_fifo_ram_reg[0]_0\ => \zerodeep.cdc_sync_fifo_ram_reg[0]\,
      \zerodeep.cdc_sync_fifo_ram_reg[8]_0\(6 downto 0) => D(6 downto 0)
    );
\measured_burst_length[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      O => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      O => \measured_burst_length[6]_i_2_n_0\
    );
\measured_burst_length_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(0),
      Q => \measured_burst_length_reg[6]_0\(0),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(1),
      Q => \measured_burst_length_reg[6]_0\(1),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(2),
      Q => \measured_burst_length_reg[6]_0\(2),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(3),
      Q => \measured_burst_length_reg[6]_0\(3),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(4),
      Q => \measured_burst_length_reg[6]_0\(4),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(5),
      Q => \measured_burst_length_reg[6]_0\(5),
      S => \measured_burst_length[6]_i_1_n_0\
    );
\measured_burst_length_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \measured_burst_length[6]_i_2_n_0\,
      D => req_response_dest_data_burst_length(6),
      Q => \measured_burst_length_reg[6]_0\(6),
      S => \measured_burst_length[6]_i_1_n_0\
    );
req_eot_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => i_dest_response_fifo_n_8,
      Q => req_eot,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(0),
      Q => req_response_dest_data_burst_length(0),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(1),
      Q => req_response_dest_data_burst_length(1),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(2),
      Q => req_response_dest_data_burst_length(2),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(3),
      Q => req_response_dest_data_burst_length(3),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(4),
      Q => req_response_dest_data_burst_length(4),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(5),
      Q => req_response_dest_data_burst_length(5),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\req_response_dest_data_burst_length_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_data_burst_length(6),
      Q => req_response_dest_data_burst_length(6),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
req_response_partial_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => req_eot0,
      D => response_dest_partial,
      Q => req_response_partial,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
response_dest_ready_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEEF"
    )
        port map (
      I0 => transfer_id(1),
      I1 => transfer_id(0),
      I2 => to_complete_count(1),
      I3 => to_complete_count(0),
      O => response_dest_ready_i_3_n_0
    );
response_dest_ready_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_dest_response_fifo_n_10,
      Q => response_dest_ready,
      S => \cdc_sync_stage1_reg[0]_0\(0)
    );
response_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555DF550005CF50"
    )
        port map (
      I0 => up_response_ready,
      I1 => \FSM_sequential_state[1]_i_2_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => state(2),
      I5 => \^response_valid_reg_0\,
      O => response_valid_i_1_n_0
    );
response_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => response_valid_i_1_n_0,
      Q => \^response_valid_reg_0\,
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\to_complete_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => to_complete_count(0),
      O => \to_complete_count[0]_i_1_n_0\
    );
\to_complete_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => up_response_ready,
      O => \to_complete_count[1]_i_1_n_0\
    );
\to_complete_count[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => to_complete_count(0),
      I1 => to_complete_count(1),
      O => \to_complete_count[1]_i_2_n_0\
    );
\to_complete_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \to_complete_count[1]_i_1_n_0\,
      D => \to_complete_count[0]_i_1_n_0\,
      Q => to_complete_count(0),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\to_complete_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \to_complete_count[1]_i_1_n_0\,
      D => \to_complete_count[1]_i_2_n_0\,
      Q => to_complete_count(1),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\transfer_id[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => transfer_id(0),
      O => \transfer_id[0]_i_1_n_0\
    );
\transfer_id[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03080008"
    )
        port map (
      I0 => req_eot,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => up_response_ready,
      O => transfer_id0
    );
\transfer_id[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => transfer_id(0),
      I1 => transfer_id(1),
      O => \transfer_id[1]_i_2_n_0\
    );
\transfer_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => transfer_id0,
      D => \transfer_id[0]_i_1_n_0\,
      Q => transfer_id(0),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
\transfer_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => transfer_id0,
      D => \transfer_id[1]_i_2_n_0\,
      Q => transfer_id(1),
      R => \cdc_sync_stage1_reg[0]_0\(0)
    );
up_clear_tl_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => req_eot,
      O => dma_req_eot
    );
up_tlf_s_valid_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => p_3_in(0),
      I1 => req_response_partial,
      I2 => up_tlf_s_valid_i_3_n_0,
      I3 => state(2),
      I4 => state(0),
      I5 => state(1),
      O => up_bl_partial
    );
up_tlf_s_valid_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^response_valid_reg_0\,
      I1 => up_response_ready,
      O => up_tlf_s_valid_i_3_n_0
    );
\up_transfer_id_eot[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => \^response_valid_reg_0\,
      I1 => up_response_ready,
      I2 => state(2),
      I3 => state(0),
      I4 => state(1),
      I5 => req_eot,
      O => up_eot
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap is
  port (
    ctrl_enable : out STD_LOGIC;
    s_axi_aresetn_0 : out STD_LOGIC;
    ctrl_pause : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 60 downto 0 );
    p_3_in : out STD_LOGIC_VECTOR ( 0 to 0 );
    irq : out STD_LOGIC;
    up_dma_req_valid : out STD_LOGIC;
    up_response_ready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    up_axi_rvalid_int_reg : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \up_raddr_int_reg[0]\ : out STD_LOGIC;
    \up_dma_x_length_reg[23]\ : out STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    dma_req_eot : in STD_LOGIC;
    up_response_valid : in STD_LOGIC;
    up_bl_partial : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \up_irq_source_reg[0]_0\ : in STD_LOGIC;
    \up_rdata_reg[8]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_awaddr : in STD_LOGIC_VECTOR ( 26 downto 0 );
    ADDRC : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dbg_status : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \up_rdata_reg[10]_0\ : in STD_LOGIC;
    dbg_ids1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \up_rdata_reg[9]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \up_rdata_reg[11]_0\ : in STD_LOGIC;
    dbg_ids0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    g : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \up_rdata_reg[9]_1\ : in STD_LOGIC;
    \up_rdata_reg[10]_1\ : in STD_LOGIC;
    \up_rdata[8]_i_2\ : in STD_LOGIC;
    up_eot : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \up_measured_transfer_length_reg[7]\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap : entity is "axi_dmac_regmap";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap is
  signal \^d\ : STD_LOGIC_VECTOR ( 60 downto 0 );
  signal \^ctrl_enable\ : STD_LOGIC;
  signal \^ctrl_pause\ : STD_LOGIC;
  signal data5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data9 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal i_regmap_request_n_119 : STD_LOGIC;
  signal i_regmap_request_n_120 : STD_LOGIC;
  signal i_regmap_request_n_121 : STD_LOGIC;
  signal i_regmap_request_n_122 : STD_LOGIC;
  signal i_regmap_request_n_123 : STD_LOGIC;
  signal i_regmap_request_n_124 : STD_LOGIC;
  signal i_regmap_request_n_125 : STD_LOGIC;
  signal i_regmap_request_n_126 : STD_LOGIC;
  signal i_regmap_request_n_127 : STD_LOGIC;
  signal i_regmap_request_n_128 : STD_LOGIC;
  signal i_regmap_request_n_129 : STD_LOGIC;
  signal i_regmap_request_n_130 : STD_LOGIC;
  signal i_regmap_request_n_131 : STD_LOGIC;
  signal i_regmap_request_n_132 : STD_LOGIC;
  signal i_regmap_request_n_133 : STD_LOGIC;
  signal i_regmap_request_n_134 : STD_LOGIC;
  signal i_regmap_request_n_135 : STD_LOGIC;
  signal i_regmap_request_n_136 : STD_LOGIC;
  signal i_regmap_request_n_137 : STD_LOGIC;
  signal i_regmap_request_n_138 : STD_LOGIC;
  signal i_regmap_request_n_139 : STD_LOGIC;
  signal i_regmap_request_n_140 : STD_LOGIC;
  signal i_regmap_request_n_141 : STD_LOGIC;
  signal i_regmap_request_n_72 : STD_LOGIC;
  signal \i_transfer_lenghts_fifo/fifo._m_axis_valid\ : STD_LOGIC;
  signal i_up_axi_n_10 : STD_LOGIC;
  signal i_up_axi_n_11 : STD_LOGIC;
  signal i_up_axi_n_12 : STD_LOGIC;
  signal i_up_axi_n_13 : STD_LOGIC;
  signal i_up_axi_n_14 : STD_LOGIC;
  signal i_up_axi_n_15 : STD_LOGIC;
  signal i_up_axi_n_38 : STD_LOGIC;
  signal i_up_axi_n_39 : STD_LOGIC;
  signal i_up_axi_n_7 : STD_LOGIC;
  signal i_up_axi_n_73 : STD_LOGIC;
  signal i_up_axi_n_75 : STD_LOGIC;
  signal i_up_axi_n_76 : STD_LOGIC;
  signal i_up_axi_n_77 : STD_LOGIC;
  signal i_up_axi_n_8 : STD_LOGIC;
  signal i_up_axi_n_80 : STD_LOGIC;
  signal i_up_axi_n_81 : STD_LOGIC;
  signal i_up_axi_n_82 : STD_LOGIC;
  signal i_up_axi_n_83 : STD_LOGIC;
  signal i_up_axi_n_84 : STD_LOGIC;
  signal i_up_axi_n_86 : STD_LOGIC;
  signal i_up_axi_n_9 : STD_LOGIC;
  signal irq_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \^p_3_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_aresetn_0\ : STD_LOGIC;
  signal s_axis_data : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal up_dma_cyclic : STD_LOGIC;
  signal up_dma_dest_address : STD_LOGIC;
  signal \^up_dma_req_valid\ : STD_LOGIC;
  signal up_dma_src_address : STD_LOGIC;
  signal up_dma_x_length1_in : STD_LOGIC_VECTOR ( 23 downto 3 );
  signal \^up_dma_x_length_reg[23]\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \up_irq_mask_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_irq_mask_reg_n_0_[1]\ : STD_LOGIC;
  signal up_irq_source : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal up_rack : STD_LOGIC;
  signal up_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \up_rdata_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[10]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[11]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[12]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[13]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[14]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[15]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[16]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[17]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[18]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[19]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[1]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[20]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[21]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[22]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[23]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[24]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[25]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[26]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[27]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[28]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[29]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[2]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[30]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[31]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[3]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[4]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[5]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[6]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[7]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[8]\ : STD_LOGIC;
  signal \up_rdata_reg_n_0_[9]\ : STD_LOGIC;
  signal up_rreq : STD_LOGIC;
  signal \up_scratch_reg_n_0_[0]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[10]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[11]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[12]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[13]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[14]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[15]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[16]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[17]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[18]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[19]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[1]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[20]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[21]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[22]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[23]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[24]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[25]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[26]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[27]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[28]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[29]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[2]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[30]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[31]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[3]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[4]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[5]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[6]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[7]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[8]\ : STD_LOGIC;
  signal \up_scratch_reg_n_0_[9]\ : STD_LOGIC;
  signal up_tlf_valid : STD_LOGIC;
  signal up_transfer_id : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal up_transfer_id_eot : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal up_wack : STD_LOGIC;
  signal up_wreq : STD_LOGIC;
begin
  D(60 downto 0) <= \^d\(60 downto 0);
  ctrl_enable <= \^ctrl_enable\;
  ctrl_pause <= \^ctrl_pause\;
  p_3_in(0) <= \^p_3_in\(0);
  s_axi_aresetn_0 <= \^s_axi_aresetn_0\;
  up_dma_req_valid <= \^up_dma_req_valid\;
  \up_dma_x_length_reg[23]\(16 downto 0) <= \^up_dma_x_length_reg[23]\(16 downto 0);
ctrl_enable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_80,
      D => i_up_axi_n_39,
      Q => \^ctrl_enable\,
      R => \^s_axi_aresetn_0\
    );
ctrl_pause_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_80,
      D => i_up_axi_n_38,
      Q => \^ctrl_pause\,
      R => \^s_axi_aresetn_0\
    );
i_regmap_request: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap_request
     port map (
      D(60 downto 0) => \^d\(60 downto 0),
      E(0) => up_dma_dest_address,
      Q(29) => i_up_axi_n_9,
      Q(28) => i_up_axi_n_10,
      Q(27) => i_up_axi_n_11,
      Q(26) => i_up_axi_n_12,
      Q(25) => i_up_axi_n_13,
      Q(24) => i_up_axi_n_14,
      Q(23) => i_up_axi_n_15,
      Q(22 downto 2) => up_dma_x_length1_in(23 downto 3),
      Q(1) => p_0_in,
      Q(0) => i_up_axi_n_38,
      SR(0) => \^s_axi_aresetn_0\,
      data5(4) => data5(31),
      data5(3 downto 0) => data5(3 downto 0),
      dma_req_eot => dma_req_eot,
      \fifo._m_axis_valid\ => \i_transfer_lenghts_fifo/fifo._m_axis_valid\,
      \fifo.sync_clocks.data_reg[25]\(24 downto 23) => data9(1 downto 0),
      \fifo.sync_clocks.data_reg[25]\(22) => i_regmap_request_n_119,
      \fifo.sync_clocks.data_reg[25]\(21) => i_regmap_request_n_120,
      \fifo.sync_clocks.data_reg[25]\(20) => i_regmap_request_n_121,
      \fifo.sync_clocks.data_reg[25]\(19) => i_regmap_request_n_122,
      \fifo.sync_clocks.data_reg[25]\(18) => i_regmap_request_n_123,
      \fifo.sync_clocks.data_reg[25]\(17) => i_regmap_request_n_124,
      \fifo.sync_clocks.data_reg[25]\(16) => i_regmap_request_n_125,
      \fifo.sync_clocks.data_reg[25]\(15) => i_regmap_request_n_126,
      \fifo.sync_clocks.data_reg[25]\(14) => i_regmap_request_n_127,
      \fifo.sync_clocks.data_reg[25]\(13) => i_regmap_request_n_128,
      \fifo.sync_clocks.data_reg[25]\(12) => i_regmap_request_n_129,
      \fifo.sync_clocks.data_reg[25]\(11) => i_regmap_request_n_130,
      \fifo.sync_clocks.data_reg[25]\(10) => i_regmap_request_n_131,
      \fifo.sync_clocks.data_reg[25]\(9) => i_regmap_request_n_132,
      \fifo.sync_clocks.data_reg[25]\(8) => i_regmap_request_n_133,
      \fifo.sync_clocks.data_reg[25]\(7) => i_regmap_request_n_134,
      \fifo.sync_clocks.data_reg[25]\(6) => i_regmap_request_n_135,
      \fifo.sync_clocks.data_reg[25]\(5) => i_regmap_request_n_136,
      \fifo.sync_clocks.data_reg[25]\(4) => i_regmap_request_n_137,
      \fifo.sync_clocks.data_reg[25]\(3) => i_regmap_request_n_138,
      \fifo.sync_clocks.data_reg[25]\(2) => i_regmap_request_n_139,
      \fifo.sync_clocks.data_reg[25]\(1) => i_regmap_request_n_140,
      \fifo.sync_clocks.data_reg[25]\(0) => i_regmap_request_n_141,
      \fifo.sync_clocks.data_reg[8]\ => i_regmap_request_n_72,
      \fifo.valid_reg\ => i_up_axi_n_86,
      \m_axis_raddr_reg_reg[0]\ => i_up_axi_n_73,
      p_3_in(0) => \^p_3_in\(0),
      response_ready_reg_0 => up_response_ready,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      \s_axis_waddr_reg_reg[0]\ => \^ctrl_enable\,
      up_bl_partial => up_bl_partial,
      up_dma_cyclic => up_dma_cyclic,
      up_dma_req_valid => \^up_dma_req_valid\,
      up_dma_req_valid_reg_0 => i_up_axi_n_7,
      \up_dma_src_address_reg[30]_0\(0) => up_dma_src_address,
      \up_dma_x_length_reg[23]_0\(16 downto 0) => \^up_dma_x_length_reg[23]\(16 downto 0),
      \up_dma_x_length_reg[3]_0\(0) => i_up_axi_n_77,
      up_eot => up_eot,
      \up_measured_transfer_length_reg[23]_0\(22 downto 8) => s_axis_data(23 downto 9),
      \up_measured_transfer_length_reg[23]_0\(7 downto 0) => s_axis_data(7 downto 0),
      \up_measured_transfer_length_reg[7]_0\(6 downto 0) => \up_measured_transfer_length_reg[7]\(6 downto 0),
      \up_rdata[8]_i_2\ => i_up_axi_n_76,
      \up_rdata[8]_i_2_0\ => i_up_axi_n_75,
      up_response_valid => up_response_valid,
      up_rreq => up_rreq,
      up_tlf_valid => up_tlf_valid,
      \up_transfer_done_bitmap_reg[0]_0\ => \up_irq_source_reg[0]_0\,
      \up_transfer_id_eot_reg[1]_0\(1 downto 0) => up_transfer_id_eot(1 downto 0),
      \up_transfer_id_reg[1]_0\(1 downto 0) => up_transfer_id(1 downto 0),
      \up_transfer_id_reg[1]_1\(0) => E(0)
    );
i_up_axi: entity work.system_axi_adrv9001_rx1_dma_0_up_axi
     port map (
      ADDRC(3 downto 0) => ADDRC(3 downto 0),
      D(31 downto 0) => up_rdata(31 downto 0),
      E(0) => up_dma_dest_address,
      Q(31) => i_up_axi_n_8,
      Q(30) => i_up_axi_n_9,
      Q(29) => i_up_axi_n_10,
      Q(28) => i_up_axi_n_11,
      Q(27) => i_up_axi_n_12,
      Q(26) => i_up_axi_n_13,
      Q(25) => i_up_axi_n_14,
      Q(24) => i_up_axi_n_15,
      Q(23 downto 3) => up_dma_x_length1_in(23 downto 3),
      Q(2) => p_0_in,
      Q(1) => i_up_axi_n_38,
      Q(0) => i_up_axi_n_39,
      SR(0) => \^s_axi_aresetn_0\,
      ctrl_pause => \^ctrl_pause\,
      data5(4) => data5(31),
      data5(3 downto 0) => data5(3 downto 0),
      dbg_ids0(7 downto 0) => dbg_ids0(7 downto 0),
      dbg_ids1(3 downto 0) => dbg_ids1(3 downto 0),
      dbg_status(6 downto 0) => dbg_status(6 downto 0),
      \fifo._m_axis_valid\ => \i_transfer_lenghts_fifo/fifo._m_axis_valid\,
      g(3 downto 0) => g(3 downto 0),
      m_dest_axi_awaddr(26 downto 0) => m_dest_axi_awaddr(26 downto 0),
      p_3_in(0) => \^p_3_in\(0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(8 downto 0) => s_axi_araddr(8 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(8 downto 0) => s_axi_awaddr(8 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      up_axi_rvalid_int_reg_0 => up_axi_rvalid_int_reg,
      up_dma_cyclic => up_dma_cyclic,
      up_dma_req_valid => \^up_dma_req_valid\,
      up_dma_req_valid_reg => \^ctrl_enable\,
      up_eot => up_eot,
      \up_irq_source_reg[0]\ => \up_irq_source_reg[0]_0\,
      \up_irq_source_reg[1]\(1 downto 0) => up_irq_source(1 downto 0),
      up_rack => up_rack,
      \up_raddr_int_reg[0]_0\ => i_up_axi_n_73,
      \up_raddr_int_reg[0]_1\ => \up_raddr_int_reg[0]\,
      \up_raddr_int_reg[1]_0\(0) => Q(0),
      \up_raddr_int_reg[1]_1\ => i_up_axi_n_75,
      \up_raddr_int_reg[1]_2\ => i_up_axi_n_76,
      \up_rdata[1]_i_3_0\(1 downto 0) => up_transfer_id_eot(1 downto 0),
      \up_rdata[1]_i_7_0\(1) => \up_irq_mask_reg_n_0_[1]\,
      \up_rdata[1]_i_7_0\(0) => \up_irq_mask_reg_n_0_[0]\,
      \up_rdata[1]_i_8_0\(1 downto 0) => up_transfer_id(1 downto 0),
      \up_rdata[8]_i_2_0\ => \up_rdata[8]_i_2\,
      \up_rdata_d_reg[31]_0\(31) => \up_rdata_reg_n_0_[31]\,
      \up_rdata_d_reg[31]_0\(30) => \up_rdata_reg_n_0_[30]\,
      \up_rdata_d_reg[31]_0\(29) => \up_rdata_reg_n_0_[29]\,
      \up_rdata_d_reg[31]_0\(28) => \up_rdata_reg_n_0_[28]\,
      \up_rdata_d_reg[31]_0\(27) => \up_rdata_reg_n_0_[27]\,
      \up_rdata_d_reg[31]_0\(26) => \up_rdata_reg_n_0_[26]\,
      \up_rdata_d_reg[31]_0\(25) => \up_rdata_reg_n_0_[25]\,
      \up_rdata_d_reg[31]_0\(24) => \up_rdata_reg_n_0_[24]\,
      \up_rdata_d_reg[31]_0\(23) => \up_rdata_reg_n_0_[23]\,
      \up_rdata_d_reg[31]_0\(22) => \up_rdata_reg_n_0_[22]\,
      \up_rdata_d_reg[31]_0\(21) => \up_rdata_reg_n_0_[21]\,
      \up_rdata_d_reg[31]_0\(20) => \up_rdata_reg_n_0_[20]\,
      \up_rdata_d_reg[31]_0\(19) => \up_rdata_reg_n_0_[19]\,
      \up_rdata_d_reg[31]_0\(18) => \up_rdata_reg_n_0_[18]\,
      \up_rdata_d_reg[31]_0\(17) => \up_rdata_reg_n_0_[17]\,
      \up_rdata_d_reg[31]_0\(16) => \up_rdata_reg_n_0_[16]\,
      \up_rdata_d_reg[31]_0\(15) => \up_rdata_reg_n_0_[15]\,
      \up_rdata_d_reg[31]_0\(14) => \up_rdata_reg_n_0_[14]\,
      \up_rdata_d_reg[31]_0\(13) => \up_rdata_reg_n_0_[13]\,
      \up_rdata_d_reg[31]_0\(12) => \up_rdata_reg_n_0_[12]\,
      \up_rdata_d_reg[31]_0\(11) => \up_rdata_reg_n_0_[11]\,
      \up_rdata_d_reg[31]_0\(10) => \up_rdata_reg_n_0_[10]\,
      \up_rdata_d_reg[31]_0\(9) => \up_rdata_reg_n_0_[9]\,
      \up_rdata_d_reg[31]_0\(8) => \up_rdata_reg_n_0_[8]\,
      \up_rdata_d_reg[31]_0\(7) => \up_rdata_reg_n_0_[7]\,
      \up_rdata_d_reg[31]_0\(6) => \up_rdata_reg_n_0_[6]\,
      \up_rdata_d_reg[31]_0\(5) => \up_rdata_reg_n_0_[5]\,
      \up_rdata_d_reg[31]_0\(4) => \up_rdata_reg_n_0_[4]\,
      \up_rdata_d_reg[31]_0\(3) => \up_rdata_reg_n_0_[3]\,
      \up_rdata_d_reg[31]_0\(2) => \up_rdata_reg_n_0_[2]\,
      \up_rdata_d_reg[31]_0\(1) => \up_rdata_reg_n_0_[1]\,
      \up_rdata_d_reg[31]_0\(0) => \up_rdata_reg_n_0_[0]\,
      \up_rdata_reg[10]\ => \up_rdata_reg[10]_0\,
      \up_rdata_reg[10]_0\ => \up_rdata_reg[10]_1\,
      \up_rdata_reg[11]\ => \up_rdata_reg[11]_0\,
      \up_rdata_reg[1]\(24 downto 23) => data9(1 downto 0),
      \up_rdata_reg[1]\(22) => i_regmap_request_n_119,
      \up_rdata_reg[1]\(21) => i_regmap_request_n_120,
      \up_rdata_reg[1]\(20) => i_regmap_request_n_121,
      \up_rdata_reg[1]\(19) => i_regmap_request_n_122,
      \up_rdata_reg[1]\(18) => i_regmap_request_n_123,
      \up_rdata_reg[1]\(17) => i_regmap_request_n_124,
      \up_rdata_reg[1]\(16) => i_regmap_request_n_125,
      \up_rdata_reg[1]\(15) => i_regmap_request_n_126,
      \up_rdata_reg[1]\(14) => i_regmap_request_n_127,
      \up_rdata_reg[1]\(13) => i_regmap_request_n_128,
      \up_rdata_reg[1]\(12) => i_regmap_request_n_129,
      \up_rdata_reg[1]\(11) => i_regmap_request_n_130,
      \up_rdata_reg[1]\(10) => i_regmap_request_n_131,
      \up_rdata_reg[1]\(9) => i_regmap_request_n_132,
      \up_rdata_reg[1]\(8) => i_regmap_request_n_133,
      \up_rdata_reg[1]\(7) => i_regmap_request_n_134,
      \up_rdata_reg[1]\(6) => i_regmap_request_n_135,
      \up_rdata_reg[1]\(5) => i_regmap_request_n_136,
      \up_rdata_reg[1]\(4) => i_regmap_request_n_137,
      \up_rdata_reg[1]\(3) => i_regmap_request_n_138,
      \up_rdata_reg[1]\(2) => i_regmap_request_n_139,
      \up_rdata_reg[1]\(1) => i_regmap_request_n_140,
      \up_rdata_reg[1]\(0) => i_regmap_request_n_141,
      \up_rdata_reg[23]\(22 downto 8) => s_axis_data(23 downto 9),
      \up_rdata_reg[23]\(7 downto 0) => s_axis_data(7 downto 0),
      \up_rdata_reg[23]_0\(16 downto 0) => \^up_dma_x_length_reg[23]\(16 downto 0),
      \up_rdata_reg[30]\(32 downto 5) => \^d\(60 downto 33),
      \up_rdata_reg[30]\(4 downto 0) => \^d\(4 downto 0),
      \up_rdata_reg[31]\(31) => \up_scratch_reg_n_0_[31]\,
      \up_rdata_reg[31]\(30) => \up_scratch_reg_n_0_[30]\,
      \up_rdata_reg[31]\(29) => \up_scratch_reg_n_0_[29]\,
      \up_rdata_reg[31]\(28) => \up_scratch_reg_n_0_[28]\,
      \up_rdata_reg[31]\(27) => \up_scratch_reg_n_0_[27]\,
      \up_rdata_reg[31]\(26) => \up_scratch_reg_n_0_[26]\,
      \up_rdata_reg[31]\(25) => \up_scratch_reg_n_0_[25]\,
      \up_rdata_reg[31]\(24) => \up_scratch_reg_n_0_[24]\,
      \up_rdata_reg[31]\(23) => \up_scratch_reg_n_0_[23]\,
      \up_rdata_reg[31]\(22) => \up_scratch_reg_n_0_[22]\,
      \up_rdata_reg[31]\(21) => \up_scratch_reg_n_0_[21]\,
      \up_rdata_reg[31]\(20) => \up_scratch_reg_n_0_[20]\,
      \up_rdata_reg[31]\(19) => \up_scratch_reg_n_0_[19]\,
      \up_rdata_reg[31]\(18) => \up_scratch_reg_n_0_[18]\,
      \up_rdata_reg[31]\(17) => \up_scratch_reg_n_0_[17]\,
      \up_rdata_reg[31]\(16) => \up_scratch_reg_n_0_[16]\,
      \up_rdata_reg[31]\(15) => \up_scratch_reg_n_0_[15]\,
      \up_rdata_reg[31]\(14) => \up_scratch_reg_n_0_[14]\,
      \up_rdata_reg[31]\(13) => \up_scratch_reg_n_0_[13]\,
      \up_rdata_reg[31]\(12) => \up_scratch_reg_n_0_[12]\,
      \up_rdata_reg[31]\(11) => \up_scratch_reg_n_0_[11]\,
      \up_rdata_reg[31]\(10) => \up_scratch_reg_n_0_[10]\,
      \up_rdata_reg[31]\(9) => \up_scratch_reg_n_0_[9]\,
      \up_rdata_reg[31]\(8) => \up_scratch_reg_n_0_[8]\,
      \up_rdata_reg[31]\(7) => \up_scratch_reg_n_0_[7]\,
      \up_rdata_reg[31]\(6) => \up_scratch_reg_n_0_[6]\,
      \up_rdata_reg[31]\(5) => \up_scratch_reg_n_0_[5]\,
      \up_rdata_reg[31]\(4) => \up_scratch_reg_n_0_[4]\,
      \up_rdata_reg[31]\(3) => \up_scratch_reg_n_0_[3]\,
      \up_rdata_reg[31]\(2) => \up_scratch_reg_n_0_[2]\,
      \up_rdata_reg[31]\(1) => \up_scratch_reg_n_0_[1]\,
      \up_rdata_reg[31]\(0) => \up_scratch_reg_n_0_[0]\,
      \up_rdata_reg[8]\(0) => \up_rdata_reg[8]_0\(0),
      \up_rdata_reg[8]_0\ => i_regmap_request_n_72,
      \up_rdata_reg[9]\(0) => \up_rdata_reg[9]_0\(0),
      \up_rdata_reg[9]_0\ => \up_rdata_reg[9]_1\,
      up_rreq => up_rreq,
      up_rreq_int_reg_0 => i_up_axi_n_86,
      up_tlf_valid => up_tlf_valid,
      up_wack => up_wack,
      \up_waddr_int_reg[0]_0\(0) => i_up_axi_n_81,
      \up_waddr_int_reg[1]_0\ => i_up_axi_n_80,
      \up_waddr_int_reg[5]_0\(0) => i_up_axi_n_77,
      \up_waddr_int_reg[8]_0\(0) => up_dma_src_address,
      \up_waddr_int_reg[8]_1\(0) => i_up_axi_n_84,
      \up_wdata_int_reg[0]_0\ => i_up_axi_n_7,
      \up_wdata_int_reg[1]_0\(1) => i_up_axi_n_82,
      \up_wdata_int_reg[1]_0\(0) => i_up_axi_n_83,
      up_wreq => up_wreq
    );
irq_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \up_irq_mask_reg_n_0_[0]\,
      I1 => up_irq_source(0),
      I2 => \up_irq_mask_reg_n_0_[1]\,
      I3 => up_irq_source(1),
      O => irq_i_1_n_0
    );
irq_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => irq_i_1_n_0,
      Q => irq,
      R => \^s_axi_aresetn_0\
    );
\up_irq_mask_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_84,
      D => i_up_axi_n_39,
      Q => \up_irq_mask_reg_n_0_[0]\,
      S => \^s_axi_aresetn_0\
    );
\up_irq_mask_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_84,
      D => i_up_axi_n_38,
      Q => \up_irq_mask_reg_n_0_[1]\,
      S => \^s_axi_aresetn_0\
    );
\up_irq_source_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_83,
      Q => up_irq_source(0),
      R => \^s_axi_aresetn_0\
    );
\up_irq_source_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => i_up_axi_n_82,
      Q => up_irq_source(1),
      R => \^s_axi_aresetn_0\
    );
up_rack_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_rreq,
      Q => up_rack,
      R => \^s_axi_aresetn_0\
    );
\up_rdata_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(0),
      Q => \up_rdata_reg_n_0_[0]\,
      R => '0'
    );
\up_rdata_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(10),
      Q => \up_rdata_reg_n_0_[10]\,
      R => '0'
    );
\up_rdata_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(11),
      Q => \up_rdata_reg_n_0_[11]\,
      R => '0'
    );
\up_rdata_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(12),
      Q => \up_rdata_reg_n_0_[12]\,
      R => '0'
    );
\up_rdata_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(13),
      Q => \up_rdata_reg_n_0_[13]\,
      R => '0'
    );
\up_rdata_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(14),
      Q => \up_rdata_reg_n_0_[14]\,
      R => '0'
    );
\up_rdata_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(15),
      Q => \up_rdata_reg_n_0_[15]\,
      R => '0'
    );
\up_rdata_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(16),
      Q => \up_rdata_reg_n_0_[16]\,
      R => '0'
    );
\up_rdata_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(17),
      Q => \up_rdata_reg_n_0_[17]\,
      R => '0'
    );
\up_rdata_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(18),
      Q => \up_rdata_reg_n_0_[18]\,
      R => '0'
    );
\up_rdata_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(19),
      Q => \up_rdata_reg_n_0_[19]\,
      R => '0'
    );
\up_rdata_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(1),
      Q => \up_rdata_reg_n_0_[1]\,
      R => '0'
    );
\up_rdata_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(20),
      Q => \up_rdata_reg_n_0_[20]\,
      R => '0'
    );
\up_rdata_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(21),
      Q => \up_rdata_reg_n_0_[21]\,
      R => '0'
    );
\up_rdata_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(22),
      Q => \up_rdata_reg_n_0_[22]\,
      R => '0'
    );
\up_rdata_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(23),
      Q => \up_rdata_reg_n_0_[23]\,
      R => '0'
    );
\up_rdata_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(24),
      Q => \up_rdata_reg_n_0_[24]\,
      R => '0'
    );
\up_rdata_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(25),
      Q => \up_rdata_reg_n_0_[25]\,
      R => '0'
    );
\up_rdata_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(26),
      Q => \up_rdata_reg_n_0_[26]\,
      R => '0'
    );
\up_rdata_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(27),
      Q => \up_rdata_reg_n_0_[27]\,
      R => '0'
    );
\up_rdata_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(28),
      Q => \up_rdata_reg_n_0_[28]\,
      R => '0'
    );
\up_rdata_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(29),
      Q => \up_rdata_reg_n_0_[29]\,
      R => '0'
    );
\up_rdata_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(2),
      Q => \up_rdata_reg_n_0_[2]\,
      R => '0'
    );
\up_rdata_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(30),
      Q => \up_rdata_reg_n_0_[30]\,
      R => '0'
    );
\up_rdata_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(31),
      Q => \up_rdata_reg_n_0_[31]\,
      R => '0'
    );
\up_rdata_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(3),
      Q => \up_rdata_reg_n_0_[3]\,
      R => '0'
    );
\up_rdata_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(4),
      Q => \up_rdata_reg_n_0_[4]\,
      R => '0'
    );
\up_rdata_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(5),
      Q => \up_rdata_reg_n_0_[5]\,
      R => '0'
    );
\up_rdata_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(6),
      Q => \up_rdata_reg_n_0_[6]\,
      R => '0'
    );
\up_rdata_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(7),
      Q => \up_rdata_reg_n_0_[7]\,
      R => '0'
    );
\up_rdata_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(8),
      Q => \up_rdata_reg_n_0_[8]\,
      R => '0'
    );
\up_rdata_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => up_rreq,
      D => up_rdata(9),
      Q => \up_rdata_reg_n_0_[9]\,
      R => '0'
    );
\up_scratch_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_39,
      Q => \up_scratch_reg_n_0_[0]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(10),
      Q => \up_scratch_reg_n_0_[10]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(11),
      Q => \up_scratch_reg_n_0_[11]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(12),
      Q => \up_scratch_reg_n_0_[12]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(13),
      Q => \up_scratch_reg_n_0_[13]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(14),
      Q => \up_scratch_reg_n_0_[14]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(15),
      Q => \up_scratch_reg_n_0_[15]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(16),
      Q => \up_scratch_reg_n_0_[16]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(17),
      Q => \up_scratch_reg_n_0_[17]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(18),
      Q => \up_scratch_reg_n_0_[18]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(19),
      Q => \up_scratch_reg_n_0_[19]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_38,
      Q => \up_scratch_reg_n_0_[1]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(20),
      Q => \up_scratch_reg_n_0_[20]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(21),
      Q => \up_scratch_reg_n_0_[21]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(22),
      Q => \up_scratch_reg_n_0_[22]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(23),
      Q => \up_scratch_reg_n_0_[23]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_15,
      Q => \up_scratch_reg_n_0_[24]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_14,
      Q => \up_scratch_reg_n_0_[25]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_13,
      Q => \up_scratch_reg_n_0_[26]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_12,
      Q => \up_scratch_reg_n_0_[27]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_11,
      Q => \up_scratch_reg_n_0_[28]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_10,
      Q => \up_scratch_reg_n_0_[29]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => p_0_in,
      Q => \up_scratch_reg_n_0_[2]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_9,
      Q => \up_scratch_reg_n_0_[30]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => i_up_axi_n_8,
      Q => \up_scratch_reg_n_0_[31]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(3),
      Q => \up_scratch_reg_n_0_[3]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(4),
      Q => \up_scratch_reg_n_0_[4]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(5),
      Q => \up_scratch_reg_n_0_[5]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(6),
      Q => \up_scratch_reg_n_0_[6]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(7),
      Q => \up_scratch_reg_n_0_[7]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(8),
      Q => \up_scratch_reg_n_0_[8]\,
      R => \^s_axi_aresetn_0\
    );
\up_scratch_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => i_up_axi_n_81,
      D => up_dma_x_length1_in(9),
      Q => \up_scratch_reg_n_0_[9]\,
      R => \^s_axi_aresetn_0\
    );
up_wack_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => up_wreq,
      Q => up_wack,
      R => \^s_axi_aresetn_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_request_arb is
  port (
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    addr_valid_reg : out STD_LOGIC;
    g : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_overflow : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    id0_in : out STD_LOGIC_VECTOR ( 3 downto 0 );
    id : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 27 downto 0 );
    enabled : out STD_LOGIC;
    active_reg : out STD_LOGIC;
    dest_mem_data_valid_reg : out STD_LOGIC;
    m_dest_axi_wlast : out STD_LOGIC;
    response_valid_reg : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]\ : out STD_LOGIC;
    up_bl_partial : out STD_LOGIC;
    up_eot : out STD_LOGIC;
    dma_req_eot : out STD_LOGIC;
    dbg_ids0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_bready : out STD_LOGIC;
    last_non_eot_reg : out STD_LOGIC;
    dbg_ids1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \measured_burst_length_reg[6]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \cdc_sync_stage1_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    dest_id_reduced_msb_next_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    src_id_reduced_msb_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_wready : in STD_LOGIC;
    up_dma_req_valid : in STD_LOGIC;
    \zerodeep.s_axis_waddr_reg\ : in STD_LOGIC;
    p_3_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    up_response_ready : in STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    sync : in STD_LOGIC;
    src_enable : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    dest_enable : in STD_LOGIC;
    up_dma_req_x_length : in STD_LOGIC_VECTOR ( 20 downto 0 );
    D : in STD_LOGIC_VECTOR ( 56 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_request_arb : entity is "request_arb";
end system_axi_adrv9001_rx1_dma_0_request_arb;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_request_arb is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^cdc_sync_stage2_reg[0]\ : STD_LOGIC;
  signal \^dbg_ids0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_address_eot : STD_LOGIC;
  signal dest_bl_ready : STD_LOGIC;
  signal dest_bl_valid : STD_LOGIC;
  signal dest_burst_info_write : STD_LOGIC;
  signal dest_burst_len : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_burst_length : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dest_burst_valid : STD_LOGIC;
  signal dest_id_reduced_next : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal dest_req_dest_address : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal dest_req_ready : STD_LOGIC;
  signal dest_response_eot : STD_LOGIC;
  signal \^g\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_addr_gen/last_burst_len0\ : STD_LOGIC;
  signal \i_data_mover/active0\ : STD_LOGIC;
  signal \i_data_mover/last_load\ : STD_LOGIC;
  signal i_dest_dma_mm_n_46 : STD_LOGIC;
  signal i_dest_req_fifo_n_28 : STD_LOGIC;
  signal i_dest_req_fifo_n_29 : STD_LOGIC;
  signal i_dest_req_fifo_n_30 : STD_LOGIC;
  signal i_dest_req_fifo_n_31 : STD_LOGIC;
  signal i_dest_req_fifo_n_32 : STD_LOGIC;
  signal i_dest_req_fifo_n_33 : STD_LOGIC;
  signal \i_dest_response_fifo/zerodeep.cdc_sync_fifo_ram_reg0\ : STD_LOGIC;
  signal i_src_dest_bl_fifo_n_6 : STD_LOGIC;
  signal i_src_dma_fifo_n_12 : STD_LOGIC;
  signal i_src_dma_fifo_n_9 : STD_LOGIC;
  signal i_src_req_fifo_n_34 : STD_LOGIC;
  signal i_src_req_fifo_n_37 : STD_LOGIC;
  signal i_src_req_fifo_n_38 : STD_LOGIC;
  signal i_store_and_forward_n_71 : STD_LOGIC;
  signal i_sync_src_request_id_n_0 : STD_LOGIC;
  signal \^id\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^id0_in\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inc_id2_return : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \^last_non_eot_reg\ : STD_LOGIC;
  signal measured_last_burst_length : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in13_in : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal req_gen_ready : STD_LOGIC;
  signal request_eot : STD_LOGIC;
  signal request_id : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal response_data_burst_length : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal response_id : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal src_bl_valid : STD_LOGIC;
  signal src_dest_valid_hs : STD_LOGIC;
  signal src_eot : STD_LOGIC;
  signal src_req_dest_address : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal src_req_dest_address_cur : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal src_req_islast_cur : STD_LOGIC;
  signal src_req_last_burst_length : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal src_req_ready : STD_LOGIC;
  signal src_req_spltr_valid : STD_LOGIC;
  signal src_req_sync_transfer_start : STD_LOGIC;
  signal src_req_xlast : STD_LOGIC;
  signal src_req_xlast_cur : STD_LOGIC;
  signal src_throttled_request_id0 : STD_LOGIC;
  signal \src_throttled_request_id[0]_i_1_n_0\ : STD_LOGIC;
  signal \src_throttled_request_id[3]_i_2_n_0\ : STD_LOGIC;
  signal \src_throttled_request_id_reg_n_0_[0]\ : STD_LOGIC;
  signal \src_throttled_request_id_reg_n_0_[1]\ : STD_LOGIC;
  signal src_valid : STD_LOGIC;
  signal NLW_eot_mem_dest_reg_r1_0_15_0_0_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_eot_mem_dest_reg_r2_0_15_0_0_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_eot_mem_src_reg_0_15_0_0_SPO_UNCONNECTED : STD_LOGIC;
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of eot_mem_dest_reg_r1_0_15_0_0 : label is 16;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of eot_mem_dest_reg_r1_0_15_0_0 : label is "axi_dmac/i_transfer/i_request_arb/eot_mem_dest_reg_r1";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of eot_mem_dest_reg_r1_0_15_0_0 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of eot_mem_dest_reg_r1_0_15_0_0 : label is "RAM_TDP";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of eot_mem_dest_reg_r1_0_15_0_0 : label is "RAM16X1D";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of eot_mem_dest_reg_r1_0_15_0_0 : label is "GND:DPRA4,A4";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of eot_mem_dest_reg_r1_0_15_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of eot_mem_dest_reg_r1_0_15_0_0 : label is 15;
  attribute ram_offset : integer;
  attribute ram_offset of eot_mem_dest_reg_r1_0_15_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of eot_mem_dest_reg_r1_0_15_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of eot_mem_dest_reg_r1_0_15_0_0 : label is 0;
  attribute RTL_RAM_BITS of eot_mem_dest_reg_r2_0_15_0_0 : label is 16;
  attribute RTL_RAM_NAME of eot_mem_dest_reg_r2_0_15_0_0 : label is "axi_dmac/i_transfer/i_request_arb/eot_mem_dest_reg_r2";
  attribute RTL_RAM_STYLE of eot_mem_dest_reg_r2_0_15_0_0 : label is "auto";
  attribute RTL_RAM_TYPE of eot_mem_dest_reg_r2_0_15_0_0 : label is "RAM_TDP";
  attribute XILINX_LEGACY_PRIM of eot_mem_dest_reg_r2_0_15_0_0 : label is "RAM16X1D";
  attribute XILINX_TRANSFORM_PINMAP of eot_mem_dest_reg_r2_0_15_0_0 : label is "GND:DPRA4,A4";
  attribute ram_addr_begin of eot_mem_dest_reg_r2_0_15_0_0 : label is 0;
  attribute ram_addr_end of eot_mem_dest_reg_r2_0_15_0_0 : label is 15;
  attribute ram_offset of eot_mem_dest_reg_r2_0_15_0_0 : label is 0;
  attribute ram_slice_begin of eot_mem_dest_reg_r2_0_15_0_0 : label is 0;
  attribute ram_slice_end of eot_mem_dest_reg_r2_0_15_0_0 : label is 0;
  attribute RTL_RAM_BITS of eot_mem_src_reg_0_15_0_0 : label is 16;
  attribute RTL_RAM_NAME of eot_mem_src_reg_0_15_0_0 : label is "axi_dmac/i_transfer/i_request_arb/eot_mem_src_reg";
  attribute RTL_RAM_STYLE of eot_mem_src_reg_0_15_0_0 : label is "auto";
  attribute RTL_RAM_TYPE of eot_mem_src_reg_0_15_0_0 : label is "RAM_TDP";
  attribute XILINX_LEGACY_PRIM of eot_mem_src_reg_0_15_0_0 : label is "RAM16X1D";
  attribute XILINX_TRANSFORM_PINMAP of eot_mem_src_reg_0_15_0_0 : label is "GND:DPRA4,A4";
  attribute ram_addr_begin of eot_mem_src_reg_0_15_0_0 : label is 0;
  attribute ram_addr_end of eot_mem_src_reg_0_15_0_0 : label is 15;
  attribute ram_offset of eot_mem_src_reg_0_15_0_0 : label is 0;
  attribute ram_slice_begin of eot_mem_src_reg_0_15_0_0 : label is 0;
  attribute ram_slice_end of eot_mem_src_reg_0_15_0_0 : label is 0;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \src_throttled_request_id[0]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \src_throttled_request_id[1]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \src_throttled_request_id[2]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \src_throttled_request_id[3]_i_2\ : label is "soft_lutpair87";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  \cdc_sync_stage2_reg[0]\ <= \^cdc_sync_stage2_reg[0]\;
  dbg_ids0(3 downto 0) <= \^dbg_ids0\(3 downto 0);
  g(3 downto 0) <= \^g\(3 downto 0);
  id(3 downto 0) <= \^id\(3 downto 0);
  id0_in(3 downto 0) <= \^id0_in\(3 downto 0);
  last_non_eot_reg <= \^last_non_eot_reg\;
eot_mem_dest_reg_r1_0_15_0_0: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => \^g\(0),
      A1 => \^g\(1),
      A2 => \^g\(2),
      A3 => \^g\(3),
      A4 => '0',
      D => src_eot,
      DPO => dest_response_eot,
      DPRA0 => \^id0_in\(0),
      DPRA1 => \^id0_in\(1),
      DPRA2 => \^id0_in\(2),
      DPRA3 => \^id0_in\(3),
      DPRA4 => '0',
      SPO => NLW_eot_mem_dest_reg_r1_0_15_0_0_SPO_UNCONNECTED,
      WCLK => fifo_wr_clk,
      WE => '1'
    );
eot_mem_dest_reg_r2_0_15_0_0: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => \^g\(0),
      A1 => \^g\(1),
      A2 => \^g\(2),
      A3 => \^g\(3),
      A4 => '0',
      D => src_eot,
      DPO => dest_address_eot,
      DPRA0 => \^id\(0),
      DPRA1 => \^id\(1),
      DPRA2 => \^id\(2),
      DPRA3 => \^id\(3),
      DPRA4 => '0',
      SPO => NLW_eot_mem_dest_reg_r2_0_15_0_0_SPO_UNCONNECTED,
      WCLK => fifo_wr_clk,
      WE => '1'
    );
eot_mem_src_reg_0_15_0_0: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => request_id(0),
      A1 => request_id(1),
      A2 => request_id(2),
      A3 => request_id(3),
      A4 => '0',
      D => request_eot,
      DPO => src_eot,
      DPRA0 => \^g\(0),
      DPRA1 => \^g\(1),
      DPRA2 => \^g\(2),
      DPRA3 => \^g\(3),
      DPRA4 => '0',
      SPO => NLW_eot_mem_src_reg_0_15_0_0_SPO_UNCONNECTED,
      WCLK => s_axi_aclk,
      WE => '1'
    );
i_dest_dma_mm: entity work.system_axi_adrv9001_rx1_dma_0_dest_axi_mm
     port map (
      ADDRC(3 downto 0) => \^id0_in\(3 downto 0),
      D(5 downto 1) => response_data_burst_length(6 downto 2),
      D(0) => response_data_burst_length(7),
      E(0) => \i_addr_gen/last_burst_len0\,
      Q(3 downto 0) => dest_burst_len(3 downto 0),
      addr_valid_reg => addr_valid_reg,
      dbg_ids0(3 downto 0) => \^dbg_ids0\(3 downto 0),
      dest_address_eot => dest_address_eot,
      dest_bl_ready => dest_bl_ready,
      dest_bl_valid => dest_bl_valid,
      dest_burst_info_write => dest_burst_info_write,
      dest_burst_valid => dest_burst_valid,
      dest_enable => dest_enable,
      dest_req_ready => dest_req_ready,
      dest_valid_reg(3) => i_store_and_forward_n_71,
      dest_valid_reg(2) => p_0_in13_in,
      dest_valid_reg(1 downto 0) => dest_id_reduced_next(1 downto 0),
      enabled => enabled,
      enabled_reg(0) => dest_id_reduced_msb_next_reg(0),
      \id_reg[0]\ => \^id\(0),
      \id_reg[0]_0\ => i_dest_dma_mm_n_46,
      \id_reg[1]\ => \^id\(1),
      \id_reg[2]\ => \^id\(2),
      \id_reg[3]\ => \^id\(3),
      \last_burst_len_reg[3]\(3 downto 0) => dest_burst_length(3 downto 0),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_awaddr(27 downto 0) => m_dest_axi_awaddr(27 downto 0),
      m_dest_axi_awlen(3 downto 0) => m_dest_axi_awlen(3 downto 0),
      m_dest_axi_awready => m_dest_axi_awready,
      \out\(27 downto 0) => dest_req_dest_address(27 downto 0),
      req_ready_reg => i_dest_req_fifo_n_30,
      req_ready_reg_0 => i_dest_req_fifo_n_29,
      \zerodeep.cdc_sync_fifo_ram_reg0\ => \i_dest_response_fifo/zerodeep.cdc_sync_fifo_ram_reg0\,
      \zerodeep.cdc_sync_fifo_ram_reg[5]\(3 downto 0) => \^q\(3 downto 0)
    );
i_dest_req_fifo: entity work.\system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized1\
     port map (
      D(29 downto 2) => src_req_dest_address_cur(27 downto 0),
      D(1) => src_req_xlast_cur,
      D(0) => src_req_islast_cur,
      active0 => \i_data_mover/active0\,
      \cdc_sync_stage1_reg[0]\(0) => dest_id_reduced_msb_next_reg(0),
      \cdc_sync_stage1_reg[0]_0\(0) => src_id_reduced_msb_reg(0),
      \cdc_sync_stage2_reg[0]\ => i_dest_req_fifo_n_29,
      \cdc_sync_stage2_reg[0]_0\ => i_dest_req_fifo_n_31,
      \cdc_sync_stage2_reg[0]_1\ => i_dest_req_fifo_n_32,
      \cdc_sync_stage2_reg[0]_2\ => i_dest_req_fifo_n_33,
      dest_req_ready => dest_req_ready,
      fifo_wr_clk => fifo_wr_clk,
      m_dest_axi_aclk => m_dest_axi_aclk,
      \out\(27 downto 0) => dest_req_dest_address(27 downto 0),
      src_dest_valid_hs => src_dest_valid_hs,
      \zerodeep.m_axis_raddr_reg_0\ => i_dest_req_fifo_n_30,
      \zerodeep.s_axis_waddr_reg_0\ => i_dest_req_fifo_n_28
    );
i_req_gen: entity work.system_axi_adrv9001_rx1_dma_0_request_generator
     port map (
      \FSM_sequential_state_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]\(0),
      \FSM_sequential_state_reg[0]_1\ => i_src_req_fifo_n_37,
      Q(3 downto 0) => request_id(3 downto 0),
      \burst_count_reg[0]_0\ => \zerodeep.s_axis_waddr_reg\,
      req_gen_ready => req_gen_ready,
      req_ready_reg_0 => \^cdc_sync_stage2_reg[0]\,
      request_eot => request_eot,
      response_id(3 downto 0) => response_id(3 downto 0),
      s_axi_aclk => s_axi_aclk,
      up_dma_req_x_length(16 downto 0) => up_dma_req_x_length(20 downto 4)
    );
i_response_manager: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_response_manager
     port map (
      D(6 downto 2) => response_data_burst_length(6 downto 2),
      D(1) => response_data_burst_length(7),
      D(0) => dest_response_eot,
      E(0) => \i_dest_response_fifo/zerodeep.cdc_sync_fifo_ram_reg0\,
      \cdc_sync_stage1_reg[0]\(0) => dest_id_reduced_msb_next_reg(0),
      \cdc_sync_stage1_reg[0]_0\(0) => \cdc_sync_stage1_reg[0]\(0),
      dma_req_eot => dma_req_eot,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      \measured_burst_length_reg[6]_0\(6 downto 0) => \measured_burst_length_reg[6]\(6 downto 0),
      p_3_in(0) => p_3_in(0),
      response_valid_reg_0 => response_valid_reg,
      s_axi_aclk => s_axi_aclk,
      up_bl_partial => up_bl_partial,
      up_eot => up_eot,
      up_response_ready => up_response_ready,
      \zerodeep.cdc_sync_fifo_ram_reg[0]\ => i_dest_dma_mm_n_46
    );
i_src_dest_bl_fifo: entity work.\system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized0\
     port map (
      E(0) => \i_addr_gen/last_burst_len0\,
      Q(3 downto 0) => measured_last_burst_length(3 downto 0),
      bl_valid_reg(0) => \i_data_mover/last_load\,
      \cdc_sync_stage2_reg[0]\(0) => dest_id_reduced_msb_next_reg(0),
      \cdc_sync_stage2_reg[0]_0\(0) => src_id_reduced_msb_reg(0),
      dest_bl_ready => dest_bl_ready,
      dest_bl_valid => dest_bl_valid,
      fifo_wr_clk => fifo_wr_clk,
      m_dest_axi_aclk => m_dest_axi_aclk,
      \out\(3 downto 0) => dest_burst_length(3 downto 0),
      src_bl_valid => src_bl_valid,
      \zerodeep.s_axis_waddr_reg_0\ => i_src_dest_bl_fifo_n_6
    );
i_src_dma_fifo: entity work.system_axi_adrv9001_rx1_dma_0_src_fifo_inf
     port map (
      E(0) => src_valid,
      Q(3) => p_1_in,
      Q(2) => p_0_in1_in,
      Q(1) => \src_throttled_request_id_reg_n_0_[1]\,
      Q(0) => \src_throttled_request_id_reg_n_0_[0]\,
      active0 => \i_data_mover/active0\,
      active_reg => active_reg,
      active_reg_0(0) => src_id_reduced_msb_reg(0),
      active_reg_1 => i_dest_req_fifo_n_32,
      \beat_counter_reg[0]\ => i_src_dma_fifo_n_9,
      bl_valid_reg => i_src_dest_bl_fifo_n_6,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_en => fifo_wr_en,
      fifo_wr_overflow => fifo_wr_overflow,
      \id_reg[0]\ => \^g\(0),
      \id_reg[1]\ => \^g\(1),
      \id_reg[2]\ => \^g\(2),
      \id_reg[3]\ => \^g\(3),
      last_eot_reg(0) => \i_data_mover/last_load\,
      last_eot_reg_0 => i_src_req_fifo_n_38,
      last_non_eot_reg => \^last_non_eot_reg\,
      last_non_eot_reg_0 => i_src_dma_fifo_n_12,
      \measured_last_burst_length_reg[3]\(3 downto 0) => measured_last_burst_length(3 downto 0),
      \out\(4 downto 1) => src_req_last_burst_length(3 downto 0),
      \out\(0) => src_req_sync_transfer_start,
      src_bl_valid => src_bl_valid,
      src_enable => src_enable,
      src_eot => src_eot,
      src_req_ready => src_req_ready,
      src_req_spltr_valid => src_req_spltr_valid,
      sync => sync
    );
i_src_req_fifo: entity work.\system_axi_adrv9001_rx1_dma_0_util_axis_fifo__parameterized2\
     port map (
      D(60 downto 5) => D(56 downto 1),
      D(4 downto 1) => up_dma_req_x_length(3 downto 0),
      D(0) => D(0),
      E(0) => E(0),
      active0 => \i_data_mover/active0\,
      \cdc_sync_stage1_reg[0]\(0) => \cdc_sync_stage1_reg[0]\(0),
      \cdc_sync_stage1_reg[0]_0\(0) => src_id_reduced_msb_reg(0),
      \cdc_sync_stage2_reg[0]\ => \^cdc_sync_stage2_reg[0]\,
      fifo_wr_clk => fifo_wr_clk,
      last_eot_reg => i_src_dma_fifo_n_9,
      \out\(34 downto 7) => src_req_dest_address(27 downto 0),
      \out\(6 downto 3) => src_req_last_burst_length(3 downto 0),
      \out\(2) => src_req_sync_transfer_start,
      \out\(1) => src_req_xlast,
      \out\(0) => i_src_req_fifo_n_34,
      req_gen_ready => req_gen_ready,
      s_axi_aclk => s_axi_aclk,
      src_req_islast_cur_reg => i_dest_req_fifo_n_31,
      src_req_islast_cur_reg_0 => i_dest_req_fifo_n_28,
      src_req_ready => src_req_ready,
      src_req_spltr_valid => src_req_spltr_valid,
      up_dma_req_valid => up_dma_req_valid,
      up_dma_req_valid_reg => i_src_req_fifo_n_37,
      \zerodeep.cdc_sync_fifo_ram_reg[7]_0\ => i_src_req_fifo_n_38,
      \zerodeep.s_axis_waddr_reg_0\ => \zerodeep.s_axis_waddr_reg\
    );
i_store_and_forward: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_burst_memory
     port map (
      E(0) => src_valid,
      Q(3 downto 0) => \^q\(3 downto 0),
      SR(0) => SR(0),
      \cdc_sync_stage2_reg[0]\(0) => src_throttled_request_id0,
      dbg_ids0(3 downto 0) => \^dbg_ids0\(3 downto 0),
      dest_burst_info_write => dest_burst_info_write,
      \dest_burst_len_data_reg[4]_0\ => i_src_dma_fifo_n_12,
      \dest_burst_len_data_reg[6]_0\(3 downto 0) => dest_burst_len(3 downto 0),
      dest_burst_valid => dest_burst_valid,
      \dest_id_next_reg[3]_0\(3) => i_store_and_forward_n_71,
      \dest_id_next_reg[3]_0\(2) => p_0_in13_in,
      \dest_id_next_reg[3]_0\(1 downto 0) => dest_id_reduced_next(1 downto 0),
      dest_id_reduced_msb_next_reg_0(0) => dest_id_reduced_msb_next_reg(0),
      dest_mem_data_valid_reg_0 => dest_mem_data_valid_reg,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_din(63 downto 0) => fifo_wr_din(63 downto 0),
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_wdata(63 downto 0) => m_dest_axi_wdata(63 downto 0),
      m_dest_axi_wlast => m_dest_axi_wlast,
      m_dest_axi_wready => m_dest_axi_wready,
      src_id_reduced_msb_reg_0(0) => src_id_reduced_msb_reg(0),
      \src_id_reg[2]_0\ => \^last_non_eot_reg\,
      \src_throttled_request_id_reg[0]\(3) => p_1_in,
      \src_throttled_request_id_reg[0]\(2) => p_0_in1_in,
      \src_throttled_request_id_reg[0]\(1) => \src_throttled_request_id_reg_n_0_[1]\,
      \src_throttled_request_id_reg[0]\(0) => \src_throttled_request_id_reg_n_0_[0]\,
      \src_throttled_request_id_reg[0]_0\ => i_sync_src_request_id_n_0
    );
i_sync_req_response_id: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0__xdcDup__3\
     port map (
      id0_in(3 downto 0) => \^id0_in\(3 downto 0),
      response_id(3 downto 0) => response_id(3 downto 0),
      s_axi_aclk => s_axi_aclk
    );
i_sync_src_request_id: entity work.\system_axi_adrv9001_rx1_dma_0_sync_bits__parameterized0\
     port map (
      Q(3) => p_1_in,
      Q(2) => p_0_in1_in,
      Q(1) => \src_throttled_request_id_reg_n_0_[1]\,
      Q(0) => \src_throttled_request_id_reg_n_0_[0]\,
      \cdc_sync_stage1_reg[3]_0\(3 downto 0) => request_id(3 downto 0),
      \cdc_sync_stage2_reg[0]_0\ => i_sync_src_request_id_n_0,
      dbg_ids1(3 downto 0) => dbg_ids1(3 downto 0),
      fifo_wr_clk => fifo_wr_clk
    );
src_dest_valid_hs_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => '1',
      D => i_dest_req_fifo_n_33,
      Q => src_dest_valid_hs,
      R => src_id_reduced_msb_reg(0)
    );
\src_req_dest_address_cur_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(0),
      Q => src_req_dest_address_cur(0),
      R => '0'
    );
\src_req_dest_address_cur_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(10),
      Q => src_req_dest_address_cur(10),
      R => '0'
    );
\src_req_dest_address_cur_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(11),
      Q => src_req_dest_address_cur(11),
      R => '0'
    );
\src_req_dest_address_cur_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(12),
      Q => src_req_dest_address_cur(12),
      R => '0'
    );
\src_req_dest_address_cur_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(13),
      Q => src_req_dest_address_cur(13),
      R => '0'
    );
\src_req_dest_address_cur_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(14),
      Q => src_req_dest_address_cur(14),
      R => '0'
    );
\src_req_dest_address_cur_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(15),
      Q => src_req_dest_address_cur(15),
      R => '0'
    );
\src_req_dest_address_cur_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(16),
      Q => src_req_dest_address_cur(16),
      R => '0'
    );
\src_req_dest_address_cur_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(17),
      Q => src_req_dest_address_cur(17),
      R => '0'
    );
\src_req_dest_address_cur_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(18),
      Q => src_req_dest_address_cur(18),
      R => '0'
    );
\src_req_dest_address_cur_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(19),
      Q => src_req_dest_address_cur(19),
      R => '0'
    );
\src_req_dest_address_cur_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(1),
      Q => src_req_dest_address_cur(1),
      R => '0'
    );
\src_req_dest_address_cur_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(20),
      Q => src_req_dest_address_cur(20),
      R => '0'
    );
\src_req_dest_address_cur_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(21),
      Q => src_req_dest_address_cur(21),
      R => '0'
    );
\src_req_dest_address_cur_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(22),
      Q => src_req_dest_address_cur(22),
      R => '0'
    );
\src_req_dest_address_cur_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(23),
      Q => src_req_dest_address_cur(23),
      R => '0'
    );
\src_req_dest_address_cur_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(24),
      Q => src_req_dest_address_cur(24),
      R => '0'
    );
\src_req_dest_address_cur_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(25),
      Q => src_req_dest_address_cur(25),
      R => '0'
    );
\src_req_dest_address_cur_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(26),
      Q => src_req_dest_address_cur(26),
      R => '0'
    );
\src_req_dest_address_cur_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(27),
      Q => src_req_dest_address_cur(27),
      R => '0'
    );
\src_req_dest_address_cur_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(2),
      Q => src_req_dest_address_cur(2),
      R => '0'
    );
\src_req_dest_address_cur_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(3),
      Q => src_req_dest_address_cur(3),
      R => '0'
    );
\src_req_dest_address_cur_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(4),
      Q => src_req_dest_address_cur(4),
      R => '0'
    );
\src_req_dest_address_cur_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(5),
      Q => src_req_dest_address_cur(5),
      R => '0'
    );
\src_req_dest_address_cur_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(6),
      Q => src_req_dest_address_cur(6),
      R => '0'
    );
\src_req_dest_address_cur_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(7),
      Q => src_req_dest_address_cur(7),
      R => '0'
    );
\src_req_dest_address_cur_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(8),
      Q => src_req_dest_address_cur(8),
      R => '0'
    );
\src_req_dest_address_cur_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_dest_address(9),
      Q => src_req_dest_address_cur(9),
      R => '0'
    );
src_req_islast_cur_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => i_src_req_fifo_n_34,
      Q => src_req_islast_cur,
      R => '0'
    );
src_req_xlast_cur_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => fifo_wr_clk,
      CE => \i_data_mover/active0\,
      D => src_req_xlast,
      Q => src_req_xlast_cur,
      R => '0'
    );
\src_throttled_request_id[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \src_throttled_request_id_reg_n_0_[1]\,
      I1 => p_1_in,
      I2 => p_0_in1_in,
      O => \src_throttled_request_id[0]_i_1_n_0\
    );
\src_throttled_request_id[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => p_0_in1_in,
      I1 => p_1_in,
      I2 => \src_throttled_request_id_reg_n_0_[0]\,
      I3 => \src_throttled_request_id_reg_n_0_[1]\,
      O => inc_id2_return(1)
    );
\src_throttled_request_id[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F074"
    )
        port map (
      I0 => p_1_in,
      I1 => \src_throttled_request_id_reg_n_0_[1]\,
      I2 => p_0_in1_in,
      I3 => \src_throttled_request_id_reg_n_0_[0]\,
      O => inc_id2_return(2)
    );
\src_throttled_request_id[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE04"
    )
        port map (
      I0 => \src_throttled_request_id_reg_n_0_[0]\,
      I1 => p_0_in1_in,
      I2 => \src_throttled_request_id_reg_n_0_[1]\,
      I3 => p_1_in,
      O => \src_throttled_request_id[3]_i_2_n_0\
    );
\src_throttled_request_id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => src_throttled_request_id0,
      D => \src_throttled_request_id[0]_i_1_n_0\,
      Q => \src_throttled_request_id_reg_n_0_[0]\,
      R => src_id_reduced_msb_reg(0)
    );
\src_throttled_request_id_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => src_throttled_request_id0,
      D => inc_id2_return(1),
      Q => \src_throttled_request_id_reg_n_0_[1]\,
      R => src_id_reduced_msb_reg(0)
    );
\src_throttled_request_id_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => src_throttled_request_id0,
      D => inc_id2_return(2),
      Q => p_0_in1_in,
      R => src_id_reduced_msb_reg(0)
    );
\src_throttled_request_id_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => fifo_wr_clk,
      CE => src_throttled_request_id0,
      D => \src_throttled_request_id[3]_i_2_n_0\,
      Q => p_1_in,
      R => src_id_reduced_msb_reg(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac_transfer is
  port (
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dbg_ids0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dbg_status : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \reset_gen[1].reset_sync_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    addr_valid_reg : out STD_LOGIC;
    g : out STD_LOGIC_VECTOR ( 3 downto 0 );
    fifo_wr_overflow : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ADDRC : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \id_reg[3]\ : out STD_LOGIC;
    \id_reg[2]\ : out STD_LOGIC;
    \id_reg[1]\ : out STD_LOGIC;
    \id_reg[0]\ : out STD_LOGIC;
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 27 downto 0 );
    active_reg : out STD_LOGIC;
    dest_mem_data_valid_reg : out STD_LOGIC;
    m_dest_axi_wlast : out STD_LOGIC;
    up_response_valid : out STD_LOGIC;
    \reset_gen[2].reset_sync_reg[0]\ : out STD_LOGIC;
    \cdc_sync_stage2_reg[0]\ : out STD_LOGIC;
    up_bl_partial : out STD_LOGIC;
    up_eot : out STD_LOGIC;
    dma_req_eot : out STD_LOGIC;
    m_dest_axi_bready : out STD_LOGIC;
    dbg_ids1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \measured_burst_length_reg[6]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_dest_axi_aclk : in STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    m_dest_axi_wready : in STD_LOGIC;
    \up_rdata_reg[10]\ : in STD_LOGIC;
    \up_rdata_reg[10]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    up_dma_req_valid : in STD_LOGIC;
    p_3_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    up_response_ready : in STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    sync : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    ctrl_enable : in STD_LOGIC;
    ctrl_pause : in STD_LOGIC;
    up_dma_req_x_length : in STD_LOGIC_VECTOR ( 20 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 56 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac_transfer : entity is "axi_dmac_transfer";
end system_axi_adrv9001_rx1_dma_0_axi_dmac_transfer;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac_transfer is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dbg_status\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal dest_enable : STD_LOGIC;
  signal enabled : STD_LOGIC;
  signal i_request_arb_n_125 : STD_LOGIC;
  signal i_reset_manager_n_12 : STD_LOGIC;
  signal \i_store_and_forward/src_beat_counter0\ : STD_LOGIC;
  signal \^m_dest_axi_awaddr\ : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal \^reset_gen[1].reset_sync_reg[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal src_enable : STD_LOGIC;
begin
  Q(0) <= \^q\(0);
  dbg_status(6 downto 0) <= \^dbg_status\(6 downto 0);
  m_dest_axi_awaddr(27 downto 0) <= \^m_dest_axi_awaddr\(27 downto 0);
  \reset_gen[1].reset_sync_reg[0]\(0) <= \^reset_gen[1].reset_sync_reg[0]\(0);
i_request_arb: entity work.system_axi_adrv9001_rx1_dma_0_request_arb
     port map (
      D(56 downto 0) => D(56 downto 0),
      E(0) => E(0),
      Q(3 downto 0) => dbg_ids0(7 downto 4),
      SR(0) => \i_store_and_forward/src_beat_counter0\,
      active_reg => active_reg,
      addr_valid_reg => addr_valid_reg,
      \cdc_sync_stage1_reg[0]\(0) => i_reset_manager_n_12,
      \cdc_sync_stage2_reg[0]\ => \cdc_sync_stage2_reg[0]\,
      dbg_ids0(3 downto 0) => dbg_ids0(3 downto 0),
      dbg_ids1(3 downto 0) => dbg_ids1(3 downto 0),
      dest_enable => dest_enable,
      dest_id_reduced_msb_next_reg(0) => \^q\(0),
      dest_mem_data_valid_reg => dest_mem_data_valid_reg,
      dma_req_eot => dma_req_eot,
      enabled => enabled,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_din(63 downto 0) => fifo_wr_din(63 downto 0),
      fifo_wr_en => fifo_wr_en,
      fifo_wr_overflow => fifo_wr_overflow,
      g(3 downto 0) => g(3 downto 0),
      id(3) => \id_reg[3]\,
      id(2) => \id_reg[2]\,
      id(1) => \id_reg[1]\,
      id(0) => \id_reg[0]\,
      id0_in(3 downto 0) => ADDRC(3 downto 0),
      last_non_eot_reg => i_request_arb_n_125,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_awaddr(27 downto 0) => \^m_dest_axi_awaddr\(27 downto 0),
      m_dest_axi_awlen(3 downto 0) => m_dest_axi_awlen(3 downto 0),
      m_dest_axi_awready => m_dest_axi_awready,
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      m_dest_axi_wdata(63 downto 0) => m_dest_axi_wdata(63 downto 0),
      m_dest_axi_wlast => m_dest_axi_wlast,
      m_dest_axi_wready => m_dest_axi_wready,
      \measured_burst_length_reg[6]\(6 downto 0) => \measured_burst_length_reg[6]\(6 downto 0),
      p_3_in(0) => p_3_in(0),
      response_valid_reg => up_response_valid,
      s_axi_aclk => s_axi_aclk,
      src_enable => src_enable,
      src_id_reduced_msb_reg(0) => \^reset_gen[1].reset_sync_reg[0]\(0),
      sync => sync,
      up_bl_partial => up_bl_partial,
      up_dma_req_valid => up_dma_req_valid,
      up_dma_req_x_length(20 downto 0) => up_dma_req_x_length(20 downto 0),
      up_eot => up_eot,
      up_response_ready => up_response_ready,
      \zerodeep.s_axis_waddr_reg\ => \^dbg_status\(5)
    );
i_reset_manager: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_reset_manager
     port map (
      Q(0) => \^q\(0),
      SR(0) => \i_store_and_forward/src_beat_counter0\,
      SS(0) => SS(0),
      ctrl_enable => ctrl_enable,
      ctrl_pause => ctrl_pause,
      dbg_status(5) => \^dbg_status\(6),
      dbg_status(4 downto 0) => \^dbg_status\(4 downto 0),
      dest_enable => dest_enable,
      do_enable_reg_0 => \^dbg_status\(5),
      enabled => enabled,
      fifo_wr_clk => fifo_wr_clk,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_awaddr(0) => \^m_dest_axi_awaddr\(7),
      \reset_gen[1].reset_sync_reg[0]_0\(0) => \^reset_gen[1].reset_sync_reg[0]\(0),
      \reset_gen[2].reset_sync_reg[0]_0\ => \reset_gen[2].reset_sync_reg[0]\,
      \reset_gen[2].reset_sync_reg[0]_1\(0) => i_reset_manager_n_12,
      s_axi_aclk => s_axi_aclk,
      \src_beat_counter_reg[0]\ => i_request_arb_n_125,
      src_enable => src_enable,
      \up_rdata_reg[10]\ => \up_rdata_reg[10]\,
      \up_rdata_reg[10]_0\(0) => \up_rdata_reg[10]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0_axi_dmac is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    irq : out STD_LOGIC;
    sync : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    m_dest_axi_aresetn : in STD_LOGIC;
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_dest_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_awvalid : out STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    m_dest_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_dest_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_dest_axi_wready : in STD_LOGIC;
    m_dest_axi_wvalid : out STD_LOGIC;
    m_dest_axi_wlast : out STD_LOGIC;
    m_dest_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_bvalid : in STD_LOGIC;
    m_dest_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_bready : out STD_LOGIC;
    m_dest_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_arvalid : out STD_LOGIC;
    m_dest_axi_araddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_dest_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_dest_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_arready : in STD_LOGIC;
    m_dest_axi_rvalid : in STD_LOGIC;
    m_dest_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_dest_axi_rready : out STD_LOGIC;
    m_dest_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_dest_axi_rlast : in STD_LOGIC;
    m_src_axi_aclk : in STD_LOGIC;
    m_src_axi_aresetn : in STD_LOGIC;
    m_src_axi_arready : in STD_LOGIC;
    m_src_axi_arvalid : out STD_LOGIC;
    m_src_axi_araddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_src_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_src_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_src_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_src_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_src_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_src_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_src_axi_rready : out STD_LOGIC;
    m_src_axi_rvalid : in STD_LOGIC;
    m_src_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_src_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_rlast : in STD_LOGIC;
    m_src_axi_awvalid : out STD_LOGIC;
    m_src_axi_awaddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_src_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_src_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_src_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_src_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_src_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_src_axi_awready : in STD_LOGIC;
    m_src_axi_wvalid : out STD_LOGIC;
    m_src_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_src_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_src_axi_wlast : out STD_LOGIC;
    m_src_axi_wready : in STD_LOGIC;
    m_src_axi_bvalid : in STD_LOGIC;
    m_src_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_src_axi_bready : out STD_LOGIC;
    m_src_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_src_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_aclk : in STD_LOGIC;
    m_sg_axi_aresetn : in STD_LOGIC;
    m_sg_axi_arready : in STD_LOGIC;
    m_sg_axi_arvalid : out STD_LOGIC;
    m_sg_axi_araddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_sg_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_sg_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_sg_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_sg_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_sg_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_sg_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_sg_axi_rready : out STD_LOGIC;
    m_sg_axi_rvalid : in STD_LOGIC;
    m_sg_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_sg_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_rlast : in STD_LOGIC;
    m_sg_axi_awvalid : out STD_LOGIC;
    m_sg_axi_awaddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_sg_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_sg_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_sg_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_sg_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_sg_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_sg_axi_awready : in STD_LOGIC;
    m_sg_axi_wvalid : out STD_LOGIC;
    m_sg_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_sg_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_sg_axi_wlast : out STD_LOGIC;
    m_sg_axi_wready : in STD_LOGIC;
    m_sg_axi_bvalid : in STD_LOGIC;
    m_sg_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_sg_axi_bready : out STD_LOGIC;
    m_sg_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_sg_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_aclk : in STD_LOGIC;
    s_axis_ready : out STD_LOGIC;
    s_axis_valid : in STD_LOGIC;
    s_axis_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_strb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_keep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_user : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_id : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_dest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_last : in STD_LOGIC;
    s_axis_xfer_req : out STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_ready : in STD_LOGIC;
    m_axis_valid : out STD_LOGIC;
    m_axis_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_strb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_keep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_user : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_id : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_dest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_last : out STD_LOGIC;
    m_axis_xfer_req : out STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_wr_overflow : out STD_LOGIC;
    fifo_wr_xfer_req : out STD_LOGIC;
    fifo_rd_clk : in STD_LOGIC;
    fifo_rd_en : in STD_LOGIC;
    fifo_rd_valid : out STD_LOGIC;
    fifo_rd_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_rd_underflow : out STD_LOGIC;
    fifo_rd_xfer_req : out STD_LOGIC;
    m_frame_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    m_frame_in_valid : in STD_LOGIC;
    m_frame_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_frame_out_valid : out STD_LOGIC;
    s_frame_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_frame_in_valid : in STD_LOGIC;
    s_frame_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_frame_out_valid : out STD_LOGIC;
    src_ext_sync : in STD_LOGIC;
    dest_ext_sync : in STD_LOGIC;
    dest_diag_level_bursts : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ALLOW_ASYM_MEM : integer;
  attribute ALLOW_ASYM_MEM of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1;
  attribute ASYNC_CLK_DEST_REQ : string;
  attribute ASYNC_CLK_DEST_REQ of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute ASYNC_CLK_DEST_SG : string;
  attribute ASYNC_CLK_DEST_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute ASYNC_CLK_REQ_SG : string;
  attribute ASYNC_CLK_REQ_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute ASYNC_CLK_REQ_SRC : string;
  attribute ASYNC_CLK_REQ_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute ASYNC_CLK_SRC_DEST : string;
  attribute ASYNC_CLK_SRC_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute ASYNC_CLK_SRC_SG : string;
  attribute ASYNC_CLK_SRC_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute AUTORUN : string;
  attribute AUTORUN of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute AUTORUN_DEST_ADDR : integer;
  attribute AUTORUN_DEST_ADDR of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_DEST_STRIDE : integer;
  attribute AUTORUN_DEST_STRIDE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_FLAGS : integer;
  attribute AUTORUN_FLAGS of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_FRAMELOCK_CONFIG : integer;
  attribute AUTORUN_FRAMELOCK_CONFIG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_FRAMELOCK_STRIDE : integer;
  attribute AUTORUN_FRAMELOCK_STRIDE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_SG_ADDRESS : integer;
  attribute AUTORUN_SG_ADDRESS of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_SRC_ADDR : integer;
  attribute AUTORUN_SRC_ADDR of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_SRC_STRIDE : integer;
  attribute AUTORUN_SRC_STRIDE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_X_LENGTH : integer;
  attribute AUTORUN_X_LENGTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AUTORUN_Y_LENGTH : integer;
  attribute AUTORUN_Y_LENGTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute AXIS_TUSER_SYNC : string;
  attribute AXIS_TUSER_SYNC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute AXI_AXCACHE : string;
  attribute AXI_AXCACHE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "4'b1111";
  attribute AXI_AXPROT : string;
  attribute AXI_AXPROT of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "3'b010";
  attribute AXI_ID_WIDTH_DEST : integer;
  attribute AXI_ID_WIDTH_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1;
  attribute AXI_ID_WIDTH_SG : integer;
  attribute AXI_ID_WIDTH_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1;
  attribute AXI_ID_WIDTH_SRC : integer;
  attribute AXI_ID_WIDTH_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1;
  attribute AXI_SLICE_DEST : string;
  attribute AXI_SLICE_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute AXI_SLICE_SRC : string;
  attribute AXI_SLICE_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute BEATS_PER_BURST_LIMIT_DEST : integer;
  attribute BEATS_PER_BURST_LIMIT_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 256;
  attribute BEATS_PER_BURST_LIMIT_SRC : integer;
  attribute BEATS_PER_BURST_LIMIT_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1024;
  attribute BYTES_PER_BEAT_WIDTH_DEST : integer;
  attribute BYTES_PER_BEAT_WIDTH_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute BYTES_PER_BEAT_WIDTH_SG : integer;
  attribute BYTES_PER_BEAT_WIDTH_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute BYTES_PER_BEAT_WIDTH_SRC : integer;
  attribute BYTES_PER_BEAT_WIDTH_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute BYTES_PER_BURST_LIMIT : integer;
  attribute BYTES_PER_BURST_LIMIT of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 2048;
  attribute BYTES_PER_BURST_LIMIT_DEST : integer;
  attribute BYTES_PER_BURST_LIMIT_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 2048;
  attribute BYTES_PER_BURST_LIMIT_SRC : integer;
  attribute BYTES_PER_BURST_LIMIT_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 8192;
  attribute BYTES_PER_BURST_WIDTH : integer;
  attribute BYTES_PER_BURST_WIDTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 7;
  attribute CACHE_COHERENT : string;
  attribute CACHE_COHERENT of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute CYCLIC : string;
  attribute CYCLIC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute DBG_ID_PADDING : integer;
  attribute DBG_ID_PADDING of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 4;
  attribute DISABLE_DEBUG_REGISTERS : string;
  attribute DISABLE_DEBUG_REGISTERS of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute DMA_2D_TLAST_MODE : integer;
  attribute DMA_2D_TLAST_MODE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_2D_TRANSFER : string;
  attribute DMA_2D_TRANSFER of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute DMA_AXIS_DEST_W : integer;
  attribute DMA_AXIS_DEST_W of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 4;
  attribute DMA_AXIS_ID_W : integer;
  attribute DMA_AXIS_ID_W of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 8;
  attribute DMA_AXI_ADDR_WIDTH : integer;
  attribute DMA_AXI_ADDR_WIDTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 31;
  attribute DMA_AXI_PROTOCOL_DEST : integer;
  attribute DMA_AXI_PROTOCOL_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_AXI_PROTOCOL_SG : integer;
  attribute DMA_AXI_PROTOCOL_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_AXI_PROTOCOL_SRC : integer;
  attribute DMA_AXI_PROTOCOL_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_DATA_WIDTH_DEST : integer;
  attribute DMA_DATA_WIDTH_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 64;
  attribute DMA_DATA_WIDTH_SG : integer;
  attribute DMA_DATA_WIDTH_SG of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 64;
  attribute DMA_DATA_WIDTH_SRC : integer;
  attribute DMA_DATA_WIDTH_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 64;
  attribute DMA_LENGTH_ALIGN : integer;
  attribute DMA_LENGTH_ALIGN of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute DMA_LENGTH_ALIGN_DEST : integer;
  attribute DMA_LENGTH_ALIGN_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_LENGTH_ALIGN_SRC : integer;
  attribute DMA_LENGTH_ALIGN_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute DMA_LENGTH_WIDTH : integer;
  attribute DMA_LENGTH_WIDTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 24;
  attribute DMA_SG_TRANSFER : string;
  attribute DMA_SG_TRANSFER of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute DMA_TYPE_AXI_MM : integer;
  attribute DMA_TYPE_AXI_MM of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_TYPE_AXI_STREAM : integer;
  attribute DMA_TYPE_AXI_STREAM of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 1;
  attribute DMA_TYPE_DEST : integer;
  attribute DMA_TYPE_DEST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute DMA_TYPE_FIFO : integer;
  attribute DMA_TYPE_FIFO of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 2;
  attribute DMA_TYPE_SRC : integer;
  attribute DMA_TYPE_SRC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 2;
  attribute ENABLE_DIAGNOSTICS_IF : string;
  attribute ENABLE_DIAGNOSTICS_IF of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 8;
  attribute FRAMELOCK : string;
  attribute FRAMELOCK of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute FRAMELOCK_MODE : string;
  attribute FRAMELOCK_MODE of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute HAS_DEST_ADDR : string;
  attribute HAS_DEST_ADDR of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute HAS_SRC_ADDR : string;
  attribute HAS_SRC_ADDR of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
  attribute ID : integer;
  attribute ID of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 0;
  attribute ID_WIDTH : integer;
  attribute ID_WIDTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 4;
  attribute MAX_BYTES_PER_BURST : integer;
  attribute MAX_BYTES_PER_BURST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 128;
  attribute MAX_NUM_FRAMES_WIDTH : integer;
  attribute MAX_NUM_FRAMES_WIDTH of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 3;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "axi_dmac";
  attribute REAL_MAX_BYTES_PER_BURST : integer;
  attribute REAL_MAX_BYTES_PER_BURST of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is 128;
  attribute SYNC_TRANSFER_START : string;
  attribute SYNC_TRANSFER_START of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b1";
  attribute USE_EXT_SYNC : string;
  attribute USE_EXT_SYNC of system_axi_adrv9001_rx1_dma_0_axi_dmac : entity is "1'b0";
end system_axi_adrv9001_rx1_dma_0_axi_dmac;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0_axi_dmac is
  signal \<const0>\ : STD_LOGIC;
  signal ctrl_enable : STD_LOGIC;
  signal ctrl_pause : STD_LOGIC;
  signal dbg_ids0 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal dbg_ids1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dbg_status : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal dma_req_eot : STD_LOGIC;
  signal g : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i_regmap_n_1 : STD_LOGIC;
  signal i_regmap_n_74 : STD_LOGIC;
  signal \i_regmap_request/p_3_in\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \i_regmap_request/up_bl_partial\ : STD_LOGIC;
  signal \i_request_arb/i_src_req_fifo/zerodeep.cdc_sync_fifo_ram_reg0\ : STD_LOGIC;
  signal i_transfer_n_128 : STD_LOGIC;
  signal i_transfer_n_129 : STD_LOGIC;
  signal i_transfer_n_79 : STD_LOGIC;
  signal i_transfer_n_80 : STD_LOGIC;
  signal i_transfer_n_88 : STD_LOGIC;
  signal i_transfer_n_89 : STD_LOGIC;
  signal i_transfer_n_90 : STD_LOGIC;
  signal i_transfer_n_91 : STD_LOGIC;
  signal i_transfer_n_92 : STD_LOGIC;
  signal i_transfer_n_93 : STD_LOGIC;
  signal i_transfer_n_94 : STD_LOGIC;
  signal i_transfer_n_95 : STD_LOGIC;
  signal \^m_dest_axi_awaddr\ : STD_LOGIC_VECTOR ( 30 downto 3 );
  signal \^m_dest_axi_awlen\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal up_dma_req_dest_address : STD_LOGIC_VECTOR ( 30 downto 3 );
  signal up_dma_req_last : STD_LOGIC;
  signal up_dma_req_src_address : STD_LOGIC_VECTOR ( 30 downto 3 );
  signal up_dma_req_valid : STD_LOGIC;
  signal up_dma_req_x_length : STD_LOGIC_VECTOR ( 23 downto 3 );
  signal up_eot : STD_LOGIC;
  signal up_raddr : STD_LOGIC_VECTOR ( 1 to 1 );
  signal up_req_measured_burst_length : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal up_response_ready : STD_LOGIC;
  signal up_response_valid : STD_LOGIC;
begin
  dest_diag_level_bursts(7) <= \<const0>\;
  dest_diag_level_bursts(6) <= \<const0>\;
  dest_diag_level_bursts(5) <= \<const0>\;
  dest_diag_level_bursts(4) <= \<const0>\;
  dest_diag_level_bursts(3) <= \<const0>\;
  dest_diag_level_bursts(2) <= \<const0>\;
  dest_diag_level_bursts(1) <= \<const0>\;
  dest_diag_level_bursts(0) <= \<const0>\;
  fifo_rd_dout(63) <= \<const0>\;
  fifo_rd_dout(62) <= \<const0>\;
  fifo_rd_dout(61) <= \<const0>\;
  fifo_rd_dout(60) <= \<const0>\;
  fifo_rd_dout(59) <= \<const0>\;
  fifo_rd_dout(58) <= \<const0>\;
  fifo_rd_dout(57) <= \<const0>\;
  fifo_rd_dout(56) <= \<const0>\;
  fifo_rd_dout(55) <= \<const0>\;
  fifo_rd_dout(54) <= \<const0>\;
  fifo_rd_dout(53) <= \<const0>\;
  fifo_rd_dout(52) <= \<const0>\;
  fifo_rd_dout(51) <= \<const0>\;
  fifo_rd_dout(50) <= \<const0>\;
  fifo_rd_dout(49) <= \<const0>\;
  fifo_rd_dout(48) <= \<const0>\;
  fifo_rd_dout(47) <= \<const0>\;
  fifo_rd_dout(46) <= \<const0>\;
  fifo_rd_dout(45) <= \<const0>\;
  fifo_rd_dout(44) <= \<const0>\;
  fifo_rd_dout(43) <= \<const0>\;
  fifo_rd_dout(42) <= \<const0>\;
  fifo_rd_dout(41) <= \<const0>\;
  fifo_rd_dout(40) <= \<const0>\;
  fifo_rd_dout(39) <= \<const0>\;
  fifo_rd_dout(38) <= \<const0>\;
  fifo_rd_dout(37) <= \<const0>\;
  fifo_rd_dout(36) <= \<const0>\;
  fifo_rd_dout(35) <= \<const0>\;
  fifo_rd_dout(34) <= \<const0>\;
  fifo_rd_dout(33) <= \<const0>\;
  fifo_rd_dout(32) <= \<const0>\;
  fifo_rd_dout(31) <= \<const0>\;
  fifo_rd_dout(30) <= \<const0>\;
  fifo_rd_dout(29) <= \<const0>\;
  fifo_rd_dout(28) <= \<const0>\;
  fifo_rd_dout(27) <= \<const0>\;
  fifo_rd_dout(26) <= \<const0>\;
  fifo_rd_dout(25) <= \<const0>\;
  fifo_rd_dout(24) <= \<const0>\;
  fifo_rd_dout(23) <= \<const0>\;
  fifo_rd_dout(22) <= \<const0>\;
  fifo_rd_dout(21) <= \<const0>\;
  fifo_rd_dout(20) <= \<const0>\;
  fifo_rd_dout(19) <= \<const0>\;
  fifo_rd_dout(18) <= \<const0>\;
  fifo_rd_dout(17) <= \<const0>\;
  fifo_rd_dout(16) <= \<const0>\;
  fifo_rd_dout(15) <= \<const0>\;
  fifo_rd_dout(14) <= \<const0>\;
  fifo_rd_dout(13) <= \<const0>\;
  fifo_rd_dout(12) <= \<const0>\;
  fifo_rd_dout(11) <= \<const0>\;
  fifo_rd_dout(10) <= \<const0>\;
  fifo_rd_dout(9) <= \<const0>\;
  fifo_rd_dout(8) <= \<const0>\;
  fifo_rd_dout(7) <= \<const0>\;
  fifo_rd_dout(6) <= \<const0>\;
  fifo_rd_dout(5) <= \<const0>\;
  fifo_rd_dout(4) <= \<const0>\;
  fifo_rd_dout(3) <= \<const0>\;
  fifo_rd_dout(2) <= \<const0>\;
  fifo_rd_dout(1) <= \<const0>\;
  fifo_rd_dout(0) <= \<const0>\;
  fifo_rd_underflow <= \<const0>\;
  fifo_rd_valid <= \<const0>\;
  fifo_rd_xfer_req <= \<const0>\;
  m_axis_data(63) <= \<const0>\;
  m_axis_data(62) <= \<const0>\;
  m_axis_data(61) <= \<const0>\;
  m_axis_data(60) <= \<const0>\;
  m_axis_data(59) <= \<const0>\;
  m_axis_data(58) <= \<const0>\;
  m_axis_data(57) <= \<const0>\;
  m_axis_data(56) <= \<const0>\;
  m_axis_data(55) <= \<const0>\;
  m_axis_data(54) <= \<const0>\;
  m_axis_data(53) <= \<const0>\;
  m_axis_data(52) <= \<const0>\;
  m_axis_data(51) <= \<const0>\;
  m_axis_data(50) <= \<const0>\;
  m_axis_data(49) <= \<const0>\;
  m_axis_data(48) <= \<const0>\;
  m_axis_data(47) <= \<const0>\;
  m_axis_data(46) <= \<const0>\;
  m_axis_data(45) <= \<const0>\;
  m_axis_data(44) <= \<const0>\;
  m_axis_data(43) <= \<const0>\;
  m_axis_data(42) <= \<const0>\;
  m_axis_data(41) <= \<const0>\;
  m_axis_data(40) <= \<const0>\;
  m_axis_data(39) <= \<const0>\;
  m_axis_data(38) <= \<const0>\;
  m_axis_data(37) <= \<const0>\;
  m_axis_data(36) <= \<const0>\;
  m_axis_data(35) <= \<const0>\;
  m_axis_data(34) <= \<const0>\;
  m_axis_data(33) <= \<const0>\;
  m_axis_data(32) <= \<const0>\;
  m_axis_data(31) <= \<const0>\;
  m_axis_data(30) <= \<const0>\;
  m_axis_data(29) <= \<const0>\;
  m_axis_data(28) <= \<const0>\;
  m_axis_data(27) <= \<const0>\;
  m_axis_data(26) <= \<const0>\;
  m_axis_data(25) <= \<const0>\;
  m_axis_data(24) <= \<const0>\;
  m_axis_data(23) <= \<const0>\;
  m_axis_data(22) <= \<const0>\;
  m_axis_data(21) <= \<const0>\;
  m_axis_data(20) <= \<const0>\;
  m_axis_data(19) <= \<const0>\;
  m_axis_data(18) <= \<const0>\;
  m_axis_data(17) <= \<const0>\;
  m_axis_data(16) <= \<const0>\;
  m_axis_data(15) <= \<const0>\;
  m_axis_data(14) <= \<const0>\;
  m_axis_data(13) <= \<const0>\;
  m_axis_data(12) <= \<const0>\;
  m_axis_data(11) <= \<const0>\;
  m_axis_data(10) <= \<const0>\;
  m_axis_data(9) <= \<const0>\;
  m_axis_data(8) <= \<const0>\;
  m_axis_data(7) <= \<const0>\;
  m_axis_data(6) <= \<const0>\;
  m_axis_data(5) <= \<const0>\;
  m_axis_data(4) <= \<const0>\;
  m_axis_data(3) <= \<const0>\;
  m_axis_data(2) <= \<const0>\;
  m_axis_data(1) <= \<const0>\;
  m_axis_data(0) <= \<const0>\;
  m_axis_dest(3) <= \<const0>\;
  m_axis_dest(2) <= \<const0>\;
  m_axis_dest(1) <= \<const0>\;
  m_axis_dest(0) <= \<const0>\;
  m_axis_id(7) <= \<const0>\;
  m_axis_id(6) <= \<const0>\;
  m_axis_id(5) <= \<const0>\;
  m_axis_id(4) <= \<const0>\;
  m_axis_id(3) <= \<const0>\;
  m_axis_id(2) <= \<const0>\;
  m_axis_id(1) <= \<const0>\;
  m_axis_id(0) <= \<const0>\;
  m_axis_keep(7) <= \<const0>\;
  m_axis_keep(6) <= \<const0>\;
  m_axis_keep(5) <= \<const0>\;
  m_axis_keep(4) <= \<const0>\;
  m_axis_keep(3) <= \<const0>\;
  m_axis_keep(2) <= \<const0>\;
  m_axis_keep(1) <= \<const0>\;
  m_axis_keep(0) <= \<const0>\;
  m_axis_last <= \<const0>\;
  m_axis_strb(7) <= \<const0>\;
  m_axis_strb(6) <= \<const0>\;
  m_axis_strb(5) <= \<const0>\;
  m_axis_strb(4) <= \<const0>\;
  m_axis_strb(3) <= \<const0>\;
  m_axis_strb(2) <= \<const0>\;
  m_axis_strb(1) <= \<const0>\;
  m_axis_strb(0) <= \<const0>\;
  m_axis_user(0) <= \<const0>\;
  m_axis_valid <= \<const0>\;
  m_axis_xfer_req <= \<const0>\;
  m_dest_axi_araddr(30) <= \<const0>\;
  m_dest_axi_araddr(29) <= \<const0>\;
  m_dest_axi_araddr(28) <= \<const0>\;
  m_dest_axi_araddr(27) <= \<const0>\;
  m_dest_axi_araddr(26) <= \<const0>\;
  m_dest_axi_araddr(25) <= \<const0>\;
  m_dest_axi_araddr(24) <= \<const0>\;
  m_dest_axi_araddr(23) <= \<const0>\;
  m_dest_axi_araddr(22) <= \<const0>\;
  m_dest_axi_araddr(21) <= \<const0>\;
  m_dest_axi_araddr(20) <= \<const0>\;
  m_dest_axi_araddr(19) <= \<const0>\;
  m_dest_axi_araddr(18) <= \<const0>\;
  m_dest_axi_araddr(17) <= \<const0>\;
  m_dest_axi_araddr(16) <= \<const0>\;
  m_dest_axi_araddr(15) <= \<const0>\;
  m_dest_axi_araddr(14) <= \<const0>\;
  m_dest_axi_araddr(13) <= \<const0>\;
  m_dest_axi_araddr(12) <= \<const0>\;
  m_dest_axi_araddr(11) <= \<const0>\;
  m_dest_axi_araddr(10) <= \<const0>\;
  m_dest_axi_araddr(9) <= \<const0>\;
  m_dest_axi_araddr(8) <= \<const0>\;
  m_dest_axi_araddr(7) <= \<const0>\;
  m_dest_axi_araddr(6) <= \<const0>\;
  m_dest_axi_araddr(5) <= \<const0>\;
  m_dest_axi_araddr(4) <= \<const0>\;
  m_dest_axi_araddr(3) <= \<const0>\;
  m_dest_axi_araddr(2) <= \<const0>\;
  m_dest_axi_araddr(1) <= \<const0>\;
  m_dest_axi_araddr(0) <= \<const0>\;
  m_dest_axi_arburst(1) <= \<const0>\;
  m_dest_axi_arburst(0) <= \<const0>\;
  m_dest_axi_arcache(3) <= \<const0>\;
  m_dest_axi_arcache(2) <= \<const0>\;
  m_dest_axi_arcache(1) <= \<const0>\;
  m_dest_axi_arcache(0) <= \<const0>\;
  m_dest_axi_arid(0) <= \<const0>\;
  m_dest_axi_arlen(7) <= \<const0>\;
  m_dest_axi_arlen(6) <= \<const0>\;
  m_dest_axi_arlen(5) <= \<const0>\;
  m_dest_axi_arlen(4) <= \<const0>\;
  m_dest_axi_arlen(3) <= \<const0>\;
  m_dest_axi_arlen(2) <= \<const0>\;
  m_dest_axi_arlen(1) <= \<const0>\;
  m_dest_axi_arlen(0) <= \<const0>\;
  m_dest_axi_arlock(0) <= \<const0>\;
  m_dest_axi_arprot(2) <= \<const0>\;
  m_dest_axi_arprot(1) <= \<const0>\;
  m_dest_axi_arprot(0) <= \<const0>\;
  m_dest_axi_arsize(2) <= \<const0>\;
  m_dest_axi_arsize(1) <= \<const0>\;
  m_dest_axi_arsize(0) <= \<const0>\;
  m_dest_axi_arvalid <= \<const0>\;
  m_dest_axi_awaddr(30 downto 3) <= \^m_dest_axi_awaddr\(30 downto 3);
  m_dest_axi_awaddr(2) <= \<const0>\;
  m_dest_axi_awaddr(1) <= \<const0>\;
  m_dest_axi_awaddr(0) <= \<const0>\;
  m_dest_axi_awburst(1) <= \<const0>\;
  m_dest_axi_awburst(0) <= \<const0>\;
  m_dest_axi_awcache(3) <= \<const0>\;
  m_dest_axi_awcache(2) <= \<const0>\;
  m_dest_axi_awcache(1) <= \<const0>\;
  m_dest_axi_awcache(0) <= \<const0>\;
  m_dest_axi_awid(0) <= \<const0>\;
  m_dest_axi_awlen(7) <= \<const0>\;
  m_dest_axi_awlen(6) <= \<const0>\;
  m_dest_axi_awlen(5) <= \<const0>\;
  m_dest_axi_awlen(4) <= \<const0>\;
  m_dest_axi_awlen(3 downto 0) <= \^m_dest_axi_awlen\(3 downto 0);
  m_dest_axi_awlock(0) <= \<const0>\;
  m_dest_axi_awprot(2) <= \<const0>\;
  m_dest_axi_awprot(1) <= \<const0>\;
  m_dest_axi_awprot(0) <= \<const0>\;
  m_dest_axi_awsize(2) <= \<const0>\;
  m_dest_axi_awsize(1) <= \<const0>\;
  m_dest_axi_awsize(0) <= \<const0>\;
  m_dest_axi_rready <= \<const0>\;
  m_dest_axi_wid(0) <= \<const0>\;
  m_dest_axi_wstrb(7) <= \<const0>\;
  m_dest_axi_wstrb(6) <= \<const0>\;
  m_dest_axi_wstrb(5) <= \<const0>\;
  m_dest_axi_wstrb(4) <= \<const0>\;
  m_dest_axi_wstrb(3) <= \<const0>\;
  m_dest_axi_wstrb(2) <= \<const0>\;
  m_dest_axi_wstrb(1) <= \<const0>\;
  m_dest_axi_wstrb(0) <= \<const0>\;
  m_frame_out(2) <= \<const0>\;
  m_frame_out(1) <= \<const0>\;
  m_frame_out(0) <= \<const0>\;
  m_frame_out_valid <= \<const0>\;
  m_sg_axi_araddr(30) <= \<const0>\;
  m_sg_axi_araddr(29) <= \<const0>\;
  m_sg_axi_araddr(28) <= \<const0>\;
  m_sg_axi_araddr(27) <= \<const0>\;
  m_sg_axi_araddr(26) <= \<const0>\;
  m_sg_axi_araddr(25) <= \<const0>\;
  m_sg_axi_araddr(24) <= \<const0>\;
  m_sg_axi_araddr(23) <= \<const0>\;
  m_sg_axi_araddr(22) <= \<const0>\;
  m_sg_axi_araddr(21) <= \<const0>\;
  m_sg_axi_araddr(20) <= \<const0>\;
  m_sg_axi_araddr(19) <= \<const0>\;
  m_sg_axi_araddr(18) <= \<const0>\;
  m_sg_axi_araddr(17) <= \<const0>\;
  m_sg_axi_araddr(16) <= \<const0>\;
  m_sg_axi_araddr(15) <= \<const0>\;
  m_sg_axi_araddr(14) <= \<const0>\;
  m_sg_axi_araddr(13) <= \<const0>\;
  m_sg_axi_araddr(12) <= \<const0>\;
  m_sg_axi_araddr(11) <= \<const0>\;
  m_sg_axi_araddr(10) <= \<const0>\;
  m_sg_axi_araddr(9) <= \<const0>\;
  m_sg_axi_araddr(8) <= \<const0>\;
  m_sg_axi_araddr(7) <= \<const0>\;
  m_sg_axi_araddr(6) <= \<const0>\;
  m_sg_axi_araddr(5) <= \<const0>\;
  m_sg_axi_araddr(4) <= \<const0>\;
  m_sg_axi_araddr(3) <= \<const0>\;
  m_sg_axi_araddr(2) <= \<const0>\;
  m_sg_axi_araddr(1) <= \<const0>\;
  m_sg_axi_araddr(0) <= \<const0>\;
  m_sg_axi_arburst(1) <= \<const0>\;
  m_sg_axi_arburst(0) <= \<const0>\;
  m_sg_axi_arcache(3) <= \<const0>\;
  m_sg_axi_arcache(2) <= \<const0>\;
  m_sg_axi_arcache(1) <= \<const0>\;
  m_sg_axi_arcache(0) <= \<const0>\;
  m_sg_axi_arid(0) <= \<const0>\;
  m_sg_axi_arlen(7) <= \<const0>\;
  m_sg_axi_arlen(6) <= \<const0>\;
  m_sg_axi_arlen(5) <= \<const0>\;
  m_sg_axi_arlen(4) <= \<const0>\;
  m_sg_axi_arlen(3) <= \<const0>\;
  m_sg_axi_arlen(2) <= \<const0>\;
  m_sg_axi_arlen(1) <= \<const0>\;
  m_sg_axi_arlen(0) <= \<const0>\;
  m_sg_axi_arlock(0) <= \<const0>\;
  m_sg_axi_arprot(2) <= \<const0>\;
  m_sg_axi_arprot(1) <= \<const0>\;
  m_sg_axi_arprot(0) <= \<const0>\;
  m_sg_axi_arsize(2) <= \<const0>\;
  m_sg_axi_arsize(1) <= \<const0>\;
  m_sg_axi_arsize(0) <= \<const0>\;
  m_sg_axi_arvalid <= \<const0>\;
  m_sg_axi_awaddr(30) <= \<const0>\;
  m_sg_axi_awaddr(29) <= \<const0>\;
  m_sg_axi_awaddr(28) <= \<const0>\;
  m_sg_axi_awaddr(27) <= \<const0>\;
  m_sg_axi_awaddr(26) <= \<const0>\;
  m_sg_axi_awaddr(25) <= \<const0>\;
  m_sg_axi_awaddr(24) <= \<const0>\;
  m_sg_axi_awaddr(23) <= \<const0>\;
  m_sg_axi_awaddr(22) <= \<const0>\;
  m_sg_axi_awaddr(21) <= \<const0>\;
  m_sg_axi_awaddr(20) <= \<const0>\;
  m_sg_axi_awaddr(19) <= \<const0>\;
  m_sg_axi_awaddr(18) <= \<const0>\;
  m_sg_axi_awaddr(17) <= \<const0>\;
  m_sg_axi_awaddr(16) <= \<const0>\;
  m_sg_axi_awaddr(15) <= \<const0>\;
  m_sg_axi_awaddr(14) <= \<const0>\;
  m_sg_axi_awaddr(13) <= \<const0>\;
  m_sg_axi_awaddr(12) <= \<const0>\;
  m_sg_axi_awaddr(11) <= \<const0>\;
  m_sg_axi_awaddr(10) <= \<const0>\;
  m_sg_axi_awaddr(9) <= \<const0>\;
  m_sg_axi_awaddr(8) <= \<const0>\;
  m_sg_axi_awaddr(7) <= \<const0>\;
  m_sg_axi_awaddr(6) <= \<const0>\;
  m_sg_axi_awaddr(5) <= \<const0>\;
  m_sg_axi_awaddr(4) <= \<const0>\;
  m_sg_axi_awaddr(3) <= \<const0>\;
  m_sg_axi_awaddr(2) <= \<const0>\;
  m_sg_axi_awaddr(1) <= \<const0>\;
  m_sg_axi_awaddr(0) <= \<const0>\;
  m_sg_axi_awburst(1) <= \<const0>\;
  m_sg_axi_awburst(0) <= \<const0>\;
  m_sg_axi_awcache(3) <= \<const0>\;
  m_sg_axi_awcache(2) <= \<const0>\;
  m_sg_axi_awcache(1) <= \<const0>\;
  m_sg_axi_awcache(0) <= \<const0>\;
  m_sg_axi_awid(0) <= \<const0>\;
  m_sg_axi_awlen(7) <= \<const0>\;
  m_sg_axi_awlen(6) <= \<const0>\;
  m_sg_axi_awlen(5) <= \<const0>\;
  m_sg_axi_awlen(4) <= \<const0>\;
  m_sg_axi_awlen(3) <= \<const0>\;
  m_sg_axi_awlen(2) <= \<const0>\;
  m_sg_axi_awlen(1) <= \<const0>\;
  m_sg_axi_awlen(0) <= \<const0>\;
  m_sg_axi_awlock(0) <= \<const0>\;
  m_sg_axi_awprot(2) <= \<const0>\;
  m_sg_axi_awprot(1) <= \<const0>\;
  m_sg_axi_awprot(0) <= \<const0>\;
  m_sg_axi_awsize(2) <= \<const0>\;
  m_sg_axi_awsize(1) <= \<const0>\;
  m_sg_axi_awsize(0) <= \<const0>\;
  m_sg_axi_awvalid <= \<const0>\;
  m_sg_axi_bready <= \<const0>\;
  m_sg_axi_rready <= \<const0>\;
  m_sg_axi_wdata(63) <= \<const0>\;
  m_sg_axi_wdata(62) <= \<const0>\;
  m_sg_axi_wdata(61) <= \<const0>\;
  m_sg_axi_wdata(60) <= \<const0>\;
  m_sg_axi_wdata(59) <= \<const0>\;
  m_sg_axi_wdata(58) <= \<const0>\;
  m_sg_axi_wdata(57) <= \<const0>\;
  m_sg_axi_wdata(56) <= \<const0>\;
  m_sg_axi_wdata(55) <= \<const0>\;
  m_sg_axi_wdata(54) <= \<const0>\;
  m_sg_axi_wdata(53) <= \<const0>\;
  m_sg_axi_wdata(52) <= \<const0>\;
  m_sg_axi_wdata(51) <= \<const0>\;
  m_sg_axi_wdata(50) <= \<const0>\;
  m_sg_axi_wdata(49) <= \<const0>\;
  m_sg_axi_wdata(48) <= \<const0>\;
  m_sg_axi_wdata(47) <= \<const0>\;
  m_sg_axi_wdata(46) <= \<const0>\;
  m_sg_axi_wdata(45) <= \<const0>\;
  m_sg_axi_wdata(44) <= \<const0>\;
  m_sg_axi_wdata(43) <= \<const0>\;
  m_sg_axi_wdata(42) <= \<const0>\;
  m_sg_axi_wdata(41) <= \<const0>\;
  m_sg_axi_wdata(40) <= \<const0>\;
  m_sg_axi_wdata(39) <= \<const0>\;
  m_sg_axi_wdata(38) <= \<const0>\;
  m_sg_axi_wdata(37) <= \<const0>\;
  m_sg_axi_wdata(36) <= \<const0>\;
  m_sg_axi_wdata(35) <= \<const0>\;
  m_sg_axi_wdata(34) <= \<const0>\;
  m_sg_axi_wdata(33) <= \<const0>\;
  m_sg_axi_wdata(32) <= \<const0>\;
  m_sg_axi_wdata(31) <= \<const0>\;
  m_sg_axi_wdata(30) <= \<const0>\;
  m_sg_axi_wdata(29) <= \<const0>\;
  m_sg_axi_wdata(28) <= \<const0>\;
  m_sg_axi_wdata(27) <= \<const0>\;
  m_sg_axi_wdata(26) <= \<const0>\;
  m_sg_axi_wdata(25) <= \<const0>\;
  m_sg_axi_wdata(24) <= \<const0>\;
  m_sg_axi_wdata(23) <= \<const0>\;
  m_sg_axi_wdata(22) <= \<const0>\;
  m_sg_axi_wdata(21) <= \<const0>\;
  m_sg_axi_wdata(20) <= \<const0>\;
  m_sg_axi_wdata(19) <= \<const0>\;
  m_sg_axi_wdata(18) <= \<const0>\;
  m_sg_axi_wdata(17) <= \<const0>\;
  m_sg_axi_wdata(16) <= \<const0>\;
  m_sg_axi_wdata(15) <= \<const0>\;
  m_sg_axi_wdata(14) <= \<const0>\;
  m_sg_axi_wdata(13) <= \<const0>\;
  m_sg_axi_wdata(12) <= \<const0>\;
  m_sg_axi_wdata(11) <= \<const0>\;
  m_sg_axi_wdata(10) <= \<const0>\;
  m_sg_axi_wdata(9) <= \<const0>\;
  m_sg_axi_wdata(8) <= \<const0>\;
  m_sg_axi_wdata(7) <= \<const0>\;
  m_sg_axi_wdata(6) <= \<const0>\;
  m_sg_axi_wdata(5) <= \<const0>\;
  m_sg_axi_wdata(4) <= \<const0>\;
  m_sg_axi_wdata(3) <= \<const0>\;
  m_sg_axi_wdata(2) <= \<const0>\;
  m_sg_axi_wdata(1) <= \<const0>\;
  m_sg_axi_wdata(0) <= \<const0>\;
  m_sg_axi_wid(0) <= \<const0>\;
  m_sg_axi_wlast <= \<const0>\;
  m_sg_axi_wstrb(7) <= \<const0>\;
  m_sg_axi_wstrb(6) <= \<const0>\;
  m_sg_axi_wstrb(5) <= \<const0>\;
  m_sg_axi_wstrb(4) <= \<const0>\;
  m_sg_axi_wstrb(3) <= \<const0>\;
  m_sg_axi_wstrb(2) <= \<const0>\;
  m_sg_axi_wstrb(1) <= \<const0>\;
  m_sg_axi_wstrb(0) <= \<const0>\;
  m_sg_axi_wvalid <= \<const0>\;
  m_src_axi_araddr(30) <= \<const0>\;
  m_src_axi_araddr(29) <= \<const0>\;
  m_src_axi_araddr(28) <= \<const0>\;
  m_src_axi_araddr(27) <= \<const0>\;
  m_src_axi_araddr(26) <= \<const0>\;
  m_src_axi_araddr(25) <= \<const0>\;
  m_src_axi_araddr(24) <= \<const0>\;
  m_src_axi_araddr(23) <= \<const0>\;
  m_src_axi_araddr(22) <= \<const0>\;
  m_src_axi_araddr(21) <= \<const0>\;
  m_src_axi_araddr(20) <= \<const0>\;
  m_src_axi_araddr(19) <= \<const0>\;
  m_src_axi_araddr(18) <= \<const0>\;
  m_src_axi_araddr(17) <= \<const0>\;
  m_src_axi_araddr(16) <= \<const0>\;
  m_src_axi_araddr(15) <= \<const0>\;
  m_src_axi_araddr(14) <= \<const0>\;
  m_src_axi_araddr(13) <= \<const0>\;
  m_src_axi_araddr(12) <= \<const0>\;
  m_src_axi_araddr(11) <= \<const0>\;
  m_src_axi_araddr(10) <= \<const0>\;
  m_src_axi_araddr(9) <= \<const0>\;
  m_src_axi_araddr(8) <= \<const0>\;
  m_src_axi_araddr(7) <= \<const0>\;
  m_src_axi_araddr(6) <= \<const0>\;
  m_src_axi_araddr(5) <= \<const0>\;
  m_src_axi_araddr(4) <= \<const0>\;
  m_src_axi_araddr(3) <= \<const0>\;
  m_src_axi_araddr(2) <= \<const0>\;
  m_src_axi_araddr(1) <= \<const0>\;
  m_src_axi_araddr(0) <= \<const0>\;
  m_src_axi_arburst(1) <= \<const0>\;
  m_src_axi_arburst(0) <= \<const0>\;
  m_src_axi_arcache(3) <= \<const0>\;
  m_src_axi_arcache(2) <= \<const0>\;
  m_src_axi_arcache(1) <= \<const0>\;
  m_src_axi_arcache(0) <= \<const0>\;
  m_src_axi_arid(0) <= \<const0>\;
  m_src_axi_arlen(7) <= \<const0>\;
  m_src_axi_arlen(6) <= \<const0>\;
  m_src_axi_arlen(5) <= \<const0>\;
  m_src_axi_arlen(4) <= \<const0>\;
  m_src_axi_arlen(3) <= \<const0>\;
  m_src_axi_arlen(2) <= \<const0>\;
  m_src_axi_arlen(1) <= \<const0>\;
  m_src_axi_arlen(0) <= \<const0>\;
  m_src_axi_arlock(0) <= \<const0>\;
  m_src_axi_arprot(2) <= \<const0>\;
  m_src_axi_arprot(1) <= \<const0>\;
  m_src_axi_arprot(0) <= \<const0>\;
  m_src_axi_arsize(2) <= \<const0>\;
  m_src_axi_arsize(1) <= \<const0>\;
  m_src_axi_arsize(0) <= \<const0>\;
  m_src_axi_arvalid <= \<const0>\;
  m_src_axi_awaddr(30) <= \<const0>\;
  m_src_axi_awaddr(29) <= \<const0>\;
  m_src_axi_awaddr(28) <= \<const0>\;
  m_src_axi_awaddr(27) <= \<const0>\;
  m_src_axi_awaddr(26) <= \<const0>\;
  m_src_axi_awaddr(25) <= \<const0>\;
  m_src_axi_awaddr(24) <= \<const0>\;
  m_src_axi_awaddr(23) <= \<const0>\;
  m_src_axi_awaddr(22) <= \<const0>\;
  m_src_axi_awaddr(21) <= \<const0>\;
  m_src_axi_awaddr(20) <= \<const0>\;
  m_src_axi_awaddr(19) <= \<const0>\;
  m_src_axi_awaddr(18) <= \<const0>\;
  m_src_axi_awaddr(17) <= \<const0>\;
  m_src_axi_awaddr(16) <= \<const0>\;
  m_src_axi_awaddr(15) <= \<const0>\;
  m_src_axi_awaddr(14) <= \<const0>\;
  m_src_axi_awaddr(13) <= \<const0>\;
  m_src_axi_awaddr(12) <= \<const0>\;
  m_src_axi_awaddr(11) <= \<const0>\;
  m_src_axi_awaddr(10) <= \<const0>\;
  m_src_axi_awaddr(9) <= \<const0>\;
  m_src_axi_awaddr(8) <= \<const0>\;
  m_src_axi_awaddr(7) <= \<const0>\;
  m_src_axi_awaddr(6) <= \<const0>\;
  m_src_axi_awaddr(5) <= \<const0>\;
  m_src_axi_awaddr(4) <= \<const0>\;
  m_src_axi_awaddr(3) <= \<const0>\;
  m_src_axi_awaddr(2) <= \<const0>\;
  m_src_axi_awaddr(1) <= \<const0>\;
  m_src_axi_awaddr(0) <= \<const0>\;
  m_src_axi_awburst(1) <= \<const0>\;
  m_src_axi_awburst(0) <= \<const0>\;
  m_src_axi_awcache(3) <= \<const0>\;
  m_src_axi_awcache(2) <= \<const0>\;
  m_src_axi_awcache(1) <= \<const0>\;
  m_src_axi_awcache(0) <= \<const0>\;
  m_src_axi_awid(0) <= \<const0>\;
  m_src_axi_awlen(7) <= \<const0>\;
  m_src_axi_awlen(6) <= \<const0>\;
  m_src_axi_awlen(5) <= \<const0>\;
  m_src_axi_awlen(4) <= \<const0>\;
  m_src_axi_awlen(3) <= \<const0>\;
  m_src_axi_awlen(2) <= \<const0>\;
  m_src_axi_awlen(1) <= \<const0>\;
  m_src_axi_awlen(0) <= \<const0>\;
  m_src_axi_awlock(0) <= \<const0>\;
  m_src_axi_awprot(2) <= \<const0>\;
  m_src_axi_awprot(1) <= \<const0>\;
  m_src_axi_awprot(0) <= \<const0>\;
  m_src_axi_awsize(2) <= \<const0>\;
  m_src_axi_awsize(1) <= \<const0>\;
  m_src_axi_awsize(0) <= \<const0>\;
  m_src_axi_awvalid <= \<const0>\;
  m_src_axi_bready <= \<const0>\;
  m_src_axi_rready <= \<const0>\;
  m_src_axi_wdata(63) <= \<const0>\;
  m_src_axi_wdata(62) <= \<const0>\;
  m_src_axi_wdata(61) <= \<const0>\;
  m_src_axi_wdata(60) <= \<const0>\;
  m_src_axi_wdata(59) <= \<const0>\;
  m_src_axi_wdata(58) <= \<const0>\;
  m_src_axi_wdata(57) <= \<const0>\;
  m_src_axi_wdata(56) <= \<const0>\;
  m_src_axi_wdata(55) <= \<const0>\;
  m_src_axi_wdata(54) <= \<const0>\;
  m_src_axi_wdata(53) <= \<const0>\;
  m_src_axi_wdata(52) <= \<const0>\;
  m_src_axi_wdata(51) <= \<const0>\;
  m_src_axi_wdata(50) <= \<const0>\;
  m_src_axi_wdata(49) <= \<const0>\;
  m_src_axi_wdata(48) <= \<const0>\;
  m_src_axi_wdata(47) <= \<const0>\;
  m_src_axi_wdata(46) <= \<const0>\;
  m_src_axi_wdata(45) <= \<const0>\;
  m_src_axi_wdata(44) <= \<const0>\;
  m_src_axi_wdata(43) <= \<const0>\;
  m_src_axi_wdata(42) <= \<const0>\;
  m_src_axi_wdata(41) <= \<const0>\;
  m_src_axi_wdata(40) <= \<const0>\;
  m_src_axi_wdata(39) <= \<const0>\;
  m_src_axi_wdata(38) <= \<const0>\;
  m_src_axi_wdata(37) <= \<const0>\;
  m_src_axi_wdata(36) <= \<const0>\;
  m_src_axi_wdata(35) <= \<const0>\;
  m_src_axi_wdata(34) <= \<const0>\;
  m_src_axi_wdata(33) <= \<const0>\;
  m_src_axi_wdata(32) <= \<const0>\;
  m_src_axi_wdata(31) <= \<const0>\;
  m_src_axi_wdata(30) <= \<const0>\;
  m_src_axi_wdata(29) <= \<const0>\;
  m_src_axi_wdata(28) <= \<const0>\;
  m_src_axi_wdata(27) <= \<const0>\;
  m_src_axi_wdata(26) <= \<const0>\;
  m_src_axi_wdata(25) <= \<const0>\;
  m_src_axi_wdata(24) <= \<const0>\;
  m_src_axi_wdata(23) <= \<const0>\;
  m_src_axi_wdata(22) <= \<const0>\;
  m_src_axi_wdata(21) <= \<const0>\;
  m_src_axi_wdata(20) <= \<const0>\;
  m_src_axi_wdata(19) <= \<const0>\;
  m_src_axi_wdata(18) <= \<const0>\;
  m_src_axi_wdata(17) <= \<const0>\;
  m_src_axi_wdata(16) <= \<const0>\;
  m_src_axi_wdata(15) <= \<const0>\;
  m_src_axi_wdata(14) <= \<const0>\;
  m_src_axi_wdata(13) <= \<const0>\;
  m_src_axi_wdata(12) <= \<const0>\;
  m_src_axi_wdata(11) <= \<const0>\;
  m_src_axi_wdata(10) <= \<const0>\;
  m_src_axi_wdata(9) <= \<const0>\;
  m_src_axi_wdata(8) <= \<const0>\;
  m_src_axi_wdata(7) <= \<const0>\;
  m_src_axi_wdata(6) <= \<const0>\;
  m_src_axi_wdata(5) <= \<const0>\;
  m_src_axi_wdata(4) <= \<const0>\;
  m_src_axi_wdata(3) <= \<const0>\;
  m_src_axi_wdata(2) <= \<const0>\;
  m_src_axi_wdata(1) <= \<const0>\;
  m_src_axi_wdata(0) <= \<const0>\;
  m_src_axi_wid(0) <= \<const0>\;
  m_src_axi_wlast <= \<const0>\;
  m_src_axi_wstrb(7) <= \<const0>\;
  m_src_axi_wstrb(6) <= \<const0>\;
  m_src_axi_wstrb(5) <= \<const0>\;
  m_src_axi_wstrb(4) <= \<const0>\;
  m_src_axi_wstrb(3) <= \<const0>\;
  m_src_axi_wstrb(2) <= \<const0>\;
  m_src_axi_wstrb(1) <= \<const0>\;
  m_src_axi_wstrb(0) <= \<const0>\;
  m_src_axi_wvalid <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axis_ready <= \<const0>\;
  s_axis_xfer_req <= \<const0>\;
  s_frame_out(2) <= \<const0>\;
  s_frame_out(1) <= \<const0>\;
  s_frame_out(0) <= \<const0>\;
  s_frame_out_valid <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
i_regmap: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_regmap
     port map (
      ADDRC(3) => i_transfer_n_88,
      ADDRC(2) => i_transfer_n_89,
      ADDRC(1) => i_transfer_n_90,
      ADDRC(0) => i_transfer_n_91,
      D(60 downto 33) => up_dma_req_dest_address(30 downto 3),
      D(32 downto 5) => up_dma_req_src_address(30 downto 3),
      D(4 downto 1) => up_dma_req_x_length(6 downto 3),
      D(0) => up_dma_req_last,
      E(0) => \i_request_arb/i_src_req_fifo/zerodeep.cdc_sync_fifo_ram_reg0\,
      Q(0) => up_raddr(1),
      ctrl_enable => ctrl_enable,
      ctrl_pause => ctrl_pause,
      dbg_ids0(7 downto 4) => dbg_ids0(19 downto 16),
      dbg_ids0(3 downto 0) => dbg_ids0(3 downto 0),
      dbg_ids1(3 downto 0) => dbg_ids1(3 downto 0),
      dbg_status(6) => dbg_status(11),
      dbg_status(5 downto 3) => dbg_status(6 downto 4),
      dbg_status(2 downto 0) => dbg_status(2 downto 0),
      dma_req_eot => dma_req_eot,
      g(3 downto 0) => g(3 downto 0),
      irq => irq,
      m_dest_axi_awaddr(26 downto 7) => \^m_dest_axi_awaddr\(30 downto 11),
      m_dest_axi_awaddr(6 downto 0) => \^m_dest_axi_awaddr\(9 downto 3),
      p_3_in(0) => \i_regmap_request/p_3_in\(2),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(8 downto 0) => s_axi_araddr(10 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => i_regmap_n_1,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(8 downto 0) => s_axi_awaddr(10 downto 2),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      up_axi_rvalid_int_reg => s_axi_rvalid,
      up_bl_partial => \i_regmap_request/up_bl_partial\,
      up_dma_req_valid => up_dma_req_valid,
      \up_dma_x_length_reg[23]\(16 downto 0) => up_dma_req_x_length(23 downto 7),
      up_eot => up_eot,
      \up_irq_source_reg[0]_0\ => i_transfer_n_129,
      \up_measured_transfer_length_reg[7]\(6 downto 0) => up_req_measured_burst_length(6 downto 0),
      \up_raddr_int_reg[0]\ => i_regmap_n_74,
      \up_rdata[8]_i_2\ => i_transfer_n_95,
      \up_rdata_reg[10]_0\ => i_transfer_n_128,
      \up_rdata_reg[10]_1\ => i_transfer_n_93,
      \up_rdata_reg[11]_0\ => i_transfer_n_92,
      \up_rdata_reg[8]_0\(0) => i_transfer_n_79,
      \up_rdata_reg[9]_0\(0) => i_transfer_n_80,
      \up_rdata_reg[9]_1\ => i_transfer_n_94,
      up_response_ready => up_response_ready,
      up_response_valid => up_response_valid
    );
i_transfer: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac_transfer
     port map (
      ADDRC(3) => i_transfer_n_88,
      ADDRC(2) => i_transfer_n_89,
      ADDRC(1) => i_transfer_n_90,
      ADDRC(0) => i_transfer_n_91,
      D(56 downto 29) => up_dma_req_dest_address(30 downto 3),
      D(28 downto 1) => up_dma_req_src_address(30 downto 3),
      D(0) => up_dma_req_last,
      E(0) => \i_request_arb/i_src_req_fifo/zerodeep.cdc_sync_fifo_ram_reg0\,
      Q(0) => i_transfer_n_79,
      SS(0) => i_regmap_n_1,
      active_reg => fifo_wr_xfer_req,
      addr_valid_reg => m_dest_axi_awvalid,
      \cdc_sync_stage2_reg[0]\ => i_transfer_n_129,
      ctrl_enable => ctrl_enable,
      ctrl_pause => ctrl_pause,
      dbg_ids0(7 downto 4) => dbg_ids0(19 downto 16),
      dbg_ids0(3 downto 0) => dbg_ids0(3 downto 0),
      dbg_ids1(3 downto 0) => dbg_ids1(3 downto 0),
      dbg_status(6) => dbg_status(11),
      dbg_status(5 downto 3) => dbg_status(6 downto 4),
      dbg_status(2 downto 0) => dbg_status(2 downto 0),
      dest_mem_data_valid_reg => m_dest_axi_wvalid,
      dma_req_eot => dma_req_eot,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_din(63 downto 0) => fifo_wr_din(63 downto 0),
      fifo_wr_en => fifo_wr_en,
      fifo_wr_overflow => fifo_wr_overflow,
      g(3 downto 0) => g(3 downto 0),
      \id_reg[0]\ => i_transfer_n_95,
      \id_reg[1]\ => i_transfer_n_94,
      \id_reg[2]\ => i_transfer_n_93,
      \id_reg[3]\ => i_transfer_n_92,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_awaddr(27 downto 0) => \^m_dest_axi_awaddr\(30 downto 3),
      m_dest_axi_awlen(3 downto 0) => \^m_dest_axi_awlen\(3 downto 0),
      m_dest_axi_awready => m_dest_axi_awready,
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      m_dest_axi_wdata(63 downto 0) => m_dest_axi_wdata(63 downto 0),
      m_dest_axi_wlast => m_dest_axi_wlast,
      m_dest_axi_wready => m_dest_axi_wready,
      \measured_burst_length_reg[6]\(6 downto 0) => up_req_measured_burst_length(6 downto 0),
      p_3_in(0) => \i_regmap_request/p_3_in\(2),
      \reset_gen[1].reset_sync_reg[0]\(0) => i_transfer_n_80,
      \reset_gen[2].reset_sync_reg[0]\ => i_transfer_n_128,
      s_axi_aclk => s_axi_aclk,
      sync => sync,
      up_bl_partial => \i_regmap_request/up_bl_partial\,
      up_dma_req_valid => up_dma_req_valid,
      up_dma_req_x_length(20 downto 0) => up_dma_req_x_length(23 downto 3),
      up_eot => up_eot,
      \up_rdata_reg[10]\ => i_regmap_n_74,
      \up_rdata_reg[10]_0\(0) => up_raddr(1),
      up_response_ready => up_response_ready,
      up_response_valid => up_response_valid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_adrv9001_rx1_dma_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    irq : out STD_LOGIC;
    sync : in STD_LOGIC;
    m_dest_axi_aclk : in STD_LOGIC;
    m_dest_axi_aresetn : in STD_LOGIC;
    m_dest_axi_awaddr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    m_dest_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_dest_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_dest_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_dest_axi_awvalid : out STD_LOGIC;
    m_dest_axi_awready : in STD_LOGIC;
    m_dest_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_dest_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_dest_axi_wready : in STD_LOGIC;
    m_dest_axi_wvalid : out STD_LOGIC;
    m_dest_axi_wlast : out STD_LOGIC;
    m_dest_axi_bvalid : in STD_LOGIC;
    m_dest_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_dest_axi_bready : out STD_LOGIC;
    fifo_wr_clk : in STD_LOGIC;
    fifo_wr_en : in STD_LOGIC;
    fifo_wr_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    fifo_wr_overflow : out STD_LOGIC;
    fifo_wr_xfer_req : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_axi_adrv9001_rx1_dma_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_axi_adrv9001_rx1_dma_0 : entity is "system_axi_adrv9001_rx1_dma_0,axi_dmac,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_axi_adrv9001_rx1_dma_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_axi_adrv9001_rx1_dma_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_axi_adrv9001_rx1_dma_0 : entity is "axi_dmac,Vivado 2025.1";
end system_axi_adrv9001_rx1_dma_0;

architecture STRUCTURE of system_axi_adrv9001_rx1_dma_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_dest_axi_awaddr\ : STD_LOGIC_VECTOR ( 30 downto 3 );
  signal \^m_dest_axi_awlen\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_rd_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_rd_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_rd_xfer_req_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axis_last_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axis_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_axis_xfer_req_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_dest_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_dest_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_frame_out_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_sg_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_m_src_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axis_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axis_xfer_req_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_frame_out_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dest_diag_level_bursts_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_fifo_rd_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_axis_data_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_axis_dest_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axis_id_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_keep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_strb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_user_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal NLW_inst_m_dest_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_dest_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_dest_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_dest_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_dest_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_dest_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_dest_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_dest_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_dest_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_inst_m_dest_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_dest_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_dest_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_dest_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_frame_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_sg_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal NLW_inst_m_sg_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_sg_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_sg_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_sg_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_sg_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_sg_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_sg_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_sg_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal NLW_inst_m_sg_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_sg_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_sg_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_sg_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_sg_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_sg_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_sg_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_sg_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_sg_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_sg_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_src_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal NLW_inst_m_src_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_src_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_src_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_src_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_src_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_src_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_src_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_src_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal NLW_inst_m_src_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_m_src_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_src_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_src_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_src_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_src_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_src_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_m_src_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_m_src_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_src_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_frame_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute ALLOW_ASYM_MEM : integer;
  attribute ALLOW_ASYM_MEM of inst : label is 1;
  attribute ASYNC_CLK_DEST_REQ : string;
  attribute ASYNC_CLK_DEST_REQ of inst : label is "1'b1";
  attribute ASYNC_CLK_DEST_SG : string;
  attribute ASYNC_CLK_DEST_SG of inst : label is "1'b1";
  attribute ASYNC_CLK_REQ_SG : string;
  attribute ASYNC_CLK_REQ_SG of inst : label is "1'b1";
  attribute ASYNC_CLK_REQ_SRC : string;
  attribute ASYNC_CLK_REQ_SRC of inst : label is "1'b1";
  attribute ASYNC_CLK_SRC_DEST : string;
  attribute ASYNC_CLK_SRC_DEST of inst : label is "1'b1";
  attribute ASYNC_CLK_SRC_SG : string;
  attribute ASYNC_CLK_SRC_SG of inst : label is "1'b1";
  attribute AUTORUN : string;
  attribute AUTORUN of inst : label is "1'b0";
  attribute AUTORUN_DEST_ADDR : integer;
  attribute AUTORUN_DEST_ADDR of inst : label is 0;
  attribute AUTORUN_DEST_STRIDE : integer;
  attribute AUTORUN_DEST_STRIDE of inst : label is 0;
  attribute AUTORUN_FLAGS : integer;
  attribute AUTORUN_FLAGS of inst : label is 0;
  attribute AUTORUN_FRAMELOCK_CONFIG : integer;
  attribute AUTORUN_FRAMELOCK_CONFIG of inst : label is 0;
  attribute AUTORUN_FRAMELOCK_STRIDE : integer;
  attribute AUTORUN_FRAMELOCK_STRIDE of inst : label is 0;
  attribute AUTORUN_SG_ADDRESS : integer;
  attribute AUTORUN_SG_ADDRESS of inst : label is 0;
  attribute AUTORUN_SRC_ADDR : integer;
  attribute AUTORUN_SRC_ADDR of inst : label is 0;
  attribute AUTORUN_SRC_STRIDE : integer;
  attribute AUTORUN_SRC_STRIDE of inst : label is 0;
  attribute AUTORUN_X_LENGTH : integer;
  attribute AUTORUN_X_LENGTH of inst : label is 0;
  attribute AUTORUN_Y_LENGTH : integer;
  attribute AUTORUN_Y_LENGTH of inst : label is 0;
  attribute AXIS_TUSER_SYNC : string;
  attribute AXIS_TUSER_SYNC of inst : label is "1'b1";
  attribute AXI_AXCACHE : string;
  attribute AXI_AXCACHE of inst : label is "4'b1111";
  attribute AXI_AXPROT : string;
  attribute AXI_AXPROT of inst : label is "3'b010";
  attribute AXI_ID_WIDTH_DEST : integer;
  attribute AXI_ID_WIDTH_DEST of inst : label is 1;
  attribute AXI_ID_WIDTH_SG : integer;
  attribute AXI_ID_WIDTH_SG of inst : label is 1;
  attribute AXI_ID_WIDTH_SRC : integer;
  attribute AXI_ID_WIDTH_SRC of inst : label is 1;
  attribute AXI_SLICE_DEST : string;
  attribute AXI_SLICE_DEST of inst : label is "1'b0";
  attribute AXI_SLICE_SRC : string;
  attribute AXI_SLICE_SRC of inst : label is "1'b0";
  attribute BEATS_PER_BURST_LIMIT_DEST : integer;
  attribute BEATS_PER_BURST_LIMIT_DEST of inst : label is 256;
  attribute BEATS_PER_BURST_LIMIT_SRC : integer;
  attribute BEATS_PER_BURST_LIMIT_SRC of inst : label is 1024;
  attribute BYTES_PER_BEAT_WIDTH_DEST : integer;
  attribute BYTES_PER_BEAT_WIDTH_DEST of inst : label is 3;
  attribute BYTES_PER_BEAT_WIDTH_SG : integer;
  attribute BYTES_PER_BEAT_WIDTH_SG of inst : label is 3;
  attribute BYTES_PER_BEAT_WIDTH_SRC : integer;
  attribute BYTES_PER_BEAT_WIDTH_SRC of inst : label is 3;
  attribute BYTES_PER_BURST_LIMIT : integer;
  attribute BYTES_PER_BURST_LIMIT of inst : label is 2048;
  attribute BYTES_PER_BURST_LIMIT_DEST : integer;
  attribute BYTES_PER_BURST_LIMIT_DEST of inst : label is 2048;
  attribute BYTES_PER_BURST_LIMIT_SRC : integer;
  attribute BYTES_PER_BURST_LIMIT_SRC of inst : label is 8192;
  attribute BYTES_PER_BURST_WIDTH : integer;
  attribute BYTES_PER_BURST_WIDTH of inst : label is 7;
  attribute CACHE_COHERENT : string;
  attribute CACHE_COHERENT of inst : label is "1'b1";
  attribute CYCLIC : string;
  attribute CYCLIC of inst : label is "1'b0";
  attribute DBG_ID_PADDING : integer;
  attribute DBG_ID_PADDING of inst : label is 4;
  attribute DISABLE_DEBUG_REGISTERS : string;
  attribute DISABLE_DEBUG_REGISTERS of inst : label is "1'b0";
  attribute DMA_2D_TLAST_MODE : integer;
  attribute DMA_2D_TLAST_MODE of inst : label is 0;
  attribute DMA_2D_TRANSFER : string;
  attribute DMA_2D_TRANSFER of inst : label is "1'b0";
  attribute DMA_AXIS_DEST_W : integer;
  attribute DMA_AXIS_DEST_W of inst : label is 4;
  attribute DMA_AXIS_ID_W : integer;
  attribute DMA_AXIS_ID_W of inst : label is 8;
  attribute DMA_AXI_ADDR_WIDTH : integer;
  attribute DMA_AXI_ADDR_WIDTH of inst : label is 31;
  attribute DMA_AXI_PROTOCOL_DEST : integer;
  attribute DMA_AXI_PROTOCOL_DEST of inst : label is 0;
  attribute DMA_AXI_PROTOCOL_SG : integer;
  attribute DMA_AXI_PROTOCOL_SG of inst : label is 0;
  attribute DMA_AXI_PROTOCOL_SRC : integer;
  attribute DMA_AXI_PROTOCOL_SRC of inst : label is 0;
  attribute DMA_DATA_WIDTH_DEST : integer;
  attribute DMA_DATA_WIDTH_DEST of inst : label is 64;
  attribute DMA_DATA_WIDTH_SG : integer;
  attribute DMA_DATA_WIDTH_SG of inst : label is 64;
  attribute DMA_DATA_WIDTH_SRC : integer;
  attribute DMA_DATA_WIDTH_SRC of inst : label is 64;
  attribute DMA_LENGTH_ALIGN : integer;
  attribute DMA_LENGTH_ALIGN of inst : label is 3;
  attribute DMA_LENGTH_ALIGN_DEST : integer;
  attribute DMA_LENGTH_ALIGN_DEST of inst : label is 0;
  attribute DMA_LENGTH_ALIGN_SRC : integer;
  attribute DMA_LENGTH_ALIGN_SRC of inst : label is 3;
  attribute DMA_LENGTH_WIDTH : integer;
  attribute DMA_LENGTH_WIDTH of inst : label is 24;
  attribute DMA_SG_TRANSFER : string;
  attribute DMA_SG_TRANSFER of inst : label is "1'b0";
  attribute DMA_TYPE_AXI_MM : integer;
  attribute DMA_TYPE_AXI_MM of inst : label is 0;
  attribute DMA_TYPE_AXI_STREAM : integer;
  attribute DMA_TYPE_AXI_STREAM of inst : label is 1;
  attribute DMA_TYPE_DEST : integer;
  attribute DMA_TYPE_DEST of inst : label is 0;
  attribute DMA_TYPE_FIFO : integer;
  attribute DMA_TYPE_FIFO of inst : label is 2;
  attribute DMA_TYPE_SRC : integer;
  attribute DMA_TYPE_SRC of inst : label is 2;
  attribute ENABLE_DIAGNOSTICS_IF : string;
  attribute ENABLE_DIAGNOSTICS_IF of inst : label is "1'b0";
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of inst : label is 8;
  attribute FRAMELOCK : string;
  attribute FRAMELOCK of inst : label is "1'b0";
  attribute FRAMELOCK_MODE : string;
  attribute FRAMELOCK_MODE of inst : label is "1'b0";
  attribute HAS_DEST_ADDR : string;
  attribute HAS_DEST_ADDR of inst : label is "1'b1";
  attribute HAS_SRC_ADDR : string;
  attribute HAS_SRC_ADDR of inst : label is "1'b0";
  attribute ID : integer;
  attribute ID of inst : label is 0;
  attribute ID_WIDTH : integer;
  attribute ID_WIDTH of inst : label is 4;
  attribute MAX_BYTES_PER_BURST : integer;
  attribute MAX_BYTES_PER_BURST of inst : label is 128;
  attribute MAX_NUM_FRAMES_WIDTH : integer;
  attribute MAX_NUM_FRAMES_WIDTH of inst : label is 3;
  attribute REAL_MAX_BYTES_PER_BURST : integer;
  attribute REAL_MAX_BYTES_PER_BURST of inst : label is 128;
  attribute SYNC_TRANSFER_START : string;
  attribute SYNC_TRANSFER_START of inst : label is "1'b1";
  attribute USE_EXT_SYNC : string;
  attribute USE_EXT_SYNC of inst : label is "1'b0";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of fifo_wr_clk : signal is "xilinx.com:signal:clock:1.0 fifo_wr_clk CLK, xilinx.com:signal:clock:1.0 fifo_wr_signal_clock CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of fifo_wr_clk : signal is "slave fifo_wr_signal_clock";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of fifo_wr_clk : signal is "XIL_INTERFACENAME fifo_wr_signal_clock, ASSOCIATED_BUSIF fifo_wr, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of fifo_wr_en : signal is "analog.com:interface:fifo_wr:1.0 fifo_wr EN";
  attribute X_INTERFACE_MODE of fifo_wr_en : signal is "slave";
  attribute X_INTERFACE_INFO of fifo_wr_overflow : signal is "analog.com:interface:fifo_wr:1.0 fifo_wr OVERFLOW";
  attribute X_INTERFACE_INFO of fifo_wr_xfer_req : signal is "analog.com:interface:fifo_wr:1.0 fifo_wr XFER_REQ";
  attribute X_INTERFACE_INFO of irq : signal is "xilinx.com:signal:interrupt:1.0 irq INTERRUPT";
  attribute X_INTERFACE_MODE of irq : signal is "master";
  attribute X_INTERFACE_PARAMETER of irq : signal is "XIL_INTERFACENAME irq, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of m_dest_axi_aclk : signal is "xilinx.com:signal:clock:1.0 m_dest_axi_aclk CLK";
  attribute X_INTERFACE_MODE of m_dest_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of m_dest_axi_aclk : signal is "XIL_INTERFACENAME m_dest_axi_aclk, ASSOCIATED_BUSIF m_dest_axi, ASSOCIATED_RESET m_dest_axi_aresetn, FREQ_HZ 249997498, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_dest_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 m_dest_axi_aresetn RST";
  attribute X_INTERFACE_MODE of m_dest_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of m_dest_axi_aresetn : signal is "XIL_INTERFACENAME m_dest_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_dest_axi_awready : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWREADY";
  attribute X_INTERFACE_INFO of m_dest_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWVALID";
  attribute X_INTERFACE_INFO of m_dest_axi_bready : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi BREADY";
  attribute X_INTERFACE_INFO of m_dest_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi BVALID";
  attribute X_INTERFACE_INFO of m_dest_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi WLAST";
  attribute X_INTERFACE_INFO of m_dest_axi_wready : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi WREADY";
  attribute X_INTERFACE_INFO of m_dest_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi WVALID";
  attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute X_INTERFACE_MODE of s_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute X_INTERFACE_MODE of s_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi AWVALID";
  attribute X_INTERFACE_MODE of s_axi_awvalid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awvalid : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 11, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi RREADY";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi WVALID";
  attribute X_INTERFACE_INFO of fifo_wr_din : signal is "analog.com:interface:fifo_wr:1.0 fifo_wr DATA";
  attribute X_INTERFACE_INFO of m_dest_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWADDR";
  attribute X_INTERFACE_MODE of m_dest_axi_awaddr : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_dest_axi_awaddr : signal is "XIL_INTERFACENAME m_dest_axi, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 249997498, ID_WIDTH 0, ADDR_WIDTH 31, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, NUM_READ_OUTSTANDING 0, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_dest_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWBURST";
  attribute X_INTERFACE_INFO of m_dest_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWCACHE";
  attribute X_INTERFACE_INFO of m_dest_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWLEN";
  attribute X_INTERFACE_INFO of m_dest_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWPROT";
  attribute X_INTERFACE_INFO of m_dest_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi AWSIZE";
  attribute X_INTERFACE_INFO of m_dest_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi BRESP";
  attribute X_INTERFACE_INFO of m_dest_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi WDATA";
  attribute X_INTERFACE_INFO of m_dest_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_dest_axi WSTRB";
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
  m_dest_axi_awaddr(30 downto 3) <= \^m_dest_axi_awaddr\(30 downto 3);
  m_dest_axi_awaddr(2) <= \<const0>\;
  m_dest_axi_awaddr(1) <= \<const0>\;
  m_dest_axi_awaddr(0) <= \<const0>\;
  m_dest_axi_awburst(1) <= \<const0>\;
  m_dest_axi_awburst(0) <= \<const1>\;
  m_dest_axi_awcache(3) <= \<const1>\;
  m_dest_axi_awcache(2) <= \<const1>\;
  m_dest_axi_awcache(1) <= \<const1>\;
  m_dest_axi_awcache(0) <= \<const1>\;
  m_dest_axi_awlen(7) <= \<const0>\;
  m_dest_axi_awlen(6) <= \<const0>\;
  m_dest_axi_awlen(5) <= \<const0>\;
  m_dest_axi_awlen(4) <= \<const0>\;
  m_dest_axi_awlen(3 downto 0) <= \^m_dest_axi_awlen\(3 downto 0);
  m_dest_axi_awprot(2) <= \<const0>\;
  m_dest_axi_awprot(1) <= \<const1>\;
  m_dest_axi_awprot(0) <= \<const0>\;
  m_dest_axi_awsize(2) <= \<const0>\;
  m_dest_axi_awsize(1) <= \<const1>\;
  m_dest_axi_awsize(0) <= \<const1>\;
  m_dest_axi_wstrb(7) <= \<const1>\;
  m_dest_axi_wstrb(6) <= \<const1>\;
  m_dest_axi_wstrb(5) <= \<const1>\;
  m_dest_axi_wstrb(4) <= \<const1>\;
  m_dest_axi_wstrb(3) <= \<const1>\;
  m_dest_axi_wstrb(2) <= \<const1>\;
  m_dest_axi_wstrb(1) <= \<const1>\;
  m_dest_axi_wstrb(0) <= \<const1>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.system_axi_adrv9001_rx1_dma_0_axi_dmac
     port map (
      dest_diag_level_bursts(7 downto 0) => NLW_inst_dest_diag_level_bursts_UNCONNECTED(7 downto 0),
      dest_ext_sync => '0',
      fifo_rd_clk => '0',
      fifo_rd_dout(63 downto 0) => NLW_inst_fifo_rd_dout_UNCONNECTED(63 downto 0),
      fifo_rd_en => '0',
      fifo_rd_underflow => NLW_inst_fifo_rd_underflow_UNCONNECTED,
      fifo_rd_valid => NLW_inst_fifo_rd_valid_UNCONNECTED,
      fifo_rd_xfer_req => NLW_inst_fifo_rd_xfer_req_UNCONNECTED,
      fifo_wr_clk => fifo_wr_clk,
      fifo_wr_din(63 downto 0) => fifo_wr_din(63 downto 0),
      fifo_wr_en => fifo_wr_en,
      fifo_wr_overflow => fifo_wr_overflow,
      fifo_wr_xfer_req => fifo_wr_xfer_req,
      irq => irq,
      m_axis_aclk => '0',
      m_axis_data(63 downto 0) => NLW_inst_m_axis_data_UNCONNECTED(63 downto 0),
      m_axis_dest(3 downto 0) => NLW_inst_m_axis_dest_UNCONNECTED(3 downto 0),
      m_axis_id(7 downto 0) => NLW_inst_m_axis_id_UNCONNECTED(7 downto 0),
      m_axis_keep(7 downto 0) => NLW_inst_m_axis_keep_UNCONNECTED(7 downto 0),
      m_axis_last => NLW_inst_m_axis_last_UNCONNECTED,
      m_axis_ready => '0',
      m_axis_strb(7 downto 0) => NLW_inst_m_axis_strb_UNCONNECTED(7 downto 0),
      m_axis_user(0) => NLW_inst_m_axis_user_UNCONNECTED(0),
      m_axis_valid => NLW_inst_m_axis_valid_UNCONNECTED,
      m_axis_xfer_req => NLW_inst_m_axis_xfer_req_UNCONNECTED,
      m_dest_axi_aclk => m_dest_axi_aclk,
      m_dest_axi_araddr(30 downto 0) => NLW_inst_m_dest_axi_araddr_UNCONNECTED(30 downto 0),
      m_dest_axi_arburst(1 downto 0) => NLW_inst_m_dest_axi_arburst_UNCONNECTED(1 downto 0),
      m_dest_axi_arcache(3 downto 0) => NLW_inst_m_dest_axi_arcache_UNCONNECTED(3 downto 0),
      m_dest_axi_aresetn => '0',
      m_dest_axi_arid(0) => NLW_inst_m_dest_axi_arid_UNCONNECTED(0),
      m_dest_axi_arlen(7 downto 0) => NLW_inst_m_dest_axi_arlen_UNCONNECTED(7 downto 0),
      m_dest_axi_arlock(0) => NLW_inst_m_dest_axi_arlock_UNCONNECTED(0),
      m_dest_axi_arprot(2 downto 0) => NLW_inst_m_dest_axi_arprot_UNCONNECTED(2 downto 0),
      m_dest_axi_arready => '0',
      m_dest_axi_arsize(2 downto 0) => NLW_inst_m_dest_axi_arsize_UNCONNECTED(2 downto 0),
      m_dest_axi_arvalid => NLW_inst_m_dest_axi_arvalid_UNCONNECTED,
      m_dest_axi_awaddr(30 downto 3) => \^m_dest_axi_awaddr\(30 downto 3),
      m_dest_axi_awaddr(2 downto 0) => NLW_inst_m_dest_axi_awaddr_UNCONNECTED(2 downto 0),
      m_dest_axi_awburst(1 downto 0) => NLW_inst_m_dest_axi_awburst_UNCONNECTED(1 downto 0),
      m_dest_axi_awcache(3 downto 0) => NLW_inst_m_dest_axi_awcache_UNCONNECTED(3 downto 0),
      m_dest_axi_awid(0) => NLW_inst_m_dest_axi_awid_UNCONNECTED(0),
      m_dest_axi_awlen(7 downto 4) => NLW_inst_m_dest_axi_awlen_UNCONNECTED(7 downto 4),
      m_dest_axi_awlen(3 downto 0) => \^m_dest_axi_awlen\(3 downto 0),
      m_dest_axi_awlock(0) => NLW_inst_m_dest_axi_awlock_UNCONNECTED(0),
      m_dest_axi_awprot(2 downto 0) => NLW_inst_m_dest_axi_awprot_UNCONNECTED(2 downto 0),
      m_dest_axi_awready => m_dest_axi_awready,
      m_dest_axi_awsize(2 downto 0) => NLW_inst_m_dest_axi_awsize_UNCONNECTED(2 downto 0),
      m_dest_axi_awvalid => m_dest_axi_awvalid,
      m_dest_axi_bid(0) => '0',
      m_dest_axi_bready => m_dest_axi_bready,
      m_dest_axi_bresp(1 downto 0) => B"00",
      m_dest_axi_bvalid => m_dest_axi_bvalid,
      m_dest_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_dest_axi_rid(0) => '0',
      m_dest_axi_rlast => '0',
      m_dest_axi_rready => NLW_inst_m_dest_axi_rready_UNCONNECTED,
      m_dest_axi_rresp(1 downto 0) => B"00",
      m_dest_axi_rvalid => '0',
      m_dest_axi_wdata(63 downto 0) => m_dest_axi_wdata(63 downto 0),
      m_dest_axi_wid(0) => NLW_inst_m_dest_axi_wid_UNCONNECTED(0),
      m_dest_axi_wlast => m_dest_axi_wlast,
      m_dest_axi_wready => m_dest_axi_wready,
      m_dest_axi_wstrb(7 downto 0) => NLW_inst_m_dest_axi_wstrb_UNCONNECTED(7 downto 0),
      m_dest_axi_wvalid => m_dest_axi_wvalid,
      m_frame_in(2 downto 0) => B"000",
      m_frame_in_valid => '0',
      m_frame_out(2 downto 0) => NLW_inst_m_frame_out_UNCONNECTED(2 downto 0),
      m_frame_out_valid => NLW_inst_m_frame_out_valid_UNCONNECTED,
      m_sg_axi_aclk => '0',
      m_sg_axi_araddr(30 downto 0) => NLW_inst_m_sg_axi_araddr_UNCONNECTED(30 downto 0),
      m_sg_axi_arburst(1 downto 0) => NLW_inst_m_sg_axi_arburst_UNCONNECTED(1 downto 0),
      m_sg_axi_arcache(3 downto 0) => NLW_inst_m_sg_axi_arcache_UNCONNECTED(3 downto 0),
      m_sg_axi_aresetn => '0',
      m_sg_axi_arid(0) => NLW_inst_m_sg_axi_arid_UNCONNECTED(0),
      m_sg_axi_arlen(7 downto 0) => NLW_inst_m_sg_axi_arlen_UNCONNECTED(7 downto 0),
      m_sg_axi_arlock(0) => NLW_inst_m_sg_axi_arlock_UNCONNECTED(0),
      m_sg_axi_arprot(2 downto 0) => NLW_inst_m_sg_axi_arprot_UNCONNECTED(2 downto 0),
      m_sg_axi_arready => '0',
      m_sg_axi_arsize(2 downto 0) => NLW_inst_m_sg_axi_arsize_UNCONNECTED(2 downto 0),
      m_sg_axi_arvalid => NLW_inst_m_sg_axi_arvalid_UNCONNECTED,
      m_sg_axi_awaddr(30 downto 0) => NLW_inst_m_sg_axi_awaddr_UNCONNECTED(30 downto 0),
      m_sg_axi_awburst(1 downto 0) => NLW_inst_m_sg_axi_awburst_UNCONNECTED(1 downto 0),
      m_sg_axi_awcache(3 downto 0) => NLW_inst_m_sg_axi_awcache_UNCONNECTED(3 downto 0),
      m_sg_axi_awid(0) => NLW_inst_m_sg_axi_awid_UNCONNECTED(0),
      m_sg_axi_awlen(7 downto 0) => NLW_inst_m_sg_axi_awlen_UNCONNECTED(7 downto 0),
      m_sg_axi_awlock(0) => NLW_inst_m_sg_axi_awlock_UNCONNECTED(0),
      m_sg_axi_awprot(2 downto 0) => NLW_inst_m_sg_axi_awprot_UNCONNECTED(2 downto 0),
      m_sg_axi_awready => '0',
      m_sg_axi_awsize(2 downto 0) => NLW_inst_m_sg_axi_awsize_UNCONNECTED(2 downto 0),
      m_sg_axi_awvalid => NLW_inst_m_sg_axi_awvalid_UNCONNECTED,
      m_sg_axi_bid(0) => '0',
      m_sg_axi_bready => NLW_inst_m_sg_axi_bready_UNCONNECTED,
      m_sg_axi_bresp(1 downto 0) => B"00",
      m_sg_axi_bvalid => '0',
      m_sg_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_sg_axi_rid(0) => '0',
      m_sg_axi_rlast => '0',
      m_sg_axi_rready => NLW_inst_m_sg_axi_rready_UNCONNECTED,
      m_sg_axi_rresp(1 downto 0) => B"00",
      m_sg_axi_rvalid => '0',
      m_sg_axi_wdata(63 downto 0) => NLW_inst_m_sg_axi_wdata_UNCONNECTED(63 downto 0),
      m_sg_axi_wid(0) => NLW_inst_m_sg_axi_wid_UNCONNECTED(0),
      m_sg_axi_wlast => NLW_inst_m_sg_axi_wlast_UNCONNECTED,
      m_sg_axi_wready => '0',
      m_sg_axi_wstrb(7 downto 0) => NLW_inst_m_sg_axi_wstrb_UNCONNECTED(7 downto 0),
      m_sg_axi_wvalid => NLW_inst_m_sg_axi_wvalid_UNCONNECTED,
      m_src_axi_aclk => '0',
      m_src_axi_araddr(30 downto 0) => NLW_inst_m_src_axi_araddr_UNCONNECTED(30 downto 0),
      m_src_axi_arburst(1 downto 0) => NLW_inst_m_src_axi_arburst_UNCONNECTED(1 downto 0),
      m_src_axi_arcache(3 downto 0) => NLW_inst_m_src_axi_arcache_UNCONNECTED(3 downto 0),
      m_src_axi_aresetn => '0',
      m_src_axi_arid(0) => NLW_inst_m_src_axi_arid_UNCONNECTED(0),
      m_src_axi_arlen(7 downto 0) => NLW_inst_m_src_axi_arlen_UNCONNECTED(7 downto 0),
      m_src_axi_arlock(0) => NLW_inst_m_src_axi_arlock_UNCONNECTED(0),
      m_src_axi_arprot(2 downto 0) => NLW_inst_m_src_axi_arprot_UNCONNECTED(2 downto 0),
      m_src_axi_arready => '0',
      m_src_axi_arsize(2 downto 0) => NLW_inst_m_src_axi_arsize_UNCONNECTED(2 downto 0),
      m_src_axi_arvalid => NLW_inst_m_src_axi_arvalid_UNCONNECTED,
      m_src_axi_awaddr(30 downto 0) => NLW_inst_m_src_axi_awaddr_UNCONNECTED(30 downto 0),
      m_src_axi_awburst(1 downto 0) => NLW_inst_m_src_axi_awburst_UNCONNECTED(1 downto 0),
      m_src_axi_awcache(3 downto 0) => NLW_inst_m_src_axi_awcache_UNCONNECTED(3 downto 0),
      m_src_axi_awid(0) => NLW_inst_m_src_axi_awid_UNCONNECTED(0),
      m_src_axi_awlen(7 downto 0) => NLW_inst_m_src_axi_awlen_UNCONNECTED(7 downto 0),
      m_src_axi_awlock(0) => NLW_inst_m_src_axi_awlock_UNCONNECTED(0),
      m_src_axi_awprot(2 downto 0) => NLW_inst_m_src_axi_awprot_UNCONNECTED(2 downto 0),
      m_src_axi_awready => '0',
      m_src_axi_awsize(2 downto 0) => NLW_inst_m_src_axi_awsize_UNCONNECTED(2 downto 0),
      m_src_axi_awvalid => NLW_inst_m_src_axi_awvalid_UNCONNECTED,
      m_src_axi_bid(0) => '0',
      m_src_axi_bready => NLW_inst_m_src_axi_bready_UNCONNECTED,
      m_src_axi_bresp(1 downto 0) => B"00",
      m_src_axi_bvalid => '0',
      m_src_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_src_axi_rid(0) => '0',
      m_src_axi_rlast => '0',
      m_src_axi_rready => NLW_inst_m_src_axi_rready_UNCONNECTED,
      m_src_axi_rresp(1 downto 0) => B"00",
      m_src_axi_rvalid => '0',
      m_src_axi_wdata(63 downto 0) => NLW_inst_m_src_axi_wdata_UNCONNECTED(63 downto 0),
      m_src_axi_wid(0) => NLW_inst_m_src_axi_wid_UNCONNECTED(0),
      m_src_axi_wlast => NLW_inst_m_src_axi_wlast_UNCONNECTED,
      m_src_axi_wready => '0',
      m_src_axi_wstrb(7 downto 0) => NLW_inst_m_src_axi_wstrb_UNCONNECTED(7 downto 0),
      m_src_axi_wvalid => NLW_inst_m_src_axi_wvalid_UNCONNECTED,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(10 downto 2) => s_axi_araddr(10 downto 2),
      s_axi_araddr(1 downto 0) => B"00",
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(10 downto 2) => s_axi_awaddr(10 downto 2),
      s_axi_awaddr(1 downto 0) => B"00",
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => NLW_inst_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => NLW_inst_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => B"0000",
      s_axi_wvalid => s_axi_wvalid,
      s_axis_aclk => '0',
      s_axis_data(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_dest(3 downto 0) => B"0000",
      s_axis_id(7 downto 0) => B"00000000",
      s_axis_keep(7 downto 0) => B"00000000",
      s_axis_last => '0',
      s_axis_ready => NLW_inst_s_axis_ready_UNCONNECTED,
      s_axis_strb(7 downto 0) => B"00000000",
      s_axis_user(0) => '1',
      s_axis_valid => '0',
      s_axis_xfer_req => NLW_inst_s_axis_xfer_req_UNCONNECTED,
      s_frame_in(2 downto 0) => B"000",
      s_frame_in_valid => '0',
      s_frame_out(2 downto 0) => NLW_inst_s_frame_out_UNCONNECTED(2 downto 0),
      s_frame_out_valid => NLW_inst_s_frame_out_valid_UNCONNECTED,
      src_ext_sync => '0',
      sync => sync
    );
end STRUCTURE;
