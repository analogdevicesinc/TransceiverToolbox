-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:44:20 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_sync_slow_to_fast_0/system_sync_slow_to_fast_0_sim_netlist.vhdl
-- Design      : system_sync_slow_to_fast_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_sync_slow_to_fast_0_sync_slow_to_fast is
  port (
    out_data : out STD_LOGIC_VECTOR ( 64 downto 0 );
    in_clk : in STD_LOGIC;
    out_clk : in STD_LOGIC;
    in_resetn : in STD_LOGIC;
    in_data : in STD_LOGIC_VECTOR ( 64 downto 0 );
    out_resetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_sync_slow_to_fast_0_sync_slow_to_fast : entity is "sync_slow_to_fast";
end system_sync_slow_to_fast_0_sync_slow_to_fast;

architecture STRUCTURE of system_sync_slow_to_fast_0_sync_slow_to_fast is
  signal cdc_sync_stage0_tick : STD_LOGIC;
  signal cdc_sync_stage1_tick : STD_LOGIC;
  signal cdc_sync_stage2_tick : STD_LOGIC;
  signal cdc_sync_stage3_tick : STD_LOGIC;
  signal out_data0 : STD_LOGIC_VECTOR ( 64 downto 0 );
  signal \out_data[64]_i_1_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal rd_addr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \rd_addr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[2]_i_2_n_0\ : STD_LOGIC;
  signal wr_addr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \wr_addr[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr[2]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr[2]_i_2_n_0\ : STD_LOGIC;
  signal NLW_fifo_reg_0_7_0_13_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_14_27_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_28_41_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_42_55_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_56_64_DOE_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_fifo_reg_0_7_56_64_DOF_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_56_64_DOG_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_reg_0_7_56_64_DOH_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of fifo_reg_0_7_0_13 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of fifo_reg_0_7_0_13 : label is 390;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of fifo_reg_0_7_0_13 : label is "system_sync_slow_to_fast_0/inst/fifo_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of fifo_reg_0_7_0_13 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of fifo_reg_0_7_0_13 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of fifo_reg_0_7_0_13 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of fifo_reg_0_7_0_13 : label is 5;
  attribute ram_offset : integer;
  attribute ram_offset of fifo_reg_0_7_0_13 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of fifo_reg_0_7_0_13 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of fifo_reg_0_7_0_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of fifo_reg_0_7_14_27 : label is "";
  attribute RTL_RAM_BITS of fifo_reg_0_7_14_27 : label is 390;
  attribute RTL_RAM_NAME of fifo_reg_0_7_14_27 : label is "system_sync_slow_to_fast_0/inst/fifo_reg";
  attribute RTL_RAM_STYLE of fifo_reg_0_7_14_27 : label is "auto";
  attribute RTL_RAM_TYPE of fifo_reg_0_7_14_27 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_reg_0_7_14_27 : label is 0;
  attribute ram_addr_end of fifo_reg_0_7_14_27 : label is 5;
  attribute ram_offset of fifo_reg_0_7_14_27 : label is 0;
  attribute ram_slice_begin of fifo_reg_0_7_14_27 : label is 14;
  attribute ram_slice_end of fifo_reg_0_7_14_27 : label is 27;
  attribute METHODOLOGY_DRC_VIOS of fifo_reg_0_7_28_41 : label is "";
  attribute RTL_RAM_BITS of fifo_reg_0_7_28_41 : label is 390;
  attribute RTL_RAM_NAME of fifo_reg_0_7_28_41 : label is "system_sync_slow_to_fast_0/inst/fifo_reg";
  attribute RTL_RAM_STYLE of fifo_reg_0_7_28_41 : label is "auto";
  attribute RTL_RAM_TYPE of fifo_reg_0_7_28_41 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_reg_0_7_28_41 : label is 0;
  attribute ram_addr_end of fifo_reg_0_7_28_41 : label is 5;
  attribute ram_offset of fifo_reg_0_7_28_41 : label is 0;
  attribute ram_slice_begin of fifo_reg_0_7_28_41 : label is 28;
  attribute ram_slice_end of fifo_reg_0_7_28_41 : label is 41;
  attribute METHODOLOGY_DRC_VIOS of fifo_reg_0_7_42_55 : label is "";
  attribute RTL_RAM_BITS of fifo_reg_0_7_42_55 : label is 390;
  attribute RTL_RAM_NAME of fifo_reg_0_7_42_55 : label is "system_sync_slow_to_fast_0/inst/fifo_reg";
  attribute RTL_RAM_STYLE of fifo_reg_0_7_42_55 : label is "auto";
  attribute RTL_RAM_TYPE of fifo_reg_0_7_42_55 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_reg_0_7_42_55 : label is 0;
  attribute ram_addr_end of fifo_reg_0_7_42_55 : label is 5;
  attribute ram_offset of fifo_reg_0_7_42_55 : label is 0;
  attribute ram_slice_begin of fifo_reg_0_7_42_55 : label is 42;
  attribute ram_slice_end of fifo_reg_0_7_42_55 : label is 55;
  attribute METHODOLOGY_DRC_VIOS of fifo_reg_0_7_56_64 : label is "";
  attribute RTL_RAM_BITS of fifo_reg_0_7_56_64 : label is 390;
  attribute RTL_RAM_NAME of fifo_reg_0_7_56_64 : label is "system_sync_slow_to_fast_0/inst/fifo_reg";
  attribute RTL_RAM_STYLE of fifo_reg_0_7_56_64 : label is "auto";
  attribute RTL_RAM_TYPE of fifo_reg_0_7_56_64 : label is "RAM_SDP";
  attribute ram_addr_begin of fifo_reg_0_7_56_64 : label is 0;
  attribute ram_addr_end of fifo_reg_0_7_56_64 : label is 5;
  attribute ram_offset of fifo_reg_0_7_56_64 : label is 0;
  attribute ram_slice_begin of fifo_reg_0_7_56_64 : label is 56;
  attribute ram_slice_end of fifo_reg_0_7_56_64 : label is 64;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_addr[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rd_addr[2]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_addr[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_addr[2]_i_2\ : label is "soft_lutpair0";
begin
cdc_sync_stage0_tick_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cdc_sync_stage0_tick,
      O => p_1_in
    );
cdc_sync_stage0_tick_reg: unisim.vcomponents.FDRE
     port map (
      C => in_clk,
      CE => '1',
      D => p_1_in,
      Q => cdc_sync_stage0_tick,
      R => \wr_addr[2]_i_1_n_0\
    );
cdc_sync_stage1_tick_reg: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => '1',
      D => cdc_sync_stage0_tick,
      Q => cdc_sync_stage1_tick,
      R => \rd_addr[2]_i_1_n_0\
    );
cdc_sync_stage2_tick_reg: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => '1',
      D => cdc_sync_stage1_tick,
      Q => cdc_sync_stage2_tick,
      R => \rd_addr[2]_i_1_n_0\
    );
cdc_sync_stage3_tick_reg: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => '1',
      D => cdc_sync_stage2_tick,
      Q => cdc_sync_stage3_tick,
      R => \rd_addr[2]_i_1_n_0\
    );
