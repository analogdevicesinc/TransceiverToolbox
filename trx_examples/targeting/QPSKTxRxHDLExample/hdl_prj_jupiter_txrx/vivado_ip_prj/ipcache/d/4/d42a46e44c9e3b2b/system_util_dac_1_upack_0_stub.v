// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:23:51 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_util_dac_1_upack_0_stub.v
// Design      : system_util_dac_1_upack_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_util_dac_1_upack_0,util_upack2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "util_upack2,Vivado 2025.1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset, enable_0, enable_1, enable_2, enable_3, 
  fifo_rd_en, fifo_rd_valid, fifo_rd_underflow, fifo_rd_data_0, fifo_rd_data_1, 
  fifo_rd_data_2, fifo_rd_data_3, s_axis_valid, s_axis_ready, s_axis_data)
/* synthesis syn_black_box black_box_pad_pin="reset,enable_0,enable_1,enable_2,enable_3,fifo_rd_en,fifo_rd_valid,fifo_rd_underflow,fifo_rd_data_0[15:0],fifo_rd_data_1[15:0],fifo_rd_data_2[15:0],fifo_rd_data_3[15:0],s_axis_valid,s_axis_ready,s_axis_data[63:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_clock, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_signal_reset RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset;
  input enable_0;
  input enable_1;
  input enable_2;
  input enable_3;
  input fifo_rd_en;
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [15:0]fifo_rd_data_0;
  output [15:0]fifo_rd_data_1;
  output [15:0]fifo_rd_data_2;
  output [15:0]fifo_rd_data_3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) input [63:0]s_axis_data;
endmodule
