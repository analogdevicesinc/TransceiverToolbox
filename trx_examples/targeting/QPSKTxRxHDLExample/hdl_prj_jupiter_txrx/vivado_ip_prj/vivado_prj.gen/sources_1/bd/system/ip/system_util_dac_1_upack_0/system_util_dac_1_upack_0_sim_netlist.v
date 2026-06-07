// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:23:52 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_util_dac_1_upack_0/system_util_dac_1_upack_0_sim_netlist.v
// Design      : system_util_dac_1_upack_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_util_dac_1_upack_0,util_upack2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "util_upack2,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_util_dac_1_upack_0
   (clk,
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
    s_axis_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_clock, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk, INSERT_VIP 0" *) input clk;
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

  wire clk;
  wire enable_0;
  wire enable_1;
  wire enable_2;
  wire enable_3;
  wire [15:0]fifo_rd_data_0;
  wire [15:0]fifo_rd_data_1;
  wire [15:0]fifo_rd_data_2;
  wire [15:0]fifo_rd_data_3;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire reset;
  wire [63:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  system_util_dac_1_upack_0_util_upack2 inst
       (.D({enable_2,enable_1,enable_0}),
        .Q({fifo_rd_data_3,fifo_rd_data_2,fifo_rd_data_1,fifo_rd_data_0}),
        .clk(clk),
        .enable_3(enable_3),
        .fifo_rd_en(fifo_rd_en),
        .fifo_rd_underflow(fifo_rd_underflow),
        .fifo_rd_valid(fifo_rd_valid),
        .reset(reset),
        .s_axis_data(s_axis_data),
        .s_axis_ready(s_axis_ready),
        .s_axis_valid(s_axis_valid));
endmodule

(* ORIG_REF_NAME = "pack_network" *) 
module system_util_dac_1_upack_0_pack_network
   (E,
    \ctrl_reg[3]_0 ,
    Q,
    \ctrl_reg[8]_0 ,
    D,
    \ctrl_reg[11]_0 ,
    fifo_rd_en,
    s_axis_valid,
    clk,
    \fifo_rd_data_reg[32] ,
    \fifo_rd_data_reg[31] ,
    s_axis_data);
  output [0:0]E;
  output [63:0]\ctrl_reg[3]_0 ;
  input [1:0]Q;
  input [1:0]\ctrl_reg[8]_0 ;
  input [0:0]D;
  input \ctrl_reg[11]_0 ;
  input fifo_rd_en;
  input s_axis_valid;
  input clk;
  input [1:0]\fifo_rd_data_reg[32] ;
  input [31:0]\fifo_rd_data_reg[31] ;
  input [63:0]s_axis_data;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire \ctrl[0]_i_1_n_0 ;
  wire \ctrl[10]_i_1_n_0 ;
  wire \ctrl[11]_i_1_n_0 ;
  wire \ctrl[1]_i_1_n_0 ;
  wire \ctrl[2]_i_1_n_0 ;
  wire \ctrl[3]_i_1_n_0 ;
  wire \ctrl_reg[11]_0 ;
  wire [63:0]\ctrl_reg[3]_0 ;
  wire [1:0]\ctrl_reg[8]_0 ;
  wire \ctrl_reg_n_0_[0] ;
  wire \ctrl_reg_n_0_[10] ;
  wire \ctrl_reg_n_0_[11] ;
  wire \ctrl_reg_n_0_[1] ;
  wire \ctrl_reg_n_0_[2] ;
  wire \ctrl_reg_n_0_[3] ;
  wire \ctrl_reg_n_0_[8] ;
  wire \ctrl_reg_n_0_[9] ;
  wire \fifo_rd_data[0]_i_2_n_0 ;
  wire \fifo_rd_data[0]_i_3_n_0 ;
  wire \fifo_rd_data[10]_i_2_n_0 ;
  wire \fifo_rd_data[10]_i_3_n_0 ;
  wire \fifo_rd_data[11]_i_2_n_0 ;
  wire \fifo_rd_data[11]_i_3_n_0 ;
  wire \fifo_rd_data[12]_i_2_n_0 ;
  wire \fifo_rd_data[12]_i_3_n_0 ;
  wire \fifo_rd_data[13]_i_2_n_0 ;
  wire \fifo_rd_data[13]_i_3_n_0 ;
  wire \fifo_rd_data[14]_i_2_n_0 ;
  wire \fifo_rd_data[14]_i_3_n_0 ;
  wire \fifo_rd_data[15]_i_3_n_0 ;
  wire \fifo_rd_data[15]_i_4_n_0 ;
  wire \fifo_rd_data[1]_i_2_n_0 ;
  wire \fifo_rd_data[1]_i_3_n_0 ;
  wire \fifo_rd_data[2]_i_2_n_0 ;
  wire \fifo_rd_data[2]_i_3_n_0 ;
  wire \fifo_rd_data[3]_i_2_n_0 ;
  wire \fifo_rd_data[3]_i_3_n_0 ;
  wire \fifo_rd_data[4]_i_2_n_0 ;
  wire \fifo_rd_data[4]_i_3_n_0 ;
  wire \fifo_rd_data[5]_i_2_n_0 ;
  wire \fifo_rd_data[5]_i_3_n_0 ;
  wire \fifo_rd_data[6]_i_2_n_0 ;
  wire \fifo_rd_data[6]_i_3_n_0 ;
  wire \fifo_rd_data[7]_i_2_n_0 ;
  wire \fifo_rd_data[7]_i_3_n_0 ;
  wire \fifo_rd_data[8]_i_2_n_0 ;
  wire \fifo_rd_data[8]_i_3_n_0 ;
  wire \fifo_rd_data[9]_i_2_n_0 ;
  wire \fifo_rd_data[9]_i_3_n_0 ;
  wire [31:0]\fifo_rd_data_reg[31] ;
  wire [1:0]\fifo_rd_data_reg[32] ;
  wire fifo_rd_en;
  wire [15:0]p_1_in;
  wire [15:0]p_2_in;
  wire [63:0]s_axis_data;
  wire s_axis_valid;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \ctrl[0]_i_1 
       (.I0(\ctrl_reg[8]_0 [0]),
        .I1(\ctrl_reg[8]_0 [1]),
        .O(\ctrl[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    \ctrl[10]_i_1 
       (.I0(\ctrl_reg[8]_0 [0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\ctrl_reg[8]_0 [1]),
        .O(\ctrl[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF20DDF20)) 
    \ctrl[11]_i_1 
       (.I0(Q[0]),
        .I1(\ctrl_reg[8]_0 [0]),
        .I2(Q[1]),
        .I3(D),
        .I4(\ctrl_reg[8]_0 [1]),
        .O(\ctrl[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \ctrl[1]_i_1 
       (.I0(D),
        .I1(\ctrl_reg[8]_0 [1]),
        .I2(\ctrl_reg[8]_0 [0]),
        .O(\ctrl[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hD22D)) 
    \ctrl[2]_i_1 
       (.I0(\ctrl_reg[8]_0 [0]),
        .I1(Q[0]),
        .I2(\ctrl_reg[8]_0 [1]),
        .I3(Q[1]),
        .O(\ctrl[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB0FB4F04)) 
    \ctrl[3]_i_1 
       (.I0(Q[0]),
        .I1(\ctrl_reg[8]_0 [0]),
        .I2(Q[1]),
        .I3(\ctrl_reg[8]_0 [1]),
        .I4(D),
        .O(\ctrl[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[0]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[10]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[11]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[1]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[2]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[3]_i_1_n_0 ),
        .Q(\ctrl_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\ctrl_reg[8]_0 [1]),
        .Q(\ctrl_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D),
        .Q(\ctrl_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[0]_i_1 
       (.I0(\fifo_rd_data[0]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[0]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [0]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[0]_i_2 
       (.I0(\fifo_rd_data_reg[31] [0]),
        .I1(s_axis_data[32]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[0]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[0]_i_3 
       (.I0(\fifo_rd_data_reg[31] [16]),
        .I1(s_axis_data[48]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[16]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[10]_i_1 
       (.I0(\fifo_rd_data[10]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[10]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [10]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[10]_i_2 
       (.I0(\fifo_rd_data_reg[31] [10]),
        .I1(s_axis_data[42]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[10]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[10]_i_3 
       (.I0(\fifo_rd_data_reg[31] [26]),
        .I1(s_axis_data[58]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[26]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[11]_i_1 
       (.I0(\fifo_rd_data[11]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[11]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [11]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[11]_i_2 
       (.I0(\fifo_rd_data_reg[31] [11]),
        .I1(s_axis_data[43]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[11]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[11]_i_3 
       (.I0(\fifo_rd_data_reg[31] [27]),
        .I1(s_axis_data[59]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[27]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[12]_i_1 
       (.I0(\fifo_rd_data[12]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[12]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [12]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[12]_i_2 
       (.I0(\fifo_rd_data_reg[31] [12]),
        .I1(s_axis_data[44]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[12]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[12]_i_3 
       (.I0(\fifo_rd_data_reg[31] [28]),
        .I1(s_axis_data[60]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[28]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[13]_i_1 
       (.I0(\fifo_rd_data[13]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[13]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [13]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[13]_i_2 
       (.I0(\fifo_rd_data_reg[31] [13]),
        .I1(s_axis_data[45]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[13]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[13]_i_3 
       (.I0(\fifo_rd_data_reg[31] [29]),
        .I1(s_axis_data[61]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[29]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[13]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[14]_i_1 
       (.I0(\fifo_rd_data[14]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[14]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [14]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[14]_i_2 
       (.I0(\fifo_rd_data_reg[31] [14]),
        .I1(s_axis_data[46]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[14]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[14]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[14]_i_3 
       (.I0(\fifo_rd_data_reg[31] [30]),
        .I1(s_axis_data[62]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[30]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[15]_i_2 
       (.I0(\fifo_rd_data[15]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[15]_i_4_n_0 ),
        .O(\ctrl_reg[3]_0 [15]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[15]_i_3 
       (.I0(\fifo_rd_data_reg[31] [15]),
        .I1(s_axis_data[47]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[15]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[15]_i_4 
       (.I0(\fifo_rd_data_reg[31] [31]),
        .I1(s_axis_data[63]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[31]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[16]_i_1 
       (.I0(\fifo_rd_data[0]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[0]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [16]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[17]_i_1 
       (.I0(\fifo_rd_data[1]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[1]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[18]_i_1 
       (.I0(\fifo_rd_data[2]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[2]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [18]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[19]_i_1 
       (.I0(\fifo_rd_data[3]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[3]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [19]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[1]_i_1 
       (.I0(\fifo_rd_data[1]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[1]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [1]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[1]_i_2 
       (.I0(\fifo_rd_data_reg[31] [1]),
        .I1(s_axis_data[33]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[1]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[1]_i_3 
       (.I0(\fifo_rd_data_reg[31] [17]),
        .I1(s_axis_data[49]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[17]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[20]_i_1 
       (.I0(\fifo_rd_data[4]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[4]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [20]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[21]_i_1 
       (.I0(\fifo_rd_data[5]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[5]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [21]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[22]_i_1 
       (.I0(\fifo_rd_data[6]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[6]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [22]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[23]_i_1 
       (.I0(\fifo_rd_data[7]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[7]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [23]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[24]_i_1 
       (.I0(\fifo_rd_data[8]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[8]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[25]_i_1 
       (.I0(\fifo_rd_data[9]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[9]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[26]_i_1 
       (.I0(\fifo_rd_data[10]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[10]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [26]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[27]_i_1 
       (.I0(\fifo_rd_data[11]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[11]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [27]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[28]_i_1 
       (.I0(\fifo_rd_data[12]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[12]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [28]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[29]_i_1 
       (.I0(\fifo_rd_data[13]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[13]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [29]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[2]_i_1 
       (.I0(\fifo_rd_data[2]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[2]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [2]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[2]_i_2 
       (.I0(\fifo_rd_data_reg[31] [2]),
        .I1(s_axis_data[34]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[2]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[2]_i_3 
       (.I0(\fifo_rd_data_reg[31] [18]),
        .I1(s_axis_data[50]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[18]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[30]_i_1 
       (.I0(\fifo_rd_data[14]_i_3_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[14]_i_2_n_0 ),
        .O(\ctrl_reg[3]_0 [30]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[31]_i_1 
       (.I0(\fifo_rd_data[15]_i_4_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[15]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [31]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[32]_i_1 
       (.I0(p_2_in[0]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[0]),
        .O(\ctrl_reg[3]_0 [32]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[32]_i_2 
       (.I0(\fifo_rd_data_reg[31] [0]),
        .I1(s_axis_data[32]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[0]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[0]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[32]_i_3 
       (.I0(\fifo_rd_data_reg[31] [16]),
        .I1(s_axis_data[48]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[16]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[33]_i_1 
       (.I0(p_2_in[1]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[1]),
        .O(\ctrl_reg[3]_0 [33]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[33]_i_2 
       (.I0(\fifo_rd_data_reg[31] [1]),
        .I1(s_axis_data[33]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[1]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[1]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[33]_i_3 
       (.I0(\fifo_rd_data_reg[31] [17]),
        .I1(s_axis_data[49]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[17]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[34]_i_1 
       (.I0(p_2_in[2]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[2]),
        .O(\ctrl_reg[3]_0 [34]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[34]_i_2 
       (.I0(\fifo_rd_data_reg[31] [2]),
        .I1(s_axis_data[34]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[2]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[2]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[34]_i_3 
       (.I0(\fifo_rd_data_reg[31] [18]),
        .I1(s_axis_data[50]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[18]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[35]_i_1 
       (.I0(p_2_in[3]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[3]),
        .O(\ctrl_reg[3]_0 [35]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[35]_i_2 
       (.I0(\fifo_rd_data_reg[31] [3]),
        .I1(s_axis_data[35]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[3]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[3]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[35]_i_3 
       (.I0(\fifo_rd_data_reg[31] [19]),
        .I1(s_axis_data[51]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[19]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[36]_i_1 
       (.I0(p_2_in[4]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[4]),
        .O(\ctrl_reg[3]_0 [36]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[36]_i_2 
       (.I0(\fifo_rd_data_reg[31] [4]),
        .I1(s_axis_data[36]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[4]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[4]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[36]_i_3 
       (.I0(\fifo_rd_data_reg[31] [20]),
        .I1(s_axis_data[52]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[20]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[37]_i_1 
       (.I0(p_2_in[5]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[5]),
        .O(\ctrl_reg[3]_0 [37]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[37]_i_2 
       (.I0(\fifo_rd_data_reg[31] [5]),
        .I1(s_axis_data[37]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[5]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[5]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[37]_i_3 
       (.I0(\fifo_rd_data_reg[31] [21]),
        .I1(s_axis_data[53]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[21]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[38]_i_1 
       (.I0(p_2_in[6]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[6]),
        .O(\ctrl_reg[3]_0 [38]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[38]_i_2 
       (.I0(\fifo_rd_data_reg[31] [6]),
        .I1(s_axis_data[38]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[6]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[6]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[38]_i_3 
       (.I0(\fifo_rd_data_reg[31] [22]),
        .I1(s_axis_data[54]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[22]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[39]_i_1 
       (.I0(p_2_in[7]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[7]),
        .O(\ctrl_reg[3]_0 [39]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[39]_i_2 
       (.I0(\fifo_rd_data_reg[31] [7]),
        .I1(s_axis_data[39]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[7]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[7]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[39]_i_3 
       (.I0(\fifo_rd_data_reg[31] [23]),
        .I1(s_axis_data[55]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[23]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[3]_i_1 
       (.I0(\fifo_rd_data[3]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[3]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [3]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[3]_i_2 
       (.I0(\fifo_rd_data_reg[31] [3]),
        .I1(s_axis_data[35]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[3]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[3]_i_3 
       (.I0(\fifo_rd_data_reg[31] [19]),
        .I1(s_axis_data[51]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[19]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[40]_i_1 
       (.I0(p_2_in[8]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[8]),
        .O(\ctrl_reg[3]_0 [40]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[40]_i_2 
       (.I0(\fifo_rd_data_reg[31] [8]),
        .I1(s_axis_data[40]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[8]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[8]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[40]_i_3 
       (.I0(\fifo_rd_data_reg[31] [24]),
        .I1(s_axis_data[56]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[24]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[41]_i_1 
       (.I0(p_2_in[9]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[9]),
        .O(\ctrl_reg[3]_0 [41]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[41]_i_2 
       (.I0(\fifo_rd_data_reg[31] [9]),
        .I1(s_axis_data[41]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[9]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[9]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[41]_i_3 
       (.I0(\fifo_rd_data_reg[31] [25]),
        .I1(s_axis_data[57]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[25]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[9]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[42]_i_1 
       (.I0(p_2_in[10]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[10]),
        .O(\ctrl_reg[3]_0 [42]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[42]_i_2 
       (.I0(\fifo_rd_data_reg[31] [10]),
        .I1(s_axis_data[42]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[10]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[10]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[42]_i_3 
       (.I0(\fifo_rd_data_reg[31] [26]),
        .I1(s_axis_data[58]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[26]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[43]_i_1 
       (.I0(p_2_in[11]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[11]),
        .O(\ctrl_reg[3]_0 [43]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[43]_i_2 
       (.I0(\fifo_rd_data_reg[31] [11]),
        .I1(s_axis_data[43]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[11]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[11]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[43]_i_3 
       (.I0(\fifo_rd_data_reg[31] [27]),
        .I1(s_axis_data[59]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[27]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[44]_i_1 
       (.I0(p_2_in[12]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[12]),
        .O(\ctrl_reg[3]_0 [44]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[44]_i_2 
       (.I0(\fifo_rd_data_reg[31] [12]),
        .I1(s_axis_data[44]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[12]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[12]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[44]_i_3 
       (.I0(\fifo_rd_data_reg[31] [28]),
        .I1(s_axis_data[60]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[28]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[45]_i_1 
       (.I0(p_2_in[13]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[13]),
        .O(\ctrl_reg[3]_0 [45]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[45]_i_2 
       (.I0(\fifo_rd_data_reg[31] [13]),
        .I1(s_axis_data[45]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[13]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[13]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[45]_i_3 
       (.I0(\fifo_rd_data_reg[31] [29]),
        .I1(s_axis_data[61]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[29]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[46]_i_1 
       (.I0(p_2_in[14]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[14]),
        .O(\ctrl_reg[3]_0 [46]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[46]_i_2 
       (.I0(\fifo_rd_data_reg[31] [14]),
        .I1(s_axis_data[46]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[14]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[14]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[46]_i_3 
       (.I0(\fifo_rd_data_reg[31] [30]),
        .I1(s_axis_data[62]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[30]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[47]_i_1 
       (.I0(p_2_in[15]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_1_in[15]),
        .O(\ctrl_reg[3]_0 [47]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[47]_i_2 
       (.I0(\fifo_rd_data_reg[31] [15]),
        .I1(s_axis_data[47]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(s_axis_data[15]),
        .I4(\ctrl_reg_n_0_[3] ),
        .O(p_2_in[15]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[47]_i_3 
       (.I0(\fifo_rd_data_reg[31] [31]),
        .I1(s_axis_data[63]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(s_axis_data[31]),
        .I4(\ctrl_reg_n_0_[11] ),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[48]_i_1 
       (.I0(p_1_in[0]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[0]),
        .O(\ctrl_reg[3]_0 [48]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[49]_i_1 
       (.I0(p_1_in[1]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[1]),
        .O(\ctrl_reg[3]_0 [49]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[4]_i_1 
       (.I0(\fifo_rd_data[4]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[4]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [4]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[4]_i_2 
       (.I0(\fifo_rd_data_reg[31] [4]),
        .I1(s_axis_data[36]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[4]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[4]_i_3 
       (.I0(\fifo_rd_data_reg[31] [20]),
        .I1(s_axis_data[52]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[20]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[50]_i_1 
       (.I0(p_1_in[2]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[2]),
        .O(\ctrl_reg[3]_0 [50]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[51]_i_1 
       (.I0(p_1_in[3]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[3]),
        .O(\ctrl_reg[3]_0 [51]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[52]_i_1 
       (.I0(p_1_in[4]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[4]),
        .O(\ctrl_reg[3]_0 [52]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[53]_i_1 
       (.I0(p_1_in[5]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[5]),
        .O(\ctrl_reg[3]_0 [53]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[54]_i_1 
       (.I0(p_1_in[6]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[6]),
        .O(\ctrl_reg[3]_0 [54]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[55]_i_1 
       (.I0(p_1_in[7]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[7]),
        .O(\ctrl_reg[3]_0 [55]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[56]_i_1 
       (.I0(p_1_in[8]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[8]),
        .O(\ctrl_reg[3]_0 [56]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[57]_i_1 
       (.I0(p_1_in[9]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[9]),
        .O(\ctrl_reg[3]_0 [57]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[58]_i_1 
       (.I0(p_1_in[10]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[10]),
        .O(\ctrl_reg[3]_0 [58]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[59]_i_1 
       (.I0(p_1_in[11]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[11]),
        .O(\ctrl_reg[3]_0 [59]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[5]_i_1 
       (.I0(\fifo_rd_data[5]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[5]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [5]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[5]_i_2 
       (.I0(\fifo_rd_data_reg[31] [5]),
        .I1(s_axis_data[37]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[5]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[5]_i_3 
       (.I0(\fifo_rd_data_reg[31] [21]),
        .I1(s_axis_data[53]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[21]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[60]_i_1 
       (.I0(p_1_in[12]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[12]),
        .O(\ctrl_reg[3]_0 [60]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[61]_i_1 
       (.I0(p_1_in[13]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[13]),
        .O(\ctrl_reg[3]_0 [61]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[62]_i_1 
       (.I0(p_1_in[14]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[14]),
        .O(\ctrl_reg[3]_0 [62]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[63]_i_1 
       (.I0(p_1_in[15]),
        .I1(\fifo_rd_data_reg[32] [1]),
        .I2(p_2_in[15]),
        .O(\ctrl_reg[3]_0 [63]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[6]_i_1 
       (.I0(\fifo_rd_data[6]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[6]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [6]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[6]_i_2 
       (.I0(\fifo_rd_data_reg[31] [6]),
        .I1(s_axis_data[38]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[6]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[6]_i_3 
       (.I0(\fifo_rd_data_reg[31] [22]),
        .I1(s_axis_data[54]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[22]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[7]_i_1 
       (.I0(\fifo_rd_data[7]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[7]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [7]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[7]_i_2 
       (.I0(\fifo_rd_data_reg[31] [7]),
        .I1(s_axis_data[39]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[7]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[7]_i_3 
       (.I0(\fifo_rd_data_reg[31] [23]),
        .I1(s_axis_data[55]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[23]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[8]_i_1 
       (.I0(\fifo_rd_data[8]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[8]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [8]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[8]_i_2 
       (.I0(\fifo_rd_data_reg[31] [8]),
        .I1(s_axis_data[40]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[8]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[8]_i_3 
       (.I0(\fifo_rd_data_reg[31] [24]),
        .I1(s_axis_data[56]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[24]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[9]_i_1 
       (.I0(\fifo_rd_data[9]_i_2_n_0 ),
        .I1(\fifo_rd_data_reg[32] [0]),
        .I2(\fifo_rd_data[9]_i_3_n_0 ),
        .O(\ctrl_reg[3]_0 [9]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[9]_i_2 
       (.I0(\fifo_rd_data_reg[31] [9]),
        .I1(s_axis_data[41]),
        .I2(\ctrl_reg_n_0_[0] ),
        .I3(s_axis_data[9]),
        .I4(\ctrl_reg_n_0_[1] ),
        .O(\fifo_rd_data[9]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \fifo_rd_data[9]_i_3 
       (.I0(\fifo_rd_data_reg[31] [25]),
        .I1(s_axis_data[57]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(s_axis_data[25]),
        .I4(\ctrl_reg_n_0_[9] ),
        .O(\fifo_rd_data[9]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \gen_input_buffer.rotate_next[2]_i_1 
       (.I0(\ctrl_reg[11]_0 ),
        .I1(fifo_rd_en),
        .I2(s_axis_valid),
        .O(E));
endmodule

(* ORIG_REF_NAME = "pack_network" *) 
module system_util_dac_1_upack_0_pack_network__parameterized0
   (\ctrl_reg[3]_0 ,
    Q,
    \ctrl_reg[1]_0 ,
    \gen_prefix_count[3].prefix_count_reg ,
    E,
    clk);
  output [1:0]\ctrl_reg[3]_0 ;
  input [0:0]Q;
  input [0:0]\ctrl_reg[1]_0 ;
  input \gen_prefix_count[3].prefix_count_reg ;
  input [0:0]E;
  input clk;

  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire \ctrl[1]_i_1__0_n_0 ;
  wire \ctrl[3]_i_1__0_n_0 ;
  wire [0:0]\ctrl_reg[1]_0 ;
  wire [1:0]\ctrl_reg[3]_0 ;
  wire \gen_prefix_count[3].prefix_count_reg ;

  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \ctrl[1]_i_1__0 
       (.I0(Q),
        .I1(\ctrl_reg[1]_0 ),
        .O(\ctrl[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \ctrl[3]_i_1__0 
       (.I0(\gen_prefix_count[3].prefix_count_reg ),
        .I1(\ctrl_reg[1]_0 ),
        .O(\ctrl[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[1]_i_1__0_n_0 ),
        .Q(\ctrl_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\ctrl[3]_i_1__0_n_0 ),
        .Q(\ctrl_reg[3]_0 [1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "pack_shell" *) 
module system_util_dac_1_upack_0_pack_shell
   (reset_data_reg_0,
    fifo_rd_valid0,
    s_axis_ready,
    SR,
    \ctrl_reg[3] ,
    clk,
    D,
    fifo_rd_en,
    s_axis_valid,
    reset,
    s_axis_data);
  output reset_data_reg_0;
  output fifo_rd_valid0;
  output s_axis_ready;
  output [0:0]SR;
  output [63:0]\ctrl_reg[3] ;
  input clk;
  input [3:0]D;
  input fifo_rd_en;
  input s_axis_valid;
  input reset;
  input [63:0]s_axis_data;

  wire [3:0]D;
  wire [0:0]SR;
  wire ce_ctrl;
  wire clk;
  wire [63:0]\ctrl_reg[3] ;
  wire [1:0]enable_count;
  wire \enable_count[0]_i_1_n_0 ;
  wire \enable_count[1]_i_1_n_0 ;
  wire \enable_int_reg_n_0_[0] ;
  wire \enable_int_reg_n_0_[1] ;
  wire \enable_int_reg_n_0_[2] ;
  wire \enable_int_reg_n_0_[3] ;
  wire fifo_rd_en;
  wire fifo_rd_valid0;
  wire \gen_input_buffer.data_d10 ;
  wire \gen_input_buffer.data_d1_reg_n_0_[0] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[10] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[11] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[12] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[13] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[14] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[15] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[1] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[2] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[3] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[4] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[5] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[6] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[7] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[8] ;
  wire \gen_input_buffer.data_d1_reg_n_0_[9] ;
  wire \gen_input_buffer.ready_i_1_n_0 ;
  wire \gen_input_buffer.rotate_msb ;
  wire [2:2]\gen_input_buffer.rotate_next ;
  wire \gen_input_buffer.rotate_next[0]_i_1_n_0 ;
  wire \gen_input_buffer.rotate_next[1]_i_1_n_0 ;
  wire \gen_input_buffer.rotate_next_reg_n_0_[0] ;
  wire \gen_input_buffer.rotate_next_reg_n_0_[1] ;
  wire \gen_prefix_count[2].prefix_count[4]_i_1_n_0 ;
  wire [1:0]\gen_prefix_count[2].prefix_count_reg ;
  wire \gen_prefix_count[3].prefix_count[6]_i_1_n_0 ;
  wire \gen_prefix_count[3].prefix_count_reg ;
  wire p_0_in;
  wire p_0_in1_in;
  wire p_1_in;
  wire [15:0]p_3_in;
  wire [1:1]\prefix_count_s[2] ;
  wire ready;
  wire ready0;
  wire reset;
  wire reset_ctrl;
  wire reset_ctrl0;
  wire reset_ctrl_i_2_n_0;
  wire reset_ctrl_i_3_n_0;
  wire reset_data;
  wire reset_data_i_1_n_0;
  wire reset_data_reg_0;
  wire [1:0]rotate;
  wire [63:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;
  wire startup_ctrl;
  wire startup_ctrl2;
  wire startup_ctrl2_i_1_n_0;
  wire startup_ctrl_i_1_n_0;

  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \enable_count[0]_i_1 
       (.I0(\enable_int_reg_n_0_[1] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(\enable_int_reg_n_0_[3] ),
        .I3(\enable_int_reg_n_0_[2] ),
        .O(\enable_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hE881)) 
    \enable_count[1]_i_1 
       (.I0(\enable_int_reg_n_0_[2] ),
        .I1(\enable_int_reg_n_0_[3] ),
        .I2(\enable_int_reg_n_0_[1] ),
        .I3(\enable_int_reg_n_0_[0] ),
        .O(\enable_count[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enable_count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\enable_count[0]_i_1_n_0 ),
        .Q(enable_count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \enable_count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\enable_count[1]_i_1_n_0 ),
        .Q(enable_count[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \enable_int_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\enable_int_reg_n_0_[0] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \enable_int_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\enable_int_reg_n_0_[1] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \enable_int_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\enable_int_reg_n_0_[2] ),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \enable_int_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\enable_int_reg_n_0_[3] ),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \fifo_rd_data[15]_i_1 
       (.I0(reset_data),
        .I1(s_axis_valid),
        .I2(fifo_rd_en),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hB)) 
    fifo_rd_underflow_i_1
       (.I0(reset_data),
        .I1(s_axis_valid),
        .O(reset_data_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    fifo_rd_valid_i_2
       (.I0(s_axis_valid),
        .I1(reset_data),
        .O(fifo_rd_valid0));
  LUT3 #(
    .INIT(8'h80)) 
    \gen_input_buffer.data_d1[31]_i_1 
       (.I0(fifo_rd_en),
        .I1(s_axis_valid),
        .I2(ready),
        .O(\gen_input_buffer.data_d10 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[0] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[32]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[10] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[42]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[11] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[43]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[12] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[44]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[13] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[45]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[14] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[46]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[15] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[47]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[16] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[48]),
        .Q(p_3_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[17] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[49]),
        .Q(p_3_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[18] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[50]),
        .Q(p_3_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[19] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[51]),
        .Q(p_3_in[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[1] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[33]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[20] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[52]),
        .Q(p_3_in[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[21] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[53]),
        .Q(p_3_in[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[22] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[54]),
        .Q(p_3_in[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[23] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[55]),
        .Q(p_3_in[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[24] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[56]),
        .Q(p_3_in[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[25] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[57]),
        .Q(p_3_in[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[26] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[58]),
        .Q(p_3_in[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[27] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[59]),
        .Q(p_3_in[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[28] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[60]),
        .Q(p_3_in[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[29] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[61]),
        .Q(p_3_in[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[2] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[34]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[30] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[62]),
        .Q(p_3_in[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[31] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[63]),
        .Q(p_3_in[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[3] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[35]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[4] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[36]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[5] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[37]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[6] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[38]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[7] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[39]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[8] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[40]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.data_d1_reg[9] 
       (.C(clk),
        .CE(\gen_input_buffer.data_d10 ),
        .D(s_axis_data[41]),
        .Q(\gen_input_buffer.data_d1_reg_n_0_[9] ),
        .R(1'b0));
  system_util_dac_1_upack_0_pack_network \gen_input_buffer.i_ext_ctrl_interconnect 
       (.D(\gen_input_buffer.rotate_msb ),
        .E(ce_ctrl),
        .Q(\gen_prefix_count[2].prefix_count_reg ),
        .clk(clk),
        .\ctrl_reg[11]_0 (startup_ctrl),
        .\ctrl_reg[3]_0 (\ctrl_reg[3] ),
        .\ctrl_reg[8]_0 (rotate),
        .\fifo_rd_data_reg[31] ({p_3_in,\gen_input_buffer.data_d1_reg_n_0_[15] ,\gen_input_buffer.data_d1_reg_n_0_[14] ,\gen_input_buffer.data_d1_reg_n_0_[13] ,\gen_input_buffer.data_d1_reg_n_0_[12] ,\gen_input_buffer.data_d1_reg_n_0_[11] ,\gen_input_buffer.data_d1_reg_n_0_[10] ,\gen_input_buffer.data_d1_reg_n_0_[9] ,\gen_input_buffer.data_d1_reg_n_0_[8] ,\gen_input_buffer.data_d1_reg_n_0_[7] ,\gen_input_buffer.data_d1_reg_n_0_[6] ,\gen_input_buffer.data_d1_reg_n_0_[5] ,\gen_input_buffer.data_d1_reg_n_0_[4] ,\gen_input_buffer.data_d1_reg_n_0_[3] ,\gen_input_buffer.data_d1_reg_n_0_[2] ,\gen_input_buffer.data_d1_reg_n_0_[1] ,\gen_input_buffer.data_d1_reg_n_0_[0] }),
        .\fifo_rd_data_reg[32] ({p_1_in,p_0_in}),
        .fifo_rd_en(fifo_rd_en),
        .s_axis_data(s_axis_data),
        .s_axis_valid(s_axis_valid));
  LUT6 #(
    .INIT(64'h00000000EEEE2E22)) 
    \gen_input_buffer.ready_i_1 
       (.I0(ready),
        .I1(ce_ctrl),
        .I2(\gen_input_buffer.rotate_msb ),
        .I3(\gen_input_buffer.rotate_next ),
        .I4(ready0),
        .I5(reset_ctrl),
        .O(\gen_input_buffer.ready_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.ready_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gen_input_buffer.ready_i_1_n_0 ),
        .Q(ready),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    \gen_input_buffer.rotate_msb_i_1 
       (.I0(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .I1(enable_count[0]),
        .I2(enable_count[1]),
        .I3(\gen_input_buffer.rotate_next_reg_n_0_[1] ),
        .O(ready0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.rotate_msb_reg 
       (.C(clk),
        .CE(ce_ctrl),
        .D(ready0),
        .Q(\gen_input_buffer.rotate_msb ),
        .R(reset_ctrl));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \gen_input_buffer.rotate_next[0]_i_1 
       (.I0(enable_count[0]),
        .I1(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .O(\gen_input_buffer.rotate_next[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hE11E)) 
    \gen_input_buffer.rotate_next[1]_i_1 
       (.I0(enable_count[0]),
        .I1(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .I2(enable_count[1]),
        .I3(\gen_input_buffer.rotate_next_reg_n_0_[1] ),
        .O(\gen_input_buffer.rotate_next[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hEEE8)) 
    \gen_input_buffer.rotate_next[2]_i_2 
       (.I0(enable_count[1]),
        .I1(\gen_input_buffer.rotate_next_reg_n_0_[1] ),
        .I2(enable_count[0]),
        .I3(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .O(p_0_in1_in));
  FDRE \gen_input_buffer.rotate_next_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_input_buffer.rotate_next[0]_i_1_n_0 ),
        .Q(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .R(reset_ctrl));
  FDRE \gen_input_buffer.rotate_next_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_input_buffer.rotate_next[1]_i_1_n_0 ),
        .Q(\gen_input_buffer.rotate_next_reg_n_0_[1] ),
        .R(reset_ctrl));
  FDRE \gen_input_buffer.rotate_next_reg[2] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(p_0_in1_in),
        .Q(\gen_input_buffer.rotate_next ),
        .R(reset_ctrl));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.rotate_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_input_buffer.rotate_next_reg_n_0_[0] ),
        .Q(rotate[0]),
        .R(reset_ctrl));
  FDRE #(
    .INIT(1'b0)) 
    \gen_input_buffer.rotate_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_input_buffer.rotate_next_reg_n_0_[1] ),
        .Q(rotate[1]),
        .R(reset_ctrl));
  system_util_dac_1_upack_0_pack_network__parameterized0 \gen_network[1].i_ctrl_interconnect 
       (.E(ce_ctrl),
        .Q(\enable_int_reg_n_0_[0] ),
        .clk(clk),
        .\ctrl_reg[1]_0 (rotate[0]),
        .\ctrl_reg[3]_0 ({p_1_in,p_0_in}),
        .\gen_prefix_count[3].prefix_count_reg (\gen_prefix_count[3].prefix_count_reg ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gen_prefix_count[2].prefix_count[4]_i_1 
       (.I0(\enable_int_reg_n_0_[1] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .O(\gen_prefix_count[2].prefix_count[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \gen_prefix_count[2].prefix_count[5]_i_1 
       (.I0(\enable_int_reg_n_0_[1] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .O(\prefix_count_s[2] ));
  FDRE \gen_prefix_count[2].prefix_count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\gen_prefix_count[2].prefix_count[4]_i_1_n_0 ),
        .Q(\gen_prefix_count[2].prefix_count_reg [0]),
        .R(1'b0));
  FDRE \gen_prefix_count[2].prefix_count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\prefix_count_s[2] ),
        .Q(\gen_prefix_count[2].prefix_count_reg [1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \gen_prefix_count[3].prefix_count[6]_i_1 
       (.I0(\enable_int_reg_n_0_[2] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(\enable_int_reg_n_0_[1] ),
        .O(\gen_prefix_count[3].prefix_count[6]_i_1_n_0 ));
  FDRE \gen_prefix_count[3].prefix_count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\gen_prefix_count[3].prefix_count[6]_i_1_n_0 ),
        .Q(\gen_prefix_count[3].prefix_count_reg ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    reset_ctrl_i_1
       (.I0(reset),
        .I1(D[1]),
        .I2(D[0]),
        .I3(D[2]),
        .I4(D[3]),
        .O(reset_ctrl0));
  LUT3 #(
    .INIT(8'hF6)) 
    reset_ctrl_i_2
       (.I0(D[3]),
        .I1(\enable_int_reg_n_0_[3] ),
        .I2(reset_ctrl_i_3_n_0),
        .O(reset_ctrl_i_2_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    reset_ctrl_i_3
       (.I0(D[0]),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(\enable_int_reg_n_0_[2] ),
        .I3(D[2]),
        .I4(\enable_int_reg_n_0_[1] ),
        .I5(D[1]),
        .O(reset_ctrl_i_3_n_0));
  FDSE #(
    .INIT(1'b1)) 
    reset_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_ctrl_i_2_n_0),
        .Q(reset_ctrl),
        .S(reset_ctrl0));
  LUT5 #(
    .INIT(32'hFFFFFFBE)) 
    reset_data_i_1
       (.I0(startup_ctrl2),
        .I1(D[3]),
        .I2(\enable_int_reg_n_0_[3] ),
        .I3(reset_ctrl_i_3_n_0),
        .I4(reset_ctrl0),
        .O(reset_data_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reset_data_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_data_i_1_n_0),
        .Q(reset_data),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    s_axis_ready_INST_0
       (.I0(ready),
        .I1(fifo_rd_en),
        .I2(s_axis_valid),
        .O(s_axis_ready));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hEFFE)) 
    startup_ctrl2_i_1
       (.I0(reset_ctrl),
        .I1(reset_ctrl_i_3_n_0),
        .I2(\enable_int_reg_n_0_[3] ),
        .I3(D[3]),
        .O(startup_ctrl2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl2_reg
       (.C(clk),
        .CE(1'b1),
        .D(startup_ctrl2_i_1_n_0),
        .Q(startup_ctrl2),
        .R(reset_ctrl0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'hFEFFFFFE)) 
    startup_ctrl_i_1
       (.I0(startup_ctrl2),
        .I1(reset_ctrl),
        .I2(reset_ctrl_i_3_n_0),
        .I3(\enable_int_reg_n_0_[3] ),
        .I4(D[3]),
        .O(startup_ctrl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(startup_ctrl_i_1_n_0),
        .Q(startup_ctrl),
        .R(reset_ctrl0));
endmodule

(* ORIG_REF_NAME = "util_upack2" *) 
module system_util_dac_1_upack_0_util_upack2
   (fifo_rd_valid,
    fifo_rd_underflow,
    Q,
    s_axis_ready,
    reset,
    enable_3,
    clk,
    D,
    s_axis_data,
    fifo_rd_en,
    s_axis_valid);
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [63:0]Q;
  output s_axis_ready;
  input reset;
  input enable_3;
  input clk;
  input [2:0]D;
  input [63:0]s_axis_data;
  input fifo_rd_en;
  input s_axis_valid;

  wire [2:0]D;
  wire [63:0]Q;
  wire clk;
  wire enable_3;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire reset;
  wire [63:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  system_util_dac_1_upack_0_util_upack2_impl i_upack
       (.D({enable_3,D}),
        .Q(Q),
        .clk(clk),
        .fifo_rd_en(fifo_rd_en),
        .fifo_rd_underflow(fifo_rd_underflow),
        .fifo_rd_valid(fifo_rd_valid),
        .reset(reset),
        .s_axis_data(s_axis_data),
        .s_axis_ready(s_axis_ready),
        .s_axis_valid(s_axis_valid));
endmodule

(* ORIG_REF_NAME = "util_upack2_impl" *) 
module system_util_dac_1_upack_0_util_upack2_impl
   (fifo_rd_valid,
    fifo_rd_underflow,
    Q,
    s_axis_ready,
    reset,
    D,
    clk,
    s_axis_data,
    fifo_rd_en,
    s_axis_valid);
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [63:0]Q;
  output s_axis_ready;
  input reset;
  input [3:0]D;
  input clk;
  input [63:0]s_axis_data;
  input fifo_rd_en;
  input s_axis_valid;

  wire [3:0]D;
  wire [63:0]Q;
  wire clk;
  wire [63:0]deinterleaved_data;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire fifo_rd_valid0;
  wire fifo_rd_valid_i_1_n_0;
  wire i_pack_shell_n_0;
  wire i_pack_shell_n_3;
  wire reset;
  wire [63:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  FDRE \fifo_rd_data_reg[0] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[0]),
        .Q(Q[0]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[10] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[10]),
        .Q(Q[10]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[11] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[11]),
        .Q(Q[11]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[12] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[12]),
        .Q(Q[12]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[13] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[13]),
        .Q(Q[13]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[14] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[14]),
        .Q(Q[14]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[15] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[15]),
        .Q(Q[15]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[16] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[16]),
        .Q(Q[16]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[17] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[17]),
        .Q(Q[17]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[18] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[18]),
        .Q(Q[18]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[19] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[19]),
        .Q(Q[19]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[1] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[1]),
        .Q(Q[1]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[20] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[20]),
        .Q(Q[20]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[21] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[21]),
        .Q(Q[21]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[22] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[22]),
        .Q(Q[22]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[23] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[23]),
        .Q(Q[23]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[24] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[24]),
        .Q(Q[24]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[25] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[25]),
        .Q(Q[25]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[26] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[26]),
        .Q(Q[26]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[27] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[27]),
        .Q(Q[27]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[28] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[28]),
        .Q(Q[28]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[29] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[29]),
        .Q(Q[29]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[2] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[2]),
        .Q(Q[2]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[30] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[30]),
        .Q(Q[30]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[31] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[31]),
        .Q(Q[31]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[32] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[32]),
        .Q(Q[32]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[33] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[33]),
        .Q(Q[33]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[34] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[34]),
        .Q(Q[34]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[35] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[35]),
        .Q(Q[35]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[36] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[36]),
        .Q(Q[36]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[37] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[37]),
        .Q(Q[37]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[38] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[38]),
        .Q(Q[38]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[39] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[39]),
        .Q(Q[39]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[3] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[3]),
        .Q(Q[3]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[40] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[40]),
        .Q(Q[40]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[41] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[41]),
        .Q(Q[41]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[42] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[42]),
        .Q(Q[42]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[43] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[43]),
        .Q(Q[43]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[44] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[44]),
        .Q(Q[44]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[45] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[45]),
        .Q(Q[45]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[46] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[46]),
        .Q(Q[46]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[47] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[47]),
        .Q(Q[47]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[48] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[48]),
        .Q(Q[48]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[49] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[49]),
        .Q(Q[49]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[4] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[4]),
        .Q(Q[4]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[50] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[50]),
        .Q(Q[50]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[51] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[51]),
        .Q(Q[51]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[52] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[52]),
        .Q(Q[52]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[53] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[53]),
        .Q(Q[53]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[54] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[54]),
        .Q(Q[54]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[55] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[55]),
        .Q(Q[55]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[56] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[56]),
        .Q(Q[56]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[57] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[57]),
        .Q(Q[57]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[58] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[58]),
        .Q(Q[58]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[59] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[59]),
        .Q(Q[59]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[5] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[5]),
        .Q(Q[5]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[60] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[60]),
        .Q(Q[60]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[61] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[61]),
        .Q(Q[61]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[62] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[62]),
        .Q(Q[62]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[63] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[63]),
        .Q(Q[63]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[6] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[6]),
        .Q(Q[6]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[7] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[7]),
        .Q(Q[7]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[8] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[8]),
        .Q(Q[8]),
        .R(i_pack_shell_n_3));
  FDRE \fifo_rd_data_reg[9] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[9]),
        .Q(Q[9]),
        .R(i_pack_shell_n_3));
  FDRE fifo_rd_underflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(i_pack_shell_n_0),
        .Q(fifo_rd_underflow),
        .R(fifo_rd_valid_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_rd_valid_i_1
       (.I0(fifo_rd_en),
        .O(fifo_rd_valid_i_1_n_0));
  FDRE fifo_rd_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(fifo_rd_valid0),
        .Q(fifo_rd_valid),
        .R(fifo_rd_valid_i_1_n_0));
  system_util_dac_1_upack_0_pack_shell i_pack_shell
       (.D(D),
        .SR(i_pack_shell_n_3),
        .clk(clk),
        .\ctrl_reg[3] (deinterleaved_data),
        .fifo_rd_en(fifo_rd_en),
        .fifo_rd_valid0(fifo_rd_valid0),
        .reset(reset),
        .reset_data_reg_0(i_pack_shell_n_0),
        .s_axis_data(s_axis_data),
        .s_axis_ready(s_axis_ready),
        .s_axis_valid(s_axis_valid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
