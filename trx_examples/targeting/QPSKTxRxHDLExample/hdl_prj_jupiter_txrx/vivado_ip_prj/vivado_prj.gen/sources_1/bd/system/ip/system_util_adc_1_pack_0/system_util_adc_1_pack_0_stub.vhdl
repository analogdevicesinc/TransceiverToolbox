-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:18:07 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_util_adc_1_pack_0/system_util_adc_1_pack_0_stub.vhdl
-- Design      : system_util_adc_1_pack_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_util_adc_1_pack_0 is
  Port ( 
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_util_adc_1_pack_0 : entity is "system_util_adc_1_pack_0,util_cpack2,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_util_adc_1_pack_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_util_adc_1_pack_0 : entity is "package_project";
end system_util_adc_1_pack_0;

architecture stub of system_util_adc_1_pack_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,reset,enable_0,enable_1,enable_2,enable_3,fifo_wr_en,fifo_wr_overflow,fifo_wr_data_0[15:0],fifo_wr_data_1[15:0],fifo_wr_data_2[15:0],fifo_wr_data_3[15:0],packed_fifo_wr_en,packed_fifo_wr_overflow,packed_fifo_wr_data[63:0],packed_sync";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 packed_fifo_wr_signal_clock CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME packed_fifo_wr_signal_clock, ASSOCIATED_BUSIF packed_fifo_wr, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 packed_fifo_wr_signal_reset RST";
  attribute X_INTERFACE_MODE of reset : signal is "slave";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME packed_fifo_wr_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of packed_fifo_wr_en : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr EN";
  attribute X_INTERFACE_MODE of packed_fifo_wr_en : signal is "master";
  attribute X_INTERFACE_INFO of packed_fifo_wr_overflow : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr OVERFLOW";
  attribute X_INTERFACE_INFO of packed_fifo_wr_data : signal is "analog.com:interface:fifo_wr:1.0 packed_fifo_wr DATA";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "util_cpack2,Vivado 2025.1";
begin
end;
