// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:26:50 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_util_dac_2_upack_0_sim_netlist.v
// Design      : system_util_dac_2_upack_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_interconnect
   (\s_axis_data[31] ,
    s_axis_data,
    p_0_in);
  output [31:0]\s_axis_data[31] ;
  input [31:0]s_axis_data;
  input p_0_in;

  wire p_0_in;
  wire [31:0]s_axis_data;
  wire [31:0]\s_axis_data[31] ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[0]_i_1 
       (.I0(s_axis_data[0]),
        .I1(p_0_in),
        .I2(s_axis_data[16]),
        .O(\s_axis_data[31] [0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[10]_i_1 
       (.I0(s_axis_data[10]),
        .I1(p_0_in),
        .I2(s_axis_data[26]),
        .O(\s_axis_data[31] [10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[11]_i_1 
       (.I0(s_axis_data[11]),
        .I1(p_0_in),
        .I2(s_axis_data[27]),
        .O(\s_axis_data[31] [11]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[12]_i_1 
       (.I0(s_axis_data[12]),
        .I1(p_0_in),
        .I2(s_axis_data[28]),
        .O(\s_axis_data[31] [12]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[13]_i_1 
       (.I0(s_axis_data[13]),
        .I1(p_0_in),
        .I2(s_axis_data[29]),
        .O(\s_axis_data[31] [13]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[14]_i_1 
       (.I0(s_axis_data[14]),
        .I1(p_0_in),
        .I2(s_axis_data[30]),
        .O(\s_axis_data[31] [14]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[15]_i_1 
       (.I0(s_axis_data[15]),
        .I1(p_0_in),
        .I2(s_axis_data[31]),
        .O(\s_axis_data[31] [15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[16]_i_1 
       (.I0(s_axis_data[16]),
        .I1(p_0_in),
        .I2(s_axis_data[0]),
        .O(\s_axis_data[31] [16]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[17]_i_1 
       (.I0(s_axis_data[17]),
        .I1(p_0_in),
        .I2(s_axis_data[1]),
        .O(\s_axis_data[31] [17]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[18]_i_1 
       (.I0(s_axis_data[18]),
        .I1(p_0_in),
        .I2(s_axis_data[2]),
        .O(\s_axis_data[31] [18]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[19]_i_1 
       (.I0(s_axis_data[19]),
        .I1(p_0_in),
        .I2(s_axis_data[3]),
        .O(\s_axis_data[31] [19]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[1]_i_1 
       (.I0(s_axis_data[1]),
        .I1(p_0_in),
        .I2(s_axis_data[17]),
        .O(\s_axis_data[31] [1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[20]_i_1 
       (.I0(s_axis_data[20]),
        .I1(p_0_in),
        .I2(s_axis_data[4]),
        .O(\s_axis_data[31] [20]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[21]_i_1 
       (.I0(s_axis_data[21]),
        .I1(p_0_in),
        .I2(s_axis_data[5]),
        .O(\s_axis_data[31] [21]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[22]_i_1 
       (.I0(s_axis_data[22]),
        .I1(p_0_in),
        .I2(s_axis_data[6]),
        .O(\s_axis_data[31] [22]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[23]_i_1 
       (.I0(s_axis_data[23]),
        .I1(p_0_in),
        .I2(s_axis_data[7]),
        .O(\s_axis_data[31] [23]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[24]_i_1 
       (.I0(s_axis_data[24]),
        .I1(p_0_in),
        .I2(s_axis_data[8]),
        .O(\s_axis_data[31] [24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[25]_i_1 
       (.I0(s_axis_data[25]),
        .I1(p_0_in),
        .I2(s_axis_data[9]),
        .O(\s_axis_data[31] [25]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[26]_i_1 
       (.I0(s_axis_data[26]),
        .I1(p_0_in),
        .I2(s_axis_data[10]),
        .O(\s_axis_data[31] [26]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[27]_i_1 
       (.I0(s_axis_data[27]),
        .I1(p_0_in),
        .I2(s_axis_data[11]),
        .O(\s_axis_data[31] [27]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[28]_i_1 
       (.I0(s_axis_data[28]),
        .I1(p_0_in),
        .I2(s_axis_data[12]),
        .O(\s_axis_data[31] [28]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[29]_i_1 
       (.I0(s_axis_data[29]),
        .I1(p_0_in),
        .I2(s_axis_data[13]),
        .O(\s_axis_data[31] [29]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[2]_i_1 
       (.I0(s_axis_data[2]),
        .I1(p_0_in),
        .I2(s_axis_data[18]),
        .O(\s_axis_data[31] [2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[30]_i_1 
       (.I0(s_axis_data[30]),
        .I1(p_0_in),
        .I2(s_axis_data[14]),
        .O(\s_axis_data[31] [30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[31]_i_1 
       (.I0(s_axis_data[31]),
        .I1(p_0_in),
        .I2(s_axis_data[15]),
        .O(\s_axis_data[31] [31]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[3]_i_1 
       (.I0(s_axis_data[3]),
        .I1(p_0_in),
        .I2(s_axis_data[19]),
        .O(\s_axis_data[31] [3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[4]_i_1 
       (.I0(s_axis_data[4]),
        .I1(p_0_in),
        .I2(s_axis_data[20]),
        .O(\s_axis_data[31] [4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[5]_i_1 
       (.I0(s_axis_data[5]),
        .I1(p_0_in),
        .I2(s_axis_data[21]),
        .O(\s_axis_data[31] [5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[6]_i_1 
       (.I0(s_axis_data[6]),
        .I1(p_0_in),
        .I2(s_axis_data[22]),
        .O(\s_axis_data[31] [6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[7]_i_1 
       (.I0(s_axis_data[7]),
        .I1(p_0_in),
        .I2(s_axis_data[23]),
        .O(\s_axis_data[31] [7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[8]_i_1 
       (.I0(s_axis_data[8]),
        .I1(p_0_in),
        .I2(s_axis_data[24]),
        .O(\s_axis_data[31] [8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_rd_data[9]_i_1 
       (.I0(s_axis_data[9]),
        .I1(p_0_in),
        .I2(s_axis_data[25]),
        .O(\s_axis_data[31] [9]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network
   (\s_axis_data[31] ,
    clk,
    Q,
    rotate,
    \ctrl_reg[1]_0 ,
    fifo_rd_en,
    s_axis_valid,
    s_axis_data);
  output [31:0]\s_axis_data[31] ;
  input clk;
  input [0:0]Q;
  input rotate;
  input \ctrl_reg[1]_0 ;
  input fifo_rd_en;
  input s_axis_valid;
  input [31:0]s_axis_data;

  wire [0:0]Q;
  wire clk;
  wire \ctrl[1]_i_1_n_0 ;
  wire \ctrl_reg[1]_0 ;
  wire fifo_rd_en;
  wire p_0_in;
  wire rotate;
  wire [31:0]s_axis_data;
  wire [31:0]\s_axis_data[31] ;
  wire s_axis_valid;

  LUT6 #(
    .INIT(64'h666F6F6F66606060)) 
    \ctrl[1]_i_1 
       (.I0(Q),
        .I1(rotate),
        .I2(\ctrl_reg[1]_0 ),
        .I3(fifo_rd_en),
        .I4(s_axis_valid),
        .I5(p_0_in),
        .O(\ctrl[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\ctrl[1]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_interconnect i_interconnect
       (.p_0_in(p_0_in),
        .s_axis_data(s_axis_data),
        .\s_axis_data[31] (\s_axis_data[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell
   (reset_data,
    reset_data_reg_0,
    fifo_rd_valid0,
    s_axis_ready,
    \s_axis_data[31] ,
    clk,
    fifo_rd_en,
    s_axis_valid,
    reset,
    D,
    s_axis_data);
  output reset_data;
  output reset_data_reg_0;
  output fifo_rd_valid0;
  output s_axis_ready;
  output [31:0]\s_axis_data[31] ;
  input clk;
  input fifo_rd_en;
  input s_axis_valid;
  input reset;
  input [1:0]D;
  input [31:0]s_axis_data;

  wire [1:0]D;
  wire ce_ctrl;
  wire clk;
  wire enable_count;
  wire \enable_count[0]_i_1_n_0 ;
  wire \enable_int_reg_n_0_[0] ;
  wire \enable_int_reg_n_0_[1] ;
  wire fifo_rd_en;
  wire fifo_rd_valid0;
  wire ready;
  wire [1:1]ready0;
  wire reset;
  wire reset_ctrl;
  wire reset_ctrl0__0;
  wire \reset_ctrl0_inferred__0/i__n_0 ;
  wire reset_data;
  wire reset_data_i_1_n_0;
  wire reset_data_reg_0;
  wire rotate;
  wire \rotate[0]_i_2_n_0 ;
  wire [31:0]s_axis_data;
  wire [31:0]\s_axis_data[31] ;
  wire s_axis_ready;
  wire s_axis_valid;
  wire startup_ctrl;
  wire startup_ctrl2;
  wire startup_ctrl_i_1_n_0;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \enable_count[0]_i_1 
       (.I0(\enable_int_reg_n_0_[0] ),
        .I1(\enable_int_reg_n_0_[1] ),
        .O(\enable_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \enable_count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\enable_count[0]_i_1_n_0 ),
        .Q(enable_count),
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
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'hB)) 
    fifo_rd_underflow_i_1
       (.I0(reset_data),
        .I1(s_axis_valid),
        .O(reset_data_reg_0));
  LUT2 #(
    .INIT(4'h2)) 
    fifo_rd_valid_i_2
       (.I0(s_axis_valid),
        .I1(reset_data),
        .O(fifo_rd_valid0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_network \gen_network[1].i_ctrl_interconnect 
       (.Q(\enable_int_reg_n_0_[0] ),
        .clk(clk),
        .\ctrl_reg[1]_0 (startup_ctrl),
        .fifo_rd_en(fifo_rd_en),
        .rotate(rotate),
        .s_axis_data(s_axis_data),
        .\s_axis_data[31] (\s_axis_data[31] ),
        .s_axis_valid(s_axis_valid));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ready_i_1
       (.I0(rotate),
        .I1(enable_count),
        .O(ready0));
  FDRE #(
    .INIT(1'b0)) 
    ready_reg
       (.C(clk),
        .CE(ce_ctrl),
        .D(ready0),
        .Q(ready),
        .R(reset_ctrl));
  LUT3 #(
    .INIT(8'hAB)) 
    reset_ctrl0
       (.I0(reset),
        .I1(D[1]),
        .I2(D[0]),
        .O(reset_ctrl0__0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    \reset_ctrl0_inferred__0/i_ 
       (.I0(D[0]),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(D[1]),
        .I3(\enable_int_reg_n_0_[1] ),
        .O(\reset_ctrl0_inferred__0/i__n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    reset_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(\reset_ctrl0_inferred__0/i__n_0 ),
        .Q(reset_ctrl),
        .S(reset_ctrl0__0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBEFFFFBF)) 
    reset_data_i_1
       (.I0(startup_ctrl2),
        .I1(D[0]),
        .I2(\enable_int_reg_n_0_[0] ),
        .I3(D[1]),
        .I4(\enable_int_reg_n_0_[1] ),
        .I5(reset),
        .O(reset_data_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reset_data_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_data_i_1_n_0),
        .Q(reset_data),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hEA)) 
    \rotate[0]_i_1 
       (.I0(startup_ctrl),
        .I1(fifo_rd_en),
        .I2(s_axis_valid),
        .O(ce_ctrl));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \rotate[0]_i_2 
       (.I0(rotate),
        .I1(enable_count),
        .O(\rotate[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rotate_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\rotate[0]_i_2_n_0 ),
        .Q(rotate),
        .R(reset_ctrl));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    s_axis_ready_INST_0
       (.I0(ready),
        .I1(fifo_rd_en),
        .I2(s_axis_valid),
        .O(s_axis_ready));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl2_reg
       (.C(clk),
        .CE(1'b1),
        .D(\reset_ctrl0_inferred__0/i__n_0 ),
        .Q(startup_ctrl2),
        .R(reset_ctrl0__0));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    startup_ctrl_i_1
       (.I0(startup_ctrl2),
        .I1(reset_ctrl),
        .I2(\enable_int_reg_n_0_[1] ),
        .I3(D[1]),
        .I4(\enable_int_reg_n_0_[0] ),
        .I5(D[0]),
        .O(startup_ctrl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(startup_ctrl_i_1_n_0),
        .Q(startup_ctrl),
        .R(reset_ctrl0__0));
endmodule

(* CHECK_LICENSE_TYPE = "system_util_dac_2_upack_0,util_upack2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "util_upack2,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset,
    enable_0,
    enable_1,
    fifo_rd_en,
    fifo_rd_valid,
    fifo_rd_underflow,
    fifo_rd_data_0,
    fifo_rd_data_1,
    s_axis_valid,
    s_axis_ready,
    s_axis_data);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_clock, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_signal_reset RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset;
  input enable_0;
  input enable_1;
  input fifo_rd_en;
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [15:0]fifo_rd_data_0;
  output [15:0]fifo_rd_data_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) input [31:0]s_axis_data;

  wire clk;
  wire enable_0;
  wire enable_1;
  wire [15:0]fifo_rd_data_0;
  wire [15:0]fifo_rd_data_1;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire reset;
  wire [31:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_upack2 inst
       (.Q({fifo_rd_data_1,fifo_rd_data_0}),
        .clk(clk),
        .enable_0(enable_0),
        .enable_1(enable_1),
        .fifo_rd_en(fifo_rd_en),
        .fifo_rd_underflow(fifo_rd_underflow),
        .fifo_rd_valid(fifo_rd_valid),
        .reset(reset),
        .s_axis_data(s_axis_data),
        .s_axis_ready(s_axis_ready),
        .s_axis_valid(s_axis_valid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_upack2
   (fifo_rd_valid,
    fifo_rd_underflow,
    Q,
    s_axis_ready,
    reset,
    enable_1,
    clk,
    enable_0,
    fifo_rd_en,
    s_axis_valid,
    s_axis_data);
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [31:0]Q;
  output s_axis_ready;
  input reset;
  input enable_1;
  input clk;
  input enable_0;
  input fifo_rd_en;
  input s_axis_valid;
  input [31:0]s_axis_data;

  wire [31:0]Q;
  wire clk;
  wire enable_0;
  wire enable_1;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire reset;
  wire [31:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_upack2_impl i_upack
       (.D({enable_1,enable_0}),
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_upack2_impl
   (fifo_rd_valid,
    fifo_rd_underflow,
    Q,
    s_axis_ready,
    reset,
    D,
    clk,
    fifo_rd_en,
    s_axis_valid,
    s_axis_data);
  output fifo_rd_valid;
  output fifo_rd_underflow;
  output [31:0]Q;
  output s_axis_ready;
  input reset;
  input [1:0]D;
  input clk;
  input fifo_rd_en;
  input s_axis_valid;
  input [31:0]s_axis_data;

  wire [1:0]D;
  wire [31:0]Q;
  wire clk;
  wire [31:0]deinterleaved_data;
  wire fifo_rd_data0_n_0;
  wire fifo_rd_en;
  wire fifo_rd_underflow;
  wire fifo_rd_valid;
  wire fifo_rd_valid0;
  wire fifo_rd_valid_i_1_n_0;
  wire i_pack_shell_n_1;
  wire reset;
  wire reset_data;
  wire [31:0]s_axis_data;
  wire s_axis_ready;
  wire s_axis_valid;

  LUT3 #(
    .INIT(8'hBA)) 
    fifo_rd_data0
       (.I0(reset_data),
        .I1(s_axis_valid),
        .I2(fifo_rd_en),
        .O(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[0] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[0]),
        .Q(Q[0]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[10] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[10]),
        .Q(Q[10]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[11] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[11]),
        .Q(Q[11]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[12] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[12]),
        .Q(Q[12]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[13] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[13]),
        .Q(Q[13]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[14] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[14]),
        .Q(Q[14]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[15] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[15]),
        .Q(Q[15]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[16] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[16]),
        .Q(Q[16]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[17] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[17]),
        .Q(Q[17]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[18] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[18]),
        .Q(Q[18]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[19] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[19]),
        .Q(Q[19]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[1] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[1]),
        .Q(Q[1]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[20] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[20]),
        .Q(Q[20]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[21] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[21]),
        .Q(Q[21]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[22] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[22]),
        .Q(Q[22]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[23] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[23]),
        .Q(Q[23]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[24] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[24]),
        .Q(Q[24]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[25] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[25]),
        .Q(Q[25]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[26] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[26]),
        .Q(Q[26]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[27] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[27]),
        .Q(Q[27]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[28] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[28]),
        .Q(Q[28]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[29] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[29]),
        .Q(Q[29]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[2] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[2]),
        .Q(Q[2]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[30] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[30]),
        .Q(Q[30]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[31] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[31]),
        .Q(Q[31]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[3] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[3]),
        .Q(Q[3]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[4] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[4]),
        .Q(Q[4]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[5] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[5]),
        .Q(Q[5]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[6] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[6]),
        .Q(Q[6]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[7] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[7]),
        .Q(Q[7]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[8] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[8]),
        .Q(Q[8]),
        .R(fifo_rd_data0_n_0));
  FDRE \fifo_rd_data_reg[9] 
       (.C(clk),
        .CE(fifo_rd_en),
        .D(deinterleaved_data[9]),
        .Q(Q[9]),
        .R(fifo_rd_data0_n_0));
  FDRE fifo_rd_underflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(i_pack_shell_n_1),
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pack_shell i_pack_shell
       (.D(D),
        .clk(clk),
        .fifo_rd_en(fifo_rd_en),
        .fifo_rd_valid0(fifo_rd_valid0),
        .reset(reset),
        .reset_data(reset_data),
        .reset_data_reg_0(i_pack_shell_n_1),
        .s_axis_data(s_axis_data),
        .\s_axis_data[31] (deinterleaved_data),
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
