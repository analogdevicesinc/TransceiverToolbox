// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:39:33 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_Receiver_ip_0_0/system_Receiver_ip_0_0_stub.v
// Design      : system_Receiver_ip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_Receiver_ip_0_0,Receiver_ip,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "Receiver_ip,Vivado 2025.1" *) 
module system_Receiver_ip_0_0(IPCORE_CLK, IPCORE_RESETN, 
  dut_data_valid_in_rx, dut_data_in_0_rx, dut_data_in_1_rx, AXI4_Lite_ACLK, 
  AXI4_Lite_ARESETN, AXI4_Lite_AWADDR, AXI4_Lite_AWVALID, AXI4_Lite_WDATA, AXI4_Lite_WSTRB, 
  AXI4_Lite_WVALID, AXI4_Lite_BREADY, AXI4_Lite_ARADDR, AXI4_Lite_ARVALID, 
  AXI4_Lite_RREADY, dut_data_valid_out_rx, dut_data_out_0_rx, dut_data_out_1_rx, 
  dut_data_out_2_rx, dut_data_out_3_rx, AXI4_Lite_AWREADY, AXI4_Lite_WREADY, 
  AXI4_Lite_BRESP, AXI4_Lite_BVALID, AXI4_Lite_ARREADY, AXI4_Lite_RDATA, AXI4_Lite_RRESP, 
  AXI4_Lite_RVALID)
/* synthesis syn_black_box black_box_pad_pin="IPCORE_RESETN,dut_data_valid_in_rx,dut_data_in_0_rx[15:0],dut_data_in_1_rx[15:0],AXI4_Lite_ARESETN,AXI4_Lite_AWADDR[15:0],AXI4_Lite_AWVALID,AXI4_Lite_WDATA[31:0],AXI4_Lite_WSTRB[3:0],AXI4_Lite_WVALID,AXI4_Lite_BREADY,AXI4_Lite_ARADDR[15:0],AXI4_Lite_ARVALID,AXI4_Lite_RREADY,dut_data_valid_out_rx,dut_data_out_0_rx[15:0],dut_data_out_1_rx[15:0],dut_data_out_2_rx[15:0],dut_data_out_3_rx[15:0],AXI4_Lite_AWREADY,AXI4_Lite_WREADY,AXI4_Lite_BRESP[1:0],AXI4_Lite_BVALID,AXI4_Lite_ARREADY,AXI4_Lite_RDATA[31:0],AXI4_Lite_RRESP[1:0],AXI4_Lite_RVALID" */
/* synthesis syn_force_seq_prim="IPCORE_CLK" */
/* synthesis syn_force_seq_prim="AXI4_Lite_ACLK" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *) input IPCORE_CLK /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input IPCORE_RESETN;
  input dut_data_valid_in_rx;
  input [15:0]dut_data_in_0_rx;
  input [15:0]dut_data_in_1_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI4_Lite_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite_signal_clock, ASSOCIATED_BUSIF AXI4_Lite, ASSOCIATED_RESET AXI4_Lite_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *) input AXI4_Lite_ACLK /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXI4_Lite_signal_reset RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI4_Lite_ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI4_Lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [15:0]AXI4_Lite_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWVALID" *) input AXI4_Lite_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WDATA" *) input [31:0]AXI4_Lite_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WSTRB" *) input [3:0]AXI4_Lite_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WVALID" *) input AXI4_Lite_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BREADY" *) input AXI4_Lite_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARADDR" *) input [15:0]AXI4_Lite_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARVALID" *) input AXI4_Lite_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RREADY" *) input AXI4_Lite_RREADY;
  output dut_data_valid_out_rx;
  output [15:0]dut_data_out_0_rx;
  output [15:0]dut_data_out_1_rx;
  output [15:0]dut_data_out_2_rx;
  output [15:0]dut_data_out_3_rx;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWREADY" *) output AXI4_Lite_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite WREADY" *) output AXI4_Lite_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BRESP" *) output [1:0]AXI4_Lite_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite BVALID" *) output AXI4_Lite_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARREADY" *) output AXI4_Lite_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RDATA" *) output [31:0]AXI4_Lite_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RRESP" *) output [1:0]AXI4_Lite_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI4_Lite RVALID" *) output AXI4_Lite_RVALID;
endmodule
