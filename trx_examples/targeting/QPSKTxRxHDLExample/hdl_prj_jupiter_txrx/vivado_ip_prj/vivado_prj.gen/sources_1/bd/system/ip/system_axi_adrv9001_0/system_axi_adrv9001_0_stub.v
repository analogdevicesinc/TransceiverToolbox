// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:14:59 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_axi_adrv9001_0/system_axi_adrv9001_0_stub.v
// Design      : system_axi_adrv9001_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_axi_adrv9001_0,axi_adrv9001,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "axi_adrv9001,Vivado 2025.1" *) 
module system_axi_adrv9001_0(mssi_sync_in, ref_clk, mcs_in, mcs_out, mcs_src, 
  tx_output_enable, rx1_dclk_in_n_NC, rx1_dclk_in_p_dclk_in, rx1_idata_in_n_idata0, 
  rx1_idata_in_p_idata1, rx1_qdata_in_n_qdata2, rx1_qdata_in_p_qdata3, 
  rx1_strobe_in_n_NC, rx1_strobe_in_p_strobe_in, rx2_dclk_in_n_NC, rx2_dclk_in_p_dclk_in, 
  rx2_idata_in_n_idata0, rx2_idata_in_p_idata1, rx2_qdata_in_n_qdata2, 
  rx2_qdata_in_p_qdata3, rx2_strobe_in_n_NC, rx2_strobe_in_p_strobe_in, 
  tx1_dclk_out_n_NC, tx1_dclk_out_p_dclk_out, tx1_dclk_in_n_NC, tx1_dclk_in_p_dclk_in, 
  tx1_idata_out_n_idata0, tx1_idata_out_p_idata1, tx1_qdata_out_n_qdata2, 
  tx1_qdata_out_p_qdata3, tx1_strobe_out_n_NC, tx1_strobe_out_p_strobe_out, 
  tx2_dclk_out_n_NC, tx2_dclk_out_p_dclk_out, tx2_dclk_in_n_NC, tx2_dclk_in_p_dclk_in, 
  tx2_idata_out_n_idata0, tx2_idata_out_p_idata1, tx2_qdata_out_n_qdata2, 
  tx2_qdata_out_p_qdata3, tx2_strobe_out_n_NC, tx2_strobe_out_p_strobe_out, rx1_enable, 
  rx2_enable, tx1_enable, tx2_enable, delay_clk, adc_1_clk, adc_1_rst, adc_1_valid_i0, 
  adc_1_enable_i0, adc_1_data_i0, adc_1_valid_q0, adc_1_enable_q0, adc_1_data_q0, 
  adc_1_valid_i1, adc_1_enable_i1, adc_1_data_i1, adc_1_valid_q1, adc_1_enable_q1, 
  adc_1_data_q1, adc_1_dovf, adc_1_start_sync, adc_2_clk, adc_2_rst, adc_2_valid_i0, 
  adc_2_enable_i0, adc_2_data_i0, adc_2_valid_q0, adc_2_enable_q0, adc_2_data_q0, adc_2_dovf, 
  adc_2_start_sync, dac_1_clk, dac_1_rst, dac_1_valid_i0, dac_1_enable_i0, dac_1_data_i0, 
  dac_1_valid_q0, dac_1_enable_q0, dac_1_data_q0, dac_1_valid_i1, dac_1_enable_i1, 
  dac_1_data_i1, dac_1_valid_q1, dac_1_enable_q1, dac_1_data_q1, dac_1_dunf, dac_2_clk, 
  dac_2_rst, dac_2_valid_i0, dac_2_enable_i0, dac_2_data_i0, dac_2_valid_q0, dac_2_enable_q0, 
  dac_2_data_q0, dac_2_dunf, tdd_sync, tdd_sync_cntr, gpio_rx1_enable_in, gpio_rx2_enable_in, 
  gpio_tx1_enable_in, gpio_tx2_enable_in, s_axi_aclk, s_axi_aresetn, s_axi_awvalid, 
  s_axi_awaddr, s_axi_awready, s_axi_wvalid, s_axi_wdata, s_axi_wstrb, s_axi_wready, 
  s_axi_bvalid, s_axi_bresp, s_axi_bready, s_axi_arvalid, s_axi_araddr, s_axi_arready, 
  s_axi_rvalid, s_axi_rresp, s_axi_rdata, s_axi_rready, s_axi_awprot, s_axi_arprot)
