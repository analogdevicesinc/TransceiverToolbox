// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:25:25 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_axi_adrv9001_tx2_dma_0_sim_netlist.v
// Design      : system_axi_adrv9001_tx2_dma_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ad_mem_asym
   (m_axis_data,
    E,
    m_axis_aclk,
    m_src_axi_aclk,
    ADDRARDADDR,
    ADDRBWRADDR,
    m_src_axi_rdata,
    m_src_axi_rvalid,
    dest_valid,
    m_ram_reg_bram_0_0,
    m_axis_ready,
    m_ram_reg_bram_0_1);
  output [31:0]m_axis_data;
  output [0:0]E;
  input m_axis_aclk;
  input m_src_axi_aclk;
  input [7:0]ADDRARDADDR;
  input [6:0]ADDRBWRADDR;
  input [63:0]m_src_axi_rdata;
  input m_src_axi_rvalid;
  input dest_valid;
  input m_ram_reg_bram_0_0;
  input m_axis_ready;
  input m_ram_reg_bram_0_1;

  wire [7:0]ADDRARDADDR;
  wire [6:0]ADDRBWRADDR;
  wire [0:0]E;
  wire dest_valid;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_ready;
  wire m_ram_reg_bram_0_0;
  wire m_ram_reg_bram_0_1;
  wire m_src_axi_aclk;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rvalid;
  wire NLW_m_ram_reg_bram_0_CASOUTDBITERR_UNCONNECTED;
  wire NLW_m_ram_reg_bram_0_CASOUTSBITERR_UNCONNECTED;
  wire NLW_m_ram_reg_bram_0_DBITERR_UNCONNECTED;
  wire NLW_m_ram_reg_bram_0_SBITERR_UNCONNECTED;
  wire [31:0]NLW_m_ram_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [31:0]NLW_m_ram_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [3:0]NLW_m_ram_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [3:0]NLW_m_ram_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [31:0]NLW_m_ram_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [3:0]NLW_m_ram_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [3:0]NLW_m_ram_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;
  wire [7:0]NLW_m_ram_reg_bram_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_m_ram_reg_bram_0_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "255" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "31" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "127" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "63" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/i_store_and_forward/i_mem/m_ram_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_aspect_ratio = "2" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "31" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("NO_CHANGE"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    m_ram_reg_bram_0
       (.ADDRARDADDR({1'b0,1'b0,ADDRARDADDR,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,ADDRBWRADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(NLW_m_ram_reg_bram_0_CASDOUTA_UNCONNECTED[31:0]),
        .CASDOUTB(NLW_m_ram_reg_bram_0_CASDOUTB_UNCONNECTED[31:0]),
        .CASDOUTPA(NLW_m_ram_reg_bram_0_CASDOUTPA_UNCONNECTED[3:0]),
        .CASDOUTPB(NLW_m_ram_reg_bram_0_CASDOUTPB_UNCONNECTED[3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(NLW_m_ram_reg_bram_0_CASOUTDBITERR_UNCONNECTED),
        .CASOUTSBITERR(NLW_m_ram_reg_bram_0_CASOUTSBITERR_UNCONNECTED),
        .CLKARDCLK(m_axis_aclk),
        .CLKBWRCLK(m_src_axi_aclk),
        .DBITERR(NLW_m_ram_reg_bram_0_DBITERR_UNCONNECTED),
        .DINADIN(m_src_axi_rdata[31:0]),
        .DINBDIN(m_src_axi_rdata[63:32]),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(m_axis_data),
        .DOUTBDOUT(NLW_m_ram_reg_bram_0_DOUTBDOUT_UNCONNECTED[31:0]),
        .DOUTPADOUTP(NLW_m_ram_reg_bram_0_DOUTPADOUTP_UNCONNECTED[3:0]),
        .DOUTPBDOUTP(NLW_m_ram_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_m_ram_reg_bram_0_ECCPARITY_UNCONNECTED[7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(E),
        .ENBWREN(1'b1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_m_ram_reg_bram_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_m_ram_reg_bram_0_SBITERR_UNCONNECTED),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid,m_src_axi_rvalid}));
  LUT4 #(
    .INIT(16'hA222)) 
    m_ram_reg_bram_0_i_1
       (.I0(dest_valid),
        .I1(m_ram_reg_bram_0_0),
        .I2(m_axis_ready),
        .I3(m_ram_reg_bram_0_1),
        .O(E));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_generator
   (addr_valid_reg_0,
    \id_reg[3]_0 ,
    \id_reg[2]_0 ,
    \id_reg[1]_0 ,
    \id_reg[0]_0 ,
    m_src_axi_araddr,
    bl_ready_ag,
    req_ready_ag,
    E,
    bl_ready_reg_0,
    enabled_reg_0,
    D,
    m_src_axi_arlen,
    m_src_axi_aclk,
    req_ready_reg_0,
    src_address_eot,
    \zerodeep.m_axis_raddr0 ,
    Q,
    addr_valid_reg_1,
    src_enable,
    m_src_axi_arready,
    out,
    enabled_reg_1,
    enabled_reg_2,
    enabled_reg_3,
    enabled_reg_4,
    enabled,
    \last_burst_len_reg[3]_0 );
  output addr_valid_reg_0;
  output \id_reg[3]_0 ;
  output \id_reg[2]_0 ;
  output \id_reg[1]_0 ;
  output \id_reg[0]_0 ;
  output [27:0]m_src_axi_araddr;
  output bl_ready_ag;
  output req_ready_ag;
  output [0:0]E;
  output [0:0]bl_ready_reg_0;
  output enabled_reg_0;
  output [0:0]D;
  output [3:0]m_src_axi_arlen;
  input m_src_axi_aclk;
  input [0:0]req_ready_reg_0;
  input src_address_eot;
  input \zerodeep.m_axis_raddr0 ;
  input [1:0]Q;
  input [3:0]addr_valid_reg_1;
  input src_enable;
  input m_src_axi_arready;
  input [31:0]out;
  input enabled_reg_1;
  input enabled_reg_2;
  input enabled_reg_3;
  input enabled_reg_4;
  input enabled;
  input [0:0]\last_burst_len_reg[3]_0 ;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire addr_valid_d1;
  wire addr_valid_i_1_n_0;
  wire addr_valid_i_3_n_0;
  wire addr_valid_i_4_n_0;
  wire addr_valid_reg_0;
  wire [3:0]addr_valid_reg_1;
  wire \address[0]_i_1_n_0 ;
  wire \address[10]_i_10_n_0 ;
  wire \address[10]_i_2_n_0 ;
  wire \address[10]_i_3_n_0 ;
  wire \address[10]_i_4_n_0 ;
  wire \address[10]_i_5_n_0 ;
  wire \address[10]_i_6_n_0 ;
  wire \address[10]_i_7_n_0 ;
  wire \address[10]_i_8_n_0 ;
  wire \address[10]_i_9_n_0 ;
  wire \address[18]_i_2_n_0 ;
  wire \address[18]_i_3_n_0 ;
  wire \address[18]_i_4_n_0 ;
  wire \address[18]_i_5_n_0 ;
  wire \address[18]_i_6_n_0 ;
  wire \address[18]_i_7_n_0 ;
  wire \address[18]_i_8_n_0 ;
  wire \address[18]_i_9_n_0 ;
  wire \address[1]_i_1_n_0 ;
  wire \address[26]_i_2_n_0 ;
  wire \address[26]_i_3_n_0 ;
  wire \address[26]_i_4_n_0 ;
  wire \address[26]_i_5_n_0 ;
  wire \address[26]_i_6_n_0 ;
  wire \address[26]_i_7_n_0 ;
  wire \address[26]_i_8_n_0 ;
  wire \address[26]_i_9_n_0 ;
  wire \address[27]_i_1_n_0 ;
  wire \address[27]_i_3_n_0 ;
  wire \address[2]_i_1_n_0 ;
  wire address_enabled;
  wire \address_reg[10]_i_1_n_0 ;
  wire \address_reg[10]_i_1_n_1 ;
  wire \address_reg[10]_i_1_n_10 ;
  wire \address_reg[10]_i_1_n_11 ;
  wire \address_reg[10]_i_1_n_12 ;
  wire \address_reg[10]_i_1_n_13 ;
  wire \address_reg[10]_i_1_n_14 ;
  wire \address_reg[10]_i_1_n_15 ;
  wire \address_reg[10]_i_1_n_2 ;
  wire \address_reg[10]_i_1_n_3 ;
  wire \address_reg[10]_i_1_n_4 ;
  wire \address_reg[10]_i_1_n_5 ;
  wire \address_reg[10]_i_1_n_6 ;
  wire \address_reg[10]_i_1_n_7 ;
  wire \address_reg[10]_i_1_n_8 ;
  wire \address_reg[10]_i_1_n_9 ;
  wire \address_reg[18]_i_1_n_0 ;
  wire \address_reg[18]_i_1_n_1 ;
  wire \address_reg[18]_i_1_n_10 ;
  wire \address_reg[18]_i_1_n_11 ;
  wire \address_reg[18]_i_1_n_12 ;
  wire \address_reg[18]_i_1_n_13 ;
  wire \address_reg[18]_i_1_n_14 ;
  wire \address_reg[18]_i_1_n_15 ;
  wire \address_reg[18]_i_1_n_2 ;
  wire \address_reg[18]_i_1_n_3 ;
  wire \address_reg[18]_i_1_n_4 ;
  wire \address_reg[18]_i_1_n_5 ;
  wire \address_reg[18]_i_1_n_6 ;
  wire \address_reg[18]_i_1_n_7 ;
  wire \address_reg[18]_i_1_n_8 ;
  wire \address_reg[18]_i_1_n_9 ;
  wire \address_reg[26]_i_1_n_0 ;
  wire \address_reg[26]_i_1_n_1 ;
  wire \address_reg[26]_i_1_n_10 ;
  wire \address_reg[26]_i_1_n_11 ;
  wire \address_reg[26]_i_1_n_12 ;
  wire \address_reg[26]_i_1_n_13 ;
  wire \address_reg[26]_i_1_n_14 ;
  wire \address_reg[26]_i_1_n_15 ;
  wire \address_reg[26]_i_1_n_2 ;
  wire \address_reg[26]_i_1_n_3 ;
  wire \address_reg[26]_i_1_n_4 ;
  wire \address_reg[26]_i_1_n_5 ;
  wire \address_reg[26]_i_1_n_6 ;
  wire \address_reg[26]_i_1_n_7 ;
  wire \address_reg[26]_i_1_n_8 ;
  wire \address_reg[26]_i_1_n_9 ;
  wire \address_reg[27]_i_2_n_15 ;
  wire bl_ready0__0;
  wire bl_ready_ag;
  wire bl_ready_i_1_n_0;
  wire [0:0]bl_ready_reg_0;
  wire enabled;
  wire enabled_i_1__0_n_0;
  wire enabled_i_2_n_0;
  wire enabled_reg_0;
  wire enabled_reg_1;
  wire enabled_reg_2;
  wire enabled_reg_3;
  wire enabled_reg_4;
  wire id0;
  wire \id[0]_i_1__0_n_0 ;
  wire \id[3]_i_2_n_0 ;
  wire \id_reg[0]_0 ;
  wire \id_reg[1]_0 ;
  wire \id_reg[2]_0 ;
  wire \id_reg[3]_0 ;
  wire [2:1]inc_id1_return;
  wire last;
  wire [3:0]last_burst_len;
  wire [0:0]\last_burst_len_reg[3]_0 ;
  wire \length[3]_i_1_n_0 ;
  wire m_src_axi_aclk;
  wire [27:0]m_src_axi_araddr;
  wire [3:0]m_src_axi_arlen;
  wire m_src_axi_arready;
  wire [31:0]out;
  wire p_0_in0;
  wire req_ready_ag;
  wire req_ready_i_1_n_0;
  wire [0:0]req_ready_reg_0;
  wire src_address_eot;
  wire src_enable;
  wire \zerodeep.m_axis_raddr0 ;
  wire [7:0]\NLW_address_reg[27]_i_2_CO_UNCONNECTED ;
  wire [7:1]\NLW_address_reg[27]_i_2_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hEC)) 
    \acked[1]_i_2 
       (.I0(bl_ready_ag),
        .I1(Q[1]),
        .I2(\zerodeep.m_axis_raddr0 ),
        .O(D));
  FDRE addr_valid_d1_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(addr_valid_reg_0),
        .Q(addr_valid_d1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAABFAA)) 
    addr_valid_i_1
       (.I0(addr_valid_reg_0),
        .I1(bl_ready_ag),
        .I2(src_address_eot),
        .I3(bl_ready0__0),
        .I4(req_ready_ag),
        .I5(addr_valid_i_3_n_0),
        .O(addr_valid_i_1_n_0));
  LUT4 #(
    .INIT(16'hBE00)) 
    addr_valid_i_2
       (.I0(addr_valid_i_4_n_0),
        .I1(addr_valid_reg_1[3]),
        .I2(\id_reg[3]_0 ),
        .I3(src_enable),
        .O(bl_ready0__0));
  LUT4 #(
    .INIT(16'hBAAA)) 
    addr_valid_i_3
       (.I0(req_ready_reg_0),
        .I1(req_ready_ag),
        .I2(addr_valid_reg_0),
        .I3(m_src_axi_arready),
        .O(addr_valid_i_3_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    addr_valid_i_4
       (.I0(\id_reg[0]_0 ),
        .I1(addr_valid_reg_1[0]),
        .I2(addr_valid_reg_1[2]),
        .I3(\id_reg[2]_0 ),
        .I4(addr_valid_reg_1[1]),
        .I5(\id_reg[1]_0 ),
        .O(addr_valid_i_4_n_0));
  FDRE addr_valid_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(addr_valid_i_1_n_0),
        .Q(addr_valid_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \address[0]_i_1 
       (.I0(out[4]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[0]),
        .O(\address[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_10 
       (.I0(out[7]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[3]),
        .O(\address[10]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_2 
       (.I0(out[8]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[4]),
        .O(\address[10]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_3 
       (.I0(out[14]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[10]),
        .O(\address[10]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_4 
       (.I0(out[13]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[9]),
        .O(\address[10]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_5 
       (.I0(out[12]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[8]),
        .O(\address[10]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_6 
       (.I0(out[11]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[7]),
        .O(\address[10]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_7 
       (.I0(out[10]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[6]),
        .O(\address[10]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[10]_i_8 
       (.I0(out[9]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[5]),
        .O(\address[10]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hC5)) 
    \address[10]_i_9 
       (.I0(m_src_axi_araddr[4]),
        .I1(out[8]),
        .I2(req_ready_ag),
        .O(\address[10]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_2 
       (.I0(out[22]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[18]),
        .O(\address[18]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_3 
       (.I0(out[21]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[17]),
        .O(\address[18]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_4 
       (.I0(out[20]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[16]),
        .O(\address[18]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_5 
       (.I0(out[19]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[15]),
        .O(\address[18]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_6 
       (.I0(out[18]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[14]),
        .O(\address[18]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_7 
       (.I0(out[17]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[13]),
        .O(\address[18]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_8 
       (.I0(out[16]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[12]),
        .O(\address[18]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[18]_i_9 
       (.I0(out[15]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[11]),
        .O(\address[18]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \address[1]_i_1 
       (.I0(out[5]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[1]),
        .O(\address[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_2 
       (.I0(out[30]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[26]),
        .O(\address[26]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_3 
       (.I0(out[29]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[25]),
        .O(\address[26]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_4 
       (.I0(out[28]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[24]),
        .O(\address[26]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_5 
       (.I0(out[27]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[23]),
        .O(\address[26]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_6 
       (.I0(out[26]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[22]),
        .O(\address[26]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_7 
       (.I0(out[25]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[21]),
        .O(\address[26]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_8 
       (.I0(out[24]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[20]),
        .O(\address[26]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[26]_i_9 
       (.I0(out[23]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[19]),
        .O(\address[26]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \address[27]_i_1 
       (.I0(req_ready_ag),
        .I1(m_src_axi_arready),
        .I2(addr_valid_reg_0),
        .O(\address[27]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[27]_i_3 
       (.I0(out[31]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[27]),
        .O(\address[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \address[2]_i_1 
       (.I0(out[6]),
        .I1(req_ready_ag),
        .I2(m_src_axi_araddr[2]),
        .O(\address[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address[0]_i_1_n_0 ),
        .Q(m_src_axi_araddr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[10] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_8 ),
        .Q(m_src_axi_araddr[10]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \address_reg[10]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\address_reg[10]_i_1_n_0 ,\address_reg[10]_i_1_n_1 ,\address_reg[10]_i_1_n_2 ,\address_reg[10]_i_1_n_3 ,\address_reg[10]_i_1_n_4 ,\address_reg[10]_i_1_n_5 ,\address_reg[10]_i_1_n_6 ,\address_reg[10]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\address[10]_i_2_n_0 ,1'b0}),
        .O({\address_reg[10]_i_1_n_8 ,\address_reg[10]_i_1_n_9 ,\address_reg[10]_i_1_n_10 ,\address_reg[10]_i_1_n_11 ,\address_reg[10]_i_1_n_12 ,\address_reg[10]_i_1_n_13 ,\address_reg[10]_i_1_n_14 ,\address_reg[10]_i_1_n_15 }),
        .S({\address[10]_i_3_n_0 ,\address[10]_i_4_n_0 ,\address[10]_i_5_n_0 ,\address[10]_i_6_n_0 ,\address[10]_i_7_n_0 ,\address[10]_i_8_n_0 ,\address[10]_i_9_n_0 ,\address[10]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[11] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_15 ),
        .Q(m_src_axi_araddr[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[12] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_14 ),
        .Q(m_src_axi_araddr[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[13] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_13 ),
        .Q(m_src_axi_araddr[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[14] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_12 ),
        .Q(m_src_axi_araddr[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[15] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_11 ),
        .Q(m_src_axi_araddr[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[16] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_10 ),
        .Q(m_src_axi_araddr[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[17] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_9 ),
        .Q(m_src_axi_araddr[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[18] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[18]_i_1_n_8 ),
        .Q(m_src_axi_araddr[18]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \address_reg[18]_i_1 
       (.CI(\address_reg[10]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\address_reg[18]_i_1_n_0 ,\address_reg[18]_i_1_n_1 ,\address_reg[18]_i_1_n_2 ,\address_reg[18]_i_1_n_3 ,\address_reg[18]_i_1_n_4 ,\address_reg[18]_i_1_n_5 ,\address_reg[18]_i_1_n_6 ,\address_reg[18]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\address_reg[18]_i_1_n_8 ,\address_reg[18]_i_1_n_9 ,\address_reg[18]_i_1_n_10 ,\address_reg[18]_i_1_n_11 ,\address_reg[18]_i_1_n_12 ,\address_reg[18]_i_1_n_13 ,\address_reg[18]_i_1_n_14 ,\address_reg[18]_i_1_n_15 }),
        .S({\address[18]_i_2_n_0 ,\address[18]_i_3_n_0 ,\address[18]_i_4_n_0 ,\address[18]_i_5_n_0 ,\address[18]_i_6_n_0 ,\address[18]_i_7_n_0 ,\address[18]_i_8_n_0 ,\address[18]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[19] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_15 ),
        .Q(m_src_axi_araddr[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address[1]_i_1_n_0 ),
        .Q(m_src_axi_araddr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[20] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_14 ),
        .Q(m_src_axi_araddr[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[21] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_13 ),
        .Q(m_src_axi_araddr[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[22] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_12 ),
        .Q(m_src_axi_araddr[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[23] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_11 ),
        .Q(m_src_axi_araddr[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[24] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_10 ),
        .Q(m_src_axi_araddr[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[25] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_9 ),
        .Q(m_src_axi_araddr[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[26] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[26]_i_1_n_8 ),
        .Q(m_src_axi_araddr[26]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \address_reg[26]_i_1 
       (.CI(\address_reg[18]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\address_reg[26]_i_1_n_0 ,\address_reg[26]_i_1_n_1 ,\address_reg[26]_i_1_n_2 ,\address_reg[26]_i_1_n_3 ,\address_reg[26]_i_1_n_4 ,\address_reg[26]_i_1_n_5 ,\address_reg[26]_i_1_n_6 ,\address_reg[26]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\address_reg[26]_i_1_n_8 ,\address_reg[26]_i_1_n_9 ,\address_reg[26]_i_1_n_10 ,\address_reg[26]_i_1_n_11 ,\address_reg[26]_i_1_n_12 ,\address_reg[26]_i_1_n_13 ,\address_reg[26]_i_1_n_14 ,\address_reg[26]_i_1_n_15 }),
        .S({\address[26]_i_2_n_0 ,\address[26]_i_3_n_0 ,\address[26]_i_4_n_0 ,\address[26]_i_5_n_0 ,\address[26]_i_6_n_0 ,\address[26]_i_7_n_0 ,\address[26]_i_8_n_0 ,\address[26]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[27] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[27]_i_2_n_15 ),
        .Q(m_src_axi_araddr[27]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "16" *) 
  CARRY8 \address_reg[27]_i_2 
       (.CI(\address_reg[26]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO(\NLW_address_reg[27]_i_2_CO_UNCONNECTED [7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_address_reg[27]_i_2_O_UNCONNECTED [7:1],\address_reg[27]_i_2_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\address[27]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address[2]_i_1_n_0 ),
        .Q(m_src_axi_araddr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_15 ),
        .Q(m_src_axi_araddr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_14 ),
        .Q(m_src_axi_araddr[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_13 ),
        .Q(m_src_axi_araddr[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_12 ),
        .Q(m_src_axi_araddr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_11 ),
        .Q(m_src_axi_araddr[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[8] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_10 ),
        .Q(m_src_axi_araddr[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[9] 
       (.C(m_src_axi_aclk),
        .CE(\address[27]_i_1_n_0 ),
        .D(\address_reg[10]_i_1_n_9 ),
        .Q(m_src_axi_araddr[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB0BFB0B0B0B0B0B0)) 
    bl_ready_i_1
       (.I0(Q[1]),
        .I1(\zerodeep.m_axis_raddr0 ),
        .I2(bl_ready_ag),
        .I3(addr_valid_reg_0),
        .I4(bl_ready0__0),
        .I5(src_address_eot),
        .O(bl_ready_i_1_n_0));
  FDSE bl_ready_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(bl_ready_i_1_n_0),
        .Q(bl_ready_ag),
        .S(req_ready_reg_0));
  LUT3 #(
    .INIT(8'hEA)) 
    enabled_i_1__0
       (.I0(src_enable),
        .I1(addr_valid_reg_0),
        .I2(address_enabled),
        .O(enabled_i_1__0_n_0));
  LUT5 #(
    .INIT(32'hBFFBAAAA)) 
    enabled_i_1__1
       (.I0(address_enabled),
        .I1(enabled_i_2_n_0),
        .I2(\id_reg[3]_0 ),
        .I3(enabled_reg_4),
        .I4(enabled),
        .O(enabled_reg_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    enabled_i_2
       (.I0(enabled_reg_1),
        .I1(\id_reg[0]_0 ),
        .I2(\id_reg[2]_0 ),
        .I3(enabled_reg_2),
        .I4(\id_reg[1]_0 ),
        .I5(enabled_reg_3),
        .O(enabled_i_2_n_0));
  FDRE enabled_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(enabled_i_1__0_n_0),
        .Q(address_enabled),
        .R(req_ready_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \id[0]_i_1__0 
       (.I0(\id_reg[1]_0 ),
        .I1(\id_reg[3]_0 ),
        .I2(\id_reg[2]_0 ),
        .O(\id[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \id[1]_i_1__2 
       (.I0(\id_reg[2]_0 ),
        .I1(\id_reg[3]_0 ),
        .I2(\id_reg[1]_0 ),
        .I3(\id_reg[0]_0 ),
        .O(inc_id1_return[1]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \id[2]_i_1__2 
       (.I0(\id_reg[3]_0 ),
        .I1(\id_reg[0]_0 ),
        .I2(\id_reg[2]_0 ),
        .I3(\id_reg[1]_0 ),
        .O(inc_id1_return[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \id[3]_i_1 
       (.I0(addr_valid_reg_0),
        .I1(addr_valid_d1),
        .O(id0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \id[3]_i_2 
       (.I0(\id_reg[1]_0 ),
        .I1(\id_reg[2]_0 ),
        .I2(\id_reg[0]_0 ),
        .I3(\id_reg[3]_0 ),
        .O(\id[3]_i_2_n_0 ));
  FDRE \id_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(id0),
        .D(\id[0]_i_1__0_n_0 ),
        .Q(\id_reg[0]_0 ),
        .R(req_ready_reg_0));
  FDRE \id_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(id0),
        .D(inc_id1_return[1]),
        .Q(\id_reg[1]_0 ),
        .R(req_ready_reg_0));
  FDRE \id_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(id0),
        .D(inc_id1_return[2]),
        .Q(\id_reg[2]_0 ),
        .R(req_ready_reg_0));
  FDRE \id_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(id0),
        .D(\id[3]_i_2_n_0 ),
        .Q(\id_reg[3]_0 ),
        .R(req_ready_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \last_beat_bytes[2]_i_1 
       (.I0(bl_ready_ag),
        .I1(Q[1]),
        .I2(\zerodeep.m_axis_raddr0 ),
        .O(bl_ready_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \last_burst_len_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(\last_burst_len_reg[3]_0 ),
        .D(out[0]),
        .Q(last_burst_len[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \last_burst_len_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(\last_burst_len_reg[3]_0 ),
        .D(out[1]),
        .Q(last_burst_len[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \last_burst_len_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(\last_burst_len_reg[3]_0 ),
        .D(out[2]),
        .Q(last_burst_len[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \last_burst_len_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(\last_burst_len_reg[3]_0 ),
        .D(out[3]),
        .Q(last_burst_len[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    last_reg
       (.C(m_src_axi_aclk),
        .CE(p_0_in0),
        .D(src_address_eot),
        .Q(last),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \length[3]_i_1 
       (.I0(src_address_eot),
        .I1(addr_valid_reg_0),
        .O(\length[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \length[3]_i_2 
       (.I0(addr_valid_reg_0),
        .O(p_0_in0));
  FDSE #(
    .INIT(1'b0)) 
    \length_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(p_0_in0),
        .D(last_burst_len[0]),
        .Q(m_src_axi_arlen[0]),
        .S(\length[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \length_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(p_0_in0),
        .D(last_burst_len[1]),
        .Q(m_src_axi_arlen[1]),
        .S(\length[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \length_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(p_0_in0),
        .D(last_burst_len[2]),
        .Q(m_src_axi_arlen[2]),
        .S(\length[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \length_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(p_0_in0),
        .D(last_burst_len[3]),
        .Q(m_src_axi_arlen[3]),
        .S(\length[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBF0BB00BB00BB00)) 
    req_ready_i_1
       (.I0(Q[0]),
        .I1(\zerodeep.m_axis_raddr0 ),
        .I2(last),
        .I3(req_ready_ag),
        .I4(m_src_axi_arready),
        .I5(addr_valid_reg_0),
        .O(req_ready_i_1_n_0));
  FDSE req_ready_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(req_ready_i_1_n_0),
        .Q(req_ready_ag),
        .S(req_ready_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'hA8A8A800)) 
    src_req_islast_cur_i_1
       (.I0(\zerodeep.m_axis_raddr0 ),
        .I1(bl_ready_ag),
        .I2(Q[1]),
        .I3(req_ready_ag),
        .I4(Q[0]),
        .O(E));
endmodule

(* ALLOW_ASYM_MEM = "1" *) (* ASYNC_CLK_DEST_REQ = "1'b1" *) (* ASYNC_CLK_DEST_SG = "1'b1" *) 
(* ASYNC_CLK_REQ_SG = "1'b1" *) (* ASYNC_CLK_REQ_SRC = "1'b1" *) (* ASYNC_CLK_SRC_DEST = "1'b1" *) 
(* ASYNC_CLK_SRC_SG = "1'b1" *) (* AUTORUN = "1'b0" *) (* AUTORUN_DEST_ADDR = "0" *) 
(* AUTORUN_DEST_STRIDE = "0" *) (* AUTORUN_FLAGS = "0" *) (* AUTORUN_FRAMELOCK_CONFIG = "0" *) 
(* AUTORUN_FRAMELOCK_STRIDE = "0" *) (* AUTORUN_SG_ADDRESS = "0" *) (* AUTORUN_SRC_ADDR = "0" *) 
(* AUTORUN_SRC_STRIDE = "0" *) (* AUTORUN_X_LENGTH = "0" *) (* AUTORUN_Y_LENGTH = "0" *) 
(* AXIS_TUSER_SYNC = "1'b1" *) (* AXI_AXCACHE = "4'b1111" *) (* AXI_AXPROT = "3'b010" *) 
(* AXI_ID_WIDTH_DEST = "1" *) (* AXI_ID_WIDTH_SG = "1" *) (* AXI_ID_WIDTH_SRC = "1" *) 
(* AXI_SLICE_DEST = "1'b0" *) (* AXI_SLICE_SRC = "1'b0" *) (* BEATS_PER_BURST_LIMIT_DEST = "1024" *) 
(* BEATS_PER_BURST_LIMIT_SRC = "256" *) (* BYTES_PER_BEAT_WIDTH_DEST = "2" *) (* BYTES_PER_BEAT_WIDTH_SG = "3" *) 
(* BYTES_PER_BEAT_WIDTH_SRC = "3" *) (* BYTES_PER_BURST_LIMIT = "2048" *) (* BYTES_PER_BURST_LIMIT_DEST = "4096" *) 
(* BYTES_PER_BURST_LIMIT_SRC = "2048" *) (* BYTES_PER_BURST_WIDTH = "7" *) (* CACHE_COHERENT = "1'b1" *) 
(* CYCLIC = "1'b1" *) (* DBG_ID_PADDING = "4" *) (* DISABLE_DEBUG_REGISTERS = "1'b0" *) 
(* DMA_2D_TLAST_MODE = "0" *) (* DMA_2D_TRANSFER = "1'b0" *) (* DMA_AXIS_DEST_W = "4" *) 
(* DMA_AXIS_ID_W = "8" *) (* DMA_AXI_ADDR_WIDTH = "31" *) (* DMA_AXI_PROTOCOL_DEST = "0" *) 
(* DMA_AXI_PROTOCOL_SG = "0" *) (* DMA_AXI_PROTOCOL_SRC = "0" *) (* DMA_DATA_WIDTH_DEST = "32" *) 
(* DMA_DATA_WIDTH_SG = "64" *) (* DMA_DATA_WIDTH_SRC = "64" *) (* DMA_LENGTH_ALIGN = "2" *) 
(* DMA_LENGTH_ALIGN_DEST = "2" *) (* DMA_LENGTH_ALIGN_SRC = "0" *) (* DMA_LENGTH_WIDTH = "24" *) 
(* DMA_SG_TRANSFER = "1'b0" *) (* DMA_TYPE_AXI_MM = "0" *) (* DMA_TYPE_AXI_STREAM = "1" *) 
(* DMA_TYPE_DEST = "1" *) (* DMA_TYPE_FIFO = "2" *) (* DMA_TYPE_SRC = "0" *) 
(* ENABLE_DIAGNOSTICS_IF = "1'b0" *) (* FIFO_SIZE = "8" *) (* FRAMELOCK = "1'b0" *) 
(* FRAMELOCK_MODE = "1'b1" *) (* HAS_DEST_ADDR = "1'b0" *) (* HAS_SRC_ADDR = "1'b1" *) 
(* ID = "0" *) (* ID_WIDTH = "4" *) (* MAX_BYTES_PER_BURST = "128" *) 
(* MAX_NUM_FRAMES_WIDTH = "3" *) (* REAL_MAX_BYTES_PER_BURST = "128" *) (* SYNC_TRANSFER_START = "1'b0" *) 
(* USE_EXT_SYNC = "1'b0" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awready,
    s_axi_awprot,
    s_axi_wvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wready,
    s_axi_bvalid,
    s_axi_bresp,
    s_axi_bready,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_arready,
    s_axi_arprot,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rdata,
    irq,
    sync,
    m_dest_axi_aclk,
    m_dest_axi_aresetn,
    m_dest_axi_awaddr,
    m_dest_axi_awlen,
    m_dest_axi_awsize,
    m_dest_axi_awburst,
    m_dest_axi_awprot,
    m_dest_axi_awcache,
    m_dest_axi_awvalid,
    m_dest_axi_awready,
    m_dest_axi_awid,
    m_dest_axi_awlock,
    m_dest_axi_wdata,
    m_dest_axi_wstrb,
    m_dest_axi_wready,
    m_dest_axi_wvalid,
    m_dest_axi_wlast,
    m_dest_axi_wid,
    m_dest_axi_bvalid,
    m_dest_axi_bresp,
    m_dest_axi_bready,
    m_dest_axi_bid,
    m_dest_axi_arvalid,
    m_dest_axi_araddr,
    m_dest_axi_arlen,
    m_dest_axi_arsize,
    m_dest_axi_arburst,
    m_dest_axi_arcache,
    m_dest_axi_arprot,
    m_dest_axi_arready,
    m_dest_axi_rvalid,
    m_dest_axi_rresp,
    m_dest_axi_rdata,
    m_dest_axi_rready,
    m_dest_axi_arid,
    m_dest_axi_arlock,
    m_dest_axi_rid,
    m_dest_axi_rlast,
    m_src_axi_aclk,
    m_src_axi_aresetn,
    m_src_axi_arready,
    m_src_axi_arvalid,
    m_src_axi_araddr,
    m_src_axi_arlen,
    m_src_axi_arsize,
    m_src_axi_arburst,
    m_src_axi_arprot,
    m_src_axi_arcache,
    m_src_axi_arid,
    m_src_axi_arlock,
    m_src_axi_rdata,
    m_src_axi_rready,
    m_src_axi_rvalid,
    m_src_axi_rresp,
    m_src_axi_rid,
    m_src_axi_rlast,
    m_src_axi_awvalid,
    m_src_axi_awaddr,
    m_src_axi_awlen,
    m_src_axi_awsize,
    m_src_axi_awburst,
    m_src_axi_awcache,
    m_src_axi_awprot,
    m_src_axi_awready,
    m_src_axi_wvalid,
    m_src_axi_wdata,
    m_src_axi_wstrb,
    m_src_axi_wlast,
    m_src_axi_wready,
    m_src_axi_bvalid,
    m_src_axi_bresp,
    m_src_axi_bready,
    m_src_axi_awid,
    m_src_axi_awlock,
    m_src_axi_wid,
    m_src_axi_bid,
    m_sg_axi_aclk,
    m_sg_axi_aresetn,
    m_sg_axi_arready,
    m_sg_axi_arvalid,
    m_sg_axi_araddr,
    m_sg_axi_arlen,
    m_sg_axi_arsize,
    m_sg_axi_arburst,
    m_sg_axi_arprot,
    m_sg_axi_arcache,
    m_sg_axi_arid,
    m_sg_axi_arlock,
    m_sg_axi_rdata,
    m_sg_axi_rready,
    m_sg_axi_rvalid,
    m_sg_axi_rresp,
    m_sg_axi_rid,
    m_sg_axi_rlast,
    m_sg_axi_awvalid,
    m_sg_axi_awaddr,
    m_sg_axi_awlen,
    m_sg_axi_awsize,
    m_sg_axi_awburst,
    m_sg_axi_awcache,
    m_sg_axi_awprot,
    m_sg_axi_awready,
    m_sg_axi_wvalid,
    m_sg_axi_wdata,
    m_sg_axi_wstrb,
    m_sg_axi_wlast,
    m_sg_axi_wready,
    m_sg_axi_bvalid,
    m_sg_axi_bresp,
    m_sg_axi_bready,
    m_sg_axi_awid,
    m_sg_axi_awlock,
    m_sg_axi_wid,
    m_sg_axi_bid,
    s_axis_aclk,
    s_axis_ready,
    s_axis_valid,
    s_axis_data,
    s_axis_strb,
    s_axis_keep,
    s_axis_user,
    s_axis_id,
    s_axis_dest,
    s_axis_last,
    s_axis_xfer_req,
    m_axis_aclk,
    m_axis_ready,
    m_axis_valid,
    m_axis_data,
    m_axis_strb,
    m_axis_keep,
    m_axis_user,
    m_axis_id,
    m_axis_dest,
    m_axis_last,
    m_axis_xfer_req,
    fifo_wr_clk,
    fifo_wr_en,
    fifo_wr_din,
    fifo_wr_overflow,
    fifo_wr_xfer_req,
    fifo_rd_clk,
    fifo_rd_en,
    fifo_rd_valid,
    fifo_rd_dout,
    fifo_rd_underflow,
    fifo_rd_xfer_req,
    m_frame_in,
    m_frame_in_valid,
    m_frame_out,
    m_frame_out_valid,
    s_frame_in,
    s_frame_in_valid,
    s_frame_out,
    s_frame_out_valid,
    src_ext_sync,
    dest_ext_sync,
    dest_diag_level_bursts);
  input s_axi_aclk;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input [10:0]s_axi_awaddr;
  output s_axi_awready;
  input [2:0]s_axi_awprot;
  input s_axi_wvalid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  output s_axi_wready;
  output s_axi_bvalid;
  output [1:0]s_axi_bresp;
  input s_axi_bready;
  input s_axi_arvalid;
  input [10:0]s_axi_araddr;
  output s_axi_arready;
  input [2:0]s_axi_arprot;
  output s_axi_rvalid;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output [31:0]s_axi_rdata;
  output irq;
  input sync;
  input m_dest_axi_aclk;
  input m_dest_axi_aresetn;
  output [30:0]m_dest_axi_awaddr;
  output [7:0]m_dest_axi_awlen;
  output [2:0]m_dest_axi_awsize;
  output [1:0]m_dest_axi_awburst;
  output [2:0]m_dest_axi_awprot;
  output [3:0]m_dest_axi_awcache;
  output m_dest_axi_awvalid;
  input m_dest_axi_awready;
  output [0:0]m_dest_axi_awid;
  output [0:0]m_dest_axi_awlock;
  output [31:0]m_dest_axi_wdata;
  output [3:0]m_dest_axi_wstrb;
  input m_dest_axi_wready;
  output m_dest_axi_wvalid;
  output m_dest_axi_wlast;
  output [0:0]m_dest_axi_wid;
  input m_dest_axi_bvalid;
  input [1:0]m_dest_axi_bresp;
  output m_dest_axi_bready;
  input [0:0]m_dest_axi_bid;
  output m_dest_axi_arvalid;
  output [30:0]m_dest_axi_araddr;
  output [7:0]m_dest_axi_arlen;
  output [2:0]m_dest_axi_arsize;
  output [1:0]m_dest_axi_arburst;
  output [3:0]m_dest_axi_arcache;
  output [2:0]m_dest_axi_arprot;
  input m_dest_axi_arready;
  input m_dest_axi_rvalid;
  input [1:0]m_dest_axi_rresp;
  input [31:0]m_dest_axi_rdata;
  output m_dest_axi_rready;
  output [0:0]m_dest_axi_arid;
  output [0:0]m_dest_axi_arlock;
  input [0:0]m_dest_axi_rid;
  input m_dest_axi_rlast;
  input m_src_axi_aclk;
  input m_src_axi_aresetn;
  input m_src_axi_arready;
  output m_src_axi_arvalid;
  output [30:0]m_src_axi_araddr;
  output [7:0]m_src_axi_arlen;
  output [2:0]m_src_axi_arsize;
  output [1:0]m_src_axi_arburst;
  output [2:0]m_src_axi_arprot;
  output [3:0]m_src_axi_arcache;
  output [0:0]m_src_axi_arid;
  output [0:0]m_src_axi_arlock;
  input [63:0]m_src_axi_rdata;
  output m_src_axi_rready;
  input m_src_axi_rvalid;
  input [1:0]m_src_axi_rresp;
  input [0:0]m_src_axi_rid;
  input m_src_axi_rlast;
  output m_src_axi_awvalid;
  output [30:0]m_src_axi_awaddr;
  output [7:0]m_src_axi_awlen;
  output [2:0]m_src_axi_awsize;
  output [1:0]m_src_axi_awburst;
  output [3:0]m_src_axi_awcache;
  output [2:0]m_src_axi_awprot;
  input m_src_axi_awready;
  output m_src_axi_wvalid;
  output [63:0]m_src_axi_wdata;
  output [7:0]m_src_axi_wstrb;
  output m_src_axi_wlast;
  input m_src_axi_wready;
  input m_src_axi_bvalid;
  input [1:0]m_src_axi_bresp;
  output m_src_axi_bready;
  output [0:0]m_src_axi_awid;
  output [0:0]m_src_axi_awlock;
  output [0:0]m_src_axi_wid;
  input [0:0]m_src_axi_bid;
  input m_sg_axi_aclk;
  input m_sg_axi_aresetn;
  input m_sg_axi_arready;
  output m_sg_axi_arvalid;
  output [30:0]m_sg_axi_araddr;
  output [7:0]m_sg_axi_arlen;
  output [2:0]m_sg_axi_arsize;
  output [1:0]m_sg_axi_arburst;
  output [2:0]m_sg_axi_arprot;
  output [3:0]m_sg_axi_arcache;
  output [0:0]m_sg_axi_arid;
  output [0:0]m_sg_axi_arlock;
  input [63:0]m_sg_axi_rdata;
  output m_sg_axi_rready;
  input m_sg_axi_rvalid;
  input [1:0]m_sg_axi_rresp;
  input [0:0]m_sg_axi_rid;
  input m_sg_axi_rlast;
  output m_sg_axi_awvalid;
  output [30:0]m_sg_axi_awaddr;
  output [7:0]m_sg_axi_awlen;
  output [2:0]m_sg_axi_awsize;
  output [1:0]m_sg_axi_awburst;
  output [3:0]m_sg_axi_awcache;
  output [2:0]m_sg_axi_awprot;
  input m_sg_axi_awready;
  output m_sg_axi_wvalid;
  output [63:0]m_sg_axi_wdata;
  output [7:0]m_sg_axi_wstrb;
  output m_sg_axi_wlast;
  input m_sg_axi_wready;
  input m_sg_axi_bvalid;
  input [1:0]m_sg_axi_bresp;
  output m_sg_axi_bready;
  output [0:0]m_sg_axi_awid;
  output [0:0]m_sg_axi_awlock;
  output [0:0]m_sg_axi_wid;
  input [0:0]m_sg_axi_bid;
  input s_axis_aclk;
  output s_axis_ready;
  input s_axis_valid;
  input [63:0]s_axis_data;
  input [7:0]s_axis_strb;
  input [7:0]s_axis_keep;
  input [0:0]s_axis_user;
  input [7:0]s_axis_id;
  input [3:0]s_axis_dest;
  input s_axis_last;
  output s_axis_xfer_req;
  input m_axis_aclk;
  input m_axis_ready;
  output m_axis_valid;
  output [31:0]m_axis_data;
  output [3:0]m_axis_strb;
  output [3:0]m_axis_keep;
  output [0:0]m_axis_user;
  output [7:0]m_axis_id;
  output [3:0]m_axis_dest;
  output m_axis_last;
  output m_axis_xfer_req;
  input fifo_wr_clk;
  input fifo_wr_en;
  input [63:0]fifo_wr_din;
  output fifo_wr_overflow;
  output fifo_wr_xfer_req;
  input fifo_rd_clk;
  input fifo_rd_en;
  output fifo_rd_valid;
  output [31:0]fifo_rd_dout;
  output fifo_rd_underflow;
  output fifo_rd_xfer_req;
  input [2:0]m_frame_in;
  input m_frame_in_valid;
  output [2:0]m_frame_out;
  output m_frame_out_valid;
  input [2:0]s_frame_in;
  input s_frame_in_valid;
  output [2:0]s_frame_out;
  output s_frame_out_valid;
  input src_ext_sync;
  input dest_ext_sync;
  output [7:0]dest_diag_level_bursts;

  wire \<const0> ;
  wire ctrl_enable;
  wire ctrl_pause;
  wire [19:2]dbg_ids0;
  wire [3:2]dbg_ids1;
  wire [11:2]dbg_status;
  wire dma_req_eot;
  wire i_regmap_n_1;
  wire i_regmap_n_76;
  wire i_regmap_n_77;
  wire [2:2]\i_regmap_request/p_3_in ;
  wire \i_regmap_request/p_7_in ;
  wire \i_regmap_request/up_bl_partial ;
  wire i_transfer_n_32;
  wire i_transfer_n_38;
  wire i_transfer_n_39;
  wire i_transfer_n_47;
  wire i_transfer_n_48;
  wire i_transfer_n_49;
  wire i_transfer_n_50;
  wire i_transfer_n_51;
  wire i_transfer_n_52;
  wire i_transfer_n_53;
  wire i_transfer_n_54;
  wire i_transfer_n_55;
  wire i_transfer_n_56;
  wire i_transfer_n_57;
  wire i_transfer_n_58;
  wire i_transfer_n_97;
  wire i_transfer_n_98;
  wire irq;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_last;
  wire m_axis_ready;
  wire [0:0]m_axis_user;
  wire m_axis_valid;
  wire m_axis_xfer_req;
  wire m_src_axi_aclk;
  wire [30:3]\^m_src_axi_araddr ;
  wire [3:0]\^m_src_axi_arlen ;
  wire m_src_axi_arready;
  wire m_src_axi_arvalid;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire s_axi_aclk;
  wire [10:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [10:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire up_dma_req_cyclic;
  wire [30:2]up_dma_req_dest_address;
  wire up_dma_req_last;
  wire [30:3]up_dma_req_src_address;
  wire up_dma_req_valid;
  wire [23:2]up_dma_req_x_length;
  wire up_eot;
  wire [6:0]up_req_measured_burst_length;
  wire up_response_ready;
  wire up_response_valid;
  wire up_sot;

  assign dest_diag_level_bursts[7] = \<const0> ;
  assign dest_diag_level_bursts[6] = \<const0> ;
  assign dest_diag_level_bursts[5] = \<const0> ;
  assign dest_diag_level_bursts[4] = \<const0> ;
  assign dest_diag_level_bursts[3] = \<const0> ;
  assign dest_diag_level_bursts[2] = \<const0> ;
  assign dest_diag_level_bursts[1] = \<const0> ;
  assign dest_diag_level_bursts[0] = \<const0> ;
  assign fifo_rd_dout[31] = \<const0> ;
  assign fifo_rd_dout[30] = \<const0> ;
  assign fifo_rd_dout[29] = \<const0> ;
  assign fifo_rd_dout[28] = \<const0> ;
  assign fifo_rd_dout[27] = \<const0> ;
  assign fifo_rd_dout[26] = \<const0> ;
  assign fifo_rd_dout[25] = \<const0> ;
  assign fifo_rd_dout[24] = \<const0> ;
  assign fifo_rd_dout[23] = \<const0> ;
  assign fifo_rd_dout[22] = \<const0> ;
  assign fifo_rd_dout[21] = \<const0> ;
  assign fifo_rd_dout[20] = \<const0> ;
  assign fifo_rd_dout[19] = \<const0> ;
  assign fifo_rd_dout[18] = \<const0> ;
  assign fifo_rd_dout[17] = \<const0> ;
  assign fifo_rd_dout[16] = \<const0> ;
  assign fifo_rd_dout[15] = \<const0> ;
  assign fifo_rd_dout[14] = \<const0> ;
  assign fifo_rd_dout[13] = \<const0> ;
  assign fifo_rd_dout[12] = \<const0> ;
  assign fifo_rd_dout[11] = \<const0> ;
  assign fifo_rd_dout[10] = \<const0> ;
  assign fifo_rd_dout[9] = \<const0> ;
  assign fifo_rd_dout[8] = \<const0> ;
  assign fifo_rd_dout[7] = \<const0> ;
  assign fifo_rd_dout[6] = \<const0> ;
  assign fifo_rd_dout[5] = \<const0> ;
  assign fifo_rd_dout[4] = \<const0> ;
  assign fifo_rd_dout[3] = \<const0> ;
  assign fifo_rd_dout[2] = \<const0> ;
  assign fifo_rd_dout[1] = \<const0> ;
  assign fifo_rd_dout[0] = \<const0> ;
  assign fifo_rd_underflow = \<const0> ;
  assign fifo_rd_valid = \<const0> ;
  assign fifo_rd_xfer_req = \<const0> ;
  assign fifo_wr_overflow = \<const0> ;
  assign fifo_wr_xfer_req = \<const0> ;
  assign m_axis_dest[3] = \<const0> ;
  assign m_axis_dest[2] = \<const0> ;
  assign m_axis_dest[1] = \<const0> ;
  assign m_axis_dest[0] = \<const0> ;
  assign m_axis_id[7] = \<const0> ;
  assign m_axis_id[6] = \<const0> ;
  assign m_axis_id[5] = \<const0> ;
  assign m_axis_id[4] = \<const0> ;
  assign m_axis_id[3] = \<const0> ;
  assign m_axis_id[2] = \<const0> ;
  assign m_axis_id[1] = \<const0> ;
  assign m_axis_id[0] = \<const0> ;
  assign m_axis_keep[3] = \<const0> ;
  assign m_axis_keep[2] = \<const0> ;
  assign m_axis_keep[1] = \<const0> ;
  assign m_axis_keep[0] = \<const0> ;
  assign m_axis_strb[3] = \<const0> ;
  assign m_axis_strb[2] = \<const0> ;
  assign m_axis_strb[1] = \<const0> ;
  assign m_axis_strb[0] = \<const0> ;
  assign m_dest_axi_araddr[30] = \<const0> ;
  assign m_dest_axi_araddr[29] = \<const0> ;
  assign m_dest_axi_araddr[28] = \<const0> ;
  assign m_dest_axi_araddr[27] = \<const0> ;
  assign m_dest_axi_araddr[26] = \<const0> ;
  assign m_dest_axi_araddr[25] = \<const0> ;
  assign m_dest_axi_araddr[24] = \<const0> ;
  assign m_dest_axi_araddr[23] = \<const0> ;
  assign m_dest_axi_araddr[22] = \<const0> ;
  assign m_dest_axi_araddr[21] = \<const0> ;
  assign m_dest_axi_araddr[20] = \<const0> ;
  assign m_dest_axi_araddr[19] = \<const0> ;
  assign m_dest_axi_araddr[18] = \<const0> ;
  assign m_dest_axi_araddr[17] = \<const0> ;
  assign m_dest_axi_araddr[16] = \<const0> ;
  assign m_dest_axi_araddr[15] = \<const0> ;
  assign m_dest_axi_araddr[14] = \<const0> ;
  assign m_dest_axi_araddr[13] = \<const0> ;
  assign m_dest_axi_araddr[12] = \<const0> ;
  assign m_dest_axi_araddr[11] = \<const0> ;
  assign m_dest_axi_araddr[10] = \<const0> ;
  assign m_dest_axi_araddr[9] = \<const0> ;
  assign m_dest_axi_araddr[8] = \<const0> ;
  assign m_dest_axi_araddr[7] = \<const0> ;
  assign m_dest_axi_araddr[6] = \<const0> ;
  assign m_dest_axi_araddr[5] = \<const0> ;
  assign m_dest_axi_araddr[4] = \<const0> ;
  assign m_dest_axi_araddr[3] = \<const0> ;
  assign m_dest_axi_araddr[2] = \<const0> ;
  assign m_dest_axi_araddr[1] = \<const0> ;
  assign m_dest_axi_araddr[0] = \<const0> ;
  assign m_dest_axi_arburst[1] = \<const0> ;
  assign m_dest_axi_arburst[0] = \<const0> ;
  assign m_dest_axi_arcache[3] = \<const0> ;
  assign m_dest_axi_arcache[2] = \<const0> ;
  assign m_dest_axi_arcache[1] = \<const0> ;
  assign m_dest_axi_arcache[0] = \<const0> ;
  assign m_dest_axi_arid[0] = \<const0> ;
  assign m_dest_axi_arlen[7] = \<const0> ;
  assign m_dest_axi_arlen[6] = \<const0> ;
  assign m_dest_axi_arlen[5] = \<const0> ;
  assign m_dest_axi_arlen[4] = \<const0> ;
  assign m_dest_axi_arlen[3] = \<const0> ;
  assign m_dest_axi_arlen[2] = \<const0> ;
  assign m_dest_axi_arlen[1] = \<const0> ;
  assign m_dest_axi_arlen[0] = \<const0> ;
  assign m_dest_axi_arlock[0] = \<const0> ;
  assign m_dest_axi_arprot[2] = \<const0> ;
  assign m_dest_axi_arprot[1] = \<const0> ;
  assign m_dest_axi_arprot[0] = \<const0> ;
  assign m_dest_axi_arsize[2] = \<const0> ;
  assign m_dest_axi_arsize[1] = \<const0> ;
  assign m_dest_axi_arsize[0] = \<const0> ;
  assign m_dest_axi_arvalid = \<const0> ;
  assign m_dest_axi_awaddr[30] = \<const0> ;
  assign m_dest_axi_awaddr[29] = \<const0> ;
  assign m_dest_axi_awaddr[28] = \<const0> ;
  assign m_dest_axi_awaddr[27] = \<const0> ;
  assign m_dest_axi_awaddr[26] = \<const0> ;
  assign m_dest_axi_awaddr[25] = \<const0> ;
  assign m_dest_axi_awaddr[24] = \<const0> ;
  assign m_dest_axi_awaddr[23] = \<const0> ;
  assign m_dest_axi_awaddr[22] = \<const0> ;
  assign m_dest_axi_awaddr[21] = \<const0> ;
  assign m_dest_axi_awaddr[20] = \<const0> ;
  assign m_dest_axi_awaddr[19] = \<const0> ;
  assign m_dest_axi_awaddr[18] = \<const0> ;
  assign m_dest_axi_awaddr[17] = \<const0> ;
  assign m_dest_axi_awaddr[16] = \<const0> ;
  assign m_dest_axi_awaddr[15] = \<const0> ;
  assign m_dest_axi_awaddr[14] = \<const0> ;
  assign m_dest_axi_awaddr[13] = \<const0> ;
  assign m_dest_axi_awaddr[12] = \<const0> ;
  assign m_dest_axi_awaddr[11] = \<const0> ;
  assign m_dest_axi_awaddr[10] = \<const0> ;
  assign m_dest_axi_awaddr[9] = \<const0> ;
  assign m_dest_axi_awaddr[8] = \<const0> ;
  assign m_dest_axi_awaddr[7] = \<const0> ;
  assign m_dest_axi_awaddr[6] = \<const0> ;
  assign m_dest_axi_awaddr[5] = \<const0> ;
  assign m_dest_axi_awaddr[4] = \<const0> ;
  assign m_dest_axi_awaddr[3] = \<const0> ;
  assign m_dest_axi_awaddr[2] = \<const0> ;
  assign m_dest_axi_awaddr[1] = \<const0> ;
  assign m_dest_axi_awaddr[0] = \<const0> ;
  assign m_dest_axi_awburst[1] = \<const0> ;
  assign m_dest_axi_awburst[0] = \<const0> ;
  assign m_dest_axi_awcache[3] = \<const0> ;
  assign m_dest_axi_awcache[2] = \<const0> ;
  assign m_dest_axi_awcache[1] = \<const0> ;
  assign m_dest_axi_awcache[0] = \<const0> ;
  assign m_dest_axi_awid[0] = \<const0> ;
  assign m_dest_axi_awlen[7] = \<const0> ;
  assign m_dest_axi_awlen[6] = \<const0> ;
  assign m_dest_axi_awlen[5] = \<const0> ;
  assign m_dest_axi_awlen[4] = \<const0> ;
  assign m_dest_axi_awlen[3] = \<const0> ;
  assign m_dest_axi_awlen[2] = \<const0> ;
  assign m_dest_axi_awlen[1] = \<const0> ;
  assign m_dest_axi_awlen[0] = \<const0> ;
  assign m_dest_axi_awlock[0] = \<const0> ;
  assign m_dest_axi_awprot[2] = \<const0> ;
  assign m_dest_axi_awprot[1] = \<const0> ;
  assign m_dest_axi_awprot[0] = \<const0> ;
  assign m_dest_axi_awsize[2] = \<const0> ;
  assign m_dest_axi_awsize[1] = \<const0> ;
  assign m_dest_axi_awsize[0] = \<const0> ;
  assign m_dest_axi_awvalid = \<const0> ;
  assign m_dest_axi_bready = \<const0> ;
  assign m_dest_axi_rready = \<const0> ;
  assign m_dest_axi_wdata[31] = \<const0> ;
  assign m_dest_axi_wdata[30] = \<const0> ;
  assign m_dest_axi_wdata[29] = \<const0> ;
  assign m_dest_axi_wdata[28] = \<const0> ;
  assign m_dest_axi_wdata[27] = \<const0> ;
  assign m_dest_axi_wdata[26] = \<const0> ;
  assign m_dest_axi_wdata[25] = \<const0> ;
  assign m_dest_axi_wdata[24] = \<const0> ;
  assign m_dest_axi_wdata[23] = \<const0> ;
  assign m_dest_axi_wdata[22] = \<const0> ;
  assign m_dest_axi_wdata[21] = \<const0> ;
  assign m_dest_axi_wdata[20] = \<const0> ;
  assign m_dest_axi_wdata[19] = \<const0> ;
  assign m_dest_axi_wdata[18] = \<const0> ;
  assign m_dest_axi_wdata[17] = \<const0> ;
  assign m_dest_axi_wdata[16] = \<const0> ;
  assign m_dest_axi_wdata[15] = \<const0> ;
  assign m_dest_axi_wdata[14] = \<const0> ;
  assign m_dest_axi_wdata[13] = \<const0> ;
  assign m_dest_axi_wdata[12] = \<const0> ;
  assign m_dest_axi_wdata[11] = \<const0> ;
  assign m_dest_axi_wdata[10] = \<const0> ;
  assign m_dest_axi_wdata[9] = \<const0> ;
  assign m_dest_axi_wdata[8] = \<const0> ;
  assign m_dest_axi_wdata[7] = \<const0> ;
  assign m_dest_axi_wdata[6] = \<const0> ;
  assign m_dest_axi_wdata[5] = \<const0> ;
  assign m_dest_axi_wdata[4] = \<const0> ;
  assign m_dest_axi_wdata[3] = \<const0> ;
  assign m_dest_axi_wdata[2] = \<const0> ;
  assign m_dest_axi_wdata[1] = \<const0> ;
  assign m_dest_axi_wdata[0] = \<const0> ;
  assign m_dest_axi_wid[0] = \<const0> ;
  assign m_dest_axi_wlast = \<const0> ;
  assign m_dest_axi_wstrb[3] = \<const0> ;
  assign m_dest_axi_wstrb[2] = \<const0> ;
  assign m_dest_axi_wstrb[1] = \<const0> ;
  assign m_dest_axi_wstrb[0] = \<const0> ;
  assign m_dest_axi_wvalid = \<const0> ;
  assign m_frame_out[2] = \<const0> ;
  assign m_frame_out[1] = \<const0> ;
  assign m_frame_out[0] = \<const0> ;
  assign m_frame_out_valid = \<const0> ;
  assign m_sg_axi_araddr[30] = \<const0> ;
  assign m_sg_axi_araddr[29] = \<const0> ;
  assign m_sg_axi_araddr[28] = \<const0> ;
  assign m_sg_axi_araddr[27] = \<const0> ;
  assign m_sg_axi_araddr[26] = \<const0> ;
  assign m_sg_axi_araddr[25] = \<const0> ;
  assign m_sg_axi_araddr[24] = \<const0> ;
  assign m_sg_axi_araddr[23] = \<const0> ;
  assign m_sg_axi_araddr[22] = \<const0> ;
  assign m_sg_axi_araddr[21] = \<const0> ;
  assign m_sg_axi_araddr[20] = \<const0> ;
  assign m_sg_axi_araddr[19] = \<const0> ;
  assign m_sg_axi_araddr[18] = \<const0> ;
  assign m_sg_axi_araddr[17] = \<const0> ;
  assign m_sg_axi_araddr[16] = \<const0> ;
  assign m_sg_axi_araddr[15] = \<const0> ;
  assign m_sg_axi_araddr[14] = \<const0> ;
  assign m_sg_axi_araddr[13] = \<const0> ;
  assign m_sg_axi_araddr[12] = \<const0> ;
  assign m_sg_axi_araddr[11] = \<const0> ;
  assign m_sg_axi_araddr[10] = \<const0> ;
  assign m_sg_axi_araddr[9] = \<const0> ;
  assign m_sg_axi_araddr[8] = \<const0> ;
  assign m_sg_axi_araddr[7] = \<const0> ;
  assign m_sg_axi_araddr[6] = \<const0> ;
  assign m_sg_axi_araddr[5] = \<const0> ;
  assign m_sg_axi_araddr[4] = \<const0> ;
  assign m_sg_axi_araddr[3] = \<const0> ;
  assign m_sg_axi_araddr[2] = \<const0> ;
  assign m_sg_axi_araddr[1] = \<const0> ;
  assign m_sg_axi_araddr[0] = \<const0> ;
  assign m_sg_axi_arburst[1] = \<const0> ;
  assign m_sg_axi_arburst[0] = \<const0> ;
  assign m_sg_axi_arcache[3] = \<const0> ;
  assign m_sg_axi_arcache[2] = \<const0> ;
  assign m_sg_axi_arcache[1] = \<const0> ;
  assign m_sg_axi_arcache[0] = \<const0> ;
  assign m_sg_axi_arid[0] = \<const0> ;
  assign m_sg_axi_arlen[7] = \<const0> ;
  assign m_sg_axi_arlen[6] = \<const0> ;
  assign m_sg_axi_arlen[5] = \<const0> ;
  assign m_sg_axi_arlen[4] = \<const0> ;
  assign m_sg_axi_arlen[3] = \<const0> ;
  assign m_sg_axi_arlen[2] = \<const0> ;
  assign m_sg_axi_arlen[1] = \<const0> ;
  assign m_sg_axi_arlen[0] = \<const0> ;
  assign m_sg_axi_arlock[0] = \<const0> ;
  assign m_sg_axi_arprot[2] = \<const0> ;
  assign m_sg_axi_arprot[1] = \<const0> ;
  assign m_sg_axi_arprot[0] = \<const0> ;
  assign m_sg_axi_arsize[2] = \<const0> ;
  assign m_sg_axi_arsize[1] = \<const0> ;
  assign m_sg_axi_arsize[0] = \<const0> ;
  assign m_sg_axi_arvalid = \<const0> ;
  assign m_sg_axi_awaddr[30] = \<const0> ;
  assign m_sg_axi_awaddr[29] = \<const0> ;
  assign m_sg_axi_awaddr[28] = \<const0> ;
  assign m_sg_axi_awaddr[27] = \<const0> ;
  assign m_sg_axi_awaddr[26] = \<const0> ;
  assign m_sg_axi_awaddr[25] = \<const0> ;
  assign m_sg_axi_awaddr[24] = \<const0> ;
  assign m_sg_axi_awaddr[23] = \<const0> ;
  assign m_sg_axi_awaddr[22] = \<const0> ;
  assign m_sg_axi_awaddr[21] = \<const0> ;
  assign m_sg_axi_awaddr[20] = \<const0> ;
  assign m_sg_axi_awaddr[19] = \<const0> ;
  assign m_sg_axi_awaddr[18] = \<const0> ;
  assign m_sg_axi_awaddr[17] = \<const0> ;
  assign m_sg_axi_awaddr[16] = \<const0> ;
  assign m_sg_axi_awaddr[15] = \<const0> ;
  assign m_sg_axi_awaddr[14] = \<const0> ;
  assign m_sg_axi_awaddr[13] = \<const0> ;
  assign m_sg_axi_awaddr[12] = \<const0> ;
  assign m_sg_axi_awaddr[11] = \<const0> ;
  assign m_sg_axi_awaddr[10] = \<const0> ;
  assign m_sg_axi_awaddr[9] = \<const0> ;
  assign m_sg_axi_awaddr[8] = \<const0> ;
  assign m_sg_axi_awaddr[7] = \<const0> ;
  assign m_sg_axi_awaddr[6] = \<const0> ;
  assign m_sg_axi_awaddr[5] = \<const0> ;
  assign m_sg_axi_awaddr[4] = \<const0> ;
  assign m_sg_axi_awaddr[3] = \<const0> ;
  assign m_sg_axi_awaddr[2] = \<const0> ;
  assign m_sg_axi_awaddr[1] = \<const0> ;
  assign m_sg_axi_awaddr[0] = \<const0> ;
  assign m_sg_axi_awburst[1] = \<const0> ;
  assign m_sg_axi_awburst[0] = \<const0> ;
  assign m_sg_axi_awcache[3] = \<const0> ;
  assign m_sg_axi_awcache[2] = \<const0> ;
  assign m_sg_axi_awcache[1] = \<const0> ;
  assign m_sg_axi_awcache[0] = \<const0> ;
  assign m_sg_axi_awid[0] = \<const0> ;
  assign m_sg_axi_awlen[7] = \<const0> ;
  assign m_sg_axi_awlen[6] = \<const0> ;
  assign m_sg_axi_awlen[5] = \<const0> ;
  assign m_sg_axi_awlen[4] = \<const0> ;
  assign m_sg_axi_awlen[3] = \<const0> ;
  assign m_sg_axi_awlen[2] = \<const0> ;
  assign m_sg_axi_awlen[1] = \<const0> ;
  assign m_sg_axi_awlen[0] = \<const0> ;
  assign m_sg_axi_awlock[0] = \<const0> ;
  assign m_sg_axi_awprot[2] = \<const0> ;
  assign m_sg_axi_awprot[1] = \<const0> ;
  assign m_sg_axi_awprot[0] = \<const0> ;
  assign m_sg_axi_awsize[2] = \<const0> ;
  assign m_sg_axi_awsize[1] = \<const0> ;
  assign m_sg_axi_awsize[0] = \<const0> ;
  assign m_sg_axi_awvalid = \<const0> ;
  assign m_sg_axi_bready = \<const0> ;
  assign m_sg_axi_rready = \<const0> ;
  assign m_sg_axi_wdata[63] = \<const0> ;
  assign m_sg_axi_wdata[62] = \<const0> ;
  assign m_sg_axi_wdata[61] = \<const0> ;
  assign m_sg_axi_wdata[60] = \<const0> ;
  assign m_sg_axi_wdata[59] = \<const0> ;
  assign m_sg_axi_wdata[58] = \<const0> ;
  assign m_sg_axi_wdata[57] = \<const0> ;
  assign m_sg_axi_wdata[56] = \<const0> ;
  assign m_sg_axi_wdata[55] = \<const0> ;
  assign m_sg_axi_wdata[54] = \<const0> ;
  assign m_sg_axi_wdata[53] = \<const0> ;
  assign m_sg_axi_wdata[52] = \<const0> ;
  assign m_sg_axi_wdata[51] = \<const0> ;
  assign m_sg_axi_wdata[50] = \<const0> ;
  assign m_sg_axi_wdata[49] = \<const0> ;
  assign m_sg_axi_wdata[48] = \<const0> ;
  assign m_sg_axi_wdata[47] = \<const0> ;
  assign m_sg_axi_wdata[46] = \<const0> ;
  assign m_sg_axi_wdata[45] = \<const0> ;
  assign m_sg_axi_wdata[44] = \<const0> ;
  assign m_sg_axi_wdata[43] = \<const0> ;
  assign m_sg_axi_wdata[42] = \<const0> ;
  assign m_sg_axi_wdata[41] = \<const0> ;
  assign m_sg_axi_wdata[40] = \<const0> ;
  assign m_sg_axi_wdata[39] = \<const0> ;
  assign m_sg_axi_wdata[38] = \<const0> ;
  assign m_sg_axi_wdata[37] = \<const0> ;
  assign m_sg_axi_wdata[36] = \<const0> ;
  assign m_sg_axi_wdata[35] = \<const0> ;
  assign m_sg_axi_wdata[34] = \<const0> ;
  assign m_sg_axi_wdata[33] = \<const0> ;
  assign m_sg_axi_wdata[32] = \<const0> ;
  assign m_sg_axi_wdata[31] = \<const0> ;
  assign m_sg_axi_wdata[30] = \<const0> ;
  assign m_sg_axi_wdata[29] = \<const0> ;
  assign m_sg_axi_wdata[28] = \<const0> ;
  assign m_sg_axi_wdata[27] = \<const0> ;
  assign m_sg_axi_wdata[26] = \<const0> ;
  assign m_sg_axi_wdata[25] = \<const0> ;
  assign m_sg_axi_wdata[24] = \<const0> ;
  assign m_sg_axi_wdata[23] = \<const0> ;
  assign m_sg_axi_wdata[22] = \<const0> ;
  assign m_sg_axi_wdata[21] = \<const0> ;
  assign m_sg_axi_wdata[20] = \<const0> ;
  assign m_sg_axi_wdata[19] = \<const0> ;
  assign m_sg_axi_wdata[18] = \<const0> ;
  assign m_sg_axi_wdata[17] = \<const0> ;
  assign m_sg_axi_wdata[16] = \<const0> ;
  assign m_sg_axi_wdata[15] = \<const0> ;
  assign m_sg_axi_wdata[14] = \<const0> ;
  assign m_sg_axi_wdata[13] = \<const0> ;
  assign m_sg_axi_wdata[12] = \<const0> ;
  assign m_sg_axi_wdata[11] = \<const0> ;
  assign m_sg_axi_wdata[10] = \<const0> ;
  assign m_sg_axi_wdata[9] = \<const0> ;
  assign m_sg_axi_wdata[8] = \<const0> ;
  assign m_sg_axi_wdata[7] = \<const0> ;
  assign m_sg_axi_wdata[6] = \<const0> ;
  assign m_sg_axi_wdata[5] = \<const0> ;
  assign m_sg_axi_wdata[4] = \<const0> ;
  assign m_sg_axi_wdata[3] = \<const0> ;
  assign m_sg_axi_wdata[2] = \<const0> ;
  assign m_sg_axi_wdata[1] = \<const0> ;
  assign m_sg_axi_wdata[0] = \<const0> ;
  assign m_sg_axi_wid[0] = \<const0> ;
  assign m_sg_axi_wlast = \<const0> ;
  assign m_sg_axi_wstrb[7] = \<const0> ;
  assign m_sg_axi_wstrb[6] = \<const0> ;
  assign m_sg_axi_wstrb[5] = \<const0> ;
  assign m_sg_axi_wstrb[4] = \<const0> ;
  assign m_sg_axi_wstrb[3] = \<const0> ;
  assign m_sg_axi_wstrb[2] = \<const0> ;
  assign m_sg_axi_wstrb[1] = \<const0> ;
  assign m_sg_axi_wstrb[0] = \<const0> ;
  assign m_sg_axi_wvalid = \<const0> ;
  assign m_src_axi_araddr[30:3] = \^m_src_axi_araddr [30:3];
  assign m_src_axi_araddr[2] = \<const0> ;
  assign m_src_axi_araddr[1] = \<const0> ;
  assign m_src_axi_araddr[0] = \<const0> ;
  assign m_src_axi_arburst[1] = \<const0> ;
  assign m_src_axi_arburst[0] = \<const0> ;
  assign m_src_axi_arcache[3] = \<const0> ;
  assign m_src_axi_arcache[2] = \<const0> ;
  assign m_src_axi_arcache[1] = \<const0> ;
  assign m_src_axi_arcache[0] = \<const0> ;
  assign m_src_axi_arid[0] = \<const0> ;
  assign m_src_axi_arlen[7] = \<const0> ;
  assign m_src_axi_arlen[6] = \<const0> ;
  assign m_src_axi_arlen[5] = \<const0> ;
  assign m_src_axi_arlen[4] = \<const0> ;
  assign m_src_axi_arlen[3:0] = \^m_src_axi_arlen [3:0];
  assign m_src_axi_arlock[0] = \<const0> ;
  assign m_src_axi_arprot[2] = \<const0> ;
  assign m_src_axi_arprot[1] = \<const0> ;
  assign m_src_axi_arprot[0] = \<const0> ;
  assign m_src_axi_arsize[2] = \<const0> ;
  assign m_src_axi_arsize[1] = \<const0> ;
  assign m_src_axi_arsize[0] = \<const0> ;
  assign m_src_axi_awaddr[30] = \<const0> ;
  assign m_src_axi_awaddr[29] = \<const0> ;
  assign m_src_axi_awaddr[28] = \<const0> ;
  assign m_src_axi_awaddr[27] = \<const0> ;
  assign m_src_axi_awaddr[26] = \<const0> ;
  assign m_src_axi_awaddr[25] = \<const0> ;
  assign m_src_axi_awaddr[24] = \<const0> ;
  assign m_src_axi_awaddr[23] = \<const0> ;
  assign m_src_axi_awaddr[22] = \<const0> ;
  assign m_src_axi_awaddr[21] = \<const0> ;
  assign m_src_axi_awaddr[20] = \<const0> ;
  assign m_src_axi_awaddr[19] = \<const0> ;
  assign m_src_axi_awaddr[18] = \<const0> ;
  assign m_src_axi_awaddr[17] = \<const0> ;
  assign m_src_axi_awaddr[16] = \<const0> ;
  assign m_src_axi_awaddr[15] = \<const0> ;
  assign m_src_axi_awaddr[14] = \<const0> ;
  assign m_src_axi_awaddr[13] = \<const0> ;
  assign m_src_axi_awaddr[12] = \<const0> ;
  assign m_src_axi_awaddr[11] = \<const0> ;
  assign m_src_axi_awaddr[10] = \<const0> ;
  assign m_src_axi_awaddr[9] = \<const0> ;
  assign m_src_axi_awaddr[8] = \<const0> ;
  assign m_src_axi_awaddr[7] = \<const0> ;
  assign m_src_axi_awaddr[6] = \<const0> ;
  assign m_src_axi_awaddr[5] = \<const0> ;
  assign m_src_axi_awaddr[4] = \<const0> ;
  assign m_src_axi_awaddr[3] = \<const0> ;
  assign m_src_axi_awaddr[2] = \<const0> ;
  assign m_src_axi_awaddr[1] = \<const0> ;
  assign m_src_axi_awaddr[0] = \<const0> ;
  assign m_src_axi_awburst[1] = \<const0> ;
  assign m_src_axi_awburst[0] = \<const0> ;
  assign m_src_axi_awcache[3] = \<const0> ;
  assign m_src_axi_awcache[2] = \<const0> ;
  assign m_src_axi_awcache[1] = \<const0> ;
  assign m_src_axi_awcache[0] = \<const0> ;
  assign m_src_axi_awid[0] = \<const0> ;
  assign m_src_axi_awlen[7] = \<const0> ;
  assign m_src_axi_awlen[6] = \<const0> ;
  assign m_src_axi_awlen[5] = \<const0> ;
  assign m_src_axi_awlen[4] = \<const0> ;
  assign m_src_axi_awlen[3] = \<const0> ;
  assign m_src_axi_awlen[2] = \<const0> ;
  assign m_src_axi_awlen[1] = \<const0> ;
  assign m_src_axi_awlen[0] = \<const0> ;
  assign m_src_axi_awlock[0] = \<const0> ;
  assign m_src_axi_awprot[2] = \<const0> ;
  assign m_src_axi_awprot[1] = \<const0> ;
  assign m_src_axi_awprot[0] = \<const0> ;
  assign m_src_axi_awsize[2] = \<const0> ;
  assign m_src_axi_awsize[1] = \<const0> ;
  assign m_src_axi_awsize[0] = \<const0> ;
  assign m_src_axi_awvalid = \<const0> ;
  assign m_src_axi_bready = \<const0> ;
  assign m_src_axi_rready = \<const0> ;
  assign m_src_axi_wdata[63] = \<const0> ;
  assign m_src_axi_wdata[62] = \<const0> ;
  assign m_src_axi_wdata[61] = \<const0> ;
  assign m_src_axi_wdata[60] = \<const0> ;
  assign m_src_axi_wdata[59] = \<const0> ;
  assign m_src_axi_wdata[58] = \<const0> ;
  assign m_src_axi_wdata[57] = \<const0> ;
  assign m_src_axi_wdata[56] = \<const0> ;
  assign m_src_axi_wdata[55] = \<const0> ;
  assign m_src_axi_wdata[54] = \<const0> ;
  assign m_src_axi_wdata[53] = \<const0> ;
  assign m_src_axi_wdata[52] = \<const0> ;
  assign m_src_axi_wdata[51] = \<const0> ;
  assign m_src_axi_wdata[50] = \<const0> ;
  assign m_src_axi_wdata[49] = \<const0> ;
  assign m_src_axi_wdata[48] = \<const0> ;
  assign m_src_axi_wdata[47] = \<const0> ;
  assign m_src_axi_wdata[46] = \<const0> ;
  assign m_src_axi_wdata[45] = \<const0> ;
  assign m_src_axi_wdata[44] = \<const0> ;
  assign m_src_axi_wdata[43] = \<const0> ;
  assign m_src_axi_wdata[42] = \<const0> ;
  assign m_src_axi_wdata[41] = \<const0> ;
  assign m_src_axi_wdata[40] = \<const0> ;
  assign m_src_axi_wdata[39] = \<const0> ;
  assign m_src_axi_wdata[38] = \<const0> ;
  assign m_src_axi_wdata[37] = \<const0> ;
  assign m_src_axi_wdata[36] = \<const0> ;
  assign m_src_axi_wdata[35] = \<const0> ;
  assign m_src_axi_wdata[34] = \<const0> ;
  assign m_src_axi_wdata[33] = \<const0> ;
  assign m_src_axi_wdata[32] = \<const0> ;
  assign m_src_axi_wdata[31] = \<const0> ;
  assign m_src_axi_wdata[30] = \<const0> ;
  assign m_src_axi_wdata[29] = \<const0> ;
  assign m_src_axi_wdata[28] = \<const0> ;
  assign m_src_axi_wdata[27] = \<const0> ;
  assign m_src_axi_wdata[26] = \<const0> ;
  assign m_src_axi_wdata[25] = \<const0> ;
  assign m_src_axi_wdata[24] = \<const0> ;
  assign m_src_axi_wdata[23] = \<const0> ;
  assign m_src_axi_wdata[22] = \<const0> ;
  assign m_src_axi_wdata[21] = \<const0> ;
  assign m_src_axi_wdata[20] = \<const0> ;
  assign m_src_axi_wdata[19] = \<const0> ;
  assign m_src_axi_wdata[18] = \<const0> ;
  assign m_src_axi_wdata[17] = \<const0> ;
  assign m_src_axi_wdata[16] = \<const0> ;
  assign m_src_axi_wdata[15] = \<const0> ;
  assign m_src_axi_wdata[14] = \<const0> ;
  assign m_src_axi_wdata[13] = \<const0> ;
  assign m_src_axi_wdata[12] = \<const0> ;
  assign m_src_axi_wdata[11] = \<const0> ;
  assign m_src_axi_wdata[10] = \<const0> ;
  assign m_src_axi_wdata[9] = \<const0> ;
  assign m_src_axi_wdata[8] = \<const0> ;
  assign m_src_axi_wdata[7] = \<const0> ;
  assign m_src_axi_wdata[6] = \<const0> ;
  assign m_src_axi_wdata[5] = \<const0> ;
  assign m_src_axi_wdata[4] = \<const0> ;
  assign m_src_axi_wdata[3] = \<const0> ;
  assign m_src_axi_wdata[2] = \<const0> ;
  assign m_src_axi_wdata[1] = \<const0> ;
  assign m_src_axi_wdata[0] = \<const0> ;
  assign m_src_axi_wid[0] = \<const0> ;
  assign m_src_axi_wlast = \<const0> ;
  assign m_src_axi_wstrb[7] = \<const0> ;
  assign m_src_axi_wstrb[6] = \<const0> ;
  assign m_src_axi_wstrb[5] = \<const0> ;
  assign m_src_axi_wstrb[4] = \<const0> ;
  assign m_src_axi_wstrb[3] = \<const0> ;
  assign m_src_axi_wstrb[2] = \<const0> ;
  assign m_src_axi_wstrb[1] = \<const0> ;
  assign m_src_axi_wstrb[0] = \<const0> ;
  assign m_src_axi_wvalid = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axis_ready = \<const0> ;
  assign s_axis_xfer_req = \<const0> ;
  assign s_frame_out[2] = \<const0> ;
  assign s_frame_out[1] = \<const0> ;
  assign s_frame_out[0] = \<const0> ;
  assign s_frame_out_valid = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_regmap i_regmap
       (.ADDRC({i_transfer_n_55,i_transfer_n_56,i_transfer_n_57,i_transfer_n_58}),
        .ADDRD({i_transfer_n_51,i_transfer_n_52,i_transfer_n_53,i_transfer_n_54}),
        .D({up_dma_req_dest_address,up_dma_req_src_address,up_dma_req_x_length[6:2],up_dma_req_last}),
        .E(\i_regmap_request/p_7_in ),
        .Q(i_transfer_n_38),
        .ctrl_enable(ctrl_enable),
        .ctrl_pause(ctrl_pause),
        .dbg_ids0({dbg_ids0[19:16],dbg_ids0[3:2]}),
        .dbg_ids1(dbg_ids1),
        .dbg_status({dbg_status[11],dbg_status[6:4],dbg_status[2]}),
        .dma_req_eot(dma_req_eot),
        .irq(irq),
        .m_src_axi_araddr(\^m_src_axi_araddr ),
        .p_3_in(\i_regmap_request/p_3_in ),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[10:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(i_regmap_n_1),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[10:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .up_axi_rvalid_int_reg(s_axi_rvalid),
        .up_bl_partial(\i_regmap_request/up_bl_partial ),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .\up_dma_x_length_reg[23] (up_dma_req_x_length[23:7]),
        .up_eot(up_eot),
        .\up_measured_transfer_length_reg[7] (up_req_measured_burst_length),
        .\up_raddr_int_reg[1] (i_regmap_n_77),
        .\up_raddr_int_reg[6] (i_regmap_n_76),
        .\up_rdata_reg[0]_0 (i_transfer_n_98),
        .\up_rdata_reg[10]_0 (i_transfer_n_32),
        .\up_rdata_reg[1]_0 (i_transfer_n_97),
        .\up_rdata_reg[24]_0 (i_transfer_n_50),
        .\up_rdata_reg[25]_0 (i_transfer_n_49),
        .\up_rdata_reg[26]_0 (i_transfer_n_48),
        .\up_rdata_reg[27]_0 (i_transfer_n_47),
        .\up_rdata_reg[9]_0 (i_transfer_n_39),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid),
        .up_sot(up_sot));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_transfer i_transfer
       (.ADDRC({i_transfer_n_55,i_transfer_n_56,i_transfer_n_57,i_transfer_n_58}),
        .ADDRD({i_transfer_n_51,i_transfer_n_52,i_transfer_n_53,i_transfer_n_54}),
        .D({up_dma_req_dest_address,up_dma_req_src_address,up_dma_req_last}),
        .E(\i_regmap_request/p_7_in ),
        .Q(i_transfer_n_32),
        .SS(i_regmap_n_1),
        .active_reg(m_axis_xfer_req),
        .addr_valid_reg(m_src_axi_arvalid),
        .\cdc_sync_stage2_reg[0] (i_transfer_n_98),
        .\cdc_sync_stage2_reg[1] (i_transfer_n_97),
        .\cdc_sync_stage2_reg[3] (dbg_ids1),
        .ctrl_enable(ctrl_enable),
        .ctrl_pause(ctrl_pause),
        .dma_req_eot(dma_req_eot),
        .\id_reg[3] ({dbg_ids0[19:16],dbg_ids0[3:2]}),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_data(m_axis_data),
        .m_axis_last(m_axis_last),
        .m_axis_ready(m_axis_ready),
        .m_axis_user(m_axis_user),
        .m_axis_valid(m_axis_valid),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_araddr(\^m_src_axi_araddr ),
        .m_src_axi_arlen(\^m_src_axi_arlen ),
        .m_src_axi_arready(m_src_axi_arready),
        .m_src_axi_rdata(m_src_axi_rdata),
        .m_src_axi_rlast(m_src_axi_rlast),
        .m_src_axi_rvalid(m_src_axi_rvalid),
        .\measured_burst_length_reg[6] (up_req_measured_burst_length),
        .needs_reset_reg({dbg_status[11],dbg_status[6:4],dbg_status[2]}),
        .p_3_in(\i_regmap_request/p_3_in ),
        .\reset_gen[0].reset_sync_reg[0] (i_transfer_n_38),
        .\reset_gen[1].reset_sync_reg[0] (i_transfer_n_39),
        .\response_id_reg[0] (i_transfer_n_50),
        .\response_id_reg[1] (i_transfer_n_49),
        .\response_id_reg[2] (i_transfer_n_48),
        .\response_id_reg[3] (i_transfer_n_47),
        .s_axi_aclk(s_axi_aclk),
        .up_bl_partial(\i_regmap_request/up_bl_partial ),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_dma_req_x_length(up_dma_req_x_length),
        .up_eot(up_eot),
        .\up_rdata_reg[1] (i_regmap_n_77),
        .\up_rdata_reg[1]_0 (i_regmap_n_76),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid),
        .up_sot(up_sot));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_burst_memory
   (m_axis_data,
    dest_fifo_valid,
    dest_fifo_last,
    g0,
    dest_req_ready,
    m_axis_valid,
    \src_throttled_request_id_reg[2] ,
    \cdc_sync_stage2_reg[3] ,
    dbg_ids0,
    \src_throttled_request_id_reg[0] ,
    m_axis_aclk,
    m_src_axi_aclk,
    m_src_axi_rdata,
    m_src_axi_rvalid,
    dest_mem_data_valid_reg_0,
    src_id_reduced_msb_reg_0,
    DOB,
    m_ram_reg_bram_0,
    m_axis_ready,
    data_eot,
    m_src_axi_rlast,
    Q,
    \src_beat_counter_reg[0]_0 );
  output [31:0]m_axis_data;
  output dest_fifo_valid;
  output dest_fifo_last;
  output g0;
  output dest_req_ready;
  output m_axis_valid;
  output \src_throttled_request_id_reg[2] ;
  output [1:0]\cdc_sync_stage2_reg[3] ;
  output [1:0]dbg_ids0;
  output \src_throttled_request_id_reg[0] ;
  input m_axis_aclk;
  input m_src_axi_aclk;
  input [63:0]m_src_axi_rdata;
  input m_src_axi_rvalid;
  input [0:0]dest_mem_data_valid_reg_0;
  input [0:0]src_id_reduced_msb_reg_0;
  input [0:0]DOB;
  input m_ram_reg_bram_0;
  input m_axis_ready;
  input data_eot;
  input m_src_axi_rlast;
  input [3:0]Q;
  input [0:0]\src_beat_counter_reg[0]_0 ;

  wire [0:0]DOB;
  wire [3:0]Q;
  wire b2g4_return019_out;
  wire b2g4_return020_out;
  wire b2g4_return07_out;
  wire b2g4_return09_out;
  wire burst_len_mem_reg_0_7_0_5_n_4;
  wire [1:0]\cdc_sync_stage2_reg[3] ;
  wire data_eot;
  wire [1:0]dbg_ids0;
  wire dest_beat;
  wire dest_beat_counter0;
  wire [4:0]dest_beat_counter_reg;
  wire [4:0]dest_burst_len;
  wire [6:2]dest_burst_len_data;
  wire dest_burst_ready;
  wire dest_fifo_last;
  wire dest_fifo_valid;
  wire [3:2]dest_id;
  wire \dest_id_next[0]_i_1_n_0 ;
  wire \dest_id_next[3]_i_5_n_0 ;
  wire \dest_id_next_reg_n_0_[3] ;
  wire dest_id_reduced_msb;
  wire dest_id_reduced_msb_next_i_1_n_0;
  wire [2:2]dest_id_reduced_next;
  wire [1:0]dest_id_reduced_next_0;
  wire \dest_id_reg_n_0_[0] ;
  wire \dest_id_reg_n_0_[1] ;
  wire dest_last;
  wire dest_mem_data_last_i_1_n_0;
  wire dest_mem_data_valid_i_1_n_0;
  wire [0:0]dest_mem_data_valid_reg_0;
  wire dest_req_ready;
  wire dest_valid;
  wire g0;
  wire i_dest_sync_id_n_5;
  wire id0;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_ready;
  wire m_axis_valid;
  wire m_ram_reg_bram_0;
  wire m_src_axi_aclk;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire [4:0]p_0_in;
  wire p_0_in13_in;
  wire [4:1]p_0_in_1;
  wire [3:0]p_0_in__0;
  wire p_1_in;
  wire p_1_in8_in;
  wire p_3_in;
  wire [0:0]\src_beat_counter_reg[0]_0 ;
  wire \src_id[0]_i_1_n_0 ;
  wire [2:0]src_id_reduced;
  wire src_id_reduced_msb_i_1_n_0;
  wire [0:0]src_id_reduced_msb_reg_0;
  wire \src_id_reg_n_0_[2] ;
  wire \src_throttled_request_id_reg[0] ;
  wire \src_throttled_request_id_reg[2] ;
  wire [1:0]NLW_burst_len_mem_reg_0_7_0_5_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "48" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/i_store_and_forward/burst_len_mem_reg_0_7_0_5" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM32M burst_len_mem_reg_0_7_0_5
       (.ADDRA({1'b0,1'b0,dest_id_reduced_next,dest_id_reduced_next_0}),
        .ADDRB({1'b0,1'b0,dest_id_reduced_next,dest_id_reduced_next_0}),
        .ADDRC({1'b0,1'b0,dest_id_reduced_next,dest_id_reduced_next_0}),
        .ADDRD({1'b0,1'b0,src_id_reduced}),
        .DIA({p_0_in_1[1],DOB}),
        .DIB(p_0_in_1[3:2]),
        .DIC({1'b0,p_0_in_1[4]}),
        .DID({1'b0,1'b0}),
        .DOA(dest_burst_len_data[3:2]),
        .DOB(dest_burst_len_data[5:4]),
        .DOC({burst_len_mem_reg_0_7_0_5_n_4,dest_burst_len_data[6]}),
        .DOD(NLW_burst_len_mem_reg_0_7_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(m_src_axi_aclk),
        .WE(g0));
  LUT1 #(
    .INIT(2'h1)) 
    \dest_beat_counter[0]_i_1 
       (.I0(dest_beat_counter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dest_beat_counter[1]_i_1 
       (.I0(dest_beat_counter_reg[0]),
        .I1(dest_beat_counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \dest_beat_counter[2]_i_1 
       (.I0(dest_beat_counter_reg[0]),
        .I1(dest_beat_counter_reg[1]),
        .I2(dest_beat_counter_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \dest_beat_counter[3]_i_1 
       (.I0(dest_beat_counter_reg[1]),
        .I1(dest_beat_counter_reg[0]),
        .I2(dest_beat_counter_reg[2]),
        .I3(dest_beat_counter_reg[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF80AA0000)) 
    \dest_beat_counter[4]_i_1 
       (.I0(dest_last),
        .I1(m_ram_reg_bram_0),
        .I2(m_axis_ready),
        .I3(dest_fifo_valid),
        .I4(dest_valid),
        .I5(dest_mem_data_valid_reg_0),
        .O(dest_beat_counter0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \dest_beat_counter[4]_i_2 
       (.I0(dest_beat_counter_reg[2]),
        .I1(dest_beat_counter_reg[0]),
        .I2(dest_beat_counter_reg[1]),
        .I3(dest_beat_counter_reg[3]),
        .I4(dest_beat_counter_reg[4]),
        .O(p_0_in[4]));
  FDRE #(
    .INIT(1'b0)) 
    \dest_beat_counter_reg[0] 
       (.C(m_axis_aclk),
        .CE(dest_beat),
        .D(p_0_in[0]),
        .Q(dest_beat_counter_reg[0]),
        .R(dest_beat_counter0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_beat_counter_reg[1] 
       (.C(m_axis_aclk),
        .CE(dest_beat),
        .D(p_0_in[1]),
        .Q(dest_beat_counter_reg[1]),
        .R(dest_beat_counter0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_beat_counter_reg[2] 
       (.C(m_axis_aclk),
        .CE(dest_beat),
        .D(p_0_in[2]),
        .Q(dest_beat_counter_reg[2]),
        .R(dest_beat_counter0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_beat_counter_reg[3] 
       (.C(m_axis_aclk),
        .CE(dest_beat),
        .D(p_0_in[3]),
        .Q(dest_beat_counter_reg[3]),
        .R(dest_beat_counter0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_beat_counter_reg[4] 
       (.C(m_axis_aclk),
        .CE(dest_beat),
        .D(p_0_in[4]),
        .Q(dest_beat_counter_reg[4]),
        .R(dest_beat_counter0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_burst_len_data_reg[2] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_burst_len_data[2]),
        .Q(dest_burst_len[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_burst_len_data_reg[3] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_burst_len_data[3]),
        .Q(dest_burst_len[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_burst_len_data_reg[4] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_burst_len_data[4]),
        .Q(dest_burst_len[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_burst_len_data_reg[5] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_burst_len_data[5]),
        .Q(dest_burst_len[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_burst_len_data_reg[6] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_burst_len_data[6]),
        .Q(dest_burst_len[4]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hD500FFFF)) 
    \dest_id[3]_i_1 
       (.I0(dest_fifo_valid),
        .I1(m_axis_ready),
        .I2(m_ram_reg_bram_0),
        .I3(dest_last),
        .I4(dest_valid),
        .O(dest_burst_ready));
  LUT3 #(
    .INIT(8'h69)) 
    \dest_id_next[0]_i_1 
       (.I0(dest_id_reduced_next_0[1]),
        .I1(\dest_id_next_reg_n_0_[3] ),
        .I2(p_0_in13_in),
        .O(\dest_id_next[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \dest_id_next[1]_i_1 
       (.I0(p_0_in13_in),
        .I1(\dest_id_next_reg_n_0_[3] ),
        .I2(dest_id_reduced_next_0[1]),
        .I3(dest_id_reduced_next_0[0]),
        .O(b2g4_return07_out));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \dest_id_next[2]_i_1 
       (.I0(\dest_id_next_reg_n_0_[3] ),
        .I1(dest_id_reduced_next_0[0]),
        .I2(p_0_in13_in),
        .I3(dest_id_reduced_next_0[1]),
        .O(b2g4_return09_out));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \dest_id_next[3]_i_2 
       (.I0(dest_id_reduced_next_0[1]),
        .I1(p_0_in13_in),
        .I2(dest_id_reduced_next_0[0]),
        .I3(\dest_id_next_reg_n_0_[3] ),
        .O(p_1_in8_in));
  LUT5 #(
    .INIT(32'h90000090)) 
    \dest_id_next[3]_i_3 
       (.I0(dest_beat_counter_reg[3]),
        .I1(dest_burst_len[3]),
        .I2(\dest_id_next[3]_i_5_n_0 ),
        .I3(dest_burst_len[4]),
        .I4(dest_beat_counter_reg[4]),
        .O(dest_last));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dest_id_next[3]_i_5 
       (.I0(dest_beat_counter_reg[0]),
        .I1(dest_burst_len[0]),
        .I2(dest_burst_len[2]),
        .I3(dest_beat_counter_reg[2]),
        .I4(dest_burst_len[1]),
        .I5(dest_beat_counter_reg[1]),
        .O(\dest_id_next[3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_next_reg[0] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(\dest_id_next[0]_i_1_n_0 ),
        .Q(dest_id_reduced_next_0[0]),
        .R(dest_mem_data_valid_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_next_reg[1] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(b2g4_return07_out),
        .Q(dest_id_reduced_next_0[1]),
        .R(dest_mem_data_valid_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_next_reg[2] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(b2g4_return09_out),
        .Q(p_0_in13_in),
        .R(dest_mem_data_valid_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_next_reg[3] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(p_1_in8_in),
        .Q(\dest_id_next_reg_n_0_[3] ),
        .R(dest_mem_data_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h3ACA)) 
    dest_id_reduced_msb_next_i_1
       (.I0(dest_id_reduced_next_0[1]),
        .I1(p_0_in13_in),
        .I2(dest_id_reduced_next_0[0]),
        .I3(\dest_id_next_reg_n_0_[3] ),
        .O(dest_id_reduced_msb_next_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dest_id_reduced_msb_next_reg
       (.C(m_axis_aclk),
        .CE(id0),
        .D(dest_id_reduced_msb_next_i_1_n_0),
        .Q(dest_id_reduced_next),
        .R(dest_mem_data_valid_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    dest_id_reduced_msb_reg
       (.C(m_axis_aclk),
        .CE(dest_burst_ready),
        .D(dest_id_reduced_next),
        .Q(dest_id_reduced_msb),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_reg[0] 
       (.C(m_axis_aclk),
        .CE(dest_burst_ready),
        .D(dest_id_reduced_next_0[0]),
        .Q(\dest_id_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_reg[1] 
       (.C(m_axis_aclk),
        .CE(dest_burst_ready),
        .D(dest_id_reduced_next_0[1]),
        .Q(\dest_id_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_reg[2] 
       (.C(m_axis_aclk),
        .CE(dest_burst_ready),
        .D(p_0_in13_in),
        .Q(dest_id[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dest_id_reg[3] 
       (.C(m_axis_aclk),
        .CE(dest_burst_ready),
        .D(\dest_id_next_reg_n_0_[3] ),
        .Q(dest_id[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000CCCC0AAA)) 
    dest_mem_data_last_i_1
       (.I0(dest_fifo_last),
        .I1(dest_last),
        .I2(m_ram_reg_bram_0),
        .I3(m_axis_ready),
        .I4(dest_beat),
        .I5(dest_mem_data_valid_reg_0),
        .O(dest_mem_data_last_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dest_mem_data_last_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(dest_mem_data_last_i_1_n_0),
        .Q(dest_fifo_last),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hBFAA)) 
    dest_mem_data_valid_i_1
       (.I0(dest_valid),
        .I1(m_ram_reg_bram_0),
        .I2(m_axis_ready),
        .I3(dest_fifo_valid),
        .O(dest_mem_data_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dest_mem_data_valid_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(dest_mem_data_valid_i_1_n_0),
        .Q(dest_fifo_valid),
        .R(dest_mem_data_valid_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    dest_valid_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(i_dest_sync_id_n_5),
        .Q(dest_valid),
        .R(dest_mem_data_valid_reg_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__1 i_dest_sync_id
       (.ADDRD(src_id_reduced[1:0]),
        .E(id0),
        .Q({\dest_id_next_reg_n_0_[3] ,p_0_in13_in,dest_id_reduced_next_0}),
        .active_reg(i_dest_sync_id_n_5),
        .\cdc_sync_stage1_reg[2]_0 (\src_id_reg_n_0_[2] ),
        .\cdc_sync_stage2_reg[3]_0 (\cdc_sync_stage2_reg[3] ),
        .dbg_ids0(dbg_ids0),
        .dest_last(dest_last),
        .dest_valid(dest_valid),
        .dest_valid_reg(dest_fifo_valid),
        .dest_valid_reg_0(m_ram_reg_bram_0),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_ready(m_axis_ready),
        .p_1_in(p_1_in));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ad_mem_asym i_mem
       (.ADDRARDADDR({dest_id_reduced_msb,\dest_id_reg_n_0_[1] ,\dest_id_reg_n_0_[0] ,dest_beat_counter_reg}),
        .ADDRBWRADDR({src_id_reduced,p_0_in_1}),
        .E(dest_beat),
        .dest_valid(dest_valid),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_data(m_axis_data),
        .m_axis_ready(m_axis_ready),
        .m_ram_reg_bram_0_0(dest_fifo_valid),
        .m_ram_reg_bram_0_1(m_ram_reg_bram_0),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_rdata(m_src_axi_rdata),
        .m_src_axi_rvalid(m_src_axi_rvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__2 i_src_sync_id
       (.Q(Q),
        .\cdc_sync_stage1_reg[3]_0 ({dest_id,\dest_id_reg_n_0_[1] ,\dest_id_reg_n_0_[0] }),
        .m_src_axi_aclk(m_src_axi_aclk),
        .\src_throttled_request_id_reg[0] (\src_throttled_request_id_reg[0] ),
        .\src_throttled_request_id_reg[2] (\src_throttled_request_id_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h8)) 
    m_axis_valid_INST_0
       (.I0(dest_fifo_valid),
        .I1(m_ram_reg_bram_0),
        .O(m_axis_valid));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h80FF)) 
    req_islast_d_i_1
       (.I0(data_eot),
        .I1(m_axis_ready),
        .I2(dest_fifo_last),
        .I3(m_ram_reg_bram_0),
        .O(dest_req_ready));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \src_beat_counter[0]_i_1 
       (.I0(p_0_in_1[1]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_beat_counter[1]_i_1 
       (.I0(p_0_in_1[1]),
        .I1(p_0_in_1[2]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \src_beat_counter[2]_i_1 
       (.I0(p_0_in_1[1]),
        .I1(p_0_in_1[2]),
        .I2(p_0_in_1[3]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \src_beat_counter[3]_i_2 
       (.I0(p_0_in_1[2]),
        .I1(p_0_in_1[1]),
        .I2(p_0_in_1[3]),
        .I3(p_0_in_1[4]),
        .O(p_0_in__0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \src_beat_counter_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(m_src_axi_rvalid),
        .D(p_0_in__0[0]),
        .Q(p_0_in_1[1]),
        .R(\src_beat_counter_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \src_beat_counter_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(m_src_axi_rvalid),
        .D(p_0_in__0[1]),
        .Q(p_0_in_1[2]),
        .R(\src_beat_counter_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \src_beat_counter_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(m_src_axi_rvalid),
        .D(p_0_in__0[2]),
        .Q(p_0_in_1[3]),
        .R(\src_beat_counter_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \src_beat_counter_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(m_src_axi_rvalid),
        .D(p_0_in__0[3]),
        .Q(p_0_in_1[4]),
        .R(\src_beat_counter_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \src_id[0]_i_1 
       (.I0(src_id_reduced[1]),
        .I1(p_1_in),
        .I2(\src_id_reg_n_0_[2] ),
        .O(\src_id[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \src_id[1]_i_1 
       (.I0(\src_id_reg_n_0_[2] ),
        .I1(p_1_in),
        .I2(src_id_reduced[1]),
        .I3(src_id_reduced[0]),
        .O(b2g4_return019_out));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \src_id[2]_i_1 
       (.I0(p_1_in),
        .I1(src_id_reduced[0]),
        .I2(\src_id_reg_n_0_[2] ),
        .I3(src_id_reduced[1]),
        .O(b2g4_return020_out));
  LUT2 #(
    .INIT(4'h8)) 
    \src_id[3]_i_1 
       (.I0(m_src_axi_rvalid),
        .I1(m_src_axi_rlast),
        .O(g0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \src_id[3]_i_2 
       (.I0(src_id_reduced[1]),
        .I1(\src_id_reg_n_0_[2] ),
        .I2(src_id_reduced[0]),
        .I3(p_1_in),
        .O(p_3_in));
  LUT6 #(
    .INIT(64'h5555D515AAAAEA2A)) 
    src_id_reduced_msb_i_1
       (.I0(\src_id_reg_n_0_[2] ),
        .I1(m_src_axi_rlast),
        .I2(m_src_axi_rvalid),
        .I3(src_id_reduced[1]),
        .I4(src_id_reduced[0]),
        .I5(p_1_in),
        .O(src_id_reduced_msb_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    src_id_reduced_msb_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(src_id_reduced_msb_i_1_n_0),
        .Q(src_id_reduced[2]),
        .R(src_id_reduced_msb_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \src_id_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(\src_id[0]_i_1_n_0 ),
        .Q(src_id_reduced[0]),
        .R(src_id_reduced_msb_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \src_id_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(b2g4_return019_out),
        .Q(src_id_reduced[1]),
        .R(src_id_reduced_msb_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \src_id_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(b2g4_return020_out),
        .Q(\src_id_reg_n_0_[2] ),
        .R(src_id_reduced_msb_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \src_id_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(p_3_in),
        .Q(p_1_in),
        .R(src_id_reduced_msb_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_regmap
   (ctrl_enable,
    s_axi_aresetn_0,
    ctrl_pause,
    up_dma_req_cyclic,
    D,
    p_3_in,
    irq,
    up_dma_req_valid,
    up_response_ready,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    up_axi_rvalid_int_reg,
    \up_raddr_int_reg[6] ,
    \up_raddr_int_reg[1] ,
    \up_dma_x_length_reg[23] ,
    s_axi_rdata,
    s_axi_aclk,
    E,
    dma_req_eot,
    up_bl_partial,
    up_response_valid,
    s_axi_aresetn,
    up_sot,
    up_eot,
    s_axi_bready,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    m_src_axi_araddr,
    Q,
    ADDRD,
    \up_rdata_reg[9]_0 ,
    \up_rdata_reg[10]_0 ,
    \up_rdata_reg[1]_0 ,
    dbg_status,
    \up_rdata_reg[27]_0 ,
    ADDRC,
    \up_rdata_reg[26]_0 ,
    \up_rdata_reg[25]_0 ,
    \up_rdata_reg[24]_0 ,
    dbg_ids0,
    dbg_ids1,
    \up_rdata_reg[0]_0 ,
    s_axi_rready,
    s_axi_wdata,
    s_axi_awaddr,
    s_axi_araddr,
    \up_measured_transfer_length_reg[7] );
  output ctrl_enable;
  output s_axi_aresetn_0;
  output ctrl_pause;
  output up_dma_req_cyclic;
  output [62:0]D;
  output [0:0]p_3_in;
  output irq;
  output up_dma_req_valid;
  output up_response_ready;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  output up_axi_rvalid_int_reg;
  output \up_raddr_int_reg[6] ;
  output \up_raddr_int_reg[1] ;
  output [16:0]\up_dma_x_length_reg[23] ;
  output [31:0]s_axi_rdata;
  input s_axi_aclk;
  input [0:0]E;
  input dma_req_eot;
  input up_bl_partial;
  input up_response_valid;
  input s_axi_aresetn;
  input up_sot;
  input up_eot;
  input s_axi_bready;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [27:0]m_src_axi_araddr;
  input [0:0]Q;
  input [3:0]ADDRD;
  input [0:0]\up_rdata_reg[9]_0 ;
  input [0:0]\up_rdata_reg[10]_0 ;
  input \up_rdata_reg[1]_0 ;
  input [4:0]dbg_status;
  input \up_rdata_reg[27]_0 ;
  input [3:0]ADDRC;
  input \up_rdata_reg[26]_0 ;
  input \up_rdata_reg[25]_0 ;
  input \up_rdata_reg[24]_0 ;
  input [5:0]dbg_ids0;
  input [1:0]dbg_ids1;
  input \up_rdata_reg[0]_0 ;
  input s_axi_rready;
  input [31:0]s_axi_wdata;
  input [8:0]s_axi_awaddr;
  input [8:0]s_axi_araddr;
  input [6:0]\up_measured_transfer_length_reg[7] ;

  wire [3:0]ADDRC;
  wire [3:0]ADDRD;
  wire [62:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire ctrl_enable;
  wire ctrl_pause;
  wire [31:0]data5;
  wire [1:0]data9;
  wire [5:0]dbg_ids0;
  wire [1:0]dbg_ids1;
  wire [4:0]dbg_status;
  wire dma_req_eot;
  wire i_regmap_request_n_118;
  wire i_regmap_request_n_119;
  wire i_regmap_request_n_120;
  wire i_regmap_request_n_121;
  wire i_regmap_request_n_122;
  wire i_regmap_request_n_123;
  wire i_regmap_request_n_124;
  wire i_regmap_request_n_125;
  wire i_regmap_request_n_126;
  wire i_regmap_request_n_127;
  wire i_regmap_request_n_128;
  wire i_regmap_request_n_129;
  wire i_regmap_request_n_130;
  wire i_regmap_request_n_131;
  wire i_regmap_request_n_132;
  wire i_regmap_request_n_133;
  wire i_regmap_request_n_134;
  wire i_regmap_request_n_135;
  wire i_regmap_request_n_136;
  wire i_regmap_request_n_137;
  wire i_regmap_request_n_138;
  wire i_regmap_request_n_139;
  wire i_regmap_request_n_140;
  wire i_regmap_request_n_141;
  wire i_regmap_request_n_75;
  wire i_up_axi_n_10;
  wire i_up_axi_n_11;
  wire i_up_axi_n_12;
  wire i_up_axi_n_13;
  wire i_up_axi_n_14;
  wire i_up_axi_n_15;
  wire i_up_axi_n_16;
  wire i_up_axi_n_17;
  wire i_up_axi_n_18;
  wire i_up_axi_n_19;
  wire i_up_axi_n_20;
  wire i_up_axi_n_21;
  wire i_up_axi_n_22;
  wire i_up_axi_n_23;
  wire i_up_axi_n_24;
  wire i_up_axi_n_25;
  wire i_up_axi_n_26;
  wire i_up_axi_n_27;
  wire i_up_axi_n_28;
  wire i_up_axi_n_29;
  wire i_up_axi_n_30;
  wire i_up_axi_n_31;
  wire i_up_axi_n_32;
  wire i_up_axi_n_33;
  wire i_up_axi_n_34;
  wire i_up_axi_n_35;
  wire i_up_axi_n_36;
  wire i_up_axi_n_37;
  wire i_up_axi_n_39;
  wire i_up_axi_n_40;
  wire i_up_axi_n_42;
  wire i_up_axi_n_43;
  wire i_up_axi_n_46;
  wire i_up_axi_n_47;
  wire i_up_axi_n_48;
  wire i_up_axi_n_49;
  wire i_up_axi_n_8;
  wire i_up_axi_n_86;
  wire i_up_axi_n_9;
  wire irq;
  wire irq_i_1_n_0;
  wire [27:0]m_src_axi_araddr;
  wire p_0_in;
  wire [0:0]p_3_in;
  wire p_8_in;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [23:0]s_axis_data;
  wire up_axi_rvalid_int_reg;
  wire up_bl_partial;
  wire up_dma_cyclic;
  wire up_dma_dest_address;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire up_dma_src_address;
  wire [16:0]\up_dma_x_length_reg[23] ;
  wire up_eot;
  wire \up_irq_mask_reg_n_0_[0] ;
  wire \up_irq_mask_reg_n_0_[1] ;
  wire [1:0]up_irq_source;
  wire [6:0]\up_measured_transfer_length_reg[7] ;
  wire up_rack;
  wire [4:2]up_raddr;
  wire \up_raddr_int_reg[1] ;
  wire \up_raddr_int_reg[6] ;
  wire [30:0]up_rdata;
  wire \up_rdata_reg[0]_0 ;
  wire [0:0]\up_rdata_reg[10]_0 ;
  wire \up_rdata_reg[1]_0 ;
  wire \up_rdata_reg[24]_0 ;
  wire \up_rdata_reg[25]_0 ;
  wire \up_rdata_reg[26]_0 ;
  wire \up_rdata_reg[27]_0 ;
  wire [0:0]\up_rdata_reg[9]_0 ;
  wire \up_rdata_reg_n_0_[0] ;
  wire \up_rdata_reg_n_0_[10] ;
  wire \up_rdata_reg_n_0_[11] ;
  wire \up_rdata_reg_n_0_[12] ;
  wire \up_rdata_reg_n_0_[13] ;
  wire \up_rdata_reg_n_0_[14] ;
  wire \up_rdata_reg_n_0_[15] ;
  wire \up_rdata_reg_n_0_[16] ;
  wire \up_rdata_reg_n_0_[17] ;
  wire \up_rdata_reg_n_0_[18] ;
  wire \up_rdata_reg_n_0_[19] ;
  wire \up_rdata_reg_n_0_[1] ;
  wire \up_rdata_reg_n_0_[20] ;
  wire \up_rdata_reg_n_0_[21] ;
  wire \up_rdata_reg_n_0_[22] ;
  wire \up_rdata_reg_n_0_[23] ;
  wire \up_rdata_reg_n_0_[24] ;
  wire \up_rdata_reg_n_0_[25] ;
  wire \up_rdata_reg_n_0_[26] ;
  wire \up_rdata_reg_n_0_[27] ;
  wire \up_rdata_reg_n_0_[28] ;
  wire \up_rdata_reg_n_0_[29] ;
  wire \up_rdata_reg_n_0_[2] ;
  wire \up_rdata_reg_n_0_[30] ;
  wire \up_rdata_reg_n_0_[31] ;
  wire \up_rdata_reg_n_0_[3] ;
  wire \up_rdata_reg_n_0_[4] ;
  wire \up_rdata_reg_n_0_[5] ;
  wire \up_rdata_reg_n_0_[6] ;
  wire \up_rdata_reg_n_0_[7] ;
  wire \up_rdata_reg_n_0_[8] ;
  wire \up_rdata_reg_n_0_[9] ;
  wire up_response_ready;
  wire up_response_valid;
  wire up_rreq;
  wire \up_scratch_reg_n_0_[0] ;
  wire \up_scratch_reg_n_0_[10] ;
  wire \up_scratch_reg_n_0_[11] ;
  wire \up_scratch_reg_n_0_[12] ;
  wire \up_scratch_reg_n_0_[13] ;
  wire \up_scratch_reg_n_0_[14] ;
  wire \up_scratch_reg_n_0_[15] ;
  wire \up_scratch_reg_n_0_[16] ;
  wire \up_scratch_reg_n_0_[17] ;
  wire \up_scratch_reg_n_0_[18] ;
  wire \up_scratch_reg_n_0_[19] ;
  wire \up_scratch_reg_n_0_[1] ;
  wire \up_scratch_reg_n_0_[20] ;
  wire \up_scratch_reg_n_0_[21] ;
  wire \up_scratch_reg_n_0_[22] ;
  wire \up_scratch_reg_n_0_[23] ;
  wire \up_scratch_reg_n_0_[24] ;
  wire \up_scratch_reg_n_0_[25] ;
  wire \up_scratch_reg_n_0_[26] ;
  wire \up_scratch_reg_n_0_[27] ;
  wire \up_scratch_reg_n_0_[28] ;
  wire \up_scratch_reg_n_0_[29] ;
  wire \up_scratch_reg_n_0_[2] ;
  wire \up_scratch_reg_n_0_[30] ;
  wire \up_scratch_reg_n_0_[31] ;
  wire \up_scratch_reg_n_0_[3] ;
  wire \up_scratch_reg_n_0_[4] ;
  wire \up_scratch_reg_n_0_[5] ;
  wire \up_scratch_reg_n_0_[6] ;
  wire \up_scratch_reg_n_0_[7] ;
  wire \up_scratch_reg_n_0_[8] ;
  wire \up_scratch_reg_n_0_[9] ;
  wire up_sot;
  wire [1:0]up_transfer_id;
  wire [1:0]up_transfer_id_eot;
  wire up_wack;
  wire up_wreq;

  FDRE #(
    .INIT(1'b0)) 
    ctrl_enable_reg
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_47),
        .D(i_up_axi_n_40),
        .Q(ctrl_enable),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    ctrl_pause_reg
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_47),
        .D(i_up_axi_n_39),
        .Q(ctrl_pause),
        .R(s_axi_aresetn_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_regmap_request i_regmap_request
       (.D(D),
        .E(E),
        .Q({i_up_axi_n_10,i_up_axi_n_11,i_up_axi_n_12,i_up_axi_n_13,i_up_axi_n_14,i_up_axi_n_15,i_up_axi_n_16,i_up_axi_n_17,i_up_axi_n_18,i_up_axi_n_19,i_up_axi_n_20,i_up_axi_n_21,i_up_axi_n_22,i_up_axi_n_23,i_up_axi_n_24,i_up_axi_n_25,i_up_axi_n_26,i_up_axi_n_27,i_up_axi_n_28,i_up_axi_n_29,i_up_axi_n_30,i_up_axi_n_31,i_up_axi_n_32,i_up_axi_n_33,i_up_axi_n_34,i_up_axi_n_35,i_up_axi_n_36,i_up_axi_n_37,p_0_in,i_up_axi_n_39,i_up_axi_n_40}),
        .SR(s_axi_aresetn_0),
        .dma_req_eot(dma_req_eot),
        .\fifo.sync_clocks.data_reg[25] ({data9,i_regmap_request_n_118,i_regmap_request_n_119,i_regmap_request_n_120,i_regmap_request_n_121,i_regmap_request_n_122,i_regmap_request_n_123,i_regmap_request_n_124,i_regmap_request_n_125,i_regmap_request_n_126,i_regmap_request_n_127,i_regmap_request_n_128,i_regmap_request_n_129,i_regmap_request_n_130,i_regmap_request_n_131,i_regmap_request_n_132,i_regmap_request_n_133,i_regmap_request_n_134,i_regmap_request_n_135,i_regmap_request_n_136,i_regmap_request_n_137,i_regmap_request_n_138,i_regmap_request_n_139,i_regmap_request_n_140,i_regmap_request_n_141}),
        .p_3_in(p_3_in),
        .p_8_in(p_8_in),
        .response_ready_reg_0(up_response_ready),
        .s_axi_aclk(s_axi_aclk),
        .\s_axis_waddr_reg_reg[0] (ctrl_enable),
        .up_bl_partial(up_bl_partial),
        .up_dma_cyclic(up_dma_cyclic),
        .\up_dma_dest_address_reg[30]_0 (up_dma_dest_address),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_dma_req_valid_reg_0(i_up_axi_n_8),
        .\up_dma_src_address_reg[30]_0 (up_dma_src_address),
        .\up_dma_x_length_reg[23]_0 (\up_dma_x_length_reg[23] ),
        .\up_dma_x_length_reg[2]_0 (i_regmap_request_n_75),
        .\up_dma_x_length_reg[2]_1 (i_up_axi_n_86),
        .up_eot(up_eot),
        .\up_measured_transfer_length_reg[23]_0 ({s_axis_data[23:3],s_axis_data[1:0]}),
        .\up_measured_transfer_length_reg[7]_0 (\up_measured_transfer_length_reg[7] ),
        .up_partial_length_valid_reg_0({data5[31],data5[3],data5[1:0]}),
        .\up_rdata[2]_i_4 (up_raddr),
        .up_response_valid(up_response_valid),
        .up_sot(up_sot),
        .\up_transfer_id_eot_reg[1]_0 (up_transfer_id_eot),
        .\up_transfer_id_reg[1]_0 (up_transfer_id));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_axi i_up_axi
       (.ADDRC(ADDRC),
        .ADDRD(ADDRD),
        .D({i_up_axi_n_42,i_up_axi_n_43}),
        .E(i_up_axi_n_46),
        .Q({i_up_axi_n_9,i_up_axi_n_10,i_up_axi_n_11,i_up_axi_n_12,i_up_axi_n_13,i_up_axi_n_14,i_up_axi_n_15,i_up_axi_n_16,i_up_axi_n_17,i_up_axi_n_18,i_up_axi_n_19,i_up_axi_n_20,i_up_axi_n_21,i_up_axi_n_22,i_up_axi_n_23,i_up_axi_n_24,i_up_axi_n_25,i_up_axi_n_26,i_up_axi_n_27,i_up_axi_n_28,i_up_axi_n_29,i_up_axi_n_30,i_up_axi_n_31,i_up_axi_n_32,i_up_axi_n_33,i_up_axi_n_34,i_up_axi_n_35,i_up_axi_n_36,i_up_axi_n_37,p_0_in,i_up_axi_n_39,i_up_axi_n_40}),
        .SR(s_axi_aresetn_0),
        .ctrl_pause(ctrl_pause),
        .dbg_ids0(dbg_ids0),
        .dbg_ids1(dbg_ids1),
        .dbg_status(dbg_status),
        .m_src_axi_araddr(m_src_axi_araddr),
        .p_3_in(p_3_in),
        .p_8_in(p_8_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .up_axi_rvalid_int_reg_0(up_axi_rvalid_int_reg),
        .up_dma_cyclic(up_dma_cyclic),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_dma_req_valid_reg(i_up_axi_n_8),
        .up_dma_req_valid_reg_0(ctrl_enable),
        .up_eot(up_eot),
        .\up_irq_source_reg[1] (up_irq_source),
        .up_rack(up_rack),
        .\up_raddr_int_reg[1]_0 (\up_raddr_int_reg[1] ),
        .\up_raddr_int_reg[4]_0 (up_raddr),
        .\up_raddr_int_reg[6]_0 (\up_raddr_int_reg[6] ),
        .\up_rdata[1]_i_8_0 (up_transfer_id_eot),
        .\up_rdata[2]_i_2_0 (i_regmap_request_n_75),
        .\up_rdata[30]_i_2_0 ({D[33:2],D[0]}),
        .\up_rdata_d_reg[31]_0 ({\up_rdata_reg_n_0_[31] ,\up_rdata_reg_n_0_[30] ,\up_rdata_reg_n_0_[29] ,\up_rdata_reg_n_0_[28] ,\up_rdata_reg_n_0_[27] ,\up_rdata_reg_n_0_[26] ,\up_rdata_reg_n_0_[25] ,\up_rdata_reg_n_0_[24] ,\up_rdata_reg_n_0_[23] ,\up_rdata_reg_n_0_[22] ,\up_rdata_reg_n_0_[21] ,\up_rdata_reg_n_0_[20] ,\up_rdata_reg_n_0_[19] ,\up_rdata_reg_n_0_[18] ,\up_rdata_reg_n_0_[17] ,\up_rdata_reg_n_0_[16] ,\up_rdata_reg_n_0_[15] ,\up_rdata_reg_n_0_[14] ,\up_rdata_reg_n_0_[13] ,\up_rdata_reg_n_0_[12] ,\up_rdata_reg_n_0_[11] ,\up_rdata_reg_n_0_[10] ,\up_rdata_reg_n_0_[9] ,\up_rdata_reg_n_0_[8] ,\up_rdata_reg_n_0_[7] ,\up_rdata_reg_n_0_[6] ,\up_rdata_reg_n_0_[5] ,\up_rdata_reg_n_0_[4] ,\up_rdata_reg_n_0_[3] ,\up_rdata_reg_n_0_[2] ,\up_rdata_reg_n_0_[1] ,\up_rdata_reg_n_0_[0] }),
        .\up_rdata_reg[0] (\up_rdata_reg[0]_0 ),
        .\up_rdata_reg[10] (\up_rdata_reg[10]_0 ),
        .\up_rdata_reg[1] (\up_rdata_reg[1]_0 ),
        .\up_rdata_reg[1]_0 ({\up_irq_mask_reg_n_0_[1] ,\up_irq_mask_reg_n_0_[0] }),
        .\up_rdata_reg[1]_i_6_0 ({data9,i_regmap_request_n_118,i_regmap_request_n_119,i_regmap_request_n_120,i_regmap_request_n_121,i_regmap_request_n_122,i_regmap_request_n_123,i_regmap_request_n_124,i_regmap_request_n_125,i_regmap_request_n_126,i_regmap_request_n_127,i_regmap_request_n_128,i_regmap_request_n_129,i_regmap_request_n_130,i_regmap_request_n_131,i_regmap_request_n_132,i_regmap_request_n_133,i_regmap_request_n_134,i_regmap_request_n_135,i_regmap_request_n_136,i_regmap_request_n_137,i_regmap_request_n_138,i_regmap_request_n_139,i_regmap_request_n_140,i_regmap_request_n_141}),
        .\up_rdata_reg[1]_i_6_1 (up_transfer_id),
        .\up_rdata_reg[23]_i_3_0 ({s_axis_data[23:3],s_axis_data[1:0]}),
        .\up_rdata_reg[23]_i_3_1 (\up_dma_x_length_reg[23] ),
        .\up_rdata_reg[24] (\up_rdata_reg[24]_0 ),
        .\up_rdata_reg[25] (\up_rdata_reg[25]_0 ),
        .\up_rdata_reg[26] (\up_rdata_reg[26]_0 ),
        .\up_rdata_reg[27] (\up_rdata_reg[27]_0 ),
        .\up_rdata_reg[31] ({\up_scratch_reg_n_0_[31] ,\up_scratch_reg_n_0_[30] ,\up_scratch_reg_n_0_[29] ,\up_scratch_reg_n_0_[28] ,\up_scratch_reg_n_0_[27] ,\up_scratch_reg_n_0_[26] ,\up_scratch_reg_n_0_[25] ,\up_scratch_reg_n_0_[24] ,\up_scratch_reg_n_0_[23] ,\up_scratch_reg_n_0_[22] ,\up_scratch_reg_n_0_[21] ,\up_scratch_reg_n_0_[20] ,\up_scratch_reg_n_0_[19] ,\up_scratch_reg_n_0_[18] ,\up_scratch_reg_n_0_[17] ,\up_scratch_reg_n_0_[16] ,\up_scratch_reg_n_0_[15] ,\up_scratch_reg_n_0_[14] ,\up_scratch_reg_n_0_[13] ,\up_scratch_reg_n_0_[12] ,\up_scratch_reg_n_0_[11] ,\up_scratch_reg_n_0_[10] ,\up_scratch_reg_n_0_[9] ,\up_scratch_reg_n_0_[8] ,\up_scratch_reg_n_0_[7] ,\up_scratch_reg_n_0_[6] ,\up_scratch_reg_n_0_[5] ,\up_scratch_reg_n_0_[4] ,\up_scratch_reg_n_0_[3] ,\up_scratch_reg_n_0_[2] ,\up_scratch_reg_n_0_[1] ,\up_scratch_reg_n_0_[0] }),
        .\up_rdata_reg[31]_0 ({data5[31],data5[3],data5[1:0]}),
        .\up_rdata_reg[8] (Q),
        .\up_rdata_reg[9] (\up_rdata_reg[9]_0 ),
        .up_rreq(up_rreq),
        .\up_scratch_reg[31] ({i_up_axi_n_49,up_rdata}),
        .up_sot(up_sot),
        .up_wack(up_wack),
        .\up_waddr_int_reg[0]_0 (i_up_axi_n_86),
        .up_wreq(up_wreq),
        .up_wreq_int_reg_0(up_dma_src_address),
        .up_wreq_int_reg_1(up_dma_dest_address),
        .up_wreq_int_reg_2(i_up_axi_n_47),
        .up_wreq_int_reg_3(i_up_axi_n_48));
  LUT4 #(
    .INIT(16'h4F44)) 
    irq_i_1
       (.I0(\up_irq_mask_reg_n_0_[0] ),
        .I1(up_irq_source[0]),
        .I2(\up_irq_mask_reg_n_0_[1] ),
        .I3(up_irq_source[1]),
        .O(irq_i_1_n_0));
  FDRE irq_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(irq_i_1_n_0),
        .Q(irq),
        .R(s_axi_aresetn_0));
  FDSE #(
    .INIT(1'b1)) 
    \up_irq_mask_reg[0] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_46),
        .D(i_up_axi_n_40),
        .Q(\up_irq_mask_reg_n_0_[0] ),
        .S(s_axi_aresetn_0));
  FDSE #(
    .INIT(1'b1)) 
    \up_irq_mask_reg[1] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_46),
        .D(i_up_axi_n_39),
        .Q(\up_irq_mask_reg_n_0_[1] ),
        .S(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_irq_source_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_43),
        .Q(up_irq_source[0]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_irq_source_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_42),
        .Q(up_irq_source[1]),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    up_rack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rreq),
        .Q(up_rack),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[0]),
        .Q(\up_rdata_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[10]),
        .Q(\up_rdata_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[11]),
        .Q(\up_rdata_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[12]),
        .Q(\up_rdata_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[13]),
        .Q(\up_rdata_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[14]),
        .Q(\up_rdata_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[15]),
        .Q(\up_rdata_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[16]),
        .Q(\up_rdata_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[17]),
        .Q(\up_rdata_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[18]),
        .Q(\up_rdata_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[19]),
        .Q(\up_rdata_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[1]),
        .Q(\up_rdata_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[20]),
        .Q(\up_rdata_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[21]),
        .Q(\up_rdata_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[22]),
        .Q(\up_rdata_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[23]),
        .Q(\up_rdata_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[24]),
        .Q(\up_rdata_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[25]),
        .Q(\up_rdata_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[26]),
        .Q(\up_rdata_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[27]),
        .Q(\up_rdata_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[28]),
        .Q(\up_rdata_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[29]),
        .Q(\up_rdata_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[2]),
        .Q(\up_rdata_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[30]),
        .Q(\up_rdata_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(i_up_axi_n_49),
        .Q(\up_rdata_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[3]),
        .Q(\up_rdata_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[4]),
        .Q(\up_rdata_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[5]),
        .Q(\up_rdata_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[6]),
        .Q(\up_rdata_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[7]),
        .Q(\up_rdata_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[8]),
        .Q(\up_rdata_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(up_rreq),
        .D(up_rdata[9]),
        .Q(\up_rdata_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[0] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_40),
        .Q(\up_scratch_reg_n_0_[0] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[10] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_30),
        .Q(\up_scratch_reg_n_0_[10] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[11] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_29),
        .Q(\up_scratch_reg_n_0_[11] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[12] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_28),
        .Q(\up_scratch_reg_n_0_[12] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[13] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_27),
        .Q(\up_scratch_reg_n_0_[13] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[14] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_26),
        .Q(\up_scratch_reg_n_0_[14] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[15] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_25),
        .Q(\up_scratch_reg_n_0_[15] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[16] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_24),
        .Q(\up_scratch_reg_n_0_[16] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[17] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_23),
        .Q(\up_scratch_reg_n_0_[17] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[18] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_22),
        .Q(\up_scratch_reg_n_0_[18] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[19] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_21),
        .Q(\up_scratch_reg_n_0_[19] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[1] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_39),
        .Q(\up_scratch_reg_n_0_[1] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[20] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_20),
        .Q(\up_scratch_reg_n_0_[20] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[21] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_19),
        .Q(\up_scratch_reg_n_0_[21] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[22] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_18),
        .Q(\up_scratch_reg_n_0_[22] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[23] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_17),
        .Q(\up_scratch_reg_n_0_[23] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[24] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_16),
        .Q(\up_scratch_reg_n_0_[24] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[25] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_15),
        .Q(\up_scratch_reg_n_0_[25] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[26] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_14),
        .Q(\up_scratch_reg_n_0_[26] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[27] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_13),
        .Q(\up_scratch_reg_n_0_[27] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[28] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_12),
        .Q(\up_scratch_reg_n_0_[28] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[29] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_11),
        .Q(\up_scratch_reg_n_0_[29] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[2] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(p_0_in),
        .Q(\up_scratch_reg_n_0_[2] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[30] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_10),
        .Q(\up_scratch_reg_n_0_[30] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[31] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_9),
        .Q(\up_scratch_reg_n_0_[31] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[3] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_37),
        .Q(\up_scratch_reg_n_0_[3] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[4] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_36),
        .Q(\up_scratch_reg_n_0_[4] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[5] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_35),
        .Q(\up_scratch_reg_n_0_[5] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[6] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_34),
        .Q(\up_scratch_reg_n_0_[6] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[7] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_33),
        .Q(\up_scratch_reg_n_0_[7] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[8] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_32),
        .Q(\up_scratch_reg_n_0_[8] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[9] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_48),
        .D(i_up_axi_n_31),
        .Q(\up_scratch_reg_n_0_[9] ),
        .R(s_axi_aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    up_wack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wreq),
        .Q(up_wack),
        .R(s_axi_aresetn_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_regmap_request
   (up_dma_req_cyclic,
    D,
    p_3_in,
    up_dma_req_valid,
    response_ready_reg_0,
    up_partial_length_valid_reg_0,
    \up_transfer_id_reg[1]_0 ,
    \up_transfer_id_eot_reg[1]_0 ,
    \up_dma_x_length_reg[2]_0 ,
    \up_measured_transfer_length_reg[23]_0 ,
    \up_dma_x_length_reg[23]_0 ,
    \fifo.sync_clocks.data_reg[25] ,
    SR,
    up_dma_cyclic,
    Q,
    s_axi_aclk,
    E,
    dma_req_eot,
    up_dma_req_valid_reg_0,
    up_bl_partial,
    up_response_valid,
    \s_axis_waddr_reg_reg[0] ,
    \up_rdata[2]_i_4 ,
    p_8_in,
    \up_dma_src_address_reg[30]_0 ,
    \up_dma_x_length_reg[2]_1 ,
    up_eot,
    up_sot,
    \up_dma_dest_address_reg[30]_0 ,
    \up_measured_transfer_length_reg[7]_0 );
  output up_dma_req_cyclic;
  output [62:0]D;
  output [0:0]p_3_in;
  output up_dma_req_valid;
  output response_ready_reg_0;
  output [3:0]up_partial_length_valid_reg_0;
  output [1:0]\up_transfer_id_reg[1]_0 ;
  output [1:0]\up_transfer_id_eot_reg[1]_0 ;
  output \up_dma_x_length_reg[2]_0 ;
  output [22:0]\up_measured_transfer_length_reg[23]_0 ;
  output [16:0]\up_dma_x_length_reg[23]_0 ;
  output [25:0]\fifo.sync_clocks.data_reg[25] ;
  input [0:0]SR;
  input up_dma_cyclic;
  input [30:0]Q;
  input s_axi_aclk;
  input [0:0]E;
  input dma_req_eot;
  input up_dma_req_valid_reg_0;
  input up_bl_partial;
  input up_response_valid;
  input \s_axis_waddr_reg_reg[0] ;
  input [2:0]\up_rdata[2]_i_4 ;
  input p_8_in;
  input [0:0]\up_dma_src_address_reg[30]_0 ;
  input [0:0]\up_dma_x_length_reg[2]_1 ;
  input up_eot;
  input up_sot;
  input [0:0]\up_dma_dest_address_reg[30]_0 ;
  input [6:0]\up_measured_transfer_length_reg[7]_0 ;

  wire [62:0]D;
  wire [0:0]E;
  wire [30:0]Q;
  wire [0:0]SR;
  wire [2:2]data5;
  wire dma_req_eot;
  wire [25:0]\fifo.sync_clocks.data_reg[25] ;
  wire i_transfer_lenghts_fifo_n_0;
  wire i_transfer_lenghts_fifo_n_1;
  wire i_transfer_lenghts_fifo_n_2;
  wire i_transfer_lenghts_fifo_n_3;
  wire [0:0]p_3_in;
  wire p_8_in;
  wire response_ready_reg_0;
  wire s_axi_aclk;
  wire [25:2]s_axis_data;
  wire \s_axis_waddr_reg_reg[0] ;
  wire up_bl_partial;
  wire up_clear_tl;
  wire up_dma_cyclic;
  wire [0:0]\up_dma_dest_address_reg[30]_0 ;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire up_dma_req_valid_reg_0;
  wire [0:0]\up_dma_src_address_reg[30]_0 ;
  wire [16:0]\up_dma_x_length_reg[23]_0 ;
  wire \up_dma_x_length_reg[2]_0 ;
  wire [0:0]\up_dma_x_length_reg[2]_1 ;
  wire up_eot;
  wire \up_measured_transfer_length[23]_i_1_n_0 ;
  wire \up_measured_transfer_length[7]_i_2_n_0 ;
  wire \up_measured_transfer_length[7]_i_3_n_0 ;
  wire \up_measured_transfer_length[7]_i_4_n_0 ;
  wire \up_measured_transfer_length[7]_i_5_n_0 ;
  wire \up_measured_transfer_length[7]_i_6_n_0 ;
  wire \up_measured_transfer_length[7]_i_7_n_0 ;
  wire \up_measured_transfer_length[7]_i_8_n_0 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_0 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_1 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_10 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_11 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_12 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_13 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_14 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_15 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_2 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_3 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_4 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_5 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_6 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_7 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_8 ;
  wire \up_measured_transfer_length_reg[15]_i_1_n_9 ;
  wire [22:0]\up_measured_transfer_length_reg[23]_0 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_1 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_10 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_11 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_12 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_13 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_14 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_15 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_2 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_3 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_4 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_5 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_6 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_7 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_8 ;
  wire \up_measured_transfer_length_reg[23]_i_2_n_9 ;
  wire [6:0]\up_measured_transfer_length_reg[7]_0 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_0 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_1 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_10 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_11 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_12 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_13 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_14 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_15 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_2 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_3 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_4 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_5 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_6 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_7 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_8 ;
  wire \up_measured_transfer_length_reg[7]_i_1_n_9 ;
  wire [3:0]up_partial_length_valid_reg_0;
  wire [2:0]\up_rdata[2]_i_4 ;
  wire up_response_valid;
  wire up_sot;
  wire up_tlf_s_valid_reg_n_0;
  wire \up_transfer_done_bitmap[0]_i_1_n_0 ;
  wire \up_transfer_done_bitmap[0]_i_2_n_0 ;
  wire \up_transfer_done_bitmap[1]_i_1_n_0 ;
  wire \up_transfer_done_bitmap[1]_i_2_n_0 ;
  wire \up_transfer_done_bitmap[2]_i_1_n_0 ;
  wire \up_transfer_done_bitmap[2]_i_2_n_0 ;
  wire \up_transfer_done_bitmap[3]_i_1_n_0 ;
  wire \up_transfer_done_bitmap[3]_i_2_n_0 ;
  wire \up_transfer_id[0]_i_1_n_0 ;
  wire \up_transfer_id[1]_i_2_n_0 ;
  wire \up_transfer_id_eot[0]_i_1_n_0 ;
  wire \up_transfer_id_eot[1]_i_2_n_0 ;
  wire [1:0]\up_transfer_id_eot_reg[1]_0 ;
  wire [1:0]\up_transfer_id_reg[1]_0 ;
  wire [7:7]\NLW_up_measured_transfer_length_reg[23]_i_2_CO_UNCONNECTED ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo i_transfer_lenghts_fifo
       (.SR(i_transfer_lenghts_fifo_n_0),
        .\fifo.sync_clocks.data_reg[25]_0 (\fifo.sync_clocks.data_reg[25] ),
        .\fifo.valid_reg_0 (i_transfer_lenghts_fifo_n_3),
        .p_8_in(p_8_in),
        .response_ready_reg(response_ready_reg_0),
        .response_valid_reg(i_transfer_lenghts_fifo_n_2),
        .s_axi_aclk(s_axi_aclk),
        .s_axis_data({s_axis_data[25:24],\up_measured_transfer_length_reg[23]_0 [22:2],s_axis_data[2],\up_measured_transfer_length_reg[23]_0 [1:0]}),
        .\s_axis_waddr_reg_reg[0] (\s_axis_waddr_reg_reg[0] ),
        .\s_axis_waddr_reg_reg[2] (up_tlf_s_valid_reg_n_0),
        .up_bl_partial(up_bl_partial),
        .up_partial_length_valid_reg(up_partial_length_valid_reg_0[3]),
        .up_response_valid(up_response_valid),
        .up_tlf_s_valid_reg(i_transfer_lenghts_fifo_n_1));
  FDSE #(
    .INIT(1'b1)) 
    response_ready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_transfer_lenghts_fifo_n_2),
        .Q(response_ready_reg_0),
        .S(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_clear_tl_reg
       (.C(s_axi_aclk),
        .CE(E),
        .D(dma_req_eot),
        .Q(up_clear_tl),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    up_dma_cyclic_reg
       (.C(s_axi_aclk),
        .CE(up_dma_cyclic),
        .D(Q[0]),
        .Q(up_dma_req_cyclic),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[10] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[10]),
        .Q(D[42]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[11] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[11]),
        .Q(D[43]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[12] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[12]),
        .Q(D[44]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[13] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[13]),
        .Q(D[45]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[14] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[14]),
        .Q(D[46]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[15] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[15]),
        .Q(D[47]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[16] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[16]),
        .Q(D[48]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[17] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[17]),
        .Q(D[49]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[18] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[18]),
        .Q(D[50]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[19] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[19]),
        .Q(D[51]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[20] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[20]),
        .Q(D[52]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[21] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[21]),
        .Q(D[53]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[22] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[22]),
        .Q(D[54]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[23] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[23]),
        .Q(D[55]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[24] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[24]),
        .Q(D[56]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[25] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[25]),
        .Q(D[57]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[26] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[26]),
        .Q(D[58]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[27] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[27]),
        .Q(D[59]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[28] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[28]),
        .Q(D[60]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[29] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[29]),
        .Q(D[61]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[2]),
        .Q(D[34]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[30] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[30]),
        .Q(D[62]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[3]),
        .Q(D[35]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[4]),
        .Q(D[36]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[5] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[5]),
        .Q(D[37]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[6] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[6]),
        .Q(D[38]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[7] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[7]),
        .Q(D[39]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[8] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[8]),
        .Q(D[40]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_dest_address_reg[9] 
       (.C(s_axi_aclk),
        .CE(\up_dma_dest_address_reg[30]_0 ),
        .D(Q[9]),
        .Q(D[41]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    up_dma_enable_tlen_reporting_reg
       (.C(s_axi_aclk),
        .CE(up_dma_cyclic),
        .D(Q[2]),
        .Q(p_3_in),
        .R(SR));
  FDSE #(
    .INIT(1'b1)) 
    up_dma_last_reg
       (.C(s_axi_aclk),
        .CE(up_dma_cyclic),
        .D(Q[1]),
        .Q(D[0]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    up_dma_req_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_dma_req_valid_reg_0),
        .Q(up_dma_req_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[10] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[10]),
        .Q(D[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[11] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[11]),
        .Q(D[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[12] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[12]),
        .Q(D[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[13] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[13]),
        .Q(D[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[14] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[14]),
        .Q(D[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[15] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[15]),
        .Q(D[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[16] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[16]),
        .Q(D[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[17] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[17]),
        .Q(D[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[18] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[18]),
        .Q(D[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[19] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[19]),
        .Q(D[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[20] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[20]),
        .Q(D[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[21] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[21]),
        .Q(D[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[22] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[22]),
        .Q(D[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[23] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[23]),
        .Q(D[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[24] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[24]),
        .Q(D[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[25] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[25]),
        .Q(D[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[26] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[26]),
        .Q(D[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[27] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[27]),
        .Q(D[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[28] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[28]),
        .Q(D[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[29] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[29]),
        .Q(D[32]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[30] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[30]),
        .Q(D[33]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[3]),
        .Q(D[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[4]),
        .Q(D[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[5] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[5]),
        .Q(D[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[6] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[6]),
        .Q(D[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[7] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[7]),
        .Q(D[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[8] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[8]),
        .Q(D[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_src_address_reg[9] 
       (.C(s_axi_aclk),
        .CE(\up_dma_src_address_reg[30]_0 ),
        .D(Q[9]),
        .Q(D[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[10] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[10]),
        .Q(\up_dma_x_length_reg[23]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[11] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[11]),
        .Q(\up_dma_x_length_reg[23]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[12] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[12]),
        .Q(\up_dma_x_length_reg[23]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[13] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[13]),
        .Q(\up_dma_x_length_reg[23]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[14] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[14]),
        .Q(\up_dma_x_length_reg[23]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[15] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[15]),
        .Q(\up_dma_x_length_reg[23]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[16] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[16]),
        .Q(\up_dma_x_length_reg[23]_0 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[17] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[17]),
        .Q(\up_dma_x_length_reg[23]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[18] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[18]),
        .Q(\up_dma_x_length_reg[23]_0 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[19] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[19]),
        .Q(\up_dma_x_length_reg[23]_0 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[20] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[20]),
        .Q(\up_dma_x_length_reg[23]_0 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[21] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[21]),
        .Q(\up_dma_x_length_reg[23]_0 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[22] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[22]),
        .Q(\up_dma_x_length_reg[23]_0 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[23] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[23]),
        .Q(\up_dma_x_length_reg[23]_0 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[2]),
        .Q(D[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[3]),
        .Q(D[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[4]),
        .Q(D[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[5] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[5]),
        .Q(D[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[6] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[6]),
        .Q(D[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[7] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[7]),
        .Q(\up_dma_x_length_reg[23]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[8] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[8]),
        .Q(\up_dma_x_length_reg[23]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_dma_x_length_reg[9] 
       (.C(s_axi_aclk),
        .CE(\up_dma_x_length_reg[2]_1 ),
        .D(Q[9]),
        .Q(\up_dma_x_length_reg[23]_0 [2]),
        .R(SR));
  LUT4 #(
    .INIT(16'h70FF)) 
    \up_measured_transfer_length[23]_i_1 
       (.I0(up_response_valid),
        .I1(response_ready_reg_0),
        .I2(up_clear_tl),
        .I3(\s_axis_waddr_reg_reg[0] ),
        .O(\up_measured_transfer_length[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_2 
       (.I0(\up_measured_transfer_length_reg[23]_0 [5]),
        .I1(\up_measured_transfer_length_reg[7]_0 [6]),
        .O(\up_measured_transfer_length[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_3 
       (.I0(\up_measured_transfer_length_reg[23]_0 [4]),
        .I1(\up_measured_transfer_length_reg[7]_0 [5]),
        .O(\up_measured_transfer_length[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_4 
       (.I0(\up_measured_transfer_length_reg[23]_0 [3]),
        .I1(\up_measured_transfer_length_reg[7]_0 [4]),
        .O(\up_measured_transfer_length[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_5 
       (.I0(\up_measured_transfer_length_reg[23]_0 [2]),
        .I1(\up_measured_transfer_length_reg[7]_0 [3]),
        .O(\up_measured_transfer_length[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_6 
       (.I0(s_axis_data[2]),
        .I1(\up_measured_transfer_length_reg[7]_0 [2]),
        .O(\up_measured_transfer_length[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_7 
       (.I0(\up_measured_transfer_length_reg[23]_0 [1]),
        .I1(\up_measured_transfer_length_reg[7]_0 [1]),
        .O(\up_measured_transfer_length[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \up_measured_transfer_length[7]_i_8 
       (.I0(\up_measured_transfer_length_reg[23]_0 [0]),
        .I1(\up_measured_transfer_length_reg[7]_0 [0]),
        .O(\up_measured_transfer_length[7]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_15 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [0]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_13 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [9]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_12 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [10]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_11 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [11]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_10 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [12]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_9 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [13]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_8 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [14]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \up_measured_transfer_length_reg[15]_i_1 
       (.CI(\up_measured_transfer_length_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\up_measured_transfer_length_reg[15]_i_1_n_0 ,\up_measured_transfer_length_reg[15]_i_1_n_1 ,\up_measured_transfer_length_reg[15]_i_1_n_2 ,\up_measured_transfer_length_reg[15]_i_1_n_3 ,\up_measured_transfer_length_reg[15]_i_1_n_4 ,\up_measured_transfer_length_reg[15]_i_1_n_5 ,\up_measured_transfer_length_reg[15]_i_1_n_6 ,\up_measured_transfer_length_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\up_measured_transfer_length_reg[15]_i_1_n_8 ,\up_measured_transfer_length_reg[15]_i_1_n_9 ,\up_measured_transfer_length_reg[15]_i_1_n_10 ,\up_measured_transfer_length_reg[15]_i_1_n_11 ,\up_measured_transfer_length_reg[15]_i_1_n_12 ,\up_measured_transfer_length_reg[15]_i_1_n_13 ,\up_measured_transfer_length_reg[15]_i_1_n_14 ,\up_measured_transfer_length_reg[15]_i_1_n_15 }),
        .S(\up_measured_transfer_length_reg[23]_0 [14:7]));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[16] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_15 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [15]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[17] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_14 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [16]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[18] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_13 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [17]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[19] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_12 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [18]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_14 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [1]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[20] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_11 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [19]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[21] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_10 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [20]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[22] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_9 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [21]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[23] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[23]_i_2_n_8 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [22]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \up_measured_transfer_length_reg[23]_i_2 
       (.CI(\up_measured_transfer_length_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_up_measured_transfer_length_reg[23]_i_2_CO_UNCONNECTED [7],\up_measured_transfer_length_reg[23]_i_2_n_1 ,\up_measured_transfer_length_reg[23]_i_2_n_2 ,\up_measured_transfer_length_reg[23]_i_2_n_3 ,\up_measured_transfer_length_reg[23]_i_2_n_4 ,\up_measured_transfer_length_reg[23]_i_2_n_5 ,\up_measured_transfer_length_reg[23]_i_2_n_6 ,\up_measured_transfer_length_reg[23]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\up_measured_transfer_length_reg[23]_i_2_n_8 ,\up_measured_transfer_length_reg[23]_i_2_n_9 ,\up_measured_transfer_length_reg[23]_i_2_n_10 ,\up_measured_transfer_length_reg[23]_i_2_n_11 ,\up_measured_transfer_length_reg[23]_i_2_n_12 ,\up_measured_transfer_length_reg[23]_i_2_n_13 ,\up_measured_transfer_length_reg[23]_i_2_n_14 ,\up_measured_transfer_length_reg[23]_i_2_n_15 }),
        .S(\up_measured_transfer_length_reg[23]_0 [22:15]));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_13 ),
        .Q(s_axis_data[2]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_12 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [2]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_11 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [3]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_10 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [4]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_9 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [5]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[7]_i_1_n_8 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [6]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \up_measured_transfer_length_reg[7]_i_1 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\up_measured_transfer_length_reg[7]_i_1_n_0 ,\up_measured_transfer_length_reg[7]_i_1_n_1 ,\up_measured_transfer_length_reg[7]_i_1_n_2 ,\up_measured_transfer_length_reg[7]_i_1_n_3 ,\up_measured_transfer_length_reg[7]_i_1_n_4 ,\up_measured_transfer_length_reg[7]_i_1_n_5 ,\up_measured_transfer_length_reg[7]_i_1_n_6 ,\up_measured_transfer_length_reg[7]_i_1_n_7 }),
        .DI({1'b0,\up_measured_transfer_length_reg[23]_0 [5:2],s_axis_data[2],\up_measured_transfer_length_reg[23]_0 [1:0]}),
        .O({\up_measured_transfer_length_reg[7]_i_1_n_8 ,\up_measured_transfer_length_reg[7]_i_1_n_9 ,\up_measured_transfer_length_reg[7]_i_1_n_10 ,\up_measured_transfer_length_reg[7]_i_1_n_11 ,\up_measured_transfer_length_reg[7]_i_1_n_12 ,\up_measured_transfer_length_reg[7]_i_1_n_13 ,\up_measured_transfer_length_reg[7]_i_1_n_14 ,\up_measured_transfer_length_reg[7]_i_1_n_15 }),
        .S({\up_measured_transfer_length_reg[23]_0 [6],\up_measured_transfer_length[7]_i_2_n_0 ,\up_measured_transfer_length[7]_i_3_n_0 ,\up_measured_transfer_length[7]_i_4_n_0 ,\up_measured_transfer_length[7]_i_5_n_0 ,\up_measured_transfer_length[7]_i_6_n_0 ,\up_measured_transfer_length[7]_i_7_n_0 ,\up_measured_transfer_length[7]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_15 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [7]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_measured_transfer_length_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_measured_transfer_length_reg[15]_i_1_n_14 ),
        .Q(\up_measured_transfer_length_reg[23]_0 [8]),
        .R(\up_measured_transfer_length[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    up_partial_length_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_transfer_lenghts_fifo_n_3),
        .Q(up_partial_length_valid_reg_0[3]),
        .R(i_transfer_lenghts_fifo_n_0));
  LUT6 #(
    .INIT(64'h0033308800003088)) 
    \up_rdata[2]_i_6 
       (.I0(D[1]),
        .I1(\up_rdata[2]_i_4 [0]),
        .I2(data5),
        .I3(\up_rdata[2]_i_4 [1]),
        .I4(\up_rdata[2]_i_4 [2]),
        .I5(s_axis_data[2]),
        .O(\up_dma_x_length_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    up_tlf_s_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_transfer_lenghts_fifo_n_1),
        .Q(up_tlf_s_valid_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFF8F88888888)) 
    \up_transfer_done_bitmap[0]_i_1 
       (.I0(\up_transfer_done_bitmap[0]_i_2_n_0 ),
        .I1(up_eot),
        .I2(up_sot),
        .I3(\up_transfer_id_reg[1]_0 [0]),
        .I4(\up_transfer_id_reg[1]_0 [1]),
        .I5(up_partial_length_valid_reg_0[0]),
        .O(\up_transfer_done_bitmap[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \up_transfer_done_bitmap[0]_i_2 
       (.I0(\up_transfer_id_eot_reg[1]_0 [1]),
        .I1(\up_transfer_id_eot_reg[1]_0 [0]),
        .O(\up_transfer_done_bitmap[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF8FFFFF88888888)) 
    \up_transfer_done_bitmap[1]_i_1 
       (.I0(\up_transfer_done_bitmap[1]_i_2_n_0 ),
        .I1(up_eot),
        .I2(up_sot),
        .I3(\up_transfer_id_reg[1]_0 [1]),
        .I4(\up_transfer_id_reg[1]_0 [0]),
        .I5(up_partial_length_valid_reg_0[1]),
        .O(\up_transfer_done_bitmap[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \up_transfer_done_bitmap[1]_i_2 
       (.I0(\up_transfer_id_eot_reg[1]_0 [0]),
        .I1(\up_transfer_id_eot_reg[1]_0 [1]),
        .O(\up_transfer_done_bitmap[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF8FFFFF88888888)) 
    \up_transfer_done_bitmap[2]_i_1 
       (.I0(\up_transfer_done_bitmap[2]_i_2_n_0 ),
        .I1(up_eot),
        .I2(up_sot),
        .I3(\up_transfer_id_reg[1]_0 [0]),
        .I4(\up_transfer_id_reg[1]_0 [1]),
        .I5(data5),
        .O(\up_transfer_done_bitmap[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \up_transfer_done_bitmap[2]_i_2 
       (.I0(\up_transfer_id_eot_reg[1]_0 [1]),
        .I1(\up_transfer_id_eot_reg[1]_0 [0]),
        .O(\up_transfer_done_bitmap[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8FFFFFFF88888888)) 
    \up_transfer_done_bitmap[3]_i_1 
       (.I0(\up_transfer_done_bitmap[3]_i_2_n_0 ),
        .I1(up_eot),
        .I2(up_sot),
        .I3(\up_transfer_id_reg[1]_0 [0]),
        .I4(\up_transfer_id_reg[1]_0 [1]),
        .I5(up_partial_length_valid_reg_0[2]),
        .O(\up_transfer_done_bitmap[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \up_transfer_done_bitmap[3]_i_2 
       (.I0(\up_transfer_id_eot_reg[1]_0 [1]),
        .I1(\up_transfer_id_eot_reg[1]_0 [0]),
        .O(\up_transfer_done_bitmap[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_done_bitmap_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_transfer_done_bitmap[0]_i_1_n_0 ),
        .Q(up_partial_length_valid_reg_0[0]),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_done_bitmap_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_transfer_done_bitmap[1]_i_1_n_0 ),
        .Q(up_partial_length_valid_reg_0[1]),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_done_bitmap_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_transfer_done_bitmap[2]_i_1_n_0 ),
        .Q(data5),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_done_bitmap_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_transfer_done_bitmap[3]_i_1_n_0 ),
        .Q(up_partial_length_valid_reg_0[2]),
        .R(i_transfer_lenghts_fifo_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \up_transfer_id[0]_i_1 
       (.I0(\up_transfer_id_reg[1]_0 [0]),
        .O(\up_transfer_id[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \up_transfer_id[1]_i_2 
       (.I0(\up_transfer_id_reg[1]_0 [0]),
        .I1(\up_transfer_id_reg[1]_0 [1]),
        .O(\up_transfer_id[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \up_transfer_id_eot[0]_i_1 
       (.I0(\up_transfer_id_eot_reg[1]_0 [0]),
        .O(\up_transfer_id_eot[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \up_transfer_id_eot[1]_i_2 
       (.I0(\up_transfer_id_eot_reg[1]_0 [0]),
        .I1(\up_transfer_id_eot_reg[1]_0 [1]),
        .O(\up_transfer_id_eot[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_eot_d_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_transfer_id_eot_reg[1]_0 [0]),
        .Q(s_axis_data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_eot_d_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\up_transfer_id_eot_reg[1]_0 [1]),
        .Q(s_axis_data[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_eot_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_eot),
        .D(\up_transfer_id_eot[0]_i_1_n_0 ),
        .Q(\up_transfer_id_eot_reg[1]_0 [0]),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_eot_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_eot),
        .D(\up_transfer_id_eot[1]_i_2_n_0 ),
        .Q(\up_transfer_id_eot_reg[1]_0 [1]),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_sot),
        .D(\up_transfer_id[0]_i_1_n_0 ),
        .Q(\up_transfer_id_reg[1]_0 [0]),
        .R(i_transfer_lenghts_fifo_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \up_transfer_id_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_sot),
        .D(\up_transfer_id[1]_i_2_n_0 ),
        .Q(\up_transfer_id_reg[1]_0 [1]),
        .R(i_transfer_lenghts_fifo_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_reset_manager
   (do_enable_reg_0,
    \reset_gen[0].reset_sync_reg[0]_0 ,
    Q,
    dest_enable,
    needs_reset_reg_0,
    src_enable,
    SR,
    \reset_gen[1].reset_sync_reg[0]_0 ,
    \reset_gen[2].reset_sync_reg[0]_0 ,
    \state_reg[1]_0 ,
    m_axis_aclk,
    s_axi_aclk,
    m_src_axi_aclk,
    dest_enabled,
    enabled,
    ctrl_pause,
    E,
    m_src_axi_rlast,
    m_src_axi_rvalid,
    ctrl_enable,
    SS);
  output do_enable_reg_0;
  output [0:0]\reset_gen[0].reset_sync_reg[0]_0 ;
  output [0:0]Q;
  output dest_enable;
  output [3:0]needs_reset_reg_0;
  output src_enable;
  output [0:0]SR;
  output [0:0]\reset_gen[1].reset_sync_reg[0]_0 ;
  output [0:0]\reset_gen[2].reset_sync_reg[0]_0 ;
  output [1:0]\state_reg[1]_0 ;
  input m_axis_aclk;
  input s_axi_aclk;
  input m_src_axi_aclk;
  input dest_enabled;
  input enabled;
  input ctrl_pause;
  input [0:0]E;
  input m_src_axi_rlast;
  input m_src_axi_rvalid;
  input ctrl_enable;
  input [0:0]SS;

  wire [0:0]E;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[5]_i_5_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire [0:0]Q;
  wire [0:0]SR;
  wire [0:0]SS;
  wire ctrl_enable;
  wire ctrl_pause;
  wire dest_enable;
  wire dest_enabled;
  wire do_enable0;
  wire do_enable_reg_0;
  wire do_reset;
  wire do_reset_0;
  wire enabled;
  wire m_axis_aclk;
  wire m_src_axi_aclk;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire needs_reset;
  wire needs_reset_i_1_n_0;
  wire [3:0]needs_reset_reg_0;
  wire \reset_gen[0].reset_async_reg_n_0_[0] ;
  wire \reset_gen[0].reset_async_reg_n_0_[1] ;
  wire \reset_gen[0].reset_async_reg_n_0_[2] ;
  wire \reset_gen[0].reset_async_reg_n_0_[3] ;
  wire \reset_gen[0].reset_sync_in ;
  wire [0:0]\reset_gen[0].reset_sync_reg[0]_0 ;
  wire \reset_gen[0].reset_sync_reg_n_0_[1] ;
  wire \reset_gen[1].reset_async_reg_n_0_[0] ;
  wire \reset_gen[1].reset_async_reg_n_0_[1] ;
  wire \reset_gen[1].reset_async_reg_n_0_[2] ;
  wire \reset_gen[1].reset_async_reg_n_0_[3] ;
  wire \reset_gen[1].reset_sync_in ;
  wire [0:0]\reset_gen[1].reset_sync_reg[0]_0 ;
  wire \reset_gen[1].reset_sync_reg_n_0_[1] ;
  wire \reset_gen[2].reset_async_reg_n_0_[0] ;
  wire \reset_gen[2].reset_async_reg_n_0_[1] ;
  wire \reset_gen[2].reset_async_reg_n_0_[2] ;
  wire \reset_gen[2].reset_async_reg_n_0_[3] ;
  wire \reset_gen[2].reset_sync_in ;
  wire [0:0]\reset_gen[2].reset_sync_reg[0]_0 ;
  wire \reset_gen[2].reset_sync_reg_n_0_[1] ;
  wire s_axi_aclk;
  wire src_enable;
  wire state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire [1:0]\state_reg[1]_0 ;

  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(needs_reset_reg_0[3]),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(needs_reset),
        .I1(\FSM_onehot_state_reg_n_0_[5] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(needs_reset_reg_0[3]),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \FSM_onehot_state[5]_i_5 
       (.I0(needs_reset),
        .I1(\reset_gen[2].reset_sync_reg[0]_0 ),
        .I2(ctrl_enable),
        .O(\FSM_onehot_state[5]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(do_reset_0),
        .S(SS));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(do_reset_0),
        .Q(needs_reset),
        .R(SS));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(SS));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(SS));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(SS));
  (* FSM_ENCODED_STATES = "STATE_RESET:000010,STATE_DISABLED:000100,STATE_ENABLED:010000,STATE_SHUTDOWN:100000,STATE_STARTUP:001000,STATE_DO_RESET:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(SS));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \acked[1]_i_1 
       (.I0(Q),
        .I1(E),
        .O(SR));
  LUT2 #(
    .INIT(4'hE)) 
    do_enable_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .O(do_enable0));
  FDRE #(
    .INIT(1'b0)) 
    do_enable_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_enable0),
        .Q(do_enable_reg_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    do_reset_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(do_reset_0),
        .Q(do_reset),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__7 i_sync_control_dest
       (.\cdc_sync_stage1_reg[0]_0 (do_enable_reg_0),
        .dest_enable(dest_enable),
        .m_axis_aclk(m_axis_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__8 i_sync_control_src
       (.\cdc_sync_stage1_reg[0]_0 (do_enable_reg_0),
        .m_src_axi_aclk(m_src_axi_aclk),
        .src_enable(src_enable));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__9 i_sync_status_dest
       (.E(state),
        .\FSM_onehot_state[5]_i_2_0 (needs_reset_reg_0[2]),
        .\FSM_onehot_state[5]_i_2_1 (do_enable_reg_0),
        .Q({\FSM_onehot_state_reg_n_0_[5] ,\FSM_onehot_state_reg_n_0_[4] ,\FSM_onehot_state_reg_n_0_[3] ,\FSM_onehot_state_reg_n_0_[2] ,do_reset_0}),
        .\cdc_sync_stage2_reg[0]_0 (needs_reset_reg_0[1]),
        .ctrl_pause(ctrl_pause),
        .dest_enabled(dest_enabled),
        .s_axi_aclk(s_axi_aclk),
        .\state_reg[0] (needs_reset_reg_0[3]),
        .\state_reg[0]_0 (\FSM_onehot_state[5]_i_5_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits i_sync_status_src
       (.\cdc_sync_stage2_reg[0]_0 (needs_reset_reg_0[2]),
        .enabled(enabled),
        .s_axi_aclk(s_axi_aclk));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    needs_reset_i_1
       (.I0(ctrl_enable),
        .I1(needs_reset_reg_0[3]),
        .I2(needs_reset),
        .O(needs_reset_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    needs_reset_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(needs_reset_i_1_n_0),
        .Q(needs_reset_reg_0[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_async_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_async_reg_n_0_[1] ),
        .PRE(do_reset),
        .Q(\reset_gen[0].reset_async_reg_n_0_[0] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_async_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_async_reg_n_0_[2] ),
        .PRE(do_reset),
        .Q(\reset_gen[0].reset_async_reg_n_0_[1] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_async_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_async_reg_n_0_[3] ),
        .PRE(do_reset),
        .Q(\reset_gen[0].reset_async_reg_n_0_[2] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_async_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(do_reset),
        .Q(\reset_gen[0].reset_async_reg_n_0_[3] ));
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_sync_in_reg 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_async_reg_n_0_[0] ),
        .PRE(\reset_gen[2].reset_async_reg_n_0_[0] ),
        .Q(\reset_gen[0].reset_sync_in ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_sync_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_sync_reg_n_0_[1] ),
        .Q(\reset_gen[0].reset_sync_reg[0]_0 ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[0].reset_sync_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_sync_in ),
        .Q(\reset_gen[0].reset_sync_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_async_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_async_reg_n_0_[1] ),
        .PRE(do_reset),
        .Q(\reset_gen[1].reset_async_reg_n_0_[0] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_async_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_async_reg_n_0_[2] ),
        .PRE(do_reset),
        .Q(\reset_gen[1].reset_async_reg_n_0_[1] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_async_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_async_reg_n_0_[3] ),
        .PRE(do_reset),
        .Q(\reset_gen[1].reset_async_reg_n_0_[2] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_async_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[0].reset_async_reg_n_0_[0] ),
        .PRE(do_reset),
        .Q(\reset_gen[1].reset_async_reg_n_0_[3] ));
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_sync_in_reg 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_async_reg_n_0_[0] ),
        .PRE(\reset_gen[0].reset_sync_reg[0]_0 ),
        .Q(\reset_gen[1].reset_sync_in ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_sync_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_sync_reg_n_0_[1] ),
        .Q(Q),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[1].reset_sync_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_sync_in ),
        .Q(\reset_gen[1].reset_sync_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_async_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_async_reg_n_0_[1] ),
        .PRE(do_reset),
        .Q(\reset_gen[2].reset_async_reg_n_0_[0] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_async_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_async_reg_n_0_[2] ),
        .PRE(do_reset),
        .Q(\reset_gen[2].reset_async_reg_n_0_[1] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_async_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_async_reg_n_0_[3] ),
        .PRE(do_reset),
        .Q(\reset_gen[2].reset_async_reg_n_0_[2] ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_async_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[1].reset_async_reg_n_0_[0] ),
        .PRE(do_reset),
        .Q(\reset_gen[2].reset_async_reg_n_0_[3] ));
  FDPE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_sync_in_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_async_reg_n_0_[0] ),
        .PRE(Q),
        .Q(\reset_gen[2].reset_sync_in ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_sync_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_sync_reg_n_0_[1] ),
        .Q(\reset_gen[2].reset_sync_reg[0]_0 ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \reset_gen[2].reset_sync_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\reset_gen[2].reset_sync_in ),
        .Q(\reset_gen[2].reset_sync_reg_n_0_[1] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \src_beat_counter[3]_i_1 
       (.I0(Q),
        .I1(m_src_axi_rlast),
        .I2(m_src_axi_rvalid),
        .O(\reset_gen[1].reset_sync_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \state[0]_i_1 
       (.I0(\state_reg[1]_0 [0]),
        .I1(needs_reset_reg_0[3]),
        .I2(\state_reg[1]_0 [1]),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h26)) 
    \state[1]_i_1 
       (.I0(\state_reg[1]_0 [0]),
        .I1(\state_reg[1]_0 [1]),
        .I2(needs_reset_reg_0[3]),
        .O(\state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \state[2]_i_1 
       (.I0(\state_reg[1]_0 [1]),
        .I1(\state_reg[1]_0 [0]),
        .I2(needs_reset_reg_0[0]),
        .O(\state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg[1]_0 [0]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg[1]_0 [1]),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(s_axi_aclk),
        .CE(state),
        .D(\state[2]_i_1_n_0 ),
        .Q(needs_reset_reg_0[0]),
        .R(SS));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_response_manager
   (up_response_valid,
    up_eot,
    response_valid_reg_0,
    up_bl_partial,
    id0,
    dma_req_eot,
    \measured_burst_length_reg[6]_0 ,
    Q,
    s_axi_aclk,
    \cdc_sync_stage2_reg[0] ,
    m_axis_aclk,
    response_eot,
    up_dma_req_cyclic,
    p_3_in,
    up_response_ready,
    dest_response_valid);
  output up_response_valid;
  output up_eot;
  output [0:0]response_valid_reg_0;
  output up_bl_partial;
  output id0;
  output dma_req_eot;
  output [6:0]\measured_burst_length_reg[6]_0 ;
  input [0:0]Q;
  input s_axi_aclk;
  input [0:0]\cdc_sync_stage2_reg[0] ;
  input m_axis_aclk;
  input response_eot;
  input up_dma_req_cyclic;
  input [0:0]p_3_in;
  input up_response_ready;
  input dest_response_valid;

  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire [0:0]Q;
  wire [0:0]\cdc_sync_stage2_reg[0] ;
  wire dest_response_valid;
  wire dma_req_eot;
  wire i_dest_response_fifo_n_14;
  wire i_dest_response_fifo_n_15;
  wire i_dest_response_fifo_n_8;
  wire id0;
  wire m_axis_aclk;
  wire \measured_burst_length[6]_i_1_n_0 ;
  wire \measured_burst_length[6]_i_2_n_0 ;
  wire [6:0]\measured_burst_length_reg[6]_0 ;
  wire nx_state15_in;
  wire [2:0]nx_state__0;
  wire [0:0]p_3_in;
  wire req_eot;
  wire req_eot0;
  wire [6:0]req_response_dest_data_burst_length;
  wire req_response_partial;
  wire [6:0]response_dest_data_burst_length;
  wire response_dest_partial;
  wire response_dest_ready;
  wire response_dest_ready_i_6_n_0;
  wire response_dest_ready_i_8_n_0;
  wire response_eot;
  wire [0:0]response_valid_reg_0;
  wire s_axi_aclk;
  wire [2:0]state;
  wire [2:2]state_reg;
  wire [1:0]to_complete_count;
  wire to_complete_count0__0;
  wire \to_complete_count[0]_i_1_n_0 ;
  wire \to_complete_count[1]_i_2_n_0 ;
  wire [1:0]transfer_id;
  wire transfer_id0;
  wire \transfer_id[0]_i_1_n_0 ;
  wire \transfer_id[1]_i_2_n_0 ;
  wire up_bl_partial;
  wire up_dma_req_cyclic;
  wire up_eot;
  wire up_response_ready;
  wire up_response_valid;

  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(transfer_id[0]),
        .I1(transfer_id[1]),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(to_complete_count[0]),
        .I1(to_complete_count[1]),
        .O(nx_state15_in));
  (* FSM_ENCODED_STATES = "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(nx_state__0[0]),
        .Q(state[0]),
        .R(Q));
  (* FSM_ENCODED_STATES = "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(nx_state__0[1]),
        .Q(state[1]),
        .R(Q));
  (* FSM_ENCODED_STATES = "STATE_WRITE_RESPR:010,STATE_ACC:001,STATE_WRITE_ZRCMPL:100,STATE_IDLE:000,STATE_ZERO_COMPL:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(nx_state__0[2]),
        .Q(state[2]),
        .R(Q));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized2 i_dest_response_fifo
       (.D(nx_state__0),
        .E(req_eot0),
        .\FSM_sequential_state_reg[1] (\FSM_sequential_state[1]_i_4_n_0 ),
        .\FSM_sequential_state_reg[2] (i_dest_response_fifo_n_14),
        .\FSM_sequential_state_reg[2]_0 (state),
        .\FSM_sequential_state_reg[2]_1 (transfer_id),
        .Q(Q),
        .\cdc_sync_stage2_reg[0] (\cdc_sync_stage2_reg[0] ),
        .dest_response_valid(dest_response_valid),
        .id0(id0),
        .m_axis_aclk(m_axis_aclk),
        .nx_state15_in(nx_state15_in),
        .out({response_dest_data_burst_length,response_dest_partial,i_dest_response_fifo_n_8}),
        .response_dest_ready(response_dest_ready),
        .response_dest_ready_reg(response_dest_ready_i_8_n_0),
        .response_dest_ready_reg_0(response_dest_ready_i_6_n_0),
        .response_eot(response_eot),
        .response_ready_reg(i_dest_response_fifo_n_15),
        .s_axi_aclk(s_axi_aclk),
        .state_reg(state_reg),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid));
  LUT3 #(
    .INIT(8'h40)) 
    \measured_burst_length[6]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(\measured_burst_length[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \measured_burst_length[6]_i_2 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .O(\measured_burst_length[6]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[0] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[0]),
        .Q(\measured_burst_length_reg[6]_0 [0]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[1] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[1]),
        .Q(\measured_burst_length_reg[6]_0 [1]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[2] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[2]),
        .Q(\measured_burst_length_reg[6]_0 [2]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[3] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[3]),
        .Q(\measured_burst_length_reg[6]_0 [3]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[4] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[4]),
        .Q(\measured_burst_length_reg[6]_0 [4]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[5] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[5]),
        .Q(\measured_burst_length_reg[6]_0 [5]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \measured_burst_length_reg[6] 
       (.C(s_axi_aclk),
        .CE(\measured_burst_length[6]_i_2_n_0 ),
        .D(req_response_dest_data_burst_length[6]),
        .Q(\measured_burst_length_reg[6]_0 [6]),
        .S(\measured_burst_length[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    req_eot_reg
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(i_dest_response_fifo_n_8),
        .Q(req_eot),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[0] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[0]),
        .Q(req_response_dest_data_burst_length[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[1] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[1]),
        .Q(req_response_dest_data_burst_length[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[2] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[2]),
        .Q(req_response_dest_data_burst_length[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[3] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[3]),
        .Q(req_response_dest_data_burst_length[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[4] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[4]),
        .Q(req_response_dest_data_burst_length[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[5] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[5]),
        .Q(req_response_dest_data_burst_length[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \req_response_dest_data_burst_length_reg[6] 
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_data_burst_length[6]),
        .Q(req_response_dest_data_burst_length[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    req_response_partial_reg
       (.C(s_axi_aclk),
        .CE(req_eot0),
        .D(response_dest_partial),
        .Q(req_response_partial),
        .R(Q));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h02)) 
    response_dest_ready_i_10
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(state_reg));
  LUT6 #(
    .INIT(64'h0004000022262222)) 
    response_dest_ready_i_6
       (.I0(state[0]),
        .I1(nx_state15_in),
        .I2(transfer_id[1]),
        .I3(transfer_id[0]),
        .I4(up_response_ready),
        .I5(state[2]),
        .O(response_dest_ready_i_6_n_0));
  LUT6 #(
    .INIT(64'h4000400062774000)) 
    response_dest_ready_i_8
       (.I0(state[0]),
        .I1(nx_state15_in),
        .I2(\FSM_sequential_state[1]_i_4_n_0 ),
        .I3(up_response_ready),
        .I4(state[1]),
        .I5(state[2]),
        .O(response_dest_ready_i_8_n_0));
  FDSE #(
    .INIT(1'b1)) 
    response_dest_ready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_dest_response_fifo_n_14),
        .Q(response_dest_ready),
        .S(Q));
  FDRE #(
    .INIT(1'b0)) 
    response_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_dest_response_fifo_n_15),
        .Q(up_response_valid),
        .R(Q));
  LUT1 #(
    .INIT(2'h1)) 
    \to_complete_count[0]_i_1 
       (.I0(to_complete_count[0]),
        .O(\to_complete_count[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \to_complete_count[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(up_response_ready),
        .O(to_complete_count0__0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \to_complete_count[1]_i_2 
       (.I0(to_complete_count[0]),
        .I1(to_complete_count[1]),
        .O(\to_complete_count[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \to_complete_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(to_complete_count0__0),
        .D(\to_complete_count[0]_i_1_n_0 ),
        .Q(to_complete_count[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \to_complete_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(to_complete_count0__0),
        .D(\to_complete_count[1]_i_2_n_0 ),
        .Q(to_complete_count[1]),
        .R(Q));
  LUT1 #(
    .INIT(2'h1)) 
    \transfer_id[0]_i_1 
       (.I0(transfer_id[0]),
        .O(\transfer_id[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000AC0)) 
    \transfer_id[1]_i_1 
       (.I0(req_eot),
        .I1(up_response_ready),
        .I2(state[2]),
        .I3(state[0]),
        .I4(state[1]),
        .O(transfer_id0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \transfer_id[1]_i_2 
       (.I0(transfer_id[0]),
        .I1(transfer_id[1]),
        .O(\transfer_id[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \transfer_id_reg[0] 
       (.C(s_axi_aclk),
        .CE(transfer_id0),
        .D(\transfer_id[0]_i_1_n_0 ),
        .Q(transfer_id[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \transfer_id_reg[1] 
       (.C(s_axi_aclk),
        .CE(transfer_id0),
        .D(\transfer_id[1]_i_2_n_0 ),
        .Q(transfer_id[1]),
        .R(Q));
  LUT2 #(
    .INIT(4'h8)) 
    up_clear_tl_i_1
       (.I0(up_response_valid),
        .I1(up_response_ready),
        .O(response_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    up_clear_tl_i_2
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(req_eot),
        .O(dma_req_eot));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    up_tlf_s_valid_i_2
       (.I0(req_response_partial),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[0]),
        .I4(response_valid_reg_0),
        .I5(p_3_in),
        .O(up_bl_partial));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \up_transfer_id_eot[1]_i_1 
       (.I0(response_valid_reg_0),
        .I1(up_dma_req_cyclic),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(req_eot),
        .O(up_eot));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_transfer
   (m_axis_data,
    Q,
    needs_reset_reg,
    \reset_gen[0].reset_sync_reg[0] ,
    \reset_gen[1].reset_sync_reg[0] ,
    addr_valid_reg,
    \id_reg[3] ,
    \response_id_reg[3] ,
    \response_id_reg[2] ,
    \response_id_reg[1] ,
    \response_id_reg[0] ,
    ADDRD,
    ADDRC,
    m_src_axi_araddr,
    active_reg,
    m_axis_user,
    up_response_valid,
    up_eot,
    E,
    up_bl_partial,
    m_axis_valid,
    up_sot,
    \cdc_sync_stage2_reg[3] ,
    \cdc_sync_stage2_reg[1] ,
    \cdc_sync_stage2_reg[0] ,
    m_axis_last,
    dma_req_eot,
    m_src_axi_arlen,
    \measured_burst_length_reg[6] ,
    m_axis_aclk,
    m_src_axi_aclk,
    m_src_axi_rdata,
    m_src_axi_rvalid,
    s_axi_aclk,
    m_axis_ready,
    up_dma_req_cyclic,
    p_3_in,
    up_response_ready,
    ctrl_pause,
    m_src_axi_arready,
    m_src_axi_rlast,
    up_dma_req_valid,
    ctrl_enable,
    \up_rdata_reg[1] ,
    \up_rdata_reg[1]_0 ,
    up_dma_req_x_length,
    SS,
    D);
  output [31:0]m_axis_data;
  output [0:0]Q;
  output [4:0]needs_reset_reg;
  output [0:0]\reset_gen[0].reset_sync_reg[0] ;
  output [0:0]\reset_gen[1].reset_sync_reg[0] ;
  output addr_valid_reg;
  output [5:0]\id_reg[3] ;
  output \response_id_reg[3] ;
  output \response_id_reg[2] ;
  output \response_id_reg[1] ;
  output \response_id_reg[0] ;
  output [3:0]ADDRD;
  output [3:0]ADDRC;
  output [27:0]m_src_axi_araddr;
  output active_reg;
  output [0:0]m_axis_user;
  output up_response_valid;
  output up_eot;
  output [0:0]E;
  output up_bl_partial;
  output m_axis_valid;
  output up_sot;
  output [1:0]\cdc_sync_stage2_reg[3] ;
  output \cdc_sync_stage2_reg[1] ;
  output \cdc_sync_stage2_reg[0] ;
  output m_axis_last;
  output dma_req_eot;
  output [3:0]m_src_axi_arlen;
  output [6:0]\measured_burst_length_reg[6] ;
  input m_axis_aclk;
  input m_src_axi_aclk;
  input [63:0]m_src_axi_rdata;
  input m_src_axi_rvalid;
  input s_axi_aclk;
  input m_axis_ready;
  input up_dma_req_cyclic;
  input [0:0]p_3_in;
  input up_response_ready;
  input ctrl_pause;
  input m_src_axi_arready;
  input m_src_axi_rlast;
  input up_dma_req_valid;
  input ctrl_enable;
  input \up_rdata_reg[1] ;
  input \up_rdata_reg[1]_0 ;
  input [21:0]up_dma_req_x_length;
  input [0:0]SS;
  input [57:0]D;

  wire [3:0]ADDRC;
  wire [3:0]ADDRD;
  wire [57:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SS;
  wire active_reg;
  wire addr_valid_reg;
  wire \cdc_sync_stage2_reg[0] ;
  wire \cdc_sync_stage2_reg[1] ;
  wire [1:0]\cdc_sync_stage2_reg[3] ;
  wire ctrl_enable;
  wire ctrl_pause;
  wire [1:0]dbg_status;
  wire dest_enable;
  wire dest_enabled;
  wire dma_req_eot;
  wire enabled;
  wire i_reset_manager_n_9;
  wire \i_store_and_forward/src_beat_counter0 ;
  wire [5:0]\id_reg[3] ;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_last;
  wire m_axis_ready;
  wire [0:0]m_axis_user;
  wire m_axis_valid;
  wire m_src_axi_aclk;
  wire [27:0]m_src_axi_araddr;
  wire [3:0]m_src_axi_arlen;
  wire m_src_axi_arready;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire [6:0]\measured_burst_length_reg[6] ;
  wire [4:0]needs_reset_reg;
  wire [0:0]p_3_in;
  wire [0:0]\reset_gen[0].reset_sync_reg[0] ;
  wire [0:0]\reset_gen[1].reset_sync_reg[0] ;
  wire \response_id_reg[0] ;
  wire \response_id_reg[1] ;
  wire \response_id_reg[2] ;
  wire \response_id_reg[3] ;
  wire s_axi_aclk;
  wire src_enable;
  wire src_req_dest_address_cur0;
  wire up_bl_partial;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire [21:0]up_dma_req_x_length;
  wire up_eot;
  wire \up_rdata_reg[1] ;
  wire \up_rdata_reg[1]_0 ;
  wire up_response_ready;
  wire up_response_valid;
  wire up_sot;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_request_arb i_request_arb
       (.D(D),
        .E(src_req_dest_address_cur0),
        .Q(Q),
        .SR(i_reset_manager_n_9),
        .active_reg(active_reg),
        .addr_valid_reg(addr_valid_reg),
        .\cdc_sync_stage2_reg[0] (\cdc_sync_stage2_reg[0] ),
        .\cdc_sync_stage2_reg[1] (\cdc_sync_stage2_reg[1] ),
        .\cdc_sync_stage2_reg[3] (\cdc_sync_stage2_reg[3] ),
        .\cdc_sync_stage2_reg[3]_0 (\id_reg[3] [1:0]),
        .dest_enable(dest_enable),
        .dest_enabled(dest_enabled),
        .dest_mem_data_valid_reg(\reset_gen[0].reset_sync_reg[0] ),
        .dma_req_eot(dma_req_eot),
        .enabled(enabled),
        .g(\id_reg[3] [5:2]),
        .id({\response_id_reg[3] ,\response_id_reg[2] ,\response_id_reg[1] ,\response_id_reg[0] }),
        .\id_reg[0] (ADDRC[0]),
        .\id_reg[1] (ADDRC[1]),
        .\id_reg[2] (ADDRC[2]),
        .\id_reg[3] (ADDRD),
        .\id_reg[3]_0 (ADDRC[3]),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_data(m_axis_data),
        .m_axis_last(m_axis_last),
        .m_axis_ready(m_axis_ready),
        .m_axis_user(m_axis_user),
        .m_axis_valid(m_axis_valid),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_araddr(m_src_axi_araddr),
        .m_src_axi_arlen(m_src_axi_arlen),
        .m_src_axi_arready(m_src_axi_arready),
        .m_src_axi_rdata(m_src_axi_rdata),
        .m_src_axi_rlast(m_src_axi_rlast),
        .m_src_axi_rvalid(m_src_axi_rvalid),
        .\measured_burst_length_reg[6] (\measured_burst_length_reg[6] ),
        .p_3_in(p_3_in),
        .response_valid_reg(E),
        .s_axi_aclk(s_axi_aclk),
        .\src_beat_counter_reg[0] (\i_store_and_forward/src_beat_counter0 ),
        .src_enable(src_enable),
        .src_id_reduced_msb_reg(\reset_gen[1].reset_sync_reg[0] ),
        .up_bl_partial(up_bl_partial),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_dma_req_x_length(up_dma_req_x_length),
        .up_eot(up_eot),
        .\up_rdata_reg[1] (\up_rdata_reg[1] ),
        .\up_rdata_reg[1]_0 (\up_rdata_reg[1]_0 ),
        .\up_rdata_reg[1]_1 (dbg_status),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid),
        .up_sot(up_sot),
        .\up_transfer_id_reg[0] (needs_reset_reg[3]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_reset_manager i_reset_manager
       (.E(src_req_dest_address_cur0),
        .Q(\reset_gen[1].reset_sync_reg[0] ),
        .SR(i_reset_manager_n_9),
        .SS(SS),
        .ctrl_enable(ctrl_enable),
        .ctrl_pause(ctrl_pause),
        .dest_enable(dest_enable),
        .dest_enabled(dest_enabled),
        .do_enable_reg_0(needs_reset_reg[3]),
        .enabled(enabled),
        .m_axis_aclk(m_axis_aclk),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_rlast(m_src_axi_rlast),
        .m_src_axi_rvalid(m_src_axi_rvalid),
        .needs_reset_reg_0({needs_reset_reg[4],needs_reset_reg[2:0]}),
        .\reset_gen[0].reset_sync_reg[0]_0 (\reset_gen[0].reset_sync_reg[0] ),
        .\reset_gen[1].reset_sync_reg[0]_0 (\i_store_and_forward/src_beat_counter0 ),
        .\reset_gen[2].reset_sync_reg[0]_0 (Q),
        .s_axi_aclk(s_axi_aclk),
        .src_enable(src_enable),
        .\state_reg[1]_0 (dbg_status));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dest_axi_stream
   (\id_reg[0]_0 ,
    \id_reg[1]_0 ,
    \id_reg[2]_0 ,
    \id_reg[3]_0 ,
    \response_id_reg[3] ,
    \response_id_reg[2] ,
    \response_id_reg[1] ,
    \response_id_reg[0] ,
    dest_enabled,
    active_reg_0,
    m_axis_user,
    dest_response_valid,
    m_axis_last,
    dest_req_ready,
    out,
    m_axis_aclk,
    \response_id_reg[0]_0 ,
    id0,
    active_reg_1,
    m_axis_ready,
    dest_fifo_last,
    data_eot,
    dest_enable,
    dest_fifo_valid);
  output \id_reg[0]_0 ;
  output \id_reg[1]_0 ;
  output \id_reg[2]_0 ;
  output \id_reg[3]_0 ;
  output \response_id_reg[3] ;
  output \response_id_reg[2] ;
  output \response_id_reg[1] ;
  output \response_id_reg[0] ;
  output dest_enabled;
  output active_reg_0;
  output [0:0]m_axis_user;
  output dest_response_valid;
  output m_axis_last;
  input dest_req_ready;
  input [1:0]out;
  input m_axis_aclk;
  input [0:0]\response_id_reg[0]_0 ;
  input id0;
  input active_reg_1;
  input m_axis_ready;
  input dest_fifo_last;
  input data_eot;
  input dest_enable;
  input dest_fifo_valid;

  wire active_reg_0;
  wire active_reg_1;
  wire data_enabled;
  wire data_enabled_i_1_n_0;
  wire data_eot;
  wire dest_enable;
  wire dest_enabled;
  wire dest_fifo_last;
  wire dest_fifo_valid;
  wire dest_req_ready;
  wire dest_response_valid;
  wire id0;
  wire \id[0]_i_2_n_0 ;
  wire \id[3]_i_1__1_n_0 ;
  wire \id_reg[0]_0 ;
  wire \id_reg[1]_0 ;
  wire \id_reg[2]_0 ;
  wire \id_reg[3]_0 ;
  wire [2:1]inc_id_return;
  wire m_axis_aclk;
  wire m_axis_last;
  wire m_axis_ready;
  wire [0:0]m_axis_user;
  wire \m_axis_user[0]_i_1_n_0 ;
  wire [1:0]out;
  wire p_4_in;
  wire req_islast_d;
  wire req_xlast_d;
  wire \response_id_reg[0] ;
  wire [0:0]\response_id_reg[0]_0 ;
  wire \response_id_reg[1] ;
  wire \response_id_reg[2] ;
  wire \response_id_reg[3] ;

  FDRE #(
    .INIT(1'b0)) 
    active_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(active_reg_1),
        .Q(active_reg_0),
        .R(\response_id_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hAAEAAAAA)) 
    data_enabled_i_1
       (.I0(dest_enable),
        .I1(dest_fifo_valid),
        .I2(active_reg_0),
        .I3(m_axis_ready),
        .I4(data_enabled),
        .O(data_enabled_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    data_enabled_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(data_enabled_i_1_n_0),
        .Q(data_enabled),
        .R(\response_id_reg[0]_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_response_generator i_response_generator
       (.data_enabled(data_enabled),
        .dest_enabled(dest_enabled),
        .dest_response_valid(dest_response_valid),
        .enabled_reg_0(\id_reg[0]_0 ),
        .enabled_reg_1(\id_reg[3]_0 ),
        .enabled_reg_2(\id_reg[1]_0 ),
        .enabled_reg_3(\id_reg[2]_0 ),
        .id0(id0),
        .m_axis_aclk(m_axis_aclk),
        .\response_id_reg[0]_0 (\response_id_reg[0] ),
        .\response_id_reg[0]_1 (\response_id_reg[0]_0 ),
        .\response_id_reg[1]_0 (\response_id_reg[1] ),
        .\response_id_reg[2]_0 (\response_id_reg[2] ),
        .\response_id_reg[3]_0 (\response_id_reg[3] ));
  LUT3 #(
    .INIT(8'h80)) 
    \id[0]_i_1 
       (.I0(active_reg_0),
        .I1(m_axis_ready),
        .I2(dest_fifo_last),
        .O(p_4_in));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \id[0]_i_2 
       (.I0(\id_reg[1]_0 ),
        .I1(\id_reg[3]_0 ),
        .I2(\id_reg[2]_0 ),
        .O(\id[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \id[1]_i_1__1 
       (.I0(\id_reg[2]_0 ),
        .I1(\id_reg[3]_0 ),
        .I2(\id_reg[1]_0 ),
        .I3(\id_reg[0]_0 ),
        .O(inc_id_return[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \id[2]_i_1__1 
       (.I0(\id_reg[3]_0 ),
        .I1(\id_reg[0]_0 ),
        .I2(\id_reg[2]_0 ),
        .I3(\id_reg[1]_0 ),
        .O(inc_id_return[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \id[3]_i_1__1 
       (.I0(\id_reg[1]_0 ),
        .I1(\id_reg[2]_0 ),
        .I2(\id_reg[0]_0 ),
        .I3(\id_reg[3]_0 ),
        .O(\id[3]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[0] 
       (.C(m_axis_aclk),
        .CE(p_4_in),
        .D(\id[0]_i_2_n_0 ),
        .Q(\id_reg[0]_0 ),
        .R(\response_id_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[1] 
       (.C(m_axis_aclk),
        .CE(p_4_in),
        .D(inc_id_return[1]),
        .Q(\id_reg[1]_0 ),
        .R(\response_id_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[2] 
       (.C(m_axis_aclk),
        .CE(p_4_in),
        .D(inc_id_return[2]),
        .Q(\id_reg[2]_0 ),
        .R(\response_id_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[3] 
       (.C(m_axis_aclk),
        .CE(p_4_in),
        .D(\id[3]_i_1__1_n_0 ),
        .Q(\id_reg[3]_0 ),
        .R(\response_id_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    m_axis_last_INST_0
       (.I0(req_xlast_d),
        .I1(dest_fifo_last),
        .I2(data_eot),
        .O(m_axis_last));
  LUT6 #(
    .INIT(64'h8FFFFFFF80000000)) 
    \m_axis_user[0]_i_1 
       (.I0(m_axis_last),
        .I1(req_islast_d),
        .I2(active_reg_0),
        .I3(dest_fifo_valid),
        .I4(m_axis_ready),
        .I5(m_axis_user),
        .O(\m_axis_user[0]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \m_axis_user_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\m_axis_user[0]_i_1_n_0 ),
        .Q(m_axis_user),
        .S(\response_id_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    req_islast_d_reg
       (.C(m_axis_aclk),
        .CE(dest_req_ready),
        .D(out[0]),
        .Q(req_islast_d),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    req_xlast_d_reg
       (.C(m_axis_aclk),
        .CE(dest_req_ready),
        .D(out[1]),
        .Q(req_xlast_d),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_request_arb
   (m_axis_data,
    addr_valid_reg,
    E,
    g,
    id,
    \id_reg[3] ,
    \id_reg[0] ,
    \id_reg[1] ,
    \id_reg[2] ,
    \id_reg[3]_0 ,
    m_src_axi_araddr,
    dest_enabled,
    enabled,
    active_reg,
    m_axis_user,
    up_response_valid,
    up_eot,
    response_valid_reg,
    up_bl_partial,
    m_axis_valid,
    up_sot,
    \cdc_sync_stage2_reg[3] ,
    \cdc_sync_stage2_reg[1] ,
    \cdc_sync_stage2_reg[0] ,
    m_axis_last,
    dma_req_eot,
    \cdc_sync_stage2_reg[3]_0 ,
    m_src_axi_arlen,
    \measured_burst_length_reg[6] ,
    m_axis_aclk,
    m_src_axi_aclk,
    m_src_axi_rdata,
    m_src_axi_rvalid,
    Q,
    s_axi_aclk,
    dest_mem_data_valid_reg,
    src_id_reduced_msb_reg,
    m_axis_ready,
    up_dma_req_cyclic,
    p_3_in,
    up_response_ready,
    src_enable,
    m_src_axi_arready,
    m_src_axi_rlast,
    \up_transfer_id_reg[0] ,
    up_dma_req_valid,
    \up_rdata_reg[1] ,
    \up_rdata_reg[1]_0 ,
    \up_rdata_reg[1]_1 ,
    up_dma_req_x_length,
    dest_enable,
    SR,
    D,
    \src_beat_counter_reg[0] );
  output [31:0]m_axis_data;
  output addr_valid_reg;
  output [0:0]E;
  output [3:0]g;
  output [3:0]id;
  output [3:0]\id_reg[3] ;
  output \id_reg[0] ;
  output \id_reg[1] ;
  output \id_reg[2] ;
  output \id_reg[3]_0 ;
  output [27:0]m_src_axi_araddr;
  output dest_enabled;
  output enabled;
  output active_reg;
  output [0:0]m_axis_user;
  output up_response_valid;
  output up_eot;
  output [0:0]response_valid_reg;
  output up_bl_partial;
  output m_axis_valid;
  output up_sot;
  output [1:0]\cdc_sync_stage2_reg[3] ;
  output \cdc_sync_stage2_reg[1] ;
  output \cdc_sync_stage2_reg[0] ;
  output m_axis_last;
  output dma_req_eot;
  output [1:0]\cdc_sync_stage2_reg[3]_0 ;
  output [3:0]m_src_axi_arlen;
  output [6:0]\measured_burst_length_reg[6] ;
  input m_axis_aclk;
  input m_src_axi_aclk;
  input [63:0]m_src_axi_rdata;
  input m_src_axi_rvalid;
  input [0:0]Q;
  input s_axi_aclk;
  input [0:0]dest_mem_data_valid_reg;
  input [0:0]src_id_reduced_msb_reg;
  input m_axis_ready;
  input up_dma_req_cyclic;
  input [0:0]p_3_in;
  input up_response_ready;
  input src_enable;
  input m_src_axi_arready;
  input m_src_axi_rlast;
  input \up_transfer_id_reg[0] ;
  input up_dma_req_valid;
  input \up_rdata_reg[1] ;
  input \up_rdata_reg[1]_0 ;
  input [1:0]\up_rdata_reg[1]_1 ;
  input [21:0]up_dma_req_x_length;
  input dest_enable;
  input [0:0]SR;
  input [57:0]D;
  input [0:0]\src_beat_counter_reg[0] ;

  wire [57:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire active_reg;
  wire addr_valid_reg;
  wire \cdc_sync_stage2_reg[0] ;
  wire \cdc_sync_stage2_reg[1] ;
  wire [1:0]\cdc_sync_stage2_reg[3] ;
  wire [1:0]\cdc_sync_stage2_reg[3]_0 ;
  wire data_eot;
  wire [1:0]dbg_ids0;
  wire dest_enable;
  wire dest_enabled;
  wire dest_fifo_last;
  wire dest_fifo_valid;
  wire [0:0]dest_mem_data_valid_reg;
  wire dest_req_ready;
  wire dest_req_xlast;
  wire dest_response_valid;
  wire dma_req_eot;
  wire enabled;
  wire [2:2]fifo_valid_bytes;
  wire [3:0]g;
  wire g0;
  wire i_dest_req_fifo_n_1;
  wire i_dest_req_fifo_n_3;
  wire i_dest_req_fifo_n_4;
  wire i_dest_req_fifo_n_5;
  wire \i_response_generator/id0 ;
  wire i_src_req_fifo_n_65;
  wire i_store_and_forward_n_37;
  wire i_store_and_forward_n_42;
  wire [3:0]id;
  wire \id_reg[0] ;
  wire \id_reg[1] ;
  wire \id_reg[2] ;
  wire [3:0]\id_reg[3] ;
  wire \id_reg[3]_0 ;
  wire [2:1]inc_id3_return;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_last;
  wire m_axis_ready;
  wire [0:0]m_axis_user;
  wire m_axis_valid;
  wire m_src_axi_aclk;
  wire [27:0]m_src_axi_araddr;
  wire [3:0]m_src_axi_arlen;
  wire m_src_axi_arready;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire [6:0]\measured_burst_length_reg[6] ;
  wire p_0_in1_in;
  wire p_1_in;
  wire [0:0]p_3_in;
  wire req_gen_ready;
  wire req_gen_valid__0;
  wire request_eot;
  wire [3:0]request_id;
  wire response_eot;
  wire [3:0]response_id;
  wire [0:0]response_valid_reg;
  wire s_axi_aclk;
  wire src_address_eot;
  wire [0:0]\src_beat_counter_reg[0] ;
  wire src_dest_valid_hs;
  wire src_enable;
  wire [0:0]src_id_reduced_msb_reg;
  wire [28:0]src_req_dest_address;
  wire [28:0]src_req_dest_address_cur;
  wire src_req_islast_cur;
  wire [2:0]src_req_last_beat_bytes;
  wire [3:0]src_req_last_burst_length;
  wire src_req_ready;
  wire [27:0]src_req_src_address;
  wire src_req_xlast;
  wire src_req_xlast_cur;
  wire src_throttled_request_id0;
  wire \src_throttled_request_id[0]_i_1_n_0 ;
  wire \src_throttled_request_id[3]_i_2_n_0 ;
  wire \src_throttled_request_id_reg_n_0_[0] ;
  wire \src_throttled_request_id_reg_n_0_[1] ;
  wire up_bl_partial;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire [21:0]up_dma_req_x_length;
  wire up_eot;
  wire \up_rdata_reg[1] ;
  wire \up_rdata_reg[1]_0 ;
  wire [1:0]\up_rdata_reg[1]_1 ;
  wire up_response_ready;
  wire up_response_valid;
  wire up_sot;
  wire \up_transfer_id_reg[0] ;
  wire \zerodeep.m_axis_raddr0 ;
  wire \zerodeep.s_axis_waddr ;
  wire NLW_eot_mem_dest_reg_r1_0_15_0_0_SPO_UNCONNECTED;
  wire NLW_eot_mem_dest_reg_r2_0_15_0_0_SPO_UNCONNECTED;
  wire NLW_eot_mem_src_reg_0_15_0_0_SPO_UNCONNECTED;

  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/eot_mem_dest_reg_r1" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_TDP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:DPRA4,A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    eot_mem_dest_reg_r1_0_15_0_0
       (.A0(\id_reg[3] [0]),
        .A1(\id_reg[3] [1]),
        .A2(\id_reg[3] [2]),
        .A3(\id_reg[3] [3]),
        .A4(1'b0),
        .D(src_address_eot),
        .DPO(response_eot),
        .DPRA0(id[0]),
        .DPRA1(id[1]),
        .DPRA2(id[2]),
        .DPRA3(id[3]),
        .DPRA4(1'b0),
        .SPO(NLW_eot_mem_dest_reg_r1_0_15_0_0_SPO_UNCONNECTED),
        .WCLK(m_src_axi_aclk),
        .WE(1'b1));
  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/eot_mem_dest_reg_r2" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_TDP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:DPRA4,A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    eot_mem_dest_reg_r2_0_15_0_0
       (.A0(\id_reg[3] [0]),
        .A1(\id_reg[3] [1]),
        .A2(\id_reg[3] [2]),
        .A3(\id_reg[3] [3]),
        .A4(1'b0),
        .D(src_address_eot),
        .DPO(data_eot),
        .DPRA0(g[0]),
        .DPRA1(g[1]),
        .DPRA2(g[2]),
        .DPRA3(g[3]),
        .DPRA4(1'b0),
        .SPO(NLW_eot_mem_dest_reg_r2_0_15_0_0_SPO_UNCONNECTED),
        .WCLK(m_src_axi_aclk),
        .WE(1'b1));
  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/eot_mem_src_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_TDP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:DPRA4,A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    eot_mem_src_reg_0_15_0_0
       (.A0(request_id[0]),
        .A1(request_id[1]),
        .A2(request_id[2]),
        .A3(request_id[3]),
        .A4(1'b0),
        .D(request_eot),
        .DPO(src_address_eot),
        .DPRA0(\id_reg[3] [0]),
        .DPRA1(\id_reg[3] [1]),
        .DPRA2(\id_reg[3] [2]),
        .DPRA3(\id_reg[3] [3]),
        .DPRA4(1'b0),
        .SPO(NLW_eot_mem_src_reg_0_15_0_0_SPO_UNCONNECTED),
        .WCLK(s_axi_aclk),
        .WE(1'b1));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dest_axi_stream i_dest_dma_stream
       (.active_reg_0(active_reg),
        .active_reg_1(i_dest_req_fifo_n_4),
        .data_eot(data_eot),
        .dest_enable(dest_enable),
        .dest_enabled(dest_enabled),
        .dest_fifo_last(dest_fifo_last),
        .dest_fifo_valid(dest_fifo_valid),
        .dest_req_ready(dest_req_ready),
        .dest_response_valid(dest_response_valid),
        .id0(\i_response_generator/id0 ),
        .\id_reg[0]_0 (g[0]),
        .\id_reg[1]_0 (g[1]),
        .\id_reg[2]_0 (g[2]),
        .\id_reg[3]_0 (g[3]),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_last(m_axis_last),
        .m_axis_ready(m_axis_ready),
        .m_axis_user(m_axis_user),
        .out({dest_req_xlast,i_dest_req_fifo_n_1}),
        .\response_id_reg[0] (id[0]),
        .\response_id_reg[0]_0 (dest_mem_data_valid_reg),
        .\response_id_reg[1] (id[1]),
        .\response_id_reg[2] (id[2]),
        .\response_id_reg[3] (id[3]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized0 i_dest_req_fifo
       (.D({src_req_dest_address_cur,src_req_xlast_cur,src_req_islast_cur}),
        .E(E),
        .\cdc_sync_stage1_reg[0] (dest_mem_data_valid_reg),
        .\cdc_sync_stage1_reg[0]_0 (src_id_reduced_msb_reg),
        .\cdc_sync_stage2_reg[0] (i_dest_req_fifo_n_3),
        .\cdc_sync_stage2_reg[0]_0 (i_dest_req_fifo_n_5),
        .data_eot(data_eot),
        .dest_fifo_last(dest_fifo_last),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_ready(m_axis_ready),
        .m_src_axi_aclk(m_src_axi_aclk),
        .out({dest_req_xlast,i_dest_req_fifo_n_1}),
        .src_dest_valid_hs(src_dest_valid_hs),
        .\zerodeep.m_axis_raddr_reg_0 (i_dest_req_fifo_n_4),
        .\zerodeep.m_axis_raddr_reg_1 (active_reg),
        .\zerodeep.s_axis_waddr (\zerodeep.s_axis_waddr ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_request_generator i_req_gen
       (.Q(Q),
        .\burst_count_reg[0]_0 (\up_transfer_id_reg[0] ),
        .\id_reg[3]_0 (request_id),
        .req_gen_ready(req_gen_ready),
        .req_gen_valid__0(req_gen_valid__0),
        .request_eot(request_eot),
        .response_id(response_id),
        .s_axi_aclk(s_axi_aclk),
        .up_dma_req_x_length(up_dma_req_x_length[21:5]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_response_manager i_response_manager
       (.Q(Q),
        .\cdc_sync_stage2_reg[0] (dest_mem_data_valid_reg),
        .dest_response_valid(dest_response_valid),
        .dma_req_eot(dma_req_eot),
        .id0(\i_response_generator/id0 ),
        .m_axis_aclk(m_axis_aclk),
        .\measured_burst_length_reg[6]_0 (\measured_burst_length_reg[6] ),
        .p_3_in(p_3_in),
        .response_eot(response_eot),
        .response_valid_reg_0(response_valid_reg),
        .s_axi_aclk(s_axi_aclk),
        .up_bl_partial(up_bl_partial),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_eot(up_eot),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_src_axi_mm i_src_dma_mm
       (.ADDRC({\id_reg[3]_0 ,\id_reg[2] ,\id_reg[1] ,\id_reg[0] }),
        .ADDRD(\id_reg[3] ),
        .DOB(fifo_valid_bytes),
        .E(E),
        .Q({p_1_in,p_0_in1_in,\src_throttled_request_id_reg_n_0_[1] ,\src_throttled_request_id_reg_n_0_[0] }),
        .SR(SR),
        .addr_valid_reg(addr_valid_reg),
        .enabled(enabled),
        .g0(g0),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_araddr(m_src_axi_araddr),
        .m_src_axi_arlen(m_src_axi_arlen),
        .m_src_axi_arready(m_src_axi_arready),
        .out({src_req_src_address,src_req_last_burst_length,src_req_last_beat_bytes}),
        .req_ready_reg(src_id_reduced_msb_reg),
        .src_address_eot(src_address_eot),
        .src_enable(src_enable),
        .src_req_ready(src_req_ready),
        .\zerodeep.m_axis_raddr0 (\zerodeep.m_axis_raddr0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized1 i_src_req_fifo
       (.D({D[57:1],up_dma_req_x_length[4:0],D[0]}),
        .Q(Q),
        .\cdc_sync_stage1_reg[0] (src_id_reduced_msb_reg),
        .m_src_axi_aclk(m_src_axi_aclk),
        .out({src_req_dest_address,src_req_src_address,src_req_last_burst_length,src_req_last_beat_bytes,src_req_xlast,i_src_req_fifo_n_65}),
        .req_gen_ready(req_gen_ready),
        .req_gen_valid__0(req_gen_valid__0),
        .s_axi_aclk(s_axi_aclk),
        .src_req_ready(src_req_ready),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_sot(up_sot),
        .\up_transfer_id_reg[0] (\up_transfer_id_reg[0] ),
        .\zerodeep.m_axis_raddr0 (\zerodeep.m_axis_raddr0 ),
        .\zerodeep.m_axis_raddr_reg_0 (i_dest_req_fifo_n_3),
        .\zerodeep.s_axis_waddr (\zerodeep.s_axis_waddr ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac_burst_memory i_store_and_forward
       (.DOB(fifo_valid_bytes),
        .Q({p_1_in,p_0_in1_in,\src_throttled_request_id_reg_n_0_[1] ,\src_throttled_request_id_reg_n_0_[0] }),
        .\cdc_sync_stage2_reg[3] (\cdc_sync_stage2_reg[3]_0 ),
        .data_eot(data_eot),
        .dbg_ids0(dbg_ids0),
        .dest_fifo_last(dest_fifo_last),
        .dest_fifo_valid(dest_fifo_valid),
        .dest_mem_data_valid_reg_0(dest_mem_data_valid_reg),
        .dest_req_ready(dest_req_ready),
        .g0(g0),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_data(m_axis_data),
        .m_axis_ready(m_axis_ready),
        .m_axis_valid(m_axis_valid),
        .m_ram_reg_bram_0(active_reg),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_rdata(m_src_axi_rdata),
        .m_src_axi_rlast(m_src_axi_rlast),
        .m_src_axi_rvalid(m_src_axi_rvalid),
        .\src_beat_counter_reg[0]_0 (\src_beat_counter_reg[0] ),
        .src_id_reduced_msb_reg_0(src_id_reduced_msb_reg),
        .\src_throttled_request_id_reg[0] (i_store_and_forward_n_42),
        .\src_throttled_request_id_reg[2] (i_store_and_forward_n_37));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__3 i_sync_req_response_id
       (.id(id),
        .response_id(response_id),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0 i_sync_src_request_id
       (.E(src_throttled_request_id0),
        .Q({p_1_in,p_0_in1_in,\src_throttled_request_id_reg_n_0_[1] ,\src_throttled_request_id_reg_n_0_[0] }),
        .\cdc_sync_stage1_reg[3]_0 (request_id),
        .\cdc_sync_stage2_reg[0]_0 (\cdc_sync_stage2_reg[0] ),
        .\cdc_sync_stage2_reg[1]_0 (\cdc_sync_stage2_reg[1] ),
        .\cdc_sync_stage2_reg[3]_0 (\cdc_sync_stage2_reg[3] ),
        .dbg_ids0(dbg_ids0),
        .m_src_axi_aclk(m_src_axi_aclk),
        .\src_throttled_request_id_reg[0] (i_store_and_forward_n_37),
        .\src_throttled_request_id_reg[0]_0 (i_store_and_forward_n_42),
        .\up_rdata_reg[1] (\up_rdata_reg[1] ),
        .\up_rdata_reg[1]_0 (\up_rdata_reg[1]_0 ),
        .\up_rdata_reg[1]_1 (\up_rdata_reg[1]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    src_dest_valid_hs_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(i_dest_req_fifo_n_5),
        .Q(src_dest_valid_hs),
        .R(src_id_reduced_msb_reg));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[0]),
        .Q(src_req_dest_address_cur[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[10] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[10]),
        .Q(src_req_dest_address_cur[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[11] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[11]),
        .Q(src_req_dest_address_cur[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[12] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[12]),
        .Q(src_req_dest_address_cur[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[13] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[13]),
        .Q(src_req_dest_address_cur[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[14] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[14]),
        .Q(src_req_dest_address_cur[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[15] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[15]),
        .Q(src_req_dest_address_cur[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[16] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[16]),
        .Q(src_req_dest_address_cur[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[17] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[17]),
        .Q(src_req_dest_address_cur[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[18] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[18]),
        .Q(src_req_dest_address_cur[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[19] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[19]),
        .Q(src_req_dest_address_cur[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[1]),
        .Q(src_req_dest_address_cur[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[20] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[20]),
        .Q(src_req_dest_address_cur[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[21] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[21]),
        .Q(src_req_dest_address_cur[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[22] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[22]),
        .Q(src_req_dest_address_cur[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[23] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[23]),
        .Q(src_req_dest_address_cur[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[24] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[24]),
        .Q(src_req_dest_address_cur[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[25] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[25]),
        .Q(src_req_dest_address_cur[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[26] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[26]),
        .Q(src_req_dest_address_cur[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[27] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[27]),
        .Q(src_req_dest_address_cur[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[28] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[28]),
        .Q(src_req_dest_address_cur[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[2]),
        .Q(src_req_dest_address_cur[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[3]),
        .Q(src_req_dest_address_cur[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[4] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[4]),
        .Q(src_req_dest_address_cur[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[5] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[5]),
        .Q(src_req_dest_address_cur[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[6] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[6]),
        .Q(src_req_dest_address_cur[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[7] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[7]),
        .Q(src_req_dest_address_cur[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[8] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[8]),
        .Q(src_req_dest_address_cur[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \src_req_dest_address_cur_reg[9] 
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_dest_address[9]),
        .Q(src_req_dest_address_cur[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    src_req_islast_cur_reg
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(i_src_req_fifo_n_65),
        .Q(src_req_islast_cur),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    src_req_xlast_cur_reg
       (.C(m_src_axi_aclk),
        .CE(E),
        .D(src_req_xlast),
        .Q(src_req_xlast_cur),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \src_throttled_request_id[0]_i_1 
       (.I0(\src_throttled_request_id_reg_n_0_[1] ),
        .I1(p_1_in),
        .I2(p_0_in1_in),
        .O(\src_throttled_request_id[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \src_throttled_request_id[1]_i_1 
       (.I0(p_0_in1_in),
        .I1(p_1_in),
        .I2(\src_throttled_request_id_reg_n_0_[1] ),
        .I3(\src_throttled_request_id_reg_n_0_[0] ),
        .O(inc_id3_return[1]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \src_throttled_request_id[2]_i_1 
       (.I0(p_1_in),
        .I1(\src_throttled_request_id_reg_n_0_[0] ),
        .I2(p_0_in1_in),
        .I3(\src_throttled_request_id_reg_n_0_[1] ),
        .O(inc_id3_return[2]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \src_throttled_request_id[3]_i_2 
       (.I0(\src_throttled_request_id_reg_n_0_[1] ),
        .I1(p_0_in1_in),
        .I2(\src_throttled_request_id_reg_n_0_[0] ),
        .I3(p_1_in),
        .O(\src_throttled_request_id[3]_i_2_n_0 ));
  FDRE \src_throttled_request_id_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(src_throttled_request_id0),
        .D(\src_throttled_request_id[0]_i_1_n_0 ),
        .Q(\src_throttled_request_id_reg_n_0_[0] ),
        .R(src_id_reduced_msb_reg));
  FDRE \src_throttled_request_id_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(src_throttled_request_id0),
        .D(inc_id3_return[1]),
        .Q(\src_throttled_request_id_reg_n_0_[1] ),
        .R(src_id_reduced_msb_reg));
  FDRE \src_throttled_request_id_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(src_throttled_request_id0),
        .D(inc_id3_return[2]),
        .Q(p_0_in1_in),
        .R(src_id_reduced_msb_reg));
  FDRE \src_throttled_request_id_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(src_throttled_request_id0),
        .D(\src_throttled_request_id[3]_i_2_n_0 ),
        .Q(p_1_in),
        .R(src_id_reduced_msb_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_request_generator
   (req_gen_ready,
    request_eot,
    \id_reg[3]_0 ,
    Q,
    s_axi_aclk,
    req_gen_valid__0,
    response_id,
    \burst_count_reg[0]_0 ,
    up_dma_req_x_length);
  output req_gen_ready;
  output request_eot;
  output [3:0]\id_reg[3]_0 ;
  input [0:0]Q;
  input s_axi_aclk;
  input req_gen_valid__0;
  input [3:0]response_id;
  input \burst_count_reg[0]_0 ;
  input [16:0]up_dma_req_x_length;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_4_n_0 ;
  wire [0:0]Q;
  wire b2g5_return01_out;
  wire b2g5_return03_out;
  wire [16:0]burst_count;
  wire burst_count0_carry__0_i_1_n_0;
  wire burst_count0_carry__0_i_2_n_0;
  wire burst_count0_carry__0_i_3_n_0;
  wire burst_count0_carry__0_i_4_n_0;
  wire burst_count0_carry__0_i_5_n_0;
  wire burst_count0_carry__0_i_6_n_0;
  wire burst_count0_carry__0_i_7_n_0;
  wire burst_count0_carry__0_i_8_n_0;
  wire burst_count0_carry__0_n_1;
  wire burst_count0_carry__0_n_2;
  wire burst_count0_carry__0_n_3;
  wire burst_count0_carry__0_n_4;
  wire burst_count0_carry__0_n_5;
  wire burst_count0_carry__0_n_6;
  wire burst_count0_carry__0_n_7;
  wire burst_count0_carry_i_1_n_0;
  wire burst_count0_carry_i_2_n_0;
  wire burst_count0_carry_i_3_n_0;
  wire burst_count0_carry_i_4_n_0;
  wire burst_count0_carry_i_5_n_0;
  wire burst_count0_carry_i_6_n_0;
  wire burst_count0_carry_i_7_n_0;
  wire burst_count0_carry_i_8_n_0;
  wire burst_count0_carry_n_0;
  wire burst_count0_carry_n_1;
  wire burst_count0_carry_n_2;
  wire burst_count0_carry_n_3;
  wire burst_count0_carry_n_4;
  wire burst_count0_carry_n_5;
  wire burst_count0_carry_n_6;
  wire burst_count0_carry_n_7;
  wire \burst_count[0]_i_1_n_0 ;
  wire \burst_count[10]_i_1_n_0 ;
  wire \burst_count[11]_i_1_n_0 ;
  wire \burst_count[12]_i_1_n_0 ;
  wire \burst_count[13]_i_1_n_0 ;
  wire \burst_count[14]_i_1_n_0 ;
  wire \burst_count[15]_i_1_n_0 ;
  wire \burst_count[16]_i_2_n_0 ;
  wire \burst_count[1]_i_1_n_0 ;
  wire \burst_count[2]_i_1_n_0 ;
  wire \burst_count[3]_i_1_n_0 ;
  wire \burst_count[4]_i_1_n_0 ;
  wire \burst_count[5]_i_1_n_0 ;
  wire \burst_count[6]_i_1_n_0 ;
  wire \burst_count[7]_i_1_n_0 ;
  wire \burst_count[8]_i_1_n_0 ;
  wire \burst_count[9]_i_1_n_0 ;
  wire burst_count_0;
  wire \burst_count_reg[0]_0 ;
  wire eot_mem_src_reg_0_15_0_0_i_2_n_0;
  wire eot_mem_src_reg_0_15_0_0_i_3_n_0;
  wire eot_mem_src_reg_0_15_0_0_i_4_n_0;
  wire \id[0]_i_1__1_n_0 ;
  wire [3:0]\id_reg[3]_0 ;
  wire [16:1]in10;
  wire incr_id__0;
  wire p_1_in2_in;
  wire p_4_in;
  wire req_gen_ready;
  wire req_gen_valid__0;
  wire req_ready_i_1__0_n_0;
  wire request_eot;
  wire [3:0]response_id;
  wire s_axi_aclk;
  wire [0:0]state;
  wire [16:0]up_dma_req_x_length;
  wire [7:7]NLW_burst_count0_carry__0_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h7F70)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(p_4_in),
        .I1(request_eot),
        .I2(state),
        .I3(req_gen_valid__0),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF6FFFFF600000000)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(response_id[0]),
        .I1(\id[0]_i_1__1_n_0 ),
        .I2(\FSM_sequential_state[0]_i_4_n_0 ),
        .I3(p_1_in2_in),
        .I4(response_id[3]),
        .I5(\burst_count_reg[0]_0 ),
        .O(p_4_in));
  LUT6 #(
    .INIT(64'h7BD7EDD77BBBEDEE)) 
    \FSM_sequential_state[0]_i_4 
       (.I0(response_id[1]),
        .I1(response_id[2]),
        .I2(\id_reg[3]_0 [3]),
        .I3(\id_reg[3]_0 [0]),
        .I4(\id_reg[3]_0 [2]),
        .I5(\id_reg[3]_0 [1]),
        .O(\FSM_sequential_state[0]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_REWIND_ID:010,STATE_GEN_ID:001,STATE_WAIT_LAST:100,STATE_IDLE:000,STATE_CONSUME:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state),
        .R(Q));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 burst_count0_carry
       (.CI(burst_count[0]),
        .CI_TOP(1'b0),
        .CO({burst_count0_carry_n_0,burst_count0_carry_n_1,burst_count0_carry_n_2,burst_count0_carry_n_3,burst_count0_carry_n_4,burst_count0_carry_n_5,burst_count0_carry_n_6,burst_count0_carry_n_7}),
        .DI(burst_count[8:1]),
        .O(in10[8:1]),
        .S({burst_count0_carry_i_1_n_0,burst_count0_carry_i_2_n_0,burst_count0_carry_i_3_n_0,burst_count0_carry_i_4_n_0,burst_count0_carry_i_5_n_0,burst_count0_carry_i_6_n_0,burst_count0_carry_i_7_n_0,burst_count0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 burst_count0_carry__0
       (.CI(burst_count0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_burst_count0_carry__0_CO_UNCONNECTED[7],burst_count0_carry__0_n_1,burst_count0_carry__0_n_2,burst_count0_carry__0_n_3,burst_count0_carry__0_n_4,burst_count0_carry__0_n_5,burst_count0_carry__0_n_6,burst_count0_carry__0_n_7}),
        .DI({1'b0,burst_count[15:9]}),
        .O(in10[16:9]),
        .S({burst_count0_carry__0_i_1_n_0,burst_count0_carry__0_i_2_n_0,burst_count0_carry__0_i_3_n_0,burst_count0_carry__0_i_4_n_0,burst_count0_carry__0_i_5_n_0,burst_count0_carry__0_i_6_n_0,burst_count0_carry__0_i_7_n_0,burst_count0_carry__0_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_1
       (.I0(burst_count[16]),
        .O(burst_count0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_2
       (.I0(burst_count[15]),
        .O(burst_count0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_3
       (.I0(burst_count[14]),
        .O(burst_count0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_4
       (.I0(burst_count[13]),
        .O(burst_count0_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_5
       (.I0(burst_count[12]),
        .O(burst_count0_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_6
       (.I0(burst_count[11]),
        .O(burst_count0_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_7
       (.I0(burst_count[10]),
        .O(burst_count0_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry__0_i_8
       (.I0(burst_count[9]),
        .O(burst_count0_carry__0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_1
       (.I0(burst_count[8]),
        .O(burst_count0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_2
       (.I0(burst_count[7]),
        .O(burst_count0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_3
       (.I0(burst_count[6]),
        .O(burst_count0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_4
       (.I0(burst_count[5]),
        .O(burst_count0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_5
       (.I0(burst_count[4]),
        .O(burst_count0_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_6
       (.I0(burst_count[3]),
        .O(burst_count0_carry_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_7
       (.I0(burst_count[2]),
        .O(burst_count0_carry_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    burst_count0_carry_i_8
       (.I0(burst_count[1]),
        .O(burst_count0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h2E)) 
    \burst_count[0]_i_1 
       (.I0(up_dma_req_x_length[0]),
        .I1(state),
        .I2(burst_count[0]),
        .O(\burst_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[10]_i_1 
       (.I0(up_dma_req_x_length[10]),
        .I1(state),
        .I2(in10[10]),
        .O(\burst_count[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[11]_i_1 
       (.I0(up_dma_req_x_length[11]),
        .I1(state),
        .I2(in10[11]),
        .O(\burst_count[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[12]_i_1 
       (.I0(up_dma_req_x_length[12]),
        .I1(state),
        .I2(in10[12]),
        .O(\burst_count[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[13]_i_1 
       (.I0(up_dma_req_x_length[13]),
        .I1(state),
        .I2(in10[13]),
        .O(\burst_count[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[14]_i_1 
       (.I0(up_dma_req_x_length[14]),
        .I1(state),
        .I2(in10[14]),
        .O(\burst_count[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[15]_i_1 
       (.I0(up_dma_req_x_length[15]),
        .I1(state),
        .I2(in10[15]),
        .O(\burst_count[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hD)) 
    \burst_count[16]_i_1 
       (.I0(state),
        .I1(p_4_in),
        .O(burst_count_0));
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[16]_i_2 
       (.I0(up_dma_req_x_length[16]),
        .I1(state),
        .I2(in10[16]),
        .O(\burst_count[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[1]_i_1 
       (.I0(up_dma_req_x_length[1]),
        .I1(state),
        .I2(in10[1]),
        .O(\burst_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[2]_i_1 
       (.I0(up_dma_req_x_length[2]),
        .I1(state),
        .I2(in10[2]),
        .O(\burst_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[3]_i_1 
       (.I0(up_dma_req_x_length[3]),
        .I1(state),
        .I2(in10[3]),
        .O(\burst_count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[4]_i_1 
       (.I0(up_dma_req_x_length[4]),
        .I1(state),
        .I2(in10[4]),
        .O(\burst_count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[5]_i_1 
       (.I0(up_dma_req_x_length[5]),
        .I1(state),
        .I2(in10[5]),
        .O(\burst_count[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[6]_i_1 
       (.I0(up_dma_req_x_length[6]),
        .I1(state),
        .I2(in10[6]),
        .O(\burst_count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[7]_i_1 
       (.I0(up_dma_req_x_length[7]),
        .I1(state),
        .I2(in10[7]),
        .O(\burst_count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[8]_i_1 
       (.I0(up_dma_req_x_length[8]),
        .I1(state),
        .I2(in10[8]),
        .O(\burst_count[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \burst_count[9]_i_1 
       (.I0(up_dma_req_x_length[9]),
        .I1(state),
        .I2(in10[9]),
        .O(\burst_count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[0]_i_1_n_0 ),
        .Q(burst_count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[10]_i_1_n_0 ),
        .Q(burst_count[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[11]_i_1_n_0 ),
        .Q(burst_count[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[12]_i_1_n_0 ),
        .Q(burst_count[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[13]_i_1_n_0 ),
        .Q(burst_count[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[14]_i_1_n_0 ),
        .Q(burst_count[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[15]_i_1_n_0 ),
        .Q(burst_count[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[16]_i_2_n_0 ),
        .Q(burst_count[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[1]_i_1_n_0 ),
        .Q(burst_count[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[2]_i_1_n_0 ),
        .Q(burst_count[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[3]_i_1_n_0 ),
        .Q(burst_count[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[4]_i_1_n_0 ),
        .Q(burst_count[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[5]_i_1_n_0 ),
        .Q(burst_count[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[6]_i_1_n_0 ),
        .Q(burst_count[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[7]_i_1_n_0 ),
        .Q(burst_count[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[8]_i_1_n_0 ),
        .Q(burst_count[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \burst_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(burst_count_0),
        .D(\burst_count[9]_i_1_n_0 ),
        .Q(burst_count[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    eot_mem_src_reg_0_15_0_0_i_1
       (.I0(eot_mem_src_reg_0_15_0_0_i_2_n_0),
        .I1(burst_count[15]),
        .I2(burst_count[16]),
        .I3(burst_count[14]),
        .I4(burst_count[13]),
        .I5(eot_mem_src_reg_0_15_0_0_i_3_n_0),
        .O(request_eot));
  LUT4 #(
    .INIT(16'hFFFE)) 
    eot_mem_src_reg_0_15_0_0_i_2
       (.I0(burst_count[10]),
        .I1(burst_count[9]),
        .I2(burst_count[12]),
        .I3(burst_count[11]),
        .O(eot_mem_src_reg_0_15_0_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    eot_mem_src_reg_0_15_0_0_i_3
       (.I0(eot_mem_src_reg_0_15_0_0_i_4_n_0),
        .I1(burst_count[5]),
        .I2(burst_count[6]),
        .I3(burst_count[7]),
        .I4(burst_count[8]),
        .O(eot_mem_src_reg_0_15_0_0_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    eot_mem_src_reg_0_15_0_0_i_4
       (.I0(burst_count[4]),
        .I1(burst_count[3]),
        .I2(burst_count[0]),
        .I3(burst_count[1]),
        .I4(burst_count[2]),
        .O(eot_mem_src_reg_0_15_0_0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \id[0]_i_1__1 
       (.I0(\id_reg[3]_0 [1]),
        .I1(\id_reg[3]_0 [3]),
        .I2(\id_reg[3]_0 [2]),
        .O(\id[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \id[1]_i_1__0 
       (.I0(\id_reg[3]_0 [2]),
        .I1(\id_reg[3]_0 [3]),
        .I2(\id_reg[3]_0 [1]),
        .I3(\id_reg[3]_0 [0]),
        .O(b2g5_return01_out));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \id[2]_i_1__0 
       (.I0(\id_reg[3]_0 [3]),
        .I1(\id_reg[3]_0 [0]),
        .I2(\id_reg[3]_0 [2]),
        .I3(\id_reg[3]_0 [1]),
        .O(b2g5_return03_out));
  LUT2 #(
    .INIT(4'h8)) 
    \id[3]_i_1__0 
       (.I0(state),
        .I1(p_4_in),
        .O(incr_id__0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \id[3]_i_2__0 
       (.I0(\id_reg[3]_0 [1]),
        .I1(\id_reg[3]_0 [2]),
        .I2(\id_reg[3]_0 [0]),
        .I3(\id_reg[3]_0 [3]),
        .O(p_1_in2_in));
  FDRE \id_reg[0] 
       (.C(s_axi_aclk),
        .CE(incr_id__0),
        .D(\id[0]_i_1__1_n_0 ),
        .Q(\id_reg[3]_0 [0]),
        .R(Q));
  FDRE \id_reg[1] 
       (.C(s_axi_aclk),
        .CE(incr_id__0),
        .D(b2g5_return01_out),
        .Q(\id_reg[3]_0 [1]),
        .R(Q));
  FDRE \id_reg[2] 
       (.C(s_axi_aclk),
        .CE(incr_id__0),
        .D(b2g5_return03_out),
        .Q(\id_reg[3]_0 [2]),
        .R(Q));
  FDRE \id_reg[3] 
       (.C(s_axi_aclk),
        .CE(incr_id__0),
        .D(p_1_in2_in),
        .Q(\id_reg[3]_0 [3]),
        .R(Q));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hD111)) 
    req_ready_i_1__0
       (.I0(req_gen_valid__0),
        .I1(state),
        .I2(request_eot),
        .I3(p_4_in),
        .O(req_ready_i_1__0_n_0));
  FDRE req_ready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(req_ready_i_1__0_n_0),
        .Q(req_gen_ready),
        .R(Q));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_response_generator
   (\response_id_reg[3]_0 ,
    \response_id_reg[2]_0 ,
    \response_id_reg[1]_0 ,
    \response_id_reg[0]_0 ,
    dest_enabled,
    dest_response_valid,
    \response_id_reg[0]_1 ,
    id0,
    m_axis_aclk,
    enabled_reg_0,
    enabled_reg_1,
    enabled_reg_2,
    enabled_reg_3,
    data_enabled);
  output \response_id_reg[3]_0 ;
  output \response_id_reg[2]_0 ;
  output \response_id_reg[1]_0 ;
  output \response_id_reg[0]_0 ;
  output dest_enabled;
  output dest_response_valid;
  input [0:0]\response_id_reg[0]_1 ;
  input id0;
  input m_axis_aclk;
  input enabled_reg_0;
  input enabled_reg_1;
  input enabled_reg_2;
  input enabled_reg_3;
  input data_enabled;

  wire data_enabled;
  wire dest_enabled;
  wire dest_response_valid;
  wire enabled_i_1_n_0;
  wire enabled_i_2__0_n_0;
  wire enabled_reg_0;
  wire enabled_reg_1;
  wire enabled_reg_2;
  wire enabled_reg_3;
  wire id0;
  wire [2:1]inc_id0_return;
  wire m_axis_aclk;
  wire \response_id[0]_i_1_n_0 ;
  wire \response_id[3]_i_2_n_0 ;
  wire \response_id_reg[0]_0 ;
  wire [0:0]\response_id_reg[0]_1 ;
  wire \response_id_reg[1]_0 ;
  wire \response_id_reg[2]_0 ;
  wire \response_id_reg[3]_0 ;
  wire \zerodeep.cdc_sync_fifo_ram[0]_i_3_n_0 ;

  LUT5 #(
    .INIT(32'hBEFFAAAA)) 
    enabled_i_1
       (.I0(data_enabled),
        .I1(\response_id_reg[3]_0 ),
        .I2(enabled_reg_1),
        .I3(enabled_i_2__0_n_0),
        .I4(dest_enabled),
        .O(enabled_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    enabled_i_2__0
       (.I0(enabled_reg_2),
        .I1(\response_id_reg[1]_0 ),
        .I2(enabled_reg_3),
        .I3(\response_id_reg[2]_0 ),
        .I4(enabled_reg_0),
        .I5(\response_id_reg[0]_0 ),
        .O(enabled_i_2__0_n_0));
  FDRE enabled_reg
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(enabled_i_1_n_0),
        .Q(dest_enabled),
        .R(\response_id_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \response_id[0]_i_1 
       (.I0(\response_id_reg[1]_0 ),
        .I1(\response_id_reg[3]_0 ),
        .I2(\response_id_reg[2]_0 ),
        .O(\response_id[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \response_id[1]_i_1 
       (.I0(\response_id_reg[2]_0 ),
        .I1(\response_id_reg[3]_0 ),
        .I2(\response_id_reg[1]_0 ),
        .I3(\response_id_reg[0]_0 ),
        .O(inc_id0_return[1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \response_id[2]_i_1 
       (.I0(\response_id_reg[3]_0 ),
        .I1(\response_id_reg[0]_0 ),
        .I2(\response_id_reg[2]_0 ),
        .I3(\response_id_reg[1]_0 ),
        .O(inc_id0_return[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \response_id[3]_i_2 
       (.I0(\response_id_reg[1]_0 ),
        .I1(\response_id_reg[2]_0 ),
        .I2(\response_id_reg[0]_0 ),
        .I3(\response_id_reg[3]_0 ),
        .O(\response_id[3]_i_2_n_0 ));
  FDRE \response_id_reg[0] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(\response_id[0]_i_1_n_0 ),
        .Q(\response_id_reg[0]_0 ),
        .R(\response_id_reg[0]_1 ));
  FDRE \response_id_reg[1] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(inc_id0_return[1]),
        .Q(\response_id_reg[1]_0 ),
        .R(\response_id_reg[0]_1 ));
  FDRE \response_id_reg[2] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(inc_id0_return[2]),
        .Q(\response_id_reg[2]_0 ),
        .R(\response_id_reg[0]_1 ));
  FDRE \response_id_reg[3] 
       (.C(m_axis_aclk),
        .CE(id0),
        .D(\response_id[3]_i_2_n_0 ),
        .Q(\response_id_reg[3]_0 ),
        .R(\response_id_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hF6FFFFF600000000)) 
    \zerodeep.cdc_sync_fifo_ram[0]_i_2 
       (.I0(enabled_reg_0),
        .I1(\response_id_reg[0]_0 ),
        .I2(\zerodeep.cdc_sync_fifo_ram[0]_i_3_n_0 ),
        .I3(\response_id_reg[3]_0 ),
        .I4(enabled_reg_1),
        .I5(dest_enabled),
        .O(dest_response_valid));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \zerodeep.cdc_sync_fifo_ram[0]_i_3 
       (.I0(enabled_reg_2),
        .I1(\response_id_reg[1]_0 ),
        .I2(enabled_reg_3),
        .I3(\response_id_reg[2]_0 ),
        .O(\zerodeep.cdc_sync_fifo_ram[0]_i_3_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_splitter
   (\acked_reg[1]_0 ,
    Q,
    src_req_ready,
    \zerodeep.m_axis_raddr0 ,
    bl_ready_ag,
    D,
    req_ready_ag,
    SR,
    m_src_axi_aclk);
  output [0:0]\acked_reg[1]_0 ;
  output [1:0]Q;
  output src_req_ready;
  input \zerodeep.m_axis_raddr0 ;
  input bl_ready_ag;
  input [0:0]D;
  input req_ready_ag;
  input [0:0]SR;
  input m_src_axi_aclk;

  wire [0:0]D;
  wire [1:0]Q;
  wire [0:0]SR;
  wire [0:0]acked0;
  wire [0:0]\acked_reg[1]_0 ;
  wire bl_ready_ag;
  wire m_src_axi_aclk;
  wire req_ready_ag;
  wire src_req_ready;
  wire \zerodeep.m_axis_raddr0 ;

  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hEC)) 
    \acked[0]_i_1 
       (.I0(\zerodeep.m_axis_raddr0 ),
        .I1(Q[0]),
        .I2(req_ready_ag),
        .O(acked0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hEEE0)) 
    \acked[1]_i_4 
       (.I0(Q[0]),
        .I1(req_ready_ag),
        .I2(Q[1]),
        .I3(bl_ready_ag),
        .O(src_req_ready));
  FDRE \acked_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(acked0),
        .Q(Q[0]),
        .R(SR));
  FDRE \acked_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(D),
        .Q(Q[1]),
        .R(SR));
  LUT3 #(
    .INIT(8'h40)) 
    \last_burst_len[3]_i_1 
       (.I0(Q[1]),
        .I1(\zerodeep.m_axis_raddr0 ),
        .I2(bl_ready_ag),
        .O(\acked_reg[1]_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_src_axi_mm
   (addr_valid_reg,
    ADDRD,
    ADDRC,
    m_src_axi_araddr,
    enabled,
    DOB,
    E,
    src_req_ready,
    m_src_axi_arlen,
    m_src_axi_aclk,
    req_ready_reg,
    g0,
    src_address_eot,
    \zerodeep.m_axis_raddr0 ,
    Q,
    src_enable,
    m_src_axi_arready,
    out,
    SR);
  output addr_valid_reg;
  output [3:0]ADDRD;
  output [3:0]ADDRC;
  output [27:0]m_src_axi_araddr;
  output enabled;
  output [0:0]DOB;
  output [0:0]E;
  output src_req_ready;
  output [3:0]m_src_axi_arlen;
  input m_src_axi_aclk;
  input [0:0]req_ready_reg;
  input g0;
  input src_address_eot;
  input \zerodeep.m_axis_raddr0 ;
  input [3:0]Q;
  input src_enable;
  input m_src_axi_arready;
  input [34:0]out;
  input [0:0]SR;

  wire [3:0]ADDRC;
  wire [3:0]ADDRD;
  wire [0:0]DOB;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [1:0]acked;
  wire [1:1]acked0;
  wire addr_valid_reg;
  wire b2g2_return06_out;
  wire b2g2_return07_out;
  wire bl_ready_ag;
  wire enabled;
  wire g0;
  wire i_addr_gen_n_37;
  wire \id[0]_i_1__2_n_0 ;
  wire [2:0]last_beat_bytes;
  wire last_beat_bytes0;
  wire last_beat_bytes_mem_reg_0_15_0_2_i_1_n_0;
  wire last_beat_bytes_mem_reg_0_15_0_2_i_2_n_0;
  wire last_beat_bytes_mem_reg_0_15_0_2_i_3_n_0;
  wire last_beat_bytes_mem_reg_0_15_0_2_n_0;
  wire last_beat_bytes_mem_reg_0_15_0_2_n_1;
  wire last_burst_len0;
  wire m_src_axi_aclk;
  wire [27:0]m_src_axi_araddr;
  wire [3:0]m_src_axi_arlen;
  wire m_src_axi_arready;
  wire [34:0]out;
  wire p_3_in;
  wire req_ready_ag;
  wire [0:0]req_ready_reg;
  wire src_address_eot;
  wire src_enable;
  wire src_req_ready;
  wire \zerodeep.m_axis_raddr0 ;
  wire [1:1]NLW_last_beat_bytes_mem_reg_0_15_0_2_DOB_UNCONNECTED;
  wire [1:0]NLW_last_beat_bytes_mem_reg_0_15_0_2_DOC_UNCONNECTED;
  wire [1:0]NLW_last_beat_bytes_mem_reg_0_15_0_2_DOD_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    enabled_reg
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(i_addr_gen_n_37),
        .Q(enabled),
        .R(req_ready_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_generator i_addr_gen
       (.D(acked0),
        .E(E),
        .Q(acked),
        .addr_valid_reg_0(addr_valid_reg),
        .addr_valid_reg_1(Q),
        .bl_ready_ag(bl_ready_ag),
        .bl_ready_reg_0(last_beat_bytes0),
        .enabled(enabled),
        .enabled_reg_0(i_addr_gen_n_37),
        .enabled_reg_1(ADDRC[0]),
        .enabled_reg_2(ADDRC[2]),
        .enabled_reg_3(ADDRC[1]),
        .enabled_reg_4(ADDRC[3]),
        .\id_reg[0]_0 (ADDRD[0]),
        .\id_reg[1]_0 (ADDRD[1]),
        .\id_reg[2]_0 (ADDRD[2]),
        .\id_reg[3]_0 (ADDRD[3]),
        .\last_burst_len_reg[3]_0 (last_burst_len0),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_araddr(m_src_axi_araddr),
        .m_src_axi_arlen(m_src_axi_arlen),
        .m_src_axi_arready(m_src_axi_arready),
        .out(out[34:3]),
        .req_ready_ag(req_ready_ag),
        .req_ready_reg_0(req_ready_reg),
        .src_address_eot(src_address_eot),
        .src_enable(src_enable),
        .\zerodeep.m_axis_raddr0 (\zerodeep.m_axis_raddr0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_splitter i_req_splitter
       (.D(acked0),
        .Q(acked),
        .SR(SR),
        .\acked_reg[1]_0 (last_burst_len0),
        .bl_ready_ag(bl_ready_ag),
        .m_src_axi_aclk(m_src_axi_aclk),
        .req_ready_ag(req_ready_ag),
        .src_req_ready(src_req_ready),
        .\zerodeep.m_axis_raddr0 (\zerodeep.m_axis_raddr0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \id[0]_i_1__2 
       (.I0(ADDRC[1]),
        .I1(ADDRC[3]),
        .I2(ADDRC[2]),
        .O(\id[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \id[1]_i_1 
       (.I0(ADDRC[2]),
        .I1(ADDRC[3]),
        .I2(ADDRC[1]),
        .I3(ADDRC[0]),
        .O(b2g2_return06_out));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hD1F0)) 
    \id[2]_i_1 
       (.I0(ADDRC[3]),
        .I1(ADDRC[0]),
        .I2(ADDRC[2]),
        .I3(ADDRC[1]),
        .O(b2g2_return07_out));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hFE04)) 
    \id[3]_i_1__2 
       (.I0(ADDRC[1]),
        .I1(ADDRC[2]),
        .I2(ADDRC[0]),
        .I3(ADDRC[3]),
        .O(p_3_in));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(\id[0]_i_1__2_n_0 ),
        .Q(ADDRC[0]),
        .R(req_ready_reg));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(b2g2_return06_out),
        .Q(ADDRC[1]),
        .R(req_ready_reg));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(b2g2_return07_out),
        .Q(ADDRC[2]),
        .R(req_ready_reg));
  FDRE #(
    .INIT(1'b0)) 
    \id_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(g0),
        .D(p_3_in),
        .Q(ADDRC[3]),
        .R(req_ready_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "48" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_transfer/i_request_arb/i_src_dma_mm/last_beat_bytes_mem_reg_0_15_0_2" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM32M last_beat_bytes_mem_reg_0_15_0_2
       (.ADDRA({1'b0,ADDRC}),
        .ADDRB({1'b0,ADDRC}),
        .ADDRC({1'b0,ADDRC}),
        .ADDRD({1'b0,ADDRD}),
        .DIA({last_beat_bytes_mem_reg_0_15_0_2_i_1_n_0,last_beat_bytes_mem_reg_0_15_0_2_i_2_n_0}),
        .DIB({1'b0,last_beat_bytes_mem_reg_0_15_0_2_i_3_n_0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA({last_beat_bytes_mem_reg_0_15_0_2_n_0,last_beat_bytes_mem_reg_0_15_0_2_n_1}),
        .DOB({NLW_last_beat_bytes_mem_reg_0_15_0_2_DOB_UNCONNECTED[1],DOB}),
        .DOC(NLW_last_beat_bytes_mem_reg_0_15_0_2_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_last_beat_bytes_mem_reg_0_15_0_2_DOD_UNCONNECTED[1:0]),
        .WCLK(m_src_axi_aclk),
        .WE(1'b1));
  LUT2 #(
    .INIT(4'hB)) 
    last_beat_bytes_mem_reg_0_15_0_2_i_1
       (.I0(last_beat_bytes[1]),
        .I1(src_address_eot),
        .O(last_beat_bytes_mem_reg_0_15_0_2_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    last_beat_bytes_mem_reg_0_15_0_2_i_2
       (.I0(last_beat_bytes[0]),
        .I1(src_address_eot),
        .O(last_beat_bytes_mem_reg_0_15_0_2_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    last_beat_bytes_mem_reg_0_15_0_2_i_3
       (.I0(last_beat_bytes[2]),
        .I1(src_address_eot),
        .O(last_beat_bytes_mem_reg_0_15_0_2_i_3_n_0));
  FDRE \last_beat_bytes_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(last_beat_bytes0),
        .D(out[0]),
        .Q(last_beat_bytes[0]),
        .R(1'b0));
  FDRE \last_beat_bytes_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(last_beat_bytes0),
        .D(out[1]),
        .Q(last_beat_bytes[1]),
        .R(1'b0));
  FDRE \last_beat_bytes_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(last_beat_bytes0),
        .D(out[2]),
        .Q(last_beat_bytes[2]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits
   (\cdc_sync_stage2_reg[0]_0 ,
    enabled,
    s_axi_aclk);
  output [0:0]\cdc_sync_stage2_reg[0]_0 ;
  input enabled;
  input s_axi_aclk;

  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire [0:0]\cdc_sync_stage2_reg[0]_0 ;
  wire enabled;
  wire s_axi_aclk;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(enabled),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg[0]_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0
   (E,
    \cdc_sync_stage2_reg[3]_0 ,
    \cdc_sync_stage2_reg[1]_0 ,
    \cdc_sync_stage2_reg[0]_0 ,
    Q,
    \src_throttled_request_id_reg[0] ,
    \src_throttled_request_id_reg[0]_0 ,
    dbg_ids0,
    \up_rdata_reg[1] ,
    \up_rdata_reg[1]_0 ,
    \up_rdata_reg[1]_1 ,
    \cdc_sync_stage1_reg[3]_0 ,
    m_src_axi_aclk);
  output [0:0]E;
  output [1:0]\cdc_sync_stage2_reg[3]_0 ;
  output \cdc_sync_stage2_reg[1]_0 ;
  output \cdc_sync_stage2_reg[0]_0 ;
  input [3:0]Q;
  input \src_throttled_request_id_reg[0] ;
  input \src_throttled_request_id_reg[0]_0 ;
  input [1:0]dbg_ids0;
  input \up_rdata_reg[1] ;
  input \up_rdata_reg[1]_0 ;
  input [1:0]\up_rdata_reg[1]_1 ;
  input [3:0]\cdc_sync_stage1_reg[3]_0 ;
  input m_src_axi_aclk;

  wire [0:0]E;
  wire [3:0]Q;
  wire [3:0]\cdc_sync_stage1_reg[3]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage1_reg_n_0_[1] ;
  wire \cdc_sync_stage1_reg_n_0_[2] ;
  wire \cdc_sync_stage1_reg_n_0_[3] ;
  wire \cdc_sync_stage2_reg[0]_0 ;
  wire \cdc_sync_stage2_reg[1]_0 ;
  wire [1:0]\cdc_sync_stage2_reg[3]_0 ;
  wire [1:0]dbg_ids0;
  wire [1:0]dbg_ids1;
  wire m_src_axi_aclk;
  wire \src_throttled_request_id[3]_i_3_n_0 ;
  wire \src_throttled_request_id_reg[0] ;
  wire \src_throttled_request_id_reg[0]_0 ;
  wire \up_rdata_reg[1] ;
  wire \up_rdata_reg[1]_0 ;
  wire [1:0]\up_rdata_reg[1]_1 ;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [0]),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [1]),
        .Q(\cdc_sync_stage1_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [2]),
        .Q(\cdc_sync_stage1_reg_n_0_[2] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [3]),
        .Q(\cdc_sync_stage1_reg_n_0_[3] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(dbg_ids1[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[1] ),
        .Q(dbg_ids1[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[2] ),
        .Q(\cdc_sync_stage2_reg[3]_0 [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[3] ),
        .Q(\cdc_sync_stage2_reg[3]_0 [1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hBEBEBE00)) 
    \src_throttled_request_id[3]_i_1 
       (.I0(\src_throttled_request_id[3]_i_3_n_0 ),
        .I1(\cdc_sync_stage2_reg[3]_0 [1]),
        .I2(Q[3]),
        .I3(\src_throttled_request_id_reg[0] ),
        .I4(\src_throttled_request_id_reg[0]_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \src_throttled_request_id[3]_i_3 
       (.I0(Q[0]),
        .I1(dbg_ids1[0]),
        .I2(\cdc_sync_stage2_reg[3]_0 [0]),
        .I3(Q[2]),
        .I4(dbg_ids1[1]),
        .I5(Q[1]),
        .O(\src_throttled_request_id[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \up_rdata[0]_i_2 
       (.I0(dbg_ids1[0]),
        .I1(dbg_ids0[0]),
        .I2(\up_rdata_reg[1] ),
        .I3(\up_rdata_reg[1]_0 ),
        .I4(\up_rdata_reg[1]_1 [0]),
        .O(\cdc_sync_stage2_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \up_rdata[1]_i_2 
       (.I0(dbg_ids1[1]),
        .I1(dbg_ids0[1]),
        .I2(\up_rdata_reg[1] ),
        .I3(\up_rdata_reg[1]_0 ),
        .I4(\up_rdata_reg[1]_1 [1]),
        .O(\cdc_sync_stage2_reg[1]_0 ));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__1
   (\cdc_sync_stage2_reg[3]_0 ,
    dbg_ids0,
    E,
    active_reg,
    Q,
    dest_valid_reg,
    m_axis_ready,
    dest_valid_reg_0,
    dest_last,
    dest_valid,
    p_1_in,
    m_axis_aclk,
    \cdc_sync_stage1_reg[2]_0 ,
    ADDRD);
  output [1:0]\cdc_sync_stage2_reg[3]_0 ;
  output [1:0]dbg_ids0;
  output [0:0]E;
  output active_reg;
  input [3:0]Q;
  input dest_valid_reg;
  input m_axis_ready;
  input dest_valid_reg_0;
  input dest_last;
  input dest_valid;
  input p_1_in;
  input m_axis_aclk;
  input \cdc_sync_stage1_reg[2]_0 ;
  input [1:0]ADDRD;

  wire [1:0]ADDRD;
  wire [0:0]E;
  wire [3:0]Q;
  wire active_reg;
  wire \cdc_sync_stage1_reg[2]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage1_reg_n_0_[1] ;
  wire \cdc_sync_stage1_reg_n_0_[2] ;
  wire \cdc_sync_stage1_reg_n_0_[3] ;
  wire [1:0]\cdc_sync_stage2_reg[3]_0 ;
  wire [1:0]dbg_ids0;
  wire dest_burst_valid;
  wire \dest_id_next[3]_i_6_n_0 ;
  wire dest_last;
  wire dest_valid;
  wire dest_valid_reg;
  wire dest_valid_reg_0;
  wire m_axis_aclk;
  wire m_axis_ready;
  wire p_1_in;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(ADDRD[0]),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(ADDRD[1]),
        .Q(\cdc_sync_stage1_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[2]_0 ),
        .Q(\cdc_sync_stage1_reg_n_0_[2] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(\cdc_sync_stage1_reg_n_0_[3] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(dbg_ids0[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[1] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[1] ),
        .Q(dbg_ids0[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[2] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[2] ),
        .Q(\cdc_sync_stage2_reg[3]_0 [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[3] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[3] ),
        .Q(\cdc_sync_stage2_reg[3]_0 [1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hD500FFFF00000000)) 
    \dest_id_next[3]_i_1 
       (.I0(dest_valid_reg),
        .I1(m_axis_ready),
        .I2(dest_valid_reg_0),
        .I3(dest_last),
        .I4(dest_valid),
        .I5(dest_burst_valid),
        .O(E));
  LUT3 #(
    .INIT(8'hF6)) 
    \dest_id_next[3]_i_4 
       (.I0(\cdc_sync_stage2_reg[3]_0 [1]),
        .I1(Q[3]),
        .I2(\dest_id_next[3]_i_6_n_0 ),
        .O(dest_burst_valid));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \dest_id_next[3]_i_6 
       (.I0(dbg_ids0[0]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\cdc_sync_stage2_reg[3]_0 [0]),
        .I4(Q[1]),
        .I5(dbg_ids0[1]),
        .O(\dest_id_next[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7F550000)) 
    dest_valid_i_1
       (.I0(dest_last),
        .I1(dest_valid_reg_0),
        .I2(m_axis_ready),
        .I3(dest_valid_reg),
        .I4(dest_valid),
        .I5(dest_burst_valid),
        .O(active_reg));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__2
   (\src_throttled_request_id_reg[2] ,
    \src_throttled_request_id_reg[0] ,
    Q,
    \cdc_sync_stage1_reg[3]_0 ,
    m_src_axi_aclk);
  output \src_throttled_request_id_reg[2] ;
  output \src_throttled_request_id_reg[0] ;
  input [3:0]Q;
  input [3:0]\cdc_sync_stage1_reg[3]_0 ;
  input m_src_axi_aclk;

  wire [3:0]Q;
  wire [3:0]\cdc_sync_stage1_reg[3]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage1_reg_n_0_[1] ;
  wire \cdc_sync_stage1_reg_n_0_[2] ;
  wire \cdc_sync_stage1_reg_n_0_[3] ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg_n_0_[1] ;
  wire \cdc_sync_stage2_reg_n_0_[3] ;
  wire m_src_axi_aclk;
  wire p_0_in0_in;
  wire \src_throttled_request_id_reg[0] ;
  wire \src_throttled_request_id_reg[2] ;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [0]),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [1]),
        .Q(\cdc_sync_stage1_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [2]),
        .Q(\cdc_sync_stage1_reg_n_0_[2] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[3]_0 [3]),
        .Q(\cdc_sync_stage1_reg_n_0_[3] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[1] ),
        .Q(\cdc_sync_stage2_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[2] ),
        .Q(p_0_in0_in),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[3] ),
        .Q(\cdc_sync_stage2_reg_n_0_[3] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF99F)) 
    \src_throttled_request_id[3]_i_4 
       (.I0(Q[2]),
        .I1(p_0_in0_in),
        .I2(Q[3]),
        .I3(\cdc_sync_stage2_reg_n_0_[3] ),
        .O(\src_throttled_request_id_reg[2] ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \src_throttled_request_id[3]_i_5 
       (.I0(Q[0]),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(Q[1]),
        .I3(\cdc_sync_stage2_reg_n_0_[1] ),
        .O(\src_throttled_request_id_reg[0] ));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__parameterized0__xdcDup__3
   (response_id,
    id,
    s_axi_aclk);
  output [3:0]response_id;
  input [3:0]id;
  input s_axi_aclk;

  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage1_reg_n_0_[1] ;
  wire \cdc_sync_stage1_reg_n_0_[2] ;
  wire \cdc_sync_stage1_reg_n_0_[3] ;
  wire [3:0]id;
  wire [3:0]response_id;
  wire s_axi_aclk;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(id[0]),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(id[1]),
        .Q(\cdc_sync_stage1_reg_n_0_[1] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(id[2]),
        .Q(\cdc_sync_stage1_reg_n_0_[2] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(id[3]),
        .Q(\cdc_sync_stage1_reg_n_0_[3] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(response_id[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[1] ),
        .Q(response_id[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[2] ),
        .Q(response_id[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[3] ),
        .Q(response_id[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__1
   (\cdc_sync_stage2_reg[0]_0 ,
    E,
    \cdc_sync_stage2_reg[0]_1 ,
    src_dest_valid_hs_reg,
    \cdc_sync_stage1_reg[0]_0 ,
    \zerodeep.m_axis_raddr ,
    m_src_axi_aclk,
    \zerodeep.cdc_sync_fifo_ram_reg[0] ,
    src_dest_valid_hs,
    src_dest_valid_hs_reg_0);
  output \cdc_sync_stage2_reg[0]_0 ;
  output [0:0]E;
  output \cdc_sync_stage2_reg[0]_1 ;
  output src_dest_valid_hs_reg;
  input [0:0]\cdc_sync_stage1_reg[0]_0 ;
  input \zerodeep.m_axis_raddr ;
  input m_src_axi_aclk;
  input \zerodeep.cdc_sync_fifo_ram_reg[0] ;
  input src_dest_valid_hs;
  input [0:0]src_dest_valid_hs_reg_0;

  wire [0:0]E;
  wire [0:0]\cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg[0]_0 ;
  wire \cdc_sync_stage2_reg[0]_1 ;
  wire m_src_axi_aclk;
  wire src_dest_valid_hs;
  wire src_dest_valid_hs_reg;
  wire [0:0]src_dest_valid_hs_reg_0;
  wire \zerodeep.cdc_sync_fifo_ram_reg[0] ;
  wire \zerodeep.m_axis_raddr ;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\zerodeep.m_axis_raddr ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg[0]_0 ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hBEAA)) 
    src_dest_valid_hs_i_1
       (.I0(src_dest_valid_hs_reg_0),
        .I1(\cdc_sync_stage2_reg[0]_0 ),
        .I2(\zerodeep.cdc_sync_fifo_ram_reg[0] ),
        .I3(src_dest_valid_hs),
        .O(\cdc_sync_stage2_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h90)) 
    \zerodeep.cdc_sync_fifo_ram[30]_i_1 
       (.I0(\cdc_sync_stage2_reg[0]_0 ),
        .I1(\zerodeep.cdc_sync_fifo_ram_reg[0] ),
        .I2(src_dest_valid_hs),
        .O(E));
  LUT3 #(
    .INIT(8'h72)) 
    \zerodeep.s_axis_waddr_i_1__0 
       (.I0(src_dest_valid_hs),
        .I1(\cdc_sync_stage2_reg[0]_0 ),
        .I2(\zerodeep.cdc_sync_fifo_ram_reg[0] ),
        .O(src_dest_valid_hs_reg));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__2
   (\zerodeep.m_axis_raddr_reg ,
    m_axis_ready_0,
    \cdc_sync_stage1_reg[0]_0 ,
    \zerodeep.s_axis_waddr ,
    m_axis_aclk,
    \zerodeep.m_axis_raddr ,
    data_eot,
    \zerodeep.m_axis_raddr_reg_0 ,
    m_axis_ready,
    dest_fifo_last);
  output \zerodeep.m_axis_raddr_reg ;
  output m_axis_ready_0;
  input [0:0]\cdc_sync_stage1_reg[0]_0 ;
  input \zerodeep.s_axis_waddr ;
  input m_axis_aclk;
  input \zerodeep.m_axis_raddr ;
  input data_eot;
  input \zerodeep.m_axis_raddr_reg_0 ;
  input m_axis_ready;
  input dest_fifo_last;

  wire [0:0]\cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire data_eot;
  wire dest_fifo_last;
  wire m_axis_aclk;
  wire m_axis_ready;
  wire m_axis_ready_0;
  wire \zerodeep.m_axis_raddr ;
  wire \zerodeep.m_axis_raddr_reg ;
  wire \zerodeep.m_axis_raddr_reg_0 ;
  wire \zerodeep.s_axis_waddr ;

  LUT6 #(
    .INIT(64'h6F66FF66FF66FF66)) 
    active_i_1
       (.I0(\zerodeep.m_axis_raddr ),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(data_eot),
        .I3(\zerodeep.m_axis_raddr_reg_0 ),
        .I4(m_axis_ready),
        .I5(dest_fifo_last),
        .O(\zerodeep.m_axis_raddr_reg ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\zerodeep.s_axis_waddr ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFF7F0080FF0000)) 
    \zerodeep.m_axis_raddr_i_1 
       (.I0(data_eot),
        .I1(m_axis_ready),
        .I2(dest_fifo_last),
        .I3(\zerodeep.m_axis_raddr_reg_0 ),
        .I4(\cdc_sync_stage2_reg_n_0_[0] ),
        .I5(\zerodeep.m_axis_raddr ),
        .O(m_axis_ready_0));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__3
   (\zerodeep.cdc_sync_fifo_ram_reg0 ,
    id0,
    \cdc_sync_stage2_reg[0]_0 ,
    \cdc_sync_stage2_reg[0]_1 ,
    \cdc_sync_stage1_reg[0]_0 ,
    m_axis_aclk,
    \zerodeep.s_axis_waddr_reg ,
    dest_response_valid);
  output \zerodeep.cdc_sync_fifo_ram_reg0 ;
  output id0;
  output \cdc_sync_stage2_reg[0]_0 ;
  input [0:0]\cdc_sync_stage2_reg[0]_1 ;
  input \cdc_sync_stage1_reg[0]_0 ;
  input m_axis_aclk;
  input \zerodeep.s_axis_waddr_reg ;
  input dest_response_valid;

  wire \cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg[0]_0 ;
  wire [0:0]\cdc_sync_stage2_reg[0]_1 ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire dest_response_valid;
  wire id0;
  wire m_axis_aclk;
  wire \zerodeep.cdc_sync_fifo_ram_reg0 ;
  wire \zerodeep.s_axis_waddr_reg ;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_0 ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(\cdc_sync_stage2_reg[0]_1 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(\cdc_sync_stage2_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \response_id[3]_i_1 
       (.I0(dest_response_valid),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.s_axis_waddr_reg ),
        .O(id0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h90)) 
    \zerodeep.cdc_sync_fifo_ram[0]_i_1 
       (.I0(\cdc_sync_stage2_reg_n_0_[0] ),
        .I1(\zerodeep.s_axis_waddr_reg ),
        .I2(dest_response_valid),
        .O(\zerodeep.cdc_sync_fifo_ram_reg0 ));
  LUT3 #(
    .INIT(8'h72)) 
    \zerodeep.s_axis_waddr_i_1 
       (.I0(dest_response_valid),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.s_axis_waddr_reg ),
        .O(\cdc_sync_stage2_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__4
   (E,
    D,
    \FSM_sequential_state_reg[2] ,
    response_ready_reg,
    response_dest_ready_reg,
    Q,
    \cdc_sync_stage1_reg[0]_0 ,
    s_axi_aclk,
    \zerodeep.m_axis_raddr_reg ,
    response_dest_ready,
    up_response_ready,
    \FSM_sequential_state_reg[2]_0 ,
    \FSM_sequential_state_reg[1] ,
    nx_state15_in,
    response_dest_ready_reg_0,
    \FSM_sequential_state_reg[2]_1 ,
    state_reg,
    response_dest_ready_reg_1,
    up_response_valid);
  output [0:0]E;
  output [2:0]D;
  output \FSM_sequential_state_reg[2] ;
  output response_ready_reg;
  output response_dest_ready_reg;
  input [0:0]Q;
  input \cdc_sync_stage1_reg[0]_0 ;
  input s_axi_aclk;
  input \zerodeep.m_axis_raddr_reg ;
  input response_dest_ready;
  input up_response_ready;
  input [2:0]\FSM_sequential_state_reg[2]_0 ;
  input \FSM_sequential_state_reg[1] ;
  input nx_state15_in;
  input response_dest_ready_reg_0;
  input [1:0]\FSM_sequential_state_reg[2]_1 ;
  input [0:0]state_reg;
  input response_dest_ready_reg_1;
  input up_response_valid;

  wire [2:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_2__0_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[2] ;
  wire [2:0]\FSM_sequential_state_reg[2]_0 ;
  wire [1:0]\FSM_sequential_state_reg[2]_1 ;
  wire [0:0]Q;
  wire \cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire nx_state15_in;
  wire response_dest_ready;
  wire response_dest_ready_i_2_n_0;
  wire response_dest_ready_i_3_n_0;
  wire response_dest_ready_i_4_n_0;
  wire response_dest_ready_i_5_n_0;
  wire response_dest_ready_i_7_n_0;
  wire response_dest_ready_i_9_n_0;
  wire response_dest_ready_reg;
  wire response_dest_ready_reg_0;
  wire response_dest_ready_reg_1;
  wire response_dest_valid;
  wire response_ready_reg;
  wire s_axi_aclk;
  wire [0:0]state_reg;
  wire up_response_ready;
  wire up_response_valid;
  wire \zerodeep.m_axis_raddr_reg ;

  LUT4 #(
    .INIT(16'hEFE0)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [0]),
        .I2(\FSM_sequential_state_reg[2]_0 [2]),
        .I3(\FSM_sequential_state[0]_i_2__0_n_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00CC00CCB333B000)) 
    \FSM_sequential_state[0]_i_2__0 
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [1]),
        .I2(\FSM_sequential_state_reg[1] ),
        .I3(nx_state15_in),
        .I4(response_dest_valid),
        .I5(\FSM_sequential_state_reg[2]_0 [0]),
        .O(\FSM_sequential_state[0]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hEFE0)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [1]),
        .I2(\FSM_sequential_state_reg[2]_0 [2]),
        .I3(\FSM_sequential_state[1]_i_2_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h3C3F3434F4F4F4F4)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [1]),
        .I2(\FSM_sequential_state_reg[2]_0 [0]),
        .I3(response_dest_valid),
        .I4(\FSM_sequential_state_reg[1] ),
        .I5(nx_state15_in),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\cdc_sync_stage2_reg_n_0_[0] ),
        .I1(\zerodeep.m_axis_raddr_reg ),
        .O(response_dest_valid));
  LUT6 #(
    .INIT(64'h4E0A4E0A0A5F0A0A)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state_reg[2]_0 [2]),
        .I1(nx_state15_in),
        .I2(up_response_ready),
        .I3(\FSM_sequential_state_reg[2]_0 [1]),
        .I4(\FSM_sequential_state[2]_i_3_n_0 ),
        .I5(\FSM_sequential_state_reg[2]_0 [0]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAAA200000000AAA2)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(\FSM_sequential_state_reg[2]_0 [2]),
        .I1(nx_state15_in),
        .I2(\FSM_sequential_state_reg[2]_1 [0]),
        .I3(\FSM_sequential_state_reg[2]_1 [1]),
        .I4(\zerodeep.m_axis_raddr_reg ),
        .I5(\cdc_sync_stage2_reg_n_0_[0] ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_0 ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(Q));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(Q));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h60)) 
    req_response_partial_i_1
       (.I0(\zerodeep.m_axis_raddr_reg ),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(response_dest_ready),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h01)) 
    response_dest_ready_i_1
       (.I0(response_dest_ready_i_2_n_0),
        .I1(response_dest_ready_i_3_n_0),
        .I2(response_dest_ready_i_4_n_0),
        .O(\FSM_sequential_state_reg[2] ));
  LUT6 #(
    .INIT(64'h44004400005F000A)) 
    response_dest_ready_i_2
       (.I0(\FSM_sequential_state_reg[2]_0 [2]),
        .I1(nx_state15_in),
        .I2(up_response_ready),
        .I3(\FSM_sequential_state_reg[2]_0 [1]),
        .I4(response_dest_ready_i_5_n_0),
        .I5(\FSM_sequential_state_reg[2]_0 [0]),
        .O(response_dest_ready_i_2_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    response_dest_ready_i_3
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [2]),
        .I2(response_dest_ready_reg_1),
        .I3(\FSM_sequential_state_reg[2]_0 [1]),
        .I4(response_dest_ready_i_7_n_0),
        .O(response_dest_ready_i_3_n_0));
  LUT6 #(
    .INIT(64'hB8BBB8BBB8BBB888)) 
    response_dest_ready_i_4
       (.I0(up_response_ready),
        .I1(\FSM_sequential_state_reg[2]_0 [2]),
        .I2(response_dest_ready_reg_0),
        .I3(\FSM_sequential_state_reg[2]_0 [1]),
        .I4(\FSM_sequential_state_reg[2]_0 [0]),
        .I5(response_dest_ready_i_9_n_0),
        .O(response_dest_ready_i_4_n_0));
  LUT6 #(
    .INIT(64'hAAA200000000AAA2)) 
    response_dest_ready_i_5
       (.I0(state_reg),
        .I1(nx_state15_in),
        .I2(\FSM_sequential_state_reg[2]_1 [0]),
        .I3(\FSM_sequential_state_reg[2]_1 [1]),
        .I4(\zerodeep.m_axis_raddr_reg ),
        .I5(\cdc_sync_stage2_reg_n_0_[0] ),
        .O(response_dest_ready_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h00008FF8)) 
    response_dest_ready_i_7
       (.I0(\FSM_sequential_state_reg[1] ),
        .I1(nx_state15_in),
        .I2(\cdc_sync_stage2_reg_n_0_[0] ),
        .I3(\zerodeep.m_axis_raddr_reg ),
        .I4(\FSM_sequential_state_reg[2]_0 [0]),
        .O(response_dest_ready_i_7_n_0));
  LUT6 #(
    .INIT(64'h00000000444444F4)) 
    response_dest_ready_i_9
       (.I0(\FSM_sequential_state_reg[2]_0 [2]),
        .I1(\FSM_sequential_state_reg[2]_0 [1]),
        .I2(nx_state15_in),
        .I3(\FSM_sequential_state_reg[2]_1 [0]),
        .I4(\FSM_sequential_state_reg[2]_1 [1]),
        .I5(response_dest_valid),
        .O(response_dest_ready_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h12FF1212)) 
    response_valid_i_1
       (.I0(response_dest_ready_i_2_n_0),
        .I1(response_dest_ready_i_3_n_0),
        .I2(response_dest_ready_i_4_n_0),
        .I3(up_response_ready),
        .I4(up_response_valid),
        .O(response_ready_reg));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hD8)) 
    \zerodeep.m_axis_raddr_i_1__0 
       (.I0(response_dest_ready),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.m_axis_raddr_reg ),
        .O(response_dest_ready_reg));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__5
   (E,
    up_sot,
    req_gen_valid__0,
    up_dma_req_valid_reg,
    Q,
    \cdc_sync_stage1_reg[0]_0 ,
    s_axi_aclk,
    req_gen_ready,
    \zerodeep.s_axis_waddr_reg ,
    \up_transfer_id_reg[0] ,
    up_dma_req_valid,
    up_dma_req_cyclic);
  output [0:0]E;
  output up_sot;
  output req_gen_valid__0;
  output up_dma_req_valid_reg;
  input [0:0]Q;
  input \cdc_sync_stage1_reg[0]_0 ;
  input s_axi_aclk;
  input req_gen_ready;
  input \zerodeep.s_axis_waddr_reg ;
  input \up_transfer_id_reg[0] ;
  input up_dma_req_valid;
  input up_dma_req_cyclic;

  wire [0:0]E;
  wire [0:0]Q;
  wire \cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire req_gen_ready;
  wire req_gen_valid__0;
  wire s_axi_aclk;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire up_dma_req_valid_reg;
  wire up_sot;
  wire \up_transfer_id_reg[0] ;
  wire \zerodeep.s_axis_waddr_reg ;

  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h80080000)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(up_dma_req_valid),
        .I1(\up_transfer_id_reg[0] ),
        .I2(\zerodeep.s_axis_waddr_reg ),
        .I3(\cdc_sync_stage2_reg_n_0_[0] ),
        .I4(req_gen_ready),
        .O(req_gen_valid__0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_0 ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(Q));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(Q));
  LUT6 #(
    .INIT(64'h0000820000000000)) 
    \up_transfer_id[1]_i_1 
       (.I0(req_gen_ready),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.s_axis_waddr_reg ),
        .I3(\up_transfer_id_reg[0] ),
        .I4(up_dma_req_cyclic),
        .I5(up_dma_req_valid),
        .O(up_sot));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h82000000)) 
    \zerodeep.cdc_sync_fifo_ram[66]_i_1 
       (.I0(req_gen_ready),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.s_axis_waddr_reg ),
        .I3(\up_transfer_id_reg[0] ),
        .I4(up_dma_req_valid),
        .O(E));
  LUT5 #(
    .INIT(32'h7FFF0800)) 
    \zerodeep.s_axis_waddr_i_1__1 
       (.I0(up_dma_req_valid),
        .I1(\up_transfer_id_reg[0] ),
        .I2(\cdc_sync_stage2_reg_n_0_[0] ),
        .I3(req_gen_ready),
        .I4(\zerodeep.s_axis_waddr_reg ),
        .O(up_dma_req_valid_reg));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__6
   (\zerodeep.m_axis_raddr0 ,
    \zerodeep.m_axis_raddr_reg ,
    \cdc_sync_stage1_reg[0]_0 ,
    \cdc_sync_stage1_reg[0]_1 ,
    m_src_axi_aclk,
    \zerodeep.m_axis_raddr_reg_0 ,
    \zerodeep.s_axis_waddr ,
    \zerodeep.m_axis_raddr_reg_1 ,
    src_req_ready);
  output \zerodeep.m_axis_raddr0 ;
  output \zerodeep.m_axis_raddr_reg ;
  input [0:0]\cdc_sync_stage1_reg[0]_0 ;
  input \cdc_sync_stage1_reg[0]_1 ;
  input m_src_axi_aclk;
  input \zerodeep.m_axis_raddr_reg_0 ;
  input \zerodeep.s_axis_waddr ;
  input \zerodeep.m_axis_raddr_reg_1 ;
  input src_req_ready;

  wire [0:0]\cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg[0]_1 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire \cdc_sync_stage2_reg_n_0_[0] ;
  wire m_src_axi_aclk;
  wire src_req_ready;
  wire \zerodeep.m_axis_raddr0 ;
  wire \zerodeep.m_axis_raddr_reg ;
  wire \zerodeep.m_axis_raddr_reg_0 ;
  wire \zerodeep.m_axis_raddr_reg_1 ;
  wire \zerodeep.s_axis_waddr ;

  LUT5 #(
    .INIT(32'h60060000)) 
    \acked[1]_i_3 
       (.I0(\zerodeep.m_axis_raddr_reg_0 ),
        .I1(\cdc_sync_stage2_reg_n_0_[0] ),
        .I2(\zerodeep.s_axis_waddr ),
        .I3(\zerodeep.m_axis_raddr_reg_1 ),
        .I4(src_req_ready),
        .O(\zerodeep.m_axis_raddr0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_1 ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg_n_0_[0] ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \zerodeep.m_axis_raddr_i_1__1 
       (.I0(\zerodeep.m_axis_raddr0 ),
        .I1(\zerodeep.m_axis_raddr_reg_0 ),
        .O(\zerodeep.m_axis_raddr_reg ));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__7
   (dest_enable,
    \cdc_sync_stage1_reg[0]_0 ,
    m_axis_aclk);
  output dest_enable;
  input \cdc_sync_stage1_reg[0]_0 ;
  input m_axis_aclk;

  wire cdc_sync_stage1;
  wire \cdc_sync_stage1_reg[0]_0 ;
  wire dest_enable;
  wire m_axis_aclk;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_0 ),
        .Q(cdc_sync_stage1),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(cdc_sync_stage1),
        .Q(dest_enable),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__8
   (src_enable,
    \cdc_sync_stage1_reg[0]_0 ,
    m_src_axi_aclk);
  output src_enable;
  input \cdc_sync_stage1_reg[0]_0 ;
  input m_src_axi_aclk;

  wire \cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire m_src_axi_aclk;
  wire src_enable;

  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg[0]_0 ),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(src_enable),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_bits" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__9
   (\cdc_sync_stage2_reg[0]_0 ,
    E,
    dest_enabled,
    s_axi_aclk,
    Q,
    ctrl_pause,
    \state_reg[0] ,
    \state_reg[0]_0 ,
    \FSM_onehot_state[5]_i_2_0 ,
    \FSM_onehot_state[5]_i_2_1 );
  output [0:0]\cdc_sync_stage2_reg[0]_0 ;
  output [0:0]E;
  input dest_enabled;
  input s_axi_aclk;
  input [4:0]Q;
  input ctrl_pause;
  input \state_reg[0] ;
  input \state_reg[0]_0 ;
  input [0:0]\FSM_onehot_state[5]_i_2_0 ;
  input \FSM_onehot_state[5]_i_2_1 ;

  wire [0:0]E;
  wire [0:0]\FSM_onehot_state[5]_i_2_0 ;
  wire \FSM_onehot_state[5]_i_2_1 ;
  wire \FSM_onehot_state[5]_i_2_n_0 ;
  wire \FSM_onehot_state[5]_i_3_n_0 ;
  wire \FSM_onehot_state[5]_i_4_n_0 ;
  wire [4:0]Q;
  wire \cdc_sync_stage1_reg_n_0_[0] ;
  wire [0:0]\cdc_sync_stage2_reg[0]_0 ;
  wire ctrl_pause;
  wire dest_enabled;
  wire s_axi_aclk;
  wire \state_reg[0] ;
  wire \state_reg[0]_0 ;

  LUT5 #(
    .INIT(32'hFFFFFFA8)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(Q[3]),
        .I1(ctrl_pause),
        .I2(\state_reg[0] ),
        .I3(Q[0]),
        .I4(\FSM_onehot_state[5]_i_2_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFA2)) 
    \FSM_onehot_state[5]_i_2 
       (.I0(Q[1]),
        .I1(ctrl_pause),
        .I2(\state_reg[0] ),
        .I3(\FSM_onehot_state[5]_i_3_n_0 ),
        .I4(\FSM_onehot_state[5]_i_4_n_0 ),
        .I5(\state_reg[0]_0 ),
        .O(\FSM_onehot_state[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_state[5]_i_3 
       (.I0(Q[2]),
        .I1(\cdc_sync_stage2_reg[0]_0 ),
        .I2(\FSM_onehot_state[5]_i_2_0 ),
        .I3(\FSM_onehot_state[5]_i_2_1 ),
        .O(\FSM_onehot_state[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[5]_i_4 
       (.I0(Q[4]),
        .I1(\cdc_sync_stage2_reg[0]_0 ),
        .I2(\FSM_onehot_state[5]_i_2_0 ),
        .I3(\FSM_onehot_state[5]_i_2_1 ),
        .O(\FSM_onehot_state[5]_i_4_n_0 ));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage1_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dest_enabled),
        .Q(\cdc_sync_stage1_reg_n_0_[0] ),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \cdc_sync_stage2_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\cdc_sync_stage1_reg_n_0_[0] ),
        .Q(\cdc_sync_stage2_reg[0]_0 ),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "system_axi_adrv9001_tx2_dma_0,axi_dmac,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "axi_dmac,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awready,
    s_axi_awprot,
    s_axi_wvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wready,
    s_axi_bvalid,
    s_axi_bresp,
    s_axi_bready,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_arready,
    s_axi_arprot,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rdata,
    irq,
    m_src_axi_aclk,
    m_src_axi_aresetn,
    m_src_axi_arready,
    m_src_axi_arvalid,
    m_src_axi_araddr,
    m_src_axi_arlen,
    m_src_axi_arsize,
    m_src_axi_arburst,
    m_src_axi_arprot,
    m_src_axi_arcache,
    m_src_axi_rdata,
    m_src_axi_rready,
    m_src_axi_rvalid,
    m_src_axi_rresp,
    m_src_axi_rlast,
    m_axis_aclk,
    m_axis_ready,
    m_axis_valid,
    m_axis_data,
    m_axis_strb,
    m_axis_keep,
    m_axis_user,
    m_axis_id,
    m_axis_dest,
    m_axis_last,
    m_axis_xfer_req);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 11, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [10:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [10:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 irq INTERRUPT" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_src_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_src_axi_aclk, ASSOCIATED_BUSIF m_src_axi, ASSOCIATED_RESET m_src_axi_aresetn, FREQ_HZ 249997498, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, INSERT_VIP 0" *) input m_src_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_src_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_src_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_src_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARREADY" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_src_axi, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 249997498, ID_WIDTH 0, ADDR_WIDTH 31, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 0, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input m_src_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARVALID" *) output m_src_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARADDR" *) output [30:0]m_src_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARLEN" *) output [7:0]m_src_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARSIZE" *) output [2:0]m_src_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARBURST" *) output [1:0]m_src_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARPROT" *) output [2:0]m_src_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi ARCACHE" *) output [3:0]m_src_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi RDATA" *) input [63:0]m_src_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi RREADY" *) output m_src_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi RVALID" *) input m_src_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi RRESP" *) input [1:0]m_src_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_src_axi RLAST" *) input m_src_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK, xilinx.com:signal:clock:1.0 m_axis_signal_clock CLK" *) (* X_INTERFACE_MODE = "slave m_axis_signal_clock" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_signal_clock, ASSOCIATED_BUSIF m_axis, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, INSERT_VIP 0" *) input m_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 4, TID_WIDTH 8, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_axi_adrv9001_0_dac_2_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input m_axis_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) output [31:0]m_axis_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TSTRB" *) output [3:0]m_axis_strb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *) output [3:0]m_axis_keep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *) output [0:0]m_axis_user;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TID" *) output [7:0]m_axis_id;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDEST" *) output [3:0]m_axis_dest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_last;
  output m_axis_xfer_req;

  wire \<const0> ;
  wire \<const1> ;
  wire irq;
  wire m_axis_aclk;
  wire [31:0]m_axis_data;
  wire m_axis_last;
  wire m_axis_ready;
  wire [0:0]m_axis_user;
  wire m_axis_valid;
  wire m_axis_xfer_req;
  wire m_src_axi_aclk;
  wire [30:3]\^m_src_axi_araddr ;
  wire [3:0]\^m_src_axi_arlen ;
  wire m_src_axi_arready;
  wire m_src_axi_arvalid;
  wire [63:0]m_src_axi_rdata;
  wire m_src_axi_rlast;
  wire m_src_axi_rvalid;
  wire s_axi_aclk;
  wire [10:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [10:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire NLW_inst_fifo_rd_underflow_UNCONNECTED;
  wire NLW_inst_fifo_rd_valid_UNCONNECTED;
  wire NLW_inst_fifo_rd_xfer_req_UNCONNECTED;
  wire NLW_inst_fifo_wr_overflow_UNCONNECTED;
  wire NLW_inst_fifo_wr_xfer_req_UNCONNECTED;
  wire NLW_inst_m_dest_axi_arvalid_UNCONNECTED;
  wire NLW_inst_m_dest_axi_awvalid_UNCONNECTED;
  wire NLW_inst_m_dest_axi_bready_UNCONNECTED;
  wire NLW_inst_m_dest_axi_rready_UNCONNECTED;
  wire NLW_inst_m_dest_axi_wlast_UNCONNECTED;
  wire NLW_inst_m_dest_axi_wvalid_UNCONNECTED;
  wire NLW_inst_m_frame_out_valid_UNCONNECTED;
  wire NLW_inst_m_sg_axi_arvalid_UNCONNECTED;
  wire NLW_inst_m_sg_axi_awvalid_UNCONNECTED;
  wire NLW_inst_m_sg_axi_bready_UNCONNECTED;
  wire NLW_inst_m_sg_axi_rready_UNCONNECTED;
  wire NLW_inst_m_sg_axi_wlast_UNCONNECTED;
  wire NLW_inst_m_sg_axi_wvalid_UNCONNECTED;
  wire NLW_inst_m_src_axi_awvalid_UNCONNECTED;
  wire NLW_inst_m_src_axi_bready_UNCONNECTED;
  wire NLW_inst_m_src_axi_rready_UNCONNECTED;
  wire NLW_inst_m_src_axi_wlast_UNCONNECTED;
  wire NLW_inst_m_src_axi_wvalid_UNCONNECTED;
  wire NLW_inst_s_axis_ready_UNCONNECTED;
  wire NLW_inst_s_axis_xfer_req_UNCONNECTED;
  wire NLW_inst_s_frame_out_valid_UNCONNECTED;
  wire [7:0]NLW_inst_dest_diag_level_bursts_UNCONNECTED;
  wire [31:0]NLW_inst_fifo_rd_dout_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_dest_UNCONNECTED;
  wire [7:0]NLW_inst_m_axis_id_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_keep_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_strb_UNCONNECTED;
  wire [30:0]NLW_inst_m_dest_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_dest_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_dest_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_dest_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_m_dest_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_dest_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_dest_axi_arprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_dest_axi_arsize_UNCONNECTED;
  wire [30:0]NLW_inst_m_dest_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_dest_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_dest_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_dest_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_dest_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_dest_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_dest_axi_awprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_dest_axi_awsize_UNCONNECTED;
  wire [31:0]NLW_inst_m_dest_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_inst_m_dest_axi_wid_UNCONNECTED;
  wire [3:0]NLW_inst_m_dest_axi_wstrb_UNCONNECTED;
  wire [2:0]NLW_inst_m_frame_out_UNCONNECTED;
  wire [30:0]NLW_inst_m_sg_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_sg_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_sg_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_sg_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_m_sg_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_sg_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_sg_axi_arprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_sg_axi_arsize_UNCONNECTED;
  wire [30:0]NLW_inst_m_sg_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_sg_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_sg_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_sg_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_sg_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_sg_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_sg_axi_awprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_sg_axi_awsize_UNCONNECTED;
  wire [63:0]NLW_inst_m_sg_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_inst_m_sg_axi_wid_UNCONNECTED;
  wire [7:0]NLW_inst_m_sg_axi_wstrb_UNCONNECTED;
  wire [2:0]NLW_inst_m_src_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_src_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_src_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_src_axi_arid_UNCONNECTED;
  wire [7:4]NLW_inst_m_src_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_src_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_src_axi_arprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_src_axi_arsize_UNCONNECTED;
  wire [30:0]NLW_inst_m_src_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_src_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_src_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_src_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_m_src_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_m_src_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_src_axi_awprot_UNCONNECTED;
  wire [2:0]NLW_inst_m_src_axi_awsize_UNCONNECTED;
  wire [63:0]NLW_inst_m_src_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_inst_m_src_axi_wid_UNCONNECTED;
  wire [7:0]NLW_inst_m_src_axi_wstrb_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_rresp_UNCONNECTED;
  wire [2:0]NLW_inst_s_frame_out_UNCONNECTED;

  assign m_axis_dest[3] = \<const0> ;
  assign m_axis_dest[2] = \<const0> ;
  assign m_axis_dest[1] = \<const0> ;
  assign m_axis_dest[0] = \<const0> ;
  assign m_axis_id[7] = \<const0> ;
  assign m_axis_id[6] = \<const0> ;
  assign m_axis_id[5] = \<const0> ;
  assign m_axis_id[4] = \<const0> ;
  assign m_axis_id[3] = \<const0> ;
  assign m_axis_id[2] = \<const0> ;
  assign m_axis_id[1] = \<const0> ;
  assign m_axis_id[0] = \<const0> ;
  assign m_axis_keep[3] = \<const1> ;
  assign m_axis_keep[2] = \<const1> ;
  assign m_axis_keep[1] = \<const1> ;
  assign m_axis_keep[0] = \<const1> ;
  assign m_axis_strb[3] = \<const1> ;
  assign m_axis_strb[2] = \<const1> ;
  assign m_axis_strb[1] = \<const1> ;
  assign m_axis_strb[0] = \<const1> ;
  assign m_src_axi_araddr[30:3] = \^m_src_axi_araddr [30:3];
  assign m_src_axi_araddr[2] = \<const0> ;
  assign m_src_axi_araddr[1] = \<const0> ;
  assign m_src_axi_araddr[0] = \<const0> ;
  assign m_src_axi_arburst[1] = \<const0> ;
  assign m_src_axi_arburst[0] = \<const1> ;
  assign m_src_axi_arcache[3] = \<const1> ;
  assign m_src_axi_arcache[2] = \<const1> ;
  assign m_src_axi_arcache[1] = \<const1> ;
  assign m_src_axi_arcache[0] = \<const1> ;
  assign m_src_axi_arlen[7] = \<const0> ;
  assign m_src_axi_arlen[6] = \<const0> ;
  assign m_src_axi_arlen[5] = \<const0> ;
  assign m_src_axi_arlen[4] = \<const0> ;
  assign m_src_axi_arlen[3:0] = \^m_src_axi_arlen [3:0];
  assign m_src_axi_arprot[2] = \<const0> ;
  assign m_src_axi_arprot[1] = \<const1> ;
  assign m_src_axi_arprot[0] = \<const0> ;
  assign m_src_axi_arsize[2] = \<const0> ;
  assign m_src_axi_arsize[1] = \<const1> ;
  assign m_src_axi_arsize[0] = \<const1> ;
  assign m_src_axi_rready = \<const1> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* ALLOW_ASYM_MEM = "1" *) 
  (* ASYNC_CLK_DEST_REQ = "1'b1" *) 
  (* ASYNC_CLK_DEST_SG = "1'b1" *) 
  (* ASYNC_CLK_REQ_SG = "1'b1" *) 
  (* ASYNC_CLK_REQ_SRC = "1'b1" *) 
  (* ASYNC_CLK_SRC_DEST = "1'b1" *) 
  (* ASYNC_CLK_SRC_SG = "1'b1" *) 
  (* AUTORUN = "1'b0" *) 
  (* AUTORUN_DEST_ADDR = "0" *) 
  (* AUTORUN_DEST_STRIDE = "0" *) 
  (* AUTORUN_FLAGS = "0" *) 
  (* AUTORUN_FRAMELOCK_CONFIG = "0" *) 
  (* AUTORUN_FRAMELOCK_STRIDE = "0" *) 
  (* AUTORUN_SG_ADDRESS = "0" *) 
  (* AUTORUN_SRC_ADDR = "0" *) 
  (* AUTORUN_SRC_STRIDE = "0" *) 
  (* AUTORUN_X_LENGTH = "0" *) 
  (* AUTORUN_Y_LENGTH = "0" *) 
  (* AXIS_TUSER_SYNC = "1'b1" *) 
  (* AXI_AXCACHE = "4'b1111" *) 
  (* AXI_AXPROT = "3'b010" *) 
  (* AXI_ID_WIDTH_DEST = "1" *) 
  (* AXI_ID_WIDTH_SG = "1" *) 
  (* AXI_ID_WIDTH_SRC = "1" *) 
  (* AXI_SLICE_DEST = "1'b0" *) 
  (* AXI_SLICE_SRC = "1'b0" *) 
  (* BEATS_PER_BURST_LIMIT_DEST = "1024" *) 
  (* BEATS_PER_BURST_LIMIT_SRC = "256" *) 
  (* BYTES_PER_BEAT_WIDTH_DEST = "2" *) 
  (* BYTES_PER_BEAT_WIDTH_SG = "3" *) 
  (* BYTES_PER_BEAT_WIDTH_SRC = "3" *) 
  (* BYTES_PER_BURST_LIMIT = "2048" *) 
  (* BYTES_PER_BURST_LIMIT_DEST = "4096" *) 
  (* BYTES_PER_BURST_LIMIT_SRC = "2048" *) 
  (* BYTES_PER_BURST_WIDTH = "7" *) 
  (* CACHE_COHERENT = "1'b1" *) 
  (* CYCLIC = "1'b1" *) 
  (* DBG_ID_PADDING = "4" *) 
  (* DISABLE_DEBUG_REGISTERS = "1'b0" *) 
  (* DMA_2D_TLAST_MODE = "0" *) 
  (* DMA_2D_TRANSFER = "1'b0" *) 
  (* DMA_AXIS_DEST_W = "4" *) 
  (* DMA_AXIS_ID_W = "8" *) 
  (* DMA_AXI_ADDR_WIDTH = "31" *) 
  (* DMA_AXI_PROTOCOL_DEST = "0" *) 
  (* DMA_AXI_PROTOCOL_SG = "0" *) 
  (* DMA_AXI_PROTOCOL_SRC = "0" *) 
  (* DMA_DATA_WIDTH_DEST = "32" *) 
  (* DMA_DATA_WIDTH_SG = "64" *) 
  (* DMA_DATA_WIDTH_SRC = "64" *) 
  (* DMA_LENGTH_ALIGN = "2" *) 
  (* DMA_LENGTH_ALIGN_DEST = "2" *) 
  (* DMA_LENGTH_ALIGN_SRC = "0" *) 
  (* DMA_LENGTH_WIDTH = "24" *) 
  (* DMA_SG_TRANSFER = "1'b0" *) 
  (* DMA_TYPE_AXI_MM = "0" *) 
  (* DMA_TYPE_AXI_STREAM = "1" *) 
  (* DMA_TYPE_DEST = "1" *) 
  (* DMA_TYPE_FIFO = "2" *) 
  (* DMA_TYPE_SRC = "0" *) 
  (* ENABLE_DIAGNOSTICS_IF = "1'b0" *) 
  (* FIFO_SIZE = "8" *) 
  (* FRAMELOCK = "1'b0" *) 
  (* FRAMELOCK_MODE = "1'b1" *) 
  (* HAS_DEST_ADDR = "1'b0" *) 
  (* HAS_SRC_ADDR = "1'b1" *) 
  (* ID = "0" *) 
  (* ID_WIDTH = "4" *) 
  (* MAX_BYTES_PER_BURST = "128" *) 
  (* MAX_NUM_FRAMES_WIDTH = "3" *) 
  (* REAL_MAX_BYTES_PER_BURST = "128" *) 
  (* SYNC_TRANSFER_START = "1'b0" *) 
  (* USE_EXT_SYNC = "1'b0" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dmac inst
       (.dest_diag_level_bursts(NLW_inst_dest_diag_level_bursts_UNCONNECTED[7:0]),
        .dest_ext_sync(1'b0),
        .fifo_rd_clk(1'b0),
        .fifo_rd_dout(NLW_inst_fifo_rd_dout_UNCONNECTED[31:0]),
        .fifo_rd_en(1'b0),
        .fifo_rd_underflow(NLW_inst_fifo_rd_underflow_UNCONNECTED),
        .fifo_rd_valid(NLW_inst_fifo_rd_valid_UNCONNECTED),
        .fifo_rd_xfer_req(NLW_inst_fifo_rd_xfer_req_UNCONNECTED),
        .fifo_wr_clk(1'b0),
        .fifo_wr_din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .fifo_wr_en(1'b0),
        .fifo_wr_overflow(NLW_inst_fifo_wr_overflow_UNCONNECTED),
        .fifo_wr_xfer_req(NLW_inst_fifo_wr_xfer_req_UNCONNECTED),
        .irq(irq),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_data(m_axis_data),
        .m_axis_dest(NLW_inst_m_axis_dest_UNCONNECTED[3:0]),
        .m_axis_id(NLW_inst_m_axis_id_UNCONNECTED[7:0]),
        .m_axis_keep(NLW_inst_m_axis_keep_UNCONNECTED[3:0]),
        .m_axis_last(m_axis_last),
        .m_axis_ready(m_axis_ready),
        .m_axis_strb(NLW_inst_m_axis_strb_UNCONNECTED[3:0]),
        .m_axis_user(m_axis_user),
        .m_axis_valid(m_axis_valid),
        .m_axis_xfer_req(m_axis_xfer_req),
        .m_dest_axi_aclk(1'b0),
        .m_dest_axi_araddr(NLW_inst_m_dest_axi_araddr_UNCONNECTED[30:0]),
        .m_dest_axi_arburst(NLW_inst_m_dest_axi_arburst_UNCONNECTED[1:0]),
        .m_dest_axi_arcache(NLW_inst_m_dest_axi_arcache_UNCONNECTED[3:0]),
        .m_dest_axi_aresetn(1'b0),
        .m_dest_axi_arid(NLW_inst_m_dest_axi_arid_UNCONNECTED[0]),
        .m_dest_axi_arlen(NLW_inst_m_dest_axi_arlen_UNCONNECTED[7:0]),
        .m_dest_axi_arlock(NLW_inst_m_dest_axi_arlock_UNCONNECTED[0]),
        .m_dest_axi_arprot(NLW_inst_m_dest_axi_arprot_UNCONNECTED[2:0]),
        .m_dest_axi_arready(1'b0),
        .m_dest_axi_arsize(NLW_inst_m_dest_axi_arsize_UNCONNECTED[2:0]),
        .m_dest_axi_arvalid(NLW_inst_m_dest_axi_arvalid_UNCONNECTED),
        .m_dest_axi_awaddr(NLW_inst_m_dest_axi_awaddr_UNCONNECTED[30:0]),
        .m_dest_axi_awburst(NLW_inst_m_dest_axi_awburst_UNCONNECTED[1:0]),
        .m_dest_axi_awcache(NLW_inst_m_dest_axi_awcache_UNCONNECTED[3:0]),
        .m_dest_axi_awid(NLW_inst_m_dest_axi_awid_UNCONNECTED[0]),
        .m_dest_axi_awlen(NLW_inst_m_dest_axi_awlen_UNCONNECTED[7:0]),
        .m_dest_axi_awlock(NLW_inst_m_dest_axi_awlock_UNCONNECTED[0]),
        .m_dest_axi_awprot(NLW_inst_m_dest_axi_awprot_UNCONNECTED[2:0]),
        .m_dest_axi_awready(1'b0),
        .m_dest_axi_awsize(NLW_inst_m_dest_axi_awsize_UNCONNECTED[2:0]),
        .m_dest_axi_awvalid(NLW_inst_m_dest_axi_awvalid_UNCONNECTED),
        .m_dest_axi_bid(1'b0),
        .m_dest_axi_bready(NLW_inst_m_dest_axi_bready_UNCONNECTED),
        .m_dest_axi_bresp({1'b0,1'b0}),
        .m_dest_axi_bvalid(1'b0),
        .m_dest_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_dest_axi_rid(1'b0),
        .m_dest_axi_rlast(1'b0),
        .m_dest_axi_rready(NLW_inst_m_dest_axi_rready_UNCONNECTED),
        .m_dest_axi_rresp({1'b0,1'b0}),
        .m_dest_axi_rvalid(1'b0),
        .m_dest_axi_wdata(NLW_inst_m_dest_axi_wdata_UNCONNECTED[31:0]),
        .m_dest_axi_wid(NLW_inst_m_dest_axi_wid_UNCONNECTED[0]),
        .m_dest_axi_wlast(NLW_inst_m_dest_axi_wlast_UNCONNECTED),
        .m_dest_axi_wready(1'b0),
        .m_dest_axi_wstrb(NLW_inst_m_dest_axi_wstrb_UNCONNECTED[3:0]),
        .m_dest_axi_wvalid(NLW_inst_m_dest_axi_wvalid_UNCONNECTED),
        .m_frame_in({1'b0,1'b0,1'b0}),
        .m_frame_in_valid(1'b0),
        .m_frame_out(NLW_inst_m_frame_out_UNCONNECTED[2:0]),
        .m_frame_out_valid(NLW_inst_m_frame_out_valid_UNCONNECTED),
        .m_sg_axi_aclk(1'b0),
        .m_sg_axi_araddr(NLW_inst_m_sg_axi_araddr_UNCONNECTED[30:0]),
        .m_sg_axi_arburst(NLW_inst_m_sg_axi_arburst_UNCONNECTED[1:0]),
        .m_sg_axi_arcache(NLW_inst_m_sg_axi_arcache_UNCONNECTED[3:0]),
        .m_sg_axi_aresetn(1'b0),
        .m_sg_axi_arid(NLW_inst_m_sg_axi_arid_UNCONNECTED[0]),
        .m_sg_axi_arlen(NLW_inst_m_sg_axi_arlen_UNCONNECTED[7:0]),
        .m_sg_axi_arlock(NLW_inst_m_sg_axi_arlock_UNCONNECTED[0]),
        .m_sg_axi_arprot(NLW_inst_m_sg_axi_arprot_UNCONNECTED[2:0]),
        .m_sg_axi_arready(1'b0),
        .m_sg_axi_arsize(NLW_inst_m_sg_axi_arsize_UNCONNECTED[2:0]),
        .m_sg_axi_arvalid(NLW_inst_m_sg_axi_arvalid_UNCONNECTED),
        .m_sg_axi_awaddr(NLW_inst_m_sg_axi_awaddr_UNCONNECTED[30:0]),
        .m_sg_axi_awburst(NLW_inst_m_sg_axi_awburst_UNCONNECTED[1:0]),
        .m_sg_axi_awcache(NLW_inst_m_sg_axi_awcache_UNCONNECTED[3:0]),
        .m_sg_axi_awid(NLW_inst_m_sg_axi_awid_UNCONNECTED[0]),
        .m_sg_axi_awlen(NLW_inst_m_sg_axi_awlen_UNCONNECTED[7:0]),
        .m_sg_axi_awlock(NLW_inst_m_sg_axi_awlock_UNCONNECTED[0]),
        .m_sg_axi_awprot(NLW_inst_m_sg_axi_awprot_UNCONNECTED[2:0]),
        .m_sg_axi_awready(1'b0),
        .m_sg_axi_awsize(NLW_inst_m_sg_axi_awsize_UNCONNECTED[2:0]),
        .m_sg_axi_awvalid(NLW_inst_m_sg_axi_awvalid_UNCONNECTED),
        .m_sg_axi_bid(1'b0),
        .m_sg_axi_bready(NLW_inst_m_sg_axi_bready_UNCONNECTED),
        .m_sg_axi_bresp({1'b0,1'b0}),
        .m_sg_axi_bvalid(1'b0),
        .m_sg_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_sg_axi_rid(1'b0),
        .m_sg_axi_rlast(1'b0),
        .m_sg_axi_rready(NLW_inst_m_sg_axi_rready_UNCONNECTED),
        .m_sg_axi_rresp({1'b0,1'b0}),
        .m_sg_axi_rvalid(1'b0),
        .m_sg_axi_wdata(NLW_inst_m_sg_axi_wdata_UNCONNECTED[63:0]),
        .m_sg_axi_wid(NLW_inst_m_sg_axi_wid_UNCONNECTED[0]),
        .m_sg_axi_wlast(NLW_inst_m_sg_axi_wlast_UNCONNECTED),
        .m_sg_axi_wready(1'b0),
        .m_sg_axi_wstrb(NLW_inst_m_sg_axi_wstrb_UNCONNECTED[7:0]),
        .m_sg_axi_wvalid(NLW_inst_m_sg_axi_wvalid_UNCONNECTED),
        .m_src_axi_aclk(m_src_axi_aclk),
        .m_src_axi_araddr({\^m_src_axi_araddr ,NLW_inst_m_src_axi_araddr_UNCONNECTED[2:0]}),
        .m_src_axi_arburst(NLW_inst_m_src_axi_arburst_UNCONNECTED[1:0]),
        .m_src_axi_arcache(NLW_inst_m_src_axi_arcache_UNCONNECTED[3:0]),
        .m_src_axi_aresetn(1'b0),
        .m_src_axi_arid(NLW_inst_m_src_axi_arid_UNCONNECTED[0]),
        .m_src_axi_arlen({NLW_inst_m_src_axi_arlen_UNCONNECTED[7:4],\^m_src_axi_arlen }),
        .m_src_axi_arlock(NLW_inst_m_src_axi_arlock_UNCONNECTED[0]),
        .m_src_axi_arprot(NLW_inst_m_src_axi_arprot_UNCONNECTED[2:0]),
        .m_src_axi_arready(m_src_axi_arready),
        .m_src_axi_arsize(NLW_inst_m_src_axi_arsize_UNCONNECTED[2:0]),
        .m_src_axi_arvalid(m_src_axi_arvalid),
        .m_src_axi_awaddr(NLW_inst_m_src_axi_awaddr_UNCONNECTED[30:0]),
        .m_src_axi_awburst(NLW_inst_m_src_axi_awburst_UNCONNECTED[1:0]),
        .m_src_axi_awcache(NLW_inst_m_src_axi_awcache_UNCONNECTED[3:0]),
        .m_src_axi_awid(NLW_inst_m_src_axi_awid_UNCONNECTED[0]),
        .m_src_axi_awlen(NLW_inst_m_src_axi_awlen_UNCONNECTED[7:0]),
        .m_src_axi_awlock(NLW_inst_m_src_axi_awlock_UNCONNECTED[0]),
        .m_src_axi_awprot(NLW_inst_m_src_axi_awprot_UNCONNECTED[2:0]),
        .m_src_axi_awready(1'b0),
        .m_src_axi_awsize(NLW_inst_m_src_axi_awsize_UNCONNECTED[2:0]),
        .m_src_axi_awvalid(NLW_inst_m_src_axi_awvalid_UNCONNECTED),
        .m_src_axi_bid(1'b0),
        .m_src_axi_bready(NLW_inst_m_src_axi_bready_UNCONNECTED),
        .m_src_axi_bresp({1'b0,1'b0}),
        .m_src_axi_bvalid(1'b0),
        .m_src_axi_rdata(m_src_axi_rdata),
        .m_src_axi_rid(1'b0),
        .m_src_axi_rlast(m_src_axi_rlast),
        .m_src_axi_rready(NLW_inst_m_src_axi_rready_UNCONNECTED),
        .m_src_axi_rresp({1'b0,1'b0}),
        .m_src_axi_rvalid(m_src_axi_rvalid),
        .m_src_axi_wdata(NLW_inst_m_src_axi_wdata_UNCONNECTED[63:0]),
        .m_src_axi_wid(NLW_inst_m_src_axi_wid_UNCONNECTED[0]),
        .m_src_axi_wlast(NLW_inst_m_src_axi_wlast_UNCONNECTED),
        .m_src_axi_wready(1'b0),
        .m_src_axi_wstrb(NLW_inst_m_src_axi_wstrb_UNCONNECTED[7:0]),
        .m_src_axi_wvalid(NLW_inst_m_src_axi_wvalid_UNCONNECTED),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr({s_axi_araddr[10:2],1'b0,1'b0}),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr({s_axi_awaddr[10:2],1'b0,1'b0}),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(NLW_inst_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(NLW_inst_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axis_aclk(1'b0),
        .s_axis_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_dest({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_id({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_keep({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_last(1'b0),
        .s_axis_ready(NLW_inst_s_axis_ready_UNCONNECTED),
        .s_axis_strb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_user(1'b1),
        .s_axis_valid(1'b0),
        .s_axis_xfer_req(NLW_inst_s_axis_xfer_req_UNCONNECTED),
        .s_frame_in({1'b0,1'b0,1'b0}),
        .s_frame_in_valid(1'b0),
        .s_frame_out(NLW_inst_s_frame_out_UNCONNECTED[2:0]),
        .s_frame_out_valid(NLW_inst_s_frame_out_valid_UNCONNECTED),
        .src_ext_sync(1'b0),
        .sync(1'b1));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_axi
   (SR,
    up_wreq,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    up_rreq,
    s_axi_arready,
    up_axi_rvalid_int_reg_0,
    up_dma_req_valid_reg,
    Q,
    up_dma_cyclic,
    D,
    up_wreq_int_reg_0,
    up_wreq_int_reg_1,
    E,
    up_wreq_int_reg_2,
    up_wreq_int_reg_3,
    \up_scratch_reg[31] ,
    \up_raddr_int_reg[6]_0 ,
    \up_raddr_int_reg[1]_0 ,
    \up_raddr_int_reg[4]_0 ,
    \up_waddr_int_reg[0]_0 ,
    p_8_in,
    s_axi_rdata,
    s_axi_aclk,
    up_dma_req_valid,
    s_axi_aresetn,
    up_sot,
    up_dma_req_valid_reg_0,
    up_eot,
    \up_irq_source_reg[1] ,
    up_wack,
    s_axi_bready,
    s_axi_wvalid,
    s_axi_awvalid,
    up_rack,
    s_axi_arvalid,
    m_src_axi_araddr,
    \up_rdata_reg[8] ,
    ADDRD,
    \up_rdata_reg[9] ,
    \up_rdata_reg[10] ,
    \up_rdata_d_reg[31]_0 ,
    \up_rdata_reg[31] ,
    \up_rdata_reg[1] ,
    dbg_status,
    \up_rdata_reg[27] ,
    ADDRC,
    \up_rdata_reg[26] ,
    \up_rdata_reg[25] ,
    \up_rdata_reg[24] ,
    dbg_ids0,
    dbg_ids1,
    ctrl_pause,
    \up_rdata_reg[1]_0 ,
    \up_rdata_reg[0] ,
    \up_rdata[2]_i_2_0 ,
    \up_rdata_reg[1]_i_6_0 ,
    \up_rdata_reg[31]_0 ,
    \up_rdata_reg[23]_i_3_0 ,
    \up_rdata_reg[1]_i_6_1 ,
    \up_rdata[30]_i_2_0 ,
    \up_rdata_reg[23]_i_3_1 ,
    s_axi_rready,
    p_3_in,
    up_dma_req_cyclic,
    \up_rdata[1]_i_8_0 ,
    s_axi_wdata,
    s_axi_awaddr,
    s_axi_araddr);
  output [0:0]SR;
  output up_wreq;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output up_rreq;
  output s_axi_arready;
  output up_axi_rvalid_int_reg_0;
  output up_dma_req_valid_reg;
  output [31:0]Q;
  output up_dma_cyclic;
  output [1:0]D;
  output [0:0]up_wreq_int_reg_0;
  output [0:0]up_wreq_int_reg_1;
  output [0:0]E;
  output up_wreq_int_reg_2;
  output [0:0]up_wreq_int_reg_3;
  output [31:0]\up_scratch_reg[31] ;
  output \up_raddr_int_reg[6]_0 ;
  output \up_raddr_int_reg[1]_0 ;
  output [2:0]\up_raddr_int_reg[4]_0 ;
  output [0:0]\up_waddr_int_reg[0]_0 ;
  output p_8_in;
  output [31:0]s_axi_rdata;
  input s_axi_aclk;
  input up_dma_req_valid;
  input s_axi_aresetn;
  input up_sot;
  input up_dma_req_valid_reg_0;
  input up_eot;
  input [1:0]\up_irq_source_reg[1] ;
  input up_wack;
  input s_axi_bready;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input up_rack;
  input s_axi_arvalid;
  input [27:0]m_src_axi_araddr;
  input [0:0]\up_rdata_reg[8] ;
  input [3:0]ADDRD;
  input [0:0]\up_rdata_reg[9] ;
  input [0:0]\up_rdata_reg[10] ;
  input [31:0]\up_rdata_d_reg[31]_0 ;
  input [31:0]\up_rdata_reg[31] ;
  input \up_rdata_reg[1] ;
  input [4:0]dbg_status;
  input \up_rdata_reg[27] ;
  input [3:0]ADDRC;
  input \up_rdata_reg[26] ;
  input \up_rdata_reg[25] ;
  input \up_rdata_reg[24] ;
  input [5:0]dbg_ids0;
  input [1:0]dbg_ids1;
  input ctrl_pause;
  input [1:0]\up_rdata_reg[1]_0 ;
  input \up_rdata_reg[0] ;
  input \up_rdata[2]_i_2_0 ;
  input [25:0]\up_rdata_reg[1]_i_6_0 ;
  input [3:0]\up_rdata_reg[31]_0 ;
  input [22:0]\up_rdata_reg[23]_i_3_0 ;
  input [1:0]\up_rdata_reg[1]_i_6_1 ;
  input [32:0]\up_rdata[30]_i_2_0 ;
  input [16:0]\up_rdata_reg[23]_i_3_1 ;
  input s_axi_rready;
  input [0:0]p_3_in;
  input up_dma_req_cyclic;
  input [1:0]\up_rdata[1]_i_8_0 ;
  input [31:0]s_axi_wdata;
  input [8:0]s_axi_awaddr;
  input [8:0]s_axi_araddr;

  wire [3:0]ADDRC;
  wire [3:0]ADDRD;
  wire [1:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire [0:0]SR;
  wire ctrl_enable_i_2_n_0;
  wire ctrl_enable_i_3_n_0;
  wire ctrl_pause;
  wire [31:2]data10;
  wire [5:0]dbg_ids0;
  wire [1:0]dbg_ids1;
  wire [4:0]dbg_status;
  wire \i_regmap_request/up_dma_req_valid0 ;
  wire \m_axis_raddr_reg[2]_i_6_n_0 ;
  wire \m_axis_raddr_reg[2]_i_7_n_0 ;
  wire [27:0]m_src_axi_araddr;
  wire p_0_in6_in;
  wire p_0_in7_in;
  wire p_1_in;
  wire [4:0]p_2_in;
  wire [0:0]p_3_in;
  wire p_5_in;
  wire p_8_in;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [8:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire up_axi_arready_int_i_1_n_0;
  wire up_axi_awready_int_i_2_n_0;
  wire up_axi_bvalid_int_i_1_n_0;
  wire \up_axi_rdata_int[31]_i_1_n_0 ;
  wire up_axi_rvalid_int_i_1_n_0;
  wire up_axi_rvalid_int_reg_0;
  wire up_axi_wready_int_i_1_n_0;
  wire up_dma_cyclic;
  wire up_dma_cyclic_i_2_n_0;
  wire \up_dma_dest_address[30]_i_2_n_0 ;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire up_dma_req_valid_reg;
  wire up_dma_req_valid_reg_0;
  wire \up_dma_src_address[30]_i_2_n_0 ;
  wire \up_dma_x_length[23]_i_2_n_0 ;
  wire \up_dma_x_length[23]_i_3_n_0 ;
  wire up_eot;
  wire \up_irq_mask[1]_i_2_n_0 ;
  wire \up_irq_mask[1]_i_3_n_0 ;
  wire \up_irq_source[1]_i_3_n_0 ;
  wire up_irq_source_clear1__6;
  wire [1:0]\up_irq_source_reg[1] ;
  wire up_rack;
  wire up_rack_d;
  wire up_rack_s;
  wire [8:0]up_raddr;
  wire \up_raddr_int_reg[1]_0 ;
  wire [2:0]\up_raddr_int_reg[4]_0 ;
  wire \up_raddr_int_reg[6]_0 ;
  wire \up_rcount[0]_i_1_n_0 ;
  wire \up_rcount[1]_i_1_n_0 ;
  wire \up_rcount[2]_i_1_n_0 ;
  wire \up_rcount[3]_i_1_n_0 ;
  wire \up_rcount[4]_i_1_n_0 ;
  wire \up_rcount[4]_i_2_n_0 ;
  wire \up_rcount_reg_n_0_[0] ;
  wire \up_rcount_reg_n_0_[1] ;
  wire \up_rcount_reg_n_0_[2] ;
  wire \up_rcount_reg_n_0_[3] ;
  wire \up_rdata[0]_i_10_n_0 ;
  wire \up_rdata[0]_i_11_n_0 ;
  wire \up_rdata[0]_i_3_n_0 ;
  wire \up_rdata[0]_i_4_n_0 ;
  wire \up_rdata[0]_i_5_n_0 ;
  wire \up_rdata[0]_i_6_n_0 ;
  wire \up_rdata[0]_i_8_n_0 ;
  wire \up_rdata[0]_i_9_n_0 ;
  wire \up_rdata[10]_i_2_n_0 ;
  wire \up_rdata[10]_i_3_n_0 ;
  wire \up_rdata[10]_i_5_n_0 ;
  wire \up_rdata[10]_i_6_n_0 ;
  wire \up_rdata[11]_i_2_n_0 ;
  wire \up_rdata[11]_i_3_n_0 ;
  wire \up_rdata[11]_i_5_n_0 ;
  wire \up_rdata[11]_i_6_n_0 ;
  wire \up_rdata[12]_i_2_n_0 ;
  wire \up_rdata[12]_i_4_n_0 ;
  wire \up_rdata[12]_i_5_n_0 ;
  wire \up_rdata[13]_i_2_n_0 ;
  wire \up_rdata[13]_i_4_n_0 ;
  wire \up_rdata[13]_i_5_n_0 ;
  wire \up_rdata[14]_i_2_n_0 ;
  wire \up_rdata[14]_i_4_n_0 ;
  wire \up_rdata[14]_i_5_n_0 ;
  wire \up_rdata[15]_i_2_n_0 ;
  wire \up_rdata[15]_i_4_n_0 ;
  wire \up_rdata[15]_i_5_n_0 ;
  wire \up_rdata[16]_i_2_n_0 ;
  wire \up_rdata[16]_i_3_n_0 ;
  wire \up_rdata[16]_i_5_n_0 ;
  wire \up_rdata[16]_i_6_n_0 ;
  wire \up_rdata[17]_i_2_n_0 ;
  wire \up_rdata[17]_i_3_n_0 ;
  wire \up_rdata[17]_i_5_n_0 ;
  wire \up_rdata[17]_i_6_n_0 ;
  wire \up_rdata[18]_i_2_n_0 ;
  wire \up_rdata[18]_i_3_n_0 ;
  wire \up_rdata[18]_i_5_n_0 ;
  wire \up_rdata[18]_i_6_n_0 ;
  wire \up_rdata[19]_i_2_n_0 ;
  wire \up_rdata[19]_i_3_n_0 ;
  wire \up_rdata[19]_i_5_n_0 ;
  wire \up_rdata[19]_i_6_n_0 ;
  wire \up_rdata[1]_i_10_n_0 ;
  wire \up_rdata[1]_i_3_n_0 ;
  wire \up_rdata[1]_i_4_n_0 ;
  wire \up_rdata[1]_i_5_n_0 ;
  wire \up_rdata[1]_i_7_n_0 ;
  wire [1:0]\up_rdata[1]_i_8_0 ;
  wire \up_rdata[1]_i_8_n_0 ;
  wire \up_rdata[1]_i_9_n_0 ;
  wire \up_rdata[20]_i_2_n_0 ;
  wire \up_rdata[20]_i_4_n_0 ;
  wire \up_rdata[20]_i_5_n_0 ;
  wire \up_rdata[21]_i_2_n_0 ;
  wire \up_rdata[21]_i_4_n_0 ;
  wire \up_rdata[21]_i_5_n_0 ;
  wire \up_rdata[22]_i_2_n_0 ;
  wire \up_rdata[22]_i_4_n_0 ;
  wire \up_rdata[22]_i_5_n_0 ;
  wire \up_rdata[23]_i_2_n_0 ;
  wire \up_rdata[23]_i_4_n_0 ;
  wire \up_rdata[23]_i_5_n_0 ;
  wire \up_rdata[24]_i_2_n_0 ;
  wire \up_rdata[24]_i_3_n_0 ;
  wire \up_rdata[24]_i_4_n_0 ;
  wire \up_rdata[25]_i_2_n_0 ;
  wire \up_rdata[25]_i_3_n_0 ;
  wire \up_rdata[25]_i_4_n_0 ;
  wire \up_rdata[26]_i_2_n_0 ;
  wire \up_rdata[26]_i_3_n_0 ;
  wire \up_rdata[26]_i_4_n_0 ;
  wire \up_rdata[27]_i_2_n_0 ;
  wire \up_rdata[27]_i_3_n_0 ;
  wire \up_rdata[27]_i_4_n_0 ;
  wire \up_rdata[28]_i_2_n_0 ;
  wire \up_rdata[28]_i_3_n_0 ;
  wire \up_rdata[29]_i_2_n_0 ;
  wire \up_rdata[29]_i_3_n_0 ;
  wire \up_rdata[2]_i_2_0 ;
  wire \up_rdata[2]_i_2_n_0 ;
  wire \up_rdata[2]_i_3_n_0 ;
  wire \up_rdata[2]_i_5_n_0 ;
  wire [32:0]\up_rdata[30]_i_2_0 ;
  wire \up_rdata[30]_i_2_n_0 ;
  wire \up_rdata[30]_i_3_n_0 ;
  wire \up_rdata[30]_i_4_n_0 ;
  wire \up_rdata[31]_i_10_n_0 ;
  wire \up_rdata[31]_i_11_n_0 ;
  wire \up_rdata[31]_i_12_n_0 ;
  wire \up_rdata[31]_i_13_n_0 ;
  wire \up_rdata[31]_i_14_n_0 ;
  wire \up_rdata[31]_i_17_n_0 ;
  wire \up_rdata[31]_i_18_n_0 ;
  wire \up_rdata[31]_i_19_n_0 ;
  wire \up_rdata[31]_i_20_n_0 ;
  wire \up_rdata[31]_i_2_n_0 ;
  wire \up_rdata[31]_i_6_n_0 ;
  wire \up_rdata[31]_i_7_n_0 ;
  wire \up_rdata[31]_i_8_n_0 ;
  wire \up_rdata[31]_i_9_n_0 ;
  wire \up_rdata[3]_i_2_n_0 ;
  wire \up_rdata[3]_i_3_n_0 ;
  wire \up_rdata[3]_i_5_n_0 ;
  wire \up_rdata[3]_i_6_n_0 ;
  wire \up_rdata[3]_i_7_n_0 ;
  wire \up_rdata[4]_i_2_n_0 ;
  wire \up_rdata[4]_i_3_n_0 ;
  wire \up_rdata[4]_i_5_n_0 ;
  wire \up_rdata[4]_i_6_n_0 ;
  wire \up_rdata[5]_i_2_n_0 ;
  wire \up_rdata[5]_i_3_n_0 ;
  wire \up_rdata[5]_i_5_n_0 ;
  wire \up_rdata[5]_i_6_n_0 ;
  wire \up_rdata[6]_i_2_n_0 ;
  wire \up_rdata[6]_i_3_n_0 ;
  wire \up_rdata[6]_i_5_n_0 ;
  wire \up_rdata[6]_i_6_n_0 ;
  wire \up_rdata[7]_i_2_n_0 ;
  wire \up_rdata[7]_i_4_n_0 ;
  wire \up_rdata[7]_i_5_n_0 ;
  wire \up_rdata[8]_i_2_n_0 ;
  wire \up_rdata[8]_i_3_n_0 ;
  wire \up_rdata[8]_i_5_n_0 ;
  wire \up_rdata[8]_i_6_n_0 ;
  wire \up_rdata[9]_i_2_n_0 ;
  wire \up_rdata[9]_i_3_n_0 ;
  wire \up_rdata[9]_i_5_n_0 ;
  wire \up_rdata[9]_i_6_n_0 ;
  wire [31:0]up_rdata_d;
  wire \up_rdata_d[13]_i_1_n_0 ;
  wire \up_rdata_d[17]_i_1_n_0 ;
  wire \up_rdata_d[1]_i_1_n_0 ;
  wire \up_rdata_d[20]_i_1_n_0 ;
  wire \up_rdata_d[22]_i_1_n_0 ;
  wire \up_rdata_d[24]_i_1_n_0 ;
  wire \up_rdata_d[29]_i_1_n_0 ;
  wire \up_rdata_d[4]_i_1_n_0 ;
  wire \up_rdata_d[6]_i_1_n_0 ;
  wire \up_rdata_d[8]_i_1_n_0 ;
  wire [31:0]\up_rdata_d_reg[31]_0 ;
  wire \up_rdata_reg[0] ;
  wire \up_rdata_reg[0]_i_7_n_0 ;
  wire [0:0]\up_rdata_reg[10] ;
  wire \up_rdata_reg[10]_i_4_n_0 ;
  wire \up_rdata_reg[11]_i_4_n_0 ;
  wire \up_rdata_reg[12]_i_3_n_0 ;
  wire \up_rdata_reg[13]_i_3_n_0 ;
  wire \up_rdata_reg[14]_i_3_n_0 ;
  wire \up_rdata_reg[15]_i_3_n_0 ;
  wire \up_rdata_reg[16]_i_4_n_0 ;
  wire \up_rdata_reg[17]_i_4_n_0 ;
  wire \up_rdata_reg[18]_i_4_n_0 ;
  wire \up_rdata_reg[19]_i_4_n_0 ;
  wire \up_rdata_reg[1] ;
  wire [1:0]\up_rdata_reg[1]_0 ;
  wire [25:0]\up_rdata_reg[1]_i_6_0 ;
  wire [1:0]\up_rdata_reg[1]_i_6_1 ;
  wire \up_rdata_reg[1]_i_6_n_0 ;
  wire \up_rdata_reg[20]_i_3_n_0 ;
  wire \up_rdata_reg[21]_i_3_n_0 ;
  wire \up_rdata_reg[22]_i_3_n_0 ;
  wire [22:0]\up_rdata_reg[23]_i_3_0 ;
  wire [16:0]\up_rdata_reg[23]_i_3_1 ;
  wire \up_rdata_reg[23]_i_3_n_0 ;
  wire \up_rdata_reg[24] ;
  wire \up_rdata_reg[25] ;
  wire \up_rdata_reg[26] ;
  wire \up_rdata_reg[27] ;
  wire [31:0]\up_rdata_reg[31] ;
  wire [3:0]\up_rdata_reg[31]_0 ;
  wire \up_rdata_reg[31]_i_15_n_0 ;
  wire \up_rdata_reg[31]_i_16_n_0 ;
  wire \up_rdata_reg[3]_i_4_n_0 ;
  wire \up_rdata_reg[4]_i_4_n_0 ;
  wire \up_rdata_reg[5]_i_4_n_0 ;
  wire \up_rdata_reg[6]_i_4_n_0 ;
  wire \up_rdata_reg[7]_i_3_n_0 ;
  wire [0:0]\up_rdata_reg[8] ;
  wire \up_rdata_reg[8]_i_4_n_0 ;
  wire [0:0]\up_rdata_reg[9] ;
  wire \up_rdata_reg[9]_i_4_n_0 ;
  wire [31:0]up_rdata_s;
  wire up_rreq;
  wire up_rreq_int_i_1_n_0;
  wire up_rsel_inv_i_1_n_0;
  wire \up_scratch[31]_i_2_n_0 ;
  wire [31:0]\up_scratch_reg[31] ;
  wire up_sot;
  wire up_wack;
  wire up_wack_d;
  wire up_wack_s;
  wire up_wack_s_0;
  wire [8:0]up_waddr;
  wire [0:0]\up_waddr_int_reg[0]_0 ;
  wire \up_wcount[4]_i_1_n_0 ;
  wire \up_wcount_reg_n_0_[0] ;
  wire \up_wcount_reg_n_0_[1] ;
  wire \up_wcount_reg_n_0_[2] ;
  wire \up_wcount_reg_n_0_[3] ;
  wire up_wreq;
  wire up_wreq_int_i_1_n_0;
  wire [0:0]up_wreq_int_reg_0;
  wire [0:0]up_wreq_int_reg_1;
  wire up_wreq_int_reg_2;
  wire [0:0]up_wreq_int_reg_3;
  wire up_wsel_inv_i_1_n_0;

  LUT6 #(
    .INIT(64'h0000000200000000)) 
    ctrl_enable_i_1
       (.I0(up_wreq),
        .I1(ctrl_enable_i_2_n_0),
        .I2(up_waddr[2]),
        .I3(up_waddr[1]),
        .I4(ctrl_enable_i_3_n_0),
        .I5(up_waddr[8]),
        .O(up_wreq_int_reg_2));
  LUT4 #(
    .INIT(16'hFFFE)) 
    ctrl_enable_i_2
       (.I0(up_waddr[0]),
        .I1(up_waddr[7]),
        .I2(up_waddr[5]),
        .I3(up_waddr[6]),
        .O(ctrl_enable_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ctrl_enable_i_3
       (.I0(up_waddr[4]),
        .I1(up_waddr[3]),
        .O(ctrl_enable_i_3_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    \m_axis_raddr_reg[2]_i_4 
       (.I0(\m_axis_raddr_reg[2]_i_6_n_0 ),
        .I1(\m_axis_raddr_reg[2]_i_7_n_0 ),
        .I2(\up_raddr_int_reg[4]_0 [2]),
        .I3(up_rreq),
        .O(p_8_in));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_axis_raddr_reg[2]_i_6 
       (.I0(up_raddr[1]),
        .I1(up_raddr[7]),
        .I2(up_raddr[5]),
        .I3(up_raddr[6]),
        .O(\m_axis_raddr_reg[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \m_axis_raddr_reg[2]_i_7 
       (.I0(\up_raddr_int_reg[4]_0 [1]),
        .I1(up_raddr[0]),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(up_raddr[8]),
        .O(\m_axis_raddr_reg[2]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_arready_int_i_1
       (.I0(s_axi_arready),
        .I1(up_rack_s),
        .O(up_axi_arready_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_arready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_arready_int_i_1_n_0),
        .Q(s_axi_arready),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    up_axi_awready_int_i_1
       (.I0(s_axi_aresetn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_awready_int_i_2
       (.I0(s_axi_awready),
        .I1(up_wack_s_0),
        .O(up_axi_awready_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_awready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_awready_int_i_2_n_0),
        .Q(s_axi_awready),
        .R(SR));
  LUT4 #(
    .INIT(16'h0C88)) 
    up_axi_bvalid_int_i_1
       (.I0(up_wack_d),
        .I1(s_axi_aresetn),
        .I2(s_axi_bready),
        .I3(s_axi_bvalid),
        .O(up_axi_bvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_bvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_bvalid_int_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8F)) 
    \up_axi_rdata_int[31]_i_1 
       (.I0(up_axi_rvalid_int_reg_0),
        .I1(s_axi_rready),
        .I2(s_axi_aresetn),
        .O(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[0]),
        .Q(s_axi_rdata[0]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[10]),
        .Q(s_axi_rdata[10]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[11]),
        .Q(s_axi_rdata[11]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[12]),
        .Q(s_axi_rdata[12]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[13]),
        .Q(s_axi_rdata[13]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[14]),
        .Q(s_axi_rdata[14]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[15]),
        .Q(s_axi_rdata[15]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[16]),
        .Q(s_axi_rdata[16]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[17]),
        .Q(s_axi_rdata[17]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[18]),
        .Q(s_axi_rdata[18]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[19]),
        .Q(s_axi_rdata[19]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[1]),
        .Q(s_axi_rdata[1]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[20]),
        .Q(s_axi_rdata[20]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[21]),
        .Q(s_axi_rdata[21]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[22]),
        .Q(s_axi_rdata[22]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[23]),
        .Q(s_axi_rdata[23]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[24]),
        .Q(s_axi_rdata[24]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[25]),
        .Q(s_axi_rdata[25]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[26]),
        .Q(s_axi_rdata[26]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[27]),
        .Q(s_axi_rdata[27]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[28]),
        .Q(s_axi_rdata[28]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[29]),
        .Q(s_axi_rdata[29]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[2]),
        .Q(s_axi_rdata[2]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[30]),
        .Q(s_axi_rdata[30]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[31]),
        .Q(s_axi_rdata[31]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[3]),
        .Q(s_axi_rdata[3]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[4]),
        .Q(s_axi_rdata[4]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[5]),
        .Q(s_axi_rdata[5]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[6]),
        .Q(s_axi_rdata[6]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[7]),
        .Q(s_axi_rdata[7]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[8]),
        .Q(s_axi_rdata[8]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_axi_rdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(up_rack_d),
        .D(up_rdata_d[9]),
        .Q(s_axi_rdata[9]),
        .R(\up_axi_rdata_int[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C88)) 
    up_axi_rvalid_int_i_1
       (.I0(up_rack_d),
        .I1(s_axi_aresetn),
        .I2(s_axi_rready),
        .I3(up_axi_rvalid_int_reg_0),
        .O(up_axi_rvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_rvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_rvalid_int_i_1_n_0),
        .Q(up_axi_rvalid_int_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_wready_int_i_1
       (.I0(s_axi_wready),
        .I1(up_wack_s_0),
        .O(up_axi_wready_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_wready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_wready_int_i_1_n_0),
        .Q(s_axi_wready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    up_dma_cyclic_i_1
       (.I0(up_wreq),
        .I1(up_waddr[6]),
        .I2(up_waddr[7]),
        .I3(up_waddr[8]),
        .I4(up_dma_cyclic_i_2_n_0),
        .O(up_dma_cyclic));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    up_dma_cyclic_i_2
       (.I0(up_waddr[5]),
        .I1(up_waddr[4]),
        .I2(up_waddr[1]),
        .I3(up_waddr[0]),
        .I4(up_waddr[3]),
        .I5(up_waddr[2]),
        .O(up_dma_cyclic_i_2_n_0));
  LUT5 #(
    .INIT(32'h02000000)) 
    \up_dma_dest_address[30]_i_1 
       (.I0(up_wreq),
        .I1(up_waddr[6]),
        .I2(up_waddr[7]),
        .I3(up_waddr[8]),
        .I4(\up_dma_dest_address[30]_i_2_n_0 ),
        .O(up_wreq_int_reg_1));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \up_dma_dest_address[30]_i_2 
       (.I0(up_waddr[5]),
        .I1(up_waddr[4]),
        .I2(up_waddr[1]),
        .I3(up_waddr[2]),
        .I4(up_waddr[3]),
        .I5(up_waddr[0]),
        .O(\up_dma_dest_address[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hE000E0A000000000)) 
    up_dma_req_valid_i_1
       (.I0(up_dma_req_valid),
        .I1(Q[0]),
        .I2(s_axi_aresetn),
        .I3(\i_regmap_request/up_dma_req_valid0 ),
        .I4(up_sot),
        .I5(up_dma_req_valid_reg_0),
        .O(up_dma_req_valid_reg));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    up_dma_req_valid_i_2
       (.I0(up_wreq),
        .I1(ctrl_enable_i_2_n_0),
        .I2(up_waddr[2]),
        .I3(up_waddr[8]),
        .I4(ctrl_enable_i_3_n_0),
        .I5(up_waddr[1]),
        .O(\i_regmap_request/up_dma_req_valid0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \up_dma_src_address[30]_i_1 
       (.I0(up_wreq),
        .I1(up_waddr[6]),
        .I2(up_waddr[7]),
        .I3(up_waddr[8]),
        .I4(\up_dma_src_address[30]_i_2_n_0 ),
        .O(up_wreq_int_reg_0));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \up_dma_src_address[30]_i_2 
       (.I0(up_waddr[5]),
        .I1(up_waddr[4]),
        .I2(up_waddr[2]),
        .I3(up_waddr[0]),
        .I4(up_waddr[3]),
        .I5(up_waddr[1]),
        .O(\up_dma_src_address[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \up_dma_x_length[23]_i_1 
       (.I0(up_waddr[0]),
        .I1(up_waddr[3]),
        .I2(\up_dma_x_length[23]_i_2_n_0 ),
        .I3(\up_dma_x_length[23]_i_3_n_0 ),
        .I4(up_waddr[4]),
        .I5(up_waddr[5]),
        .O(\up_waddr_int_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \up_dma_x_length[23]_i_2 
       (.I0(up_waddr[2]),
        .I1(up_waddr[8]),
        .I2(up_wreq),
        .I3(up_waddr[1]),
        .O(\up_dma_x_length[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \up_dma_x_length[23]_i_3 
       (.I0(up_waddr[7]),
        .I1(up_waddr[6]),
        .O(\up_dma_x_length[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \up_irq_mask[1]_i_1 
       (.I0(up_wreq),
        .I1(up_waddr[6]),
        .I2(up_waddr[0]),
        .I3(\up_irq_mask[1]_i_2_n_0 ),
        .I4(\up_irq_mask[1]_i_3_n_0 ),
        .I5(up_waddr[5]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \up_irq_mask[1]_i_2 
       (.I0(up_waddr[7]),
        .I1(up_waddr[8]),
        .O(\up_irq_mask[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \up_irq_mask[1]_i_3 
       (.I0(up_waddr[3]),
        .I1(up_waddr[4]),
        .I2(up_waddr[1]),
        .I3(up_waddr[2]),
        .O(\up_irq_mask[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hBFAA)) 
    \up_irq_source[0]_i_1 
       (.I0(up_sot),
        .I1(up_irq_source_clear1__6),
        .I2(Q[0]),
        .I3(\up_irq_source_reg[1] [0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hBFAA)) 
    \up_irq_source[1]_i_1 
       (.I0(up_eot),
        .I1(up_irq_source_clear1__6),
        .I2(Q[1]),
        .I3(\up_irq_source_reg[1] [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \up_irq_source[1]_i_2 
       (.I0(up_wreq),
        .I1(\up_irq_source[1]_i_3_n_0 ),
        .I2(up_waddr[2]),
        .I3(up_waddr[5]),
        .I4(ctrl_enable_i_3_n_0),
        .I5(up_waddr[0]),
        .O(up_irq_source_clear1__6));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \up_irq_source[1]_i_3 
       (.I0(up_waddr[8]),
        .I1(up_waddr[7]),
        .I2(up_waddr[1]),
        .I3(up_waddr[6]),
        .O(\up_irq_source[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAAA0000AAAA0000)) 
    up_rack_d_i_1
       (.I0(up_rack),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(\up_rcount_reg_n_0_[1] ),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(p_0_in6_in),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rack_s));
  FDRE #(
    .INIT(1'b0)) 
    up_rack_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rack_s),
        .Q(up_rack_d),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[0]),
        .Q(up_raddr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[1]),
        .Q(up_raddr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[2]),
        .Q(\up_raddr_int_reg[4]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[3]),
        .Q(\up_raddr_int_reg[4]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[4]),
        .Q(\up_raddr_int_reg[4]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[5]),
        .Q(up_raddr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[6]),
        .Q(up_raddr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[7]),
        .Q(up_raddr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(s_axi_araddr[8]),
        .Q(up_raddr[8]),
        .R(SR));
  LUT3 #(
    .INIT(8'h04)) 
    \up_rcount[0]_i_1 
       (.I0(\up_rcount_reg_n_0_[0] ),
        .I1(p_0_in6_in),
        .I2(up_rack),
        .O(\up_rcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \up_rcount[1]_i_1 
       (.I0(\up_rcount_reg_n_0_[1] ),
        .I1(\up_rcount_reg_n_0_[0] ),
        .I2(p_0_in6_in),
        .I3(up_rack),
        .O(\up_rcount[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00007080)) 
    \up_rcount[2]_i_1 
       (.I0(\up_rcount_reg_n_0_[1] ),
        .I1(\up_rcount_reg_n_0_[0] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(up_rack),
        .O(\up_rcount[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000006A00AA00)) 
    \up_rcount[3]_i_1 
       (.I0(\up_rcount_reg_n_0_[3] ),
        .I1(\up_rcount_reg_n_0_[1] ),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(p_0_in6_in),
        .I4(\up_rcount_reg_n_0_[2] ),
        .I5(up_rack),
        .O(\up_rcount[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \up_rcount[4]_i_1 
       (.I0(p_0_in6_in),
        .I1(up_rreq),
        .O(\up_rcount[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00FF7FFFFFFF)) 
    \up_rcount[4]_i_2 
       (.I0(\up_rcount_reg_n_0_[3] ),
        .I1(\up_rcount_reg_n_0_[1] ),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(p_0_in6_in),
        .I4(\up_rcount_reg_n_0_[2] ),
        .I5(up_rack),
        .O(\up_rcount[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[0]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[1]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[2]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[3]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[4]_i_2_n_0 ),
        .Q(p_0_in6_in),
        .R(SR));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \up_rdata[0]_i_1 
       (.I0(\up_rdata_reg[0] ),
        .I1(\up_rdata[0]_i_3_n_0 ),
        .I2(\up_rdata[31]_i_6_n_0 ),
        .I3(\up_rdata[0]_i_4_n_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[0]_i_5_n_0 ),
        .O(\up_scratch_reg[31] [0]));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \up_rdata[0]_i_10 
       (.I0(\up_raddr_int_reg[4]_0 [0]),
        .I1(\up_raddr_int_reg[4]_0 [2]),
        .I2(\up_raddr_int_reg[4]_0 [1]),
        .I3(\up_rdata_reg[1]_i_6_1 [0]),
        .O(\up_rdata[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAABFBFFFFABFB)) 
    \up_rdata[0]_i_11 
       (.I0(\up_raddr_int_reg[4]_0 [0]),
        .I1(up_dma_req_cyclic),
        .I2(\up_raddr_int_reg[4]_0 [2]),
        .I3(\up_rdata_reg[1]_i_6_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .I5(\up_rdata[1]_i_8_0 [0]),
        .O(\up_rdata[0]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h38083B08)) 
    \up_rdata[0]_i_3 
       (.I0(up_dma_req_valid_reg_0),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_irq_source_reg[1] [0]),
        .I4(\up_rdata_reg[1]_0 [0]),
        .O(\up_rdata[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \up_rdata[0]_i_4 
       (.I0(\up_rdata_reg[1]_0 [0]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB0B3B0B0)) 
    \up_rdata[0]_i_5 
       (.I0(\up_rdata_reg[31] [0]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata[0]_i_6_n_0 ),
        .O(\up_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0074337700740044)) 
    \up_rdata[0]_i_6 
       (.I0(\up_rdata_reg[0]_i_7_n_0 ),
        .I1(up_raddr[0]),
        .I2(\up_rdata[0]_i_8_n_0 ),
        .I3(up_raddr[5]),
        .I4(up_raddr[1]),
        .I5(\up_rdata[0]_i_9_n_0 ),
        .O(\up_rdata[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h05004F4F05004A4A)) 
    \up_rdata[0]_i_8 
       (.I0(\up_raddr_int_reg[4]_0 [0]),
        .I1(\up_rdata_reg[31]_0 [0]),
        .I2(\up_raddr_int_reg[4]_0 [1]),
        .I3(\up_rdata_reg[23]_i_3_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(up_dma_req_valid),
        .O(\up_rdata[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    \up_rdata[0]_i_9 
       (.I0(up_raddr[5]),
        .I1(\up_raddr_int_reg[4]_0 [2]),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(\up_raddr_int_reg[4]_0 [1]),
        .I4(\up_rdata_reg[1]_i_6_0 [24]),
        .O(\up_rdata[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F0F200F2)) 
    \up_rdata[10]_i_2 
       (.I0(\up_rdata_reg[10]_i_4_n_0 ),
        .I1(\up_rdata[31]_i_14_n_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[31] [10]),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0A008A8000008A8)) 
    \up_rdata[10]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(m_src_axi_araddr[7]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata_reg[10] ),
        .I4(\up_raddr_int_reg[1]_0 ),
        .I5(ADDRD[2]),
        .O(\up_rdata[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[10]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [9]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [3]),
        .O(\up_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[10]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [10]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [12]),
        .O(\up_rdata[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AA040004)) 
    \up_rdata[11]_i_2 
       (.I0(\up_raddr_int_reg[6]_0 ),
        .I1(\up_rdata_reg[11]_i_4_n_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[31] [11]),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0A0A8080000A808)) 
    \up_rdata[11]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(m_src_axi_araddr[8]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(dbg_status[4]),
        .I4(\up_raddr_int_reg[1]_0 ),
        .I5(ADDRD[3]),
        .O(\up_rdata[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[11]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [10]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [4]),
        .O(\up_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[11]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [11]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [13]),
        .O(\up_rdata[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[12]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[9]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[12]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [12]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[12]_i_2 
       (.I0(\up_rdata_reg[31] [12]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[12]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[12]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [11]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [5]),
        .O(\up_rdata[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[12]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [12]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [14]),
        .O(\up_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[13]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[10]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[13]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [13]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[13]_i_2 
       (.I0(\up_rdata_reg[31] [13]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[13]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[13]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [12]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [6]),
        .O(\up_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[13]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [13]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [15]),
        .O(\up_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000B3333000B0000)) 
    \up_rdata[14]_i_1 
       (.I0(m_src_axi_araddr[11]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[14]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [14]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[14]_i_2 
       (.I0(\up_rdata_reg[31] [14]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[14]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[14]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [13]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [7]),
        .O(\up_rdata[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[14]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [14]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [16]),
        .O(\up_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[15]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[12]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[15]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [15]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[15]_i_2 
       (.I0(\up_rdata_reg[31] [15]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[15]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[15]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [14]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [8]),
        .O(\up_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[15]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [15]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [17]),
        .O(\up_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4A4A4A4A0A0F0A0A)) 
    \up_rdata[16]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [16]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata_reg[16]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[16]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[13]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[2]),
        .I5(ADDRC[0]),
        .O(\up_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[16]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [15]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [9]),
        .O(\up_rdata[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[16]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [16]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [18]),
        .O(\up_rdata[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h4A4A4A4A00050000)) 
    \up_rdata[17]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [17]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata_reg[17]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[17]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[14]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[3]),
        .I5(ADDRC[1]),
        .O(\up_rdata[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[17]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [16]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [10]),
        .O(\up_rdata[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[17]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [17]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [19]),
        .O(\up_rdata[17]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h4F0A4F0F4F0A4F0A)) 
    \up_rdata[18]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [18]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_14_n_0 ),
        .I5(\up_rdata_reg[18]_i_4_n_0 ),
        .O(\up_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[18]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[15]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[4]),
        .I5(ADDRC[2]),
        .O(\up_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[18]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [17]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [11]),
        .O(\up_rdata[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[18]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [18]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [20]),
        .O(\up_rdata[18]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h404040400A0F0A0A)) 
    \up_rdata[19]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [19]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata_reg[19]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[19]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[16]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[5]),
        .I5(ADDRC[3]),
        .O(\up_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[19]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [18]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [12]),
        .O(\up_rdata[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[19]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [19]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [21]),
        .O(\up_rdata[19]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \up_rdata[1]_i_1 
       (.I0(\up_rdata_reg[1] ),
        .I1(\up_rdata[1]_i_3_n_0 ),
        .I2(\up_rdata[31]_i_6_n_0 ),
        .I3(\up_rdata[1]_i_4_n_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[1]_i_5_n_0 ),
        .O(\up_scratch_reg[31] [1]));
  LUT6 #(
    .INIT(64'hFAFAABFBFFFFABFB)) 
    \up_rdata[1]_i_10 
       (.I0(\up_raddr_int_reg[4]_0 [0]),
        .I1(\up_rdata[30]_i_2_0 [0]),
        .I2(\up_raddr_int_reg[4]_0 [2]),
        .I3(\up_rdata_reg[1]_i_6_0 [1]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .I5(\up_rdata[1]_i_8_0 [1]),
        .O(\up_rdata[1]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h38083B08)) 
    \up_rdata[1]_i_3 
       (.I0(ctrl_pause),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_irq_source_reg[1] [1]),
        .I4(\up_rdata_reg[1]_0 [1]),
        .O(\up_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \up_rdata[1]_i_4 
       (.I0(\up_rdata_reg[1]_0 [1]),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .O(\up_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8888888800000003)) 
    \up_rdata[1]_i_5 
       (.I0(\up_rdata_reg[31] [1]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(up_raddr[5]),
        .I4(\up_rdata_reg[1]_i_6_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBBBB8BBBBBBBBBBB)) 
    \up_rdata[1]_i_7 
       (.I0(\up_rdata[1]_i_9_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(\up_rdata_reg[1]_i_6_0 [25]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .I5(\up_raddr_int_reg[4]_0 [2]),
        .O(\up_rdata[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBB8BBBBBBBB)) 
    \up_rdata[1]_i_8 
       (.I0(\up_rdata[1]_i_10_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .I5(\up_rdata_reg[1]_i_6_1 [1]),
        .O(\up_rdata[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFAB5FFB5)) 
    \up_rdata[1]_i_9 
       (.I0(\up_raddr_int_reg[4]_0 [0]),
        .I1(\up_rdata_reg[31]_0 [1]),
        .I2(\up_raddr_int_reg[4]_0 [1]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_rdata_reg[23]_i_3_0 [1]),
        .O(\up_rdata[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[20]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[17]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[20]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [20]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[20]_i_2 
       (.I0(\up_rdata_reg[31] [20]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[20]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[20]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [19]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [13]),
        .O(\up_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[20]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [20]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [22]),
        .O(\up_rdata[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[21]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[18]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[21]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [21]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[21]_i_2 
       (.I0(\up_rdata_reg[31] [21]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[21]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[21]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [20]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [14]),
        .O(\up_rdata[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[21]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [21]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [23]),
        .O(\up_rdata[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000B3333000B0000)) 
    \up_rdata[22]_i_1 
       (.I0(m_src_axi_araddr[19]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[22]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [22]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[22]_i_2 
       (.I0(\up_rdata_reg[31] [22]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[22]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[22]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [21]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [15]),
        .O(\up_rdata[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[22]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [22]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [24]),
        .O(\up_rdata[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400040000FF0000)) 
    \up_rdata[23]_i_1 
       (.I0(\up_raddr_int_reg[1]_0 ),
        .I1(m_src_axi_araddr[20]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata[31]_i_6_n_0 ),
        .I4(\up_rdata[23]_i_2_n_0 ),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [23]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[23]_i_2 
       (.I0(\up_rdata_reg[31] [23]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[23]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[23]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [22]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [16]),
        .O(\up_rdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[23]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [23]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [25]),
        .O(\up_rdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AA040004)) 
    \up_rdata[24]_i_2 
       (.I0(\up_raddr_int_reg[6]_0 ),
        .I1(\up_rdata[24]_i_4_n_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[31] [24]),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[24]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[21]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[24] ),
        .I5(ADDRC[0]),
        .O(\up_rdata[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[24]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [26]),
        .O(\up_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AA040004)) 
    \up_rdata[25]_i_2 
       (.I0(\up_raddr_int_reg[6]_0 ),
        .I1(\up_rdata[25]_i_4_n_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[31] [25]),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[25]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[22]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[25] ),
        .I5(ADDRC[1]),
        .O(\up_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[25]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [27]),
        .O(\up_rdata[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h404040400A0F0A0A)) 
    \up_rdata[26]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [26]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata[26]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[26]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[23]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[26] ),
        .I5(ADDRC[2]),
        .O(\up_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[26]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [28]),
        .O(\up_rdata[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4A4A4A4A00050000)) 
    \up_rdata[27]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [27]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata[27]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[27]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[24]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[27] ),
        .I5(ADDRC[3]),
        .O(\up_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[27]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [29]),
        .O(\up_rdata[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0038333300380000)) 
    \up_rdata[28]_i_1 
       (.I0(m_src_axi_araddr[25]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[28]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [28]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[28]_i_2 
       (.I0(\up_rdata_reg[31] [28]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata[28]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[28]_i_3 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [30]),
        .O(\up_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0038333300380000)) 
    \up_rdata[29]_i_1 
       (.I0(m_src_axi_araddr[26]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[29]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [29]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[29]_i_2 
       (.I0(\up_rdata_reg[31] [29]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata[29]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[29]_i_3 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [31]),
        .O(\up_rdata[29]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000CE0E)) 
    \up_rdata[2]_i_2 
       (.I0(data10[2]),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata_reg[31] [2]),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA80A0800A800080)) 
    \up_rdata[2]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(dbg_status[0]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[0]),
        .I5(dbg_ids1[0]),
        .O(\up_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000007444)) 
    \up_rdata[2]_i_4 
       (.I0(\up_rdata[2]_i_5_n_0 ),
        .I1(up_raddr[0]),
        .I2(up_raddr[1]),
        .I3(\up_rdata[2]_i_2_0 ),
        .I4(up_raddr[5]),
        .I5(\up_rdata[31]_i_14_n_0 ),
        .O(data10[2]));
  LUT6 #(
    .INIT(64'hFFFFFF47FFFFFFFF)) 
    \up_rdata[2]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [2]),
        .I1(\up_raddr_int_reg[4]_0 [2]),
        .I2(p_3_in),
        .I3(\up_raddr_int_reg[4]_0 [1]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(up_raddr[1]),
        .O(\up_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000B3333000B0000)) 
    \up_rdata[30]_i_1 
       (.I0(m_src_axi_araddr[27]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[30]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [30]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[30]_i_2 
       (.I0(\up_rdata_reg[31] [30]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata[30]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \up_rdata[30]_i_3 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(\up_raddr_int_reg[4]_0 [0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [32]),
        .O(\up_rdata[30]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \up_rdata[30]_i_4 
       (.I0(up_raddr[5]),
        .I1(\up_raddr_int_reg[4]_0 [1]),
        .O(\up_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040400500)) 
    \up_rdata[31]_i_1 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [31]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(data10[31]),
        .I4(\up_raddr_int_reg[6]_0 ),
        .I5(\up_rdata[31]_i_6_n_0 ),
        .O(\up_scratch_reg[31] [31]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h08000216)) 
    \up_rdata[31]_i_10 
       (.I0(up_raddr[0]),
        .I1(up_raddr[8]),
        .I2(up_raddr[5]),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .O(\up_rdata[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \up_rdata[31]_i_11 
       (.I0(\up_raddr_int_reg[4]_0 [2]),
        .I1(up_raddr[1]),
        .I2(up_raddr[5]),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [1]),
        .I5(up_raddr[8]),
        .O(\up_rdata[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h20200001)) 
    \up_rdata[31]_i_12 
       (.I0(up_raddr[8]),
        .I1(\up_raddr_int_reg[4]_0 [1]),
        .I2(up_raddr[5]),
        .I3(up_raddr[0]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .O(\up_rdata[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFBFFDFF)) 
    \up_rdata[31]_i_13 
       (.I0(up_raddr[1]),
        .I1(up_raddr[0]),
        .I2(\up_raddr_int_reg[4]_0 [2]),
        .I3(\up_raddr_int_reg[4]_0 [1]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .O(\up_rdata[31]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \up_rdata[31]_i_14 
       (.I0(up_raddr[8]),
        .I1(up_raddr[7]),
        .I2(up_raddr[6]),
        .O(\up_rdata[31]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001010111)) 
    \up_rdata[31]_i_17 
       (.I0(up_raddr[8]),
        .I1(\up_raddr_int_reg[4]_0 [2]),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(up_raddr[1]),
        .I4(up_raddr[5]),
        .I5(\up_raddr_int_reg[4]_0 [1]),
        .O(\up_rdata[31]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'h40400008)) 
    \up_rdata[31]_i_18 
       (.I0(\up_raddr_int_reg[4]_0 [2]),
        .I1(up_raddr[8]),
        .I2(\up_raddr_int_reg[4]_0 [1]),
        .I3(up_raddr[1]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .O(\up_rdata[31]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0004001000041004)) 
    \up_rdata[31]_i_19 
       (.I0(\up_raddr_int_reg[4]_0 [1]),
        .I1(up_raddr[8]),
        .I2(up_raddr[5]),
        .I3(up_raddr[1]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(up_raddr[0]),
        .O(\up_rdata[31]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h11100010)) 
    \up_rdata[31]_i_2 
       (.I0(up_raddr[6]),
        .I1(up_raddr[7]),
        .I2(\up_rdata[31]_i_7_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_rdata[31]_i_8_n_0 ),
        .O(\up_rdata[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h10101000)) 
    \up_rdata[31]_i_20 
       (.I0(up_raddr[5]),
        .I1(\up_raddr_int_reg[4]_0 [2]),
        .I2(\up_raddr_int_reg[4]_0 [1]),
        .I3(up_raddr[0]),
        .I4(up_raddr[1]),
        .O(\up_rdata[31]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hA0A0A0A0AAA0A8A8)) 
    \up_rdata[31]_i_3 
       (.I0(\up_rdata[31]_i_9_n_0 ),
        .I1(\up_rdata[31]_i_10_n_0 ),
        .I2(\up_rdata[31]_i_11_n_0 ),
        .I3(\up_rdata[31]_i_12_n_0 ),
        .I4(up_raddr[1]),
        .I5(\up_raddr_int_reg[4]_0 [2]),
        .O(\up_raddr_int_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h00000100)) 
    \up_rdata[31]_i_4 
       (.I0(\up_rdata[31]_i_13_n_0 ),
        .I1(up_raddr[5]),
        .I2(\up_raddr_int_reg[4]_0 [2]),
        .I3(\up_rdata_reg[31]_0 [3]),
        .I4(\up_rdata[31]_i_14_n_0 ),
        .O(data10[31]));
  LUT5 #(
    .INIT(32'h01110000)) 
    \up_rdata[31]_i_5 
       (.I0(up_raddr[6]),
        .I1(up_raddr[7]),
        .I2(up_raddr[5]),
        .I3(up_raddr[8]),
        .I4(\up_rdata_reg[31]_i_15_n_0 ),
        .O(\up_raddr_int_reg[6]_0 ));
  LUT5 #(
    .INIT(32'h10110000)) 
    \up_rdata[31]_i_6 
       (.I0(up_raddr[6]),
        .I1(up_raddr[7]),
        .I2(up_raddr[8]),
        .I3(\up_raddr_int_reg[4]_0 [1]),
        .I4(\up_rdata_reg[31]_i_16_n_0 ),
        .O(\up_rdata[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0005000000000140)) 
    \up_rdata[31]_i_7 
       (.I0(\up_raddr_int_reg[4]_0 [1]),
        .I1(up_raddr[0]),
        .I2(up_raddr[1]),
        .I3(up_raddr[5]),
        .I4(up_raddr[8]),
        .I5(\up_raddr_int_reg[4]_0 [2]),
        .O(\up_rdata[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00000081)) 
    \up_rdata[31]_i_8 
       (.I0(up_raddr[8]),
        .I1(\up_raddr_int_reg[4]_0 [1]),
        .I2(up_raddr[1]),
        .I3(up_raddr[5]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .O(\up_rdata[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \up_rdata[31]_i_9 
       (.I0(up_raddr[6]),
        .I1(up_raddr[7]),
        .O(\up_rdata[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AA040004)) 
    \up_rdata[3]_i_2 
       (.I0(\up_raddr_int_reg[6]_0 ),
        .I1(\up_rdata_reg[3]_i_4_n_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(\up_rdata_reg[31] [3]),
        .I5(\up_rdata[31]_i_2_n_0 ),
        .O(\up_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA20882022200020)) 
    \up_rdata[3]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[6]_0 ),
        .I2(m_src_axi_araddr[0]),
        .I3(\up_raddr_int_reg[1]_0 ),
        .I4(dbg_ids0[1]),
        .I5(dbg_ids1[1]),
        .O(\up_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0808080808A80808)) 
    \up_rdata[3]_i_5 
       (.I0(up_raddr[1]),
        .I1(\up_rdata[3]_i_7_n_0 ),
        .I2(\up_raddr_int_reg[4]_0 [0]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_rdata[30]_i_2_0 [1]),
        .I5(\up_rdata[30]_i_4_n_0 ),
        .O(\up_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[3]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [3]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [5]),
        .O(\up_rdata[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h03080008)) 
    \up_rdata[3]_i_7 
       (.I0(\up_rdata_reg[31]_0 [2]),
        .I1(\up_raddr_int_reg[4]_0 [1]),
        .I2(up_raddr[5]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_rdata_reg[23]_i_3_0 [2]),
        .O(\up_rdata[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h4A4A4A4AA0A5A0A0)) 
    \up_rdata[4]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [4]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata_reg[4]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20222000)) 
    \up_rdata[4]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(dbg_status[1]),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(m_src_axi_araddr[1]),
        .O(\up_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[4]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [3]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata[30]_i_2_0 [2]),
        .O(\up_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[4]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [4]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [6]),
        .O(\up_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h45A045A545A045A0)) 
    \up_rdata[5]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [5]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_14_n_0 ),
        .I5(\up_rdata_reg[5]_i_4_n_0 ),
        .O(\up_rdata[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20222000)) 
    \up_rdata[5]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(dbg_status[2]),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(m_src_axi_araddr[2]),
        .O(\up_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[5]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [4]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata[30]_i_2_0 [3]),
        .O(\up_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[5]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [5]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [7]),
        .O(\up_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h45AA45AF45AA45AA)) 
    \up_rdata[6]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [6]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_14_n_0 ),
        .I5(\up_rdata_reg[6]_i_4_n_0 ),
        .O(\up_rdata[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20222000)) 
    \up_rdata[6]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(dbg_status[3]),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(m_src_axi_araddr[3]),
        .O(\up_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[6]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [5]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata[30]_i_2_0 [4]),
        .O(\up_rdata[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[6]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [6]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [8]),
        .O(\up_rdata[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0038333300380000)) 
    \up_rdata[7]_i_1 
       (.I0(m_src_axi_araddr[4]),
        .I1(\up_rdata[31]_i_6_n_0 ),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_2_n_0 ),
        .I5(\up_rdata[7]_i_2_n_0 ),
        .O(\up_scratch_reg[31] [7]));
  LUT5 #(
    .INIT(32'h88880300)) 
    \up_rdata[7]_i_2 
       (.I0(\up_rdata_reg[31] [7]),
        .I1(\up_raddr_int_reg[1]_0 ),
        .I2(\up_rdata[31]_i_14_n_0 ),
        .I3(\up_rdata_reg[7]_i_3_n_0 ),
        .I4(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[7]_i_4 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [6]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [0]),
        .O(\up_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[7]_i_5 
       (.I0(\up_rdata_reg[1]_i_6_0 [7]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [9]),
        .O(\up_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4F0A4F0F4F0A4F0A)) 
    \up_rdata[8]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [8]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_raddr_int_reg[6]_0 ),
        .I4(\up_rdata[31]_i_14_n_0 ),
        .I5(\up_rdata_reg[8]_i_4_n_0 ),
        .O(\up_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0A008A8000008A8)) 
    \up_rdata[8]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(m_src_axi_araddr[5]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata_reg[8] ),
        .I4(\up_raddr_int_reg[1]_0 ),
        .I5(ADDRD[0]),
        .O(\up_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[8]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [7]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [1]),
        .O(\up_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[8]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [8]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [10]),
        .O(\up_rdata[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h4A4A4A4AA0A5A0A0)) 
    \up_rdata[9]_i_2 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(\up_rdata_reg[31] [9]),
        .I2(\up_raddr_int_reg[1]_0 ),
        .I3(\up_rdata[31]_i_14_n_0 ),
        .I4(\up_rdata_reg[9]_i_4_n_0 ),
        .I5(\up_raddr_int_reg[6]_0 ),
        .O(\up_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0A008A8000008A8)) 
    \up_rdata[9]_i_3 
       (.I0(\up_rdata[31]_i_2_n_0 ),
        .I1(m_src_axi_araddr[6]),
        .I2(\up_raddr_int_reg[6]_0 ),
        .I3(\up_rdata_reg[9] ),
        .I4(\up_raddr_int_reg[1]_0 ),
        .I5(ADDRD[1]),
        .O(\up_rdata[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0044400000004000)) 
    \up_rdata[9]_i_5 
       (.I0(\up_rdata[30]_i_4_n_0 ),
        .I1(up_raddr[1]),
        .I2(\up_rdata_reg[23]_i_3_0 [8]),
        .I3(\up_raddr_int_reg[4]_0 [2]),
        .I4(\up_raddr_int_reg[4]_0 [0]),
        .I5(\up_rdata_reg[23]_i_3_1 [2]),
        .O(\up_rdata[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0008030000080000)) 
    \up_rdata[9]_i_6 
       (.I0(\up_rdata_reg[1]_i_6_0 [9]),
        .I1(up_raddr[1]),
        .I2(\up_rdata[30]_i_4_n_0 ),
        .I3(\up_raddr_int_reg[4]_0 [0]),
        .I4(\up_raddr_int_reg[4]_0 [2]),
        .I5(\up_rdata[30]_i_2_0 [11]),
        .O(\up_rdata[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[0]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [0]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[0]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[10]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [10]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[10]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[11]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [11]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[11]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[12]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [12]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[12]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[13]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [13]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[14]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [14]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[14]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[15]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [15]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[15]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[16]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [16]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[16]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[17]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [17]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[18]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [18]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[18]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[19]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [19]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[19]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[1]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [1]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[20]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [20]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[21]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [21]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[21]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[22]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [22]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[23]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [23]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[23]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[24]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [24]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[25]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [25]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[25]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[26]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [26]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[26]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[27]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [27]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[27]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[28]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [28]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[28]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[29]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [29]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[2]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [2]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[2]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[30]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [30]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[30]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[31]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [31]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[31]));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[3]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [3]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[4]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [4]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[5]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [5]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[5]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[6]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [6]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[7]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [7]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[7]));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \up_rdata_d[8]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [8]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(\up_rdata_d[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[9]_i_1 
       (.I0(\up_rdata_d_reg[31]_0 [9]),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(p_0_in6_in),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rdata_s[9]));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[0]),
        .Q(up_rdata_d[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[10]),
        .Q(up_rdata_d[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[11]),
        .Q(up_rdata_d[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[12]),
        .Q(up_rdata_d[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[13]_i_1_n_0 ),
        .Q(up_rdata_d[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[14]),
        .Q(up_rdata_d[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[15]),
        .Q(up_rdata_d[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[16]),
        .Q(up_rdata_d[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[17]_i_1_n_0 ),
        .Q(up_rdata_d[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[18]),
        .Q(up_rdata_d[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[19]),
        .Q(up_rdata_d[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[1]_i_1_n_0 ),
        .Q(up_rdata_d[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[20]_i_1_n_0 ),
        .Q(up_rdata_d[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[21]),
        .Q(up_rdata_d[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[22]_i_1_n_0 ),
        .Q(up_rdata_d[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[23]),
        .Q(up_rdata_d[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[24]_i_1_n_0 ),
        .Q(up_rdata_d[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[25]),
        .Q(up_rdata_d[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[26]),
        .Q(up_rdata_d[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[27]),
        .Q(up_rdata_d[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[28]),
        .Q(up_rdata_d[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[29]_i_1_n_0 ),
        .Q(up_rdata_d[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[2]),
        .Q(up_rdata_d[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[30]),
        .Q(up_rdata_d[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[31]),
        .Q(up_rdata_d[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[3]),
        .Q(up_rdata_d[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[4]_i_1_n_0 ),
        .Q(up_rdata_d[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[5]),
        .Q(up_rdata_d[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[6]_i_1_n_0 ),
        .Q(up_rdata_d[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[7]),
        .Q(up_rdata_d[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[8]_i_1_n_0 ),
        .Q(up_rdata_d[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rdata_s[9]),
        .Q(up_rdata_d[9]),
        .R(SR));
  MUXF7 \up_rdata_reg[0]_i_7 
       (.I0(\up_rdata[0]_i_10_n_0 ),
        .I1(\up_rdata[0]_i_11_n_0 ),
        .O(\up_rdata_reg[0]_i_7_n_0 ),
        .S(up_raddr[1]));
  MUXF7 \up_rdata_reg[10]_i_1 
       (.I0(\up_rdata[10]_i_2_n_0 ),
        .I1(\up_rdata[10]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [10]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[10]_i_4 
       (.I0(\up_rdata[10]_i_5_n_0 ),
        .I1(\up_rdata[10]_i_6_n_0 ),
        .O(\up_rdata_reg[10]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[11]_i_1 
       (.I0(\up_rdata[11]_i_2_n_0 ),
        .I1(\up_rdata[11]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [11]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[11]_i_4 
       (.I0(\up_rdata[11]_i_5_n_0 ),
        .I1(\up_rdata[11]_i_6_n_0 ),
        .O(\up_rdata_reg[11]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[12]_i_3 
       (.I0(\up_rdata[12]_i_4_n_0 ),
        .I1(\up_rdata[12]_i_5_n_0 ),
        .O(\up_rdata_reg[12]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[13]_i_3 
       (.I0(\up_rdata[13]_i_4_n_0 ),
        .I1(\up_rdata[13]_i_5_n_0 ),
        .O(\up_rdata_reg[13]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[14]_i_3 
       (.I0(\up_rdata[14]_i_4_n_0 ),
        .I1(\up_rdata[14]_i_5_n_0 ),
        .O(\up_rdata_reg[14]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[15]_i_3 
       (.I0(\up_rdata[15]_i_4_n_0 ),
        .I1(\up_rdata[15]_i_5_n_0 ),
        .O(\up_rdata_reg[15]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[16]_i_1 
       (.I0(\up_rdata[16]_i_2_n_0 ),
        .I1(\up_rdata[16]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [16]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[16]_i_4 
       (.I0(\up_rdata[16]_i_5_n_0 ),
        .I1(\up_rdata[16]_i_6_n_0 ),
        .O(\up_rdata_reg[16]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[17]_i_1 
       (.I0(\up_rdata[17]_i_2_n_0 ),
        .I1(\up_rdata[17]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [17]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[17]_i_4 
       (.I0(\up_rdata[17]_i_5_n_0 ),
        .I1(\up_rdata[17]_i_6_n_0 ),
        .O(\up_rdata_reg[17]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[18]_i_1 
       (.I0(\up_rdata[18]_i_2_n_0 ),
        .I1(\up_rdata[18]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [18]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[18]_i_4 
       (.I0(\up_rdata[18]_i_5_n_0 ),
        .I1(\up_rdata[18]_i_6_n_0 ),
        .O(\up_rdata_reg[18]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[19]_i_1 
       (.I0(\up_rdata[19]_i_2_n_0 ),
        .I1(\up_rdata[19]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [19]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[19]_i_4 
       (.I0(\up_rdata[19]_i_5_n_0 ),
        .I1(\up_rdata[19]_i_6_n_0 ),
        .O(\up_rdata_reg[19]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[1]_i_6 
       (.I0(\up_rdata[1]_i_7_n_0 ),
        .I1(\up_rdata[1]_i_8_n_0 ),
        .O(\up_rdata_reg[1]_i_6_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[20]_i_3 
       (.I0(\up_rdata[20]_i_4_n_0 ),
        .I1(\up_rdata[20]_i_5_n_0 ),
        .O(\up_rdata_reg[20]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[21]_i_3 
       (.I0(\up_rdata[21]_i_4_n_0 ),
        .I1(\up_rdata[21]_i_5_n_0 ),
        .O(\up_rdata_reg[21]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[22]_i_3 
       (.I0(\up_rdata[22]_i_4_n_0 ),
        .I1(\up_rdata[22]_i_5_n_0 ),
        .O(\up_rdata_reg[22]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[23]_i_3 
       (.I0(\up_rdata[23]_i_4_n_0 ),
        .I1(\up_rdata[23]_i_5_n_0 ),
        .O(\up_rdata_reg[23]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[24]_i_1 
       (.I0(\up_rdata[24]_i_2_n_0 ),
        .I1(\up_rdata[24]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [24]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[25]_i_1 
       (.I0(\up_rdata[25]_i_2_n_0 ),
        .I1(\up_rdata[25]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [25]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[26]_i_1 
       (.I0(\up_rdata[26]_i_2_n_0 ),
        .I1(\up_rdata[26]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [26]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[27]_i_1 
       (.I0(\up_rdata[27]_i_2_n_0 ),
        .I1(\up_rdata[27]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [27]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[2]_i_1 
       (.I0(\up_rdata[2]_i_2_n_0 ),
        .I1(\up_rdata[2]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [2]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[31]_i_15 
       (.I0(\up_rdata[31]_i_17_n_0 ),
        .I1(\up_rdata[31]_i_18_n_0 ),
        .O(\up_rdata_reg[31]_i_15_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[31]_i_16 
       (.I0(\up_rdata[31]_i_19_n_0 ),
        .I1(\up_rdata[31]_i_20_n_0 ),
        .O(\up_rdata_reg[31]_i_16_n_0 ),
        .S(\up_raddr_int_reg[4]_0 [0]));
  MUXF7 \up_rdata_reg[3]_i_1 
       (.I0(\up_rdata[3]_i_2_n_0 ),
        .I1(\up_rdata[3]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [3]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[3]_i_4 
       (.I0(\up_rdata[3]_i_5_n_0 ),
        .I1(\up_rdata[3]_i_6_n_0 ),
        .O(\up_rdata_reg[3]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[4]_i_1 
       (.I0(\up_rdata[4]_i_2_n_0 ),
        .I1(\up_rdata[4]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [4]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[4]_i_4 
       (.I0(\up_rdata[4]_i_5_n_0 ),
        .I1(\up_rdata[4]_i_6_n_0 ),
        .O(\up_rdata_reg[4]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[5]_i_1 
       (.I0(\up_rdata[5]_i_2_n_0 ),
        .I1(\up_rdata[5]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [5]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[5]_i_4 
       (.I0(\up_rdata[5]_i_5_n_0 ),
        .I1(\up_rdata[5]_i_6_n_0 ),
        .O(\up_rdata_reg[5]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[6]_i_1 
       (.I0(\up_rdata[6]_i_2_n_0 ),
        .I1(\up_rdata[6]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [6]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[6]_i_4 
       (.I0(\up_rdata[6]_i_5_n_0 ),
        .I1(\up_rdata[6]_i_6_n_0 ),
        .O(\up_rdata_reg[6]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[7]_i_3 
       (.I0(\up_rdata[7]_i_4_n_0 ),
        .I1(\up_rdata[7]_i_5_n_0 ),
        .O(\up_rdata_reg[7]_i_3_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[8]_i_1 
       (.I0(\up_rdata[8]_i_2_n_0 ),
        .I1(\up_rdata[8]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [8]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[8]_i_4 
       (.I0(\up_rdata[8]_i_5_n_0 ),
        .I1(\up_rdata[8]_i_6_n_0 ),
        .O(\up_rdata_reg[8]_i_4_n_0 ),
        .S(up_raddr[0]));
  MUXF7 \up_rdata_reg[9]_i_1 
       (.I0(\up_rdata[9]_i_2_n_0 ),
        .I1(\up_rdata[9]_i_3_n_0 ),
        .O(\up_scratch_reg[31] [9]),
        .S(\up_rdata[31]_i_6_n_0 ));
  MUXF7 \up_rdata_reg[9]_i_4 
       (.I0(\up_rdata[9]_i_5_n_0 ),
        .I1(\up_rdata[9]_i_6_n_0 ),
        .O(\up_rdata_reg[9]_i_4_n_0 ),
        .S(up_raddr[0]));
  LUT3 #(
    .INIT(8'h80)) 
    up_rreq_int_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_aresetn),
        .I2(p_1_in),
        .O(up_rreq_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_rreq_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rreq_int_i_1_n_0),
        .Q(up_rreq),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h55C0)) 
    up_rsel_inv_i_1
       (.I0(s_axi_arvalid),
        .I1(up_axi_rvalid_int_reg_0),
        .I2(s_axi_rready),
        .I3(p_1_in),
        .O(up_rsel_inv_i_1_n_0));
  (* inverted = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    up_rsel_reg_inv
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rsel_inv_i_1_n_0),
        .Q(p_1_in),
        .S(SR));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \up_scratch[31]_i_1 
       (.I0(up_wreq),
        .I1(\up_scratch[31]_i_2_n_0 ),
        .I2(up_waddr[2]),
        .I3(up_waddr[0]),
        .I4(ctrl_enable_i_3_n_0),
        .I5(up_waddr[1]),
        .O(up_wreq_int_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \up_scratch[31]_i_2 
       (.I0(up_waddr[8]),
        .I1(up_waddr[7]),
        .I2(up_waddr[5]),
        .I3(up_waddr[6]),
        .O(\up_scratch[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEAAA0000AAAA0000)) 
    up_wack_d_i_1
       (.I0(up_wack),
        .I1(\up_wcount_reg_n_0_[2] ),
        .I2(\up_wcount_reg_n_0_[1] ),
        .I3(\up_wcount_reg_n_0_[0] ),
        .I4(p_0_in7_in),
        .I5(\up_wcount_reg_n_0_[3] ),
        .O(up_wack_s_0));
  FDRE #(
    .INIT(1'b0)) 
    up_wack_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wack_s_0),
        .Q(up_wack_d),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[0]),
        .Q(up_waddr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[1]),
        .Q(up_waddr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[2]),
        .Q(up_waddr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[3]),
        .Q(up_waddr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[4]),
        .Q(up_waddr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[5]),
        .Q(up_waddr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[6]),
        .Q(up_waddr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[7]),
        .Q(up_waddr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[8]),
        .Q(up_waddr[8]),
        .R(SR));
  LUT3 #(
    .INIT(8'h04)) 
    \up_wcount[0]_i_1 
       (.I0(\up_wcount_reg_n_0_[0] ),
        .I1(p_0_in7_in),
        .I2(up_wack),
        .O(p_2_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0060)) 
    \up_wcount[1]_i_1 
       (.I0(\up_wcount_reg_n_0_[1] ),
        .I1(\up_wcount_reg_n_0_[0] ),
        .I2(p_0_in7_in),
        .I3(up_wack),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00007080)) 
    \up_wcount[2]_i_1 
       (.I0(\up_wcount_reg_n_0_[1] ),
        .I1(\up_wcount_reg_n_0_[0] ),
        .I2(p_0_in7_in),
        .I3(\up_wcount_reg_n_0_[2] ),
        .I4(up_wack),
        .O(p_2_in[2]));
  LUT6 #(
    .INIT(64'h000000006A00AA00)) 
    \up_wcount[3]_i_1 
       (.I0(\up_wcount_reg_n_0_[3] ),
        .I1(\up_wcount_reg_n_0_[1] ),
        .I2(\up_wcount_reg_n_0_[0] ),
        .I3(p_0_in7_in),
        .I4(\up_wcount_reg_n_0_[2] ),
        .I5(up_wack),
        .O(p_2_in[3]));
  LUT3 #(
    .INIT(8'hFE)) 
    \up_wcount[4]_i_1 
       (.I0(up_wack_s),
        .I1(up_wreq),
        .I2(p_0_in7_in),
        .O(\up_wcount[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00FF7FFFFFFF)) 
    \up_wcount[4]_i_2 
       (.I0(\up_wcount_reg_n_0_[3] ),
        .I1(\up_wcount_reg_n_0_[1] ),
        .I2(\up_wcount_reg_n_0_[0] ),
        .I3(p_0_in7_in),
        .I4(\up_wcount_reg_n_0_[2] ),
        .I5(up_wack),
        .O(p_2_in[4]));
  LUT6 #(
    .INIT(64'hE0A0A0A0A0A0A0A0)) 
    \up_wcount[4]_i_3 
       (.I0(up_wack),
        .I1(\up_wcount_reg_n_0_[2] ),
        .I2(p_0_in7_in),
        .I3(\up_wcount_reg_n_0_[0] ),
        .I4(\up_wcount_reg_n_0_[1] ),
        .I5(\up_wcount_reg_n_0_[3] ),
        .O(up_wack_s));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(\up_wcount[4]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(\up_wcount_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(\up_wcount[4]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(\up_wcount_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_wcount[4]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(\up_wcount_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_wcount[4]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(\up_wcount_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_wcount[4]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(p_0_in7_in),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[12]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[13]),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[14]),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[15]),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[16]),
        .Q(Q[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[17]),
        .Q(Q[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[18]),
        .Q(Q[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[19]),
        .Q(Q[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[20]),
        .Q(Q[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[21]),
        .Q(Q[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[22]),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[23]),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[24]),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[25]),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[26]),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[27]),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[28]),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[29]),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[30]),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[31]),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[9]),
        .Q(Q[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h8000)) 
    up_wreq_int_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_aresetn),
        .I3(p_5_in),
        .O(up_wreq_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_wreq_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wreq_int_i_1_n_0),
        .Q(up_wreq),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h7777F000)) 
    up_wsel_inv_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_bvalid),
        .I3(s_axi_bready),
        .I4(p_5_in),
        .O(up_wsel_inv_i_1_n_0));
  (* inverted = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    up_wsel_reg_inv
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wsel_inv_i_1_n_0),
        .Q(p_5_in),
        .S(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo
   (SR,
    up_tlf_s_valid_reg,
    response_valid_reg,
    \fifo.valid_reg_0 ,
    \fifo.sync_clocks.data_reg[25]_0 ,
    s_axi_aclk,
    \s_axis_waddr_reg_reg[2] ,
    up_bl_partial,
    up_response_valid,
    response_ready_reg,
    \s_axis_waddr_reg_reg[0] ,
    p_8_in,
    up_partial_length_valid_reg,
    s_axis_data);
  output [0:0]SR;
  output up_tlf_s_valid_reg;
  output response_valid_reg;
  output \fifo.valid_reg_0 ;
  output [25:0]\fifo.sync_clocks.data_reg[25]_0 ;
  input s_axi_aclk;
  input \s_axis_waddr_reg_reg[2] ;
  input up_bl_partial;
  input up_response_valid;
  input response_ready_reg;
  input \s_axis_waddr_reg_reg[0] ;
  input p_8_in;
  input [0:0]up_partial_length_valid_reg;
  input [25:0]s_axis_data;

  wire [0:0]SR;
  wire \fifo.i_address_gray_n_6 ;
  wire \fifo.i_address_gray_n_8 ;
  wire [25:0]\fifo.sync_clocks.data0 ;
  wire [25:0]\fifo.sync_clocks.data_reg[25]_0 ;
  wire \fifo.valid_reg_0 ;
  wire [1:0]m_axis_raddr;
  wire p_8_in;
  wire response_ready_reg;
  wire response_valid_reg;
  wire s_axi_aclk;
  wire [25:0]s_axis_data;
  wire [1:0]s_axis_waddr;
  wire \s_axis_waddr_reg_reg[0] ;
  wire \s_axis_waddr_reg_reg[2] ;
  wire s_axis_write_s;
  wire up_bl_partial;
  wire [0:0]up_partial_length_valid_reg;
  wire up_response_valid;
  wire up_tlf_s_valid_reg;
  wire up_tlf_valid;
  wire [1:0]\NLW_fifo.sync_clocks.ram_reg_0_3_0_13_DOH_UNCONNECTED ;
  wire [1:0]\NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOG_UNCONNECTED ;
  wire [1:0]\NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOH_UNCONNECTED ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo_address_generator \fifo.i_address_gray 
       (.E(\fifo.i_address_gray_n_8 ),
        .Q(m_axis_raddr),
        .SR(SR),
        .\fifo.valid_reg (\fifo.i_address_gray_n_6 ),
        .p_8_in(p_8_in),
        .response_ready_reg(response_ready_reg),
        .response_valid_reg(response_valid_reg),
        .s_axi_aclk(s_axi_aclk),
        .\s_axis_waddr_reg_reg[0]_0 (\s_axis_waddr_reg_reg[0] ),
        .\s_axis_waddr_reg_reg[1]_0 (s_axis_waddr),
        .\s_axis_waddr_reg_reg[2]_0 (\s_axis_waddr_reg_reg[2] ),
        .up_bl_partial(up_bl_partial),
        .up_response_valid(up_response_valid),
        .up_tlf_s_valid_reg(up_tlf_s_valid_reg),
        .up_tlf_s_valid_reg_0(s_axis_write_s),
        .up_tlf_valid(up_tlf_valid));
  FDRE \fifo.sync_clocks.data_reg[0] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [0]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [0]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[10] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [10]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [10]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[11] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [11]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [11]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[12] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [12]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [12]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[13] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [13]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [13]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[14] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [14]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [14]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[15] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [15]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [15]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[16] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [16]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [16]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[17] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [17]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [17]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[18] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [18]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [18]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[19] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [19]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [19]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[1] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [1]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [1]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[20] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [20]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [20]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[21] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [21]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [21]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[22] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [22]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [22]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[23] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [23]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [23]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[24] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [24]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [24]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[25] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [25]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [25]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[2] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [2]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [2]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[3] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [3]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [3]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[4] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [4]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [4]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[5] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [5]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [5]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[6] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [6]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [6]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[7] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [7]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [7]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[8] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [8]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [8]),
        .R(1'b0));
  FDRE \fifo.sync_clocks.data_reg[9] 
       (.C(s_axi_aclk),
        .CE(\fifo.i_address_gray_n_8 ),
        .D(\fifo.sync_clocks.data0 [9]),
        .Q(\fifo.sync_clocks.data_reg[25]_0 [9]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "104" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_regmap/i_regmap_request/i_transfer_lenghts_fifo/fifo.sync_clocks.ram_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "3" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "13" *) 
  RAM32M16 \fifo.sync_clocks.ram_reg_0_3_0_13 
       (.ADDRA({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRB({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRC({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRD({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRE({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRF({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRG({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRH({1'b0,1'b0,1'b0,s_axis_waddr}),
        .DIA(s_axis_data[1:0]),
        .DIB(s_axis_data[3:2]),
        .DIC(s_axis_data[5:4]),
        .DID(s_axis_data[7:6]),
        .DIE(s_axis_data[9:8]),
        .DIF(s_axis_data[11:10]),
        .DIG(s_axis_data[13:12]),
        .DIH({1'b0,1'b0}),
        .DOA(\fifo.sync_clocks.data0 [1:0]),
        .DOB(\fifo.sync_clocks.data0 [3:2]),
        .DOC(\fifo.sync_clocks.data0 [5:4]),
        .DOD(\fifo.sync_clocks.data0 [7:6]),
        .DOE(\fifo.sync_clocks.data0 [9:8]),
        .DOF(\fifo.sync_clocks.data0 [11:10]),
        .DOG(\fifo.sync_clocks.data0 [13:12]),
        .DOH(\NLW_fifo.sync_clocks.ram_reg_0_3_0_13_DOH_UNCONNECTED [1:0]),
        .WCLK(s_axi_aclk),
        .WE(s_axis_write_s));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "104" *) 
  (* RTL_RAM_NAME = "axi_dmac/i_regmap/i_regmap_request/i_transfer_lenghts_fifo/fifo.sync_clocks.ram_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "3" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "25" *) 
  RAM32M16 \fifo.sync_clocks.ram_reg_0_3_14_25 
       (.ADDRA({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRB({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRC({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRD({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRE({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRF({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRG({1'b0,1'b0,1'b0,m_axis_raddr}),
        .ADDRH({1'b0,1'b0,1'b0,s_axis_waddr}),
        .DIA(s_axis_data[15:14]),
        .DIB(s_axis_data[17:16]),
        .DIC(s_axis_data[19:18]),
        .DID(s_axis_data[21:20]),
        .DIE(s_axis_data[23:22]),
        .DIF(s_axis_data[25:24]),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(\fifo.sync_clocks.data0 [15:14]),
        .DOB(\fifo.sync_clocks.data0 [17:16]),
        .DOC(\fifo.sync_clocks.data0 [19:18]),
        .DOD(\fifo.sync_clocks.data0 [21:20]),
        .DOE(\fifo.sync_clocks.data0 [23:22]),
        .DOF(\fifo.sync_clocks.data0 [25:24]),
        .DOG(\NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOG_UNCONNECTED [1:0]),
        .DOH(\NLW_fifo.sync_clocks.ram_reg_0_3_14_25_DOH_UNCONNECTED [1:0]),
        .WCLK(s_axi_aclk),
        .WE(s_axis_write_s));
  FDRE #(
    .INIT(1'b0)) 
    \fifo.valid_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\fifo.i_address_gray_n_6 ),
        .Q(up_tlf_valid),
        .R(SR));
  LUT4 #(
    .INIT(16'hAFAE)) 
    up_partial_length_valid_i_1
       (.I0(up_bl_partial),
        .I1(up_tlf_valid),
        .I2(p_8_in),
        .I3(up_partial_length_valid_reg),
        .O(\fifo.valid_reg_0 ));
endmodule

(* ORIG_REF_NAME = "util_axis_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized0
   (out,
    \zerodeep.s_axis_waddr ,
    \cdc_sync_stage2_reg[0] ,
    \zerodeep.m_axis_raddr_reg_0 ,
    \cdc_sync_stage2_reg[0]_0 ,
    \cdc_sync_stage1_reg[0] ,
    m_axis_aclk,
    \cdc_sync_stage1_reg[0]_0 ,
    m_src_axi_aclk,
    src_dest_valid_hs,
    data_eot,
    \zerodeep.m_axis_raddr_reg_1 ,
    m_axis_ready,
    dest_fifo_last,
    E,
    D);
  output [1:0]out;
  output \zerodeep.s_axis_waddr ;
  output \cdc_sync_stage2_reg[0] ;
  output \zerodeep.m_axis_raddr_reg_0 ;
  output \cdc_sync_stage2_reg[0]_0 ;
  input [0:0]\cdc_sync_stage1_reg[0] ;
  input m_axis_aclk;
  input [0:0]\cdc_sync_stage1_reg[0]_0 ;
  input m_src_axi_aclk;
  input src_dest_valid_hs;
  input data_eot;
  input \zerodeep.m_axis_raddr_reg_1 ;
  input m_axis_ready;
  input dest_fifo_last;
  input [0:0]E;
  input [30:0]D;

  wire [30:0]D;
  wire [0:0]E;
  wire [0:0]\cdc_sync_stage1_reg[0] ;
  wire [0:0]\cdc_sync_stage1_reg[0]_0 ;
  wire \cdc_sync_stage2_reg[0] ;
  wire \cdc_sync_stage2_reg[0]_0 ;
  wire data_eot;
  wire dest_fifo_last;
  wire m_axis_aclk;
  wire m_axis_ready;
  wire m_src_axi_aclk;
  wire src_dest_valid_hs;
  (* RTL_KEEP = "yes" *) wire [30:0]\zerodeep.cdc_sync_fifo_ram ;
  wire \zerodeep.cdc_sync_fifo_ram_reg0 ;
  wire \zerodeep.i_raddr_sync_n_3 ;
  wire \zerodeep.i_waddr_sync_n_1 ;
  wire \zerodeep.m_axis_raddr ;
  wire \zerodeep.m_axis_raddr_reg_0 ;
  wire \zerodeep.m_axis_raddr_reg_1 ;
  wire \zerodeep.s_axis_waddr ;

  assign out[1:0] = \zerodeep.cdc_sync_fifo_ram [1:0];
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[0] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[0]),
        .Q(\zerodeep.cdc_sync_fifo_ram [0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[10] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[10]),
        .Q(\zerodeep.cdc_sync_fifo_ram [10]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[11] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[11]),
        .Q(\zerodeep.cdc_sync_fifo_ram [11]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[12] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[12]),
        .Q(\zerodeep.cdc_sync_fifo_ram [12]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[13] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[13]),
        .Q(\zerodeep.cdc_sync_fifo_ram [13]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[14] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[14]),
        .Q(\zerodeep.cdc_sync_fifo_ram [14]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[15] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[15]),
        .Q(\zerodeep.cdc_sync_fifo_ram [15]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[16] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[16]),
        .Q(\zerodeep.cdc_sync_fifo_ram [16]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[17] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[17]),
        .Q(\zerodeep.cdc_sync_fifo_ram [17]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[18] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[18]),
        .Q(\zerodeep.cdc_sync_fifo_ram [18]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[19] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[19]),
        .Q(\zerodeep.cdc_sync_fifo_ram [19]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[1] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[1]),
        .Q(\zerodeep.cdc_sync_fifo_ram [1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[20] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[20]),
        .Q(\zerodeep.cdc_sync_fifo_ram [20]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[21] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[21]),
        .Q(\zerodeep.cdc_sync_fifo_ram [21]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[22] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[22]),
        .Q(\zerodeep.cdc_sync_fifo_ram [22]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[23] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[23]),
        .Q(\zerodeep.cdc_sync_fifo_ram [23]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[24] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[24]),
        .Q(\zerodeep.cdc_sync_fifo_ram [24]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[25] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[25]),
        .Q(\zerodeep.cdc_sync_fifo_ram [25]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[26] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[26]),
        .Q(\zerodeep.cdc_sync_fifo_ram [26]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[27] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[27]),
        .Q(\zerodeep.cdc_sync_fifo_ram [27]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[28] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[28]),
        .Q(\zerodeep.cdc_sync_fifo_ram [28]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[29] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[29]),
        .Q(\zerodeep.cdc_sync_fifo_ram [29]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[2] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[2]),
        .Q(\zerodeep.cdc_sync_fifo_ram [2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[30] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[30]),
        .Q(\zerodeep.cdc_sync_fifo_ram [30]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[3] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[3]),
        .Q(\zerodeep.cdc_sync_fifo_ram [3]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[4] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[4]),
        .Q(\zerodeep.cdc_sync_fifo_ram [4]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[5] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[5]),
        .Q(\zerodeep.cdc_sync_fifo_ram [5]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[6] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[6]),
        .Q(\zerodeep.cdc_sync_fifo_ram [6]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[7] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[7]),
        .Q(\zerodeep.cdc_sync_fifo_ram [7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[8] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[8]),
        .Q(\zerodeep.cdc_sync_fifo_ram [8]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[9] 
       (.C(m_src_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[9]),
        .Q(\zerodeep.cdc_sync_fifo_ram [9]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__1 \zerodeep.i_raddr_sync 
       (.E(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .\cdc_sync_stage1_reg[0]_0 (\cdc_sync_stage1_reg[0]_0 ),
        .\cdc_sync_stage2_reg[0]_0 (\cdc_sync_stage2_reg[0] ),
        .\cdc_sync_stage2_reg[0]_1 (\cdc_sync_stage2_reg[0]_0 ),
        .m_src_axi_aclk(m_src_axi_aclk),
        .src_dest_valid_hs(src_dest_valid_hs),
        .src_dest_valid_hs_reg(\zerodeep.i_raddr_sync_n_3 ),
        .src_dest_valid_hs_reg_0(E),
        .\zerodeep.cdc_sync_fifo_ram_reg[0] (\zerodeep.s_axis_waddr ),
        .\zerodeep.m_axis_raddr (\zerodeep.m_axis_raddr ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__2 \zerodeep.i_waddr_sync 
       (.\cdc_sync_stage1_reg[0]_0 (\cdc_sync_stage1_reg[0] ),
        .data_eot(data_eot),
        .dest_fifo_last(dest_fifo_last),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_ready(m_axis_ready),
        .m_axis_ready_0(\zerodeep.i_waddr_sync_n_1 ),
        .\zerodeep.m_axis_raddr (\zerodeep.m_axis_raddr ),
        .\zerodeep.m_axis_raddr_reg (\zerodeep.m_axis_raddr_reg_0 ),
        .\zerodeep.m_axis_raddr_reg_0 (\zerodeep.m_axis_raddr_reg_1 ),
        .\zerodeep.s_axis_waddr (\zerodeep.s_axis_waddr ));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.m_axis_raddr_reg 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_waddr_sync_n_1 ),
        .Q(\zerodeep.m_axis_raddr ),
        .R(\cdc_sync_stage1_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.s_axis_waddr_reg 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_raddr_sync_n_3 ),
        .Q(\zerodeep.s_axis_waddr ),
        .R(\cdc_sync_stage1_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "util_axis_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized1
   (out,
    up_sot,
    req_gen_valid__0,
    \zerodeep.m_axis_raddr0 ,
    \cdc_sync_stage1_reg[0] ,
    m_src_axi_aclk,
    Q,
    s_axi_aclk,
    req_gen_ready,
    \up_transfer_id_reg[0] ,
    up_dma_req_valid,
    up_dma_req_cyclic,
    \zerodeep.s_axis_waddr ,
    \zerodeep.m_axis_raddr_reg_0 ,
    src_req_ready,
    D);
  output [65:0]out;
  output up_sot;
  output req_gen_valid__0;
  output \zerodeep.m_axis_raddr0 ;
  input [0:0]\cdc_sync_stage1_reg[0] ;
  input m_src_axi_aclk;
  input [0:0]Q;
  input s_axi_aclk;
  input req_gen_ready;
  input \up_transfer_id_reg[0] ;
  input up_dma_req_valid;
  input up_dma_req_cyclic;
  input \zerodeep.s_axis_waddr ;
  input \zerodeep.m_axis_raddr_reg_0 ;
  input src_req_ready;
  input [62:0]D;

  wire [62:0]D;
  wire [0:0]Q;
  wire [0:0]\cdc_sync_stage1_reg[0] ;
  wire m_src_axi_aclk;
  wire req_gen_ready;
  wire req_gen_valid__0;
  wire s_axi_aclk;
  wire src_req_ready;
  wire up_dma_req_cyclic;
  wire up_dma_req_valid;
  wire up_sot;
  wire \up_transfer_id_reg[0] ;
  (* RTL_KEEP = "yes" *) wire [66:0]\zerodeep.cdc_sync_fifo_ram ;
  wire \zerodeep.cdc_sync_fifo_ram_reg0 ;
  wire \zerodeep.i_raddr_sync_n_3 ;
  wire \zerodeep.i_waddr_sync_n_1 ;
  wire \zerodeep.m_axis_raddr0 ;
  wire \zerodeep.m_axis_raddr_reg_0 ;
  wire \zerodeep.m_axis_raddr_reg_n_0 ;
  wire \zerodeep.s_axis_waddr ;
  wire \zerodeep.s_axis_waddr_reg_n_0 ;

  assign out[65:2] = \zerodeep.cdc_sync_fifo_ram [66:3];
  assign out[1:0] = \zerodeep.cdc_sync_fifo_ram [1:0];
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[0] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(1'b0),
        .Q(\zerodeep.cdc_sync_fifo_ram [0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[10] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[6]),
        .Q(\zerodeep.cdc_sync_fifo_ram [10]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[11] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[7]),
        .Q(\zerodeep.cdc_sync_fifo_ram [11]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[12] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[8]),
        .Q(\zerodeep.cdc_sync_fifo_ram [12]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[13] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[9]),
        .Q(\zerodeep.cdc_sync_fifo_ram [13]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[14] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[10]),
        .Q(\zerodeep.cdc_sync_fifo_ram [14]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[15] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[11]),
        .Q(\zerodeep.cdc_sync_fifo_ram [15]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[16] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[12]),
        .Q(\zerodeep.cdc_sync_fifo_ram [16]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[17] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[13]),
        .Q(\zerodeep.cdc_sync_fifo_ram [17]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[18] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[14]),
        .Q(\zerodeep.cdc_sync_fifo_ram [18]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[19] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[15]),
        .Q(\zerodeep.cdc_sync_fifo_ram [19]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[1] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[0]),
        .Q(\zerodeep.cdc_sync_fifo_ram [1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[20] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[16]),
        .Q(\zerodeep.cdc_sync_fifo_ram [20]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[21] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[17]),
        .Q(\zerodeep.cdc_sync_fifo_ram [21]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[22] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[18]),
        .Q(\zerodeep.cdc_sync_fifo_ram [22]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[23] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[19]),
        .Q(\zerodeep.cdc_sync_fifo_ram [23]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[24] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[20]),
        .Q(\zerodeep.cdc_sync_fifo_ram [24]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[25] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[21]),
        .Q(\zerodeep.cdc_sync_fifo_ram [25]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[26] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[22]),
        .Q(\zerodeep.cdc_sync_fifo_ram [26]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[27] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[23]),
        .Q(\zerodeep.cdc_sync_fifo_ram [27]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[28] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[24]),
        .Q(\zerodeep.cdc_sync_fifo_ram [28]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[29] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[25]),
        .Q(\zerodeep.cdc_sync_fifo_ram [29]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[2] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(1'b0),
        .Q(\zerodeep.cdc_sync_fifo_ram [2]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[30] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[26]),
        .Q(\zerodeep.cdc_sync_fifo_ram [30]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[31] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[27]),
        .Q(\zerodeep.cdc_sync_fifo_ram [31]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[32] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[28]),
        .Q(\zerodeep.cdc_sync_fifo_ram [32]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[33] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[29]),
        .Q(\zerodeep.cdc_sync_fifo_ram [33]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[34] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[30]),
        .Q(\zerodeep.cdc_sync_fifo_ram [34]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[35] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[31]),
        .Q(\zerodeep.cdc_sync_fifo_ram [35]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[36] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[32]),
        .Q(\zerodeep.cdc_sync_fifo_ram [36]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[37] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[33]),
        .Q(\zerodeep.cdc_sync_fifo_ram [37]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[38] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[34]),
        .Q(\zerodeep.cdc_sync_fifo_ram [38]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[39] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[35]),
        .Q(\zerodeep.cdc_sync_fifo_ram [39]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[3] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(1'b1),
        .Q(\zerodeep.cdc_sync_fifo_ram [3]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[40] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[36]),
        .Q(\zerodeep.cdc_sync_fifo_ram [40]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[41] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[37]),
        .Q(\zerodeep.cdc_sync_fifo_ram [41]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[42] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[38]),
        .Q(\zerodeep.cdc_sync_fifo_ram [42]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[43] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[39]),
        .Q(\zerodeep.cdc_sync_fifo_ram [43]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[44] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[40]),
        .Q(\zerodeep.cdc_sync_fifo_ram [44]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[45] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[41]),
        .Q(\zerodeep.cdc_sync_fifo_ram [45]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[46] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[42]),
        .Q(\zerodeep.cdc_sync_fifo_ram [46]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[47] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[43]),
        .Q(\zerodeep.cdc_sync_fifo_ram [47]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[48] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[44]),
        .Q(\zerodeep.cdc_sync_fifo_ram [48]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[49] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[45]),
        .Q(\zerodeep.cdc_sync_fifo_ram [49]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[4] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(1'b1),
        .Q(\zerodeep.cdc_sync_fifo_ram [4]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[50] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[46]),
        .Q(\zerodeep.cdc_sync_fifo_ram [50]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[51] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[47]),
        .Q(\zerodeep.cdc_sync_fifo_ram [51]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[52] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[48]),
        .Q(\zerodeep.cdc_sync_fifo_ram [52]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[53] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[49]),
        .Q(\zerodeep.cdc_sync_fifo_ram [53]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[54] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[50]),
        .Q(\zerodeep.cdc_sync_fifo_ram [54]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[55] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[51]),
        .Q(\zerodeep.cdc_sync_fifo_ram [55]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[56] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[52]),
        .Q(\zerodeep.cdc_sync_fifo_ram [56]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[57] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[53]),
        .Q(\zerodeep.cdc_sync_fifo_ram [57]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[58] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[54]),
        .Q(\zerodeep.cdc_sync_fifo_ram [58]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[59] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[55]),
        .Q(\zerodeep.cdc_sync_fifo_ram [59]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[5] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[1]),
        .Q(\zerodeep.cdc_sync_fifo_ram [5]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[60] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[56]),
        .Q(\zerodeep.cdc_sync_fifo_ram [60]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[61] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[57]),
        .Q(\zerodeep.cdc_sync_fifo_ram [61]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[62] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[58]),
        .Q(\zerodeep.cdc_sync_fifo_ram [62]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[63] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[59]),
        .Q(\zerodeep.cdc_sync_fifo_ram [63]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[64] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[60]),
        .Q(\zerodeep.cdc_sync_fifo_ram [64]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[65] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[61]),
        .Q(\zerodeep.cdc_sync_fifo_ram [65]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[66] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[62]),
        .Q(\zerodeep.cdc_sync_fifo_ram [66]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[6] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[2]),
        .Q(\zerodeep.cdc_sync_fifo_ram [6]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[7] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[3]),
        .Q(\zerodeep.cdc_sync_fifo_ram [7]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[8] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[4]),
        .Q(\zerodeep.cdc_sync_fifo_ram [8]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[9] 
       (.C(s_axi_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(D[5]),
        .Q(\zerodeep.cdc_sync_fifo_ram [9]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__5 \zerodeep.i_raddr_sync 
       (.E(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .Q(Q),
        .\cdc_sync_stage1_reg[0]_0 (\zerodeep.m_axis_raddr_reg_n_0 ),
        .req_gen_ready(req_gen_ready),
        .req_gen_valid__0(req_gen_valid__0),
        .s_axi_aclk(s_axi_aclk),
        .up_dma_req_cyclic(up_dma_req_cyclic),
        .up_dma_req_valid(up_dma_req_valid),
        .up_dma_req_valid_reg(\zerodeep.i_raddr_sync_n_3 ),
        .up_sot(up_sot),
        .\up_transfer_id_reg[0] (\up_transfer_id_reg[0] ),
        .\zerodeep.s_axis_waddr_reg (\zerodeep.s_axis_waddr_reg_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__6 \zerodeep.i_waddr_sync 
       (.\cdc_sync_stage1_reg[0]_0 (\cdc_sync_stage1_reg[0] ),
        .\cdc_sync_stage1_reg[0]_1 (\zerodeep.s_axis_waddr_reg_n_0 ),
        .m_src_axi_aclk(m_src_axi_aclk),
        .src_req_ready(src_req_ready),
        .\zerodeep.m_axis_raddr0 (\zerodeep.m_axis_raddr0 ),
        .\zerodeep.m_axis_raddr_reg (\zerodeep.i_waddr_sync_n_1 ),
        .\zerodeep.m_axis_raddr_reg_0 (\zerodeep.m_axis_raddr_reg_n_0 ),
        .\zerodeep.m_axis_raddr_reg_1 (\zerodeep.m_axis_raddr_reg_0 ),
        .\zerodeep.s_axis_waddr (\zerodeep.s_axis_waddr ));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.m_axis_raddr_reg 
       (.C(m_src_axi_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_waddr_sync_n_1 ),
        .Q(\zerodeep.m_axis_raddr_reg_n_0 ),
        .R(\cdc_sync_stage1_reg[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.s_axis_waddr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_raddr_sync_n_3 ),
        .Q(\zerodeep.s_axis_waddr_reg_n_0 ),
        .R(Q));
endmodule

(* ORIG_REF_NAME = "util_axis_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo__parameterized2
   (out,
    id0,
    E,
    D,
    \FSM_sequential_state_reg[2] ,
    response_ready_reg,
    Q,
    s_axi_aclk,
    \cdc_sync_stage2_reg[0] ,
    m_axis_aclk,
    response_eot,
    dest_response_valid,
    response_dest_ready,
    up_response_ready,
    \FSM_sequential_state_reg[2]_0 ,
    \FSM_sequential_state_reg[1] ,
    nx_state15_in,
    response_dest_ready_reg,
    \FSM_sequential_state_reg[2]_1 ,
    state_reg,
    response_dest_ready_reg_0,
    up_response_valid);
  output [8:0]out;
  output id0;
  output [0:0]E;
  output [2:0]D;
  output \FSM_sequential_state_reg[2] ;
  output response_ready_reg;
  input [0:0]Q;
  input s_axi_aclk;
  input [0:0]\cdc_sync_stage2_reg[0] ;
  input m_axis_aclk;
  input response_eot;
  input dest_response_valid;
  input response_dest_ready;
  input up_response_ready;
  input [2:0]\FSM_sequential_state_reg[2]_0 ;
  input \FSM_sequential_state_reg[1] ;
  input nx_state15_in;
  input response_dest_ready_reg;
  input [1:0]\FSM_sequential_state_reg[2]_1 ;
  input [0:0]state_reg;
  input response_dest_ready_reg_0;
  input up_response_valid;

  wire [2:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[2] ;
  wire [2:0]\FSM_sequential_state_reg[2]_0 ;
  wire [1:0]\FSM_sequential_state_reg[2]_1 ;
  wire [0:0]Q;
  wire [0:0]\cdc_sync_stage2_reg[0] ;
  wire dest_response_valid;
  wire id0;
  wire m_axis_aclk;
  wire nx_state15_in;
  wire response_dest_ready;
  wire response_dest_ready_reg;
  wire response_dest_ready_reg_0;
  wire response_eot;
  wire response_ready_reg;
  wire s_axi_aclk;
  wire [0:0]state_reg;
  wire up_response_ready;
  wire up_response_valid;
  (* RTL_KEEP = "yes" *) wire [8:0]\zerodeep.cdc_sync_fifo_ram ;
  wire \zerodeep.cdc_sync_fifo_ram_reg0 ;
  wire \zerodeep.i_raddr_sync_n_2 ;
  wire \zerodeep.i_waddr_sync_n_6 ;
  wire \zerodeep.m_axis_raddr_reg_n_0 ;
  wire \zerodeep.s_axis_waddr_reg_n_0 ;

  assign out[8:0] = \zerodeep.cdc_sync_fifo_ram ;
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [7]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(\zerodeep.cdc_sync_fifo_ram [1]));
  (* KEEP = "yes" *) 
  FDRE \zerodeep.cdc_sync_fifo_ram_reg[0] 
       (.C(m_axis_aclk),
        .CE(\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .D(response_eot),
        .Q(\zerodeep.cdc_sync_fifo_ram [0]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__3 \zerodeep.i_raddr_sync 
       (.\cdc_sync_stage1_reg[0]_0 (\zerodeep.m_axis_raddr_reg_n_0 ),
        .\cdc_sync_stage2_reg[0]_0 (\zerodeep.i_raddr_sync_n_2 ),
        .\cdc_sync_stage2_reg[0]_1 (\cdc_sync_stage2_reg[0] ),
        .dest_response_valid(dest_response_valid),
        .id0(id0),
        .m_axis_aclk(m_axis_aclk),
        .\zerodeep.cdc_sync_fifo_ram_reg0 (\zerodeep.cdc_sync_fifo_ram_reg0 ),
        .\zerodeep.s_axis_waddr_reg (\zerodeep.s_axis_waddr_reg_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_bits__xdcDup__4 \zerodeep.i_waddr_sync 
       (.D(D),
        .E(E),
        .\FSM_sequential_state_reg[1] (\FSM_sequential_state_reg[1] ),
        .\FSM_sequential_state_reg[2] (\FSM_sequential_state_reg[2] ),
        .\FSM_sequential_state_reg[2]_0 (\FSM_sequential_state_reg[2]_0 ),
        .\FSM_sequential_state_reg[2]_1 (\FSM_sequential_state_reg[2]_1 ),
        .Q(Q),
        .\cdc_sync_stage1_reg[0]_0 (\zerodeep.s_axis_waddr_reg_n_0 ),
        .nx_state15_in(nx_state15_in),
        .response_dest_ready(response_dest_ready),
        .response_dest_ready_reg(\zerodeep.i_waddr_sync_n_6 ),
        .response_dest_ready_reg_0(response_dest_ready_reg),
        .response_dest_ready_reg_1(response_dest_ready_reg_0),
        .response_ready_reg(response_ready_reg),
        .s_axi_aclk(s_axi_aclk),
        .state_reg(state_reg),
        .up_response_ready(up_response_ready),
        .up_response_valid(up_response_valid),
        .\zerodeep.m_axis_raddr_reg (\zerodeep.m_axis_raddr_reg_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.m_axis_raddr_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_waddr_sync_n_6 ),
        .Q(\zerodeep.m_axis_raddr_reg_n_0 ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \zerodeep.s_axis_waddr_reg 
       (.C(m_axis_aclk),
        .CE(1'b1),
        .D(\zerodeep.i_raddr_sync_n_2 ),
        .Q(\zerodeep.s_axis_waddr_reg_n_0 ),
        .R(\cdc_sync_stage2_reg[0] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_axis_fifo_address_generator
   (up_tlf_s_valid_reg,
    SR,
    Q,
    \s_axis_waddr_reg_reg[1]_0 ,
    \fifo.valid_reg ,
    response_valid_reg,
    E,
    up_tlf_s_valid_reg_0,
    \s_axis_waddr_reg_reg[2]_0 ,
    up_bl_partial,
    up_response_valid,
    response_ready_reg,
    \s_axis_waddr_reg_reg[0]_0 ,
    up_tlf_valid,
    p_8_in,
    s_axi_aclk);
  output up_tlf_s_valid_reg;
  output [0:0]SR;
  output [1:0]Q;
  output [1:0]\s_axis_waddr_reg_reg[1]_0 ;
  output \fifo.valid_reg ;
  output response_valid_reg;
  output [0:0]E;
  output [0:0]up_tlf_s_valid_reg_0;
  input \s_axis_waddr_reg_reg[2]_0 ;
  input up_bl_partial;
  input up_response_valid;
  input response_ready_reg;
  input \s_axis_waddr_reg_reg[0]_0 ;
  input up_tlf_valid;
  input p_8_in;
  input s_axi_aclk;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire \fifo.valid_reg ;
  wire m_axis_empty;
  wire [2:2]m_axis_raddr;
  wire \m_axis_raddr_reg[0]_i_1_n_0 ;
  wire [2:1]p_1_in;
  wire p_8_in;
  wire response_ready_reg;
  wire response_valid_reg;
  wire s_axi_aclk;
  wire [2:2]s_axis_waddr;
  wire \s_axis_waddr_reg[0]_i_1_n_0 ;
  wire \s_axis_waddr_reg[1]_i_1_n_0 ;
  wire \s_axis_waddr_reg[2]_i_2_n_0 ;
  wire \s_axis_waddr_reg_reg[0]_0 ;
  wire [1:0]\s_axis_waddr_reg_reg[1]_0 ;
  wire \s_axis_waddr_reg_reg[2]_0 ;
  wire up_bl_partial;
  wire up_response_valid;
  wire up_tlf_s_ready;
  wire up_tlf_s_valid_reg;
  wire [0:0]up_tlf_s_valid_reg_0;
  wire up_tlf_valid;

  LUT3 #(
    .INIT(8'h2F)) 
    \fifo.valid_i_1 
       (.I0(up_tlf_valid),
        .I1(p_8_in),
        .I2(m_axis_empty),
        .O(\fifo.valid_reg ));
  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_raddr_reg[0]_i_1 
       (.I0(Q[0]),
        .O(\m_axis_raddr_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \m_axis_raddr_reg[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(p_1_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_raddr_reg[2]_i_1 
       (.I0(\s_axis_waddr_reg_reg[0]_0 ),
        .O(SR));
  LUT3 #(
    .INIT(8'h0D)) 
    \m_axis_raddr_reg[2]_i_2 
       (.I0(up_tlf_valid),
        .I1(p_8_in),
        .I2(m_axis_empty),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \m_axis_raddr_reg[2]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(m_axis_raddr),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \m_axis_raddr_reg[2]_i_5 
       (.I0(\s_axis_waddr_reg_reg[1]_0 [0]),
        .I1(Q[0]),
        .I2(m_axis_raddr),
        .I3(s_axis_waddr),
        .I4(Q[1]),
        .I5(\s_axis_waddr_reg_reg[1]_0 [1]),
        .O(m_axis_empty));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_raddr_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\m_axis_raddr_reg[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_raddr_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_raddr_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(p_1_in[2]),
        .Q(m_axis_raddr),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h74)) 
    response_ready_i_1
       (.I0(up_response_valid),
        .I1(response_ready_reg),
        .I2(up_tlf_s_ready),
        .O(response_valid_reg));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axis_waddr_reg[0]_i_1 
       (.I0(\s_axis_waddr_reg_reg[1]_0 [0]),
        .O(\s_axis_waddr_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \s_axis_waddr_reg[1]_i_1 
       (.I0(\s_axis_waddr_reg_reg[1]_0 [0]),
        .I1(\s_axis_waddr_reg_reg[1]_0 [1]),
        .O(\s_axis_waddr_reg[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \s_axis_waddr_reg[2]_i_1 
       (.I0(up_tlf_s_ready),
        .I1(\s_axis_waddr_reg_reg[2]_0 ),
        .O(up_tlf_s_valid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \s_axis_waddr_reg[2]_i_2 
       (.I0(\s_axis_waddr_reg_reg[1]_0 [0]),
        .I1(\s_axis_waddr_reg_reg[1]_0 [1]),
        .I2(s_axis_waddr),
        .O(\s_axis_waddr_reg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF9FF6FFF9FFFF9F)) 
    \s_axis_waddr_reg[2]_i_3 
       (.I0(s_axis_waddr),
        .I1(m_axis_raddr),
        .I2(Q[0]),
        .I3(\s_axis_waddr_reg_reg[1]_0 [0]),
        .I4(Q[1]),
        .I5(\s_axis_waddr_reg_reg[1]_0 [1]),
        .O(up_tlf_s_ready));
  FDRE #(
    .INIT(1'b0)) 
    \s_axis_waddr_reg_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_tlf_s_valid_reg_0),
        .D(\s_axis_waddr_reg[0]_i_1_n_0 ),
        .Q(\s_axis_waddr_reg_reg[1]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axis_waddr_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_tlf_s_valid_reg_0),
        .D(\s_axis_waddr_reg[1]_i_1_n_0 ),
        .Q(\s_axis_waddr_reg_reg[1]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axis_waddr_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(up_tlf_s_valid_reg_0),
        .D(\s_axis_waddr_reg[2]_i_2_n_0 ),
        .Q(s_axis_waddr),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC000CAAA)) 
    up_tlf_s_valid_i_1
       (.I0(\s_axis_waddr_reg_reg[2]_0 ),
        .I1(up_bl_partial),
        .I2(up_response_valid),
        .I3(response_ready_reg),
        .I4(up_tlf_s_ready),
        .O(up_tlf_s_valid_reg));
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
