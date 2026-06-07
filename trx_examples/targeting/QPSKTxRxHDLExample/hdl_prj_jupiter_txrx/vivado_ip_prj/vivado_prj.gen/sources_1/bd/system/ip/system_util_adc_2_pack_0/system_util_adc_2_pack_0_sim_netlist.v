// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:18:07 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top system_util_adc_2_pack_0 -prefix
//               system_util_adc_2_pack_0_ system_util_adc_1_pack_0_sim_netlist.v
// Design      : system_util_adc_1_pack_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_util_adc_2_pack_0_pack_network
   (E,
    \fifo_wr_data_1[15] ,
    D,
    Q,
    fifo_wr_en,
    \ctrl_reg[0]_0 ,
    \ctrl_reg[0]_1 ,
    \ctrl_reg[0]_2 ,
    \ctrl_reg[1]_0 ,
    clk,
    \packed_fifo_wr_data_reg[31] ,
    \packed_fifo_wr_data_reg[31]_0 ,
    fifo_wr_data_1,
    fifo_wr_data_0,
    fifo_wr_data_3,
    fifo_wr_data_2);
  output [0:0]E;
  output [63:0]\fifo_wr_data_1[15] ;
  output [31:0]D;
  input Q;
  input fifo_wr_en;
  input [1:0]\ctrl_reg[0]_0 ;
  input [1:0]\ctrl_reg[0]_1 ;
  input [0:0]\ctrl_reg[0]_2 ;
  input [1:0]\ctrl_reg[1]_0 ;
  input clk;
  input [31:0]\packed_fifo_wr_data_reg[31] ;
  input [1:0]\packed_fifo_wr_data_reg[31]_0 ;
  input [15:0]fifo_wr_data_1;
  input [15:0]fifo_wr_data_0;
  input [15:0]fifo_wr_data_3;
  input [15:0]fifo_wr_data_2;

  wire [31:0]D;
  wire [0:0]E;
  wire Q;
  wire clk;
  wire \ctrl[1]_i_2_n_0 ;
  wire \ctrl[3]_i_2_n_0 ;
  wire \ctrl[5]_i_2_n_0 ;
  wire \ctrl[7]_i_2_n_0 ;
  wire [7:0]ctrl_;
  wire [1:0]\ctrl_reg[0]_0 ;
  wire [1:0]\ctrl_reg[0]_1 ;
  wire [0:0]\ctrl_reg[0]_2 ;
  wire [1:0]\ctrl_reg[1]_0 ;
  wire [7:0]ctrl_s;
  wire [15:0]fifo_wr_data_0;
  wire [15:0]fifo_wr_data_1;
  wire [63:0]\fifo_wr_data_1[15] ;
  wire [15:0]fifo_wr_data_2;
  wire [15:0]fifo_wr_data_3;
  wire fifo_wr_en;
  wire [31:0]\packed_fifo_wr_data_reg[31] ;
  wire [1:0]\packed_fifo_wr_data_reg[31]_0 ;

  LUT6 #(
    .INIT(64'hFFFFFFFFB7E0B7ED)) 
    \ctrl[0]_i_1 
       (.I0(\ctrl_reg[0]_0 [1]),
        .I1(\ctrl_reg[0]_0 [0]),
        .I2(\ctrl_reg[0]_1 [1]),
        .I3(\ctrl_reg[0]_1 [0]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl[1]_i_2_n_0 ),
        .O(ctrl_s[0]));
  LUT6 #(
    .INIT(64'hBAFFFFFFFFAEFFAE)) 
    \ctrl[1]_i_1 
       (.I0(\ctrl[1]_i_2_n_0 ),
        .I1(\ctrl_reg[0]_0 [1]),
        .I2(\ctrl_reg[0]_0 [0]),
        .I3(\ctrl_reg[0]_1 [1]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl_reg[0]_1 [0]),
        .O(ctrl_s[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0960)) 
    \ctrl[1]_i_2 
       (.I0(\ctrl_reg[1]_0 [1]),
        .I1(\ctrl_reg[0]_1 [1]),
        .I2(\ctrl_reg[1]_0 [0]),
        .I3(\ctrl_reg[0]_1 [0]),
        .O(\ctrl[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFE07BED7B)) 
    \ctrl[2]_i_1 
       (.I0(\ctrl_reg[0]_0 [1]),
        .I1(\ctrl_reg[0]_0 [0]),
        .I2(\ctrl_reg[0]_1 [1]),
        .I3(\ctrl_reg[0]_1 [0]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl[3]_i_2_n_0 ),
        .O(ctrl_s[2]));
  LUT6 #(
    .INIT(64'hFFAEFFBAFFAEFFFF)) 
    \ctrl[3]_i_1 
       (.I0(\ctrl[3]_i_2_n_0 ),
        .I1(\ctrl_reg[0]_0 [1]),
        .I2(\ctrl_reg[0]_0 [0]),
        .I3(\ctrl_reg[0]_1 [1]),
        .I4(\ctrl_reg[0]_1 [0]),
        .I5(\ctrl_reg[0]_2 ),
        .O(ctrl_s[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6006)) 
    \ctrl[3]_i_2 
       (.I0(\ctrl_reg[1]_0 [1]),
        .I1(\ctrl_reg[0]_1 [1]),
        .I2(\ctrl_reg[0]_1 [0]),
        .I3(\ctrl_reg[1]_0 [0]),
        .O(\ctrl[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7B0E7BDE)) 
    \ctrl[4]_i_1 
       (.I0(\ctrl_reg[0]_0 [1]),
        .I1(\ctrl_reg[0]_0 [0]),
        .I2(\ctrl_reg[0]_1 [1]),
        .I3(\ctrl_reg[0]_1 [0]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl[5]_i_2_n_0 ),
        .O(ctrl_s[4]));
  LUT6 #(
    .INIT(64'hFFBAFFFFAEFFAEFF)) 
    \ctrl[5]_i_1 
       (.I0(\ctrl[5]_i_2_n_0 ),
        .I1(\ctrl_reg[0]_0 [1]),
        .I2(\ctrl_reg[0]_0 [0]),
        .I3(\ctrl_reg[0]_1 [1]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl_reg[0]_1 [0]),
        .O(ctrl_s[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0690)) 
    \ctrl[5]_i_2 
       (.I0(\ctrl_reg[1]_0 [1]),
        .I1(\ctrl_reg[0]_1 [1]),
        .I2(\ctrl_reg[1]_0 [0]),
        .I3(\ctrl_reg[0]_1 [0]),
        .O(\ctrl[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0EB7DEB7)) 
    \ctrl[6]_i_1 
       (.I0(\ctrl_reg[0]_0 [1]),
        .I1(\ctrl_reg[0]_0 [0]),
        .I2(\ctrl_reg[0]_1 [1]),
        .I3(\ctrl_reg[0]_1 [0]),
        .I4(\ctrl_reg[0]_2 ),
        .I5(\ctrl[7]_i_2_n_0 ),
        .O(ctrl_s[6]));
  LUT6 #(
    .INIT(64'hAEFFBAFFAEFFFFFF)) 
    \ctrl[7]_i_1 
       (.I0(\ctrl[7]_i_2_n_0 ),
        .I1(\ctrl_reg[0]_0 [1]),
        .I2(\ctrl_reg[0]_0 [0]),
        .I3(\ctrl_reg[0]_1 [1]),
        .I4(\ctrl_reg[0]_1 [0]),
        .I5(\ctrl_reg[0]_2 ),
        .O(ctrl_s[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    \ctrl[7]_i_2 
       (.I0(\ctrl_reg[1]_0 [1]),
        .I1(\ctrl_reg[0]_1 [1]),
        .I2(\ctrl_reg[0]_1 [0]),
        .I3(\ctrl_reg[1]_0 [0]),
        .O(\ctrl[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[0] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[0]),
        .Q(ctrl_[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[1] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[1]),
        .Q(ctrl_[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[2] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[2]),
        .Q(ctrl_[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[3] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[3]),
        .Q(ctrl_[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[4] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[4]),
        .Q(ctrl_[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[5] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[5]),
        .Q(ctrl_[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[6] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[6]),
        .Q(ctrl_[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg[7] 
       (.C(clk),
        .CE(E),
        .D(ctrl_s[7]),
        .Q(ctrl_[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[0]_i_1 
       (.I0(fifo_wr_data_1[0]),
        .I1(fifo_wr_data_0[0]),
        .I2(fifo_wr_data_3[0]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[10]_i_1 
       (.I0(fifo_wr_data_1[10]),
        .I1(fifo_wr_data_0[10]),
        .I2(fifo_wr_data_3[10]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[11]_i_1 
       (.I0(fifo_wr_data_1[11]),
        .I1(fifo_wr_data_0[11]),
        .I2(fifo_wr_data_3[11]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[12]_i_1 
       (.I0(fifo_wr_data_1[12]),
        .I1(fifo_wr_data_0[12]),
        .I2(fifo_wr_data_3[12]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[12]),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[13]_i_1 
       (.I0(fifo_wr_data_1[13]),
        .I1(fifo_wr_data_0[13]),
        .I2(fifo_wr_data_3[13]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[13]),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[14]_i_1 
       (.I0(fifo_wr_data_1[14]),
        .I1(fifo_wr_data_0[14]),
        .I2(fifo_wr_data_3[14]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[14]),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[15]_i_1 
       (.I0(fifo_wr_data_1[15]),
        .I1(fifo_wr_data_0[15]),
        .I2(fifo_wr_data_3[15]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[15]),
        .O(D[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[16]_i_1 
       (.I0(fifo_wr_data_1[0]),
        .I1(fifo_wr_data_0[0]),
        .I2(fifo_wr_data_3[0]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[0]),
        .O(D[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[17]_i_1 
       (.I0(fifo_wr_data_1[1]),
        .I1(fifo_wr_data_0[1]),
        .I2(fifo_wr_data_3[1]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[1]),
        .O(D[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[18]_i_1 
       (.I0(fifo_wr_data_1[2]),
        .I1(fifo_wr_data_0[2]),
        .I2(fifo_wr_data_3[2]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[2]),
        .O(D[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[19]_i_1 
       (.I0(fifo_wr_data_1[3]),
        .I1(fifo_wr_data_0[3]),
        .I2(fifo_wr_data_3[3]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[3]),
        .O(D[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[1]_i_1 
       (.I0(fifo_wr_data_1[1]),
        .I1(fifo_wr_data_0[1]),
        .I2(fifo_wr_data_3[1]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[20]_i_1 
       (.I0(fifo_wr_data_1[4]),
        .I1(fifo_wr_data_0[4]),
        .I2(fifo_wr_data_3[4]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[4]),
        .O(D[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[21]_i_1 
       (.I0(fifo_wr_data_1[5]),
        .I1(fifo_wr_data_0[5]),
        .I2(fifo_wr_data_3[5]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[5]),
        .O(D[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[22]_i_1 
       (.I0(fifo_wr_data_1[6]),
        .I1(fifo_wr_data_0[6]),
        .I2(fifo_wr_data_3[6]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[6]),
        .O(D[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[23]_i_1 
       (.I0(fifo_wr_data_1[7]),
        .I1(fifo_wr_data_0[7]),
        .I2(fifo_wr_data_3[7]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[7]),
        .O(D[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[24]_i_1 
       (.I0(fifo_wr_data_1[8]),
        .I1(fifo_wr_data_0[8]),
        .I2(fifo_wr_data_3[8]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[8]),
        .O(D[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[25]_i_1 
       (.I0(fifo_wr_data_1[9]),
        .I1(fifo_wr_data_0[9]),
        .I2(fifo_wr_data_3[9]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[9]),
        .O(D[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[26]_i_1 
       (.I0(fifo_wr_data_1[10]),
        .I1(fifo_wr_data_0[10]),
        .I2(fifo_wr_data_3[10]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[10]),
        .O(D[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[27]_i_1 
       (.I0(fifo_wr_data_1[11]),
        .I1(fifo_wr_data_0[11]),
        .I2(fifo_wr_data_3[11]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[11]),
        .O(D[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[28]_i_1 
       (.I0(fifo_wr_data_1[12]),
        .I1(fifo_wr_data_0[12]),
        .I2(fifo_wr_data_3[12]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[12]),
        .O(D[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[29]_i_1 
       (.I0(fifo_wr_data_1[13]),
        .I1(fifo_wr_data_0[13]),
        .I2(fifo_wr_data_3[13]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[13]),
        .O(D[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[2]_i_1 
       (.I0(fifo_wr_data_1[2]),
        .I1(fifo_wr_data_0[2]),
        .I2(fifo_wr_data_3[2]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[30]_i_1 
       (.I0(fifo_wr_data_1[14]),
        .I1(fifo_wr_data_0[14]),
        .I2(fifo_wr_data_3[14]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[14]),
        .O(D[30]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[31]_i_1 
       (.I0(fifo_wr_data_1[15]),
        .I1(fifo_wr_data_0[15]),
        .I2(fifo_wr_data_3[15]),
        .I3(ctrl_[3]),
        .I4(ctrl_[2]),
        .I5(fifo_wr_data_2[15]),
        .O(D[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[3]_i_1 
       (.I0(fifo_wr_data_1[3]),
        .I1(fifo_wr_data_0[3]),
        .I2(fifo_wr_data_3[3]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[4]_i_1 
       (.I0(fifo_wr_data_1[4]),
        .I1(fifo_wr_data_0[4]),
        .I2(fifo_wr_data_3[4]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[5]_i_1 
       (.I0(fifo_wr_data_1[5]),
        .I1(fifo_wr_data_0[5]),
        .I2(fifo_wr_data_3[5]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[6]_i_1 
       (.I0(fifo_wr_data_1[6]),
        .I1(fifo_wr_data_0[6]),
        .I2(fifo_wr_data_3[6]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[7]_i_1 
       (.I0(fifo_wr_data_1[7]),
        .I1(fifo_wr_data_0[7]),
        .I2(fifo_wr_data_3[7]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[8]_i_1 
       (.I0(fifo_wr_data_1[8]),
        .I1(fifo_wr_data_0[8]),
        .I2(fifo_wr_data_3[8]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \gen_pack.gen_output_buffer.data_d1[9]_i_1 
       (.I0(fifo_wr_data_1[9]),
        .I1(fifo_wr_data_0[9]),
        .I2(fifo_wr_data_3[9]),
        .I3(ctrl_[1]),
        .I4(ctrl_[0]),
        .I5(fifo_wr_data_2[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[0]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [0]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[0]),
        .O(\fifo_wr_data_1[15] [0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[10]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [10]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[10]),
        .O(\fifo_wr_data_1[15] [10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[11]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [11]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[11]),
        .O(\fifo_wr_data_1[15] [11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[12]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [12]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[12]),
        .O(\fifo_wr_data_1[15] [12]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[13]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [13]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[13]),
        .O(\fifo_wr_data_1[15] [13]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[14]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [14]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[14]),
        .O(\fifo_wr_data_1[15] [14]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[15]_i_2 
       (.I0(\packed_fifo_wr_data_reg[31] [15]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[15]),
        .O(\fifo_wr_data_1[15] [15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[16]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [16]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[16]),
        .O(\fifo_wr_data_1[15] [16]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[17]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [17]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[17]),
        .O(\fifo_wr_data_1[15] [17]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[18]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [18]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[18]),
        .O(\fifo_wr_data_1[15] [18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[19]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [19]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[19]),
        .O(\fifo_wr_data_1[15] [19]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[1]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [1]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[1]),
        .O(\fifo_wr_data_1[15] [1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[20]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [20]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[20]),
        .O(\fifo_wr_data_1[15] [20]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[21]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [21]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[21]),
        .O(\fifo_wr_data_1[15] [21]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[22]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [22]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[22]),
        .O(\fifo_wr_data_1[15] [22]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[23]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [23]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[23]),
        .O(\fifo_wr_data_1[15] [23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[24]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [24]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[24]),
        .O(\fifo_wr_data_1[15] [24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[25]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [25]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[25]),
        .O(\fifo_wr_data_1[15] [25]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[26]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [26]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[26]),
        .O(\fifo_wr_data_1[15] [26]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[27]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [27]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[27]),
        .O(\fifo_wr_data_1[15] [27]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[28]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [28]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[28]),
        .O(\fifo_wr_data_1[15] [28]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[29]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [29]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[29]),
        .O(\fifo_wr_data_1[15] [29]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[2]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [2]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[2]),
        .O(\fifo_wr_data_1[15] [2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[30]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [30]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[30]),
        .O(\fifo_wr_data_1[15] [30]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[31]_i_2 
       (.I0(\packed_fifo_wr_data_reg[31] [31]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [1]),
        .I2(D[31]),
        .O(\fifo_wr_data_1[15] [31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[32]_i_1 
       (.I0(fifo_wr_data_1[0]),
        .I1(fifo_wr_data_0[0]),
        .I2(fifo_wr_data_3[0]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[0]),
        .O(\fifo_wr_data_1[15] [32]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[33]_i_1 
       (.I0(fifo_wr_data_1[1]),
        .I1(fifo_wr_data_0[1]),
        .I2(fifo_wr_data_3[1]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[1]),
        .O(\fifo_wr_data_1[15] [33]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[34]_i_1 
       (.I0(fifo_wr_data_1[2]),
        .I1(fifo_wr_data_0[2]),
        .I2(fifo_wr_data_3[2]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[2]),
        .O(\fifo_wr_data_1[15] [34]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[35]_i_1 
       (.I0(fifo_wr_data_1[3]),
        .I1(fifo_wr_data_0[3]),
        .I2(fifo_wr_data_3[3]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[3]),
        .O(\fifo_wr_data_1[15] [35]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[36]_i_1 
       (.I0(fifo_wr_data_1[4]),
        .I1(fifo_wr_data_0[4]),
        .I2(fifo_wr_data_3[4]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[4]),
        .O(\fifo_wr_data_1[15] [36]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[37]_i_1 
       (.I0(fifo_wr_data_1[5]),
        .I1(fifo_wr_data_0[5]),
        .I2(fifo_wr_data_3[5]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[5]),
        .O(\fifo_wr_data_1[15] [37]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[38]_i_1 
       (.I0(fifo_wr_data_1[6]),
        .I1(fifo_wr_data_0[6]),
        .I2(fifo_wr_data_3[6]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[6]),
        .O(\fifo_wr_data_1[15] [38]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[39]_i_1 
       (.I0(fifo_wr_data_1[7]),
        .I1(fifo_wr_data_0[7]),
        .I2(fifo_wr_data_3[7]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[7]),
        .O(\fifo_wr_data_1[15] [39]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[3]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [3]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[3]),
        .O(\fifo_wr_data_1[15] [3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[40]_i_1 
       (.I0(fifo_wr_data_1[8]),
        .I1(fifo_wr_data_0[8]),
        .I2(fifo_wr_data_3[8]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[8]),
        .O(\fifo_wr_data_1[15] [40]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[41]_i_1 
       (.I0(fifo_wr_data_1[9]),
        .I1(fifo_wr_data_0[9]),
        .I2(fifo_wr_data_3[9]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[9]),
        .O(\fifo_wr_data_1[15] [41]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[42]_i_1 
       (.I0(fifo_wr_data_1[10]),
        .I1(fifo_wr_data_0[10]),
        .I2(fifo_wr_data_3[10]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[10]),
        .O(\fifo_wr_data_1[15] [42]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[43]_i_1 
       (.I0(fifo_wr_data_1[11]),
        .I1(fifo_wr_data_0[11]),
        .I2(fifo_wr_data_3[11]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[11]),
        .O(\fifo_wr_data_1[15] [43]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[44]_i_1 
       (.I0(fifo_wr_data_1[12]),
        .I1(fifo_wr_data_0[12]),
        .I2(fifo_wr_data_3[12]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[12]),
        .O(\fifo_wr_data_1[15] [44]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[45]_i_1 
       (.I0(fifo_wr_data_1[13]),
        .I1(fifo_wr_data_0[13]),
        .I2(fifo_wr_data_3[13]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[13]),
        .O(\fifo_wr_data_1[15] [45]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[46]_i_1 
       (.I0(fifo_wr_data_1[14]),
        .I1(fifo_wr_data_0[14]),
        .I2(fifo_wr_data_3[14]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[14]),
        .O(\fifo_wr_data_1[15] [46]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[47]_i_2 
       (.I0(fifo_wr_data_1[15]),
        .I1(fifo_wr_data_0[15]),
        .I2(fifo_wr_data_3[15]),
        .I3(ctrl_[5]),
        .I4(ctrl_[4]),
        .I5(fifo_wr_data_2[15]),
        .O(\fifo_wr_data_1[15] [47]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[48]_i_1 
       (.I0(fifo_wr_data_1[0]),
        .I1(fifo_wr_data_0[0]),
        .I2(fifo_wr_data_3[0]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[0]),
        .O(\fifo_wr_data_1[15] [48]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[49]_i_1 
       (.I0(fifo_wr_data_1[1]),
        .I1(fifo_wr_data_0[1]),
        .I2(fifo_wr_data_3[1]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[1]),
        .O(\fifo_wr_data_1[15] [49]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[4]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [4]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[4]),
        .O(\fifo_wr_data_1[15] [4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[50]_i_1 
       (.I0(fifo_wr_data_1[2]),
        .I1(fifo_wr_data_0[2]),
        .I2(fifo_wr_data_3[2]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[2]),
        .O(\fifo_wr_data_1[15] [50]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[51]_i_1 
       (.I0(fifo_wr_data_1[3]),
        .I1(fifo_wr_data_0[3]),
        .I2(fifo_wr_data_3[3]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[3]),
        .O(\fifo_wr_data_1[15] [51]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[52]_i_1 
       (.I0(fifo_wr_data_1[4]),
        .I1(fifo_wr_data_0[4]),
        .I2(fifo_wr_data_3[4]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[4]),
        .O(\fifo_wr_data_1[15] [52]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[53]_i_1 
       (.I0(fifo_wr_data_1[5]),
        .I1(fifo_wr_data_0[5]),
        .I2(fifo_wr_data_3[5]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[5]),
        .O(\fifo_wr_data_1[15] [53]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[54]_i_1 
       (.I0(fifo_wr_data_1[6]),
        .I1(fifo_wr_data_0[6]),
        .I2(fifo_wr_data_3[6]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[6]),
        .O(\fifo_wr_data_1[15] [54]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[55]_i_1 
       (.I0(fifo_wr_data_1[7]),
        .I1(fifo_wr_data_0[7]),
        .I2(fifo_wr_data_3[7]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[7]),
        .O(\fifo_wr_data_1[15] [55]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[56]_i_1 
       (.I0(fifo_wr_data_1[8]),
        .I1(fifo_wr_data_0[8]),
        .I2(fifo_wr_data_3[8]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[8]),
        .O(\fifo_wr_data_1[15] [56]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[57]_i_1 
       (.I0(fifo_wr_data_1[9]),
        .I1(fifo_wr_data_0[9]),
        .I2(fifo_wr_data_3[9]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[9]),
        .O(\fifo_wr_data_1[15] [57]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[58]_i_1 
       (.I0(fifo_wr_data_1[10]),
        .I1(fifo_wr_data_0[10]),
        .I2(fifo_wr_data_3[10]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[10]),
        .O(\fifo_wr_data_1[15] [58]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[59]_i_1 
       (.I0(fifo_wr_data_1[11]),
        .I1(fifo_wr_data_0[11]),
        .I2(fifo_wr_data_3[11]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[11]),
        .O(\fifo_wr_data_1[15] [59]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[5]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [5]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[5]),
        .O(\fifo_wr_data_1[15] [5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[60]_i_1 
       (.I0(fifo_wr_data_1[12]),
        .I1(fifo_wr_data_0[12]),
        .I2(fifo_wr_data_3[12]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[12]),
        .O(\fifo_wr_data_1[15] [60]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[61]_i_1 
       (.I0(fifo_wr_data_1[13]),
        .I1(fifo_wr_data_0[13]),
        .I2(fifo_wr_data_3[13]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[13]),
        .O(\fifo_wr_data_1[15] [61]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[62]_i_1 
       (.I0(fifo_wr_data_1[14]),
        .I1(fifo_wr_data_0[14]),
        .I2(fifo_wr_data_3[14]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[14]),
        .O(\fifo_wr_data_1[15] [62]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \packed_fifo_wr_data[63]_i_2 
       (.I0(fifo_wr_data_1[15]),
        .I1(fifo_wr_data_0[15]),
        .I2(fifo_wr_data_3[15]),
        .I3(ctrl_[7]),
        .I4(ctrl_[6]),
        .I5(fifo_wr_data_2[15]),
        .O(\fifo_wr_data_1[15] [63]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[6]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [6]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[6]),
        .O(\fifo_wr_data_1[15] [6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[7]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [7]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[7]),
        .O(\fifo_wr_data_1[15] [7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[8]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [8]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[8]),
        .O(\fifo_wr_data_1[15] [8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \packed_fifo_wr_data[9]_i_1 
       (.I0(\packed_fifo_wr_data_reg[31] [9]),
        .I1(\packed_fifo_wr_data_reg[31]_0 [0]),
        .I2(D[9]),
        .O(\fifo_wr_data_1[15] [9]));
  LUT2 #(
    .INIT(4'hE)) 
    \rotate[1]_i_1 
       (.I0(Q),
        .I1(fifo_wr_en),
        .O(E));
endmodule

module system_util_adc_2_pack_0_pack_shell
   (reset_data,
    \fifo_wr_data_1[15] ,
    fifo_wr_en_0,
    packed_fifo_wr_en0,
    E,
    clk,
    reset,
    D,
    fifo_wr_en,
    fifo_wr_data_1,
    fifo_wr_data_0,
    fifo_wr_data_3,
    fifo_wr_data_2);
  output reset_data;
  output [63:0]\fifo_wr_data_1[15] ;
  output fifo_wr_en_0;
  output packed_fifo_wr_en0;
  output [3:0]E;
  input clk;
  input reset;
  input [3:0]D;
  input fifo_wr_en;
  input [15:0]fifo_wr_data_1;
  input [15:0]fifo_wr_data_0;
  input [15:0]fifo_wr_data_3;
  input [15:0]fifo_wr_data_2;

  wire [3:0]D;
  wire [3:0]E;
  wire ce_ctrl;
  wire clk;
  wire [1:0]enable_count;
  wire \enable_count[0]_i_1_n_0 ;
  wire \enable_count[1]_i_1_n_0 ;
  wire \enable_int_reg_n_0_[0] ;
  wire \enable_int_reg_n_0_[1] ;
  wire \enable_int_reg_n_0_[2] ;
  wire \enable_int_reg_n_0_[3] ;
  wire [15:0]fifo_wr_data_0;
  wire [15:0]fifo_wr_data_1;
  wire [63:0]\fifo_wr_data_1[15] ;
  wire [15:0]fifo_wr_data_2;
  wire [15:0]fifo_wr_data_3;
  wire fifo_wr_en;
  wire fifo_wr_en_0;
  wire [31:0]\gen_pack.gen_output_buffer.data_d1 ;
  wire [1:0]\gen_pack.gen_output_buffer.prev_valid_d1 ;
  wire \gen_pack.gen_output_buffer.sync_i_1_n_0 ;
  wire [1:0]\gen_pack.prev_valid ;
  wire \gen_pack.prev_valid[0]_i_1_n_0 ;
  wire \gen_pack.prev_valid[1]_i_1_n_0 ;
  wire \gen_pack.valid[0]_i_1_n_0 ;
  wire \gen_pack.valid[1]_i_1_n_0 ;
  wire \gen_pack.valid[2]_i_1_n_0 ;
  wire \gen_pack.valid[3]_i_1_n_0 ;
  wire \gen_pack.valid_reg_n_0_[0] ;
  wire \gen_pack.valid_reg_n_0_[2] ;
  wire \gen_pack.valid_reg_n_0_[3] ;
  wire [1:0]\gen_prefix_count[2].prefix_count_reg ;
  wire [1:0]\gen_prefix_count[3].prefix_count_reg ;
  wire out_sync;
  wire [31:0]p_1_in;
  wire packed_fifo_wr_data1;
  wire packed_fifo_wr_en0;
  wire [1:0]\prefix_count_s[2] ;
  wire [1:0]\prefix_count_s[3] ;
  wire ready;
  wire [2:0]ready0;
  wire reset;
  wire reset_ctrl;
  wire reset_ctrl0;
  wire reset_ctrl_i_2_n_0;
  wire reset_ctrl_i_3_n_0;
  wire reset_data;
  wire reset_data_i_1_n_0;
  wire [1:0]rotate;
  wire startup_ctrl;
  wire startup_ctrl2;
  wire startup_ctrl_i_1_n_0;
  wire startup_ctrl_i_2_n_0;

  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \enable_count[0]_i_1 
       (.I0(\enable_int_reg_n_0_[3] ),
        .I1(\enable_int_reg_n_0_[1] ),
        .I2(\enable_int_reg_n_0_[0] ),
        .I3(\enable_int_reg_n_0_[2] ),
        .O(\enable_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hE881)) 
    \enable_count[1]_i_1 
       (.I0(\enable_int_reg_n_0_[2] ),
        .I1(\enable_int_reg_n_0_[1] ),
        .I2(\enable_int_reg_n_0_[0] ),
        .I3(\enable_int_reg_n_0_[3] ),
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
  system_util_adc_2_pack_0_pack_network \gen_network[0].i_ctrl_interconnect 
       (.D(p_1_in),
        .E(ce_ctrl),
        .Q(startup_ctrl),
        .clk(clk),
        .\ctrl_reg[0]_0 (\gen_prefix_count[2].prefix_count_reg ),
        .\ctrl_reg[0]_1 (rotate),
        .\ctrl_reg[0]_2 (\enable_int_reg_n_0_[0] ),
        .\ctrl_reg[1]_0 (\gen_prefix_count[3].prefix_count_reg ),
        .fifo_wr_data_0(fifo_wr_data_0),
        .fifo_wr_data_1(fifo_wr_data_1),
        .\fifo_wr_data_1[15] (\fifo_wr_data_1[15] ),
        .fifo_wr_data_2(fifo_wr_data_2),
        .fifo_wr_data_3(fifo_wr_data_3),
        .fifo_wr_en(fifo_wr_en),
        .\packed_fifo_wr_data_reg[31] (\gen_pack.gen_output_buffer.data_d1 ),
        .\packed_fifo_wr_data_reg[31]_0 (\gen_pack.gen_output_buffer.prev_valid_d1 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[0] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[0]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[10] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[10]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[11] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[11]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[12] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[12]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[13] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[13]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[14] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[14]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[15] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[15]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[16] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[16]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[17] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[17]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[18] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[18]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[19] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[19]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[1] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[1]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[20] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[20]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[21] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[21]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[22] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[22]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[23] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[23]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[24] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[24]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[25] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[25]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[26] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[26]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[27] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[27]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[28] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[28]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[29] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[29]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[2] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[2]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[30] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[30]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[31] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[31]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[3] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[3]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[4] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[4]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[5] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[5]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[6] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[6]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[7] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[7]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[8] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[8]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.data_d1_reg[9] 
       (.C(clk),
        .CE(fifo_wr_en),
        .D(p_1_in[9]),
        .Q(\gen_pack.gen_output_buffer.data_d1 [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.prev_valid_d1_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.prev_valid [0]),
        .Q(\gen_pack.gen_output_buffer.prev_valid_d1 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.gen_output_buffer.prev_valid_d1_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.prev_valid [1]),
        .Q(\gen_pack.gen_output_buffer.prev_valid_d1 [1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAEEEAEEEAEEEFEEE)) 
    \gen_pack.gen_output_buffer.sync_i_1 
       (.I0(reset_ctrl),
        .I1(out_sync),
        .I2(ready),
        .I3(fifo_wr_en),
        .I4(rotate[0]),
        .I5(rotate[1]),
        .O(\gen_pack.gen_output_buffer.sync_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \gen_pack.gen_output_buffer.sync_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gen_pack.gen_output_buffer.sync_i_1_n_0 ),
        .Q(out_sync),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    \gen_pack.prev_valid[0]_i_1 
       (.I0(enable_count[1]),
        .I1(rotate[0]),
        .I2(enable_count[0]),
        .I3(rotate[1]),
        .O(\gen_pack.prev_valid[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    \gen_pack.prev_valid[1]_i_1 
       (.I0(rotate[1]),
        .I1(enable_count[1]),
        .I2(enable_count[0]),
        .I3(rotate[0]),
        .O(\gen_pack.prev_valid[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.prev_valid_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.prev_valid[0]_i_1_n_0 ),
        .Q(\gen_pack.prev_valid [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.prev_valid_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.prev_valid[1]_i_1_n_0 ),
        .Q(\gen_pack.prev_valid [1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hF1)) 
    \gen_pack.valid[0]_i_1 
       (.I0(rotate[1]),
        .I1(rotate[0]),
        .I2(\gen_pack.prev_valid [0]),
        .O(\gen_pack.valid[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFFFF5554)) 
    \gen_pack.valid[1]_i_1 
       (.I0(rotate[1]),
        .I1(rotate[0]),
        .I2(enable_count[1]),
        .I3(enable_count[0]),
        .I4(\gen_pack.prev_valid [1]),
        .O(\gen_pack.valid[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h5F4A)) 
    \gen_pack.valid[2]_i_1 
       (.I0(rotate[1]),
        .I1(enable_count[0]),
        .I2(rotate[0]),
        .I3(enable_count[1]),
        .O(\gen_pack.valid[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hFEA8)) 
    \gen_pack.valid[3]_i_1 
       (.I0(rotate[1]),
        .I1(rotate[0]),
        .I2(enable_count[0]),
        .I3(enable_count[1]),
        .O(\gen_pack.valid[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.valid_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.valid[0]_i_1_n_0 ),
        .Q(\gen_pack.valid_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.valid_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.valid[1]_i_1_n_0 ),
        .Q(packed_fifo_wr_data1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.valid_reg[2] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.valid[2]_i_1_n_0 ),
        .Q(\gen_pack.valid_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pack.valid_reg[3] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(\gen_pack.valid[3]_i_1_n_0 ),
        .Q(\gen_pack.valid_reg_n_0_[3] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \gen_prefix_count[2].prefix_count[4]_i_1 
       (.I0(\enable_int_reg_n_0_[1] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .O(\prefix_count_s[2] [0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \gen_prefix_count[2].prefix_count[5]_i_1 
       (.I0(\enable_int_reg_n_0_[0] ),
        .I1(\enable_int_reg_n_0_[1] ),
        .O(\prefix_count_s[2] [1]));
  FDRE \gen_prefix_count[2].prefix_count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\prefix_count_s[2] [0]),
        .Q(\gen_prefix_count[2].prefix_count_reg [0]),
        .R(1'b0));
  FDRE \gen_prefix_count[2].prefix_count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\prefix_count_s[2] [1]),
        .Q(\gen_prefix_count[2].prefix_count_reg [1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \gen_prefix_count[3].prefix_count[6]_i_1 
       (.I0(\enable_int_reg_n_0_[0] ),
        .I1(\enable_int_reg_n_0_[1] ),
        .I2(\enable_int_reg_n_0_[2] ),
        .O(\prefix_count_s[3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h17)) 
    \gen_prefix_count[3].prefix_count[7]_i_1 
       (.I0(\enable_int_reg_n_0_[2] ),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(\enable_int_reg_n_0_[1] ),
        .O(\prefix_count_s[3] [1]));
  FDRE \gen_prefix_count[3].prefix_count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\prefix_count_s[3] [0]),
        .Q(\gen_prefix_count[3].prefix_count_reg [0]),
        .R(1'b0));
  FDRE \gen_prefix_count[3].prefix_count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\prefix_count_s[3] [1]),
        .Q(\gen_prefix_count[3].prefix_count_reg [1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \packed_fifo_wr_data[15]_i_1 
       (.I0(fifo_wr_en),
        .I1(\gen_pack.valid_reg_n_0_[0] ),
        .O(E[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \packed_fifo_wr_data[31]_i_1 
       (.I0(fifo_wr_en),
        .I1(packed_fifo_wr_data1),
        .O(E[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \packed_fifo_wr_data[47]_i_1 
       (.I0(fifo_wr_en),
        .I1(\gen_pack.valid_reg_n_0_[2] ),
        .O(E[2]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \packed_fifo_wr_data[63]_i_1 
       (.I0(fifo_wr_en),
        .I1(\gen_pack.valid_reg_n_0_[3] ),
        .O(E[3]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    packed_fifo_wr_en_i_1
       (.I0(ready),
        .I1(fifo_wr_en),
        .O(packed_fifo_wr_en0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h80)) 
    packed_sync_i_1
       (.I0(fifo_wr_en),
        .I1(ready),
        .I2(out_sync),
        .O(fifo_wr_en_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hFEE0)) 
    ready_i_1
       (.I0(rotate[0]),
        .I1(enable_count[0]),
        .I2(enable_count[1]),
        .I3(rotate[1]),
        .O(ready0[2]));
  FDRE #(
    .INIT(1'b0)) 
    ready_reg
       (.C(clk),
        .CE(ce_ctrl),
        .D(ready0[2]),
        .Q(ready),
        .R(reset_ctrl));
  LUT5 #(
    .INIT(32'hFFFF0001)) 
    reset_ctrl_i_1
       (.I0(D[2]),
        .I1(D[3]),
        .I2(D[0]),
        .I3(D[1]),
        .I4(reset),
        .O(reset_ctrl0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFFFF6FF6)) 
    reset_ctrl_i_2
       (.I0(\enable_int_reg_n_0_[1] ),
        .I1(D[1]),
        .I2(\enable_int_reg_n_0_[2] ),
        .I3(D[2]),
        .I4(reset_ctrl_i_3_n_0),
        .O(reset_ctrl_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    reset_ctrl_i_3
       (.I0(D[0]),
        .I1(\enable_int_reg_n_0_[0] ),
        .I2(D[3]),
        .I3(\enable_int_reg_n_0_[3] ),
        .O(reset_ctrl_i_3_n_0));
  FDSE #(
    .INIT(1'b1)) 
    reset_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_ctrl_i_2_n_0),
        .Q(reset_ctrl),
        .S(reset_ctrl0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    reset_data_i_1
       (.I0(startup_ctrl_i_2_n_0),
        .I1(reset_ctrl_i_3_n_0),
        .I2(reset_ctrl0),
        .I3(startup_ctrl2),
        .O(reset_data_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reset_data_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_data_i_1_n_0),
        .Q(reset_data),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \rotate[0]_i_1 
       (.I0(rotate[0]),
        .I1(enable_count[0]),
        .O(ready0[0]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hE11E)) 
    \rotate[1]_i_2 
       (.I0(rotate[0]),
        .I1(enable_count[0]),
        .I2(enable_count[1]),
        .I3(rotate[1]),
        .O(ready0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \rotate_reg[0] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(ready0[0]),
        .Q(rotate[0]),
        .R(reset_ctrl));
  FDRE #(
    .INIT(1'b0)) 
    \rotate_reg[1] 
       (.C(clk),
        .CE(ce_ctrl),
        .D(ready0[1]),
        .Q(rotate[1]),
        .R(reset_ctrl));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl2_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_ctrl_i_2_n_0),
        .Q(startup_ctrl2),
        .R(reset_ctrl0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    startup_ctrl_i_1
       (.I0(startup_ctrl2),
        .I1(reset_ctrl),
        .I2(reset_ctrl_i_3_n_0),
        .I3(startup_ctrl_i_2_n_0),
        .O(startup_ctrl_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    startup_ctrl_i_2
       (.I0(D[2]),
        .I1(\enable_int_reg_n_0_[2] ),
        .I2(D[1]),
        .I3(\enable_int_reg_n_0_[1] ),
        .O(startup_ctrl_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    startup_ctrl_reg
       (.C(clk),
        .CE(1'b1),
        .D(startup_ctrl_i_1_n_0),
        .Q(startup_ctrl),
        .R(reset_ctrl0));
endmodule

(* CHECK_LICENSE_TYPE = "system_util_adc_1_pack_0,util_cpack2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "util_cpack2,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_util_adc_2_pack_0
   (clk,
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
    packed_sync);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 packed_fifo_wr_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME packed_fifo_wr_signal_clock, ASSOCIATED_BUSIF packed_fifo_wr, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_adc_1_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 packed_fifo_wr_signal_reset RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME packed_fifo_wr_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset;
  input enable_0;
  input enable_1;
  input enable_2;
  input enable_3;
  input fifo_wr_en;
  output fifo_wr_overflow;
  input [15:0]fifo_wr_data_0;
  input [15:0]fifo_wr_data_1;
  input [15:0]fifo_wr_data_2;
  input [15:0]fifo_wr_data_3;
  (* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr EN" *) (* X_INTERFACE_MODE = "master" *) output packed_fifo_wr_en;
  (* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr OVERFLOW" *) input packed_fifo_wr_overflow;
  (* X_INTERFACE_INFO = "analog.com:interface:fifo_wr:1.0 packed_fifo_wr DATA" *) output [63:0]packed_fifo_wr_data;
  output packed_sync;

  wire clk;
  wire enable_0;
  wire enable_1;
  wire enable_2;
  wire enable_3;
  wire [15:0]fifo_wr_data_0;
  wire [15:0]fifo_wr_data_1;
  wire [15:0]fifo_wr_data_2;
  wire [15:0]fifo_wr_data_3;
  wire fifo_wr_en;
  wire [63:0]packed_fifo_wr_data;
  wire packed_fifo_wr_en;
  wire packed_fifo_wr_overflow;
  wire packed_sync;
  wire reset;

  assign fifo_wr_overflow = packed_fifo_wr_overflow;
  system_util_adc_2_pack_0_util_cpack2 inst
       (.D({enable_3,enable_2,enable_1,enable_0}),
        .clk(clk),
        .fifo_wr_data_0(fifo_wr_data_0),
        .fifo_wr_data_1(fifo_wr_data_1),
        .fifo_wr_data_2(fifo_wr_data_2),
        .fifo_wr_data_3(fifo_wr_data_3),
        .fifo_wr_en(fifo_wr_en),
        .packed_fifo_wr_data(packed_fifo_wr_data),
        .packed_fifo_wr_en(packed_fifo_wr_en),
        .packed_sync(packed_sync),
        .reset(reset));
endmodule

module system_util_adc_2_pack_0_util_cpack2
   (packed_fifo_wr_en,
    packed_fifo_wr_data,
    packed_sync,
    reset,
    D,
    clk,
    fifo_wr_en,
    fifo_wr_data_1,
    fifo_wr_data_0,
    fifo_wr_data_3,
    fifo_wr_data_2);
  output packed_fifo_wr_en;
  output [63:0]packed_fifo_wr_data;
  output packed_sync;
  input reset;
  input [3:0]D;
  input clk;
  input fifo_wr_en;
  input [15:0]fifo_wr_data_1;
  input [15:0]fifo_wr_data_0;
  input [15:0]fifo_wr_data_3;
  input [15:0]fifo_wr_data_2;

  wire [3:0]D;
  wire clk;
  wire [15:0]fifo_wr_data_0;
  wire [15:0]fifo_wr_data_1;
  wire [15:0]fifo_wr_data_2;
  wire [15:0]fifo_wr_data_3;
  wire fifo_wr_en;
  wire [63:0]packed_fifo_wr_data;
  wire packed_fifo_wr_en;
  wire packed_sync;
  wire reset;

  system_util_adc_2_pack_0_util_cpack2_impl i_cpack
       (.D(D),
        .clk(clk),
        .fifo_wr_data_0(fifo_wr_data_0),
        .fifo_wr_data_1(fifo_wr_data_1),
        .fifo_wr_data_2(fifo_wr_data_2),
        .fifo_wr_data_3(fifo_wr_data_3),
        .fifo_wr_en(fifo_wr_en),
        .packed_fifo_wr_data(packed_fifo_wr_data),
        .packed_fifo_wr_en(packed_fifo_wr_en),
        .packed_sync(packed_sync),
        .reset(reset));
endmodule

module system_util_adc_2_pack_0_util_cpack2_impl
   (packed_fifo_wr_en,
    packed_fifo_wr_data,
    packed_sync,
    reset,
    D,
    clk,
    fifo_wr_en,
    fifo_wr_data_1,
    fifo_wr_data_0,
    fifo_wr_data_3,
    fifo_wr_data_2);
  output packed_fifo_wr_en;
  output [63:0]packed_fifo_wr_data;
  output packed_sync;
  input reset;
  input [3:0]D;
  input clk;
  input fifo_wr_en;
  input [15:0]fifo_wr_data_1;
  input [15:0]fifo_wr_data_0;
  input [15:0]fifo_wr_data_3;
  input [15:0]fifo_wr_data_2;

  wire [3:0]D;
  wire clk;
  wire [15:0]fifo_wr_data_0;
  wire [15:0]fifo_wr_data_1;
  wire [15:0]fifo_wr_data_2;
  wire [15:0]fifo_wr_data_3;
  wire fifo_wr_en;
  wire i_pack_shell_n_65;
  wire i_pack_shell_n_67;
  wire i_pack_shell_n_68;
  wire i_pack_shell_n_69;
  wire i_pack_shell_n_70;
  wire [31:0]p_0_out;
  wire [63:32]p_1_in;
  wire [63:0]packed_fifo_wr_data;
  wire packed_fifo_wr_en;
  wire packed_fifo_wr_en0;
  wire packed_sync;
  wire reset;
  wire reset_data;

  system_util_adc_2_pack_0_pack_shell i_pack_shell
       (.D(D),
        .E({i_pack_shell_n_67,i_pack_shell_n_68,i_pack_shell_n_69,i_pack_shell_n_70}),
        .clk(clk),
        .fifo_wr_data_0(fifo_wr_data_0),
        .fifo_wr_data_1(fifo_wr_data_1),
        .\fifo_wr_data_1[15] ({p_1_in,p_0_out}),
        .fifo_wr_data_2(fifo_wr_data_2),
        .fifo_wr_data_3(fifo_wr_data_3),
        .fifo_wr_en(fifo_wr_en),
        .fifo_wr_en_0(i_pack_shell_n_65),
        .packed_fifo_wr_en0(packed_fifo_wr_en0),
        .reset(reset),
        .reset_data(reset_data));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[0] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[0]),
        .Q(packed_fifo_wr_data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[10] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[10]),
        .Q(packed_fifo_wr_data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[11] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[11]),
        .Q(packed_fifo_wr_data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[12] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[12]),
        .Q(packed_fifo_wr_data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[13] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[13]),
        .Q(packed_fifo_wr_data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[14] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[14]),
        .Q(packed_fifo_wr_data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[15] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[15]),
        .Q(packed_fifo_wr_data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[16] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[16]),
        .Q(packed_fifo_wr_data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[17] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[17]),
        .Q(packed_fifo_wr_data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[18] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[18]),
        .Q(packed_fifo_wr_data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[19] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[19]),
        .Q(packed_fifo_wr_data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[1] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[1]),
        .Q(packed_fifo_wr_data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[20] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[20]),
        .Q(packed_fifo_wr_data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[21] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[21]),
        .Q(packed_fifo_wr_data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[22] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[22]),
        .Q(packed_fifo_wr_data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[23] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[23]),
        .Q(packed_fifo_wr_data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[24] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[24]),
        .Q(packed_fifo_wr_data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[25] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[25]),
        .Q(packed_fifo_wr_data[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[26] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[26]),
        .Q(packed_fifo_wr_data[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[27] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[27]),
        .Q(packed_fifo_wr_data[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[28] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[28]),
        .Q(packed_fifo_wr_data[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[29] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[29]),
        .Q(packed_fifo_wr_data[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[2] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[2]),
        .Q(packed_fifo_wr_data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[30] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[30]),
        .Q(packed_fifo_wr_data[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[31] 
       (.C(clk),
        .CE(i_pack_shell_n_69),
        .D(p_0_out[31]),
        .Q(packed_fifo_wr_data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[32] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[32]),
        .Q(packed_fifo_wr_data[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[33] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[33]),
        .Q(packed_fifo_wr_data[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[34] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[34]),
        .Q(packed_fifo_wr_data[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[35] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[35]),
        .Q(packed_fifo_wr_data[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[36] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[36]),
        .Q(packed_fifo_wr_data[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[37] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[37]),
        .Q(packed_fifo_wr_data[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[38] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[38]),
        .Q(packed_fifo_wr_data[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[39] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[39]),
        .Q(packed_fifo_wr_data[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[3] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[3]),
        .Q(packed_fifo_wr_data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[40] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[40]),
        .Q(packed_fifo_wr_data[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[41] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[41]),
        .Q(packed_fifo_wr_data[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[42] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[42]),
        .Q(packed_fifo_wr_data[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[43] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[43]),
        .Q(packed_fifo_wr_data[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[44] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[44]),
        .Q(packed_fifo_wr_data[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[45] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[45]),
        .Q(packed_fifo_wr_data[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[46] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[46]),
        .Q(packed_fifo_wr_data[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[47] 
       (.C(clk),
        .CE(i_pack_shell_n_68),
        .D(p_1_in[47]),
        .Q(packed_fifo_wr_data[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[48] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[48]),
        .Q(packed_fifo_wr_data[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[49] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[49]),
        .Q(packed_fifo_wr_data[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[4] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[4]),
        .Q(packed_fifo_wr_data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[50] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[50]),
        .Q(packed_fifo_wr_data[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[51] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[51]),
        .Q(packed_fifo_wr_data[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[52] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[52]),
        .Q(packed_fifo_wr_data[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[53] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[53]),
        .Q(packed_fifo_wr_data[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[54] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[54]),
        .Q(packed_fifo_wr_data[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[55] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[55]),
        .Q(packed_fifo_wr_data[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[56] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[56]),
        .Q(packed_fifo_wr_data[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[57] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[57]),
        .Q(packed_fifo_wr_data[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[58] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[58]),
        .Q(packed_fifo_wr_data[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[59] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[59]),
        .Q(packed_fifo_wr_data[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[5] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[5]),
        .Q(packed_fifo_wr_data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[60] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[60]),
        .Q(packed_fifo_wr_data[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[61] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[61]),
        .Q(packed_fifo_wr_data[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[62] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[62]),
        .Q(packed_fifo_wr_data[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[63] 
       (.C(clk),
        .CE(i_pack_shell_n_67),
        .D(p_1_in[63]),
        .Q(packed_fifo_wr_data[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[6] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[6]),
        .Q(packed_fifo_wr_data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[7] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[7]),
        .Q(packed_fifo_wr_data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[8] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[8]),
        .Q(packed_fifo_wr_data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \packed_fifo_wr_data_reg[9] 
       (.C(clk),
        .CE(i_pack_shell_n_70),
        .D(p_0_out[9]),
        .Q(packed_fifo_wr_data[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    packed_fifo_wr_en_reg
       (.C(clk),
        .CE(1'b1),
        .D(packed_fifo_wr_en0),
        .Q(packed_fifo_wr_en),
        .R(reset_data));
  FDRE #(
    .INIT(1'b1)) 
    packed_sync_reg
       (.C(clk),
        .CE(1'b1),
        .D(i_pack_shell_n_65),
        .Q(packed_sync),
        .R(reset_data));
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