/* synthesis syn_black_box black_box_pad_pin="mssi_sync_in,mcs_in,mcs_out,mcs_src,tx_output_enable,rx1_dclk_in_n_NC,rx1_dclk_in_p_dclk_in,rx1_idata_in_n_idata0,rx1_idata_in_p_idata1,rx1_qdata_in_n_qdata2,rx1_qdata_in_p_qdata3,rx1_strobe_in_n_NC,rx1_strobe_in_p_strobe_in,rx2_dclk_in_n_NC,rx2_dclk_in_p_dclk_in,rx2_idata_in_n_idata0,rx2_idata_in_p_idata1,rx2_qdata_in_n_qdata2,rx2_qdata_in_p_qdata3,rx2_strobe_in_n_NC,rx2_strobe_in_p_strobe_in,tx1_dclk_out_n_NC,tx1_dclk_out_p_dclk_out,tx1_dclk_in_n_NC,tx1_dclk_in_p_dclk_in,tx1_idata_out_n_idata0,tx1_idata_out_p_idata1,tx1_qdata_out_n_qdata2,tx1_qdata_out_p_qdata3,tx1_strobe_out_n_NC,tx1_strobe_out_p_strobe_out,tx2_dclk_out_n_NC,tx2_dclk_out_p_dclk_out,tx2_dclk_in_n_NC,tx2_dclk_in_p_dclk_in,tx2_idata_out_n_idata0,tx2_idata_out_p_idata1,tx2_qdata_out_n_qdata2,tx2_qdata_out_p_qdata3,tx2_strobe_out_n_NC,tx2_strobe_out_p_strobe_out,rx1_enable,rx2_enable,tx1_enable,tx2_enable,adc_1_rst,adc_1_valid_i0,adc_1_enable_i0,adc_1_data_i0[15:0],adc_1_valid_q0,adc_1_enable_q0,adc_1_data_q0[15:0],adc_1_valid_i1,adc_1_enable_i1,adc_1_data_i1[15:0],adc_1_valid_q1,adc_1_enable_q1,adc_1_data_q1[15:0],adc_1_dovf,adc_1_start_sync,adc_2_rst,adc_2_valid_i0,adc_2_enable_i0,adc_2_data_i0[15:0],adc_2_valid_q0,adc_2_enable_q0,adc_2_data_q0[15:0],adc_2_dovf,adc_2_start_sync,dac_1_rst,dac_1_valid_i0,dac_1_enable_i0,dac_1_data_i0[15:0],dac_1_valid_q0,dac_1_enable_q0,dac_1_data_q0[15:0],dac_1_valid_i1,dac_1_enable_i1,dac_1_data_i1[15:0],dac_1_valid_q1,dac_1_enable_q1,dac_1_data_q1[15:0],dac_1_dunf,dac_2_rst,dac_2_valid_i0,dac_2_enable_i0,dac_2_data_i0[15:0],dac_2_valid_q0,dac_2_enable_q0,dac_2_data_q0[15:0],dac_2_dunf,tdd_sync,tdd_sync_cntr,gpio_rx1_enable_in,gpio_rx2_enable_in,gpio_tx1_enable_in,gpio_tx2_enable_in,s_axi_aresetn,s_axi_awvalid,s_axi_awaddr[15:0],s_axi_awready,s_axi_wvalid,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wready,s_axi_bvalid,s_axi_bresp[1:0],s_axi_bready,s_axi_arvalid,s_axi_araddr[15:0],s_axi_arready,s_axi_rvalid,s_axi_rresp[1:0],s_axi_rdata[31:0],s_axi_rready,s_axi_awprot[2:0],s_axi_arprot[2:0]" */
/* synthesis syn_force_seq_prim="ref_clk" */
/* synthesis syn_force_seq_prim="delay_clk" */
/* synthesis syn_force_seq_prim="adc_1_clk" */
/* synthesis syn_force_seq_prim="adc_2_clk" */
/* synthesis syn_force_seq_prim="dac_1_clk" */
/* synthesis syn_force_seq_prim="dac_2_clk" */
/* synthesis syn_force_seq_prim="s_axi_aclk" */;
  input mssi_sync_in;
  input ref_clk /* synthesis syn_isclock = 1 */;
  input mcs_in;
  output mcs_out;
  output mcs_src;
  input tx_output_enable;
  input rx1_dclk_in_n_NC;
  input rx1_dclk_in_p_dclk_in;
  input rx1_idata_in_n_idata0;
  input rx1_idata_in_p_idata1;
  input rx1_qdata_in_n_qdata2;
  input rx1_qdata_in_p_qdata3;
  input rx1_strobe_in_n_NC;
  input rx1_strobe_in_p_strobe_in;
  input rx2_dclk_in_n_NC;
  input rx2_dclk_in_p_dclk_in;
  input rx2_idata_in_n_idata0;
  input rx2_idata_in_p_idata1;
  input rx2_qdata_in_n_qdata2;
  input rx2_qdata_in_p_qdata3;
  input rx2_strobe_in_n_NC;
  input rx2_strobe_in_p_strobe_in;
  output tx1_dclk_out_n_NC;
  output tx1_dclk_out_p_dclk_out;
  input tx1_dclk_in_n_NC;
  input tx1_dclk_in_p_dclk_in;
  output tx1_idata_out_n_idata0;
  output tx1_idata_out_p_idata1;
  output tx1_qdata_out_n_qdata2;
  output tx1_qdata_out_p_qdata3;
  output tx1_strobe_out_n_NC;
  output tx1_strobe_out_p_strobe_out;
  output tx2_dclk_out_n_NC;
  output tx2_dclk_out_p_dclk_out;
  input tx2_dclk_in_n_NC;
  input tx2_dclk_in_p_dclk_in;
  output tx2_idata_out_n_idata0;
  output tx2_idata_out_p_idata1;
  output tx2_qdata_out_n_qdata2;
  output tx2_qdata_out_p_qdata3;
  output tx2_strobe_out_n_NC;
  output tx2_strobe_out_p_strobe_out;
  output rx1_enable;
  output rx2_enable;
  output tx1_enable;
  output tx2_enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 delay_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME delay_clk, FREQ_HZ 499994995, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk2, INSERT_VIP 0" *) input delay_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_1_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_1_clk, ASSOCIATED_RESET adc_1_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0" *) output adc_1_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 adc_1_rst RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_1_rst, INSERT_VIP 0" *) output adc_1_rst;
  output adc_1_valid_i0;
  output adc_1_enable_i0;
  output [15:0]adc_1_data_i0;
  output adc_1_valid_q0;
  output adc_1_enable_q0;
  output [15:0]adc_1_data_q0;
  output adc_1_valid_i1;
  output adc_1_enable_i1;
  output [15:0]adc_1_data_i1;
  output adc_1_valid_q1;
  output adc_1_enable_q1;
  output [15:0]adc_1_data_q1;
  input adc_1_dovf;
  output adc_1_start_sync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_2_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_2_clk, ASSOCIATED_RESET adc_2_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_2_clk, INSERT_VIP 0" *) output adc_2_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 adc_2_rst RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc_2_rst, INSERT_VIP 0" *) output adc_2_rst;
  output adc_2_valid_i0;
  output adc_2_enable_i0;
  output [15:0]adc_2_data_i0;
  output adc_2_valid_q0;
  output adc_2_enable_q0;
  output [15:0]adc_2_data_q0;
  input adc_2_dovf;
  output adc_2_start_sync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_1_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_1_clk, ASSOCIATED_RESET dac_1_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *) output dac_1_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dac_1_rst RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_1_rst, INSERT_VIP 0" *) output dac_1_rst;
  output dac_1_valid_i0;
  output dac_1_enable_i0;
  input [15:0]dac_1_data_i0;
  output dac_1_valid_q0;
  output dac_1_enable_q0;
  input [15:0]dac_1_data_q0;
  output dac_1_valid_i1;
  output dac_1_enable_i1;
  input [15:0]dac_1_data_i1;
  output dac_1_valid_q1;
  output dac_1_enable_q1;
  input [15:0]dac_1_data_q1;
  input dac_1_dunf;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_2_clk CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_2_clk, ASSOCIATED_RESET dac_2_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, INSERT_VIP 0" *) output dac_2_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dac_2_rst RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac_2_rst, INSERT_VIP 0" *) output dac_2_rst;
  output dac_2_valid_i0;
  output dac_2_enable_i0;
  input [15:0]dac_2_data_i0;
  output dac_2_valid_q0;
  output dac_2_enable_q0;
  input [15:0]dac_2_data_q0;
  input dac_2_dunf;
  input tdd_sync;
  output tdd_sync_cntr;
  input gpio_rx1_enable_in;
  input gpio_rx2_enable_in;
  input gpio_tx1_enable_in;
  input gpio_tx2_enable_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *) input s_axi_aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [15:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [15:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
endmodule