fifo_reg_0_7_0_13: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => rd_addr(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => rd_addr(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => rd_addr(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => rd_addr(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => wr_addr(2 downto 0),
      DIA(1 downto 0) => in_data(1 downto 0),
      DIB(1 downto 0) => in_data(3 downto 2),
      DIC(1 downto 0) => in_data(5 downto 4),
      DID(1 downto 0) => in_data(7 downto 6),
      DIE(1 downto 0) => in_data(9 downto 8),
      DIF(1 downto 0) => in_data(11 downto 10),
      DIG(1 downto 0) => in_data(13 downto 12),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data0(1 downto 0),
      DOB(1 downto 0) => out_data0(3 downto 2),
      DOC(1 downto 0) => out_data0(5 downto 4),
      DOD(1 downto 0) => out_data0(7 downto 6),
      DOE(1 downto 0) => out_data0(9 downto 8),
      DOF(1 downto 0) => out_data0(11 downto 10),
      DOG(1 downto 0) => out_data0(13 downto 12),
      DOH(1 downto 0) => NLW_fifo_reg_0_7_0_13_DOH_UNCONNECTED(1 downto 0),
      WCLK => in_clk,
      WE => in_resetn
    );
fifo_reg_0_7_14_27: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => rd_addr(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => rd_addr(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => rd_addr(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => rd_addr(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => wr_addr(2 downto 0),
      DIA(1 downto 0) => in_data(15 downto 14),
      DIB(1 downto 0) => in_data(17 downto 16),
      DIC(1 downto 0) => in_data(19 downto 18),
      DID(1 downto 0) => in_data(21 downto 20),
      DIE(1 downto 0) => in_data(23 downto 22),
      DIF(1 downto 0) => in_data(25 downto 24),
      DIG(1 downto 0) => in_data(27 downto 26),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data0(15 downto 14),
      DOB(1 downto 0) => out_data0(17 downto 16),
      DOC(1 downto 0) => out_data0(19 downto 18),
      DOD(1 downto 0) => out_data0(21 downto 20),
      DOE(1 downto 0) => out_data0(23 downto 22),
      DOF(1 downto 0) => out_data0(25 downto 24),
      DOG(1 downto 0) => out_data0(27 downto 26),
      DOH(1 downto 0) => NLW_fifo_reg_0_7_14_27_DOH_UNCONNECTED(1 downto 0),
      WCLK => in_clk,
      WE => in_resetn
    );
fifo_reg_0_7_28_41: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => rd_addr(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => rd_addr(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => rd_addr(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => rd_addr(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => wr_addr(2 downto 0),
      DIA(1 downto 0) => in_data(29 downto 28),
      DIB(1 downto 0) => in_data(31 downto 30),
      DIC(1 downto 0) => in_data(33 downto 32),
      DID(1 downto 0) => in_data(35 downto 34),
      DIE(1 downto 0) => in_data(37 downto 36),
      DIF(1 downto 0) => in_data(39 downto 38),
      DIG(1 downto 0) => in_data(41 downto 40),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data0(29 downto 28),
      DOB(1 downto 0) => out_data0(31 downto 30),
      DOC(1 downto 0) => out_data0(33 downto 32),
      DOD(1 downto 0) => out_data0(35 downto 34),
      DOE(1 downto 0) => out_data0(37 downto 36),
      DOF(1 downto 0) => out_data0(39 downto 38),
      DOG(1 downto 0) => out_data0(41 downto 40),
      DOH(1 downto 0) => NLW_fifo_reg_0_7_28_41_DOH_UNCONNECTED(1 downto 0),
      WCLK => in_clk,
      WE => in_resetn
    );
fifo_reg_0_7_42_55: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => rd_addr(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => rd_addr(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => rd_addr(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => rd_addr(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => wr_addr(2 downto 0),
      DIA(1 downto 0) => in_data(43 downto 42),
      DIB(1 downto 0) => in_data(45 downto 44),
      DIC(1 downto 0) => in_data(47 downto 46),
      DID(1 downto 0) => in_data(49 downto 48),
      DIE(1 downto 0) => in_data(51 downto 50),
      DIF(1 downto 0) => in_data(53 downto 52),
      DIG(1 downto 0) => in_data(55 downto 54),
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data0(43 downto 42),
      DOB(1 downto 0) => out_data0(45 downto 44),
      DOC(1 downto 0) => out_data0(47 downto 46),
      DOD(1 downto 0) => out_data0(49 downto 48),
      DOE(1 downto 0) => out_data0(51 downto 50),
      DOF(1 downto 0) => out_data0(53 downto 52),
      DOG(1 downto 0) => out_data0(55 downto 54),
      DOH(1 downto 0) => NLW_fifo_reg_0_7_42_55_DOH_UNCONNECTED(1 downto 0),
      WCLK => in_clk,
      WE => in_resetn
    );
fifo_reg_0_7_56_64: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 0) => rd_addr(2 downto 0),
      ADDRE(4 downto 3) => B"00",
      ADDRE(2 downto 0) => rd_addr(2 downto 0),
      ADDRF(4 downto 3) => B"00",
      ADDRF(2 downto 0) => rd_addr(2 downto 0),
      ADDRG(4 downto 3) => B"00",
      ADDRG(2 downto 0) => rd_addr(2 downto 0),
      ADDRH(4 downto 3) => B"00",
      ADDRH(2 downto 0) => wr_addr(2 downto 0),
      DIA(1 downto 0) => in_data(57 downto 56),
      DIB(1 downto 0) => in_data(59 downto 58),
      DIC(1 downto 0) => in_data(61 downto 60),
      DID(1 downto 0) => in_data(63 downto 62),
      DIE(1) => '0',
      DIE(0) => in_data(64),
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data0(57 downto 56),
      DOB(1 downto 0) => out_data0(59 downto 58),
      DOC(1 downto 0) => out_data0(61 downto 60),
      DOD(1 downto 0) => out_data0(63 downto 62),
      DOE(1) => NLW_fifo_reg_0_7_56_64_DOE_UNCONNECTED(1),
      DOE(0) => out_data0(64),
      DOF(1 downto 0) => NLW_fifo_reg_0_7_56_64_DOF_UNCONNECTED(1 downto 0),
      DOG(1 downto 0) => NLW_fifo_reg_0_7_56_64_DOG_UNCONNECTED(1 downto 0),
      DOH(1 downto 0) => NLW_fifo_reg_0_7_56_64_DOH_UNCONNECTED(1 downto 0),
      WCLK => in_clk,
      WE => in_resetn
    );
\out_data[64]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cdc_sync_stage3_tick,
      I1 => cdc_sync_stage2_tick,
      O => \out_data[64]_i_1_n_0\
    );
\out_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(0),
      Q => out_data(0),
      R => '0'
    );
\out_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(10),
      Q => out_data(10),
      R => '0'
    );
\out_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(11),
      Q => out_data(11),
      R => '0'
    );
\out_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(12),
      Q => out_data(12),
      R => '0'
    );
\out_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(13),
      Q => out_data(13),
      R => '0'
    );
\out_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(14),
      Q => out_data(14),
      R => '0'
    );
\out_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(15),
      Q => out_data(15),
      R => '0'
    );
\out_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(16),
      Q => out_data(16),
      R => '0'
    );
\out_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(17),
      Q => out_data(17),
      R => '0'
    );
