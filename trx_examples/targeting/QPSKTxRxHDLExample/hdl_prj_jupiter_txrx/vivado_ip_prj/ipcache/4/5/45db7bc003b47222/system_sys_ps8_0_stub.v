// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue May 26 19:02:44 2026
// Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_sys_ps8_0_stub.v
// Design      : system_sys_ps8_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfva625-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_sys_ps8_0,zynq_ultra_ps_e_v3_5_7_zynq_ultra_ps_e,{}" *) (* CORE_GENERATION_INFO = "system_sys_ps8_0,zynq_ultra_ps_e_v3_5_7_zynq_ultra_ps_e,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=zynq_ultra_ps_e,x_ipVersion=3.5,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_DP_USE_AUDIO=0,C_DP_USE_VIDEO=0,C_MAXIGP0_DATA_WIDTH=128,C_MAXIGP1_DATA_WIDTH=128,C_MAXIGP2_DATA_WIDTH=32,C_SAXIGP0_DATA_WIDTH=128,C_SAXIGP1_DATA_WIDTH=128,C_SAXIGP2_DATA_WIDTH=128,C_SAXIGP3_DATA_WIDTH=128,C_SAXIGP4_DATA_WIDTH=128,C_SAXIGP5_DATA_WIDTH=128,C_SAXIGP6_DATA_WIDTH=128,C_USE_DIFF_RW_CLK_GP0=0,C_USE_DIFF_RW_CLK_GP1=0,C_USE_DIFF_RW_CLK_GP2=0,C_USE_DIFF_RW_CLK_GP3=0,C_USE_DIFF_RW_CLK_GP4=0,C_USE_DIFF_RW_CLK_GP5=0,C_USE_DIFF_RW_CLK_GP6=0,C_EN_FIFO_ENET0=0,C_EN_FIFO_ENET1=0,C_EN_FIFO_ENET2=0,C_EN_FIFO_ENET3=0,C_PL_CLK0_BUF=TRUE,C_PL_CLK1_BUF=TRUE,C_PL_CLK2_BUF=TRUE,C_PL_CLK3_BUF=FALSE,C_TRACE_PIPELINE_WIDTH=8,C_EN_EMIO_TRACE=0,C_TRACE_DATA_WIDTH=32,C_USE_DEBUG_TEST=0,C_SD0_INTERNAL_BUS_WIDTH=5,C_SD1_INTERNAL_BUS_WIDTH=5,C_NUM_F2P_0_INTR_INPUTS=8,C_NUM_F2P_1_INTR_INPUTS=8,C_EMIO_GPIO_WIDTH=95,C_NUM_FABRIC_RESETS=1}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* X_CORE_INFO = "zynq_ultra_ps_e_v3_5_7_zynq_ultra_ps_e,Vivado 2025.1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(maxihpm0_lpd_aclk, maxigp2_awid, 
  maxigp2_awaddr, maxigp2_awlen, maxigp2_awsize, maxigp2_awburst, maxigp2_awlock, 
  maxigp2_awcache, maxigp2_awprot, maxigp2_awvalid, maxigp2_awuser, maxigp2_awready, 
  maxigp2_wdata, maxigp2_wstrb, maxigp2_wlast, maxigp2_wvalid, maxigp2_wready, maxigp2_bid, 
  maxigp2_bresp, maxigp2_bvalid, maxigp2_bready, maxigp2_arid, maxigp2_araddr, maxigp2_arlen, 
  maxigp2_arsize, maxigp2_arburst, maxigp2_arlock, maxigp2_arcache, maxigp2_arprot, 
  maxigp2_arvalid, maxigp2_aruser, maxigp2_arready, maxigp2_rid, maxigp2_rdata, 
  maxigp2_rresp, maxigp2_rlast, maxigp2_rvalid, maxigp2_rready, maxigp2_awqos, maxigp2_arqos, 
  saxihpc0_fpd_aclk, saxigp0_aruser, saxigp0_awuser, saxigp0_awid, saxigp0_awaddr, 
  saxigp0_awlen, saxigp0_awsize, saxigp0_awburst, saxigp0_awlock, saxigp0_awcache, 
  saxigp0_awprot, saxigp0_awvalid, saxigp0_awready, saxigp0_wdata, saxigp0_wstrb, 
  saxigp0_wlast, saxigp0_wvalid, saxigp0_wready, saxigp0_bid, saxigp0_bresp, saxigp0_bvalid, 
  saxigp0_bready, saxigp0_arid, saxigp0_araddr, saxigp0_arlen, saxigp0_arsize, 
  saxigp0_arburst, saxigp0_arlock, saxigp0_arcache, saxigp0_arprot, saxigp0_arvalid, 
  saxigp0_arready, saxigp0_rid, saxigp0_rdata, saxigp0_rresp, saxigp0_rlast, saxigp0_rvalid, 
  saxigp0_rready, saxigp0_awqos, saxigp0_arqos, emio_gpio_i, emio_gpio_o, emio_gpio_t, 
  emio_spi0_sclk_i, emio_spi0_sclk_o, emio_spi0_sclk_t, emio_spi0_m_i, emio_spi0_m_o, 
  emio_spi0_mo_t, emio_spi0_s_i, emio_spi0_s_o, emio_spi0_so_t, emio_spi0_ss_i_n, 
  emio_spi0_ss_o_n, emio_spi0_ss_n_t, pl_ps_irq0, pl_ps_irq1, pl_resetn0, pl_clk0, pl_clk1, 
  pl_clk2)
