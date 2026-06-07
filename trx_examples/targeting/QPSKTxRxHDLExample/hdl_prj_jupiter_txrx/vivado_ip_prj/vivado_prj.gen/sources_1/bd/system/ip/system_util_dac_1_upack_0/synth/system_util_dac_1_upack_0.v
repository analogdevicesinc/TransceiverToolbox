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


// IP VLNV: analog.com:user:util_upack2:1.0
// IP Revision: 1

(* X_CORE_INFO = "util_upack2,Vivado 2025.1" *)
(* CHECK_LICENSE_TYPE = "system_util_dac_1_upack_0,util_upack2,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_util_dac_1_upack_0 (
  clk,
  reset,
  enable_0,
  enable_1,
  enable_2,
  enable_3,
  fifo_rd_en,
  fifo_rd_valid,
  fifo_rd_underflow,
  fifo_rd_data_0,
  fifo_rd_data_1,
  fifo_rd_data_2,
  fifo_rd_data_3,
  s_axis_valid,
  s_axis_ready,
  s_axis_data
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_signal_clock CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_clock, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_signal_reset RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire reset;
input wire enable_0;
input wire enable_1;
input wire enable_2;
input wire enable_3;
input wire fifo_rd_en;
output wire fifo_rd_valid;
output wire fifo_rd_underflow;
output wire [15 : 0] fifo_rd_data_0;
output wire [15 : 0] fifo_rd_data_1;
output wire [15 : 0] fifo_rd_data_2;
output wire [15 : 0] fifo_rd_data_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire s_axis_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [63 : 0] s_axis_data;

  util_upack2 #(
    .NUM_OF_CHANNELS(4),
    .SAMPLES_PER_CHANNEL(1),
    .SAMPLE_DATA_WIDTH(16),
    .PARALLEL_OR_SERIAL_N(0)
  ) inst (
    .clk(clk),
    .reset(reset),
    .enable_0(enable_0),
    .enable_1(enable_1),
    .enable_2(enable_2),
    .enable_3(enable_3),
    .enable_4(1'B0),
    .enable_5(1'B0),
    .enable_6(1'B0),
    .enable_7(1'B0),
    .enable_8(1'B0),
    .enable_9(1'B0),
    .enable_10(1'B0),
    .enable_11(1'B0),
    .enable_12(1'B0),
    .enable_13(1'B0),
    .enable_14(1'B0),
    .enable_15(1'B0),
    .enable_16(1'B0),
    .enable_17(1'B0),
    .enable_18(1'B0),
    .enable_19(1'B0),
    .enable_20(1'B0),
    .enable_21(1'B0),
    .enable_22(1'B0),
    .enable_23(1'B0),
    .enable_24(1'B0),
    .enable_25(1'B0),
    .enable_26(1'B0),
    .enable_27(1'B0),
    .enable_28(1'B0),
    .enable_29(1'B0),
    .enable_30(1'B0),
    .enable_31(1'B0),
    .enable_32(1'B0),
    .enable_33(1'B0),
    .enable_34(1'B0),
    .enable_35(1'B0),
    .enable_36(1'B0),
    .enable_37(1'B0),
    .enable_38(1'B0),
    .enable_39(1'B0),
    .enable_40(1'B0),
    .enable_41(1'B0),
    .enable_42(1'B0),
    .enable_43(1'B0),
    .enable_44(1'B0),
    .enable_45(1'B0),
    .enable_46(1'B0),
    .enable_47(1'B0),
    .enable_48(1'B0),
    .enable_49(1'B0),
    .enable_50(1'B0),
    .enable_51(1'B0),
    .enable_52(1'B0),
    .enable_53(1'B0),
    .enable_54(1'B0),
    .enable_55(1'B0),
    .enable_56(1'B0),
    .enable_57(1'B0),
    .enable_58(1'B0),
    .enable_59(1'B0),
    .enable_60(1'B0),
    .enable_61(1'B0),
    .enable_62(1'B0),
    .enable_63(1'B0),
    .fifo_rd_en(fifo_rd_en),
    .fifo_rd_valid(fifo_rd_valid),
    .fifo_rd_underflow(fifo_rd_underflow),
    .fifo_rd_data_0(fifo_rd_data_0),
    .fifo_rd_data_1(fifo_rd_data_1),
    .fifo_rd_data_2(fifo_rd_data_2),
    .fifo_rd_data_3(fifo_rd_data_3),
    .fifo_rd_data_4(),
    .fifo_rd_data_5(),
    .fifo_rd_data_6(),
    .fifo_rd_data_7(),
    .fifo_rd_data_8(),
    .fifo_rd_data_9(),
    .fifo_rd_data_10(),
    .fifo_rd_data_11(),
    .fifo_rd_data_12(),
    .fifo_rd_data_13(),
    .fifo_rd_data_14(),
    .fifo_rd_data_15(),
    .fifo_rd_data_16(),
    .fifo_rd_data_17(),
    .fifo_rd_data_18(),
    .fifo_rd_data_19(),
    .fifo_rd_data_20(),
    .fifo_rd_data_21(),
    .fifo_rd_data_22(),
    .fifo_rd_data_23(),
    .fifo_rd_data_24(),
    .fifo_rd_data_25(),
    .fifo_rd_data_26(),
    .fifo_rd_data_27(),
    .fifo_rd_data_28(),
    .fifo_rd_data_29(),
    .fifo_rd_data_30(),
    .fifo_rd_data_31(),
    .fifo_rd_data_32(),
    .fifo_rd_data_33(),
    .fifo_rd_data_34(),
    .fifo_rd_data_35(),
    .fifo_rd_data_36(),
    .fifo_rd_data_37(),
    .fifo_rd_data_38(),
    .fifo_rd_data_39(),
    .fifo_rd_data_40(),
    .fifo_rd_data_41(),
    .fifo_rd_data_42(),
    .fifo_rd_data_43(),
    .fifo_rd_data_44(),
    .fifo_rd_data_45(),
    .fifo_rd_data_46(),
    .fifo_rd_data_47(),
    .fifo_rd_data_48(),
    .fifo_rd_data_49(),
    .fifo_rd_data_50(),
    .fifo_rd_data_51(),
    .fifo_rd_data_52(),
    .fifo_rd_data_53(),
    .fifo_rd_data_54(),
    .fifo_rd_data_55(),
    .fifo_rd_data_56(),
    .fifo_rd_data_57(),
    .fifo_rd_data_58(),
    .fifo_rd_data_59(),
    .fifo_rd_data_60(),
    .fifo_rd_data_61(),
    .fifo_rd_data_62(),
    .fifo_rd_data_63(),
    .s_axis_valid(s_axis_valid),
    .s_axis_ready(s_axis_ready),
    .s_axis_data(s_axis_data)
  );
endmodule
