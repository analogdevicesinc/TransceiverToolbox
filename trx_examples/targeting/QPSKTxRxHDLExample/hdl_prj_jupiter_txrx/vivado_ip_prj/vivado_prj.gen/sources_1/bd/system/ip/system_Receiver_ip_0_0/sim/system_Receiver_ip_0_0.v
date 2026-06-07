// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:ip:Receiver_ip:1.0
// IP Revision: 2114626131

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_Receiver_ip_0_0 (
  IPCORE_CLK,
  IPCORE_RESETN,
  dut_data_valid_in_rx,
  dut_data_in_0_rx,
  dut_data_in_1_rx,
  AXI4_Lite_ACLK,
  AXI4_Lite_ARESETN,
  AXI4_Lite_AWADDR,
  AXI4_Lite_AWVALID,
  AXI4_Lite_WDATA,
  AXI4_Lite_WSTRB,
  AXI4_Lite_WVALID,
  AXI4_Lite_BREADY,
  AXI4_Lite_ARADDR,
  AXI4_Lite_ARVALID,
  AXI4_Lite_RREADY,
  dut_data_valid_out_rx,
  dut_data_out_0_rx,
  dut_data_out_1_rx,
  dut_data_out_2_rx,
  dut_data_out_3_rx,
  AXI4_Lite_AWREADY,
  AXI4_Lite_WREADY,
  AXI4_Lite_BRESP,
  AXI4_Lite_BVALID,
  AXI4_Lite_ARREADY,
  AXI4_Lite_RDATA,
  AXI4_Lite_RRESP,
  AXI4_Lite_RVALID
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *)
input wire IPCORE_CLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire IPCORE_RESETN;
input wire dut_data_valid_in_rx;
input wire [15 : 0] dut_data_in_0_rx;
input wire [15 : 0] dut_data_in_1_rx;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI4_Lite_signal_clock CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite_signal_clock, ASSOCIATED_BUSIF AXI4_Lite, ASSOCIATED_RESET AXI4_Lite_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *)
input wire AXI4_Lite_ACLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXI4_Lite_signal_reset RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire AXI4_Lite_ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWADDR" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, NUM_READ_THREADS 1, NUM\
_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
input wire [15 : 0] AXI4_Lite_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWVALID" *)
input wire AXI4_Lite_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WDATA" *)
input wire [31 : 0] AXI4_Lite_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WSTRB" *)
input wire [3 : 0] AXI4_Lite_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WVALID" *)
input wire AXI4_Lite_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BREADY" *)
input wire AXI4_Lite_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARADDR" *)
input wire [15 : 0] AXI4_Lite_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARVALID" *)
input wire AXI4_Lite_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RREADY" *)
input wire AXI4_Lite_RREADY;
output wire dut_data_valid_out_rx;
output wire [15 : 0] dut_data_out_0_rx;
output wire [15 : 0] dut_data_out_1_rx;
output wire [15 : 0] dut_data_out_2_rx;
output wire [15 : 0] dut_data_out_3_rx;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWREADY" *)
output wire AXI4_Lite_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WREADY" *)
output wire AXI4_Lite_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BRESP" *)
output wire [1 : 0] AXI4_Lite_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BVALID" *)
output wire AXI4_Lite_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARREADY" *)
output wire AXI4_Lite_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RDATA" *)
output wire [31 : 0] AXI4_Lite_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RRESP" *)
output wire [1 : 0] AXI4_Lite_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RVALID" *)
output wire AXI4_Lite_RVALID;

  Receiver_ip inst (
    .IPCORE_CLK(IPCORE_CLK),
    .IPCORE_RESETN(IPCORE_RESETN),
    .dut_data_valid_in_rx(dut_data_valid_in_rx),
    .dut_data_in_0_rx(dut_data_in_0_rx),
    .dut_data_in_1_rx(dut_data_in_1_rx),
    .AXI4_Lite_ACLK(AXI4_Lite_ACLK),
    .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),
    .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR),
    .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),
    .AXI4_Lite_WDATA(AXI4_Lite_WDATA),
    .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),
    .AXI4_Lite_WVALID(AXI4_Lite_WVALID),
    .AXI4_Lite_BREADY(AXI4_Lite_BREADY),
    .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR),
    .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),
    .AXI4_Lite_RREADY(AXI4_Lite_RREADY),
    .dut_data_valid_out_rx(dut_data_valid_out_rx),
    .dut_data_out_0_rx(dut_data_out_0_rx),
    .dut_data_out_1_rx(dut_data_out_1_rx),
    .dut_data_out_2_rx(dut_data_out_2_rx),
    .dut_data_out_3_rx(dut_data_out_3_rx),
    .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),
    .AXI4_Lite_WREADY(AXI4_Lite_WREADY),
    .AXI4_Lite_BRESP(AXI4_Lite_BRESP),
    .AXI4_Lite_BVALID(AXI4_Lite_BVALID),
    .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),
    .AXI4_Lite_RDATA(AXI4_Lite_RDATA),
    .AXI4_Lite_RRESP(AXI4_Lite_RRESP),
    .AXI4_Lite_RVALID(AXI4_Lite_RVALID)
  );
endmodule
