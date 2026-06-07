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


// IP VLNV: analog.com:user:axi_adrv9001:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_axi_adrv9001_0 (
  mssi_sync_in,
  ref_clk,
  mcs_in,
  mcs_out,
  mcs_src,
  tx_output_enable,
  rx1_dclk_in_n_NC,
  rx1_dclk_in_p_dclk_in,
  rx1_idata_in_n_idata0,
  rx1_idata_in_p_idata1,
  rx1_qdata_in_n_qdata2,
  rx1_qdata_in_p_qdata3,
  rx1_strobe_in_n_NC,
  rx1_strobe_in_p_strobe_in,
  rx2_dclk_in_n_NC,
  rx2_dclk_in_p_dclk_in,
  rx2_idata_in_n_idata0,
  rx2_idata_in_p_idata1,
  rx2_qdata_in_n_qdata2,
  rx2_qdata_in_p_qdata3,
  rx2_strobe_in_n_NC,
  rx2_strobe_in_p_strobe_in,
  tx1_dclk_out_n_NC,
  tx1_dclk_out_p_dclk_out,
  tx1_dclk_in_n_NC,
  tx1_dclk_in_p_dclk_in,
  tx1_idata_out_n_idata0,
  tx1_idata_out_p_idata1,
  tx1_qdata_out_n_qdata2,
  tx1_qdata_out_p_qdata3,
  tx1_strobe_out_n_NC,
  tx1_strobe_out_p_strobe_out,
  tx2_dclk_out_n_NC,
  tx2_dclk_out_p_dclk_out,
  tx2_dclk_in_n_NC,
  tx2_dclk_in_p_dclk_in,
  tx2_idata_out_n_idata0,
  tx2_idata_out_p_idata1,
  tx2_qdata_out_n_qdata2,
  tx2_qdata_out_p_qdata3,
  tx2_strobe_out_n_NC,
  tx2_strobe_out_p_strobe_out,
  rx1_enable,
  rx2_enable,
  tx1_enable,
  tx2_enable,
  delay_clk,
  adc_1_clk,
  adc_1_rst,
  adc_1_valid_i0,
  adc_1_enable_i0,
  adc_1_data_i0,
  adc_1_valid_q0,
  adc_1_enable_q0,
  adc_1_data_q0,
  adc_1_valid_i1,
  adc_1_enable_i1,
  adc_1_data_i1,
  adc_1_valid_q1,
  adc_1_enable_q1,
  adc_1_data_q1,
  adc_1_dovf,
  adc_1_start_sync,
  adc_2_clk,
  adc_2_rst,
  adc_2_valid_i0,
  adc_2_enable_i0,
  adc_2_data_i0,
  adc_2_valid_q0,
  adc_2_enable_q0,
  adc_2_data_q0,
  adc_2_dovf,
  adc_2_start_sync,
  dac_1_clk,
  dac_1_rst,
  dac_1_valid_i0,
  dac_1_enable_i0,
  dac_1_data_i0,
  dac_1_valid_q0,
  dac_1_enable_q0,
  dac_1_data_q0,
  dac_1_valid_i1,
  dac_1_enable_i1,
  dac_1_data_i1,
  dac_1_valid_q1,
  dac_1_enable_q1,
  dac_1_data_q1,
  dac_1_dunf,
  dac_2_clk,
  dac_2_rst,
  dac_2_valid_i0,
  dac_2_enable_i0,
  dac_2_data_i0,
  dac_2_valid_q0,
  dac_2_enable_q0,
  dac_2_data_q0,
  dac_2_dunf,
  tdd_sync,
  tdd_sync_cntr,
  gpio_rx1_enable_in,
  gpio_rx2_enable_in,
  gpio_tx1_enable_in,
  gpio_tx2_enable_in,
  s_axi_aclk,
  s_axi_aresetn,
  s_axi_awvalid,
  s_axi_awaddr,
  s_axi_awready,
  s_axi_wvalid,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wready,
  s_axi_bvalid,
  s_axi_bresp,
  s_axi_bready,
  s_axi_arvalid,
  s_axi_araddr,
  s_axi_arready,
  s_axi_rvalid,
  s_axi_rresp,
  s_axi_rdata,
  s_axi_rready,
  s_axi_awprot,
  s_axi_arprot
);

