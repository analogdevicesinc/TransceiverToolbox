// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:44:19 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top system_sync_slow_to_fast_1 -prefix
//               system_sync_slow_to_fast_1_ system_sync_slow_to_fast_0_sim_netlist.v
// Design      : system_sync_slow_to_fast_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_sync_slow_to_fast_1_sync_slow_to_fast
   (out_data,
    in_clk,
    out_clk,
    in_resetn,
    in_data,
    out_resetn);
  output [64:0]out_data;
  input in_clk;
  input out_clk;
  input in_resetn;
  input [64:0]in_data;
  input out_resetn;

  wire cdc_sync_stage0_tick;
  wire cdc_sync_stage1_tick;
  wire cdc_sync_stage2_tick;
  wire cdc_sync_stage3_tick;
  wire in_clk;
  wire [64:0]in_data;
  wire in_resetn;
  wire out_clk;
  wire [64:0]out_data;
  wire [64:0]out_data0;
  wire \out_data[64]_i_1_n_0 ;
  wire out_resetn;
  wire p_1_in;
  wire [2:0]rd_addr;
  wire \rd_addr[0]_i_1_n_0 ;
  wire \rd_addr[1]_i_1_n_0 ;
  wire \rd_addr[2]_i_1_n_0 ;
  wire \rd_addr[2]_i_2_n_0 ;
  wire [2:0]wr_addr;
  wire \wr_addr[0]_i_1_n_0 ;
  wire \wr_addr[1]_i_1_n_0 ;
  wire \wr_addr[2]_i_1_n_0 ;
  wire \wr_addr[2]_i_2_n_0 ;
  wire [1:0]NLW_fifo_reg_0_7_0_13_DOH_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_14_27_DOH_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_28_41_DOH_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_42_55_DOH_UNCONNECTED;
  wire [1:1]NLW_fifo_reg_0_7_56_64_DOE_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_56_64_DOF_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_56_64_DOG_UNCONNECTED;
  wire [1:0]NLW_fifo_reg_0_7_56_64_DOH_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    cdc_sync_stage0_tick_i_1
       (.I0(cdc_sync_stage0_tick),
        .O(p_1_in));
  FDRE cdc_sync_stage0_tick_reg
       (.C(in_clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(cdc_sync_stage0_tick),
        .R(\wr_addr[2]_i_1_n_0 ));
  FDRE cdc_sync_stage1_tick_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(cdc_sync_stage0_tick),
        .Q(cdc_sync_stage1_tick),
        .R(\rd_addr[2]_i_1_n_0 ));
  FDRE cdc_sync_stage2_tick_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(cdc_sync_stage1_tick),
        .Q(cdc_sync_stage2_tick),
        .R(\rd_addr[2]_i_1_n_0 ));
  FDRE cdc_sync_stage3_tick_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(cdc_sync_stage2_tick),
        .Q(cdc_sync_stage3_tick),
        .R(\rd_addr[2]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "390" *) 
  (* RTL_RAM_NAME = "system_sync_slow_to_fast_0/inst/fifo_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "5" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "13" *) 
  RAM32M16 fifo_reg_0_7_0_13
       (.ADDRA({1'b0,1'b0,rd_addr}),
        .ADDRB({1'b0,1'b0,rd_addr}),
        .ADDRC({1'b0,1'b0,rd_addr}),
        .ADDRD({1'b0,1'b0,rd_addr}),
        .ADDRE({1'b0,1'b0,rd_addr}),
        .ADDRF({1'b0,1'b0,rd_addr}),
        .ADDRG({1'b0,1'b0,rd_addr}),
        .ADDRH({1'b0,1'b0,wr_addr}),
        .DIA(in_data[1:0]),
        .DIB(in_data[3:2]),
        .DIC(in_data[5:4]),
        .DID(in_data[7:6]),
        .DIE(in_data[9:8]),
        .DIF(in_data[11:10]),
        .DIG(in_data[13:12]),
        .DIH({1'b0,1'b0}),
        .DOA(out_data0[1:0]),
        .DOB(out_data0[3:2]),
        .DOC(out_data0[5:4]),
        .DOD(out_data0[7:6]),
        .DOE(out_data0[9:8]),
        .DOF(out_data0[11:10]),
        .DOG(out_data0[13:12]),
        .DOH(NLW_fifo_reg_0_7_0_13_DOH_UNCONNECTED[1:0]),
        .WCLK(in_clk),
        .WE(in_resetn));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "390" *) 
  (* RTL_RAM_NAME = "system_sync_slow_to_fast_0/inst/fifo_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "5" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "27" *) 
  RAM32M16 fifo_reg_0_7_14_27
       (.ADDRA({1'b0,1'b0,rd_addr}),
        .ADDRB({1'b0,1'b0,rd_addr}),
        .ADDRC({1'b0,1'b0,rd_addr}),
        .ADDRD({1'b0,1'b0,rd_addr}),
        .ADDRE({1'b0,1'b0,rd_addr}),
        .ADDRF({1'b0,1'b0,rd_addr}),
        .ADDRG({1'b0,1'b0,rd_addr}),
        .ADDRH({1'b0,1'b0,wr_addr}),
        .DIA(in_data[15:14]),
        .DIB(in_data[17:16]),
        .DIC(in_data[19:18]),
        .DID(in_data[21:20]),
        .DIE(in_data[23:22]),
        .DIF(in_data[25:24]),
        .DIG(in_data[27:26]),
        .DIH({1'b0,1'b0}),
        .DOA(out_data0[15:14]),
        .DOB(out_data0[17:16]),
        .DOC(out_data0[19:18]),
        .DOD(out_data0[21:20]),
        .DOE(out_data0[23:22]),
        .DOF(out_data0[25:24]),
        .DOG(out_data0[27:26]),
        .DOH(NLW_fifo_reg_0_7_14_27_DOH_UNCONNECTED[1:0]),
        .WCLK(in_clk),
        .WE(in_resetn));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "390" *) 
  (* RTL_RAM_NAME = "system_sync_slow_to_fast_0/inst/fifo_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "5" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "28" *) 
  (* ram_slice_end = "41" *) 
  RAM32M16 fifo_reg_0_7_28_41
       (.ADDRA({1'b0,1'b0,rd_addr}),
        .ADDRB({1'b0,1'b0,rd_addr}),
        .ADDRC({1'b0,1'b0,rd_addr}),
        .ADDRD({1'b0,1'b0,rd_addr}),
        .ADDRE({1'b0,1'b0,rd_addr}),
        .ADDRF({1'b0,1'b0,rd_addr}),
        .ADDRG({1'b0,1'b0,rd_addr}),
        .ADDRH({1'b0,1'b0,wr_addr}),
        .DIA(in_data[29:28]),
        .DIB(in_data[31:30]),
        .DIC(in_data[33:32]),
        .DID(in_data[35:34]),
        .DIE(in_data[37:36]),
        .DIF(in_data[39:38]),
        .DIG(in_data[41:40]),
        .DIH({1'b0,1'b0}),
        .DOA(out_data0[29:28]),
        .DOB(out_data0[31:30]),
        .DOC(out_data0[33:32]),
        .DOD(out_data0[35:34]),
        .DOE(out_data0[37:36]),
        .DOF(out_data0[39:38]),
        .DOG(out_data0[41:40]),
        .DOH(NLW_fifo_reg_0_7_28_41_DOH_UNCONNECTED[1:0]),
        .WCLK(in_clk),
        .WE(in_resetn));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "390" *) 
  (* RTL_RAM_NAME = "system_sync_slow_to_fast_0/inst/fifo_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "5" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "42" *) 
  (* ram_slice_end = "55" *) 
  RAM32M16 fifo_reg_0_7_42_55
       (.ADDRA({1'b0,1'b0,rd_addr}),
        .ADDRB({1'b0,1'b0,rd_addr}),
        .ADDRC({1'b0,1'b0,rd_addr}),
        .ADDRD({1'b0,1'b0,rd_addr}),
        .ADDRE({1'b0,1'b0,rd_addr}),
        .ADDRF({1'b0,1'b0,rd_addr}),
        .ADDRG({1'b0,1'b0,rd_addr}),
        .ADDRH({1'b0,1'b0,wr_addr}),
        .DIA(in_data[43:42]),
        .DIB(in_data[45:44]),
        .DIC(in_data[47:46]),
        .DID(in_data[49:48]),
        .DIE(in_data[51:50]),
        .DIF(in_data[53:52]),
        .DIG(in_data[55:54]),
        .DIH({1'b0,1'b0}),
        .DOA(out_data0[43:42]),
        .DOB(out_data0[45:44]),
        .DOC(out_data0[47:46]),
        .DOD(out_data0[49:48]),
        .DOE(out_data0[51:50]),
        .DOF(out_data0[53:52]),
        .DOG(out_data0[55:54]),
        .DOH(NLW_fifo_reg_0_7_42_55_DOH_UNCONNECTED[1:0]),
        .WCLK(in_clk),
        .WE(in_resetn));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "390" *) 
  (* RTL_RAM_NAME = "system_sync_slow_to_fast_0/inst/fifo_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "5" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "56" *) 
  (* ram_slice_end = "64" *) 
  RAM32M16 fifo_reg_0_7_56_64
       (.ADDRA({1'b0,1'b0,rd_addr}),
        .ADDRB({1'b0,1'b0,rd_addr}),
        .ADDRC({1'b0,1'b0,rd_addr}),
        .ADDRD({1'b0,1'b0,rd_addr}),
        .ADDRE({1'b0,1'b0,rd_addr}),
        .ADDRF({1'b0,1'b0,rd_addr}),
        .ADDRG({1'b0,1'b0,rd_addr}),
        .ADDRH({1'b0,1'b0,wr_addr}),
        .DIA(in_data[57:56]),
        .DIB(in_data[59:58]),
        .DIC(in_data[61:60]),
        .DID(in_data[63:62]),
        .DIE({1'b0,in_data[64]}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(out_data0[57:56]),
        .DOB(out_data0[59:58]),
        .DOC(out_data0[61:60]),
        .DOD(out_data0[63:62]),
        .DOE({NLW_fifo_reg_0_7_56_64_DOE_UNCONNECTED[1],out_data0[64]}),
        .DOF(NLW_fifo_reg_0_7_56_64_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_fifo_reg_0_7_56_64_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_fifo_reg_0_7_56_64_DOH_UNCONNECTED[1:0]),
        .WCLK(in_clk),
        .WE(in_resetn));
  LUT2 #(
    .INIT(4'h6)) 
    \out_data[64]_i_1 
       (.I0(cdc_sync_stage3_tick),
        .I1(cdc_sync_stage2_tick),
        .O(\out_data[64]_i_1_n_0 ));
  FDRE \out_data_reg[0] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[0]),
        .Q(out_data[0]),
        .R(1'b0));
  FDRE \out_data_reg[10] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[10]),
        .Q(out_data[10]),
        .R(1'b0));
  FDRE \out_data_reg[11] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[11]),
        .Q(out_data[11]),
        .R(1'b0));
  FDRE \out_data_reg[12] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[12]),
        .Q(out_data[12]),
        .R(1'b0));
  FDRE \out_data_reg[13] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[13]),
        .Q(out_data[13]),
        .R(1'b0));
  FDRE \out_data_reg[14] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[14]),
        .Q(out_data[14]),
        .R(1'b0));
  FDRE \out_data_reg[15] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[15]),
        .Q(out_data[15]),
        .R(1'b0));
  FDRE \out_data_reg[16] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[16]),
        .Q(out_data[16]),
        .R(1'b0));
  FDRE \out_data_reg[17] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[17]),
        .Q(out_data[17]),
        .R(1'b0));
  FDRE \out_data_reg[18] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[18]),
        .Q(out_data[18]),
        .R(1'b0));
  FDRE \out_data_reg[19] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[19]),
        .Q(out_data[19]),
        .R(1'b0));
  FDRE \out_data_reg[1] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[1]),
        .Q(out_data[1]),
        .R(1'b0));
  FDRE \out_data_reg[20] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[20]),
        .Q(out_data[20]),
        .R(1'b0));
  FDRE \out_data_reg[21] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[21]),
        .Q(out_data[21]),
        .R(1'b0));
  FDRE \out_data_reg[22] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[22]),
        .Q(out_data[22]),
        .R(1'b0));
  FDRE \out_data_reg[23] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[23]),
        .Q(out_data[23]),
        .R(1'b0));
  FDRE \out_data_reg[24] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[24]),
        .Q(out_data[24]),
        .R(1'b0));
  FDRE \out_data_reg[25] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[25]),
        .Q(out_data[25]),
        .R(1'b0));
  FDRE \out_data_reg[26] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[26]),
        .Q(out_data[26]),
        .R(1'b0));
  FDRE \out_data_reg[27] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[27]),
        .Q(out_data[27]),
        .R(1'b0));
  FDRE \out_data_reg[28] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[28]),
        .Q(out_data[28]),
        .R(1'b0));
  FDRE \out_data_reg[29] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[29]),
        .Q(out_data[29]),
        .R(1'b0));
  FDRE \out_data_reg[2] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[2]),
        .Q(out_data[2]),
        .R(1'b0));
  FDRE \out_data_reg[30] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[30]),
        .Q(out_data[30]),
        .R(1'b0));
  FDRE \out_data_reg[31] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[31]),
        .Q(out_data[31]),
        .R(1'b0));
  FDRE \out_data_reg[32] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[32]),
        .Q(out_data[32]),
        .R(1'b0));
  FDRE \out_data_reg[33] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[33]),
        .Q(out_data[33]),
        .R(1'b0));
  FDRE \out_data_reg[34] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[34]),
        .Q(out_data[34]),
        .R(1'b0));
  FDRE \out_data_reg[35] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[35]),
        .Q(out_data[35]),
        .R(1'b0));
  FDRE \out_data_reg[36] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[36]),
        .Q(out_data[36]),
        .R(1'b0));
  FDRE \out_data_reg[37] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[37]),
        .Q(out_data[37]),
        .R(1'b0));
  FDRE \out_data_reg[38] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[38]),
        .Q(out_data[38]),
        .R(1'b0));
  FDRE \out_data_reg[39] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[39]),
        .Q(out_data[39]),
        .R(1'b0));
  FDRE \out_data_reg[3] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[3]),
        .Q(out_data[3]),
        .R(1'b0));
  FDRE \out_data_reg[40] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[40]),
        .Q(out_data[40]),
        .R(1'b0));
  FDRE \out_data_reg[41] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[41]),
        .Q(out_data[41]),
        .R(1'b0));
  FDRE \out_data_reg[42] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[42]),
        .Q(out_data[42]),
        .R(1'b0));
  FDRE \out_data_reg[43] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[43]),
        .Q(out_data[43]),
        .R(1'b0));
  FDRE \out_data_reg[44] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[44]),
        .Q(out_data[44]),
        .R(1'b0));
  FDRE \out_data_reg[45] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[45]),
        .Q(out_data[45]),
        .R(1'b0));
  FDRE \out_data_reg[46] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[46]),
        .Q(out_data[46]),
        .R(1'b0));
  FDRE \out_data_reg[47] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[47]),
        .Q(out_data[47]),
        .R(1'b0));
  FDRE \out_data_reg[48] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[48]),
        .Q(out_data[48]),
        .R(1'b0));
  FDRE \out_data_reg[49] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[49]),
        .Q(out_data[49]),
        .R(1'b0));
  FDRE \out_data_reg[4] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[4]),
        .Q(out_data[4]),
        .R(1'b0));
  FDRE \out_data_reg[50] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[50]),
        .Q(out_data[50]),
        .R(1'b0));
  FDRE \out_data_reg[51] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[51]),
        .Q(out_data[51]),
        .R(1'b0));
  FDRE \out_data_reg[52] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[52]),
        .Q(out_data[52]),
        .R(1'b0));
  FDRE \out_data_reg[53] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[53]),
        .Q(out_data[53]),
        .R(1'b0));
  FDRE \out_data_reg[54] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[54]),
        .Q(out_data[54]),
        .R(1'b0));
  FDRE \out_data_reg[55] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[55]),
        .Q(out_data[55]),
        .R(1'b0));
  FDRE \out_data_reg[56] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[56]),
        .Q(out_data[56]),
        .R(1'b0));
  FDRE \out_data_reg[57] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[57]),
        .Q(out_data[57]),
        .R(1'b0));
  FDRE \out_data_reg[58] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[58]),
        .Q(out_data[58]),
        .R(1'b0));
  FDRE \out_data_reg[59] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[59]),
        .Q(out_data[59]),
        .R(1'b0));
  FDRE \out_data_reg[5] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[5]),
        .Q(out_data[5]),
        .R(1'b0));
  FDRE \out_data_reg[60] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[60]),
        .Q(out_data[60]),
        .R(1'b0));
  FDRE \out_data_reg[61] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[61]),
        .Q(out_data[61]),
        .R(1'b0));
  FDRE \out_data_reg[62] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[62]),
        .Q(out_data[62]),
        .R(1'b0));
  FDRE \out_data_reg[63] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[63]),
        .Q(out_data[63]),
        .R(1'b0));
  FDRE \out_data_reg[64] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[64]),
        .Q(out_data[64]),
        .R(1'b0));
  FDRE \out_data_reg[6] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[6]),
        .Q(out_data[6]),
        .R(1'b0));
  FDRE \out_data_reg[7] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[7]),
        .Q(out_data[7]),
        .R(1'b0));
  FDRE \out_data_reg[8] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[8]),
        .Q(out_data[8]),
        .R(1'b0));
  FDRE \out_data_reg[9] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(out_data0[9]),
        .Q(out_data[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_addr[0]_i_1 
       (.I0(rd_addr[0]),
        .O(\rd_addr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h94)) 
    \rd_addr[1]_i_1 
       (.I0(rd_addr[2]),
        .I1(rd_addr[0]),
        .I2(rd_addr[1]),
        .O(\rd_addr[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_addr[2]_i_1 
       (.I0(out_resetn),
        .O(\rd_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h42)) 
    \rd_addr[2]_i_2 
       (.I0(rd_addr[2]),
        .I1(rd_addr[1]),
        .I2(rd_addr[0]),
        .O(\rd_addr[2]_i_2_n_0 ));
  FDRE \rd_addr_reg[0] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(\rd_addr[0]_i_1_n_0 ),
        .Q(rd_addr[0]),
        .R(\rd_addr[2]_i_1_n_0 ));
  FDRE \rd_addr_reg[1] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(\rd_addr[1]_i_1_n_0 ),
        .Q(rd_addr[1]),
        .R(\rd_addr[2]_i_1_n_0 ));
  FDRE \rd_addr_reg[2] 
       (.C(out_clk),
        .CE(\out_data[64]_i_1_n_0 ),
        .D(\rd_addr[2]_i_2_n_0 ),
        .Q(rd_addr[2]),
        .R(\rd_addr[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_addr[0]_i_1 
       (.I0(wr_addr[0]),
        .O(\wr_addr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h94)) 
    \wr_addr[1]_i_1 
       (.I0(wr_addr[2]),
        .I1(wr_addr[0]),
        .I2(wr_addr[1]),
        .O(\wr_addr[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_addr[2]_i_1 
       (.I0(in_resetn),
        .O(\wr_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h42)) 
    \wr_addr[2]_i_2 
       (.I0(wr_addr[2]),
        .I1(wr_addr[1]),
        .I2(wr_addr[0]),
        .O(\wr_addr[2]_i_2_n_0 ));
  FDRE \wr_addr_reg[0] 
       (.C(in_clk),
        .CE(1'b1),
        .D(\wr_addr[0]_i_1_n_0 ),
        .Q(wr_addr[0]),
        .R(\wr_addr[2]_i_1_n_0 ));
  FDRE \wr_addr_reg[1] 
       (.C(in_clk),
        .CE(1'b1),
        .D(\wr_addr[1]_i_1_n_0 ),
        .Q(wr_addr[1]),
        .R(\wr_addr[2]_i_1_n_0 ));
  FDRE \wr_addr_reg[2] 
       (.C(in_clk),
        .CE(1'b1),
        .D(\wr_addr[2]_i_2_n_0 ),
        .Q(wr_addr[2]),
        .R(\wr_addr[2]_i_1_n_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "system_sync_slow_to_fast_0,sync_slow_to_fast,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "sync_slow_to_fast,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module system_sync_slow_to_fast_1
   (in_data,
    in_resetn,
    in_clk,
    out_data,
    out_resetn,
    out_clk);
  input [64:0]in_data;
  input in_resetn;
  input in_clk;
  output [64:0]out_data;
  input out_resetn;
  input out_clk;

  wire in_clk;
  wire [64:0]in_data;
  wire in_resetn;
  wire out_clk;
  wire [64:0]out_data;
  wire out_resetn;

  system_sync_slow_to_fast_1_sync_slow_to_fast inst
       (.in_clk(in_clk),
        .in_data(in_data),
        .in_resetn(in_resetn),
        .out_clk(out_clk),
        .out_data(out_data),
        .out_resetn(out_resetn));
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
