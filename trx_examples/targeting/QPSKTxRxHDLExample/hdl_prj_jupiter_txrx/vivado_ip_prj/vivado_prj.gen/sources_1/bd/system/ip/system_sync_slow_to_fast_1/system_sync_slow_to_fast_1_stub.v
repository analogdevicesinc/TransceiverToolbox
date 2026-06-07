// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:44:18 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top system_sync_slow_to_fast_1 -prefix
//               system_sync_slow_to_fast_1_ system_sync_slow_to_fast_0_stub.v
// Design      : system_sync_slow_to_fast_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_sync_slow_to_fast_0,sync_slow_to_fast,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "sync_slow_to_fast,Vivado 2025.1" *) 
module system_sync_slow_to_fast_1(in_data, in_resetn, in_clk, out_data, out_resetn, 
  out_clk)
/* synthesis syn_black_box black_box_pad_pin="in_data[64:0],in_resetn,out_data[64:0],out_resetn" */
/* synthesis syn_force_seq_prim="in_clk" */
/* synthesis syn_force_seq_prim="out_clk" */;
  input [64:0]in_data;
  input in_resetn;
  input in_clk /* synthesis syn_isclock = 1 */;
  output [64:0]out_data;
  input out_resetn;
  input out_clk /* synthesis syn_isclock = 1 */;
endmodule
