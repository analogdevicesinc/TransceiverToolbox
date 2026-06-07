// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:08:49 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_axi_sysid_0_0_sim_netlist.v
// Design      : system_axi_sysid_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_sysid
   (up_axi_rvalid_int_reg,
    rom_addr,
    s_axi_rdata,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_aresetn,
    s_axi_arvalid,
    s_axi_rready,
    s_axi_aclk,
    s_axi_araddr,
    s_axi_wdata,
    s_axi_awaddr,
    s_axi_bready,
    sys_rom_data,
    pr_rom_data);
  output up_axi_rvalid_int_reg;
  output [8:0]rom_addr;
  output [31:0]s_axi_rdata;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_aresetn;
  input s_axi_arvalid;
  input s_axi_rready;
  input s_axi_aclk;
  input [10:0]s_axi_araddr;
  input [31:0]s_axi_wdata;
  input [10:0]s_axi_awaddr;
  input s_axi_bready;
  input [31:0]sys_rom_data;
  input [31:0]pr_rom_data;

  wire i_up_axi_n_100;
  wire i_up_axi_n_101;
  wire i_up_axi_n_102;
  wire i_up_axi_n_103;
  wire i_up_axi_n_104;
  wire i_up_axi_n_105;
  wire i_up_axi_n_106;
  wire i_up_axi_n_107;
  wire i_up_axi_n_108;
  wire i_up_axi_n_109;
  wire i_up_axi_n_110;
  wire i_up_axi_n_111;
  wire i_up_axi_n_112;
  wire i_up_axi_n_113;
  wire i_up_axi_n_81;
  wire i_up_axi_n_82;
  wire i_up_axi_n_83;
  wire i_up_axi_n_84;
  wire i_up_axi_n_85;
  wire i_up_axi_n_86;
  wire i_up_axi_n_87;
  wire i_up_axi_n_88;
  wire i_up_axi_n_89;
  wire i_up_axi_n_90;
  wire i_up_axi_n_91;
  wire i_up_axi_n_92;
  wire i_up_axi_n_93;
  wire i_up_axi_n_94;
  wire i_up_axi_n_95;
  wire i_up_axi_n_96;
  wire i_up_axi_n_97;
  wire i_up_axi_n_98;
  wire i_up_axi_n_99;
  wire p_0_in;
  wire [31:0]pr_rom_data;
  wire [8:0]rom_addr;
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
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [31:0]sys_rom_data;
  wire up_axi_rvalid_int_reg;
  wire up_rack_s;
  wire [31:0]up_rdata_s;
  wire \up_rdata_s[31]_i_1_n_0 ;
  wire up_rreq_int;
  wire up_rreq_s_d;
  wire [31:0]up_scratch;
  wire up_wack;
  wire [31:0]up_wdata_int;
  wire up_wreq_s;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_axi i_up_axi
       (.D({i_up_axi_n_82,i_up_axi_n_83,i_up_axi_n_84,i_up_axi_n_85,i_up_axi_n_86,i_up_axi_n_87,i_up_axi_n_88,i_up_axi_n_89,i_up_axi_n_90,i_up_axi_n_91,i_up_axi_n_92,i_up_axi_n_93,i_up_axi_n_94,i_up_axi_n_95,i_up_axi_n_96,i_up_axi_n_97,i_up_axi_n_98,i_up_axi_n_99,i_up_axi_n_100,i_up_axi_n_101,i_up_axi_n_102,i_up_axi_n_103,i_up_axi_n_104,i_up_axi_n_105,i_up_axi_n_106,i_up_axi_n_107,i_up_axi_n_108,i_up_axi_n_109,i_up_axi_n_110,i_up_axi_n_111,i_up_axi_n_112,i_up_axi_n_113}),
        .E(i_up_axi_n_81),
        .Q(up_rdata_s),
        .p_0_in(p_0_in),
        .pr_rom_data(pr_rom_data),
        .rom_addr(rom_addr),
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
        .sys_rom_data(sys_rom_data),
        .up_axi_rvalid_int_reg_0(up_axi_rvalid_int_reg),
        .up_rack_s(up_rack_s),
        .\up_rdata_s_reg[31] (up_scratch),
        .up_rreq_int(up_rreq_int),
        .up_wack(up_wack),
        .\up_wdata_int_reg[31]_0 (up_wdata_int),
        .up_wreq_s(up_wreq_s));
  FDRE #(
    .INIT(1'b0)) 
    up_rack_s_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rreq_s_d),
        .Q(up_rack_s),
        .R(p_0_in));
  LUT2 #(
    .INIT(4'h7)) 
    \up_rdata_s[31]_i_1 
       (.I0(s_axi_aresetn),
        .I1(up_rreq_s_d),
        .O(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_113),
        .Q(up_rdata_s[0]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_103),
        .Q(up_rdata_s[10]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_102),
        .Q(up_rdata_s[11]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_101),
        .Q(up_rdata_s[12]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_100),
        .Q(up_rdata_s[13]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_99),
        .Q(up_rdata_s[14]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_98),
        .Q(up_rdata_s[15]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_97),
        .Q(up_rdata_s[16]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_96),
        .Q(up_rdata_s[17]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_95),
        .Q(up_rdata_s[18]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_94),
        .Q(up_rdata_s[19]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_112),
        .Q(up_rdata_s[1]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_93),
        .Q(up_rdata_s[20]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_92),
        .Q(up_rdata_s[21]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_91),
        .Q(up_rdata_s[22]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_90),
        .Q(up_rdata_s[23]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_89),
        .Q(up_rdata_s[24]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_88),
        .Q(up_rdata_s[25]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_87),
        .Q(up_rdata_s[26]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_86),
        .Q(up_rdata_s[27]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_85),
        .Q(up_rdata_s[28]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_84),
        .Q(up_rdata_s[29]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_111),
        .Q(up_rdata_s[2]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_83),
        .Q(up_rdata_s[30]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_82),
        .Q(up_rdata_s[31]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_110),
        .Q(up_rdata_s[3]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_109),
        .Q(up_rdata_s[4]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_108),
        .Q(up_rdata_s[5]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_107),
        .Q(up_rdata_s[6]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_106),
        .Q(up_rdata_s[7]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_105),
        .Q(up_rdata_s[8]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_s_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(i_up_axi_n_104),
        .Q(up_rdata_s[9]),
        .R(\up_rdata_s[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    up_rreq_s_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rreq_int),
        .Q(up_rreq_s_d),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[0] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[0]),
        .Q(up_scratch[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[10] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[10]),
        .Q(up_scratch[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[11] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[11]),
        .Q(up_scratch[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[12] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[12]),
        .Q(up_scratch[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[13] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[13]),
        .Q(up_scratch[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[14] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[14]),
        .Q(up_scratch[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[15] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[15]),
        .Q(up_scratch[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[16] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[16]),
        .Q(up_scratch[16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[17] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[17]),
        .Q(up_scratch[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[18] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[18]),
        .Q(up_scratch[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[19] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[19]),
        .Q(up_scratch[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[1] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[1]),
        .Q(up_scratch[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[20] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[20]),
        .Q(up_scratch[20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[21] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[21]),
        .Q(up_scratch[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[22] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[22]),
        .Q(up_scratch[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[23] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[23]),
        .Q(up_scratch[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[24] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[24]),
        .Q(up_scratch[24]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[25] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[25]),
        .Q(up_scratch[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[26] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[26]),
        .Q(up_scratch[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[27] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[27]),
        .Q(up_scratch[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[28] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[28]),
        .Q(up_scratch[28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[29] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[29]),
        .Q(up_scratch[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[2] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[2]),
        .Q(up_scratch[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[30] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[30]),
        .Q(up_scratch[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[31] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[31]),
        .Q(up_scratch[31]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[3] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[3]),
        .Q(up_scratch[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[4] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[4]),
        .Q(up_scratch[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[5] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[5]),
        .Q(up_scratch[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[6] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[6]),
        .Q(up_scratch[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[7] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[7]),
        .Q(up_scratch[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[8] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[8]),
        .Q(up_scratch[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_scratch_reg[9] 
       (.C(s_axi_aclk),
        .CE(i_up_axi_n_81),
        .D(up_wdata_int[9]),
        .Q(up_scratch[9]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    up_wack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wreq_s),
        .Q(up_wack),
        .R(p_0_in));
endmodule

(* CHECK_LICENSE_TYPE = "system_axi_sysid_0_0,axi_sysid,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "axi_sysid,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awready,
    s_axi_wvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wready,
    s_axi_bvalid,
    s_axi_bresp,
    s_axi_bready,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arready,
    s_axi_rvalid,
    s_axi_rresp,
    s_axi_rdata,
    s_axi_rready,
    sys_rom_data,
    pr_rom_data,
    rom_addr);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [15:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [15:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  input [31:0]sys_rom_data;
  input [31:0]pr_rom_data;
  output [8:0]rom_addr;

  wire \<const0> ;
  wire [31:0]pr_rom_data;
  wire [8:0]rom_addr;
  wire s_axi_aclk;
  wire [15:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [15:0]s_axi_awaddr;
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
  wire [31:0]sys_rom_data;

  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_sysid inst
       (.pr_rom_data(pr_rom_data),
        .rom_addr(rom_addr),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[12:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[12:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .sys_rom_data(sys_rom_data),
        .up_axi_rvalid_int_reg(s_axi_rvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_up_axi
   (p_0_in,
    up_wreq_s,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    up_rreq_int,
    up_axi_rvalid_int_reg_0,
    s_axi_arready,
    rom_addr,
    \up_wdata_int_reg[31]_0 ,
    s_axi_rdata,
    E,
    D,
    s_axi_aclk,
    up_wack,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_aresetn,
    s_axi_arvalid,
    Q,
    s_axi_rready,
    up_rack_s,
    s_axi_bready,
    s_axi_araddr,
    s_axi_wdata,
    s_axi_awaddr,
    \up_rdata_s_reg[31] ,
    sys_rom_data,
    pr_rom_data);
  output p_0_in;
  output up_wreq_s;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output up_rreq_int;
  output up_axi_rvalid_int_reg_0;
  output s_axi_arready;
  output [8:0]rom_addr;
  output [31:0]\up_wdata_int_reg[31]_0 ;
  output [31:0]s_axi_rdata;
  output [0:0]E;
  output [31:0]D;
  input s_axi_aclk;
  input up_wack;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_aresetn;
  input s_axi_arvalid;
  input [31:0]Q;
  input s_axi_rready;
  input up_rack_s;
  input s_axi_bready;
  input [10:0]s_axi_araddr;
  input [31:0]s_axi_wdata;
  input [10:0]s_axi_awaddr;
  input [31:0]\up_rdata_s_reg[31] ;
  input [31:0]sys_rom_data;
  input [31:0]pr_rom_data;

  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire [31:0]data1;
  wire p_0_in;
  wire p_0_in6_in;
  wire p_0_in7_in;
  wire p_1_in;
  wire p_1_in_0;
  wire [4:1]p_2_in;
  wire p_5_in;
  wire [31:0]pr_rom_data;
  wire [8:0]rom_addr;
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
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [31:0]sys_rom_data;
  wire up_axi_arready_int_i_1_n_0;
  wire up_axi_arready_int_i_2_n_0;
  wire up_axi_awready_int_i_2_n_0;
  wire up_axi_bvalid_int_i_1_n_0;
  wire \up_axi_rdata_int[31]_i_1_n_0 ;
  wire up_axi_rvalid_int_i_1_n_0;
  wire up_axi_rvalid_int_reg_0;
  wire up_axi_wready_int_i_1_n_0;
  wire up_rack_d;
  wire up_rack_s;
  wire up_rack_s_1;
  wire [10:9]up_raddr_int;
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
  wire [31:0]up_rdata_d;
  wire \up_rdata_d[0]_i_1_n_0 ;
  wire \up_rdata_d[10]_i_1_n_0 ;
  wire \up_rdata_d[11]_i_1_n_0 ;
  wire \up_rdata_d[12]_i_1_n_0 ;
  wire \up_rdata_d[14]_i_1_n_0 ;
  wire \up_rdata_d[15]_i_1_n_0 ;
  wire \up_rdata_d[16]_i_1_n_0 ;
  wire \up_rdata_d[18]_i_1_n_0 ;
  wire \up_rdata_d[19]_i_1_n_0 ;
  wire \up_rdata_d[21]_i_1_n_0 ;
  wire \up_rdata_d[23]_i_1_n_0 ;
  wire \up_rdata_d[25]_i_1_n_0 ;
  wire \up_rdata_d[26]_i_1_n_0 ;
  wire \up_rdata_d[27]_i_1_n_0 ;
  wire \up_rdata_d[28]_i_1_n_0 ;
  wire \up_rdata_d[29]_i_1_n_0 ;
  wire \up_rdata_d[2]_i_1_n_0 ;
  wire \up_rdata_d[30]_i_1_n_0 ;
  wire \up_rdata_d[31]_i_1_n_0 ;
  wire \up_rdata_d[3]_i_1_n_0 ;
  wire \up_rdata_d[5]_i_1_n_0 ;
  wire \up_rdata_d[7]_i_1_n_0 ;
  wire \up_rdata_d[9]_i_1_n_0 ;
  wire \up_rdata_s[31]_i_4_n_0 ;
  wire \up_rdata_s[31]_i_5_n_0 ;
  wire \up_rdata_s[31]_i_6_n_0 ;
  wire \up_rdata_s[31]_i_7_n_0 ;
  wire [31:0]\up_rdata_s_reg[31] ;
  wire up_rreq_int;
  wire up_rreq_int_i_1_n_0;
  wire up_rsel_inv_i_1_n_0;
  wire \up_scratch[31]_i_2_n_0 ;
  wire \up_scratch[31]_i_3_n_0 ;
  wire up_wack;
  wire up_wack_d;
  wire up_wack_s;
  wire [10:0]up_waddr_s;
  wire \up_wcount[0]_i_1_n_0 ;
  wire \up_wcount[2]_i_1_n_0 ;
  wire \up_wcount_reg_n_0_[0] ;
  wire \up_wcount_reg_n_0_[1] ;
  wire \up_wcount_reg_n_0_[2] ;
  wire \up_wcount_reg_n_0_[3] ;
  wire [31:0]\up_wdata_int_reg[31]_0 ;
  wire up_wreq_int_i_1_n_0;
  wire up_wreq_s;
  wire up_wsel_inv_i_1_n_0;

  LUT4 #(
    .INIT(16'h5540)) 
    up_axi_arready_int_i_1
       (.I0(s_axi_arready),
        .I1(up_rack_s),
        .I2(p_0_in6_in),
        .I3(up_axi_arready_int_i_2_n_0),
        .O(up_axi_arready_int_i_1_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    up_axi_arready_int_i_2
       (.I0(\up_rcount_reg_n_0_[0] ),
        .I1(\up_rcount_reg_n_0_[1] ),
        .I2(\up_rcount_reg_n_0_[2] ),
        .I3(\up_rcount_reg_n_0_[3] ),
        .I4(p_0_in6_in),
        .O(up_axi_arready_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_arready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_arready_int_i_1_n_0),
        .Q(s_axi_arready),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    up_axi_awready_int_i_1
       (.I0(s_axi_aresetn),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_awready_int_i_2
       (.I0(s_axi_awready),
        .I1(up_wack_s),
        .O(up_axi_awready_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_awready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_awready_int_i_2_n_0),
        .Q(s_axi_awready),
        .R(p_0_in));
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
       (.I0(s_axi_rready),
        .I1(up_axi_rvalid_int_reg_0),
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
    .INIT(16'h08C8)) 
    up_axi_rvalid_int_i_1
       (.I0(up_rack_d),
        .I1(s_axi_aresetn),
        .I2(up_axi_rvalid_int_reg_0),
        .I3(s_axi_rready),
        .O(up_axi_rvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_rvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_rvalid_int_i_1_n_0),
        .Q(up_axi_rvalid_int_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_wready_int_i_1
       (.I0(s_axi_wready),
        .I1(up_wack_s),
        .O(up_axi_wready_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_axi_wready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_axi_wready_int_i_1_n_0),
        .Q(s_axi_wready),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hC888888888888888)) 
    up_rack_d_i_1
       (.I0(up_rack_s),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .I4(\up_rcount_reg_n_0_[2] ),
        .I5(\up_rcount_reg_n_0_[3] ),
        .O(up_rack_s_1));
  FDRE #(
    .INIT(1'b0)) 
    up_rack_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rack_s_1),
        .Q(up_rack_d),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[0]),
        .Q(rom_addr[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[10]),
        .Q(up_raddr_int[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[1]),
        .Q(rom_addr[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[2]),
        .Q(rom_addr[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[3]),
        .Q(rom_addr[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[4]),
        .Q(rom_addr[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[5]),
        .Q(rom_addr[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[6]),
        .Q(rom_addr[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[7]),
        .Q(rom_addr[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[8]),
        .Q(rom_addr[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_raddr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .D(s_axi_araddr[9]),
        .Q(up_raddr_int[9]),
        .R(p_0_in));
  LUT3 #(
    .INIT(8'h04)) 
    \up_rcount[0]_i_1 
       (.I0(up_rack_s),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[0] ),
        .O(\up_rcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \up_rcount[1]_i_1 
       (.I0(up_rack_s),
        .I1(\up_rcount_reg_n_0_[0] ),
        .I2(\up_rcount_reg_n_0_[1] ),
        .I3(p_0_in6_in),
        .O(\up_rcount[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h14440000)) 
    \up_rcount[2]_i_1 
       (.I0(up_rack_s),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(\up_rcount_reg_n_0_[1] ),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(p_0_in6_in),
        .O(\up_rcount[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1444444400000000)) 
    \up_rcount[3]_i_1 
       (.I0(up_rack_s),
        .I1(\up_rcount_reg_n_0_[3] ),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .I4(\up_rcount_reg_n_0_[2] ),
        .I5(p_0_in6_in),
        .O(\up_rcount[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \up_rcount[4]_i_1 
       (.I0(p_0_in6_in),
        .I1(up_rreq_int),
        .O(\up_rcount[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF7FFFFFFF)) 
    \up_rcount[4]_i_2 
       (.I0(\up_rcount_reg_n_0_[3] ),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(\up_rcount_reg_n_0_[1] ),
        .I3(\up_rcount_reg_n_0_[0] ),
        .I4(p_0_in6_in),
        .I5(up_rack_s),
        .O(\up_rcount[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[0]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[0] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[1]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[1] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[2]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[2] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[3]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[3] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rcount_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[4]_i_1_n_0 ),
        .D(\up_rcount[4]_i_2_n_0 ),
        .Q(p_0_in6_in),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[0]_i_1 
       (.I0(Q[0]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[10]_i_1 
       (.I0(Q[10]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[11]_i_1 
       (.I0(Q[11]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[12]_i_1 
       (.I0(Q[12]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[14]_i_1 
       (.I0(Q[14]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[15]_i_1 
       (.I0(Q[15]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[16]_i_1 
       (.I0(Q[16]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[18]_i_1 
       (.I0(Q[18]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[19]_i_1 
       (.I0(Q[19]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[21]_i_1 
       (.I0(Q[21]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[23]_i_1 
       (.I0(Q[23]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[25]_i_1 
       (.I0(Q[25]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[26]_i_1 
       (.I0(Q[26]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[27]_i_1 
       (.I0(Q[27]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[28]_i_1 
       (.I0(Q[28]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h80000000FFFFFFFF)) 
    \up_rdata_d[29]_i_1 
       (.I0(p_0_in6_in),
        .I1(\up_rcount_reg_n_0_[3] ),
        .I2(\up_rcount_reg_n_0_[2] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(s_axi_aresetn),
        .O(\up_rdata_d[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[2]_i_1 
       (.I0(Q[2]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[30]_i_1 
       (.I0(Q[30]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[31]_i_1 
       (.I0(Q[31]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[3]_i_1 
       (.I0(Q[3]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[5]_i_1 
       (.I0(Q[5]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[7]_i_1 
       (.I0(Q[7]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \up_rdata_d[9]_i_1 
       (.I0(Q[9]),
        .I1(p_0_in6_in),
        .I2(\up_rcount_reg_n_0_[3] ),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[1] ),
        .I5(\up_rcount_reg_n_0_[0] ),
        .O(\up_rdata_d[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[0]_i_1_n_0 ),
        .Q(up_rdata_d[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[10]_i_1_n_0 ),
        .Q(up_rdata_d[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[11]_i_1_n_0 ),
        .Q(up_rdata_d[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[12]_i_1_n_0 ),
        .Q(up_rdata_d[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[13]),
        .Q(up_rdata_d[13]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[14]_i_1_n_0 ),
        .Q(up_rdata_d[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[15]_i_1_n_0 ),
        .Q(up_rdata_d[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[16]_i_1_n_0 ),
        .Q(up_rdata_d[16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[17]),
        .Q(up_rdata_d[17]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[18]_i_1_n_0 ),
        .Q(up_rdata_d[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[19]_i_1_n_0 ),
        .Q(up_rdata_d[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(up_rdata_d[1]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[20]),
        .Q(up_rdata_d[20]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[21]_i_1_n_0 ),
        .Q(up_rdata_d[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[22]),
        .Q(up_rdata_d[22]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[23]_i_1_n_0 ),
        .Q(up_rdata_d[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[24]),
        .Q(up_rdata_d[24]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[25]_i_1_n_0 ),
        .Q(up_rdata_d[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[26]_i_1_n_0 ),
        .Q(up_rdata_d[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[27]_i_1_n_0 ),
        .Q(up_rdata_d[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[28]_i_1_n_0 ),
        .Q(up_rdata_d[28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[29]),
        .Q(up_rdata_d[29]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[2]_i_1_n_0 ),
        .Q(up_rdata_d[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[30]_i_1_n_0 ),
        .Q(up_rdata_d[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[31]_i_1_n_0 ),
        .Q(up_rdata_d[31]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[3]_i_1_n_0 ),
        .Q(up_rdata_d[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(up_rdata_d[4]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[5]_i_1_n_0 ),
        .Q(up_rdata_d[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(up_rdata_d[6]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[7]_i_1_n_0 ),
        .Q(up_rdata_d[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q[8]),
        .Q(up_rdata_d[8]),
        .R(\up_rdata_d[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \up_rdata_d_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\up_rdata_d[9]_i_1_n_0 ),
        .Q(up_rdata_d[9]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hAAAAAAAAAA00BBF3)) 
    \up_rdata_s[0]_i_1 
       (.I0(data1[0]),
        .I1(\up_rdata_s[31]_i_6_n_0 ),
        .I2(\up_rdata_s_reg[31] [0]),
        .I3(\up_rdata_s[31]_i_4_n_0 ),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[0]_i_2 
       (.I0(sys_rom_data[0]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[0]),
        .O(data1[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[10]_i_1 
       (.I0(data1[10]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [10]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[10]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[10]_i_2 
       (.I0(sys_rom_data[10]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[10]),
        .O(data1[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[11]_i_1 
       (.I0(data1[11]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [11]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[11]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[11]_i_2 
       (.I0(sys_rom_data[11]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[11]),
        .O(data1[11]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[12]_i_1 
       (.I0(data1[12]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [12]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[12]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[12]_i_2 
       (.I0(sys_rom_data[12]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[12]),
        .O(data1[12]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[13]_i_1 
       (.I0(data1[13]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [13]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[13]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[13]_i_2 
       (.I0(sys_rom_data[13]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[13]),
        .O(data1[13]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[14]_i_1 
       (.I0(data1[14]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [14]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[14]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[14]_i_2 
       (.I0(sys_rom_data[14]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[14]),
        .O(data1[14]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[15]_i_1 
       (.I0(data1[15]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [15]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[15]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[15]_i_2 
       (.I0(sys_rom_data[15]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[15]),
        .O(data1[15]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAF83AC83)) 
    \up_rdata_s[16]_i_1 
       (.I0(data1[16]),
        .I1(\up_rdata_s[31]_i_5_n_0 ),
        .I2(\up_rdata_s[31]_i_4_n_0 ),
        .I3(\up_rdata_s[31]_i_6_n_0 ),
        .I4(\up_rdata_s_reg[31] [16]),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[16]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[16]_i_2 
       (.I0(sys_rom_data[16]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[16]),
        .O(data1[16]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[17]_i_1 
       (.I0(data1[17]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [17]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[17]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[17]_i_2 
       (.I0(sys_rom_data[17]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[17]),
        .O(data1[17]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[18]_i_1 
       (.I0(data1[18]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [18]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[18]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[18]_i_2 
       (.I0(sys_rom_data[18]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[18]),
        .O(data1[18]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[19]_i_1 
       (.I0(data1[19]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [19]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[19]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[19]_i_2 
       (.I0(sys_rom_data[19]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[19]),
        .O(data1[19]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[1]_i_1 
       (.I0(data1[1]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [1]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[1]_i_2 
       (.I0(sys_rom_data[1]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[1]),
        .O(data1[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[20]_i_1 
       (.I0(data1[20]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [20]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[20]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[20]_i_2 
       (.I0(sys_rom_data[20]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[20]),
        .O(data1[20]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[21]_i_1 
       (.I0(data1[21]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [21]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[21]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[21]_i_2 
       (.I0(sys_rom_data[21]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[21]),
        .O(data1[21]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[22]_i_1 
       (.I0(data1[22]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [22]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[22]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[22]_i_2 
       (.I0(sys_rom_data[22]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[22]),
        .O(data1[22]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[23]_i_1 
       (.I0(data1[23]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [23]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[23]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[23]_i_2 
       (.I0(sys_rom_data[23]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[23]),
        .O(data1[23]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[24]_i_1 
       (.I0(data1[24]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [24]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[24]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[24]_i_2 
       (.I0(sys_rom_data[24]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[24]),
        .O(data1[24]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[25]_i_1 
       (.I0(data1[25]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [25]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[25]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[25]_i_2 
       (.I0(sys_rom_data[25]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[25]),
        .O(data1[25]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[26]_i_1 
       (.I0(data1[26]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [26]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[26]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[26]_i_2 
       (.I0(sys_rom_data[26]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[26]),
        .O(data1[26]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[27]_i_1 
       (.I0(data1[27]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [27]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[27]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[27]_i_2 
       (.I0(sys_rom_data[27]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[27]),
        .O(data1[27]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[28]_i_1 
       (.I0(data1[28]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [28]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[28]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[28]_i_2 
       (.I0(sys_rom_data[28]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[28]),
        .O(data1[28]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[29]_i_1 
       (.I0(data1[29]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [29]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[29]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[29]_i_2 
       (.I0(sys_rom_data[29]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[29]),
        .O(data1[29]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[2]_i_1 
       (.I0(data1[2]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [2]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[2]_i_2 
       (.I0(sys_rom_data[2]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[2]),
        .O(data1[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8B080)) 
    \up_rdata_s[30]_i_1 
       (.I0(data1[30]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_6_n_0 ),
        .I3(\up_rdata_s_reg[31] [30]),
        .I4(\up_rdata_s[31]_i_5_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[30]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[30]_i_2 
       (.I0(sys_rom_data[30]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[30]),
        .O(data1[30]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[31]_i_2 
       (.I0(data1[31]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [31]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[31]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[31]_i_3 
       (.I0(sys_rom_data[31]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[31]),
        .O(data1[31]));
  LUT3 #(
    .INIT(8'hFE)) 
    \up_rdata_s[31]_i_4 
       (.I0(rom_addr[3]),
        .I1(rom_addr[2]),
        .I2(rom_addr[4]),
        .O(\up_rdata_s[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEEE)) 
    \up_rdata_s[31]_i_5 
       (.I0(rom_addr[2]),
        .I1(rom_addr[0]),
        .I2(rom_addr[1]),
        .I3(rom_addr[4]),
        .I4(rom_addr[3]),
        .O(\up_rdata_s[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \up_rdata_s[31]_i_6 
       (.I0(rom_addr[4]),
        .I1(rom_addr[3]),
        .I2(rom_addr[1]),
        .I3(rom_addr[2]),
        .O(\up_rdata_s[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_rdata_s[31]_i_7 
       (.I0(up_raddr_int[9]),
        .I1(up_raddr_int[10]),
        .I2(rom_addr[6]),
        .I3(rom_addr[5]),
        .I4(rom_addr[8]),
        .I5(rom_addr[7]),
        .O(\up_rdata_s[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888C8C)) 
    \up_rdata_s[3]_i_1 
       (.I0(data1[3]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [3]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[3]_i_2 
       (.I0(sys_rom_data[3]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[3]),
        .O(data1[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[4]_i_1 
       (.I0(data1[4]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [4]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[4]_i_2 
       (.I0(sys_rom_data[4]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[4]),
        .O(data1[4]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888383)) 
    \up_rdata_s[5]_i_1 
       (.I0(data1[5]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [5]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[5]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[5]_i_2 
       (.I0(sys_rom_data[5]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[5]),
        .O(data1[5]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAF83AC83)) 
    \up_rdata_s[6]_i_1 
       (.I0(data1[6]),
        .I1(\up_rdata_s[31]_i_5_n_0 ),
        .I2(\up_rdata_s[31]_i_4_n_0 ),
        .I3(\up_rdata_s[31]_i_6_n_0 ),
        .I4(\up_rdata_s_reg[31] [6]),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[6]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[6]_i_2 
       (.I0(sys_rom_data[6]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[6]),
        .O(data1[6]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[7]_i_1 
       (.I0(data1[7]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [7]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[7]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[7]_i_2 
       (.I0(sys_rom_data[7]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[7]),
        .O(data1[7]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAF83AC83)) 
    \up_rdata_s[8]_i_1 
       (.I0(data1[8]),
        .I1(\up_rdata_s[31]_i_5_n_0 ),
        .I2(\up_rdata_s[31]_i_4_n_0 ),
        .I3(\up_rdata_s[31]_i_6_n_0 ),
        .I4(\up_rdata_s_reg[31] [8]),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[8]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[8]_i_2 
       (.I0(sys_rom_data[8]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[8]),
        .O(data1[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAA8B888080)) 
    \up_rdata_s[9]_i_1 
       (.I0(data1[9]),
        .I1(\up_rdata_s[31]_i_4_n_0 ),
        .I2(\up_rdata_s[31]_i_5_n_0 ),
        .I3(\up_rdata_s_reg[31] [9]),
        .I4(\up_rdata_s[31]_i_6_n_0 ),
        .I5(\up_rdata_s[31]_i_7_n_0 ),
        .O(D[9]));
  LUT4 #(
    .INIT(16'h3808)) 
    \up_rdata_s[9]_i_2 
       (.I0(sys_rom_data[9]),
        .I1(up_raddr_int[9]),
        .I2(up_raddr_int[10]),
        .I3(pr_rom_data[9]),
        .O(data1[9]));
  LUT3 #(
    .INIT(8'h80)) 
    up_rreq_int_i_1
       (.I0(p_1_in_0),
        .I1(s_axi_arvalid),
        .I2(s_axi_aresetn),
        .O(up_rreq_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_rreq_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rreq_int_i_1_n_0),
        .Q(up_rreq_int),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h55C0)) 
    up_rsel_inv_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_rready),
        .I2(up_axi_rvalid_int_reg_0),
        .I3(p_1_in_0),
        .O(up_rsel_inv_i_1_n_0));
  (* inverted = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    up_rsel_reg_inv
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_rsel_inv_i_1_n_0),
        .Q(p_1_in_0),
        .S(p_0_in));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \up_scratch[31]_i_1 
       (.I0(up_waddr_s[4]),
        .I1(up_wreq_s),
        .I2(up_waddr_s[1]),
        .I3(up_waddr_s[10]),
        .I4(\up_scratch[31]_i_2_n_0 ),
        .I5(\up_scratch[31]_i_3_n_0 ),
        .O(E));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \up_scratch[31]_i_2 
       (.I0(up_waddr_s[7]),
        .I1(up_waddr_s[5]),
        .I2(up_waddr_s[8]),
        .I3(up_waddr_s[6]),
        .O(\up_scratch[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \up_scratch[31]_i_3 
       (.I0(up_waddr_s[9]),
        .I1(up_waddr_s[0]),
        .I2(up_waddr_s[3]),
        .I3(up_waddr_s[2]),
        .O(\up_scratch[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF000080000000)) 
    up_wack_d_i_1
       (.I0(\up_wcount_reg_n_0_[3] ),
        .I1(\up_wcount_reg_n_0_[2] ),
        .I2(\up_wcount_reg_n_0_[1] ),
        .I3(\up_wcount_reg_n_0_[0] ),
        .I4(p_0_in7_in),
        .I5(up_wack),
        .O(up_wack_s));
  FDRE #(
    .INIT(1'b0)) 
    up_wack_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wack_s),
        .Q(up_wack_d),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[0]),
        .Q(up_waddr_s[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[10]),
        .Q(up_waddr_s[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[1]),
        .Q(up_waddr_s[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[2]),
        .Q(up_waddr_s[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[3]),
        .Q(up_waddr_s[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[4]),
        .Q(up_waddr_s[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[5]),
        .Q(up_waddr_s[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[6]),
        .Q(up_waddr_s[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[7]),
        .Q(up_waddr_s[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[8]),
        .Q(up_waddr_s[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_waddr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_awaddr[9]),
        .Q(up_waddr_s[9]),
        .R(p_0_in));
  LUT3 #(
    .INIT(8'h04)) 
    \up_wcount[0]_i_1 
       (.I0(up_wack),
        .I1(p_0_in7_in),
        .I2(\up_wcount_reg_n_0_[0] ),
        .O(\up_wcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \up_wcount[1]_i_1 
       (.I0(up_wack),
        .I1(\up_wcount_reg_n_0_[0] ),
        .I2(\up_wcount_reg_n_0_[1] ),
        .I3(p_0_in7_in),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h14440000)) 
    \up_wcount[2]_i_1 
       (.I0(up_wack),
        .I1(\up_wcount_reg_n_0_[2] ),
        .I2(\up_wcount_reg_n_0_[1] ),
        .I3(\up_wcount_reg_n_0_[0] ),
        .I4(p_0_in7_in),
        .O(\up_wcount[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1444444400000000)) 
    \up_wcount[3]_i_1 
       (.I0(up_wack),
        .I1(\up_wcount_reg_n_0_[3] ),
        .I2(\up_wcount_reg_n_0_[0] ),
        .I3(\up_wcount_reg_n_0_[1] ),
        .I4(\up_wcount_reg_n_0_[2] ),
        .I5(p_0_in7_in),
        .O(p_2_in[3]));
  LUT2 #(
    .INIT(4'hE)) 
    \up_wcount[4]_i_1 
       (.I0(p_0_in7_in),
        .I1(up_wreq_s),
        .O(p_1_in));
  LUT6 #(
    .INIT(64'h3777777777777777)) 
    \up_wcount[4]_i_2 
       (.I0(up_wack),
        .I1(p_0_in7_in),
        .I2(\up_wcount_reg_n_0_[0] ),
        .I3(\up_wcount_reg_n_0_[1] ),
        .I4(\up_wcount_reg_n_0_[2] ),
        .I5(\up_wcount_reg_n_0_[3] ),
        .O(p_2_in[4]));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(\up_wcount[0]_i_1_n_0 ),
        .Q(\up_wcount_reg_n_0_[0] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(p_2_in[1]),
        .Q(\up_wcount_reg_n_0_[1] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(\up_wcount[2]_i_1_n_0 ),
        .Q(\up_wcount_reg_n_0_[2] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(p_2_in[3]),
        .Q(\up_wcount_reg_n_0_[3] ),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wcount_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in),
        .D(p_2_in[4]),
        .Q(p_0_in7_in),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[0]),
        .Q(\up_wdata_int_reg[31]_0 [0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[10]),
        .Q(\up_wdata_int_reg[31]_0 [10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[11]),
        .Q(\up_wdata_int_reg[31]_0 [11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[12]),
        .Q(\up_wdata_int_reg[31]_0 [12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[13]),
        .Q(\up_wdata_int_reg[31]_0 [13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[14]),
        .Q(\up_wdata_int_reg[31]_0 [14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[15]),
        .Q(\up_wdata_int_reg[31]_0 [15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[16]),
        .Q(\up_wdata_int_reg[31]_0 [16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[17]),
        .Q(\up_wdata_int_reg[31]_0 [17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[18]),
        .Q(\up_wdata_int_reg[31]_0 [18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[19]),
        .Q(\up_wdata_int_reg[31]_0 [19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[1]),
        .Q(\up_wdata_int_reg[31]_0 [1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[20]),
        .Q(\up_wdata_int_reg[31]_0 [20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[21]),
        .Q(\up_wdata_int_reg[31]_0 [21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[22]),
        .Q(\up_wdata_int_reg[31]_0 [22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[23]),
        .Q(\up_wdata_int_reg[31]_0 [23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[24]),
        .Q(\up_wdata_int_reg[31]_0 [24]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[25]),
        .Q(\up_wdata_int_reg[31]_0 [25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[26]),
        .Q(\up_wdata_int_reg[31]_0 [26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[27]),
        .Q(\up_wdata_int_reg[31]_0 [27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[28]),
        .Q(\up_wdata_int_reg[31]_0 [28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[29]),
        .Q(\up_wdata_int_reg[31]_0 [29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[2]),
        .Q(\up_wdata_int_reg[31]_0 [2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[30]),
        .Q(\up_wdata_int_reg[31]_0 [30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[31]),
        .Q(\up_wdata_int_reg[31]_0 [31]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[3]),
        .Q(\up_wdata_int_reg[31]_0 [3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[4]),
        .Q(\up_wdata_int_reg[31]_0 [4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[5]),
        .Q(\up_wdata_int_reg[31]_0 [5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[6]),
        .Q(\up_wdata_int_reg[31]_0 [6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[7]),
        .Q(\up_wdata_int_reg[31]_0 [7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[8]),
        .Q(\up_wdata_int_reg[31]_0 [8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \up_wdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .D(s_axi_wdata[9]),
        .Q(\up_wdata_int_reg[31]_0 [9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'h8000)) 
    up_wreq_int_i_1
       (.I0(p_5_in),
        .I1(s_axi_wvalid),
        .I2(s_axi_awvalid),
        .I3(s_axi_aresetn),
        .O(up_wreq_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_wreq_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(up_wreq_int_i_1_n_0),
        .Q(up_wreq_s),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h7777F000)) 
    up_wsel_inv_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_bready),
        .I3(s_axi_bvalid),
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
        .S(p_0_in));
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