\out_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(18),
      Q => out_data(18),
      R => '0'
    );
\out_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(19),
      Q => out_data(19),
      R => '0'
    );
\out_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(1),
      Q => out_data(1),
      R => '0'
    );
\out_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(20),
      Q => out_data(20),
      R => '0'
    );
\out_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(21),
      Q => out_data(21),
      R => '0'
    );
\out_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(22),
      Q => out_data(22),
      R => '0'
    );
\out_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(23),
      Q => out_data(23),
      R => '0'
    );
\out_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(24),
      Q => out_data(24),
      R => '0'
    );
\out_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(25),
      Q => out_data(25),
      R => '0'
    );
\out_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(26),
      Q => out_data(26),
      R => '0'
    );
\out_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(27),
      Q => out_data(27),
      R => '0'
    );
\out_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(28),
      Q => out_data(28),
      R => '0'
    );
\out_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(29),
      Q => out_data(29),
      R => '0'
    );
\out_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(2),
      Q => out_data(2),
      R => '0'
    );
\out_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(30),
      Q => out_data(30),
      R => '0'
    );
\out_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(31),
      Q => out_data(31),
      R => '0'
    );
\out_data_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(32),
      Q => out_data(32),
      R => '0'
    );
\out_data_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(33),
      Q => out_data(33),
      R => '0'
    );
