// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:20:50 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_pl_sysmon_0_sim_netlist.v
// Design      : system_pl_sysmon_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    ip2intc_irpt,
    vauxp0,
    vauxn0,
    vauxp1,
    vauxn1,
    vauxp2,
    vauxn2,
    vauxp3,
    vauxn3,
    vauxp4,
    vauxn4,
    vauxp5,
    vauxn5,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp8,
    vauxn8,
    vauxp9,
    vauxn9,
    vauxp10,
    vauxn10,
    channel_out,
    busy_out,
    eoc_out,
    eos_out,
    ot_out,
    alarm_out);
  input s_axi_aclk;
  input s_axi_aresetn;
  input [12:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [12:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output ip2intc_irpt;
  input vauxp0;
  input vauxn0;
  input vauxp1;
  input vauxn1;
  input vauxp2;
  input vauxn2;
  input vauxp3;
  input vauxn3;
  input vauxp4;
  input vauxn4;
  input vauxp5;
  input vauxn5;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp8;
  input vauxn8;
  input vauxp9;
  input vauxn9;
  input vauxp10;
  input vauxn10;
  output [5:0]channel_out;
  output busy_out;
  output eoc_out;
  output eos_out;
  output ot_out;
  output alarm_out;

  wire \<const0> ;
  wire alarm_out;
  wire busy_out;
  wire [5:0]channel_out;
  wire eoc_out;
  wire eos_out;
  wire ip2intc_irpt;
  wire ot_out;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]\^s_axi_rdata ;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire vauxn0;
  wire vauxn1;
  wire vauxn10;
  wire vauxn2;
  wire vauxn3;
  wire vauxn4;
  wire vauxn5;
  wire vauxn6;
  wire vauxn7;
  wire vauxn8;
  wire vauxn9;
  wire vauxp0;
  wire vauxp1;
  wire vauxp10;
  wire vauxp2;
  wire vauxp3;
  wire vauxp4;
  wire vauxp5;
  wire vauxp6;
  wire vauxp7;
  wire vauxp8;
  wire vauxp9;
  wire [15:0]NLW_inst_alarm_out_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bresp_UNCONNECTED;
  wire [30:18]NLW_inst_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rresp_UNCONNECTED;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rdata[31] = \^s_axi_rdata [31];
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17:0] = \^s_axi_rdata [17:0];
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_FAMILY = "virtex7" *) 
  (* C_INCLUDE_INTR = "1" *) 
  (* C_INSTANCE = "system_pl_sysmon_0_axi_xadc" *) 
  (* C_SIM_MONITOR_FILE = "design.txt" *) 
  (* C_S_AXI_ADDR_WIDTH = "13" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* hdl = "VHDL" *) 
  (* ip_group = "LOGICORE" *) 
  (* iptype = "PERIPHERAL" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_axi_xadc inst
       (.alarm_out({NLW_inst_alarm_out_UNCONNECTED[15:8],alarm_out,NLW_inst_alarm_out_UNCONNECTED[6:0]}),
        .busy_out(busy_out),
        .channel_out(channel_out),
        .eoc_out(eoc_out),
        .eos_out(eos_out),
        .ip2intc_irpt(ip2intc_irpt),
        .ot_out(ot_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr({1'b0,1'b0,s_axi_araddr[10:2],1'b0,1'b0}),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr({1'b0,1'b0,s_axi_awaddr[10:2],1'b0,1'b0}),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp({\^s_axi_bresp ,NLW_inst_s_axi_bresp_UNCONNECTED[0]}),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(\^s_axi_rdata ),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp({\^s_axi_rresp ,NLW_inst_s_axi_rresp_UNCONNECTED[0]}),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata({s_axi_wdata[31],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axi_wdata[17:0]}),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .vauxn0(vauxn0),
        .vauxn1(vauxn1),
        .vauxn10(vauxn10),
        .vauxn2(vauxn2),
        .vauxn3(vauxn3),
        .vauxn4(vauxn4),
        .vauxn5(vauxn5),
        .vauxn6(vauxn6),
        .vauxn7(vauxn7),
        .vauxn8(vauxn8),
        .vauxn9(vauxn9),
        .vauxp0(vauxp0),
        .vauxp1(vauxp1),
        .vauxp10(vauxp10),
        .vauxp2(vauxp2),
        .vauxp3(vauxp3),
        .vauxp4(vauxp4),
        .vauxp5(vauxp5),
        .vauxp6(vauxp6),
        .vauxp7(vauxp7),
        .vauxp8(vauxp8),
        .vauxp9(vauxp9),
        .vn(1'b0),
        .vp(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_address_decoder
   (\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ,
    Bus_RNW_reg_reg_0,
    local_reg_wrack0,
    convst_rst_wrce_or_reduce,
    DWE,
    bus2ip_wrce,
    local_reg_rdack0,
    local_rdce_or_reduce,
    D,
    status_reg_rdack0,
    bus2ip_rdce,
    rst_ip2bus_error,
    reset_trig0,
    sw_rst_cond,
    Intr2Bus_RdAck0,
    irpt_rdack,
    interrupt_wrce_strb,
    irpt_wrack,
    E,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ,
    dummy_local_reg_rdack0,
    dummy_local_reg_rdack_d10,
    dummy_local_reg_wrack0,
    dummy_local_reg_wrack_d10,
    rst_ip2bus_rdack0,
    ip_irpt_status_reg1__0,
    s_axi_wdata_0_sp_1,
    \s_axi_wdata[31] ,
    Q,
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 ,
    s_axi_aclk,
    local_reg_wrack_d1,
    jtaglocked_i,
    local_reg_rdack_d1,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ,
    p_1_in46_in,
    p_1_in43_in,
    p_1_in40_in,
    p_1_in37_in,
    p_1_in34_in,
    p_1_in31_in,
    p_1_in28_in,
    p_1_in25_in,
    p_1_in22_in,
    p_1_in19_in,
    p_1_in16_in,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ,
    p_1_in13_in,
    p_1_in10_in,
    p_1_in7_in,
    p_1_in4_in,
    p_1_in1_in,
    p_1_in_0,
    jtagmodified_i,
    jtagmodified_d1,
    status_reg_rdack_d1,
    data_is_non_reset_match__3,
    sw_rst_cond_d1,
    ipif_glbl_irpt_enable_reg_reg,
    s_axi_wstrb,
    ipif_glbl_irpt_enable_reg,
    bus2ip_be,
    irpt_rdack_d1,
    irpt_wrack_d1,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ,
    dummy_local_reg_rdack_d1,
    dummy_local_reg_wrack_d1,
    rst_ip2bus_rdack_d1,
    s_axi_wdata,
    hard_macro_rst_reg,
    ip2bus_wrack,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ,
    ip2bus_rdack,
    s_axi_aresetn);
  output \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ;
  output Bus_RNW_reg_reg_0;
  output local_reg_wrack0;
  output convst_rst_wrce_or_reduce;
  output DWE;
  output [0:0]bus2ip_wrce;
  output local_reg_rdack0;
  output local_rdce_or_reduce;
  output [18:0]D;
  output status_reg_rdack0;
  output [2:0]bus2ip_rdce;
  output rst_ip2bus_error;
  output reset_trig0;
  output sw_rst_cond;
  output Intr2Bus_RdAck0;
  output irpt_rdack;
  output interrupt_wrce_strb;
  output irpt_wrack;
  output [0:0]E;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  output dummy_local_reg_rdack0;
  output dummy_local_reg_rdack_d10;
  output dummy_local_reg_wrack0;
  output dummy_local_reg_wrack_d10;
  output rst_ip2bus_rdack0;
  output ip_irpt_status_reg1__0;
  output s_axi_wdata_0_sp_1;
  output \s_axi_wdata[31] ;
  input Q;
  input [8:0]\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 ;
  input s_axi_aclk;
  input local_reg_wrack_d1;
  input jtaglocked_i;
  input local_reg_rdack_d1;
  input \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  input [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  input p_1_in46_in;
  input p_1_in43_in;
  input p_1_in40_in;
  input p_1_in37_in;
  input p_1_in34_in;
  input p_1_in31_in;
  input p_1_in28_in;
  input p_1_in25_in;
  input p_1_in22_in;
  input p_1_in19_in;
  input p_1_in16_in;
  input [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  input [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  input [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  input p_1_in13_in;
  input p_1_in10_in;
  input p_1_in7_in;
  input p_1_in4_in;
  input p_1_in1_in;
  input p_1_in_0;
  input jtagmodified_i;
  input jtagmodified_d1;
  input status_reg_rdack_d1;
  input data_is_non_reset_match__3;
  input sw_rst_cond_d1;
  input ipif_glbl_irpt_enable_reg_reg;
  input [0:0]s_axi_wstrb;
  input ipif_glbl_irpt_enable_reg;
  input [0:0]bus2ip_be;
  input irpt_rdack_d1;
  input irpt_wrack_d1;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  input dummy_local_reg_rdack_d1;
  input dummy_local_reg_wrack_d1;
  input rst_ip2bus_rdack_d1;
  input [1:0]s_axi_wdata;
  input hard_macro_rst_reg;
  input ip2bus_wrack;
  input [0:0]\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  input ip2bus_rdack;
  input s_axi_aresetn;

  wire Bus_RNW_reg_i_1_n_0;
  wire Bus_RNW_reg_reg_0;
  wire [18:0]D;
  wire DWE;
  wire [0:0]E;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  wire \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ;
  wire [8:0]\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 ;
  wire \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0 ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0 ;
  wire [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  wire [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  wire [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  wire [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  wire Intr2Bus_RdAck0;
  wire Q;
  wire [0:0]bus2ip_be;
  wire [2:0]bus2ip_rdce;
  wire [0:0]bus2ip_wrce;
  wire ce_expnd_i_1;
  wire ce_expnd_i_10;
  wire ce_expnd_i_11;
  wire ce_expnd_i_12;
  wire ce_expnd_i_13;
  wire ce_expnd_i_14;
  wire ce_expnd_i_15;
  wire ce_expnd_i_16;
  wire ce_expnd_i_17;
  wire ce_expnd_i_18;
  wire ce_expnd_i_19;
  wire ce_expnd_i_2;
  wire ce_expnd_i_20;
  wire ce_expnd_i_21;
  wire ce_expnd_i_22;
  wire ce_expnd_i_23;
  wire ce_expnd_i_24;
  wire ce_expnd_i_3;
  wire ce_expnd_i_4;
  wire ce_expnd_i_5;
  wire ce_expnd_i_6;
  wire ce_expnd_i_7;
  wire ce_expnd_i_8;
  wire ce_expnd_i_9;
  wire convst_rst_wrce_or_reduce;
  wire cs_ce_clr;
  wire data_is_non_reset_match__3;
  wire dummy_local_reg_rdack0;
  wire dummy_local_reg_rdack_d1;
  wire dummy_local_reg_rdack_d10;
  wire dummy_local_reg_wrack0;
  wire dummy_local_reg_wrack_d1;
  wire dummy_local_reg_wrack_d10;
  wire hard_macro_rst_reg;
  wire interrupt_wrce_strb;
  wire ip2bus_rdack;
  wire ip2bus_wrack;
  wire ip_irpt_status_reg1__0;
  wire ipif_glbl_irpt_enable_reg;
  wire ipif_glbl_irpt_enable_reg_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire jtaglocked_i;
  wire jtagmodified_d1;
  wire jtagmodified_i;
  wire local_rdce_or_reduce;
  wire local_reg_rdack0;
  wire local_reg_rdack_d1;
  wire local_reg_wrack0;
  wire local_reg_wrack_d1;
  wire p_10_in;
  wire p_11_in;
  wire p_12_in;
  wire p_13_in;
  wire p_14_in;
  wire p_15_in;
  wire p_16_in;
  wire p_17_in;
  wire p_18_in;
  wire p_19_in;
  wire p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in1_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in4_in;
  wire p_1_in7_in;
  wire p_1_in_0;
  wire p_20_in;
  wire p_21_in;
  wire p_22_in;
  wire p_23_in;
  wire p_24_in;
  wire p_2_in;
  wire p_3_in;
  wire p_4_in;
  wire p_5_in;
  wire p_6_in;
  wire p_7_in;
  wire p_8_in;
  wire p_9_in;
  wire reset_trig0;
  wire rst_ip2bus_error;
  wire rst_ip2bus_rdack0;
  wire rst_ip2bus_rdack_d1;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [1:0]s_axi_wdata;
  wire \s_axi_wdata[31] ;
  wire s_axi_wdata_0_sn_1;
  wire [0:0]s_axi_wstrb;
  wire status_reg_rdack0;
  wire status_reg_rdack_d1;
  wire sw_rst_cond;
  wire sw_rst_cond_d1;

  assign s_axi_wdata_0_sp_1 = s_axi_wdata_0_sn_1;
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Bus_RNW_reg_i_1
       (.I0(ipif_glbl_irpt_enable_reg_reg),
        .I1(Q),
        .I2(Bus_RNW_reg_reg_0),
        .O(Bus_RNW_reg_i_1_n_0));
  FDRE Bus_RNW_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Bus_RNW_reg_i_1_n_0),
        .Q(Bus_RNW_reg_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_24));
  FDRE \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_24),
        .Q(p_24_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \GEN_BKEND_CE_REGISTERS[10].ce_out_i[10]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_14));
  FDRE \GEN_BKEND_CE_REGISTERS[10].ce_out_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_14),
        .Q(p_14_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \GEN_BKEND_CE_REGISTERS[11].ce_out_i[11]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_13));
  FDRE \GEN_BKEND_CE_REGISTERS[11].ce_out_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_13),
        .Q(p_13_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \GEN_BKEND_CE_REGISTERS[12].ce_out_i[12]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_12));
  FDRE \GEN_BKEND_CE_REGISTERS[12].ce_out_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_12),
        .Q(p_12_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \GEN_BKEND_CE_REGISTERS[13].ce_out_i[13]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_11));
  FDRE \GEN_BKEND_CE_REGISTERS[13].ce_out_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_11),
        .Q(p_11_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \GEN_BKEND_CE_REGISTERS[14].ce_out_i[14]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_10));
  FDRE \GEN_BKEND_CE_REGISTERS[14].ce_out_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_10),
        .Q(p_10_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \GEN_BKEND_CE_REGISTERS[15].ce_out_i[15]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_9));
  FDRE \GEN_BKEND_CE_REGISTERS[15].ce_out_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_9),
        .Q(p_9_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \GEN_BKEND_CE_REGISTERS[16].ce_out_i[16]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_8));
  FDRE \GEN_BKEND_CE_REGISTERS[16].ce_out_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_8),
        .Q(p_8_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \GEN_BKEND_CE_REGISTERS[17].ce_out_i[17]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_7));
  FDRE \GEN_BKEND_CE_REGISTERS[17].ce_out_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_7),
        .Q(p_7_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \GEN_BKEND_CE_REGISTERS[18].ce_out_i[18]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_6));
  FDRE \GEN_BKEND_CE_REGISTERS[18].ce_out_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_6),
        .Q(p_6_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \GEN_BKEND_CE_REGISTERS[19].ce_out_i[19]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_5));
  FDRE \GEN_BKEND_CE_REGISTERS[19].ce_out_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_5),
        .Q(p_5_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_23));
  FDRE \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_23),
        .Q(p_23_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \GEN_BKEND_CE_REGISTERS[20].ce_out_i[20]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_4));
  FDRE \GEN_BKEND_CE_REGISTERS[20].ce_out_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_4),
        .Q(p_4_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \GEN_BKEND_CE_REGISTERS[21].ce_out_i[21]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_3));
  FDRE \GEN_BKEND_CE_REGISTERS[21].ce_out_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_3),
        .Q(p_3_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \GEN_BKEND_CE_REGISTERS[22].ce_out_i[22]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_2));
  FDRE \GEN_BKEND_CE_REGISTERS[22].ce_out_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_2),
        .Q(p_2_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_1));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2 
       (.I0(Q),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [8]),
        .I2(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [5]),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [6]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [7]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .O(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[23].ce_out_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_1),
        .Q(p_1_in),
        .R(cs_ce_clr));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i[24]_i_1 
       (.I0(ip2bus_wrack),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(ip2bus_rdack),
        .I3(s_axi_aresetn),
        .O(cs_ce_clr));
  FDRE \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [8]),
        .Q(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i[2]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_22));
  FDRE \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_22),
        .Q(p_22_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_21));
  FDRE \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_21),
        .Q(p_21_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \GEN_BKEND_CE_REGISTERS[4].ce_out_i[4]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_20));
  FDRE \GEN_BKEND_CE_REGISTERS[4].ce_out_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_20),
        .Q(p_20_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \GEN_BKEND_CE_REGISTERS[5].ce_out_i[5]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_19));
  FDRE \GEN_BKEND_CE_REGISTERS[5].ce_out_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_19),
        .Q(p_19_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \GEN_BKEND_CE_REGISTERS[6].ce_out_i[6]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_18));
  FDRE \GEN_BKEND_CE_REGISTERS[6].ce_out_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_18),
        .Q(p_18_in),
        .R(cs_ce_clr));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [4]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I5(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_17));
  LUT5 #(
    .INIT(32'h00010000)) 
    \GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [7]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [6]),
        .I2(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [5]),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [8]),
        .I4(Q),
        .O(\GEN_BKEND_CE_REGISTERS[7].ce_out_i[7]_i_2_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[7].ce_out_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_17),
        .Q(p_17_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \GEN_BKEND_CE_REGISTERS[8].ce_out_i[8]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_16));
  FDRE \GEN_BKEND_CE_REGISTERS[8].ce_out_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_16),
        .Q(p_16_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    \GEN_BKEND_CE_REGISTERS[9].ce_out_i[9]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [1]),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [3]),
        .I2(\GEN_BKEND_CE_REGISTERS[23].ce_out_i[23]_i_2_n_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [0]),
        .I4(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 [2]),
        .O(ce_expnd_i_15));
  FDRE \GEN_BKEND_CE_REGISTERS[9].ce_out_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_15),
        .Q(p_15_in),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_2 
       (.I0(irpt_wrack_d1),
        .I1(Bus_RNW_reg_reg_0),
        .I2(bus2ip_be),
        .I3(p_8_in),
        .O(ip_irpt_status_reg1__0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1_i_1 
       (.I0(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_i_1 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ),
        .I2(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ),
        .O(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_1 
       (.I0(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2 
       (.I0(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0 ),
        .I1(p_2_in),
        .I2(p_3_in),
        .I3(p_16_in),
        .I4(p_1_in),
        .I5(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0 ),
        .O(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3 
       (.I0(p_14_in),
        .I1(p_15_in),
        .I2(p_12_in),
        .I3(p_13_in),
        .O(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4 
       (.I0(p_7_in),
        .I1(p_11_in),
        .I2(p_10_in),
        .I3(p_4_in),
        .I4(p_5_in),
        .O(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_i_1 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_i_2_n_0 ),
        .I2(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ),
        .O(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[0]_i_1 
       (.I0(p_6_in),
        .I1(p_8_in),
        .I2(ipif_glbl_irpt_enable_reg),
        .I3(Bus_RNW_reg_reg_0),
        .I4(p_9_in),
        .I5(bus2ip_be),
        .O(D[18]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in_0),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [17]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .O(D[17]));
  LUT6 #(
    .INIT(64'h0000000000A80000)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I1(jtagmodified_i),
        .I2(jtagmodified_d1),
        .I3(p_22_in),
        .I4(Bus_RNW_reg_reg_0),
        .I5(p_23_in),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_3 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_8_in),
        .I2(s_axi_wstrb),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .O(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00A80000)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4 
       (.I0(p_6_in),
        .I1(ipif_glbl_irpt_enable_reg_reg),
        .I2(s_axi_wstrb),
        .I3(p_8_in),
        .I4(Bus_RNW_reg_reg_0),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [16]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .I3(jtaglocked_i),
        .I4(p_1_in1_in),
        .I5(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I1(p_22_in),
        .I2(Bus_RNW_reg_reg_0),
        .I3(p_23_in),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[16]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [15]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [15]),
        .I4(p_1_in4_in),
        .I5(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I1(p_1_in7_in),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [14]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0 ),
        .O(D[14]));
  LUT4 #(
    .INIT(16'hF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [14]),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [14]),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3 
       (.I0(p_23_in),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(p_22_in),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I1(p_1_in10_in),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [13]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0 ),
        .O(D[13]));
  LUT4 #(
    .INIT(16'hF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [13]),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [13]),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I1(p_1_in13_in),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [12]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0 ),
        .O(D[12]));
  LUT4 #(
    .INIT(16'hF888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [12]),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [12]),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in16_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [11]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [11]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [11]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [11]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3 
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I1(p_23_in),
        .I2(Bus_RNW_reg_reg_0),
        .I3(p_22_in),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in19_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [10]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [10]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [10]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in22_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [9]),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [9]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [9]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [9]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in25_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [8]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [8]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [8]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in28_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [7]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [7]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [7]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in31_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [6]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [6]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [6]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in34_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [5]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [5]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [5]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in37_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [4]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [4]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [4]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in40_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [3]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [3]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [3]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in43_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [2]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [2]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [2]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[29]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(p_1_in46_in),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [1]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [1]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [1]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_1 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I/irpt_rdack161_out ),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int[20]_i_3_n_0 ),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2 
       (.I0(\INTR_CTRLR_GEN_I.ip2bus_data_int[17]_i_3_n_0 ),
        .I1(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] [0]),
        .I2(\INTR_CTRLR_GEN_I.ip2bus_data_int[14]_i_4_n_0 ),
        .I3(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] [0]),
        .I4(\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] [0]),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_data_int[15]_i_2_n_0 ),
        .O(\INTR_CTRLR_GEN_I.ip2bus_data_int[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \INTR_CTRLR_GEN_I.ip2bus_error_i_5 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_24_in),
        .I2(data_is_non_reset_match__3),
        .O(rst_ip2bus_error));
  LUT6 #(
    .INIT(64'h00000000A0A0A080)) 
    Intr2Bus_RdAck_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_8_in),
        .I2(bus2ip_be),
        .I3(p_6_in),
        .I4(p_9_in),
        .I5(irpt_rdack_d1),
        .O(Intr2Bus_RdAck0));
  LUT6 #(
    .INIT(64'h0000000050505040)) 
    Intr2Bus_WrAck_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_9_in),
        .I2(bus2ip_be),
        .I3(p_6_in),
        .I4(p_8_in),
        .I5(irpt_wrack_d1),
        .O(interrupt_wrce_strb));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    drdy_rd_ack_i_d1_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(bus2ip_rdce[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    drdy_wr_ack_i_d1_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(bus2ip_wrce));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    dummy_local_reg_rdack_d1_i_1
       (.I0(p_19_in),
        .I1(p_18_in),
        .I2(p_17_in),
        .I3(Bus_RNW_reg_reg_0),
        .O(dummy_local_reg_rdack_d10));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h0000AAA8)) 
    dummy_local_reg_rdack_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_17_in),
        .I2(p_18_in),
        .I3(p_19_in),
        .I4(dummy_local_reg_rdack_d1),
        .O(dummy_local_reg_rdack0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    dummy_local_reg_wrack_d1_i_1
       (.I0(p_19_in),
        .I1(p_18_in),
        .I2(p_17_in),
        .I3(Bus_RNW_reg_reg_0),
        .O(dummy_local_reg_wrack_d10));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00005554)) 
    dummy_local_reg_wrack_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_17_in),
        .I2(p_18_in),
        .I3(p_19_in),
        .I4(dummy_local_reg_wrack_d1),
        .O(dummy_local_reg_wrack0));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    hard_macro_rst_reg_i_1
       (.I0(s_axi_wdata[0]),
        .I1(p_20_in),
        .I2(Bus_RNW_reg_reg_0),
        .I3(p_21_in),
        .I4(hard_macro_rst_reg),
        .O(s_axi_wdata_0_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h04)) 
    inst_sysmon_i_2
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 ),
        .I2(jtaglocked_i),
        .O(DWE));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \ip_irpt_enable_reg[17]_i_1 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_6_in),
        .I2(s_axi_wstrb),
        .I3(ipif_glbl_irpt_enable_reg_reg),
        .O(E));
  LUT6 #(
    .INIT(64'hEFEFEFFF20202000)) 
    ipif_glbl_irpt_enable_reg_i_1
       (.I0(s_axi_wdata[1]),
        .I1(Bus_RNW_reg_reg_0),
        .I2(p_9_in),
        .I3(s_axi_wstrb),
        .I4(ipif_glbl_irpt_enable_reg_reg),
        .I5(ipif_glbl_irpt_enable_reg),
        .O(\s_axi_wdata[31] ));
  LUT6 #(
    .INIT(64'hFFF0EEE000000000)) 
    irpt_rdack_d1_i_1
       (.I0(p_9_in),
        .I1(p_6_in),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .I3(s_axi_wstrb),
        .I4(p_8_in),
        .I5(Bus_RNW_reg_reg_0),
        .O(irpt_rdack));
  LUT6 #(
    .INIT(64'h00000000FFF0EEE0)) 
    irpt_wrack_d1_i_1
       (.I0(p_8_in),
        .I1(p_6_in),
        .I2(ipif_glbl_irpt_enable_reg_reg),
        .I3(s_axi_wstrb),
        .I4(p_9_in),
        .I5(Bus_RNW_reg_reg_0),
        .O(irpt_wrack));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hF0E0)) 
    local_reg_rdack_d1_i_1
       (.I0(p_22_in),
        .I1(p_20_in),
        .I2(Bus_RNW_reg_reg_0),
        .I3(p_21_in),
        .O(local_rdce_or_reduce));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0000CCC8)) 
    local_reg_rdack_i_1
       (.I0(p_21_in),
        .I1(Bus_RNW_reg_reg_0),
        .I2(p_20_in),
        .I3(p_22_in),
        .I4(local_reg_rdack_d1),
        .O(local_reg_rdack0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00FF00FE)) 
    local_reg_wrack_d1_i_1
       (.I0(p_22_in),
        .I1(p_23_in),
        .I2(p_21_in),
        .I3(Bus_RNW_reg_reg_0),
        .I4(p_20_in),
        .O(convst_rst_wrce_or_reduce));
  LUT6 #(
    .INIT(64'h0000000033333332)) 
    local_reg_wrack_i_1
       (.I0(p_20_in),
        .I1(Bus_RNW_reg_reg_0),
        .I2(p_21_in),
        .I3(p_23_in),
        .I4(p_22_in),
        .I5(local_reg_wrack_d1),
        .O(local_reg_wrack0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    reset_trig_i_1
       (.I0(data_is_non_reset_match__3),
        .I1(p_24_in),
        .I2(Bus_RNW_reg_reg_0),
        .I3(sw_rst_cond_d1),
        .O(reset_trig0));
  LUT2 #(
    .INIT(4'h8)) 
    rst_ip2bus_rdack_d1_i_1
       (.I0(p_24_in),
        .I1(Bus_RNW_reg_reg_0),
        .O(bus2ip_rdce[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    rst_ip2bus_rdack_i_1
       (.I0(rst_ip2bus_rdack_d1),
        .I1(Bus_RNW_reg_reg_0),
        .I2(p_24_in),
        .O(rst_ip2bus_rdack0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    status_reg_rdack_d1_i_1
       (.I0(p_23_in),
        .I1(Bus_RNW_reg_reg_0),
        .O(bus2ip_rdce[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    status_reg_rdack_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_23_in),
        .I2(status_reg_rdack_d1),
        .O(status_reg_rdack0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h04)) 
    sw_rst_cond_d1_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(p_24_in),
        .I2(data_is_non_reset_match__3),
        .O(sw_rst_cond));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_axi_lite_ipif
   (bus2ip_reset_active_high,
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ,
    Q,
    s_axi_rresp,
    Bus_RNW_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    local_reg_wrack0,
    convst_rst_wrce_or_reduce,
    DWE,
    bus2ip_wrce,
    local_reg_rdack0,
    local_rdce_or_reduce,
    D,
    status_reg_rdack0,
    bus2ip_rdce,
    reset2ip_reset,
    rst_ip2bus_error,
    reset_trig0,
    sw_rst_cond,
    and_reduce_be,
    Intr2Bus_RdAck0,
    irpt_rdack,
    interrupt_wrce_strb,
    irpt_wrack,
    E,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ,
    dummy_local_reg_rdack0,
    dummy_local_reg_rdack_d10,
    dummy_local_reg_wrack0,
    dummy_local_reg_wrack_d10,
    rst_ip2bus_rdack0,
    ip_irpt_status_reg1__0,
    s_axi_wdata_0_sp_1,
    \s_axi_wdata[31] ,
    RESET,
    SR,
    s_axi_bresp,
    s_axi_rdata,
    s_axi_arready,
    s_axi_awready,
    s_axi_aclk,
    p_1_in,
    s_axi_arvalid,
    local_reg_wrack_d1,
    jtaglocked_i,
    local_reg_rdack_d1,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ,
    p_1_in46_in,
    p_1_in43_in,
    p_1_in40_in,
    p_1_in37_in,
    p_1_in34_in,
    p_1_in31_in,
    p_1_in28_in,
    p_1_in25_in,
    p_1_in22_in,
    p_1_in19_in,
    p_1_in16_in,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ,
    p_1_in13_in,
    p_1_in10_in,
    p_1_in7_in,
    p_1_in4_in,
    p_1_in1_in,
    p_1_in_0,
    jtagmodified_i,
    jtagmodified_d1,
    status_reg_rdack_d1,
    \do_reg_reg[15] ,
    sw_rst_cond_d1,
    s_axi_wstrb,
    s_axi_wdata,
    ipif_glbl_irpt_enable_reg,
    irpt_rdack_d1,
    irpt_wrack_d1,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ,
    dummy_local_reg_rdack_d1,
    dummy_local_reg_wrack_d1,
    rst_ip2bus_rdack_d1,
    ip2bus_rdack,
    s_axi_rready,
    ip2bus_wrack,
    s_axi_bready,
    hard_macro_rst_reg,
    s_axi_awvalid,
    s_axi_wvalid,
    \s_axi_rdata_i_reg[31] ,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_awaddr);
  output bus2ip_reset_active_high;
  output \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ;
  output [7:0]Q;
  output [0:0]s_axi_rresp;
  output Bus_RNW_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output local_reg_wrack0;
  output convst_rst_wrce_or_reduce;
  output DWE;
  output [0:0]bus2ip_wrce;
  output local_reg_rdack0;
  output local_rdce_or_reduce;
  output [18:0]D;
  output status_reg_rdack0;
  output [2:0]bus2ip_rdce;
  output reset2ip_reset;
  output rst_ip2bus_error;
  output reset_trig0;
  output sw_rst_cond;
  output and_reduce_be;
  output Intr2Bus_RdAck0;
  output irpt_rdack;
  output interrupt_wrce_strb;
  output irpt_wrack;
  output [0:0]E;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  output dummy_local_reg_rdack0;
  output dummy_local_reg_rdack_d10;
  output dummy_local_reg_wrack0;
  output dummy_local_reg_wrack_d10;
  output rst_ip2bus_rdack0;
  output ip_irpt_status_reg1__0;
  output s_axi_wdata_0_sp_1;
  output \s_axi_wdata[31] ;
  output RESET;
  output [0:0]SR;
  output [0:0]s_axi_bresp;
  output [18:0]s_axi_rdata;
  output s_axi_arready;
  output s_axi_awready;
  input s_axi_aclk;
  input [0:0]p_1_in;
  input s_axi_arvalid;
  input local_reg_wrack_d1;
  input jtaglocked_i;
  input local_reg_rdack_d1;
  input \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  input [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  input p_1_in46_in;
  input p_1_in43_in;
  input p_1_in40_in;
  input p_1_in37_in;
  input p_1_in34_in;
  input p_1_in31_in;
  input p_1_in28_in;
  input p_1_in25_in;
  input p_1_in22_in;
  input p_1_in19_in;
  input p_1_in16_in;
  input [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  input [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  input [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  input p_1_in13_in;
  input p_1_in10_in;
  input p_1_in7_in;
  input p_1_in4_in;
  input p_1_in1_in;
  input p_1_in_0;
  input jtagmodified_i;
  input jtagmodified_d1;
  input status_reg_rdack_d1;
  input \do_reg_reg[15] ;
  input sw_rst_cond_d1;
  input [3:0]s_axi_wstrb;
  input [4:0]s_axi_wdata;
  input ipif_glbl_irpt_enable_reg;
  input irpt_rdack_d1;
  input irpt_wrack_d1;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  input dummy_local_reg_rdack_d1;
  input dummy_local_reg_wrack_d1;
  input rst_ip2bus_rdack_d1;
  input ip2bus_rdack;
  input s_axi_rready;
  input ip2bus_wrack;
  input s_axi_bready;
  input hard_macro_rst_reg;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [18:0]\s_axi_rdata_i_reg[31] ;
  input s_axi_aresetn;
  input [8:0]s_axi_araddr;
  input [8:0]s_axi_awaddr;

  wire Bus_RNW_reg;
  wire [18:0]D;
  wire DWE;
  wire [0:0]E;
  wire \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  wire [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  wire [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  wire [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  wire [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  wire Intr2Bus_RdAck0;
  wire [7:0]Q;
  wire RESET;
  wire [0:0]SR;
  wire and_reduce_be;
  wire [2:0]bus2ip_rdce;
  wire bus2ip_reset_active_high;
  wire [0:0]bus2ip_wrce;
  wire convst_rst_wrce_or_reduce;
  wire \do_reg_reg[15] ;
  wire dummy_local_reg_rdack0;
  wire dummy_local_reg_rdack_d1;
  wire dummy_local_reg_rdack_d10;
  wire dummy_local_reg_wrack0;
  wire dummy_local_reg_wrack_d1;
  wire dummy_local_reg_wrack_d10;
  wire hard_macro_rst_reg;
  wire interrupt_wrce_strb;
  wire ip2bus_rdack;
  wire ip2bus_wrack;
  wire ip_irpt_status_reg1__0;
  wire ipif_glbl_irpt_enable_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire jtaglocked_i;
  wire jtagmodified_d1;
  wire jtagmodified_i;
  wire local_rdce_or_reduce;
  wire local_reg_rdack0;
  wire local_reg_rdack_d1;
  wire local_reg_wrack0;
  wire local_reg_wrack_d1;
  wire [0:0]p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in1_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in4_in;
  wire p_1_in7_in;
  wire p_1_in_0;
  wire reset2ip_reset;
  wire reset_trig0;
  wire rst_ip2bus_error;
  wire rst_ip2bus_rdack0;
  wire rst_ip2bus_rdack_d1;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [18:0]s_axi_rdata;
  wire [18:0]\s_axi_rdata_i_reg[31] ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [4:0]s_axi_wdata;
  wire \s_axi_wdata[31] ;
  wire s_axi_wdata_0_sn_1;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire status_reg_rdack0;
  wire status_reg_rdack_d1;
  wire sw_rst_cond;
  wire sw_rst_cond_d1;

  assign s_axi_wdata_0_sp_1 = s_axi_wdata_0_sn_1;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_slave_attachment I_SLAVE_ATTACHMENT
       (.Bus_RNW_reg_reg(Bus_RNW_reg),
        .D(D),
        .DWE(DWE),
        .E(E),
        .\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] (\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ),
        .Intr2Bus_RdAck0(Intr2Bus_RdAck0),
        .Q(Q),
        .RESET(RESET),
        .SR(bus2ip_reset_active_high),
        .and_reduce_be(and_reduce_be),
        .bus2ip_rdce(bus2ip_rdce),
        .bus2ip_wrce(bus2ip_wrce),
        .convst_rst_wrce_or_reduce(convst_rst_wrce_or_reduce),
        .\do_reg_reg[15] (\do_reg_reg[15] ),
        .dummy_local_reg_rdack0(dummy_local_reg_rdack0),
        .dummy_local_reg_rdack_d1(dummy_local_reg_rdack_d1),
        .dummy_local_reg_rdack_d10(dummy_local_reg_rdack_d10),
        .dummy_local_reg_wrack0(dummy_local_reg_wrack0),
        .dummy_local_reg_wrack_d1(dummy_local_reg_wrack_d1),
        .dummy_local_reg_wrack_d10(dummy_local_reg_wrack_d10),
        .hard_macro_rst_reg(hard_macro_rst_reg),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .ip2bus_rdack(ip2bus_rdack),
        .ip2bus_wrack(ip2bus_wrack),
        .ip_irpt_status_reg1__0(ip_irpt_status_reg1__0),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .jtaglocked_i(jtaglocked_i),
        .jtagmodified_d1(jtagmodified_d1),
        .jtagmodified_i(jtagmodified_i),
        .local_rdce_or_reduce(local_rdce_or_reduce),
        .local_reg_rdack0(local_reg_rdack0),
        .local_reg_rdack_d1(local_reg_rdack_d1),
        .local_reg_wrack0(local_reg_wrack0),
        .local_reg_wrack_d1(local_reg_wrack_d1),
        .p_1_in(p_1_in),
        .p_1_in10_in(p_1_in10_in),
        .p_1_in13_in(p_1_in13_in),
        .p_1_in16_in(p_1_in16_in),
        .p_1_in19_in(p_1_in19_in),
        .p_1_in1_in(p_1_in1_in),
        .p_1_in22_in(p_1_in22_in),
        .p_1_in25_in(p_1_in25_in),
        .p_1_in28_in(p_1_in28_in),
        .p_1_in31_in(p_1_in31_in),
        .p_1_in34_in(p_1_in34_in),
        .p_1_in37_in(p_1_in37_in),
        .p_1_in40_in(p_1_in40_in),
        .p_1_in43_in(p_1_in43_in),
        .p_1_in46_in(p_1_in46_in),
        .p_1_in4_in(p_1_in4_in),
        .p_1_in7_in(p_1_in7_in),
        .p_1_in_0(p_1_in_0),
        .reset2ip_reset(reset2ip_reset),
        .reset_trig0(reset_trig0),
        .rst_ip2bus_error(rst_ip2bus_error),
        .rst_ip2bus_rdack0(rst_ip2bus_rdack0),
        .rst_ip2bus_rdack_d1(rst_ip2bus_rdack_d1),
        .rst_reg_0(SR),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .\s_axi_rdata_i_reg[31]_0 (\s_axi_rdata_i_reg[31] ),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .\s_axi_wdata[31] (\s_axi_wdata[31] ),
        .s_axi_wdata_0_sp_1(s_axi_wdata_0_sn_1),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .status_reg_rdack0(status_reg_rdack0),
        .status_reg_rdack_d1(status_reg_rdack_d1),
        .sw_rst_cond(sw_rst_cond),
        .sw_rst_cond_d1(sw_rst_cond_d1));
endmodule

(* C_FAMILY = "virtex7" *) (* C_INCLUDE_INTR = "1" *) (* C_INSTANCE = "system_pl_sysmon_0_axi_xadc" *) 
(* C_SIM_MONITOR_FILE = "design.txt" *) (* C_S_AXI_ADDR_WIDTH = "13" *) (* C_S_AXI_DATA_WIDTH = "32" *) 
(* hdl = "VHDL" *) (* ip_group = "LOGICORE" *) (* iptype = "PERIPHERAL" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_axi_xadc
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    ip2intc_irpt,
    vauxp0,
    vauxn0,
    vauxp1,
    vauxn1,
    vauxp2,
    vauxn2,
    vauxp3,
    vauxn3,
    vauxp4,
    vauxn4,
    vauxp5,
    vauxn5,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp8,
    vauxn8,
    vauxp9,
    vauxn9,
    vauxp10,
    vauxn10,
    vp,
    vn,
    busy_out,
    channel_out,
    eoc_out,
    eos_out,
    ot_out,
    alarm_out);
  (* sigis = "Clk" *) input s_axi_aclk;
  (* sigis = "Rst" *) input s_axi_aresetn;
  input [12:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [12:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  (* sigis = "INTR_LEVEL_HIGH" *) output ip2intc_irpt;
  input vauxp0;
  input vauxn0;
  input vauxp1;
  input vauxn1;
  input vauxp2;
  input vauxn2;
  input vauxp3;
  input vauxn3;
  input vauxp4;
  input vauxn4;
  input vauxp5;
  input vauxn5;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp8;
  input vauxn8;
  input vauxp9;
  input vauxn9;
  input vauxp10;
  input vauxn10;
  input vp;
  input vn;
  output busy_out;
  output [5:0]channel_out;
  output eoc_out;
  output eos_out;
  output ot_out;
  output [15:0]alarm_out;

  wire \<const0> ;
  wire AXI_LITE_IPIF_I_n_1;
  wire AXI_LITE_IPIF_I_n_63;
  wire AXI_LITE_IPIF_I_n_64;
  wire AXI_LITE_IPIF_I_n_66;
  wire AXI_SYSMON_CORE_I_n_11;
  wire AXI_SYSMON_CORE_I_n_12;
  wire AXI_SYSMON_CORE_I_n_13;
  wire AXI_SYSMON_CORE_I_n_14;
  wire AXI_SYSMON_CORE_I_n_16;
  wire AXI_SYSMON_CORE_I_n_17;
  wire AXI_SYSMON_CORE_I_n_18;
  wire AXI_SYSMON_CORE_I_n_19;
  wire AXI_SYSMON_CORE_I_n_20;
  wire AXI_SYSMON_CORE_I_n_21;
  wire AXI_SYSMON_CORE_I_n_22;
  wire AXI_SYSMON_CORE_I_n_30;
  wire DWE;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1 ;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26 ;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31 ;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36 ;
  wire \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41 ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ;
  wire Intr2Bus_RdAck0;
  wire RESET;
  wire SOFT_RESET_I_n_2;
  wire [7:7]\^alarm_out ;
  wire [14:0]alarm_reg;
  wire and_reduce_be;
  wire [9:2]bus2ip_addr;
  wire [24:0]bus2ip_rdce;
  wire bus2ip_reset_active_high;
  wire [0:0]bus2ip_wrce;
  wire busy_out;
  wire [5:0]channel_out;
  wire convst_rst_wrce_or_reduce;
  wire [15:0]do_reg;
  wire dummy_local_reg_rdack;
  wire dummy_local_reg_rdack0;
  wire dummy_local_reg_rdack_d1;
  wire dummy_local_reg_rdack_d10;
  wire dummy_local_reg_wrack;
  wire dummy_local_reg_wrack0;
  wire dummy_local_reg_wrack_d1;
  wire dummy_local_reg_wrack_d10;
  wire eoc_out;
  wire eos_out;
  wire hard_macro_rst_reg;
  wire [8:9]interrupt_status_i;
  wire interrupt_wrce_strb;
  wire [0:0]intr_ip2bus_data;
  wire intr_ip2bus_rdack;
  wire [31:0]ip2bus_data;
  wire [14:31]ip2bus_data_int1;
  wire ip2bus_error_int1;
  wire ip2bus_rdack;
  wire ip2bus_rdack_int1;
  wire ip2bus_wrack;
  wire ip2bus_wrack_int1;
  wire ip2intc_irpt;
  wire ip_irpt_status_reg1__0;
  wire ipif_glbl_irpt_enable_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire irpt_wrack_d11;
  wire jtaglocked_i;
  wire jtagmodified_d1;
  wire jtagmodified_i;
  wire local_rdce_or_reduce;
  wire local_reg_rdack0;
  wire local_reg_rdack_d1;
  wire local_reg_wrack0;
  wire local_reg_wrack_d1;
  wire ot_out;
  wire p_0_in0_in;
  wire p_0_in14_in;
  wire p_0_in17_in;
  wire p_0_in20_in;
  wire p_0_in23_in;
  wire p_0_in29_in;
  wire p_0_in2_in;
  wire p_0_in32_in;
  wire p_0_in35_in;
  wire p_0_in38_in;
  wire p_0_in44_in;
  wire p_0_in47_in;
  wire p_0_in5_in;
  wire p_0_in8_in;
  wire [1:1]p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in1_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in4_in;
  wire p_1_in7_in;
  wire p_1_in_0;
  wire reset2ip_reset;
  wire reset_trig0;
  wire rst_ip2bus_error;
  wire rst_ip2bus_rdack;
  wire rst_ip2bus_rdack0;
  wire rst_ip2bus_rdack_d1;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]\^s_axi_rdata ;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [11:0]status_reg;
  wire status_reg_rdack0;
  wire status_reg_rdack_d1;
  wire sw_rst_cond;
  wire sw_rst_cond_d1;
  wire vauxn0;
  wire vauxn1;
  wire vauxn10;
  wire vauxn2;
  wire vauxn3;
  wire vauxn4;
  wire vauxn5;
  wire vauxn6;
  wire vauxn7;
  wire vauxn8;
  wire vauxn9;
  wire vauxp0;
  wire vauxp1;
  wire vauxp10;
  wire vauxp2;
  wire vauxp3;
  wire vauxp4;
  wire vauxp5;
  wire vauxp6;
  wire vauxp7;
  wire vauxp8;
  wire vauxp9;
  wire wrack;

  assign alarm_out[15] = \<const0> ;
  assign alarm_out[14] = \<const0> ;
  assign alarm_out[13] = \<const0> ;
  assign alarm_out[12] = \<const0> ;
  assign alarm_out[11] = \<const0> ;
  assign alarm_out[10] = \<const0> ;
  assign alarm_out[9] = \<const0> ;
  assign alarm_out[8] = \<const0> ;
  assign alarm_out[7] = \^alarm_out [7];
  assign alarm_out[6] = \<const0> ;
  assign alarm_out[5] = \<const0> ;
  assign alarm_out[4] = \<const0> ;
  assign alarm_out[3] = \<const0> ;
  assign alarm_out[2] = \<const0> ;
  assign alarm_out[1] = \<const0> ;
  assign alarm_out[0] = \<const0> ;
  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rdata[31] = \^s_axi_rdata [31];
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17:0] = \^s_axi_rdata [17:0];
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_wready = s_axi_awready;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_axi_lite_ipif AXI_LITE_IPIF_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .D({intr_ip2bus_data,ip2bus_data_int1[14],ip2bus_data_int1[15],ip2bus_data_int1[16],ip2bus_data_int1[17],ip2bus_data_int1[18],ip2bus_data_int1[19],ip2bus_data_int1[20],ip2bus_data_int1[21],ip2bus_data_int1[22],ip2bus_data_int1[23],ip2bus_data_int1[24],ip2bus_data_int1[25],ip2bus_data_int1[26],ip2bus_data_int1[27],ip2bus_data_int1[28],ip2bus_data_int1[29],ip2bus_data_int1[30],ip2bus_data_int1[31]}),
        .DWE(DWE),
        .E(irpt_wrack_d11),
        .\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] (AXI_LITE_IPIF_I_n_1),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ({p_0_in47_in,p_0_in44_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26 ,p_0_in38_in,p_0_in35_in,p_0_in32_in,p_0_in29_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31 ,p_0_in23_in,p_0_in20_in,p_0_in17_in,p_0_in14_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36 ,p_0_in8_in,p_0_in5_in,p_0_in2_in,p_0_in0_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41 }),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] (do_reg),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] (alarm_reg),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] (status_reg),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] (\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1 ),
        .Intr2Bus_RdAck0(Intr2Bus_RdAck0),
        .Q(bus2ip_addr),
        .RESET(RESET),
        .SR(AXI_LITE_IPIF_I_n_66),
        .and_reduce_be(and_reduce_be),
        .bus2ip_rdce({bus2ip_rdce[24:23],bus2ip_rdce[0]}),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_wrce(bus2ip_wrce),
        .convst_rst_wrce_or_reduce(convst_rst_wrce_or_reduce),
        .\do_reg_reg[15] (SOFT_RESET_I_n_2),
        .dummy_local_reg_rdack0(dummy_local_reg_rdack0),
        .dummy_local_reg_rdack_d1(dummy_local_reg_rdack_d1),
        .dummy_local_reg_rdack_d10(dummy_local_reg_rdack_d10),
        .dummy_local_reg_wrack0(dummy_local_reg_wrack0),
        .dummy_local_reg_wrack_d1(dummy_local_reg_wrack_d1),
        .dummy_local_reg_wrack_d10(dummy_local_reg_wrack_d10),
        .hard_macro_rst_reg(hard_macro_rst_reg),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .ip2bus_rdack(ip2bus_rdack),
        .ip2bus_wrack(ip2bus_wrack),
        .ip_irpt_status_reg1__0(ip_irpt_status_reg1__0),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .jtaglocked_i(jtaglocked_i),
        .jtagmodified_d1(jtagmodified_d1),
        .jtagmodified_i(jtagmodified_i),
        .local_rdce_or_reduce(local_rdce_or_reduce),
        .local_reg_rdack0(local_reg_rdack0),
        .local_reg_rdack_d1(local_reg_rdack_d1),
        .local_reg_wrack0(local_reg_wrack0),
        .local_reg_wrack_d1(local_reg_wrack_d1),
        .p_1_in(p_1_in),
        .p_1_in10_in(p_1_in10_in),
        .p_1_in13_in(p_1_in13_in),
        .p_1_in16_in(p_1_in16_in),
        .p_1_in19_in(p_1_in19_in),
        .p_1_in1_in(p_1_in1_in),
        .p_1_in22_in(p_1_in22_in),
        .p_1_in25_in(p_1_in25_in),
        .p_1_in28_in(p_1_in28_in),
        .p_1_in31_in(p_1_in31_in),
        .p_1_in34_in(p_1_in34_in),
        .p_1_in37_in(p_1_in37_in),
        .p_1_in40_in(p_1_in40_in),
        .p_1_in43_in(p_1_in43_in),
        .p_1_in46_in(p_1_in46_in),
        .p_1_in4_in(p_1_in4_in),
        .p_1_in7_in(p_1_in7_in),
        .p_1_in_0(p_1_in_0),
        .reset2ip_reset(reset2ip_reset),
        .reset_trig0(reset_trig0),
        .rst_ip2bus_error(rst_ip2bus_error),
        .rst_ip2bus_rdack0(rst_ip2bus_rdack0),
        .rst_ip2bus_rdack_d1(rst_ip2bus_rdack_d1),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[10:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[10:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata({\^s_axi_rdata [31],\^s_axi_rdata [17:0]}),
        .\s_axi_rdata_i_reg[31] ({ip2bus_data[31],ip2bus_data[17:0]}),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata({s_axi_wdata[31],s_axi_wdata[3:0]}),
        .\s_axi_wdata[31] (AXI_LITE_IPIF_I_n_64),
        .s_axi_wdata_0_sp_1(AXI_LITE_IPIF_I_n_63),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .status_reg_rdack0(status_reg_rdack0),
        .status_reg_rdack_d1(status_reg_rdack_d1),
        .sw_rst_cond(sw_rst_cond),
        .sw_rst_cond_d1(sw_rst_cond_d1));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_xadc_core_drp AXI_SYSMON_CORE_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .D({jtaglocked_i,busy_out,channel_out}),
        .DWE(DWE),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ),
        .Q(bus2ip_addr),
        .RESET(RESET),
        .SR(AXI_LITE_IPIF_I_n_66),
        .\alarm_reg_reg[14]_0 (alarm_reg),
        .and_reduce_be(and_reduce_be),
        .bus2ip_rdce({bus2ip_rdce[23],bus2ip_rdce[0]}),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_wrce(bus2ip_wrce),
        .convst_rst_wrce_or_reduce(convst_rst_wrce_or_reduce),
        .\do_reg_reg[15]_0 (do_reg),
        .drdy_wr_ack_i_reg_0(AXI_SYSMON_CORE_I_n_30),
        .drdy_wr_ack_i_reg_1(AXI_LITE_IPIF_I_n_1),
        .dummy_local_reg_rdack(dummy_local_reg_rdack),
        .eoc_out(eoc_out),
        .eos_out(eos_out),
        .hard_macro_rst_reg(hard_macro_rst_reg),
        .hard_macro_rst_reg_reg_0(AXI_LITE_IPIF_I_n_63),
        .inst_sysmon_0({AXI_SYSMON_CORE_I_n_11,AXI_SYSMON_CORE_I_n_12,AXI_SYSMON_CORE_I_n_13,AXI_SYSMON_CORE_I_n_14,\^alarm_out ,AXI_SYSMON_CORE_I_n_16,AXI_SYSMON_CORE_I_n_17,AXI_SYSMON_CORE_I_n_18,AXI_SYSMON_CORE_I_n_19,AXI_SYSMON_CORE_I_n_20,AXI_SYSMON_CORE_I_n_21,AXI_SYSMON_CORE_I_n_22,ot_out}),
        .interrupt_status_i({interrupt_status_i[8],interrupt_status_i[9]}),
        .intr_ip2bus_rdack(intr_ip2bus_rdack),
        .ip2bus_error_int1(ip2bus_error_int1),
        .ip2bus_rdack_int1(ip2bus_rdack_int1),
        .jtagmodified_d1(jtagmodified_d1),
        .jtagmodified_d1_reg_0(SOFT_RESET_I_n_2),
        .jtagmodified_i(jtagmodified_i),
        .local_rdce_or_reduce(local_rdce_or_reduce),
        .local_reg_rdack0(local_reg_rdack0),
        .local_reg_rdack_d1(local_reg_rdack_d1),
        .local_reg_wrack0(local_reg_wrack0),
        .local_reg_wrack_d1(local_reg_wrack_d1),
        .reset2ip_reset(reset2ip_reset),
        .rst_ip2bus_error(rst_ip2bus_error),
        .rst_ip2bus_rdack(rst_ip2bus_rdack),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[15:0]),
        .status_reg_rdack0(status_reg_rdack0),
        .status_reg_rdack_d1(status_reg_rdack_d1),
        .\status_reg_reg[11]_0 (status_reg),
        .vauxn0(vauxn0),
        .vauxn1(vauxn1),
        .vauxn10(vauxn10),
        .vauxn2(vauxn2),
        .vauxn3(vauxn3),
        .vauxn4(vauxn4),
        .vauxn5(vauxn5),
        .vauxn6(vauxn6),
        .vauxn7(vauxn7),
        .vauxn8(vauxn8),
        .vauxn9(vauxn9),
        .vauxp0(vauxp0),
        .vauxp1(vauxp1),
        .vauxp10(vauxp10),
        .vauxp2(vauxp2),
        .vauxp3(vauxp3),
        .vauxp4(vauxp4),
        .vauxp5(vauxp5),
        .vauxp6(vauxp6),
        .vauxp7(vauxp7),
        .vauxp8(vauxp8),
        .vauxp9(vauxp9));
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_interrupt_control \INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I 
       (.D(jtaglocked_i),
        .\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 ({AXI_SYSMON_CORE_I_n_11,AXI_SYSMON_CORE_I_n_12,AXI_SYSMON_CORE_I_n_13,AXI_SYSMON_CORE_I_n_14,AXI_SYSMON_CORE_I_n_16,AXI_SYSMON_CORE_I_n_17,AXI_SYSMON_CORE_I_n_18,AXI_SYSMON_CORE_I_n_19,AXI_SYSMON_CORE_I_n_20,AXI_SYSMON_CORE_I_n_21,AXI_SYSMON_CORE_I_n_22,ot_out}),
        .E(irpt_wrack_d11),
        .\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 (\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_1 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ),
        .\INTR_CTRLR_GEN_I.ip2bus_wrack_reg (AXI_SYSMON_CORE_I_n_30),
        .Intr2Bus_RdAck0(Intr2Bus_RdAck0),
        .Q({p_0_in47_in,p_0_in44_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_26 ,p_0_in38_in,p_0_in35_in,p_0_in32_in,p_0_in29_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_31 ,p_0_in23_in,p_0_in20_in,p_0_in17_in,p_0_in14_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_36 ,p_0_in8_in,p_0_in5_in,p_0_in2_in,p_0_in0_in,\INTR_CTRLR_GEN_I.INTERRUPT_CONTROL_I_n_41 }),
        .dummy_local_reg_wrack(dummy_local_reg_wrack),
        .eoc_out(eoc_out),
        .eos_out(eos_out),
        .interrupt_status_i({interrupt_status_i[8],interrupt_status_i[9]}),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .intr_ip2bus_rdack(intr_ip2bus_rdack),
        .ip2bus_wrack_int1(ip2bus_wrack_int1),
        .ip2intc_irpt(ip2intc_irpt),
        .ip_irpt_status_reg1__0(ip_irpt_status_reg1__0),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .ipif_glbl_irpt_enable_reg_reg_0(AXI_LITE_IPIF_I_n_64),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .jtagmodified_i(jtagmodified_i),
        .p_1_in(p_1_in_0),
        .p_1_in10_in(p_1_in10_in),
        .p_1_in13_in(p_1_in13_in),
        .p_1_in16_in(p_1_in16_in),
        .p_1_in19_in(p_1_in19_in),
        .p_1_in1_in(p_1_in1_in),
        .p_1_in22_in(p_1_in22_in),
        .p_1_in25_in(p_1_in25_in),
        .p_1_in28_in(p_1_in28_in),
        .p_1_in31_in(p_1_in31_in),
        .p_1_in34_in(p_1_in34_in),
        .p_1_in37_in(p_1_in37_in),
        .p_1_in40_in(p_1_in40_in),
        .p_1_in43_in(p_1_in43_in),
        .p_1_in46_in(p_1_in46_in),
        .p_1_in4_in(p_1_in4_in),
        .p_1_in7_in(p_1_in7_in),
        .reset2ip_reset(reset2ip_reset),
        .rst_ip2bus_error(rst_ip2bus_error),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata[17:0]),
        .wrack(wrack));
  FDRE \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ),
        .Q(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ),
        .Q(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ),
        .Q(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ),
        .Q(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(intr_ip2bus_data),
        .Q(ip2bus_data[31]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[14]),
        .Q(ip2bus_data[17]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[15]),
        .Q(ip2bus_data[16]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[16]),
        .Q(ip2bus_data[15]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[17]),
        .Q(ip2bus_data[14]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[18]),
        .Q(ip2bus_data[13]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[19]),
        .Q(ip2bus_data[12]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[20]),
        .Q(ip2bus_data[11]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[21]),
        .Q(ip2bus_data[10]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[22]),
        .Q(ip2bus_data[9]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[23]),
        .Q(ip2bus_data[8]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[24]),
        .Q(ip2bus_data[7]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[25]),
        .Q(ip2bus_data[6]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[26]),
        .Q(ip2bus_data[5]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[27]),
        .Q(ip2bus_data[4]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[28]),
        .Q(ip2bus_data[3]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[29]),
        .Q(ip2bus_data[2]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[30]),
        .Q(ip2bus_data[1]),
        .R(reset2ip_reset));
  FDRE #(
    .INIT(1'b0)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_data_int1[31]),
        .Q(ip2bus_data[0]),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.ip2bus_error_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_error_int1),
        .Q(p_1_in),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.ip2bus_rdack_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_rdack_int1),
        .Q(ip2bus_rdack),
        .R(reset2ip_reset));
  FDRE \INTR_CTRLR_GEN_I.ip2bus_wrack_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ip2bus_wrack_int1),
        .Q(ip2bus_wrack),
        .R(reset2ip_reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_soft_reset SOFT_RESET_I
       (.\RESET_FLOPS[15].RST_FLOPS_0 (SOFT_RESET_I_n_2),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .reset_trig0(reset_trig0),
        .s_axi_aclk(s_axi_aclk),
        .sw_rst_cond(sw_rst_cond),
        .sw_rst_cond_d1(sw_rst_cond_d1),
        .wrack(wrack));
  FDRE dummy_local_reg_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dummy_local_reg_rdack_d10),
        .Q(dummy_local_reg_rdack_d1),
        .R(reset2ip_reset));
  FDRE dummy_local_reg_rdack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dummy_local_reg_rdack0),
        .Q(dummy_local_reg_rdack),
        .R(reset2ip_reset));
  FDRE dummy_local_reg_wrack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dummy_local_reg_wrack_d10),
        .Q(dummy_local_reg_wrack_d1),
        .R(reset2ip_reset));
  FDRE dummy_local_reg_wrack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dummy_local_reg_wrack0),
        .Q(dummy_local_reg_wrack),
        .R(reset2ip_reset));
  FDRE rst_ip2bus_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bus2ip_rdce[24]),
        .Q(rst_ip2bus_rdack_d1),
        .R(reset2ip_reset));
  FDRE rst_ip2bus_rdack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_ip2bus_rdack0),
        .Q(rst_ip2bus_rdack),
        .R(reset2ip_reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_interrupt_control
   (irpt_wrack_d1,
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ,
    p_1_in46_in,
    p_1_in43_in,
    p_1_in40_in,
    p_1_in37_in,
    p_1_in34_in,
    p_1_in31_in,
    p_1_in28_in,
    p_1_in25_in,
    p_1_in22_in,
    p_1_in19_in,
    p_1_in16_in,
    p_1_in13_in,
    p_1_in10_in,
    p_1_in7_in,
    p_1_in4_in,
    p_1_in1_in,
    p_1_in,
    irpt_rdack_d1,
    intr_ip2bus_rdack,
    ipif_glbl_irpt_enable_reg,
    ip2bus_wrack_int1,
    ip2intc_irpt,
    Q,
    reset2ip_reset,
    irpt_wrack,
    s_axi_aclk,
    \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 ,
    eos_out,
    eoc_out,
    D,
    jtagmodified_i,
    interrupt_status_i,
    interrupt_wrce_strb,
    irpt_rdack,
    Intr2Bus_RdAck0,
    ipif_glbl_irpt_enable_reg_reg_0,
    dummy_local_reg_wrack,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ,
    wrack,
    rst_ip2bus_error,
    \INTR_CTRLR_GEN_I.ip2bus_wrack_reg ,
    ip_irpt_status_reg1__0,
    s_axi_wdata,
    E);
  output irpt_wrack_d1;
  output \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  output p_1_in46_in;
  output p_1_in43_in;
  output p_1_in40_in;
  output p_1_in37_in;
  output p_1_in34_in;
  output p_1_in31_in;
  output p_1_in28_in;
  output p_1_in25_in;
  output p_1_in22_in;
  output p_1_in19_in;
  output p_1_in16_in;
  output p_1_in13_in;
  output p_1_in10_in;
  output p_1_in7_in;
  output p_1_in4_in;
  output p_1_in1_in;
  output p_1_in;
  output irpt_rdack_d1;
  output intr_ip2bus_rdack;
  output ipif_glbl_irpt_enable_reg;
  output ip2bus_wrack_int1;
  output ip2intc_irpt;
  output [17:0]Q;
  input reset2ip_reset;
  input irpt_wrack;
  input s_axi_aclk;
  input [11:0]\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 ;
  input eos_out;
  input eoc_out;
  input [0:0]D;
  input jtagmodified_i;
  input [1:0]interrupt_status_i;
  input interrupt_wrce_strb;
  input irpt_rdack;
  input Intr2Bus_RdAck0;
  input ipif_glbl_irpt_enable_reg_reg_0;
  input dummy_local_reg_wrack;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ;
  input wrack;
  input rst_ip2bus_error;
  input \INTR_CTRLR_GEN_I.ip2bus_wrack_reg ;
  input ip_irpt_status_reg1__0;
  input [17:0]s_axi_wdata;
  input [0:0]E;

  wire [0:0]D;
  wire \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire [11:0]\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 ;
  wire \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1 ;
  wire \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2 ;
  wire [0:0]E;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0 ;
  wire \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ;
  wire \INTR_CTRLR_GEN_I.ip2bus_wrack_reg ;
  wire Intr2Bus_RdAck0;
  wire [17:0]Q;
  wire dummy_local_reg_wrack;
  wire eoc_out;
  wire eos_out;
  wire [1:0]interrupt_status_i;
  wire interrupt_wrce_strb;
  wire intr_ip2bus_rdack;
  wire intr_ip2bus_wrack;
  wire ip2bus_wrack_int1;
  wire ip2intc_irpt;
  wire ip2intc_irpt_INST_0_i_1_n_0;
  wire ip2intc_irpt_INST_0_i_2_n_0;
  wire ip2intc_irpt_INST_0_i_3_n_0;
  wire ip2intc_irpt_INST_0_i_4_n_0;
  wire ip2intc_irpt_INST_0_i_5_n_0;
  wire ip2intc_irpt_INST_0_i_6_n_0;
  wire ip2intc_irpt_INST_0_i_7_n_0;
  wire ip2intc_irpt_INST_0_i_8_n_0;
  wire ip2intc_irpt_INST_0_i_9_n_0;
  wire ip_irpt_status_reg1__0;
  wire ipif_glbl_irpt_enable_reg;
  wire ipif_glbl_irpt_enable_reg_reg_0;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire jtagmodified_i;
  wire p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in1_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in4_in;
  wire p_1_in7_in;
  wire reset2ip_reset;
  wire rst_ip2bus_error;
  wire s_axi_aclk;
  wire [17:0]s_axi_wdata;
  wire wrack;

  FDSE \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [0]),
        .Q(\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [4]),
        .Q(\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [5]),
        .Q(\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [6]),
        .Q(\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [7]),
        .Q(\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [8]),
        .Q(\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [9]),
        .Q(\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [10]),
        .Q(\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [11]),
        .Q(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [1]),
        .Q(\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [2]),
        .Q(\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1_reg_0 [3]),
        .Q(\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(eos_out),
        .Q(\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(eoc_out),
        .Q(\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D),
        .Q(\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(jtagmodified_i),
        .Q(\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(interrupt_status_i[1]),
        .Q(\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(interrupt_status_i[0]),
        .Q(\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .S(reset2ip_reset));
  FDSE \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .Q(\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .S(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[0].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[0]),
        .I4(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .O(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg[0]_i_1_n_0 ),
        .Q(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[10].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[10]),
        .I4(p_1_in19_in),
        .O(\GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[10].GEN_REG_STATUS.ip_irpt_status_reg[10]_i_1_n_0 ),
        .Q(p_1_in19_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[11].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[11]),
        .I4(p_1_in16_in),
        .O(\GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[11].GEN_REG_STATUS.ip_irpt_status_reg[11]_i_1_n_0 ),
        .Q(p_1_in16_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[12].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[12]),
        .I4(p_1_in13_in),
        .O(\GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[12].GEN_REG_STATUS.ip_irpt_status_reg[12]_i_1_n_0 ),
        .Q(p_1_in13_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[13].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[13]),
        .I4(p_1_in10_in),
        .O(\GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[13].GEN_REG_STATUS.ip_irpt_status_reg[13]_i_1_n_0 ),
        .Q(p_1_in10_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[14].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[14]),
        .I4(p_1_in7_in),
        .O(\GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[14].GEN_REG_STATUS.ip_irpt_status_reg[14]_i_1_n_0 ),
        .Q(p_1_in7_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[15].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[15]),
        .I4(p_1_in4_in),
        .O(\GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[15].GEN_REG_STATUS.ip_irpt_status_reg[15]_i_1_n_0 ),
        .Q(p_1_in4_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[16].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[16]),
        .I4(p_1_in1_in),
        .O(\GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[16].GEN_REG_STATUS.ip_irpt_status_reg[16]_i_1_n_0 ),
        .Q(p_1_in1_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[17].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[17]),
        .I4(p_1_in),
        .O(\GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[17].GEN_REG_STATUS.ip_irpt_status_reg[17]_i_1_n_0 ),
        .Q(p_1_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[1].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[1]),
        .I4(p_1_in46_in),
        .O(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[1].GEN_REG_STATUS.ip_irpt_status_reg[1]_i_1_n_0 ),
        .Q(p_1_in46_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[2].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[2]),
        .I4(p_1_in43_in),
        .O(\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[2].GEN_REG_STATUS.ip_irpt_status_reg[2]_i_1_n_0 ),
        .Q(p_1_in43_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[3].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[3]),
        .I4(p_1_in40_in),
        .O(\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[3].GEN_REG_STATUS.ip_irpt_status_reg[3]_i_1_n_0 ),
        .Q(p_1_in40_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[4].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[4]),
        .I4(p_1_in37_in),
        .O(\GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[4].GEN_REG_STATUS.ip_irpt_status_reg[4]_i_1_n_0 ),
        .Q(p_1_in37_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[5].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[5]),
        .I4(p_1_in34_in),
        .O(\GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[5].GEN_REG_STATUS.ip_irpt_status_reg[5]_i_1_n_0 ),
        .Q(p_1_in34_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[6].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[6]),
        .I4(p_1_in31_in),
        .O(\GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[6].GEN_REG_STATUS.ip_irpt_status_reg[6]_i_1_n_0 ),
        .Q(p_1_in31_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[7].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[7]),
        .I4(p_1_in28_in),
        .O(\GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[7].GEN_REG_STATUS.ip_irpt_status_reg[7]_i_1_n_0 ),
        .Q(p_1_in28_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[8]),
        .I4(p_1_in25_in),
        .O(\GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[8].GEN_REG_STATUS.ip_irpt_status_reg[8]_i_1_n_0 ),
        .Q(p_1_in25_in),
        .R(reset2ip_reset));
  LUT5 #(
    .INIT(32'h75FFBA30)) 
    \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1 
       (.I0(ip_irpt_status_reg1__0),
        .I1(\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly2 ),
        .I2(\DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1 ),
        .I3(s_axi_wdata[9]),
        .I4(p_1_in22_in),
        .O(\GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0 ));
  FDRE \GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_IP_IRPT_STATUS_REG[9].GEN_REG_STATUS.ip_irpt_status_reg[9]_i_1_n_0 ),
        .Q(p_1_in22_in),
        .R(reset2ip_reset));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \INTR_CTRLR_GEN_I.ip2bus_wrack_i_1 
       (.I0(dummy_local_reg_wrack),
        .I1(\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack ),
        .I2(intr_ip2bus_wrack),
        .I3(wrack),
        .I4(rst_ip2bus_error),
        .I5(\INTR_CTRLR_GEN_I.ip2bus_wrack_reg ),
        .O(ip2bus_wrack_int1));
  FDRE Intr2Bus_RdAck_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Intr2Bus_RdAck0),
        .Q(intr_ip2bus_rdack),
        .R(reset2ip_reset));
  FDRE Intr2Bus_WrAck_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(interrupt_wrce_strb),
        .Q(intr_ip2bus_wrack),
        .R(reset2ip_reset));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    ip2intc_irpt_INST_0
       (.I0(ip2intc_irpt_INST_0_i_1_n_0),
        .I1(ip2intc_irpt_INST_0_i_2_n_0),
        .I2(ip2intc_irpt_INST_0_i_3_n_0),
        .I3(ip2intc_irpt_INST_0_i_4_n_0),
        .I4(ip2intc_irpt_INST_0_i_5_n_0),
        .I5(ipif_glbl_irpt_enable_reg),
        .O(ip2intc_irpt));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_1
       (.I0(Q[7]),
        .I1(p_1_in28_in),
        .I2(Q[8]),
        .I3(p_1_in25_in),
        .O(ip2intc_irpt_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    ip2intc_irpt_INST_0_i_2
       (.I0(p_1_in19_in),
        .I1(Q[10]),
        .I2(p_1_in22_in),
        .I3(Q[9]),
        .I4(ip2intc_irpt_INST_0_i_6_n_0),
        .O(ip2intc_irpt_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    ip2intc_irpt_INST_0_i_3
       (.I0(p_1_in7_in),
        .I1(Q[14]),
        .I2(p_1_in10_in),
        .I3(Q[13]),
        .I4(ip2intc_irpt_INST_0_i_7_n_0),
        .O(ip2intc_irpt_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_4
       (.I0(Q[17]),
        .I1(p_1_in),
        .I2(Q[0]),
        .I3(\GEN_IP_IRPT_STATUS_REG[0].GEN_REG_STATUS.ip_irpt_status_reg_reg[0]_0 ),
        .O(ip2intc_irpt_INST_0_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    ip2intc_irpt_INST_0_i_5
       (.I0(ip2intc_irpt_INST_0_i_8_n_0),
        .I1(Q[3]),
        .I2(p_1_in40_in),
        .I3(Q[4]),
        .I4(p_1_in37_in),
        .I5(ip2intc_irpt_INST_0_i_9_n_0),
        .O(ip2intc_irpt_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_6
       (.I0(Q[11]),
        .I1(p_1_in16_in),
        .I2(Q[12]),
        .I3(p_1_in13_in),
        .O(ip2intc_irpt_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_7
       (.I0(Q[15]),
        .I1(p_1_in4_in),
        .I2(Q[16]),
        .I3(p_1_in1_in),
        .O(ip2intc_irpt_INST_0_i_7_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_8
       (.I0(Q[5]),
        .I1(p_1_in34_in),
        .I2(Q[6]),
        .I3(p_1_in31_in),
        .O(ip2intc_irpt_INST_0_i_8_n_0));
  LUT4 #(
    .INIT(16'hF888)) 
    ip2intc_irpt_INST_0_i_9
       (.I0(Q[1]),
        .I1(p_1_in46_in),
        .I2(Q[2]),
        .I3(p_1_in43_in),
        .O(ip2intc_irpt_INST_0_i_9_n_0));
  FDRE \ip_irpt_enable_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[0]),
        .Q(Q[0]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[10]),
        .Q(Q[10]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[11]),
        .Q(Q[11]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[12]),
        .Q(Q[12]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[13]),
        .Q(Q[13]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[14]),
        .Q(Q[14]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[15]),
        .Q(Q[15]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[16] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[16]),
        .Q(Q[16]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[17] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[17]),
        .Q(Q[17]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[1]),
        .Q(Q[1]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[2]),
        .Q(Q[2]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[3]),
        .Q(Q[3]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[4]),
        .Q(Q[4]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[5]),
        .Q(Q[5]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[6]),
        .Q(Q[6]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[7]),
        .Q(Q[7]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[8]),
        .Q(Q[8]),
        .R(reset2ip_reset));
  FDRE \ip_irpt_enable_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(s_axi_wdata[9]),
        .Q(Q[9]),
        .R(reset2ip_reset));
  FDRE ipif_glbl_irpt_enable_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ipif_glbl_irpt_enable_reg_reg_0),
        .Q(ipif_glbl_irpt_enable_reg),
        .R(reset2ip_reset));
  FDRE irpt_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(irpt_rdack),
        .Q(irpt_rdack_d1),
        .R(reset2ip_reset));
  FDRE irpt_wrack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(irpt_wrack),
        .Q(irpt_wrack_d1),
        .R(reset2ip_reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_slave_attachment
   (SR,
    \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ,
    s_axi_rresp,
    Bus_RNW_reg_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    local_reg_wrack0,
    convst_rst_wrce_or_reduce,
    DWE,
    bus2ip_wrce,
    local_reg_rdack0,
    local_rdce_or_reduce,
    D,
    status_reg_rdack0,
    bus2ip_rdce,
    reset2ip_reset,
    rst_ip2bus_error,
    reset_trig0,
    sw_rst_cond,
    and_reduce_be,
    Intr2Bus_RdAck0,
    irpt_rdack,
    interrupt_wrce_strb,
    irpt_wrack,
    E,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ,
    \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ,
    dummy_local_reg_rdack0,
    dummy_local_reg_rdack_d10,
    dummy_local_reg_wrack0,
    dummy_local_reg_wrack_d10,
    rst_ip2bus_rdack0,
    ip_irpt_status_reg1__0,
    s_axi_wdata_0_sp_1,
    \s_axi_wdata[31] ,
    RESET,
    rst_reg_0,
    Q,
    s_axi_bresp,
    s_axi_rdata,
    s_axi_arready,
    s_axi_awready,
    s_axi_aclk,
    p_1_in,
    s_axi_arvalid,
    local_reg_wrack_d1,
    jtaglocked_i,
    local_reg_rdack_d1,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ,
    p_1_in46_in,
    p_1_in43_in,
    p_1_in40_in,
    p_1_in37_in,
    p_1_in34_in,
    p_1_in31_in,
    p_1_in28_in,
    p_1_in25_in,
    p_1_in22_in,
    p_1_in19_in,
    p_1_in16_in,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ,
    \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ,
    p_1_in13_in,
    p_1_in10_in,
    p_1_in7_in,
    p_1_in4_in,
    p_1_in1_in,
    p_1_in_0,
    jtagmodified_i,
    jtagmodified_d1,
    status_reg_rdack_d1,
    \do_reg_reg[15] ,
    sw_rst_cond_d1,
    s_axi_wstrb,
    s_axi_wdata,
    ipif_glbl_irpt_enable_reg,
    irpt_rdack_d1,
    irpt_wrack_d1,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ,
    dummy_local_reg_rdack_d1,
    dummy_local_reg_wrack_d1,
    rst_ip2bus_rdack_d1,
    ip2bus_rdack,
    s_axi_rready,
    ip2bus_wrack,
    s_axi_bready,
    hard_macro_rst_reg,
    s_axi_awvalid,
    s_axi_wvalid,
    \s_axi_rdata_i_reg[31]_0 ,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_awaddr);
  output [0:0]SR;
  output \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ;
  output [0:0]s_axi_rresp;
  output Bus_RNW_reg_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output local_reg_wrack0;
  output convst_rst_wrce_or_reduce;
  output DWE;
  output [0:0]bus2ip_wrce;
  output local_reg_rdack0;
  output local_rdce_or_reduce;
  output [18:0]D;
  output status_reg_rdack0;
  output [2:0]bus2ip_rdce;
  output reset2ip_reset;
  output rst_ip2bus_error;
  output reset_trig0;
  output sw_rst_cond;
  output and_reduce_be;
  output Intr2Bus_RdAck0;
  output irpt_rdack;
  output interrupt_wrce_strb;
  output irpt_wrack;
  output [0:0]E;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  output \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  output \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  output dummy_local_reg_rdack0;
  output dummy_local_reg_rdack_d10;
  output dummy_local_reg_wrack0;
  output dummy_local_reg_wrack_d10;
  output rst_ip2bus_rdack0;
  output ip_irpt_status_reg1__0;
  output s_axi_wdata_0_sp_1;
  output \s_axi_wdata[31] ;
  output RESET;
  output [0:0]rst_reg_0;
  output [7:0]Q;
  output [0:0]s_axi_bresp;
  output [18:0]s_axi_rdata;
  output s_axi_arready;
  output s_axi_awready;
  input s_axi_aclk;
  input [0:0]p_1_in;
  input s_axi_arvalid;
  input local_reg_wrack_d1;
  input jtaglocked_i;
  input local_reg_rdack_d1;
  input \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  input [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  input p_1_in46_in;
  input p_1_in43_in;
  input p_1_in40_in;
  input p_1_in37_in;
  input p_1_in34_in;
  input p_1_in31_in;
  input p_1_in28_in;
  input p_1_in25_in;
  input p_1_in22_in;
  input p_1_in19_in;
  input p_1_in16_in;
  input [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  input [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  input [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  input p_1_in13_in;
  input p_1_in10_in;
  input p_1_in7_in;
  input p_1_in4_in;
  input p_1_in1_in;
  input p_1_in_0;
  input jtagmodified_i;
  input jtagmodified_d1;
  input status_reg_rdack_d1;
  input \do_reg_reg[15] ;
  input sw_rst_cond_d1;
  input [3:0]s_axi_wstrb;
  input [4:0]s_axi_wdata;
  input ipif_glbl_irpt_enable_reg;
  input irpt_rdack_d1;
  input irpt_wrack_d1;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  input dummy_local_reg_rdack_d1;
  input dummy_local_reg_wrack_d1;
  input rst_ip2bus_rdack_d1;
  input ip2bus_rdack;
  input s_axi_rready;
  input ip2bus_wrack;
  input s_axi_bready;
  input hard_macro_rst_reg;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [18:0]\s_axi_rdata_i_reg[31]_0 ;
  input s_axi_aresetn;
  input [8:0]s_axi_araddr;
  input [8:0]s_axi_awaddr;

  wire Bus_RNW_reg_reg;
  wire [18:0]D;
  wire DWE;
  wire [0:0]E;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0 ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4] ;
  wire \INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5] ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ;
  wire [17:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ;
  wire [15:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ;
  wire [14:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ;
  wire [11:0]\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ;
  wire \INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ;
  wire Intr2Bus_RdAck0;
  wire [7:0]Q;
  wire RESET;
  wire \SOFT_RESET_I/data_is_non_reset_match__3 ;
  wire [0:0]SR;
  wire and_reduce_be;
  wire [10:10]bus2ip_addr;
  wire \bus2ip_addr_i[10]_i_1_n_0 ;
  wire \bus2ip_addr_i[10]_i_2_n_0 ;
  wire \bus2ip_addr_i[2]_i_1_n_0 ;
  wire \bus2ip_addr_i[3]_i_1_n_0 ;
  wire \bus2ip_addr_i[4]_i_1_n_0 ;
  wire \bus2ip_addr_i[5]_i_1_n_0 ;
  wire \bus2ip_addr_i[6]_i_1_n_0 ;
  wire \bus2ip_addr_i[7]_i_1_n_0 ;
  wire \bus2ip_addr_i[8]_i_1_n_0 ;
  wire \bus2ip_addr_i[9]_i_1_n_0 ;
  wire [3:3]bus2ip_be;
  wire [2:0]bus2ip_rdce;
  wire bus2ip_rnw_i_reg_n_0;
  wire [0:0]bus2ip_wrce;
  wire clear;
  wire convst_rst_wrce_or_reduce;
  wire \do_reg_reg[15] ;
  wire dummy_local_reg_rdack0;
  wire dummy_local_reg_rdack_d1;
  wire dummy_local_reg_rdack_d10;
  wire dummy_local_reg_wrack0;
  wire dummy_local_reg_wrack_d1;
  wire dummy_local_reg_wrack_d10;
  wire hard_macro_rst_reg;
  wire interrupt_wrce_strb;
  wire ip2bus_rdack;
  wire ip2bus_wrack;
  wire ip_irpt_status_reg1__0;
  wire ipif_glbl_irpt_enable_reg;
  wire irpt_rdack;
  wire irpt_rdack_d1;
  wire irpt_wrack;
  wire irpt_wrack_d1;
  wire jtaglocked_i;
  wire jtagmodified_d1;
  wire jtagmodified_i;
  wire local_rdce_or_reduce;
  wire local_reg_rdack0;
  wire local_reg_rdack_d1;
  wire local_reg_wrack0;
  wire local_reg_wrack_d1;
  wire [0:0]p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in1_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in4_in;
  wire p_1_in7_in;
  wire p_1_in_0;
  wire p_2_in;
  wire [6:0]plusOp;
  wire reset2ip_reset;
  wire reset_trig0;
  wire rst_i_1_n_0;
  wire rst_ip2bus_error;
  wire rst_ip2bus_rdack0;
  wire rst_ip2bus_rdack_d1;
  wire [0:0]rst_reg_0;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bresp_i;
  wire \s_axi_bresp_i[1]_i_1_n_0 ;
  wire s_axi_bvalid;
  wire s_axi_bvalid_i_i_1_n_0;
  wire [18:0]s_axi_rdata;
  wire [18:0]\s_axi_rdata_i_reg[31]_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rresp_i;
  wire s_axi_rvalid;
  wire s_axi_rvalid_i_i_1_n_0;
  wire [4:0]s_axi_wdata;
  wire \s_axi_wdata[31] ;
  wire s_axi_wdata_0_sn_1;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire start2;
  wire start2_i_1_n_0;
  wire state1__2;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire status_reg_rdack0;
  wire status_reg_rdack_d1;
  wire sw_rst_cond;
  wire sw_rst_cond_d1;
  wire timeout;

  assign s_axi_wdata_0_sp_1 = s_axi_wdata_0_sn_1;
  LUT6 #(
    .INIT(64'hFFFF150015001500)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_awvalid),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(state1__2),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h888F8888)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(s_axi_arvalid),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(ip2bus_rdack),
        .I3(timeout),
        .I4(s_axi_rresp_i),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800FFFF08000800)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(s_axi_awready),
        .I5(s_axi_bresp_i),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888F888FFFFF888)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(s_axi_awready),
        .I1(s_axi_bresp_i),
        .I2(s_axi_rresp_i),
        .I3(s_axi_arready),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .I5(state1__2),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(state1__2));
  (* FSM_ENCODED_STATES = "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(s_axi_rresp_i),
        .R(SR));
  (* FSM_ENCODED_STATES = "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(s_axi_bresp_i),
        .R(SR));
  (* FSM_ENCODED_STATES = "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[0]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ),
        .I4(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4] ),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .I4(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4] ),
        .I5(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5] ),
        .O(plusOp[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(clear));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_2 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0 ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5] ),
        .I2(timeout),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3 
       (.I0(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4] ),
        .I1(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .I2(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .I3(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .I4(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ),
        .O(\INCLUDE_DPHASE_TIMER.dpto_cnt[6]_i_3_n_0 ));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[0]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[0] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[1] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[2] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[3] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[4] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(\INCLUDE_DPHASE_TIMER.dpto_cnt_reg_n_0_[5] ),
        .R(clear));
  FDRE \INCLUDE_DPHASE_TIMER.dpto_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(timeout),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \INTR_CTRLR_GEN_I.ip2bus_data_int[0]_i_2 
       (.I0(bus2ip_rnw_i_reg_n_0),
        .I1(s_axi_wstrb[3]),
        .O(bus2ip_be));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \INTR_CTRLR_GEN_I.ip2bus_error_i_1 
       (.I0(SR),
        .I1(\do_reg_reg[15] ),
        .O(reset2ip_reset));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \INTR_CTRLR_GEN_I.ip2bus_error_i_3 
       (.I0(s_axi_wstrb[0]),
        .I1(s_axi_wstrb[1]),
        .I2(s_axi_wstrb[2]),
        .I3(s_axi_wstrb[3]),
        .I4(bus2ip_rnw_i_reg_n_0),
        .O(and_reduce_be));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_address_decoder I_DECODER
       (.Bus_RNW_reg_reg_0(Bus_RNW_reg_reg),
        .D(D),
        .DWE(DWE),
        .E(E),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 (timeout),
        .\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_0 (\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24] ),
        .\GEN_BKEND_CE_REGISTERS[24].ce_out_i_reg[24]_1 ({bus2ip_addr,Q}),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_rdce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr (\INTR_CTRLR_GEN_I.dummy_bus2ip_wrce_intr ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack_d1 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack0 ),
        .\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 (\INTR_CTRLR_GEN_I.dummy_intr_reg_wrack_d1 ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[14] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[16] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[17] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[20] ),
        .\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] (\INTR_CTRLR_GEN_I.ip2bus_data_int_reg[31] ),
        .Intr2Bus_RdAck0(Intr2Bus_RdAck0),
        .Q(start2),
        .bus2ip_be(bus2ip_be),
        .bus2ip_rdce(bus2ip_rdce),
        .bus2ip_wrce(bus2ip_wrce),
        .convst_rst_wrce_or_reduce(convst_rst_wrce_or_reduce),
        .data_is_non_reset_match__3(\SOFT_RESET_I/data_is_non_reset_match__3 ),
        .dummy_local_reg_rdack0(dummy_local_reg_rdack0),
        .dummy_local_reg_rdack_d1(dummy_local_reg_rdack_d1),
        .dummy_local_reg_rdack_d10(dummy_local_reg_rdack_d10),
        .dummy_local_reg_wrack0(dummy_local_reg_wrack0),
        .dummy_local_reg_wrack_d1(dummy_local_reg_wrack_d1),
        .dummy_local_reg_wrack_d10(dummy_local_reg_wrack_d10),
        .hard_macro_rst_reg(hard_macro_rst_reg),
        .interrupt_wrce_strb(interrupt_wrce_strb),
        .ip2bus_rdack(ip2bus_rdack),
        .ip2bus_wrack(ip2bus_wrack),
        .ip_irpt_status_reg1__0(ip_irpt_status_reg1__0),
        .ipif_glbl_irpt_enable_reg(ipif_glbl_irpt_enable_reg),
        .ipif_glbl_irpt_enable_reg_reg(bus2ip_rnw_i_reg_n_0),
        .irpt_rdack(irpt_rdack),
        .irpt_rdack_d1(irpt_rdack_d1),
        .irpt_wrack(irpt_wrack),
        .irpt_wrack_d1(irpt_wrack_d1),
        .jtaglocked_i(jtaglocked_i),
        .jtagmodified_d1(jtagmodified_d1),
        .jtagmodified_i(jtagmodified_i),
        .local_rdce_or_reduce(local_rdce_or_reduce),
        .local_reg_rdack0(local_reg_rdack0),
        .local_reg_rdack_d1(local_reg_rdack_d1),
        .local_reg_wrack0(local_reg_wrack0),
        .local_reg_wrack_d1(local_reg_wrack_d1),
        .p_1_in10_in(p_1_in10_in),
        .p_1_in13_in(p_1_in13_in),
        .p_1_in16_in(p_1_in16_in),
        .p_1_in19_in(p_1_in19_in),
        .p_1_in1_in(p_1_in1_in),
        .p_1_in22_in(p_1_in22_in),
        .p_1_in25_in(p_1_in25_in),
        .p_1_in28_in(p_1_in28_in),
        .p_1_in31_in(p_1_in31_in),
        .p_1_in34_in(p_1_in34_in),
        .p_1_in37_in(p_1_in37_in),
        .p_1_in40_in(p_1_in40_in),
        .p_1_in43_in(p_1_in43_in),
        .p_1_in46_in(p_1_in46_in),
        .p_1_in4_in(p_1_in4_in),
        .p_1_in7_in(p_1_in7_in),
        .p_1_in_0(p_1_in_0),
        .reset_trig0(reset_trig0),
        .rst_ip2bus_error(rst_ip2bus_error),
        .rst_ip2bus_rdack0(rst_ip2bus_rdack0),
        .rst_ip2bus_rdack_d1(rst_ip2bus_rdack_d1),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata({s_axi_wdata[4],s_axi_wdata[0]}),
        .\s_axi_wdata[31] (\s_axi_wdata[31] ),
        .s_axi_wdata_0_sp_1(s_axi_wdata_0_sn_1),
        .s_axi_wstrb(s_axi_wstrb[3]),
        .status_reg_rdack0(status_reg_rdack0),
        .status_reg_rdack_d1(status_reg_rdack_d1),
        .sw_rst_cond(sw_rst_cond),
        .sw_rst_cond_d1(sw_rst_cond_d1));
  LUT5 #(
    .INIT(32'h000000EA)) 
    \bus2ip_addr_i[10]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_wvalid),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .O(\bus2ip_addr_i[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[10]_i_2 
       (.I0(s_axi_araddr[8]),
        .I1(s_axi_awaddr[8]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[10]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[2]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_awaddr[0]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[3]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_awaddr[1]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[4]_i_1 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_awaddr[2]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[5]_i_1 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[6]_i_1 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_awaddr[4]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[7]_i_1 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_awaddr[5]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[8]_i_1 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_awaddr[6]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \bus2ip_addr_i[9]_i_1 
       (.I0(s_axi_araddr[7]),
        .I1(s_axi_awaddr[7]),
        .I2(s_axi_arvalid),
        .O(\bus2ip_addr_i[9]_i_1_n_0 ));
  FDRE \bus2ip_addr_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[10]_i_2_n_0 ),
        .Q(bus2ip_addr),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[2]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[3]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[4]_i_1_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[5]_i_1_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[6]_i_1_n_0 ),
        .Q(Q[4]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[7]_i_1_n_0 ),
        .Q(Q[5]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[8]_i_1_n_0 ),
        .Q(Q[6]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(\bus2ip_addr_i[9]_i_1_n_0 ),
        .Q(Q[7]),
        .R(SR));
  FDRE bus2ip_rnw_i_reg
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[10]_i_1_n_0 ),
        .D(s_axi_arvalid),
        .Q(bus2ip_rnw_i_reg_n_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \do_reg[15]_i_1 
       (.I0(SR),
        .I1(\do_reg_reg[15] ),
        .I2(jtaglocked_i),
        .O(rst_reg_0));
  LUT3 #(
    .INIT(8'hFE)) 
    inst_sysmon_i_3
       (.I0(SR),
        .I1(\do_reg_reg[15] ),
        .I2(hard_macro_rst_reg),
        .O(RESET));
  LUT1 #(
    .INIT(2'h1)) 
    rst_i_1
       (.I0(s_axi_aresetn),
        .O(rst_i_1_n_0));
  FDRE rst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rst_i_1_n_0),
        .Q(SR),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s_axi_arready_INST_0
       (.I0(ip2bus_rdack),
        .I1(timeout),
        .O(s_axi_arready));
  LUT3 #(
    .INIT(8'hB8)) 
    \s_axi_bresp_i[1]_i_1 
       (.I0(p_1_in),
        .I1(s_axi_bresp_i),
        .I2(s_axi_bresp),
        .O(\s_axi_bresp_i[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_bresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\s_axi_bresp_i[1]_i_1_n_0 ),
        .Q(s_axi_bresp),
        .R(SR));
  LUT6 #(
    .INIT(64'h00E0FFFF00E000E0)) 
    s_axi_bvalid_i_i_1
       (.I0(ip2bus_wrack),
        .I1(timeout),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(s_axi_bready),
        .I5(s_axi_bvalid),
        .O(s_axi_bvalid_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_bvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [0]),
        .Q(s_axi_rdata[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [10]),
        .Q(s_axi_rdata[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [11]),
        .Q(s_axi_rdata[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [12]),
        .Q(s_axi_rdata[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [13]),
        .Q(s_axi_rdata[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [14]),
        .Q(s_axi_rdata[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [15]),
        .Q(s_axi_rdata[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [16]),
        .Q(s_axi_rdata[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [17]),
        .Q(s_axi_rdata[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [1]),
        .Q(s_axi_rdata[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [2]),
        .Q(s_axi_rdata[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [18]),
        .Q(s_axi_rdata[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [3]),
        .Q(s_axi_rdata[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [4]),
        .Q(s_axi_rdata[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [5]),
        .Q(s_axi_rdata[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [6]),
        .Q(s_axi_rdata[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [7]),
        .Q(s_axi_rdata[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [8]),
        .Q(s_axi_rdata[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(\s_axi_rdata_i_reg[31]_0 [9]),
        .Q(s_axi_rdata[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(p_1_in),
        .Q(s_axi_rresp),
        .R(SR));
  LUT6 #(
    .INIT(64'h00E0FFFF00E000E0)) 
    s_axi_rvalid_i_i_1
       (.I0(ip2bus_rdack),
        .I1(timeout),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(s_axi_rready),
        .I5(s_axi_rvalid),
        .O(s_axi_rvalid_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_rvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    s_axi_wready_INST_0
       (.I0(ip2bus_wrack),
        .I1(timeout),
        .O(s_axi_awready));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h000000F8)) 
    start2_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_arvalid),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .O(start2_i_1_n_0));
  FDRE start2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(start2_i_1_n_0),
        .Q(start2),
        .R(SR));
  LUT6 #(
    .INIT(64'h00FFFCAAFFFFFCAA)) 
    \state[0]_i_1 
       (.I0(s_axi_arvalid),
        .I1(ip2bus_wrack),
        .I2(timeout),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(state1__2),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55FFFF0C5500FF0C)) 
    \state[1]_i_1 
       (.I0(state1__2),
        .I1(p_2_in),
        .I2(s_axi_arvalid),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[0] ),
        .I5(s_axi_arready),
        .O(\state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \state[1]_i_2 
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .O(p_2_in));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFF1FFFFFFFFFFFF)) 
    sw_rst_cond_d1_i_2
       (.I0(bus2ip_rnw_i_reg_n_0),
        .I1(s_axi_wstrb[0]),
        .I2(s_axi_wdata[2]),
        .I3(s_axi_wdata[0]),
        .I4(s_axi_wdata[1]),
        .I5(s_axi_wdata[3]),
        .O(\SOFT_RESET_I/data_is_non_reset_match__3 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_soft_reset
   (sw_rst_cond_d1,
    wrack,
    \RESET_FLOPS[15].RST_FLOPS_0 ,
    bus2ip_reset_active_high,
    sw_rst_cond,
    s_axi_aclk,
    reset_trig0);
  output sw_rst_cond_d1;
  output wrack;
  output \RESET_FLOPS[15].RST_FLOPS_0 ;
  input bus2ip_reset_active_high;
  input sw_rst_cond;
  input s_axi_aclk;
  input reset_trig0;

  wire FF_WRACK_i_1_n_0;
  wire \RESET_FLOPS[10].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[11].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[12].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[13].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[14].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[15].RST_FLOPS_0 ;
  wire \RESET_FLOPS[15].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[1].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[2].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[3].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[4].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[5].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[6].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[7].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[8].RST_FLOPS_i_1_n_0 ;
  wire \RESET_FLOPS[9].RST_FLOPS_i_1_n_0 ;
  wire S;
  wire bus2ip_reset_active_high;
  wire flop_q_chain_1;
  wire flop_q_chain_10;
  wire flop_q_chain_11;
  wire flop_q_chain_12;
  wire flop_q_chain_13;
  wire flop_q_chain_14;
  wire flop_q_chain_15;
  wire flop_q_chain_2;
  wire flop_q_chain_3;
  wire flop_q_chain_4;
  wire flop_q_chain_5;
  wire flop_q_chain_6;
  wire flop_q_chain_7;
  wire flop_q_chain_8;
  wire flop_q_chain_9;
  wire reset_trig0;
  wire s_axi_aclk;
  wire sw_rst_cond;
  wire sw_rst_cond_d1;
  wire wrack;

  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    FF_WRACK
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(FF_WRACK_i_1_n_0),
        .Q(wrack),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    FF_WRACK_i_1
       (.I0(\RESET_FLOPS[15].RST_FLOPS_0 ),
        .I1(flop_q_chain_1),
        .O(FF_WRACK_i_1_n_0));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[0].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(S),
        .Q(flop_q_chain_15),
        .R(bus2ip_reset_active_high));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[10].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[10].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_5),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[10].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_6),
        .O(\RESET_FLOPS[10].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[11].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[11].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_4),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[11].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_5),
        .O(\RESET_FLOPS[11].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[12].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[12].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_3),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[12].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_4),
        .O(\RESET_FLOPS[12].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[13].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[13].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_2),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[13].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_3),
        .O(\RESET_FLOPS[13].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[14].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[14].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_1),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[14].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_2),
        .O(\RESET_FLOPS[14].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[15].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[15].RST_FLOPS_i_1_n_0 ),
        .Q(\RESET_FLOPS[15].RST_FLOPS_0 ),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[15].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_1),
        .O(\RESET_FLOPS[15].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[1].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[1].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_14),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[1].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_15),
        .O(\RESET_FLOPS[1].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[2].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[2].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_13),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[2].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_14),
        .O(\RESET_FLOPS[2].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[3].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[3].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_12),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[3].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_13),
        .O(\RESET_FLOPS[3].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[4].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[4].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_11),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[4].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_12),
        .O(\RESET_FLOPS[4].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[5].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[5].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_10),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[5].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_11),
        .O(\RESET_FLOPS[5].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[6].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[6].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_9),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[6].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_10),
        .O(\RESET_FLOPS[6].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[7].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[7].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_8),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[7].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_9),
        .O(\RESET_FLOPS[7].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[8].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[8].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_7),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[8].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_8),
        .O(\RESET_FLOPS[8].RST_FLOPS_i_1_n_0 ));
  (* IS_CE_INVERTED = "1'b0" *) 
  (* IS_S_INVERTED = "1'b0" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \RESET_FLOPS[9].RST_FLOPS 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\RESET_FLOPS[9].RST_FLOPS_i_1_n_0 ),
        .Q(flop_q_chain_6),
        .R(bus2ip_reset_active_high));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RESET_FLOPS[9].RST_FLOPS_i_1 
       (.I0(S),
        .I1(flop_q_chain_7),
        .O(\RESET_FLOPS[9].RST_FLOPS_i_1_n_0 ));
  FDRE reset_trig_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(reset_trig0),
        .Q(S),
        .R(bus2ip_reset_active_high));
  FDRE sw_rst_cond_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(sw_rst_cond),
        .Q(sw_rst_cond_d1),
        .R(bus2ip_reset_active_high));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system_pl_sysmon_0_xadc_core_drp
   (D,
    eoc_out,
    eos_out,
    jtagmodified_i,
    inst_sysmon_0,
    local_reg_wrack_d1,
    local_reg_rdack_d1,
    status_reg_rdack_d1,
    jtagmodified_d1,
    hard_macro_rst_reg,
    ip2bus_error_int1,
    drdy_wr_ack_i_reg_0,
    ip2bus_rdack_int1,
    interrupt_status_i,
    \do_reg_reg[15]_0 ,
    \alarm_reg_reg[14]_0 ,
    \status_reg_reg[11]_0 ,
    vauxp0,
    vauxn0,
    vauxp1,
    vauxn1,
    vauxp2,
    vauxn2,
    vauxp3,
    vauxn3,
    vauxp4,
    vauxn4,
    vauxp5,
    vauxn5,
    vauxp6,
    vauxn6,
    vauxp7,
    vauxn7,
    vauxp8,
    vauxn8,
    vauxp9,
    vauxn9,
    vauxp10,
    vauxn10,
    s_axi_aclk,
    DWE,
    RESET,
    s_axi_wdata,
    Q,
    reset2ip_reset,
    convst_rst_wrce_or_reduce,
    local_reg_wrack0,
    bus2ip_wrce,
    local_rdce_or_reduce,
    local_reg_rdack0,
    bus2ip_rdce,
    status_reg_rdack0,
    hard_macro_rst_reg_reg_0,
    drdy_wr_ack_i_reg_1,
    Bus_RNW_reg,
    and_reduce_be,
    rst_ip2bus_error,
    dummy_local_reg_rdack,
    \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ,
    rst_ip2bus_rdack,
    intr_ip2bus_rdack,
    bus2ip_reset_active_high,
    jtagmodified_d1_reg_0,
    SR);
  output [7:0]D;
  output eoc_out;
  output eos_out;
  output jtagmodified_i;
  output [12:0]inst_sysmon_0;
  output local_reg_wrack_d1;
  output local_reg_rdack_d1;
  output status_reg_rdack_d1;
  output jtagmodified_d1;
  output hard_macro_rst_reg;
  output ip2bus_error_int1;
  output drdy_wr_ack_i_reg_0;
  output ip2bus_rdack_int1;
  output [1:0]interrupt_status_i;
  output [15:0]\do_reg_reg[15]_0 ;
  output [14:0]\alarm_reg_reg[14]_0 ;
  output [11:0]\status_reg_reg[11]_0 ;
  input vauxp0;
  input vauxn0;
  input vauxp1;
  input vauxn1;
  input vauxp2;
  input vauxn2;
  input vauxp3;
  input vauxn3;
  input vauxp4;
  input vauxn4;
  input vauxp5;
  input vauxn5;
  input vauxp6;
  input vauxn6;
  input vauxp7;
  input vauxn7;
  input vauxp8;
  input vauxn8;
  input vauxp9;
  input vauxn9;
  input vauxp10;
  input vauxn10;
  input s_axi_aclk;
  input DWE;
  input RESET;
  input [15:0]s_axi_wdata;
  input [7:0]Q;
  input reset2ip_reset;
  input convst_rst_wrce_or_reduce;
  input local_reg_wrack0;
  input [0:0]bus2ip_wrce;
  input local_rdce_or_reduce;
  input local_reg_rdack0;
  input [1:0]bus2ip_rdce;
  input status_reg_rdack0;
  input hard_macro_rst_reg_reg_0;
  input drdy_wr_ack_i_reg_1;
  input Bus_RNW_reg;
  input and_reduce_be;
  input rst_ip2bus_error;
  input dummy_local_reg_rdack;
  input \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ;
  input rst_ip2bus_rdack;
  input intr_ip2bus_rdack;
  input bus2ip_reset_active_high;
  input jtagmodified_d1_reg_0;
  input [0:0]SR;

  wire Bus_RNW_reg;
  wire [7:0]D;
  wire DEN;
  wire DWE;
  wire \INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ;
  wire [7:0]Q;
  wire RESET;
  wire [0:0]SR;
  wire [10:0]VAUXN;
  wire [10:0]VAUXP;
  wire alarm_0_d1;
  wire [14:0]\alarm_reg_reg[14]_0 ;
  wire and_reduce_be;
  wire [1:0]bus2ip_rdce;
  wire bus2ip_reset_active_high;
  wire [0:0]bus2ip_wrce;
  wire convst_rst_wrce_or_reduce;
  (* DONT_TOUCH *) wire [7:0]daddr_C_master_reg;
  (* DONT_TOUCH *) wire [7:0]daddr_C_master_reg2;
  (* DONT_TOUCH *) wire [7:0]daddr_C_slave0_reg;
  (* DONT_TOUCH *) wire [7:0]daddr_C_slave0_reg2;
  (* DONT_TOUCH *) wire [7:0]daddr_C_slave1_reg;
  (* DONT_TOUCH *) wire [7:0]daddr_C_slave1_reg2;
  wire den_d1;
  (* DONT_TOUCH *) wire [15:0]di_C_master_reg;
  (* DONT_TOUCH *) wire [15:0]di_C_master_reg2;
  (* DONT_TOUCH *) wire [15:0]di_C_slave0_reg;
  (* DONT_TOUCH *) wire [15:0]di_C_slave0_reg2;
  (* DONT_TOUCH *) wire [15:0]di_C_slave1_reg;
  (* DONT_TOUCH *) wire [15:0]di_C_slave1_reg2;
  wire [15:0]do_C;
  wire [15:0]\do_reg_reg[15]_0 ;
  wire drdy_C;
  wire drdy_rd_ack_i;
  wire drdy_rd_ack_i_d1;
  wire drdy_rd_ack_i_d2;
  wire drdy_rd_ack_i_i_1_n_0;
  wire drdy_wr_ack_i;
  wire drdy_wr_ack_i_d1;
  wire drdy_wr_ack_i_d2;
  wire drdy_wr_ack_i_i_1_n_0;
  wire drdy_wr_ack_i_reg_0;
  wire drdy_wr_ack_i_reg_1;
  wire dummy_local_reg_rdack;
  (* DONT_TOUCH *) wire dwe_C_master_reg;
  (* DONT_TOUCH *) wire dwe_C_master_reg2;
  (* DONT_TOUCH *) wire dwe_C_slave0_reg;
  (* DONT_TOUCH *) wire dwe_C_slave0_reg2;
  (* DONT_TOUCH *) wire dwe_C_slave1_reg;
  (* DONT_TOUCH *) wire dwe_C_slave1_reg2;
  wire eoc_d1;
  wire eoc_d1_i_1_n_0;
  wire eoc_out;
  wire eos_d1;
  wire eos_d1_i_1_n_0;
  wire eos_out;
  wire hard_macro_rst_reg;
  wire hard_macro_rst_reg_reg_0;
  wire [12:0]inst_sysmon_0;
  wire inst_sysmon_n_27;
  wire inst_sysmon_n_28;
  wire inst_sysmon_n_29;
  wire inst_sysmon_n_30;
  wire [1:0]interrupt_status_i;
  wire intr_ip2bus_rdack;
  wire ip2bus_error_int1;
  wire ip2bus_rdack_int1;
  wire jtagbusy_i;
  wire jtagmodified_d1;
  wire jtagmodified_d1_i_1_n_0;
  wire jtagmodified_d1_reg_0;
  wire jtagmodified_i;
  wire local_rdce_or_reduce;
  wire local_reg_rdack;
  wire local_reg_rdack0;
  wire local_reg_rdack_d1;
  wire local_reg_wrack;
  wire local_reg_wrack0;
  wire local_reg_wrack_d1;
  wire ot_d1;
  wire p_4_in;
  wire [7:6]p_5_out;
  wire reset2ip_reset;
  wire rst_ip2bus_error;
  wire rst_ip2bus_rdack;
  wire s_axi_aclk;
  wire [15:0]s_axi_wdata;
  wire \status_reg[10]_i_1_n_0 ;
  wire status_reg_rdack;
  wire status_reg_rdack0;
  wire status_reg_rdack_d1;
  wire [11:0]\status_reg_reg[11]_0 ;
  wire vauxn0;
  wire vauxn1;
  wire vauxn10;
  wire vauxn2;
  wire vauxn3;
  wire vauxn4;
  wire vauxn5;
  wire vauxn6;
  wire vauxn7;
  wire vauxn8;
  wire vauxn9;
  wire vauxp0;
  wire vauxp1;
  wire vauxp10;
  wire vauxp2;
  wire vauxp3;
  wire vauxp4;
  wire vauxp5;
  wire vauxp6;
  wire vauxp7;
  wire vauxp8;
  wire vauxp9;
  wire xadc_ip2bus_rdack;
  wire NLW_inst_sysmon_I2C_SCLK_TS_UNCONNECTED;
  wire NLW_inst_sysmon_I2C_SDA_TS_UNCONNECTED;
  wire NLW_inst_sysmon_SMBALERT_TS_UNCONNECTED;
  wire [15:0]NLW_inst_sysmon_ADC_DATA_UNCONNECTED;
  wire [4:0]NLW_inst_sysmon_MUXADDR_UNCONNECTED;

  LUT2 #(
    .INIT(4'h2)) 
    \DO_IRPT_INPUT[8].GEN_POS_EDGE_DETECT.irpt_dly1_i_1 
       (.I0(ot_d1),
        .I1(inst_sysmon_0[0]),
        .O(interrupt_status_i[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DO_IRPT_INPUT[9].GEN_POS_EDGE_DETECT.irpt_dly1_i_1 
       (.I0(alarm_0_d1),
        .I1(inst_sysmon_0[1]),
        .O(interrupt_status_i[0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hFFFF5554)) 
    \INTR_CTRLR_GEN_I.ip2bus_error_i_2 
       (.I0(and_reduce_be),
        .I1(local_reg_wrack),
        .I2(drdy_wr_ack_i),
        .I3(xadc_ip2bus_rdack),
        .I4(rst_ip2bus_error),
        .O(ip2bus_error_int1));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \INTR_CTRLR_GEN_I.ip2bus_error_i_4 
       (.I0(local_reg_rdack),
        .I1(status_reg_rdack),
        .I2(drdy_rd_ack_i),
        .O(xadc_ip2bus_rdack));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \INTR_CTRLR_GEN_I.ip2bus_rdack_i_1 
       (.I0(xadc_ip2bus_rdack),
        .I1(dummy_local_reg_rdack),
        .I2(\INTR_CTRLR_GEN_I.dummy_intr_reg_rdack ),
        .I3(rst_ip2bus_rdack),
        .I4(intr_ip2bus_rdack),
        .O(ip2bus_rdack_int1));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \INTR_CTRLR_GEN_I.ip2bus_wrack_i_2 
       (.I0(drdy_wr_ack_i),
        .I1(local_reg_wrack),
        .O(drdy_wr_ack_i_reg_0));
  FDRE alarm_0_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[1]),
        .Q(alarm_0_d1),
        .R(1'b0));
  FDRE \alarm_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[0]),
        .Q(\alarm_reg_reg[14]_0 [0]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[10]),
        .Q(\alarm_reg_reg[14]_0 [10]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[11]),
        .Q(\alarm_reg_reg[14]_0 [11]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[12]),
        .Q(\alarm_reg_reg[14]_0 [12]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_n_30),
        .Q(\alarm_reg_reg[14]_0 [13]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_n_29),
        .Q(\alarm_reg_reg[14]_0 [14]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[1]),
        .Q(\alarm_reg_reg[14]_0 [1]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[2]),
        .Q(\alarm_reg_reg[14]_0 [2]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[3]),
        .Q(\alarm_reg_reg[14]_0 [3]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[4]),
        .Q(\alarm_reg_reg[14]_0 [4]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[5]),
        .Q(\alarm_reg_reg[14]_0 [5]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[6]),
        .Q(\alarm_reg_reg[14]_0 [6]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[7]),
        .Q(\alarm_reg_reg[14]_0 [7]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[8]),
        .Q(\alarm_reg_reg[14]_0 [8]),
        .R(reset2ip_reset));
  FDRE \alarm_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[9]),
        .Q(\alarm_reg_reg[14]_0 [9]),
        .R(reset2ip_reset));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h4)) 
    den_d1_i_1
       (.I0(D[7]),
        .I1(drdy_wr_ack_i_reg_1),
        .O(p_4_in));
  FDRE den_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_4_in),
        .Q(den_d1),
        .R(1'b0));
  FDRE \do_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[0]),
        .Q(\do_reg_reg[15]_0 [0]),
        .R(SR));
  FDRE \do_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[10]),
        .Q(\do_reg_reg[15]_0 [10]),
        .R(SR));
  FDRE \do_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[11]),
        .Q(\do_reg_reg[15]_0 [11]),
        .R(SR));
  FDRE \do_reg_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[12]),
        .Q(\do_reg_reg[15]_0 [12]),
        .R(SR));
  FDRE \do_reg_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[13]),
        .Q(\do_reg_reg[15]_0 [13]),
        .R(SR));
  FDRE \do_reg_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[14]),
        .Q(\do_reg_reg[15]_0 [14]),
        .R(SR));
  FDRE \do_reg_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[15]),
        .Q(\do_reg_reg[15]_0 [15]),
        .R(SR));
  FDRE \do_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[1]),
        .Q(\do_reg_reg[15]_0 [1]),
        .R(SR));
  FDRE \do_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[2]),
        .Q(\do_reg_reg[15]_0 [2]),
        .R(SR));
  FDRE \do_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[3]),
        .Q(\do_reg_reg[15]_0 [3]),
        .R(SR));
  FDRE \do_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[4]),
        .Q(\do_reg_reg[15]_0 [4]),
        .R(SR));
  FDRE \do_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[5]),
        .Q(\do_reg_reg[15]_0 [5]),
        .R(SR));
  FDRE \do_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[6]),
        .Q(\do_reg_reg[15]_0 [6]),
        .R(SR));
  FDRE \do_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[7]),
        .Q(\do_reg_reg[15]_0 [7]),
        .R(SR));
  FDRE \do_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[8]),
        .Q(\do_reg_reg[15]_0 [8]),
        .R(SR));
  FDRE \do_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_C[9]),
        .Q(\do_reg_reg[15]_0 [9]),
        .R(SR));
  FDRE drdy_rd_ack_i_d1_reg
       (.C(s_axi_aclk),
        .CE(D[7]),
        .D(bus2ip_rdce[0]),
        .Q(drdy_rd_ack_i_d1),
        .R(reset2ip_reset));
  FDRE drdy_rd_ack_i_d2_reg
       (.C(s_axi_aclk),
        .CE(D[7]),
        .D(drdy_rd_ack_i_d1),
        .Q(drdy_rd_ack_i_d2),
        .R(reset2ip_reset));
  LUT6 #(
    .INIT(64'h22222222F0000000)) 
    drdy_rd_ack_i_i_1
       (.I0(drdy_rd_ack_i_d1),
        .I1(drdy_rd_ack_i_d2),
        .I2(drdy_wr_ack_i_reg_1),
        .I3(Bus_RNW_reg),
        .I4(drdy_C),
        .I5(D[7]),
        .O(drdy_rd_ack_i_i_1_n_0));
  FDRE drdy_rd_ack_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(drdy_rd_ack_i_i_1_n_0),
        .Q(drdy_rd_ack_i),
        .R(reset2ip_reset));
  FDRE drdy_wr_ack_i_d1_reg
       (.C(s_axi_aclk),
        .CE(D[7]),
        .D(bus2ip_wrce),
        .Q(drdy_wr_ack_i_d1),
        .R(reset2ip_reset));
  FDRE drdy_wr_ack_i_d2_reg
       (.C(s_axi_aclk),
        .CE(D[7]),
        .D(drdy_wr_ack_i_d1),
        .Q(drdy_wr_ack_i_d2),
        .R(reset2ip_reset));
  LUT6 #(
    .INIT(64'h2222222200F00000)) 
    drdy_wr_ack_i_i_1
       (.I0(drdy_wr_ack_i_d1),
        .I1(drdy_wr_ack_i_d2),
        .I2(drdy_wr_ack_i_reg_1),
        .I3(Bus_RNW_reg),
        .I4(drdy_C),
        .I5(D[7]),
        .O(drdy_wr_ack_i_i_1_n_0));
  FDRE drdy_wr_ack_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(drdy_wr_ack_i_i_1_n_0),
        .Q(drdy_wr_ack_i),
        .R(reset2ip_reset));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    eoc_d1_i_1
       (.I0(eoc_out),
        .I1(status_reg_rdack),
        .I2(eoc_d1),
        .O(eoc_d1_i_1_n_0));
  FDRE eoc_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(eoc_d1_i_1_n_0),
        .Q(eoc_d1),
        .R(reset2ip_reset));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    eos_d1_i_1
       (.I0(eos_out),
        .I1(status_reg_rdack),
        .I2(eos_d1),
        .O(eos_d1_i_1_n_0));
  FDRE eos_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(eos_d1_i_1_n_0),
        .Q(eos_d1),
        .R(reset2ip_reset));
  FDRE hard_macro_rst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(hard_macro_rst_reg_reg_0),
        .Q(hard_macro_rst_reg),
        .R(reset2ip_reset));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(daddr_C_master_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(daddr_C_master_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(di_C_master_reg[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_100
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_101
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_102
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_103
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_104
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_105
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_106
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_107
       (.I0(1'b0),
        .O(daddr_C_slave0_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_108
       (.I0(1'b0),
        .O(di_C_slave0_reg2[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_109
       (.I0(1'b0),
        .O(di_C_slave0_reg2[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(di_C_master_reg[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_110
       (.I0(1'b0),
        .O(di_C_slave0_reg2[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_111
       (.I0(1'b0),
        .O(di_C_slave0_reg2[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_112
       (.I0(1'b0),
        .O(di_C_slave0_reg2[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_113
       (.I0(1'b0),
        .O(di_C_slave0_reg2[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_114
       (.I0(1'b0),
        .O(di_C_slave0_reg2[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_115
       (.I0(1'b0),
        .O(di_C_slave0_reg2[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_116
       (.I0(1'b0),
        .O(di_C_slave0_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_117
       (.I0(1'b0),
        .O(di_C_slave0_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_118
       (.I0(1'b0),
        .O(di_C_slave0_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_119
       (.I0(1'b0),
        .O(di_C_slave0_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(di_C_master_reg[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_120
       (.I0(1'b0),
        .O(di_C_slave0_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_121
       (.I0(1'b0),
        .O(di_C_slave0_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_122
       (.I0(1'b0),
        .O(di_C_slave0_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_123
       (.I0(1'b0),
        .O(di_C_slave0_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_124
       (.I0(1'b0),
        .O(dwe_C_slave0_reg2));
  LUT1 #(
    .INIT(2'h2)) 
    i_125
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_126
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_127
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_128
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_129
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(di_C_master_reg[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_130
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_131
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_132
       (.I0(1'b0),
        .O(daddr_C_slave1_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_133
       (.I0(1'b0),
        .O(di_C_slave1_reg2[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_134
       (.I0(1'b0),
        .O(di_C_slave1_reg2[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_135
       (.I0(1'b0),
        .O(di_C_slave1_reg2[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_136
       (.I0(1'b0),
        .O(di_C_slave1_reg2[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_137
       (.I0(1'b0),
        .O(di_C_slave1_reg2[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_138
       (.I0(1'b0),
        .O(di_C_slave1_reg2[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_139
       (.I0(1'b0),
        .O(di_C_slave1_reg2[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(di_C_master_reg[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_140
       (.I0(1'b0),
        .O(di_C_slave1_reg2[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_141
       (.I0(1'b0),
        .O(di_C_slave1_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_142
       (.I0(1'b0),
        .O(di_C_slave1_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_143
       (.I0(1'b0),
        .O(di_C_slave1_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_144
       (.I0(1'b0),
        .O(di_C_slave1_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_145
       (.I0(1'b0),
        .O(di_C_slave1_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_146
       (.I0(1'b0),
        .O(di_C_slave1_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_147
       (.I0(1'b0),
        .O(di_C_slave1_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_148
       (.I0(1'b0),
        .O(di_C_slave1_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_149
       (.I0(1'b0),
        .O(dwe_C_slave1_reg2));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(di_C_master_reg[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(di_C_master_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(di_C_master_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(di_C_master_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(di_C_master_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(daddr_C_master_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(di_C_master_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_21
       (.I0(1'b0),
        .O(di_C_master_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_22
       (.I0(1'b0),
        .O(di_C_master_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_23
       (.I0(1'b0),
        .O(di_C_master_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_24
       (.I0(1'b0),
        .O(dwe_C_master_reg));
  LUT1 #(
    .INIT(2'h2)) 
    i_25
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_26
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_27
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_28
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_29
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(daddr_C_master_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_30
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_31
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_32
       (.I0(1'b0),
        .O(daddr_C_slave0_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_33
       (.I0(1'b0),
        .O(di_C_slave0_reg[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_34
       (.I0(1'b0),
        .O(di_C_slave0_reg[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_35
       (.I0(1'b0),
        .O(di_C_slave0_reg[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_36
       (.I0(1'b0),
        .O(di_C_slave0_reg[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_37
       (.I0(1'b0),
        .O(di_C_slave0_reg[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_38
       (.I0(1'b0),
        .O(di_C_slave0_reg[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_39
       (.I0(1'b0),
        .O(di_C_slave0_reg[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(daddr_C_master_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_40
       (.I0(1'b0),
        .O(di_C_slave0_reg[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_41
       (.I0(1'b0),
        .O(di_C_slave0_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_42
       (.I0(1'b0),
        .O(di_C_slave0_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_43
       (.I0(1'b0),
        .O(di_C_slave0_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_44
       (.I0(1'b0),
        .O(di_C_slave0_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_45
       (.I0(1'b0),
        .O(di_C_slave0_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_46
       (.I0(1'b0),
        .O(di_C_slave0_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_47
       (.I0(1'b0),
        .O(di_C_slave0_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_48
       (.I0(1'b0),
        .O(di_C_slave0_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_49
       (.I0(1'b0),
        .O(dwe_C_slave0_reg));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(daddr_C_master_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_50
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_51
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_52
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_53
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_54
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_55
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_56
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_57
       (.I0(1'b0),
        .O(daddr_C_slave1_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_58
       (.I0(1'b0),
        .O(di_C_slave1_reg[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_59
       (.I0(1'b0),
        .O(di_C_slave1_reg[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(daddr_C_master_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_60
       (.I0(1'b0),
        .O(di_C_slave1_reg[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_61
       (.I0(1'b0),
        .O(di_C_slave1_reg[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_62
       (.I0(1'b0),
        .O(di_C_slave1_reg[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_63
       (.I0(1'b0),
        .O(di_C_slave1_reg[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_64
       (.I0(1'b0),
        .O(di_C_slave1_reg[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_65
       (.I0(1'b0),
        .O(di_C_slave1_reg[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_66
       (.I0(1'b0),
        .O(di_C_slave1_reg[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_67
       (.I0(1'b0),
        .O(di_C_slave1_reg[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_68
       (.I0(1'b0),
        .O(di_C_slave1_reg[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_69
       (.I0(1'b0),
        .O(di_C_slave1_reg[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(daddr_C_master_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_70
       (.I0(1'b0),
        .O(di_C_slave1_reg[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_71
       (.I0(1'b0),
        .O(di_C_slave1_reg[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_72
       (.I0(1'b0),
        .O(di_C_slave1_reg[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_73
       (.I0(1'b0),
        .O(di_C_slave1_reg[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_74
       (.I0(1'b0),
        .O(dwe_C_slave1_reg));
  LUT1 #(
    .INIT(2'h2)) 
    i_75
       (.I0(1'b0),
        .O(daddr_C_master_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_76
       (.I0(1'b0),
        .O(daddr_C_master_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_77
       (.I0(1'b0),
        .O(daddr_C_master_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_78
       (.I0(1'b0),
        .O(daddr_C_master_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_79
       (.I0(1'b0),
        .O(daddr_C_master_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(di_C_master_reg[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_80
       (.I0(1'b0),
        .O(daddr_C_master_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_81
       (.I0(1'b0),
        .O(daddr_C_master_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_82
       (.I0(1'b0),
        .O(daddr_C_master_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_83
       (.I0(1'b0),
        .O(di_C_master_reg2[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_84
       (.I0(1'b0),
        .O(di_C_master_reg2[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_85
       (.I0(1'b0),
        .O(di_C_master_reg2[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_86
       (.I0(1'b0),
        .O(di_C_master_reg2[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_87
       (.I0(1'b0),
        .O(di_C_master_reg2[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_88
       (.I0(1'b0),
        .O(di_C_master_reg2[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_89
       (.I0(1'b0),
        .O(di_C_master_reg2[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(di_C_master_reg[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_90
       (.I0(1'b0),
        .O(di_C_master_reg2[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_91
       (.I0(1'b0),
        .O(di_C_master_reg2[7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_92
       (.I0(1'b0),
        .O(di_C_master_reg2[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_93
       (.I0(1'b0),
        .O(di_C_master_reg2[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_94
       (.I0(1'b0),
        .O(di_C_master_reg2[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_95
       (.I0(1'b0),
        .O(di_C_master_reg2[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_96
       (.I0(1'b0),
        .O(di_C_master_reg2[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_97
       (.I0(1'b0),
        .O(di_C_master_reg2[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_98
       (.I0(1'b0),
        .O(di_C_master_reg2[0]));
  LUT1 #(
    .INIT(2'h2)) 
    i_99
       (.I0(1'b0),
        .O(dwe_C_master_reg2));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn0
       (.I(vauxn0),
        .O(VAUXN[0]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn1
       (.I(vauxn1),
        .O(VAUXN[1]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn10
       (.I(vauxn10),
        .O(VAUXN[10]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn2
       (.I(vauxn2),
        .O(VAUXN[2]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn3
       (.I(vauxn3),
        .O(VAUXN[3]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn4
       (.I(vauxn4),
        .O(VAUXN[4]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn5
       (.I(vauxn5),
        .O(VAUXN[5]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn6
       (.I(vauxn6),
        .O(VAUXN[6]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn7
       (.I(vauxn7),
        .O(VAUXN[7]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn8
       (.I(vauxn8),
        .O(VAUXN[8]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxn9
       (.I(vauxn9),
        .O(VAUXN[9]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp0
       (.I(vauxp0),
        .O(VAUXP[0]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp1
       (.I(vauxp1),
        .O(VAUXP[1]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp10
       (.I(vauxp10),
        .O(VAUXP[10]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp2
       (.I(vauxp2),
        .O(VAUXP[2]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp3
       (.I(vauxp3),
        .O(VAUXP[3]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp4
       (.I(vauxp4),
        .O(VAUXP[4]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp5
       (.I(vauxp5),
        .O(VAUXP[5]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp6
       (.I(vauxp6),
        .O(VAUXP[6]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp7
       (.I(vauxp7),
        .O(VAUXP[7]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp8
       (.I(vauxp8),
        .O(VAUXP[8]));
  (* box_type = "PRIMITIVE" *) 
  IBUF_ANALOG ibuf_an_vauxp9
       (.I(vauxp9),
        .O(VAUXP[9]));
  (* box_type = "PRIMITIVE" *) 
  SYSMONE4 #(
    .COMMON_N_SOURCE(16'hFFFF),
    .INIT_40(16'h0000),
    .INIT_41(16'h2F9E),
    .INIT_42(16'h1400),
    .INIT_43(16'h200F),
    .INIT_44(16'h0002),
    .INIT_45(16'hAECA),
    .INIT_46(16'h0003),
    .INIT_47(16'h0000),
    .INIT_48(16'h0701),
    .INIT_49(16'h07FF),
    .INIT_4A(16'h0000),
    .INIT_4B(16'h0000),
    .INIT_4C(16'h0000),
    .INIT_4D(16'h0000),
    .INIT_4E(16'h0000),
    .INIT_4F(16'h0000),
    .INIT_50(16'hB794),
    .INIT_51(16'h4E81),
    .INIT_52(16'hA147),
    .INIT_53(16'hCBA3),
    .INIT_54(16'hAB02),
    .INIT_55(16'h4963),
    .INIT_56(16'h9555),
    .INIT_57(16'hB00A),
    .INIT_58(16'h4E81),
    .INIT_59(16'h4963),
    .INIT_5A(16'h4963),
    .INIT_5B(16'h9A74),
    .INIT_5C(16'h4963),
    .INIT_5D(16'h451E),
    .INIT_5E(16'h451E),
    .INIT_5F(16'h91EB),
    .INIT_60(16'h9A74),
    .INIT_61(16'h339F),
    .INIT_62(16'h9A74),
    .INIT_63(16'h9A74),
    .INIT_64(16'h0000),
    .INIT_65(16'h0000),
    .INIT_66(16'h0000),
    .INIT_67(16'h0000),
    .INIT_68(16'h98BF),
    .INIT_69(16'h32C5),
    .INIT_6A(16'h98BF),
    .INIT_6B(16'h98BF),
    .INIT_6C(16'h0000),
    .INIT_6D(16'h0000),
    .INIT_6E(16'h0000),
    .INIT_6F(16'h0000),
    .INIT_70(16'h0000),
    .INIT_71(16'h0000),
    .INIT_72(16'h0000),
    .INIT_73(16'h0000),
    .INIT_74(16'h0000),
    .INIT_75(16'h0000),
    .INIT_76(16'h0000),
    .INIT_77(16'h0000),
    .INIT_78(16'h0000),
    .INIT_79(16'h0000),
    .INIT_7A(16'h0000),
    .INIT_7B(16'h0000),
    .INIT_7C(16'h0000),
    .INIT_7D(16'h0000),
    .INIT_7E(16'h0000),
    .INIT_7F(16'h0000),
    .IS_CONVSTCLK_INVERTED(1'b0),
    .IS_DCLK_INVERTED(1'b0),
    .SIM_DEVICE("ZYNQ_ULTRASCALE"),
    .SIM_MONITOR_FILE("design.dat"),
    .SYSMON_VUSER0_BANK(66),
    .SYSMON_VUSER0_MONITOR("VCCO"),
    .SYSMON_VUSER1_BANK(26),
    .SYSMON_VUSER1_MONITOR("VCCO"),
    .SYSMON_VUSER2_BANK(0),
    .SYSMON_VUSER2_MONITOR("NONE"),
    .SYSMON_VUSER3_BANK(0),
    .SYSMON_VUSER3_MONITOR("NONE")) 
    inst_sysmon
       (.ADC_DATA(NLW_inst_sysmon_ADC_DATA_UNCONNECTED[15:0]),
        .ALM({inst_sysmon_n_27,inst_sysmon_n_28,inst_sysmon_n_29,inst_sysmon_n_30,inst_sysmon_0[12:1]}),
        .BUSY(D[6]),
        .CHANNEL(D[5:0]),
        .CONVST(1'b0),
        .CONVSTCLK(1'b0),
        .DADDR(Q),
        .DCLK(s_axi_aclk),
        .DEN(DEN),
        .DI(s_axi_wdata),
        .DO(do_C),
        .DRDY(drdy_C),
        .DWE(DWE),
        .EOC(eoc_out),
        .EOS(eos_out),
        .I2C_SCLK(1'b0),
        .I2C_SCLK_TS(NLW_inst_sysmon_I2C_SCLK_TS_UNCONNECTED),
        .I2C_SDA(1'b0),
        .I2C_SDA_TS(NLW_inst_sysmon_I2C_SDA_TS_UNCONNECTED),
        .JTAGBUSY(jtagbusy_i),
        .JTAGLOCKED(D[7]),
        .JTAGMODIFIED(jtagmodified_i),
        .MUXADDR(NLW_inst_sysmon_MUXADDR_UNCONNECTED[4:0]),
        .OT(inst_sysmon_0[0]),
        .RESET(RESET),
        .SMBALERT_TS(NLW_inst_sysmon_SMBALERT_TS_UNCONNECTED),
        .VAUXN({1'b0,1'b0,1'b0,1'b0,1'b0,VAUXN}),
        .VAUXP({1'b0,1'b0,1'b0,1'b0,1'b0,VAUXP}),
        .VN(1'b0),
        .VP(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h02)) 
    inst_sysmon_i_1
       (.I0(drdy_wr_ack_i_reg_1),
        .I1(D[7]),
        .I2(den_d1),
        .O(DEN));
  LUT5 #(
    .INIT(32'h01010100)) 
    jtagmodified_d1_i_1
       (.I0(bus2ip_reset_active_high),
        .I1(jtagmodified_d1_reg_0),
        .I2(drdy_rd_ack_i),
        .I3(jtagmodified_d1),
        .I4(jtagmodified_i),
        .O(jtagmodified_d1_i_1_n_0));
  FDRE jtagmodified_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(jtagmodified_d1_i_1_n_0),
        .Q(jtagmodified_d1),
        .R(1'b0));
  FDRE local_reg_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(local_rdce_or_reduce),
        .Q(local_reg_rdack_d1),
        .R(reset2ip_reset));
  FDRE local_reg_rdack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(local_reg_rdack0),
        .Q(local_reg_rdack),
        .R(reset2ip_reset));
  FDRE local_reg_wrack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(convst_rst_wrce_or_reduce),
        .Q(local_reg_wrack_d1),
        .R(reset2ip_reset));
  FDRE local_reg_wrack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(local_reg_wrack0),
        .Q(local_reg_wrack),
        .R(reset2ip_reset));
  FDRE ot_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(inst_sysmon_0[0]),
        .Q(ot_d1),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    \status_reg[10]_i_1 
       (.I0(jtagmodified_d1),
        .I1(jtagmodified_i),
        .O(\status_reg[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \status_reg[6]_i_1 
       (.I0(eoc_d1),
        .I1(eoc_out),
        .O(p_5_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \status_reg[7]_i_1 
       (.I0(eos_d1),
        .I1(eos_out),
        .O(p_5_out[7]));
  FDRE status_reg_rdack_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bus2ip_rdce[1]),
        .Q(status_reg_rdack_d1),
        .R(reset2ip_reset));
  FDRE status_reg_rdack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(status_reg_rdack0),
        .Q(status_reg_rdack),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\status_reg_reg[11]_0 [0]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\status_reg[10]_i_1_n_0 ),
        .Q(\status_reg_reg[11]_0 [10]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(jtagbusy_i),
        .Q(\status_reg_reg[11]_0 [11]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\status_reg_reg[11]_0 [1]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\status_reg_reg[11]_0 [2]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\status_reg_reg[11]_0 [3]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(\status_reg_reg[11]_0 [4]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(\status_reg_reg[11]_0 [5]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_5_out[6]),
        .Q(\status_reg_reg[11]_0 [6]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_5_out[7]),
        .Q(\status_reg_reg[11]_0 [7]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(\status_reg_reg[11]_0 [8]),
        .R(reset2ip_reset));
  FDRE \status_reg_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(\status_reg_reg[11]_0 [9]),
        .R(reset2ip_reset));
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
