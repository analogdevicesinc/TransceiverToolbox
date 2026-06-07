-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:39:27 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_Receiver_ip_0_0_stub.vhdl
-- Design      : system_Receiver_ip_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    IPCORE_CLK : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    dut_data_valid_in_rx : in STD_LOGIC;
    dut_data_in_0_rx : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dut_data_in_1_rx : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_ACLK : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    AXI4_Lite_AWADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_AWVALID : in STD_LOGIC;
    AXI4_Lite_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI4_Lite_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI4_Lite_WVALID : in STD_LOGIC;
    AXI4_Lite_BREADY : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_ARVALID : in STD_LOGIC;
    AXI4_Lite_RREADY : in STD_LOGIC;
    dut_data_valid_out_rx : out STD_LOGIC;
    dut_data_out_0_rx : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dut_data_out_1_rx : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dut_data_out_2_rx : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dut_data_out_3_rx : out STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_AWREADY : out STD_LOGIC;
    AXI4_Lite_WREADY : out STD_LOGIC;
    AXI4_Lite_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_BVALID : out STD_LOGIC;
    AXI4_Lite_ARREADY : out STD_LOGIC;
    AXI4_Lite_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI4_Lite_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_RVALID : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_Receiver_ip_0_0,Receiver_ip,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "IPCORE_CLK,IPCORE_RESETN,dut_data_valid_in_rx,dut_data_in_0_rx[15:0],dut_data_in_1_rx[15:0],AXI4_Lite_ACLK,AXI4_Lite_ARESETN,AXI4_Lite_AWADDR[15:0],AXI4_Lite_AWVALID,AXI4_Lite_WDATA[31:0],AXI4_Lite_WSTRB[3:0],AXI4_Lite_WVALID,AXI4_Lite_BREADY,AXI4_Lite_ARADDR[15:0],AXI4_Lite_ARVALID,AXI4_Lite_RREADY,dut_data_valid_out_rx,dut_data_out_0_rx[15:0],dut_data_out_1_rx[15:0],dut_data_out_2_rx[15:0],dut_data_out_3_rx[15:0],AXI4_Lite_AWREADY,AXI4_Lite_WREADY,AXI4_Lite_BRESP[1:0],AXI4_Lite_BVALID,AXI4_Lite_ARREADY,AXI4_Lite_RDATA[31:0],AXI4_Lite_RRESP[1:0],AXI4_Lite_RVALID";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of IPCORE_CLK : signal is "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of IPCORE_CLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of IPCORE_CLK : signal is "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of IPCORE_RESETN : signal is "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST";
  attribute X_INTERFACE_MODE of IPCORE_RESETN : signal is "slave";
  attribute X_INTERFACE_PARAMETER of IPCORE_RESETN : signal is "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI4_Lite_ACLK : signal is "xilinx.com:signal:clock:1.0 AXI4_Lite_signal_clock CLK";
  attribute X_INTERFACE_MODE of AXI4_Lite_ACLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI4_Lite_ACLK : signal is "XIL_INTERFACENAME AXI4_Lite_signal_clock, ASSOCIATED_BUSIF AXI4_Lite, ASSOCIATED_RESET AXI4_Lite_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI4_Lite_ARESETN : signal is "xilinx.com:signal:reset:1.0 AXI4_Lite_signal_reset RST";
  attribute X_INTERFACE_MODE of AXI4_Lite_ARESETN : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI4_Lite_ARESETN : signal is "XIL_INTERFACENAME AXI4_Lite_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI4_Lite_AWADDR : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWADDR";
  attribute X_INTERFACE_MODE of AXI4_Lite_AWADDR : signal is "slave";
  attribute X_INTERFACE_PARAMETER of AXI4_Lite_AWADDR : signal is "XIL_INTERFACENAME AXI4_Lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AXI4_Lite_AWVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWVALID";
  attribute X_INTERFACE_INFO of AXI4_Lite_WDATA : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WDATA";
  attribute X_INTERFACE_INFO of AXI4_Lite_WSTRB : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WSTRB";
  attribute X_INTERFACE_INFO of AXI4_Lite_WVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WVALID";
  attribute X_INTERFACE_INFO of AXI4_Lite_BREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BREADY";
  attribute X_INTERFACE_INFO of AXI4_Lite_ARADDR : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARADDR";
  attribute X_INTERFACE_INFO of AXI4_Lite_ARVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARVALID";
  attribute X_INTERFACE_INFO of AXI4_Lite_RREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RREADY";
  attribute X_INTERFACE_INFO of AXI4_Lite_AWREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWREADY";
  attribute X_INTERFACE_INFO of AXI4_Lite_WREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WREADY";
  attribute X_INTERFACE_INFO of AXI4_Lite_BRESP : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BRESP";
  attribute X_INTERFACE_INFO of AXI4_Lite_BVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BVALID";
  attribute X_INTERFACE_INFO of AXI4_Lite_ARREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARREADY";
  attribute X_INTERFACE_INFO of AXI4_Lite_RDATA : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RDATA";
  attribute X_INTERFACE_INFO of AXI4_Lite_RRESP : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RRESP";
  attribute X_INTERFACE_INFO of AXI4_Lite_RVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RVALID";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "Receiver_ip,Vivado 2025.1";
begin
end;