\out_data_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(34),
      Q => out_data(34),
      R => '0'
    );
\out_data_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(35),
      Q => out_data(35),
      R => '0'
    );
\out_data_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(36),
      Q => out_data(36),
      R => '0'
    );
\out_data_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(37),
      Q => out_data(37),
      R => '0'
    );
\out_data_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(38),
      Q => out_data(38),
      R => '0'
    );
\out_data_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(39),
      Q => out_data(39),
      R => '0'
    );
\out_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(3),
      Q => out_data(3),
      R => '0'
    );
\out_data_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(40),
      Q => out_data(40),
      R => '0'
    );
\out_data_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(41),
      Q => out_data(41),
      R => '0'
    );
\out_data_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(42),
      Q => out_data(42),
      R => '0'
    );
\out_data_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(43),
      Q => out_data(43),
      R => '0'
    );
\out_data_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(44),
      Q => out_data(44),
      R => '0'
    );
\out_data_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(45),
      Q => out_data(45),
      R => '0'
    );
\out_data_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(46),
      Q => out_data(46),
      R => '0'
    );
\out_data_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(47),
      Q => out_data(47),
      R => '0'
    );
\out_data_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(48),
      Q => out_data(48),
      R => '0'
    );
\out_data_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(49),
      Q => out_data(49),
      R => '0'
    );
\out_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(4),
      Q => out_data(4),
      R => '0'
    );
\out_data_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(50),
      Q => out_data(50),
      R => '0'
    );
\out_data_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(51),
      Q => out_data(51),
      R => '0'
    );
\out_data_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(52),
      Q => out_data(52),
      R => '0'
    );
\out_data_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(53),
      Q => out_data(53),
      R => '0'
    );
\out_data_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(54),
      Q => out_data(54),
      R => '0'
    );
\out_data_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(55),
      Q => out_data(55),
      R => '0'
    );
\out_data_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(56),
      Q => out_data(56),
      R => '0'
    );
\out_data_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(57),
      Q => out_data(57),
      R => '0'
    );
