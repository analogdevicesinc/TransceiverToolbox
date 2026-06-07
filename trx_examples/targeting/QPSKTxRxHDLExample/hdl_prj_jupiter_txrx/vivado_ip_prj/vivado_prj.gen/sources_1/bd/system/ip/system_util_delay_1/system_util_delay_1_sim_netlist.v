// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:42:54 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top system_util_delay_1 -prefix
//               system_util_delay_1_ system_util_delay_0_sim_netlist.v
// Design      : system_util_delay_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_util_delay_0,util_delay,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "util_delay,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_util_delay_1
   (clk,
    rstn,
    din,
    dout);
  input clk;
  input rstn;
  input [64:0]din;
  output [64:0]dout;

  wire clk;
  wire [64:0]din;
  wire [64:0]dout;
  wire rstn;

  system_util_delay_1_util_delay inst
       (.clk(clk),
        .din(din),
        .dout(dout),
        .rstn(rstn));
endmodule

module system_util_delay_1_util_delay
   (dout,
    clk,
    din,
    rstn);
  output [64:0]dout;
  input clk;
  input [64:0]din;
  input rstn;

  wire clk;
  wire dbuf_reg_r_n_0;
  wire [64:0]din;
  wire [64:0]dout;
  wire p_0_in;
  wire \register_pipe[1].dbuf_reg[1][0]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][10]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][11]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][12]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][13]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][14]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][15]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][16]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][17]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][18]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][19]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][1]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][20]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][21]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][22]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][23]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][24]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][25]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][26]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][27]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][28]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][29]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][2]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][30]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][31]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][32]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][33]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][34]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][35]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][36]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][37]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][38]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][39]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][3]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][40]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][41]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][42]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][43]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][44]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][45]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][46]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][47]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][48]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][49]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][4]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][50]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][51]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][52]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][53]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][54]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][55]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][56]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][57]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][58]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][59]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][5]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][60]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][61]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][62]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][63]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][64]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][6]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][7]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][8]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[1].dbuf_reg[1][9]_srl2___inst_register_pipe_r_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][0]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][10]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][11]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][12]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][13]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][14]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][15]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][16]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][17]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][18]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][19]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][1]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][20]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][21]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][22]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][23]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][24]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][25]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][26]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][27]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][28]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][29]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][2]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][30]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][31]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][32]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][33]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][34]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][35]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][36]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][37]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][38]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][39]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][3]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][40]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][41]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][42]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][43]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][44]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][45]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][46]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][47]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][48]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][49]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][4]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][50]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][51]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][52]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][53]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][54]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][55]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][56]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][57]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][58]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][59]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][5]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][60]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][61]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][62]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][63]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][64]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][6]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][7]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][8]_inst_register_pipe_r_0_n_0 ;
  wire \register_pipe[2].dbuf_reg[2][9]_inst_register_pipe_r_0_n_0 ;
  wire register_pipe_gate__0_n_0;
  wire register_pipe_gate__10_n_0;
  wire register_pipe_gate__11_n_0;
  wire register_pipe_gate__12_n_0;
  wire register_pipe_gate__13_n_0;
  wire register_pipe_gate__14_n_0;
  wire register_pipe_gate__15_n_0;
  wire register_pipe_gate__16_n_0;
  wire register_pipe_gate__17_n_0;
  wire register_pipe_gate__18_n_0;
  wire register_pipe_gate__19_n_0;
  wire register_pipe_gate__1_n_0;
  wire register_pipe_gate__20_n_0;
  wire register_pipe_gate__21_n_0;
  wire register_pipe_gate__22_n_0;
  wire register_pipe_gate__23_n_0;
  wire register_pipe_gate__24_n_0;
  wire register_pipe_gate__25_n_0;
  wire register_pipe_gate__26_n_0;
  wire register_pipe_gate__27_n_0;
  wire register_pipe_gate__28_n_0;
  wire register_pipe_gate__29_n_0;
  wire register_pipe_gate__2_n_0;
  wire register_pipe_gate__30_n_0;
  wire register_pipe_gate__31_n_0;
  wire register_pipe_gate__32_n_0;
  wire register_pipe_gate__33_n_0;
  wire register_pipe_gate__34_n_0;
  wire register_pipe_gate__35_n_0;
  wire register_pipe_gate__36_n_0;
  wire register_pipe_gate__37_n_0;
  wire register_pipe_gate__38_n_0;
  wire register_pipe_gate__39_n_0;
  wire register_pipe_gate__3_n_0;
  wire register_pipe_gate__40_n_0;
  wire register_pipe_gate__41_n_0;
  wire register_pipe_gate__42_n_0;
  wire register_pipe_gate__43_n_0;
  wire register_pipe_gate__44_n_0;
  wire register_pipe_gate__45_n_0;
  wire register_pipe_gate__46_n_0;
  wire register_pipe_gate__47_n_0;
  wire register_pipe_gate__48_n_0;
  wire register_pipe_gate__49_n_0;
  wire register_pipe_gate__4_n_0;
  wire register_pipe_gate__50_n_0;
  wire register_pipe_gate__51_n_0;
  wire register_pipe_gate__52_n_0;
  wire register_pipe_gate__53_n_0;
  wire register_pipe_gate__54_n_0;
  wire register_pipe_gate__55_n_0;
  wire register_pipe_gate__56_n_0;
  wire register_pipe_gate__57_n_0;
  wire register_pipe_gate__58_n_0;
  wire register_pipe_gate__59_n_0;
  wire register_pipe_gate__5_n_0;
  wire register_pipe_gate__60_n_0;
  wire register_pipe_gate__61_n_0;
  wire register_pipe_gate__62_n_0;
  wire register_pipe_gate__63_n_0;
  wire register_pipe_gate__6_n_0;
  wire register_pipe_gate__7_n_0;
  wire register_pipe_gate__8_n_0;
  wire register_pipe_gate__9_n_0;
  wire register_pipe_gate_n_0;
  wire register_pipe_r_0_n_0;
  wire register_pipe_r_n_0;
  wire rstn;

  FDRE dbuf_reg_r
       (.C(clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(dbuf_reg_r_n_0),
        .R(p_0_in));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][0]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][0]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[0]),
        .Q(\register_pipe[1].dbuf_reg[1][0]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][10]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][10]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[10]),
        .Q(\register_pipe[1].dbuf_reg[1][10]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][11]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][11]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[11]),
        .Q(\register_pipe[1].dbuf_reg[1][11]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][12]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][12]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[12]),
        .Q(\register_pipe[1].dbuf_reg[1][12]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][13]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][13]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[13]),
        .Q(\register_pipe[1].dbuf_reg[1][13]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][14]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][14]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[14]),
        .Q(\register_pipe[1].dbuf_reg[1][14]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][15]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][15]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[15]),
        .Q(\register_pipe[1].dbuf_reg[1][15]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][16]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][16]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[16]),
        .Q(\register_pipe[1].dbuf_reg[1][16]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][17]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][17]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[17]),
        .Q(\register_pipe[1].dbuf_reg[1][17]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][18]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][18]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[18]),
        .Q(\register_pipe[1].dbuf_reg[1][18]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][19]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][19]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[19]),
        .Q(\register_pipe[1].dbuf_reg[1][19]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][1]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][1]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[1]),
        .Q(\register_pipe[1].dbuf_reg[1][1]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][20]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][20]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[20]),
        .Q(\register_pipe[1].dbuf_reg[1][20]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][21]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][21]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[21]),
        .Q(\register_pipe[1].dbuf_reg[1][21]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][22]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][22]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[22]),
        .Q(\register_pipe[1].dbuf_reg[1][22]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][23]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][23]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[23]),
        .Q(\register_pipe[1].dbuf_reg[1][23]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][24]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][24]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[24]),
        .Q(\register_pipe[1].dbuf_reg[1][24]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][25]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][25]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[25]),
        .Q(\register_pipe[1].dbuf_reg[1][25]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][26]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][26]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[26]),
        .Q(\register_pipe[1].dbuf_reg[1][26]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][27]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][27]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[27]),
        .Q(\register_pipe[1].dbuf_reg[1][27]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][28]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][28]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[28]),
        .Q(\register_pipe[1].dbuf_reg[1][28]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][29]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][29]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[29]),
        .Q(\register_pipe[1].dbuf_reg[1][29]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][2]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][2]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[2]),
        .Q(\register_pipe[1].dbuf_reg[1][2]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][30]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][30]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[30]),
        .Q(\register_pipe[1].dbuf_reg[1][30]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][31]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][31]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[31]),
        .Q(\register_pipe[1].dbuf_reg[1][31]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][32]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][32]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[32]),
        .Q(\register_pipe[1].dbuf_reg[1][32]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][33]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][33]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[33]),
        .Q(\register_pipe[1].dbuf_reg[1][33]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][34]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][34]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[34]),
        .Q(\register_pipe[1].dbuf_reg[1][34]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][35]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][35]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[35]),
        .Q(\register_pipe[1].dbuf_reg[1][35]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][36]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][36]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[36]),
        .Q(\register_pipe[1].dbuf_reg[1][36]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][37]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][37]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[37]),
        .Q(\register_pipe[1].dbuf_reg[1][37]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][38]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][38]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[38]),
        .Q(\register_pipe[1].dbuf_reg[1][38]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][39]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][39]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[39]),
        .Q(\register_pipe[1].dbuf_reg[1][39]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][3]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][3]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[3]),
        .Q(\register_pipe[1].dbuf_reg[1][3]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][40]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][40]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[40]),
        .Q(\register_pipe[1].dbuf_reg[1][40]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][41]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][41]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[41]),
        .Q(\register_pipe[1].dbuf_reg[1][41]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][42]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][42]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[42]),
        .Q(\register_pipe[1].dbuf_reg[1][42]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][43]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][43]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[43]),
        .Q(\register_pipe[1].dbuf_reg[1][43]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][44]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][44]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[44]),
        .Q(\register_pipe[1].dbuf_reg[1][44]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][45]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][45]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[45]),
        .Q(\register_pipe[1].dbuf_reg[1][45]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][46]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][46]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[46]),
        .Q(\register_pipe[1].dbuf_reg[1][46]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][47]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][47]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[47]),
        .Q(\register_pipe[1].dbuf_reg[1][47]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][48]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][48]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[48]),
        .Q(\register_pipe[1].dbuf_reg[1][48]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][49]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][49]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[49]),
        .Q(\register_pipe[1].dbuf_reg[1][49]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][4]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][4]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[4]),
        .Q(\register_pipe[1].dbuf_reg[1][4]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][50]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][50]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[50]),
        .Q(\register_pipe[1].dbuf_reg[1][50]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][51]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][51]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[51]),
        .Q(\register_pipe[1].dbuf_reg[1][51]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][52]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][52]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[52]),
        .Q(\register_pipe[1].dbuf_reg[1][52]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][53]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][53]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[53]),
        .Q(\register_pipe[1].dbuf_reg[1][53]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][54]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][54]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[54]),
        .Q(\register_pipe[1].dbuf_reg[1][54]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][55]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][55]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[55]),
        .Q(\register_pipe[1].dbuf_reg[1][55]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][56]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][56]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[56]),
        .Q(\register_pipe[1].dbuf_reg[1][56]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][57]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][57]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[57]),
        .Q(\register_pipe[1].dbuf_reg[1][57]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][58]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][58]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[58]),
        .Q(\register_pipe[1].dbuf_reg[1][58]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][59]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][59]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[59]),
        .Q(\register_pipe[1].dbuf_reg[1][59]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][5]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][5]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[5]),
        .Q(\register_pipe[1].dbuf_reg[1][5]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][60]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][60]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[60]),
        .Q(\register_pipe[1].dbuf_reg[1][60]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][61]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][61]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[61]),
        .Q(\register_pipe[1].dbuf_reg[1][61]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][62]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][62]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[62]),
        .Q(\register_pipe[1].dbuf_reg[1][62]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][63]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][63]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[63]),
        .Q(\register_pipe[1].dbuf_reg[1][63]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][64]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][64]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[64]),
        .Q(\register_pipe[1].dbuf_reg[1][64]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][6]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][6]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[6]),
        .Q(\register_pipe[1].dbuf_reg[1][6]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][7]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][7]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[7]),
        .Q(\register_pipe[1].dbuf_reg[1][7]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][8]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][8]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[8]),
        .Q(\register_pipe[1].dbuf_reg[1][8]_srl2___inst_register_pipe_r_n_0 ));
  (* srl_bus_name = "\\inst/register_pipe[1].dbuf_reg[1] " *) 
  (* srl_name = "\\inst/register_pipe[1].dbuf_reg[1][9]_srl2___inst_register_pipe_r " *) 
  SRL16E \register_pipe[1].dbuf_reg[1][9]_srl2___inst_register_pipe_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(din[9]),
        .Q(\register_pipe[1].dbuf_reg[1][9]_srl2___inst_register_pipe_r_n_0 ));
  FDRE \register_pipe[2].dbuf_reg[2][0]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][0]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][0]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][10]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][10]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][10]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][11]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][11]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][11]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][12]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][12]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][12]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][13]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][13]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][13]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][14]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][14]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][14]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][15]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][15]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][15]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][16]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][16]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][16]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][17]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][17]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][17]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][18]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][18]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][18]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][19]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][19]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][19]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][1]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][1]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][1]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][20]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][20]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][20]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][21]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][21]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][21]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][22]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][22]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][22]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][23]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][23]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][23]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][24]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][24]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][24]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][25]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][25]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][25]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][26]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][26]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][26]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][27]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][27]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][27]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][28]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][28]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][28]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][29]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][29]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][29]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][2]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][2]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][2]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][30]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][30]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][30]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][31]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][31]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][31]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][32]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][32]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][32]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][33]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][33]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][33]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][34]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][34]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][34]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][35]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][35]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][35]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][36]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][36]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][36]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][37]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][37]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][37]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][38]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][38]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][38]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][39]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][39]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][39]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][3]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][3]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][3]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][40]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][40]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][40]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][41]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][41]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][41]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][42]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][42]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][42]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][43]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][43]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][43]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][44]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][44]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][44]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][45]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][45]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][45]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][46]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][46]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][46]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][47]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][47]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][47]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][48]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][48]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][48]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][49]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][49]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][49]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][4]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][4]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][4]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][50]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][50]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][50]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][51]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][51]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][51]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][52]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][52]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][52]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][53]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][53]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][53]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][54]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][54]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][54]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][55]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][55]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][55]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][56]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][56]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][56]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][57]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][57]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][57]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][58]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][58]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][58]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][59]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][59]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][59]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][5]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][5]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][5]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][60]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][60]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][60]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][61]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][61]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][61]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][62]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][62]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][62]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][63]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][63]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][63]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][64]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][64]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][64]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][6]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][6]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][6]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][7]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][7]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][7]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][8]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][8]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][8]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  FDRE \register_pipe[2].dbuf_reg[2][9]_inst_register_pipe_r_0 
       (.C(clk),
        .CE(1'b1),
        .D(\register_pipe[1].dbuf_reg[1][9]_srl2___inst_register_pipe_r_n_0 ),
        .Q(\register_pipe[2].dbuf_reg[2][9]_inst_register_pipe_r_0_n_0 ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \register_pipe[3].dbuf[3][64]_i_1 
       (.I0(rstn),
        .O(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][0] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__63_n_0),
        .Q(dout[0]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][10] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__53_n_0),
        .Q(dout[10]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][11] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__52_n_0),
        .Q(dout[11]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][12] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__51_n_0),
        .Q(dout[12]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][13] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__50_n_0),
        .Q(dout[13]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][14] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__49_n_0),
        .Q(dout[14]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][15] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__48_n_0),
        .Q(dout[15]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][16] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__47_n_0),
        .Q(dout[16]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][17] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__46_n_0),
        .Q(dout[17]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][18] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__45_n_0),
        .Q(dout[18]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][19] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__44_n_0),
        .Q(dout[19]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][1] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__62_n_0),
        .Q(dout[1]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][20] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__43_n_0),
        .Q(dout[20]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][21] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__42_n_0),
        .Q(dout[21]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][22] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__41_n_0),
        .Q(dout[22]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][23] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__40_n_0),
        .Q(dout[23]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][24] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__39_n_0),
        .Q(dout[24]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][25] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__38_n_0),
        .Q(dout[25]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][26] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__37_n_0),
        .Q(dout[26]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][27] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__36_n_0),
        .Q(dout[27]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][28] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__35_n_0),
        .Q(dout[28]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][29] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__34_n_0),
        .Q(dout[29]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][2] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__61_n_0),
        .Q(dout[2]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][30] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__33_n_0),
        .Q(dout[30]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][31] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__32_n_0),
        .Q(dout[31]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][32] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__31_n_0),
        .Q(dout[32]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][33] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__30_n_0),
        .Q(dout[33]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][34] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__29_n_0),
        .Q(dout[34]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][35] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__28_n_0),
        .Q(dout[35]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][36] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__27_n_0),
        .Q(dout[36]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][37] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__26_n_0),
        .Q(dout[37]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][38] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__25_n_0),
        .Q(dout[38]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][39] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__24_n_0),
        .Q(dout[39]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][3] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__60_n_0),
        .Q(dout[3]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][40] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__23_n_0),
        .Q(dout[40]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][41] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__22_n_0),
        .Q(dout[41]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][42] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__21_n_0),
        .Q(dout[42]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][43] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__20_n_0),
        .Q(dout[43]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][44] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__19_n_0),
        .Q(dout[44]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][45] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__18_n_0),
        .Q(dout[45]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][46] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__17_n_0),
        .Q(dout[46]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][47] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__16_n_0),
        .Q(dout[47]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][48] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__15_n_0),
        .Q(dout[48]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][49] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__14_n_0),
        .Q(dout[49]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][4] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__59_n_0),
        .Q(dout[4]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][50] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__13_n_0),
        .Q(dout[50]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][51] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__12_n_0),
        .Q(dout[51]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][52] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__11_n_0),
        .Q(dout[52]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][53] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__10_n_0),
        .Q(dout[53]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][54] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__9_n_0),
        .Q(dout[54]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][55] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__8_n_0),
        .Q(dout[55]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][56] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__7_n_0),
        .Q(dout[56]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][57] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__6_n_0),
        .Q(dout[57]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][58] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__5_n_0),
        .Q(dout[58]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][59] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__4_n_0),
        .Q(dout[59]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][5] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__58_n_0),
        .Q(dout[5]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][60] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__3_n_0),
        .Q(dout[60]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][61] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__2_n_0),
        .Q(dout[61]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][62] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__1_n_0),
        .Q(dout[62]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][63] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__0_n_0),
        .Q(dout[63]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][64] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate_n_0),
        .Q(dout[64]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][6] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__57_n_0),
        .Q(dout[6]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][7] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__56_n_0),
        .Q(dout[7]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][8] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__55_n_0),
        .Q(dout[8]),
        .R(p_0_in));
  FDRE \register_pipe[3].dbuf_reg[3][9] 
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_gate__54_n_0),
        .Q(dout[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate
       (.I0(\register_pipe[2].dbuf_reg[2][64]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__0
       (.I0(\register_pipe[2].dbuf_reg[2][63]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__1
       (.I0(\register_pipe[2].dbuf_reg[2][62]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__10
       (.I0(\register_pipe[2].dbuf_reg[2][53]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__11
       (.I0(\register_pipe[2].dbuf_reg[2][52]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__12
       (.I0(\register_pipe[2].dbuf_reg[2][51]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__13
       (.I0(\register_pipe[2].dbuf_reg[2][50]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__14
       (.I0(\register_pipe[2].dbuf_reg[2][49]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__15
       (.I0(\register_pipe[2].dbuf_reg[2][48]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__16
       (.I0(\register_pipe[2].dbuf_reg[2][47]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__17
       (.I0(\register_pipe[2].dbuf_reg[2][46]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__18
       (.I0(\register_pipe[2].dbuf_reg[2][45]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__19
       (.I0(\register_pipe[2].dbuf_reg[2][44]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__2
       (.I0(\register_pipe[2].dbuf_reg[2][61]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__20
       (.I0(\register_pipe[2].dbuf_reg[2][43]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__21
       (.I0(\register_pipe[2].dbuf_reg[2][42]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__22
       (.I0(\register_pipe[2].dbuf_reg[2][41]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__22_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__23
       (.I0(\register_pipe[2].dbuf_reg[2][40]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__24
       (.I0(\register_pipe[2].dbuf_reg[2][39]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__25
       (.I0(\register_pipe[2].dbuf_reg[2][38]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__26
       (.I0(\register_pipe[2].dbuf_reg[2][37]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__26_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__27
       (.I0(\register_pipe[2].dbuf_reg[2][36]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__28
       (.I0(\register_pipe[2].dbuf_reg[2][35]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__29
       (.I0(\register_pipe[2].dbuf_reg[2][34]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__29_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__3
       (.I0(\register_pipe[2].dbuf_reg[2][60]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__30
       (.I0(\register_pipe[2].dbuf_reg[2][33]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__31
       (.I0(\register_pipe[2].dbuf_reg[2][32]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__32
       (.I0(\register_pipe[2].dbuf_reg[2][31]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__33
       (.I0(\register_pipe[2].dbuf_reg[2][30]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__34
       (.I0(\register_pipe[2].dbuf_reg[2][29]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__35
       (.I0(\register_pipe[2].dbuf_reg[2][28]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__35_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__36
       (.I0(\register_pipe[2].dbuf_reg[2][27]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__36_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__37
       (.I0(\register_pipe[2].dbuf_reg[2][26]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__38
       (.I0(\register_pipe[2].dbuf_reg[2][25]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__39
       (.I0(\register_pipe[2].dbuf_reg[2][24]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__39_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__4
       (.I0(\register_pipe[2].dbuf_reg[2][59]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__40
       (.I0(\register_pipe[2].dbuf_reg[2][23]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__41
       (.I0(\register_pipe[2].dbuf_reg[2][22]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__41_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__42
       (.I0(\register_pipe[2].dbuf_reg[2][21]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__43
       (.I0(\register_pipe[2].dbuf_reg[2][20]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__44
       (.I0(\register_pipe[2].dbuf_reg[2][19]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__44_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__45
       (.I0(\register_pipe[2].dbuf_reg[2][18]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__45_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__46
       (.I0(\register_pipe[2].dbuf_reg[2][17]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__46_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__47
       (.I0(\register_pipe[2].dbuf_reg[2][16]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__47_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__48
       (.I0(\register_pipe[2].dbuf_reg[2][15]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__48_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__49
       (.I0(\register_pipe[2].dbuf_reg[2][14]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__49_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__5
       (.I0(\register_pipe[2].dbuf_reg[2][58]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__50
       (.I0(\register_pipe[2].dbuf_reg[2][13]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__50_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__51
       (.I0(\register_pipe[2].dbuf_reg[2][12]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__52
       (.I0(\register_pipe[2].dbuf_reg[2][11]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__52_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__53
       (.I0(\register_pipe[2].dbuf_reg[2][10]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__53_n_0));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__54
       (.I0(\register_pipe[2].dbuf_reg[2][9]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__54_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__55
       (.I0(\register_pipe[2].dbuf_reg[2][8]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__55_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__56
       (.I0(\register_pipe[2].dbuf_reg[2][7]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__56_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__57
       (.I0(\register_pipe[2].dbuf_reg[2][6]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__57_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__58
       (.I0(\register_pipe[2].dbuf_reg[2][5]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__58_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__59
       (.I0(\register_pipe[2].dbuf_reg[2][4]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__59_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__6
       (.I0(\register_pipe[2].dbuf_reg[2][57]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__60
       (.I0(\register_pipe[2].dbuf_reg[2][3]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__60_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__61
       (.I0(\register_pipe[2].dbuf_reg[2][2]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__61_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__62
       (.I0(\register_pipe[2].dbuf_reg[2][1]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__62_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__63
       (.I0(\register_pipe[2].dbuf_reg[2][0]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__63_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__7
       (.I0(\register_pipe[2].dbuf_reg[2][56]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__8
       (.I0(\register_pipe[2].dbuf_reg[2][55]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    register_pipe_gate__9
       (.I0(\register_pipe[2].dbuf_reg[2][54]_inst_register_pipe_r_0_n_0 ),
        .I1(register_pipe_r_0_n_0),
        .O(register_pipe_gate__9_n_0));
  FDRE register_pipe_r
       (.C(clk),
        .CE(1'b1),
        .D(dbuf_reg_r_n_0),
        .Q(register_pipe_r_n_0),
        .R(p_0_in));
  FDRE register_pipe_r_0
       (.C(clk),
        .CE(1'b1),
        .D(register_pipe_r_n_0),
        .Q(register_pipe_r_0_n_0),
        .R(p_0_in));
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