input wire mssi_sync_in;
input wire ref_clk;
input wire mcs_in;
output wire mcs_out;
output wire mcs_src;
input wire tx_output_enable;
input wire rx1_dclk_in_n_NC;
input wire rx1_dclk_in_p_dclk_in;
input wire rx1_idata_in_n_idata0;
input wire rx1_idata_in_p_idata1;
input wire rx1_qdata_in_n_qdata2;
input wire rx1_qdata_in_p_qdata3;
input wire rx1_strobe_in_n_NC;
input wire rx1_strobe_in_p_strobe_in;
input wire rx2_dclk_in_n_NC;
input wire rx2_dclk_in_p_dclk_in;
input wire rx2_idata_in_n_idata0;
input wire rx2_idata_in_p_idata1;
input wire rx2_qdata_in_n_qdata2;
input wire rx2_qdata_in_p_qdata3;
input wire rx2_strobe_in_n_NC;
input wire rx2_strobe_in_p_strobe_in;
output wire tx1_dclk_out_n_NC;
output wire tx1_dclk_out_p_dclk_out;
input wire tx1_dclk_in_n_NC;
input wire tx1_dclk_in_p_dclk_in;
output wire tx1_idata_out_n_idata0;
output wire tx1_idata_out_p_idata1;
output wire tx1_qdata_out_n_qdata2;
output wire tx1_qdata_out_p_qdata3;
output wire tx1_strobe_out_n_NC;
output wire tx1_strobe_out_p_strobe_out;
output wire tx2_dclk_out_n_NC;
output wire tx2_dclk_out_p_dclk_out;
input wire tx2_dclk_in_n_NC;
input wire tx2_dclk_in_p_dclk_in;
output wire tx2_idata_out_n_idata0;
output wire tx2_idata_out_p_idata1;
output wire tx2_qdata_out_n_qdata2;
output wire tx2_qdata_out_p_qdata3;
output wire tx2_strobe_out_n_NC;
output wire tx2_strobe_out_p_strobe_out;
output wire rx1_enable;
output wire rx2_enable;
output wire tx1_enable;
output wire tx2_enable;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 delay_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME delay_clk, FREQ_HZ 499994995, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk2, INSERT_VIP 0" *)
input wire delay_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_1_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_1_clk, ASSOCIATED_RESET adc_1_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0" *)
output wire adc_1_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 adc_1_rst RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_1_rst, INSERT_VIP 0" *)
output wire adc_1_rst;
output wire adc_1_valid_i0;
output wire adc_1_enable_i0;
output wire [15 : 0] adc_1_data_i0;
output wire adc_1_valid_q0;
output wire adc_1_enable_q0;
output wire [15 : 0] adc_1_data_q0;
output wire adc_1_valid_i1;
output wire adc_1_enable_i1;
output wire [15 : 0] adc_1_data_i1;
output wire adc_1_valid_q1;
output wire adc_1_enable_q1;
output wire [15 : 0] adc_1_data_q1;
input wire adc_1_dovf;
output wire adc_1_start_sync;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_2_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_2_clk, ASSOCIATED_RESET adc_2_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_2_clk, INSERT_VIP 0" *)
output wire adc_2_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 adc_2_rst RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_2_rst, INSERT_VIP 0" *)
output wire adc_2_rst;
output wire adc_2_valid_i0;
output wire adc_2_enable_i0;
output wire [15 : 0] adc_2_data_i0;
output wire adc_2_valid_q0;
output wire adc_2_enable_q0;
output wire [15 : 0] adc_2_data_q0;
input wire adc_2_dovf;
output wire adc_2_start_sync;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_1_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_1_clk, ASSOCIATED_RESET dac_1_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *)
output wire dac_1_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dac_1_rst RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_1_rst, INSERT_VIP 0" *)
output wire dac_1_rst;
output wire dac_1_valid_i0;
output wire dac_1_enable_i0;
input wire [15 : 0] dac_1_data_i0;
output wire dac_1_valid_q0;
output wire dac_1_enable_q0;
input wire [15 : 0] dac_1_data_q0;
output wire dac_1_valid_i1;
output wire dac_1_enable_i1;
input wire [15 : 0] dac_1_data_i1;
output wire dac_1_valid_q1;
output wire dac_1_enable_q1;
input wire [15 : 0] dac_1_data_q1;
input wire dac_1_dunf;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_2_clk CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_2_clk, ASSOCIATED_RESET dac_2_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, INSERT_VIP 0" *)
output wire dac_2_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dac_2_rst RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_2_rst, INSERT_VIP 0" *)
output wire dac_2_rst;
output wire dac_2_valid_i0;
output wire dac_2_enable_i0;
input wire [15 : 0] dac_2_data_i0;
output wire dac_2_valid_q0;
output wire dac_2_enable_q0;
input wire [15 : 0] dac_2_data_q0;
input wire dac_2_dunf;
input wire tdd_sync;
output wire tdd_sync_cntr;
input wire gpio_rx1_enable_in;
input wire gpio_rx2_enable_in;
input wire gpio_tx1_enable_in;
input wire gpio_tx2_enable_in;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *)
input wire s_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire s_axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREA\
DS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
input wire s_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *)
input wire [15 : 0] s_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *)
output wire s_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *)
input wire s_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *)
input wire [31 : 0] s_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *)
input wire [3 : 0] s_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *)
output wire s_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *)
output wire s_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *)
output wire [1 : 0] s_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *)
input wire s_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *)
input wire s_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *)
input wire [15 : 0] s_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *)
output wire s_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *)
output wire s_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *)
output wire [1 : 0] s_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *)
output wire [31 : 0] s_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *)
input wire s_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *)
input wire [2 : 0] s_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *)
input wire [2 : 0] s_axi_arprot;

  axi_adrv9001 #(
    .ID(0),
    .CMOS_LVDS_N(0),
    .TDD_DISABLE(0),
    .DDS_DISABLE(0),
    .INDEPENDENT_1R1T_SUPPORT(1),
    .COMMON_2R2T_SUPPORT(1),
    .DISABLE_RX1_SSI(1'B0),
    .DISABLE_TX1_SSI(0),
    .DISABLE_RX2_SSI(1'B0),
    .DISABLE_TX2_SSI(0),
    .RX_USE_BUFG(0),
    .TX_USE_BUFG(0),
    .IODELAY_CTRL(1),
    .IODELAY_ENABLE(1),
    .IO_DELAY_GROUP("dev_if_delay_group"),
    .FPGA_TECHNOLOGY(3),
    .FPGA_FAMILY(4),
    .SPEED_GRADE(20),
    .DEV_PACKAGE(15),
    .EXT_SYNC(1),
    .ENABLE_REF_CLK_MON(0),
    .EN_RX_MCS_TO_STRB_M(0),
    .USE_RX_CLK_FOR_TX1(0),
    .USE_RX_CLK_FOR_TX2(0)
  ) inst (
    .mssi_sync_in(mssi_sync_in),
    .ref_clk(ref_clk),
    .mcs_in(mcs_in),
    .mcs_out(mcs_out),
    .mcs_src(mcs_src),
    .tx_output_enable(tx_output_enable),
    .rx1_dclk_in_n_NC(rx1_dclk_in_n_NC),
    .rx1_dclk_in_p_dclk_in(rx1_dclk_in_p_dclk_in),
    .rx1_idata_in_n_idata0(rx1_idata_in_n_idata0),
    .rx1_idata_in_p_idata1(rx1_idata_in_p_idata1),
    .rx1_qdata_in_n_qdata2(rx1_qdata_in_n_qdata2),
    .rx1_qdata_in_p_qdata3(rx1_qdata_in_p_qdata3),
    .rx1_strobe_in_n_NC(rx1_strobe_in_n_NC),
    .rx1_strobe_in_p_strobe_in(rx1_strobe_in_p_strobe_in),
    .rx2_dclk_in_n_NC(rx2_dclk_in_n_NC),
    .rx2_dclk_in_p_dclk_in(rx2_dclk_in_p_dclk_in),
    .rx2_idata_in_n_idata0(rx2_idata_in_n_idata0),
    .rx2_idata_in_p_idata1(rx2_idata_in_p_idata1),
    .rx2_qdata_in_n_qdata2(rx2_qdata_in_n_qdata2),
    .rx2_qdata_in_p_qdata3(rx2_qdata_in_p_qdata3),
    .rx2_strobe_in_n_NC(rx2_strobe_in_n_NC),
    .rx2_strobe_in_p_strobe_in(rx2_strobe_in_p_strobe_in),
    .tx1_dclk_out_n_NC(tx1_dclk_out_n_NC),
    .tx1_dclk_out_p_dclk_out(tx1_dclk_out_p_dclk_out),
    .tx1_dclk_in_n_NC(tx1_dclk_in_n_NC),
    .tx1_dclk_in_p_dclk_in(tx1_dclk_in_p_dclk_in),
    .tx1_idata_out_n_idata0(tx1_idata_out_n_idata0),
    .tx1_idata_out_p_idata1(tx1_idata_out_p_idata1),
    .tx1_qdata_out_n_qdata2(tx1_qdata_out_n_qdata2),
    .tx1_qdata_out_p_qdata3(tx1_qdata_out_p_qdata3),
    .tx1_strobe_out_n_NC(tx1_strobe_out_n_NC),
    .tx1_strobe_out_p_strobe_out(tx1_strobe_out_p_strobe_out),
    .tx2_dclk_out_n_NC(tx2_dclk_out_n_NC),
    .tx2_dclk_out_p_dclk_out(tx2_dclk_out_p_dclk_out),
    .tx2_dclk_in_n_NC(tx2_dclk_in_n_NC),
    .tx2_dclk_in_p_dclk_in(tx2_dclk_in_p_dclk_in),
    .tx2_idata_out_n_idata0(tx2_idata_out_n_idata0),
    .tx2_idata_out_p_idata1(tx2_idata_out_p_idata1),
    .tx2_qdata_out_n_qdata2(tx2_qdata_out_n_qdata2),
    .tx2_qdata_out_p_qdata3(tx2_qdata_out_p_qdata3),
    .tx2_strobe_out_n_NC(tx2_strobe_out_n_NC),
    .tx2_strobe_out_p_strobe_out(tx2_strobe_out_p_strobe_out),
    .rx1_enable(rx1_enable),
    .rx2_enable(rx2_enable),
    .tx1_enable(tx1_enable),
    .tx2_enable(tx2_enable),
    .delay_clk(delay_clk),
    .adc_1_clk(adc_1_clk),
    .adc_1_rst(adc_1_rst),
    .adc_1_valid_i0(adc_1_valid_i0),
    .adc_1_enable_i0(adc_1_enable_i0),
    .adc_1_data_i0(adc_1_data_i0),
    .adc_1_valid_q0(adc_1_valid_q0),
    .adc_1_enable_q0(adc_1_enable_q0),
    .adc_1_data_q0(adc_1_data_q0),
    .adc_1_valid_i1(adc_1_valid_i1),
    .adc_1_enable_i1(adc_1_enable_i1),
    .adc_1_data_i1(adc_1_data_i1),
    .adc_1_valid_q1(adc_1_valid_q1),
    .adc_1_enable_q1(adc_1_enable_q1),
    .adc_1_data_q1(adc_1_data_q1),
    .adc_1_dovf(adc_1_dovf),
    .adc_1_start_sync(adc_1_start_sync),
    .adc_2_clk(adc_2_clk),
    .adc_2_rst(adc_2_rst),
    .adc_2_valid_i0(adc_2_valid_i0),
    .adc_2_enable_i0(adc_2_enable_i0),
    .adc_2_data_i0(adc_2_data_i0),
    .adc_2_valid_q0(adc_2_valid_q0),
    .adc_2_enable_q0(adc_2_enable_q0),
    .adc_2_data_q0(adc_2_data_q0),
    .adc_2_dovf(adc_2_dovf),
    .adc_2_start_sync(adc_2_start_sync),
    .dac_1_clk(dac_1_clk),
    .dac_1_rst(dac_1_rst),
    .dac_1_valid_i0(dac_1_valid_i0),
    .dac_1_enable_i0(dac_1_enable_i0),
    .dac_1_data_i0(dac_1_data_i0),
    .dac_1_valid_q0(dac_1_valid_q0),
    .dac_1_enable_q0(dac_1_enable_q0),
    .dac_1_data_q0(dac_1_data_q0),
    .dac_1_valid_i1(dac_1_valid_i1),
    .dac_1_enable_i1(dac_1_enable_i1),
    .dac_1_data_i1(dac_1_data_i1),
    .dac_1_valid_q1(dac_1_valid_q1),
    .dac_1_enable_q1(dac_1_enable_q1),
    .dac_1_data_q1(dac_1_data_q1),
    .dac_1_dunf(dac_1_dunf),
    .dac_2_clk(dac_2_clk),
    .dac_2_rst(dac_2_rst),
    .dac_2_valid_i0(dac_2_valid_i0),
    .dac_2_enable_i0(dac_2_enable_i0),
    .dac_2_data_i0(dac_2_data_i0),
    .dac_2_valid_q0(dac_2_valid_q0),
    .dac_2_enable_q0(dac_2_enable_q0),
    .dac_2_data_q0(dac_2_data_q0),
    .dac_2_dunf(dac_2_dunf),
    .tdd_sync(tdd_sync),
    .tdd_sync_cntr(tdd_sync_cntr),
    .gpio_rx1_enable_in(gpio_rx1_enable_in),
    .gpio_rx2_enable_in(gpio_rx2_enable_in),
    .gpio_tx1_enable_in(gpio_tx1_enable_in),
    .gpio_tx2_enable_in(gpio_tx2_enable_in),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awready(s_axi_awready),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wready(s_axi_wready),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bready(s_axi_bready),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arready(s_axi_arready),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rready(s_axi_rready),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_arprot(s_axi_arprot)
  );
endmodule
