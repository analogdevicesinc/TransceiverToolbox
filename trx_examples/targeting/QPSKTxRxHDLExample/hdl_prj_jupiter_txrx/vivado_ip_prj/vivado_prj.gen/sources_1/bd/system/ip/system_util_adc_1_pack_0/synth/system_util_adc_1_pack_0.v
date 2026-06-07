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


// IP VLNV: analog.com:user:util_cpack2:1.0
// IP Revision: 1

(* X_CORE_INFO = "util_cpack2,Vivado 2025.1" *)
(* CHECK_LICENSE_TYPE = "system_util_adc_1_pack_0,util_cpack2,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_util_adc_1_pack_0 (
  clk,
  reset,
  enable_0,
  enable_1,
  enable_2,
  enable_3,
  fifo_wr_en,
  fifo_wr_overflow,
  fifo_wr_data_0,
  fifo_wr_data_1,
  fifo_wr_data_2,
  fifo_wr_data_3,
  packed_fifo_wr_en,
  packed_fifo_wr_overflow,
  packed_fifo_wr_data,
  packed_sync
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 packed_fifo_wr_signal_clock CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME packed_fifo_wr_signal_clock, ASSOCIATED_BUSIF packed_fifo_wr, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 packed_fifo_wr_signal_reset RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME packed_fifo_wr_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire reset;
input wire enable_0;
input wire enable_1;
input wire enable_2;
input wire enable_3;
input wire fifo_wr_en;
output wire fifo_wr_overflow;
input wire [15 : 0] fifo_wr_data_0;
input wire [15 : 0] fifo_wr_data_1;
input wire [15 : 0] fifo_wr_data_2;
input wire [15 : 0] fifo_wr_data_3;
(* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr EN" *)
(* X_INTERFACE_MODE = "master" *)
output wire packed_fifo_wr_en;
(* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr OVERFLOW" *)
input wire packed_fifo_wr_overflow;
(* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr DATA" *)
output wire [63 : 0] packed_fifo_wr_data;
output wire packed_sync;

  util_cpack2 #(
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
    .fifo_wr_en(fifo_wr_en),
    .fifo_wr_overflow(fifo_wr_overflow),
    .fifo_wr_data_0(fifo_wr_data_0),
    .fifo_wr_data_1(fifo_wr_data_1),
    .fifo_wr_data_2(fifo_wr_data_2),
    .fifo_wr_data_3(fifo_wr_data_3),
    .fifo_wr_data_4(16'B0),
    .fifo_wr_data_5(16'B0),
    .fifo_wr_data_6(16'B0),
    .fifo_wr_data_7(16'B0),
    .fifo_wr_data_8(16'B0),
    .fifo_wr_data_9(16'B0),
    .fifo_wr_data_10(16'B0),
    .fifo_wr_data_11(16'B0),
    .fifo_wr_data_12(16'B0),
    .fifo_wr_data_13(16'B0),
    .fifo_wr_data_14(16'B0),
    .fifo_wr_data_15(16'B0),
    .fifo_wr_data_16(16'B0),
    .fifo_wr_data_17(16'B0),
    .fifo_wr_data_18(16'B0),
    .fifo_wr_data_19(16'B0),
    .fifo_wr_data_20(16'B0),
    .fifo_wr_data_21(16'B0),
    .fifo_wr_data_22(16'B0),
    .fifo_wr_data_23(16'B0),
    .fifo_wr_data_24(16'B0),
    .fifo_wr_data_25(16'B0),
    .fifo_wr_data_26(16'B0),
    .fifo_wr_data_27(16'B0),
    .fifo_wr_data_28(16'B0),
    .fifo_wr_data_29(16'B0),
    .fifo_wr_data_30(16'B0),
    .fifo_wr_data_31(16'B0),
    .fifo_wr_data_32(16'B0),
    .fifo_wr_data_33(16'B0),
    .fifo_wr_data_34(16'B0),
    .fifo_wr_data_35(16'B0),
    .fifo_wr_data_36(16'B0),
    .fifo_wr_data_37(16'B0),
    .fifo_wr_data_38(16'B0),
    .fifo_wr_data_39(16'B0),
    .fifo_wr_data_40(16'B0),
    .fifo_wr_data_41(16'B0),
    .fifo_wr_data_42(16'B0),
    .fifo_wr_data_43(16'B0),
    .fifo_wr_data_44(16'B0),
    .fifo_wr_data_45(16'B0),
    .fifo_wr_data_46(16'B0),
    .fifo_wr_data_47(16'B0),
    .fifo_wr_data_48(16'B0),
    .fifo_wr_data_49(16'B0),
    .fifo_wr_data_50(16'B0),
    .fifo_wr_data_51(16'B0),
    .fifo_wr_data_52(16'B0),
    .fifo_wr_data_53(16'B0),
    .fifo_wr_data_54(16'B0),
    .fifo_wr_data_55(16'B0),
    .fifo_wr_data_56(16'B0),
    .fifo_wr_data_57(16'B0),
    .fifo_wr_data_58(16'B0),
    .fifo_wr_data_59(16'B0),
    .fifo_wr_data_60(16'B0),
    .fifo_wr_data_61(16'B0),
    .fifo_wr_data_62(16'B0),
    .fifo_wr_data_63(16'B0),
    .packed_fifo_wr_en(packed_fifo_wr_en),
    .packed_fifo_wr_overflow(packed_fifo_wr_overflow),
    .packed_fifo_wr_data(packed_fifo_wr_data),
    .packed_sync(packed_sync)
  );
endmodule