/* synthesis syn_black_box black_box_pad_pin="maxigp2_awid[15:0],maxigp2_awaddr[39:0],maxigp2_awlen[7:0],maxigp2_awsize[2:0],maxigp2_awburst[1:0],maxigp2_awlock,maxigp2_awcache[3:0],maxigp2_awprot[2:0],maxigp2_awvalid,maxigp2_awuser[15:0],maxigp2_awready,maxigp2_wdata[31:0],maxigp2_wstrb[3:0],maxigp2_wlast,maxigp2_wvalid,maxigp2_wready,maxigp2_bid[15:0],maxigp2_bresp[1:0],maxigp2_bvalid,maxigp2_bready,maxigp2_arid[15:0],maxigp2_araddr[39:0],maxigp2_arlen[7:0],maxigp2_arsize[2:0],maxigp2_arburst[1:0],maxigp2_arlock,maxigp2_arcache[3:0],maxigp2_arprot[2:0],maxigp2_arvalid,maxigp2_aruser[15:0],maxigp2_arready,maxigp2_rid[15:0],maxigp2_rdata[31:0],maxigp2_rresp[1:0],maxigp2_rlast,maxigp2_rvalid,maxigp2_rready,maxigp2_awqos[3:0],maxigp2_arqos[3:0],saxigp0_aruser,saxigp0_awuser,saxigp0_awid[5:0],saxigp0_awaddr[48:0],saxigp0_awlen[7:0],saxigp0_awsize[2:0],saxigp0_awburst[1:0],saxigp0_awlock,saxigp0_awcache[3:0],saxigp0_awprot[2:0],saxigp0_awvalid,saxigp0_awready,saxigp0_wdata[127:0],saxigp0_wstrb[15:0],saxigp0_wlast,saxigp0_wvalid,saxigp0_wready,saxigp0_bid[5:0],saxigp0_bresp[1:0],saxigp0_bvalid,saxigp0_bready,saxigp0_arid[5:0],saxigp0_araddr[48:0],saxigp0_arlen[7:0],saxigp0_arsize[2:0],saxigp0_arburst[1:0],saxigp0_arlock,saxigp0_arcache[3:0],saxigp0_arprot[2:0],saxigp0_arvalid,saxigp0_arready,saxigp0_rid[5:0],saxigp0_rdata[127:0],saxigp0_rresp[1:0],saxigp0_rlast,saxigp0_rvalid,saxigp0_rready,saxigp0_awqos[3:0],saxigp0_arqos[3:0],emio_gpio_i[94:0],emio_gpio_o[94:0],emio_gpio_t[94:0],emio_spi0_sclk_o,emio_spi0_sclk_t,emio_spi0_m_i,emio_spi0_m_o,emio_spi0_mo_t,emio_spi0_s_i,emio_spi0_s_o,emio_spi0_so_t,emio_spi0_ss_i_n,emio_spi0_ss_o_n,emio_spi0_ss_n_t,pl_ps_irq0[7:0],pl_ps_irq1[7:0],pl_resetn0" */
/* synthesis syn_force_seq_prim="maxihpm0_lpd_aclk" */
/* synthesis syn_force_seq_prim="saxihpc0_fpd_aclk" */
/* synthesis syn_force_seq_prim="emio_spi0_sclk_i" */
/* synthesis syn_force_seq_prim="pl_clk0" */
/* synthesis syn_force_seq_prim="pl_clk1" */
/* synthesis syn_force_seq_prim="pl_clk2" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M_AXI_HPM0_LPD_ACLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_HPM0_LPD_ACLK, ASSOCIATED_BUSIF M_AXI_HPM0_LPD, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *) input maxihpm0_lpd_aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_HPM0_LPD, NUM_WRITE_OUTSTANDING 8, NUM_READ_OUTSTANDING 8, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 99999001, ID_WIDTH 16, ADDR_WIDTH 40, AWUSER_WIDTH 16, ARUSER_WIDTH 16, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [15:0]maxigp2_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWADDR" *) output [39:0]maxigp2_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWLEN" *) output [7:0]maxigp2_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWSIZE" *) output [2:0]maxigp2_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWBURST" *) output [1:0]maxigp2_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWLOCK" *) output maxigp2_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWCACHE" *) output [3:0]maxigp2_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWPROT" *) output [2:0]maxigp2_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWVALID" *) output maxigp2_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWUSER" *) output [15:0]maxigp2_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWREADY" *) input maxigp2_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD WDATA" *) output [31:0]maxigp2_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD WSTRB" *) output [3:0]maxigp2_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD WLAST" *) output maxigp2_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD WVALID" *) output maxigp2_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD WREADY" *) input maxigp2_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD BID" *) input [15:0]maxigp2_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD BRESP" *) input [1:0]maxigp2_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD BVALID" *) input maxigp2_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD BREADY" *) output maxigp2_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARID" *) output [15:0]maxigp2_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARADDR" *) output [39:0]maxigp2_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARLEN" *) output [7:0]maxigp2_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARSIZE" *) output [2:0]maxigp2_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARBURST" *) output [1:0]maxigp2_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARLOCK" *) output maxigp2_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARCACHE" *) output [3:0]maxigp2_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARPROT" *) output [2:0]maxigp2_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARVALID" *) output maxigp2_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARUSER" *) output [15:0]maxigp2_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARREADY" *) input maxigp2_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RID" *) input [15:0]maxigp2_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RDATA" *) input [31:0]maxigp2_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RRESP" *) input [1:0]maxigp2_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RLAST" *) input maxigp2_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RVALID" *) input maxigp2_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD RREADY" *) output maxigp2_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD AWQOS" *) output [3:0]maxigp2_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_HPM0_LPD ARQOS" *) output [3:0]maxigp2_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_HPC0_FPD_ACLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_HPC0_FPD_ACLK, ASSOCIATED_BUSIF S_AXI_HPC0_FPD, FREQ_HZ 249997498, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, INSERT_VIP 0" *) input saxihpc0_fpd_aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARUSER" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_HPC0_FPD, NUM_WRITE_OUTSTANDING 16, NUM_READ_OUTSTANDING 16, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 249997498, ID_WIDTH 6, ADDR_WIDTH 49, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 8, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input saxigp0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWUSER" *) input saxigp0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWID" *) input [5:0]saxigp0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWADDR" *) input [48:0]saxigp0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWLEN" *) input [7:0]saxigp0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWSIZE" *) input [2:0]saxigp0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWBURST" *) input [1:0]saxigp0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWLOCK" *) input saxigp0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWCACHE" *) input [3:0]saxigp0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWPROT" *) input [2:0]saxigp0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWVALID" *) input saxigp0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWREADY" *) output saxigp0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD WDATA" *) input [127:0]saxigp0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD WSTRB" *) input [15:0]saxigp0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD WLAST" *) input saxigp0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD WVALID" *) input saxigp0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD WREADY" *) output saxigp0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD BID" *) output [5:0]saxigp0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD BRESP" *) output [1:0]saxigp0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD BVALID" *) output saxigp0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD BREADY" *) input saxigp0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARID" *) input [5:0]saxigp0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARADDR" *) input [48:0]saxigp0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARLEN" *) input [7:0]saxigp0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARSIZE" *) input [2:0]saxigp0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARBURST" *) input [1:0]saxigp0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARLOCK" *) input saxigp0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARCACHE" *) input [3:0]saxigp0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARPROT" *) input [2:0]saxigp0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARVALID" *) input saxigp0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARREADY" *) output saxigp0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RID" *) output [5:0]saxigp0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RDATA" *) output [127:0]saxigp0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RRESP" *) output [1:0]saxigp0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RLAST" *) output saxigp0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RVALID" *) output saxigp0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD RREADY" *) input saxigp0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD AWQOS" *) input [3:0]saxigp0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HPC0_FPD ARQOS" *) input [3:0]saxigp0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_0 TRI_I" *) (* X_INTERFACE_MODE = "master" *) input [94:0]emio_gpio_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_0 TRI_O" *) output [94:0]emio_gpio_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 GPIO_0 TRI_T" *) output [94:0]emio_gpio_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SCK_I" *) (* X_INTERFACE_MODE = "master" *) input emio_spi0_sclk_i /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SCK_O" *) output emio_spi0_sclk_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SCK_T" *) output emio_spi0_sclk_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO1_I" *) input emio_spi0_m_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO0_O" *) output emio_spi0_m_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO0_T" *) output emio_spi0_mo_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO0_I" *) input emio_spi0_s_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO1_O" *) output emio_spi0_s_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 IO1_T" *) output emio_spi0_so_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SS_I" *) input emio_spi0_ss_i_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SS_O" *) output emio_spi0_ss_o_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:spi:1.0 SPI_0 SS_T" *) output emio_spi0_ss_n_t;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 PL_PS_IRQ0 INTERRUPT" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_PS_IRQ0, SENSITIVITY LEVEL_HIGH, PortWidth 8" *) input [7:0]pl_ps_irq0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 PL_PS_IRQ1 INTERRUPT" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_PS_IRQ1, SENSITIVITY NULL:NULL:LEVEL_HIGH:LEVEL_HIGH:LEVEL_HIGH:LEVEL_HIGH:LEVEL_HIGH:NULL, PortWidth 8" *) input [7:0]pl_ps_irq1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 PL_RESETN0 RST" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_RESETN0, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output pl_resetn0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PL_CLK0 CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_CLK0, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0" *) output pl_clk0 /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PL_CLK1 CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_CLK1, FREQ_HZ 249997498, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk1, INSERT_VIP 0" *) output pl_clk1 /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PL_CLK2 CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PL_CLK2, FREQ_HZ 499994995, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk2, INSERT_VIP 0" *) output pl_clk2 /* synthesis syn_isclock = 1 */;
endmodule