\out_data_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(58),
      Q => out_data(58),
      R => '0'
    );
\out_data_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(59),
      Q => out_data(59),
      R => '0'
    );
\out_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(5),
      Q => out_data(5),
      R => '0'
    );
\out_data_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(60),
      Q => out_data(60),
      R => '0'
    );
\out_data_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(61),
      Q => out_data(61),
      R => '0'
    );
\out_data_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(62),
      Q => out_data(62),
      R => '0'
    );
\out_data_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(63),
      Q => out_data(63),
      R => '0'
    );
\out_data_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(64),
      Q => out_data(64),
      R => '0'
    );
\out_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(6),
      Q => out_data(6),
      R => '0'
    );
\out_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(7),
      Q => out_data(7),
      R => '0'
    );
\out_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(8),
      Q => out_data(8),
      R => '0'
    );
\out_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => out_data0(9),
      Q => out_data(9),
      R => '0'
    );
\rd_addr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_addr(0),
      O => \rd_addr[0]_i_1_n_0\
    );
\rd_addr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"94"
    )
        port map (
      I0 => rd_addr(2),
      I1 => rd_addr(0),
      I2 => rd_addr(1),
      O => \rd_addr[1]_i_1_n_0\
    );
\rd_addr[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => out_resetn,
      O => \rd_addr[2]_i_1_n_0\
    );
\rd_addr[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => rd_addr(2),
      I1 => rd_addr(1),
      I2 => rd_addr(0),
      O => \rd_addr[2]_i_2_n_0\
    );
\rd_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => \rd_addr[0]_i_1_n_0\,
      Q => rd_addr(0),
      R => \rd_addr[2]_i_1_n_0\
    );
\rd_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => \rd_addr[1]_i_1_n_0\,
      Q => rd_addr(1),
      R => \rd_addr[2]_i_1_n_0\
    );
\rd_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => out_clk,
      CE => \out_data[64]_i_1_n_0\,
      D => \rd_addr[2]_i_2_n_0\,
      Q => rd_addr(2),
      R => \rd_addr[2]_i_1_n_0\
    );
\wr_addr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_addr(0),
      O => \wr_addr[0]_i_1_n_0\
    );
\wr_addr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"94"
    )
        port map (
      I0 => wr_addr(2),
      I1 => wr_addr(0),
      I2 => wr_addr(1),
      O => \wr_addr[1]_i_1_n_0\
    );
\wr_addr[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => in_resetn,
      O => \wr_addr[2]_i_1_n_0\
    );
\wr_addr[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => wr_addr(2),
      I1 => wr_addr(1),
      I2 => wr_addr(0),
      O => \wr_addr[2]_i_2_n_0\
    );
\wr_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => in_clk,
      CE => '1',
      D => \wr_addr[0]_i_1_n_0\,
      Q => wr_addr(0),
      R => \wr_addr[2]_i_1_n_0\
    );
\wr_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => in_clk,
      CE => '1',
      D => \wr_addr[1]_i_1_n_0\,
      Q => wr_addr(1),
      R => \wr_addr[2]_i_1_n_0\
    );
\wr_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => in_clk,
      CE => '1',
      D => \wr_addr[2]_i_2_n_0\,
      Q => wr_addr(2),
      R => \wr_addr[2]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_sync_slow_to_fast_0 is
  port (
    in_data : in STD_LOGIC_VECTOR ( 64 downto 0 );
    in_resetn : in STD_LOGIC;
    in_clk : in STD_LOGIC;
    out_data : out STD_LOGIC_VECTOR ( 64 downto 0 );
    out_resetn : in STD_LOGIC;
    out_clk : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_sync_slow_to_fast_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_sync_slow_to_fast_0 : entity is "system_sync_slow_to_fast_0,sync_slow_to_fast,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_sync_slow_to_fast_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_sync_slow_to_fast_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_sync_slow_to_fast_0 : entity is "sync_slow_to_fast,Vivado 2025.1";
end system_sync_slow_to_fast_0;

architecture STRUCTURE of system_sync_slow_to_fast_0 is
begin
inst: entity work.system_sync_slow_to_fast_0_sync_slow_to_fast
     port map (
      in_clk => in_clk,
      in_data(64 downto 0) => in_data(64 downto 0),
      in_resetn => in_resetn,
      out_clk => out_clk,
      out_data(64 downto 0) => out_data(64 downto 0),
      out_resetn => out_resetn
    );
end STRUCTURE;
