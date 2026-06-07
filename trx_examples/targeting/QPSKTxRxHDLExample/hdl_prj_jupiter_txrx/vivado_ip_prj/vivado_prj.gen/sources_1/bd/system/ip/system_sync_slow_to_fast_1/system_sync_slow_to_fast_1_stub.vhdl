-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:44:18 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top system_sync_slow_to_fast_1 -prefix
--               system_sync_slow_to_fast_1_ system_sync_slow_to_fast_0_stub.vhdl
-- Design      : system_sync_slow_to_fast_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_sync_slow_to_fast_1 is
  Port ( 
    in_data : in STD_LOGIC_VECTOR ( 64 downto 0 );
    in_resetn : in STD_LOGIC;
    in_clk : in STD_LOGIC;
    out_data : out STD_LOGIC_VECTOR ( 64 downto 0 );
    out_resetn : in STD_LOGIC;
    out_clk : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_sync_slow_to_fast_1 : entity is "system_sync_slow_to_fast_0,sync_slow_to_fast,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_sync_slow_to_fast_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_sync_slow_to_fast_1 : entity is "package_project";
end system_sync_slow_to_fast_1;

architecture stub of system_sync_slow_to_fast_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "in_data[64:0],in_resetn,in_clk,out_data[64:0],out_resetn,out_clk";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "sync_slow_to_fast,Vivado 2025.1";
begin
end;
