//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Tue May 26 18:58:24 2026
//Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=23,numReposBlks=23,numNonXlnxBlks=11,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (gpio_i,
    gpio_o,
    gpio_rx1_enable_in,
    gpio_rx2_enable_in,
    gpio_t,
    gpio_tx1_enable_in,
    gpio_tx2_enable_in,
    mcs_in,
    mcs_out,
    mcs_src,
    mssi_sync,
    ref_clk,
    rx1_dclk_in_n,
    rx1_dclk_in_p,
    rx1_enable,
    rx1_idata_in_n,
    rx1_idata_in_p,
    rx1_qdata_in_n,
    rx1_qdata_in_p,
    rx1_strobe_in_n,
    rx1_strobe_in_p,
    rx2_dclk_in_n,
    rx2_dclk_in_p,
    rx2_enable,
    rx2_idata_in_n,
    rx2_idata_in_p,
    rx2_qdata_in_n,
    rx2_qdata_in_p,
    rx2_strobe_in_n,
    rx2_strobe_in_p,
    s_0v85_mgtravcc_sns_n,
    s_0v85_mgtravcc_sns_p,
    s_1p0_rf_sns_n,
    s_1p0_rf_sns_p,
    s_1p3_rf_sns_n,
    s_1p3_rf_sns_p,
    s_1p8_rf_sns_n,
    s_1p8_rf_sns_p,
    s_1v2_ps_ddr4_sns_n,
    s_1v2_ps_ddr4_sns_p,
    s_1v2_sns_n,
    s_1v2_sns_p,
    s_1v8_mgtravtt_sns_n,
    s_1v8_mgtravtt_sns_p,
    s_2v5_sns_n,
    s_2v5_sns_p,
    s_5v0_rf_sns_n,
    s_5v0_rf_sns_p,
    s_5v0_sns_n,
    s_5v0_sns_p,
    s_vtt_ps_ddr4_sns_n,
    s_vtt_ps_ddr4_sns_p,
    spi0_csn,
    spi0_miso,
    spi0_mosi,
    spi0_sclk,
    tx1_dclk_in_n,
    tx1_dclk_in_p,
    tx1_dclk_out_n,
    tx1_dclk_out_p,
    tx1_enable,
    tx1_idata_out_n,
    tx1_idata_out_p,
    tx1_qdata_out_n,
    tx1_qdata_out_p,
    tx1_strobe_out_n,
    tx1_strobe_out_p,
    tx2_dclk_in_n,
    tx2_dclk_in_p,
    tx2_dclk_out_n,
    tx2_dclk_out_p,
    tx2_enable,
    tx2_idata_out_n,
    tx2_idata_out_p,
    tx2_qdata_out_n,
    tx2_qdata_out_p,
    tx2_strobe_out_n,
    tx2_strobe_out_p,
    tx_output_enable);
  input [94:0]gpio_i;
  output [94:0]gpio_o;
  input gpio_rx1_enable_in;
  input gpio_rx2_enable_in;
  output [94:0]gpio_t;
  input gpio_tx1_enable_in;
  input gpio_tx2_enable_in;
  input mcs_in;
  output mcs_out;
  output mcs_src;
  input mssi_sync;
  input ref_clk;
  input rx1_dclk_in_n;
  input rx1_dclk_in_p;
  output rx1_enable;
  input rx1_idata_in_n;
  input rx1_idata_in_p;
  input rx1_qdata_in_n;
  input rx1_qdata_in_p;
  input rx1_strobe_in_n;
  input rx1_strobe_in_p;
  input rx2_dclk_in_n;
  input rx2_dclk_in_p;
  output rx2_enable;
  input rx2_idata_in_n;
  input rx2_idata_in_p;
  input rx2_qdata_in_n;
  input rx2_qdata_in_p;
  input rx2_strobe_in_n;
  input rx2_strobe_in_p;
  input s_0v85_mgtravcc_sns_n;
  input s_0v85_mgtravcc_sns_p;
  input s_1p0_rf_sns_n;
  input s_1p0_rf_sns_p;
  input s_1p3_rf_sns_n;
  input s_1p3_rf_sns_p;
  input s_1p8_rf_sns_n;
  input s_1p8_rf_sns_p;
  input s_1v2_ps_ddr4_sns_n;
  input s_1v2_ps_ddr4_sns_p;
  input s_1v2_sns_n;
  input s_1v2_sns_p;
  input s_1v8_mgtravtt_sns_n;
  input s_1v8_mgtravtt_sns_p;
  input s_2v5_sns_n;
  input s_2v5_sns_p;
  input s_5v0_rf_sns_n;
  input s_5v0_rf_sns_p;
  input s_5v0_sns_n;
  input s_5v0_sns_p;
  input s_vtt_ps_ddr4_sns_n;
  input s_vtt_ps_ddr4_sns_p;
  output spi0_csn;
  input spi0_miso;
  output spi0_mosi;
  output spi0_sclk;
  input tx1_dclk_in_n;
  input tx1_dclk_in_p;
  output tx1_dclk_out_n;
  output tx1_dclk_out_p;
  output tx1_enable;
  output tx1_idata_out_n;
  output tx1_idata_out_p;
  output tx1_qdata_out_n;
  output tx1_qdata_out_p;
  output tx1_strobe_out_n;
  output tx1_strobe_out_p;
  input tx2_dclk_in_n;
  input tx2_dclk_in_p;
  output tx2_dclk_out_n;
  output tx2_dclk_out_p;
  output tx2_enable;
  output tx2_idata_out_n;
  output tx2_idata_out_p;
  output tx2_qdata_out_n;
  output tx2_qdata_out_p;
  output tx2_strobe_out_n;
  output tx2_strobe_out_p;
  input tx_output_enable;

  wire [15:0]GND_16_dout;
  wire [0:0]GND_1_dout;
  wire [0:0]VCC_1_dout;
  wire axi_adrv9001_adc_1_clk;
  wire [15:0]axi_adrv9001_adc_1_data_i0;
  wire [15:0]axi_adrv9001_adc_1_data_i1;
  wire [15:0]axi_adrv9001_adc_1_data_q0;
  wire [15:0]axi_adrv9001_adc_1_data_q1;
  wire axi_adrv9001_adc_1_enable_i0;
  wire axi_adrv9001_adc_1_enable_i1;
  wire axi_adrv9001_adc_1_enable_q0;
  wire axi_adrv9001_adc_1_enable_q1;
  wire axi_adrv9001_adc_1_rst;
  wire axi_adrv9001_adc_1_start_sync;
  wire axi_adrv9001_adc_1_valid_i0;
  wire axi_adrv9001_adc_2_clk;
  wire [15:0]axi_adrv9001_adc_2_data_i0;
  wire [15:0]axi_adrv9001_adc_2_data_q0;
  wire axi_adrv9001_adc_2_enable_i0;
  wire axi_adrv9001_adc_2_enable_q0;
  wire axi_adrv9001_adc_2_rst;
  wire axi_adrv9001_adc_2_start_sync;
  wire axi_adrv9001_adc_2_valid_i0;
  wire axi_adrv9001_dac_1_clk;
  wire axi_adrv9001_dac_1_enable_i0;
  wire axi_adrv9001_dac_1_enable_i1;
  wire axi_adrv9001_dac_1_enable_q0;
  wire axi_adrv9001_dac_1_enable_q1;
  wire axi_adrv9001_dac_1_rst;
  wire axi_adrv9001_dac_1_valid_i0;
  wire axi_adrv9001_dac_2_clk;
  wire axi_adrv9001_dac_2_enable_i0;
  wire axi_adrv9001_dac_2_enable_q0;
  wire axi_adrv9001_dac_2_rst;
  wire axi_adrv9001_dac_2_valid_i0;
  wire axi_adrv9001_rx1_dma_irq;
  wire [30:0]axi_adrv9001_rx1_dma_m_dest_axi_AWADDR;
  wire [1:0]axi_adrv9001_rx1_dma_m_dest_axi_AWBURST;
  wire [3:0]axi_adrv9001_rx1_dma_m_dest_axi_AWCACHE;
  wire [7:0]axi_adrv9001_rx1_dma_m_dest_axi_AWLEN;
  wire [2:0]axi_adrv9001_rx1_dma_m_dest_axi_AWPROT;
  wire axi_adrv9001_rx1_dma_m_dest_axi_AWREADY;
  wire [2:0]axi_adrv9001_rx1_dma_m_dest_axi_AWSIZE;
  wire axi_adrv9001_rx1_dma_m_dest_axi_AWVALID;
  wire axi_adrv9001_rx1_dma_m_dest_axi_BREADY;
  wire [1:0]axi_adrv9001_rx1_dma_m_dest_axi_BRESP;
  wire axi_adrv9001_rx1_dma_m_dest_axi_BVALID;
  wire [63:0]axi_adrv9001_rx1_dma_m_dest_axi_WDATA;
  wire axi_adrv9001_rx1_dma_m_dest_axi_WLAST;
  wire axi_adrv9001_rx1_dma_m_dest_axi_WREADY;
  wire [7:0]axi_adrv9001_rx1_dma_m_dest_axi_WSTRB;
  wire axi_adrv9001_rx1_dma_m_dest_axi_WVALID;
  wire axi_adrv9001_rx2_dma_irq;
  wire [30:0]axi_adrv9001_rx2_dma_m_dest_axi_AWADDR;
  wire [1:0]axi_adrv9001_rx2_dma_m_dest_axi_AWBURST;
  wire [3:0]axi_adrv9001_rx2_dma_m_dest_axi_AWCACHE;
  wire [7:0]axi_adrv9001_rx2_dma_m_dest_axi_AWLEN;
  wire [2:0]axi_adrv9001_rx2_dma_m_dest_axi_AWPROT;
  wire axi_adrv9001_rx2_dma_m_dest_axi_AWREADY;
  wire [2:0]axi_adrv9001_rx2_dma_m_dest_axi_AWSIZE;
  wire axi_adrv9001_rx2_dma_m_dest_axi_AWVALID;
  wire axi_adrv9001_rx2_dma_m_dest_axi_BREADY;
  wire [1:0]axi_adrv9001_rx2_dma_m_dest_axi_BRESP;
  wire axi_adrv9001_rx2_dma_m_dest_axi_BVALID;
  wire [63:0]axi_adrv9001_rx2_dma_m_dest_axi_WDATA;
  wire axi_adrv9001_rx2_dma_m_dest_axi_WLAST;
  wire axi_adrv9001_rx2_dma_m_dest_axi_WREADY;
  wire [7:0]axi_adrv9001_rx2_dma_m_dest_axi_WSTRB;
  wire axi_adrv9001_rx2_dma_m_dest_axi_WVALID;
  wire axi_adrv9001_tx1_dma_irq;
  wire [63:0]axi_adrv9001_tx1_dma_m_axis_TDATA;
  wire axi_adrv9001_tx1_dma_m_axis_TREADY;
  wire axi_adrv9001_tx1_dma_m_axis_TVALID;
  wire [30:0]axi_adrv9001_tx1_dma_m_src_axi_ARADDR;
  wire [1:0]axi_adrv9001_tx1_dma_m_src_axi_ARBURST;
  wire [3:0]axi_adrv9001_tx1_dma_m_src_axi_ARCACHE;
  wire [7:0]axi_adrv9001_tx1_dma_m_src_axi_ARLEN;
  wire [2:0]axi_adrv9001_tx1_dma_m_src_axi_ARPROT;
  wire axi_adrv9001_tx1_dma_m_src_axi_ARREADY;
  wire [2:0]axi_adrv9001_tx1_dma_m_src_axi_ARSIZE;
  wire axi_adrv9001_tx1_dma_m_src_axi_ARVALID;
  wire [63:0]axi_adrv9001_tx1_dma_m_src_axi_RDATA;
  wire axi_adrv9001_tx1_dma_m_src_axi_RLAST;
  wire axi_adrv9001_tx1_dma_m_src_axi_RREADY;
  wire [1:0]axi_adrv9001_tx1_dma_m_src_axi_RRESP;
  wire axi_adrv9001_tx1_dma_m_src_axi_RVALID;
  wire axi_adrv9001_tx2_dma_irq;
  wire [31:0]axi_adrv9001_tx2_dma_m_axis_TDATA;
  wire axi_adrv9001_tx2_dma_m_axis_TREADY;
  wire axi_adrv9001_tx2_dma_m_axis_TVALID;
  wire [30:0]axi_adrv9001_tx2_dma_m_src_axi_ARADDR;
  wire [1:0]axi_adrv9001_tx2_dma_m_src_axi_ARBURST;
  wire [3:0]axi_adrv9001_tx2_dma_m_src_axi_ARCACHE;
  wire [7:0]axi_adrv9001_tx2_dma_m_src_axi_ARLEN;
  wire [2:0]axi_adrv9001_tx2_dma_m_src_axi_ARPROT;
  wire axi_adrv9001_tx2_dma_m_src_axi_ARREADY;
  wire [2:0]axi_adrv9001_tx2_dma_m_src_axi_ARSIZE;
  wire axi_adrv9001_tx2_dma_m_src_axi_ARVALID;
  wire [63:0]axi_adrv9001_tx2_dma_m_src_axi_RDATA;
  wire axi_adrv9001_tx2_dma_m_src_axi_RLAST;
  wire axi_adrv9001_tx2_dma_m_src_axi_RREADY;
  wire [1:0]axi_adrv9001_tx2_dma_m_src_axi_RRESP;
  wire axi_adrv9001_tx2_dma_m_src_axi_RVALID;
  wire [48:0]axi_hpc0_interconnect_M00_AXI_ARADDR;
  wire [1:0]axi_hpc0_interconnect_M00_AXI_ARBURST;
  wire [3:0]axi_hpc0_interconnect_M00_AXI_ARCACHE;
  wire [7:0]axi_hpc0_interconnect_M00_AXI_ARLEN;
  wire [0:0]axi_hpc0_interconnect_M00_AXI_ARLOCK;
  wire [2:0]axi_hpc0_interconnect_M00_AXI_ARPROT;
  wire [3:0]axi_hpc0_interconnect_M00_AXI_ARQOS;
  wire axi_hpc0_interconnect_M00_AXI_ARREADY;
  wire [2:0]axi_hpc0_interconnect_M00_AXI_ARSIZE;
  wire axi_hpc0_interconnect_M00_AXI_ARVALID;
  wire [48:0]axi_hpc0_interconnect_M00_AXI_AWADDR;
  wire [1:0]axi_hpc0_interconnect_M00_AXI_AWBURST;
  wire [3:0]axi_hpc0_interconnect_M00_AXI_AWCACHE;
  wire [7:0]axi_hpc0_interconnect_M00_AXI_AWLEN;
  wire [0:0]axi_hpc0_interconnect_M00_AXI_AWLOCK;
  wire [2:0]axi_hpc0_interconnect_M00_AXI_AWPROT;
  wire [3:0]axi_hpc0_interconnect_M00_AXI_AWQOS;
  wire axi_hpc0_interconnect_M00_AXI_AWREADY;
  wire [2:0]axi_hpc0_interconnect_M00_AXI_AWSIZE;
  wire axi_hpc0_interconnect_M00_AXI_AWVALID;
  wire axi_hpc0_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_hpc0_interconnect_M00_AXI_BRESP;
  wire axi_hpc0_interconnect_M00_AXI_BVALID;
  wire [127:0]axi_hpc0_interconnect_M00_AXI_RDATA;
  wire axi_hpc0_interconnect_M00_AXI_RLAST;
  wire axi_hpc0_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_hpc0_interconnect_M00_AXI_RRESP;
  wire axi_hpc0_interconnect_M00_AXI_RVALID;
  wire [127:0]axi_hpc0_interconnect_M00_AXI_WDATA;
  wire axi_hpc0_interconnect_M00_AXI_WLAST;
  wire axi_hpc0_interconnect_M00_AXI_WREADY;
  wire [15:0]axi_hpc0_interconnect_M00_AXI_WSTRB;
  wire axi_hpc0_interconnect_M00_AXI_WVALID;
  wire [15:0]axi_hpm0_lpd_interconnect_M00_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M00_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M00_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M00_AXI_ARVALID;
  wire [15:0]axi_hpm0_lpd_interconnect_M00_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M00_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M00_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M00_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M00_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M00_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M00_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M00_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M00_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M00_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M00_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M00_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M00_AXI_WVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M01_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M01_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M01_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M01_AXI_ARVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M01_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M01_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M01_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M01_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M01_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M01_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M01_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M01_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M01_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M01_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M01_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M01_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M01_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M01_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M01_AXI_WVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M02_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M02_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M02_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M02_AXI_ARVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M02_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M02_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M02_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M02_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M02_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M02_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M02_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M02_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M02_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M02_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M02_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M02_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M02_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M02_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M02_AXI_WVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M03_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M03_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M03_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M03_AXI_ARVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M03_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M03_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M03_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M03_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M03_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M03_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M03_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M03_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M03_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M03_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M03_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M03_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M03_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M03_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M03_AXI_WVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M04_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M04_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M04_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M04_AXI_ARVALID;
  wire [10:0]axi_hpm0_lpd_interconnect_M04_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M04_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M04_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M04_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M04_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M04_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M04_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M04_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M04_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M04_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M04_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M04_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M04_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M04_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M04_AXI_WVALID;
  wire [15:0]axi_hpm0_lpd_interconnect_M05_AXI_ARADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M05_AXI_ARPROT;
  wire axi_hpm0_lpd_interconnect_M05_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M05_AXI_ARVALID;
  wire [15:0]axi_hpm0_lpd_interconnect_M05_AXI_AWADDR;
  wire [2:0]axi_hpm0_lpd_interconnect_M05_AXI_AWPROT;
  wire axi_hpm0_lpd_interconnect_M05_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M05_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M05_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M05_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M05_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M05_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M05_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M05_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M05_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M05_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M05_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M05_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M05_AXI_WVALID;
  wire [12:0]axi_hpm0_lpd_interconnect_M06_AXI_ARADDR;
  wire axi_hpm0_lpd_interconnect_M06_AXI_ARREADY;
  wire axi_hpm0_lpd_interconnect_M06_AXI_ARVALID;
  wire [12:0]axi_hpm0_lpd_interconnect_M06_AXI_AWADDR;
  wire axi_hpm0_lpd_interconnect_M06_AXI_AWREADY;
  wire axi_hpm0_lpd_interconnect_M06_AXI_AWVALID;
  wire axi_hpm0_lpd_interconnect_M06_AXI_BREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M06_AXI_BRESP;
  wire axi_hpm0_lpd_interconnect_M06_AXI_BVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M06_AXI_RDATA;
  wire axi_hpm0_lpd_interconnect_M06_AXI_RREADY;
  wire [1:0]axi_hpm0_lpd_interconnect_M06_AXI_RRESP;
  wire axi_hpm0_lpd_interconnect_M06_AXI_RVALID;
  wire [31:0]axi_hpm0_lpd_interconnect_M06_AXI_WDATA;
  wire axi_hpm0_lpd_interconnect_M06_AXI_WREADY;
  wire [3:0]axi_hpm0_lpd_interconnect_M06_AXI_WSTRB;
  wire axi_hpm0_lpd_interconnect_M06_AXI_WVALID;
  wire [8:0]axi_sysid_0_rom_addr;
  wire [94:0]gpio_i;
  wire [94:0]gpio_o;
  wire gpio_rx1_enable_in;
  wire gpio_rx2_enable_in;
  wire [94:0]gpio_t;
  wire gpio_tx1_enable_in;
  wire gpio_tx2_enable_in;
  wire mcs_in;
  wire mcs_out;
  wire mcs_src;
  wire mssi_sync;
  wire pl_sysmon_ip2intc_irpt;
  wire ref_clk;
  wire [31:0]rom_sys_0_rom_data;
  wire rx1_dclk_in_n;
  wire rx1_dclk_in_p;
  wire rx1_enable;
  wire rx1_idata_in_n;
  wire rx1_idata_in_p;
  wire rx1_qdata_in_n;
  wire rx1_qdata_in_p;
  wire rx1_strobe_in_n;
  wire rx1_strobe_in_p;
  wire rx2_dclk_in_n;
  wire rx2_dclk_in_p;
  wire rx2_enable;
  wire rx2_idata_in_n;
  wire rx2_idata_in_p;
  wire rx2_qdata_in_n;
  wire rx2_qdata_in_p;
  wire rx2_strobe_in_n;
  wire rx2_strobe_in_p;
  wire s_0v85_mgtravcc_sns_n;
  wire s_0v85_mgtravcc_sns_p;
  wire s_1p0_rf_sns_n;
  wire s_1p0_rf_sns_p;
  wire s_1p3_rf_sns_n;
  wire s_1p3_rf_sns_p;
  wire s_1p8_rf_sns_n;
  wire s_1p8_rf_sns_p;
  wire s_1v2_ps_ddr4_sns_n;
  wire s_1v2_ps_ddr4_sns_p;
  wire s_1v2_sns_n;
  wire s_1v2_sns_p;
  wire s_1v8_mgtravtt_sns_n;
  wire s_1v8_mgtravtt_sns_p;
  wire s_2v5_sns_n;
  wire s_2v5_sns_p;
  wire s_5v0_rf_sns_n;
  wire s_5v0_rf_sns_p;
  wire s_5v0_sns_n;
  wire s_5v0_sns_p;
  wire s_vtt_ps_ddr4_sns_n;
  wire s_vtt_ps_ddr4_sns_p;
  wire spi0_csn;
  wire spi0_miso;
  wire spi0_mosi;
  wire spi0_sclk;
  wire sys_250m_clk;
  wire [0:0]sys_250m_reset;
  wire [0:0]sys_250m_resetn;
  wire sys_500m_clk;
  wire [0:0]sys_500m_reset;
  wire [0:0]sys_500m_resetn;
  wire [7:0]sys_concat_intc_0_dout;
  wire [7:0]sys_concat_intc_1_dout;
  wire sys_cpu_clk;
  wire [0:0]sys_cpu_reset;
  wire [0:0]sys_cpu_resetn;
  wire [39:0]sys_ps8_M_AXI_HPM0_LPD_ARADDR;
  wire [1:0]sys_ps8_M_AXI_HPM0_LPD_ARBURST;
  wire [3:0]sys_ps8_M_AXI_HPM0_LPD_ARCACHE;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_ARID;
  wire [7:0]sys_ps8_M_AXI_HPM0_LPD_ARLEN;
  wire sys_ps8_M_AXI_HPM0_LPD_ARLOCK;
  wire [2:0]sys_ps8_M_AXI_HPM0_LPD_ARPROT;
  wire [3:0]sys_ps8_M_AXI_HPM0_LPD_ARQOS;
  wire sys_ps8_M_AXI_HPM0_LPD_ARREADY;
  wire [2:0]sys_ps8_M_AXI_HPM0_LPD_ARSIZE;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_ARUSER;
  wire sys_ps8_M_AXI_HPM0_LPD_ARVALID;
  wire [39:0]sys_ps8_M_AXI_HPM0_LPD_AWADDR;
  wire [1:0]sys_ps8_M_AXI_HPM0_LPD_AWBURST;
  wire [3:0]sys_ps8_M_AXI_HPM0_LPD_AWCACHE;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_AWID;
  wire [7:0]sys_ps8_M_AXI_HPM0_LPD_AWLEN;
  wire sys_ps8_M_AXI_HPM0_LPD_AWLOCK;
  wire [2:0]sys_ps8_M_AXI_HPM0_LPD_AWPROT;
  wire [3:0]sys_ps8_M_AXI_HPM0_LPD_AWQOS;
  wire sys_ps8_M_AXI_HPM0_LPD_AWREADY;
  wire [2:0]sys_ps8_M_AXI_HPM0_LPD_AWSIZE;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_AWUSER;
  wire sys_ps8_M_AXI_HPM0_LPD_AWVALID;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_BID;
  wire sys_ps8_M_AXI_HPM0_LPD_BREADY;
  wire [1:0]sys_ps8_M_AXI_HPM0_LPD_BRESP;
  wire sys_ps8_M_AXI_HPM0_LPD_BVALID;
  wire [31:0]sys_ps8_M_AXI_HPM0_LPD_RDATA;
  wire [15:0]sys_ps8_M_AXI_HPM0_LPD_RID;
  wire sys_ps8_M_AXI_HPM0_LPD_RLAST;
  wire sys_ps8_M_AXI_HPM0_LPD_RREADY;
  wire [1:0]sys_ps8_M_AXI_HPM0_LPD_RRESP;
  wire sys_ps8_M_AXI_HPM0_LPD_RVALID;
  wire [31:0]sys_ps8_M_AXI_HPM0_LPD_WDATA;
  wire sys_ps8_M_AXI_HPM0_LPD_WLAST;
  wire sys_ps8_M_AXI_HPM0_LPD_WREADY;
  wire [3:0]sys_ps8_M_AXI_HPM0_LPD_WSTRB;
  wire sys_ps8_M_AXI_HPM0_LPD_WVALID;
  wire sys_ps8_pl_resetn0;
  wire tx1_dclk_in_n;
  wire tx1_dclk_in_p;
  wire tx1_dclk_out_n;
  wire tx1_dclk_out_p;
  wire tx1_enable;
  wire tx1_idata_out_n;
  wire tx1_idata_out_p;
  wire tx1_qdata_out_n;
  wire tx1_qdata_out_p;
  wire tx1_strobe_out_n;
  wire tx1_strobe_out_p;
  wire tx2_dclk_in_n;
  wire tx2_dclk_in_p;
  wire tx2_dclk_out_n;
  wire tx2_dclk_out_p;
  wire tx2_enable;
  wire tx2_idata_out_n;
  wire tx2_idata_out_p;
  wire tx2_qdata_out_n;
  wire tx2_qdata_out_p;
  wire tx2_strobe_out_n;
  wire tx2_strobe_out_p;
  wire tx_output_enable;
  wire util_adc_1_pack_fifo_wr_overflow;
  wire [63:0]util_adc_1_pack_packed_fifo_wr_DATA;
  wire util_adc_1_pack_packed_fifo_wr_EN;
  wire util_adc_1_pack_packed_fifo_wr_OVERFLOW;
  wire util_adc_2_pack_fifo_wr_overflow;
  wire [63:0]util_adc_2_pack_packed_fifo_wr_DATA;
  wire util_adc_2_pack_packed_fifo_wr_EN;
  wire util_adc_2_pack_packed_fifo_wr_OVERFLOW;
  wire [15:0]util_dac_1_upack_fifo_rd_data_0;
  wire [15:0]util_dac_1_upack_fifo_rd_data_1;
  wire [15:0]util_dac_1_upack_fifo_rd_data_2;
  wire [15:0]util_dac_1_upack_fifo_rd_data_3;
  wire util_dac_1_upack_fifo_rd_underflow;
  wire [15:0]util_dac_2_upack_fifo_rd_data_0;
  wire [15:0]util_dac_2_upack_fifo_rd_data_1;
  wire util_dac_2_upack_fifo_rd_underflow;

  assign GND_1_dout = 1'h0;
  assign GND_16_dout = 16'h0000;
  assign VCC_1_dout = 1'h1;
  system_axi_adrv9001_0 axi_adrv9001
       (.adc_1_clk(axi_adrv9001_adc_1_clk),
        .adc_1_data_i0(axi_adrv9001_adc_1_data_i0),
        .adc_1_data_i1(axi_adrv9001_adc_1_data_i1),
        .adc_1_data_q0(axi_adrv9001_adc_1_data_q0),
        .adc_1_data_q1(axi_adrv9001_adc_1_data_q1),
        .adc_1_dovf(util_adc_1_pack_fifo_wr_overflow),
        .adc_1_enable_i0(axi_adrv9001_adc_1_enable_i0),
        .adc_1_enable_i1(axi_adrv9001_adc_1_enable_i1),
        .adc_1_enable_q0(axi_adrv9001_adc_1_enable_q0),
        .adc_1_enable_q1(axi_adrv9001_adc_1_enable_q1),
        .adc_1_rst(axi_adrv9001_adc_1_rst),
        .adc_1_start_sync(axi_adrv9001_adc_1_start_sync),
        .adc_1_valid_i0(axi_adrv9001_adc_1_valid_i0),
        .adc_2_clk(axi_adrv9001_adc_2_clk),
        .adc_2_data_i0(axi_adrv9001_adc_2_data_i0),
        .adc_2_data_q0(axi_adrv9001_adc_2_data_q0),
        .adc_2_dovf(util_adc_2_pack_fifo_wr_overflow),
        .adc_2_enable_i0(axi_adrv9001_adc_2_enable_i0),
        .adc_2_enable_q0(axi_adrv9001_adc_2_enable_q0),
        .adc_2_rst(axi_adrv9001_adc_2_rst),
        .adc_2_start_sync(axi_adrv9001_adc_2_start_sync),
        .adc_2_valid_i0(axi_adrv9001_adc_2_valid_i0),
        .dac_1_clk(axi_adrv9001_dac_1_clk),
        .dac_1_data_i0(util_dac_1_upack_fifo_rd_data_0),
        .dac_1_data_i1(util_dac_1_upack_fifo_rd_data_2),
        .dac_1_data_q0(util_dac_1_upack_fifo_rd_data_1),
        .dac_1_data_q1(util_dac_1_upack_fifo_rd_data_3),
        .dac_1_dunf(util_dac_1_upack_fifo_rd_underflow),
        .dac_1_enable_i0(axi_adrv9001_dac_1_enable_i0),
        .dac_1_enable_i1(axi_adrv9001_dac_1_enable_i1),
        .dac_1_enable_q0(axi_adrv9001_dac_1_enable_q0),
        .dac_1_enable_q1(axi_adrv9001_dac_1_enable_q1),
        .dac_1_rst(axi_adrv9001_dac_1_rst),
        .dac_1_valid_i0(axi_adrv9001_dac_1_valid_i0),
        .dac_2_clk(axi_adrv9001_dac_2_clk),
        .dac_2_data_i0(util_dac_2_upack_fifo_rd_data_0),
        .dac_2_data_q0(util_dac_2_upack_fifo_rd_data_1),
        .dac_2_dunf(util_dac_2_upack_fifo_rd_underflow),
        .dac_2_enable_i0(axi_adrv9001_dac_2_enable_i0),
        .dac_2_enable_q0(axi_adrv9001_dac_2_enable_q0),
        .dac_2_rst(axi_adrv9001_dac_2_rst),
        .dac_2_valid_i0(axi_adrv9001_dac_2_valid_i0),
        .delay_clk(sys_500m_clk),
        .gpio_rx1_enable_in(gpio_rx1_enable_in),
        .gpio_rx2_enable_in(gpio_rx2_enable_in),
        .gpio_tx1_enable_in(gpio_tx1_enable_in),
        .gpio_tx2_enable_in(gpio_tx2_enable_in),
        .mcs_in(mcs_in),
        .mcs_out(mcs_out),
        .mcs_src(mcs_src),
        .mssi_sync_in(mssi_sync),
        .ref_clk(ref_clk),
        .rx1_dclk_in_n_NC(rx1_dclk_in_n),
        .rx1_dclk_in_p_dclk_in(rx1_dclk_in_p),
        .rx1_enable(rx1_enable),
        .rx1_idata_in_n_idata0(rx1_idata_in_n),
        .rx1_idata_in_p_idata1(rx1_idata_in_p),
        .rx1_qdata_in_n_qdata2(rx1_qdata_in_n),
        .rx1_qdata_in_p_qdata3(rx1_qdata_in_p),
        .rx1_strobe_in_n_NC(rx1_strobe_in_n),
        .rx1_strobe_in_p_strobe_in(rx1_strobe_in_p),
        .rx2_dclk_in_n_NC(rx2_dclk_in_n),
        .rx2_dclk_in_p_dclk_in(rx2_dclk_in_p),
        .rx2_enable(rx2_enable),
        .rx2_idata_in_n_idata0(rx2_idata_in_n),
        .rx2_idata_in_p_idata1(rx2_idata_in_p),
        .rx2_qdata_in_n_qdata2(rx2_qdata_in_n),
        .rx2_qdata_in_p_qdata3(rx2_qdata_in_p),
        .rx2_strobe_in_n_NC(rx2_strobe_in_n),
        .rx2_strobe_in_p_strobe_in(rx2_strobe_in_p),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M00_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M00_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M00_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M00_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M00_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M00_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M00_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M00_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M00_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M00_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M00_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M00_AXI_WVALID),
        .tdd_sync(GND_1_dout),
        .tx1_dclk_in_n_NC(tx1_dclk_in_n),
        .tx1_dclk_in_p_dclk_in(tx1_dclk_in_p),
        .tx1_dclk_out_n_NC(tx1_dclk_out_n),
        .tx1_dclk_out_p_dclk_out(tx1_dclk_out_p),
        .tx1_enable(tx1_enable),
        .tx1_idata_out_n_idata0(tx1_idata_out_n),
        .tx1_idata_out_p_idata1(tx1_idata_out_p),
        .tx1_qdata_out_n_qdata2(tx1_qdata_out_n),
        .tx1_qdata_out_p_qdata3(tx1_qdata_out_p),
        .tx1_strobe_out_n_NC(tx1_strobe_out_n),
        .tx1_strobe_out_p_strobe_out(tx1_strobe_out_p),
        .tx2_dclk_in_n_NC(tx2_dclk_in_n),
        .tx2_dclk_in_p_dclk_in(tx2_dclk_in_p),
        .tx2_dclk_out_n_NC(tx2_dclk_out_n),
        .tx2_dclk_out_p_dclk_out(tx2_dclk_out_p),
        .tx2_enable(tx2_enable),
        .tx2_idata_out_n_idata0(tx2_idata_out_n),
        .tx2_idata_out_p_idata1(tx2_idata_out_p),
        .tx2_qdata_out_n_qdata2(tx2_qdata_out_n),
        .tx2_qdata_out_p_qdata3(tx2_qdata_out_p),
        .tx2_strobe_out_n_NC(tx2_strobe_out_n),
        .tx2_strobe_out_p_strobe_out(tx2_strobe_out_p),
        .tx_output_enable(tx_output_enable));
  system_axi_adrv9001_rx1_dma_0 axi_adrv9001_rx1_dma
       (.fifo_wr_clk(axi_adrv9001_adc_1_clk),
        .fifo_wr_din(util_adc_1_pack_packed_fifo_wr_DATA),
        .fifo_wr_en(util_adc_1_pack_packed_fifo_wr_EN),
        .fifo_wr_overflow(util_adc_1_pack_packed_fifo_wr_OVERFLOW),
        .irq(axi_adrv9001_rx1_dma_irq),
        .m_dest_axi_aclk(sys_250m_clk),
        .m_dest_axi_aresetn(sys_250m_resetn),
        .m_dest_axi_awaddr(axi_adrv9001_rx1_dma_m_dest_axi_AWADDR),
        .m_dest_axi_awburst(axi_adrv9001_rx1_dma_m_dest_axi_AWBURST),
        .m_dest_axi_awcache(axi_adrv9001_rx1_dma_m_dest_axi_AWCACHE),
        .m_dest_axi_awlen(axi_adrv9001_rx1_dma_m_dest_axi_AWLEN),
        .m_dest_axi_awprot(axi_adrv9001_rx1_dma_m_dest_axi_AWPROT),
        .m_dest_axi_awready(axi_adrv9001_rx1_dma_m_dest_axi_AWREADY),
        .m_dest_axi_awsize(axi_adrv9001_rx1_dma_m_dest_axi_AWSIZE),
        .m_dest_axi_awvalid(axi_adrv9001_rx1_dma_m_dest_axi_AWVALID),
        .m_dest_axi_bready(axi_adrv9001_rx1_dma_m_dest_axi_BREADY),
        .m_dest_axi_bresp(axi_adrv9001_rx1_dma_m_dest_axi_BRESP),
        .m_dest_axi_bvalid(axi_adrv9001_rx1_dma_m_dest_axi_BVALID),
        .m_dest_axi_wdata(axi_adrv9001_rx1_dma_m_dest_axi_WDATA),
        .m_dest_axi_wlast(axi_adrv9001_rx1_dma_m_dest_axi_WLAST),
        .m_dest_axi_wready(axi_adrv9001_rx1_dma_m_dest_axi_WREADY),
        .m_dest_axi_wstrb(axi_adrv9001_rx1_dma_m_dest_axi_WSTRB),
        .m_dest_axi_wvalid(axi_adrv9001_rx1_dma_m_dest_axi_WVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M01_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M01_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M01_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M01_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M01_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M01_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M01_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M01_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M01_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M01_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M01_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M01_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M01_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M01_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M01_AXI_WVALID),
        .sync(axi_adrv9001_adc_1_start_sync));
  system_axi_adrv9001_rx2_dma_0 axi_adrv9001_rx2_dma
       (.fifo_wr_clk(axi_adrv9001_adc_2_clk),
        .fifo_wr_din(util_adc_2_pack_packed_fifo_wr_DATA),
        .fifo_wr_en(util_adc_2_pack_packed_fifo_wr_EN),
        .fifo_wr_overflow(util_adc_2_pack_packed_fifo_wr_OVERFLOW),
        .irq(axi_adrv9001_rx2_dma_irq),
        .m_dest_axi_aclk(sys_250m_clk),
        .m_dest_axi_aresetn(sys_250m_resetn),
        .m_dest_axi_awaddr(axi_adrv9001_rx2_dma_m_dest_axi_AWADDR),
        .m_dest_axi_awburst(axi_adrv9001_rx2_dma_m_dest_axi_AWBURST),
        .m_dest_axi_awcache(axi_adrv9001_rx2_dma_m_dest_axi_AWCACHE),
        .m_dest_axi_awlen(axi_adrv9001_rx2_dma_m_dest_axi_AWLEN),
        .m_dest_axi_awprot(axi_adrv9001_rx2_dma_m_dest_axi_AWPROT),
        .m_dest_axi_awready(axi_adrv9001_rx2_dma_m_dest_axi_AWREADY),
        .m_dest_axi_awsize(axi_adrv9001_rx2_dma_m_dest_axi_AWSIZE),
        .m_dest_axi_awvalid(axi_adrv9001_rx2_dma_m_dest_axi_AWVALID),
        .m_dest_axi_bready(axi_adrv9001_rx2_dma_m_dest_axi_BREADY),
        .m_dest_axi_bresp(axi_adrv9001_rx2_dma_m_dest_axi_BRESP),
        .m_dest_axi_bvalid(axi_adrv9001_rx2_dma_m_dest_axi_BVALID),
        .m_dest_axi_wdata(axi_adrv9001_rx2_dma_m_dest_axi_WDATA),
        .m_dest_axi_wlast(axi_adrv9001_rx2_dma_m_dest_axi_WLAST),
        .m_dest_axi_wready(axi_adrv9001_rx2_dma_m_dest_axi_WREADY),
        .m_dest_axi_wstrb(axi_adrv9001_rx2_dma_m_dest_axi_WSTRB),
        .m_dest_axi_wvalid(axi_adrv9001_rx2_dma_m_dest_axi_WVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M02_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M02_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M02_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M02_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M02_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M02_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M02_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M02_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M02_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M02_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M02_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M02_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M02_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M02_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M02_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M02_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M02_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M02_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M02_AXI_WVALID),
        .sync(axi_adrv9001_adc_2_start_sync));
  system_axi_adrv9001_tx1_dma_0 axi_adrv9001_tx1_dma
       (.irq(axi_adrv9001_tx1_dma_irq),
        .m_axis_aclk(axi_adrv9001_dac_1_clk),
        .m_axis_data(axi_adrv9001_tx1_dma_m_axis_TDATA),
        .m_axis_ready(axi_adrv9001_tx1_dma_m_axis_TREADY),
        .m_axis_valid(axi_adrv9001_tx1_dma_m_axis_TVALID),
        .m_src_axi_aclk(sys_250m_clk),
        .m_src_axi_araddr(axi_adrv9001_tx1_dma_m_src_axi_ARADDR),
        .m_src_axi_arburst(axi_adrv9001_tx1_dma_m_src_axi_ARBURST),
        .m_src_axi_arcache(axi_adrv9001_tx1_dma_m_src_axi_ARCACHE),
        .m_src_axi_aresetn(sys_250m_resetn),
        .m_src_axi_arlen(axi_adrv9001_tx1_dma_m_src_axi_ARLEN),
        .m_src_axi_arprot(axi_adrv9001_tx1_dma_m_src_axi_ARPROT),
        .m_src_axi_arready(axi_adrv9001_tx1_dma_m_src_axi_ARREADY),
        .m_src_axi_arsize(axi_adrv9001_tx1_dma_m_src_axi_ARSIZE),
        .m_src_axi_arvalid(axi_adrv9001_tx1_dma_m_src_axi_ARVALID),
        .m_src_axi_rdata(axi_adrv9001_tx1_dma_m_src_axi_RDATA),
        .m_src_axi_rlast(axi_adrv9001_tx1_dma_m_src_axi_RLAST),
        .m_src_axi_rready(axi_adrv9001_tx1_dma_m_src_axi_RREADY),
        .m_src_axi_rresp(axi_adrv9001_tx1_dma_m_src_axi_RRESP),
        .m_src_axi_rvalid(axi_adrv9001_tx1_dma_m_src_axi_RVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M03_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M03_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M03_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M03_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M03_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M03_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M03_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M03_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M03_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M03_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M03_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M03_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M03_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M03_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M03_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M03_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M03_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M03_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M03_AXI_WVALID));
  system_axi_adrv9001_tx2_dma_0 axi_adrv9001_tx2_dma
       (.irq(axi_adrv9001_tx2_dma_irq),
        .m_axis_aclk(axi_adrv9001_dac_2_clk),
        .m_axis_data(axi_adrv9001_tx2_dma_m_axis_TDATA),
        .m_axis_ready(axi_adrv9001_tx2_dma_m_axis_TREADY),
        .m_axis_valid(axi_adrv9001_tx2_dma_m_axis_TVALID),
        .m_src_axi_aclk(sys_250m_clk),
        .m_src_axi_araddr(axi_adrv9001_tx2_dma_m_src_axi_ARADDR),
        .m_src_axi_arburst(axi_adrv9001_tx2_dma_m_src_axi_ARBURST),
        .m_src_axi_arcache(axi_adrv9001_tx2_dma_m_src_axi_ARCACHE),
        .m_src_axi_aresetn(sys_250m_resetn),
        .m_src_axi_arlen(axi_adrv9001_tx2_dma_m_src_axi_ARLEN),
        .m_src_axi_arprot(axi_adrv9001_tx2_dma_m_src_axi_ARPROT),
        .m_src_axi_arready(axi_adrv9001_tx2_dma_m_src_axi_ARREADY),
        .m_src_axi_arsize(axi_adrv9001_tx2_dma_m_src_axi_ARSIZE),
        .m_src_axi_arvalid(axi_adrv9001_tx2_dma_m_src_axi_ARVALID),
        .m_src_axi_rdata(axi_adrv9001_tx2_dma_m_src_axi_RDATA),
        .m_src_axi_rlast(axi_adrv9001_tx2_dma_m_src_axi_RLAST),
        .m_src_axi_rready(axi_adrv9001_tx2_dma_m_src_axi_RREADY),
        .m_src_axi_rresp(axi_adrv9001_tx2_dma_m_src_axi_RRESP),
        .m_src_axi_rvalid(axi_adrv9001_tx2_dma_m_src_axi_RVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M04_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M04_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M04_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M04_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M04_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M04_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M04_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M04_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M04_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M04_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M04_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M04_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M04_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M04_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M04_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M04_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M04_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M04_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M04_AXI_WVALID));
  system_axi_hpc0_interconnect_0 axi_hpc0_interconnect
       (.M00_AXI_araddr(axi_hpc0_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_hpc0_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_hpc0_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_hpc0_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_hpc0_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_hpc0_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_hpc0_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_hpc0_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_hpc0_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_hpc0_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_hpc0_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_hpc0_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_hpc0_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_hpc0_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_hpc0_interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_hpc0_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_hpc0_interconnect_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_hpc0_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_hpc0_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_hpc0_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_hpc0_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_hpc0_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_hpc0_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_hpc0_interconnect_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_hpc0_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(axi_hpc0_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_hpc0_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_hpc0_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_hpc0_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_hpc0_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(axi_hpc0_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_hpc0_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_hpc0_interconnect_M00_AXI_WVALID),
        .S00_AXI_awaddr(axi_adrv9001_rx1_dma_m_dest_axi_AWADDR),
        .S00_AXI_awburst(axi_adrv9001_rx1_dma_m_dest_axi_AWBURST),
        .S00_AXI_awcache(axi_adrv9001_rx1_dma_m_dest_axi_AWCACHE),
        .S00_AXI_awlen(axi_adrv9001_rx1_dma_m_dest_axi_AWLEN),
        .S00_AXI_awlock(1'b0),
        .S00_AXI_awprot(axi_adrv9001_rx1_dma_m_dest_axi_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(axi_adrv9001_rx1_dma_m_dest_axi_AWREADY),
        .S00_AXI_awsize(axi_adrv9001_rx1_dma_m_dest_axi_AWSIZE),
        .S00_AXI_awvalid(axi_adrv9001_rx1_dma_m_dest_axi_AWVALID),
        .S00_AXI_bready(axi_adrv9001_rx1_dma_m_dest_axi_BREADY),
        .S00_AXI_bresp(axi_adrv9001_rx1_dma_m_dest_axi_BRESP),
        .S00_AXI_bvalid(axi_adrv9001_rx1_dma_m_dest_axi_BVALID),
        .S00_AXI_wdata(axi_adrv9001_rx1_dma_m_dest_axi_WDATA),
        .S00_AXI_wlast(axi_adrv9001_rx1_dma_m_dest_axi_WLAST),
        .S00_AXI_wready(axi_adrv9001_rx1_dma_m_dest_axi_WREADY),
        .S00_AXI_wstrb(axi_adrv9001_rx1_dma_m_dest_axi_WSTRB),
        .S00_AXI_wvalid(axi_adrv9001_rx1_dma_m_dest_axi_WVALID),
        .S01_AXI_awaddr(axi_adrv9001_rx2_dma_m_dest_axi_AWADDR),
        .S01_AXI_awburst(axi_adrv9001_rx2_dma_m_dest_axi_AWBURST),
        .S01_AXI_awcache(axi_adrv9001_rx2_dma_m_dest_axi_AWCACHE),
        .S01_AXI_awlen(axi_adrv9001_rx2_dma_m_dest_axi_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_adrv9001_rx2_dma_m_dest_axi_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_adrv9001_rx2_dma_m_dest_axi_AWREADY),
        .S01_AXI_awsize(axi_adrv9001_rx2_dma_m_dest_axi_AWSIZE),
        .S01_AXI_awvalid(axi_adrv9001_rx2_dma_m_dest_axi_AWVALID),
        .S01_AXI_bready(axi_adrv9001_rx2_dma_m_dest_axi_BREADY),
        .S01_AXI_bresp(axi_adrv9001_rx2_dma_m_dest_axi_BRESP),
        .S01_AXI_bvalid(axi_adrv9001_rx2_dma_m_dest_axi_BVALID),
        .S01_AXI_wdata(axi_adrv9001_rx2_dma_m_dest_axi_WDATA),
        .S01_AXI_wlast(axi_adrv9001_rx2_dma_m_dest_axi_WLAST),
        .S01_AXI_wready(axi_adrv9001_rx2_dma_m_dest_axi_WREADY),
        .S01_AXI_wstrb(axi_adrv9001_rx2_dma_m_dest_axi_WSTRB),
        .S01_AXI_wvalid(axi_adrv9001_rx2_dma_m_dest_axi_WVALID),
        .S02_AXI_araddr(axi_adrv9001_tx1_dma_m_src_axi_ARADDR),
        .S02_AXI_arburst(axi_adrv9001_tx1_dma_m_src_axi_ARBURST),
        .S02_AXI_arcache(axi_adrv9001_tx1_dma_m_src_axi_ARCACHE),
        .S02_AXI_arlen(axi_adrv9001_tx1_dma_m_src_axi_ARLEN),
        .S02_AXI_arlock(1'b0),
        .S02_AXI_arprot(axi_adrv9001_tx1_dma_m_src_axi_ARPROT),
        .S02_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arready(axi_adrv9001_tx1_dma_m_src_axi_ARREADY),
        .S02_AXI_arsize(axi_adrv9001_tx1_dma_m_src_axi_ARSIZE),
        .S02_AXI_arvalid(axi_adrv9001_tx1_dma_m_src_axi_ARVALID),
        .S02_AXI_rdata(axi_adrv9001_tx1_dma_m_src_axi_RDATA),
        .S02_AXI_rlast(axi_adrv9001_tx1_dma_m_src_axi_RLAST),
        .S02_AXI_rready(axi_adrv9001_tx1_dma_m_src_axi_RREADY),
        .S02_AXI_rresp(axi_adrv9001_tx1_dma_m_src_axi_RRESP),
        .S02_AXI_rvalid(axi_adrv9001_tx1_dma_m_src_axi_RVALID),
        .S03_AXI_araddr(axi_adrv9001_tx2_dma_m_src_axi_ARADDR),
        .S03_AXI_arburst(axi_adrv9001_tx2_dma_m_src_axi_ARBURST),
        .S03_AXI_arcache(axi_adrv9001_tx2_dma_m_src_axi_ARCACHE),
        .S03_AXI_arlen(axi_adrv9001_tx2_dma_m_src_axi_ARLEN),
        .S03_AXI_arlock(1'b0),
        .S03_AXI_arprot(axi_adrv9001_tx2_dma_m_src_axi_ARPROT),
        .S03_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arready(axi_adrv9001_tx2_dma_m_src_axi_ARREADY),
        .S03_AXI_arsize(axi_adrv9001_tx2_dma_m_src_axi_ARSIZE),
        .S03_AXI_arvalid(axi_adrv9001_tx2_dma_m_src_axi_ARVALID),
        .S03_AXI_rdata(axi_adrv9001_tx2_dma_m_src_axi_RDATA),
        .S03_AXI_rlast(axi_adrv9001_tx2_dma_m_src_axi_RLAST),
        .S03_AXI_rready(axi_adrv9001_tx2_dma_m_src_axi_RREADY),
        .S03_AXI_rresp(axi_adrv9001_tx2_dma_m_src_axi_RRESP),
        .S03_AXI_rvalid(axi_adrv9001_tx2_dma_m_src_axi_RVALID),
        .aclk(sys_250m_clk),
        .aresetn(sys_250m_resetn));
  system_axi_hpm0_lpd_interconnect_0 axi_hpm0_lpd_interconnect
       (.M00_AXI_araddr(axi_hpm0_lpd_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(axi_hpm0_lpd_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(axi_hpm0_lpd_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_hpm0_lpd_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_hpm0_lpd_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(axi_hpm0_lpd_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(axi_hpm0_lpd_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_hpm0_lpd_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_hpm0_lpd_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_hpm0_lpd_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_hpm0_lpd_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_hpm0_lpd_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(axi_hpm0_lpd_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_hpm0_lpd_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_hpm0_lpd_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_hpm0_lpd_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(axi_hpm0_lpd_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_hpm0_lpd_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_hpm0_lpd_interconnect_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_hpm0_lpd_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(axi_hpm0_lpd_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(axi_hpm0_lpd_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_hpm0_lpd_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_hpm0_lpd_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(axi_hpm0_lpd_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(axi_hpm0_lpd_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_hpm0_lpd_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_hpm0_lpd_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_hpm0_lpd_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_hpm0_lpd_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_hpm0_lpd_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(axi_hpm0_lpd_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_hpm0_lpd_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_hpm0_lpd_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_hpm0_lpd_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(axi_hpm0_lpd_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_hpm0_lpd_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_hpm0_lpd_interconnect_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_hpm0_lpd_interconnect_M02_AXI_ARADDR),
        .M02_AXI_arprot(axi_hpm0_lpd_interconnect_M02_AXI_ARPROT),
        .M02_AXI_arready(axi_hpm0_lpd_interconnect_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_hpm0_lpd_interconnect_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_hpm0_lpd_interconnect_M02_AXI_AWADDR),
        .M02_AXI_awprot(axi_hpm0_lpd_interconnect_M02_AXI_AWPROT),
        .M02_AXI_awready(axi_hpm0_lpd_interconnect_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_hpm0_lpd_interconnect_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_hpm0_lpd_interconnect_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_hpm0_lpd_interconnect_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_hpm0_lpd_interconnect_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_hpm0_lpd_interconnect_M02_AXI_RDATA),
        .M02_AXI_rready(axi_hpm0_lpd_interconnect_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_hpm0_lpd_interconnect_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_hpm0_lpd_interconnect_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_hpm0_lpd_interconnect_M02_AXI_WDATA),
        .M02_AXI_wready(axi_hpm0_lpd_interconnect_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_hpm0_lpd_interconnect_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_hpm0_lpd_interconnect_M02_AXI_WVALID),
        .M03_AXI_araddr(axi_hpm0_lpd_interconnect_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_hpm0_lpd_interconnect_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_hpm0_lpd_interconnect_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_hpm0_lpd_interconnect_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_hpm0_lpd_interconnect_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_hpm0_lpd_interconnect_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_hpm0_lpd_interconnect_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_hpm0_lpd_interconnect_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_hpm0_lpd_interconnect_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_hpm0_lpd_interconnect_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_hpm0_lpd_interconnect_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_hpm0_lpd_interconnect_M03_AXI_RDATA),
        .M03_AXI_rready(axi_hpm0_lpd_interconnect_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_hpm0_lpd_interconnect_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_hpm0_lpd_interconnect_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_hpm0_lpd_interconnect_M03_AXI_WDATA),
        .M03_AXI_wready(axi_hpm0_lpd_interconnect_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_hpm0_lpd_interconnect_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_hpm0_lpd_interconnect_M03_AXI_WVALID),
        .M04_AXI_araddr(axi_hpm0_lpd_interconnect_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi_hpm0_lpd_interconnect_M04_AXI_ARPROT),
        .M04_AXI_arready(axi_hpm0_lpd_interconnect_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_hpm0_lpd_interconnect_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_hpm0_lpd_interconnect_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi_hpm0_lpd_interconnect_M04_AXI_AWPROT),
        .M04_AXI_awready(axi_hpm0_lpd_interconnect_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_hpm0_lpd_interconnect_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_hpm0_lpd_interconnect_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_hpm0_lpd_interconnect_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_hpm0_lpd_interconnect_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_hpm0_lpd_interconnect_M04_AXI_RDATA),
        .M04_AXI_rready(axi_hpm0_lpd_interconnect_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_hpm0_lpd_interconnect_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_hpm0_lpd_interconnect_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_hpm0_lpd_interconnect_M04_AXI_WDATA),
        .M04_AXI_wready(axi_hpm0_lpd_interconnect_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_hpm0_lpd_interconnect_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_hpm0_lpd_interconnect_M04_AXI_WVALID),
        .M05_AXI_araddr(axi_hpm0_lpd_interconnect_M05_AXI_ARADDR),
        .M05_AXI_arprot(axi_hpm0_lpd_interconnect_M05_AXI_ARPROT),
        .M05_AXI_arready(axi_hpm0_lpd_interconnect_M05_AXI_ARREADY),
        .M05_AXI_arvalid(axi_hpm0_lpd_interconnect_M05_AXI_ARVALID),
        .M05_AXI_awaddr(axi_hpm0_lpd_interconnect_M05_AXI_AWADDR),
        .M05_AXI_awprot(axi_hpm0_lpd_interconnect_M05_AXI_AWPROT),
        .M05_AXI_awready(axi_hpm0_lpd_interconnect_M05_AXI_AWREADY),
        .M05_AXI_awvalid(axi_hpm0_lpd_interconnect_M05_AXI_AWVALID),
        .M05_AXI_bready(axi_hpm0_lpd_interconnect_M05_AXI_BREADY),
        .M05_AXI_bresp(axi_hpm0_lpd_interconnect_M05_AXI_BRESP),
        .M05_AXI_bvalid(axi_hpm0_lpd_interconnect_M05_AXI_BVALID),
        .M05_AXI_rdata(axi_hpm0_lpd_interconnect_M05_AXI_RDATA),
        .M05_AXI_rready(axi_hpm0_lpd_interconnect_M05_AXI_RREADY),
        .M05_AXI_rresp(axi_hpm0_lpd_interconnect_M05_AXI_RRESP),
        .M05_AXI_rvalid(axi_hpm0_lpd_interconnect_M05_AXI_RVALID),
        .M05_AXI_wdata(axi_hpm0_lpd_interconnect_M05_AXI_WDATA),
        .M05_AXI_wready(axi_hpm0_lpd_interconnect_M05_AXI_WREADY),
        .M05_AXI_wstrb(axi_hpm0_lpd_interconnect_M05_AXI_WSTRB),
        .M05_AXI_wvalid(axi_hpm0_lpd_interconnect_M05_AXI_WVALID),
        .M06_AXI_araddr(axi_hpm0_lpd_interconnect_M06_AXI_ARADDR),
        .M06_AXI_arready(axi_hpm0_lpd_interconnect_M06_AXI_ARREADY),
        .M06_AXI_arvalid(axi_hpm0_lpd_interconnect_M06_AXI_ARVALID),
        .M06_AXI_awaddr(axi_hpm0_lpd_interconnect_M06_AXI_AWADDR),
        .M06_AXI_awready(axi_hpm0_lpd_interconnect_M06_AXI_AWREADY),
        .M06_AXI_awvalid(axi_hpm0_lpd_interconnect_M06_AXI_AWVALID),
        .M06_AXI_bready(axi_hpm0_lpd_interconnect_M06_AXI_BREADY),
        .M06_AXI_bresp(axi_hpm0_lpd_interconnect_M06_AXI_BRESP),
        .M06_AXI_bvalid(axi_hpm0_lpd_interconnect_M06_AXI_BVALID),
        .M06_AXI_rdata(axi_hpm0_lpd_interconnect_M06_AXI_RDATA),
        .M06_AXI_rready(axi_hpm0_lpd_interconnect_M06_AXI_RREADY),
        .M06_AXI_rresp(axi_hpm0_lpd_interconnect_M06_AXI_RRESP),
        .M06_AXI_rvalid(axi_hpm0_lpd_interconnect_M06_AXI_RVALID),
        .M06_AXI_wdata(axi_hpm0_lpd_interconnect_M06_AXI_WDATA),
        .M06_AXI_wready(axi_hpm0_lpd_interconnect_M06_AXI_WREADY),
        .M06_AXI_wstrb(axi_hpm0_lpd_interconnect_M06_AXI_WSTRB),
        .M06_AXI_wvalid(axi_hpm0_lpd_interconnect_M06_AXI_WVALID),
        .S00_AXI_araddr(sys_ps8_M_AXI_HPM0_LPD_ARADDR),
        .S00_AXI_arburst(sys_ps8_M_AXI_HPM0_LPD_ARBURST),
        .S00_AXI_arcache(sys_ps8_M_AXI_HPM0_LPD_ARCACHE),
        .S00_AXI_arid(sys_ps8_M_AXI_HPM0_LPD_ARID),
        .S00_AXI_arlen(sys_ps8_M_AXI_HPM0_LPD_ARLEN),
        .S00_AXI_arlock(sys_ps8_M_AXI_HPM0_LPD_ARLOCK),
        .S00_AXI_arprot(sys_ps8_M_AXI_HPM0_LPD_ARPROT),
        .S00_AXI_arqos(sys_ps8_M_AXI_HPM0_LPD_ARQOS),
        .S00_AXI_arready(sys_ps8_M_AXI_HPM0_LPD_ARREADY),
        .S00_AXI_arsize(sys_ps8_M_AXI_HPM0_LPD_ARSIZE),
        .S00_AXI_aruser(sys_ps8_M_AXI_HPM0_LPD_ARUSER),
        .S00_AXI_arvalid(sys_ps8_M_AXI_HPM0_LPD_ARVALID),
        .S00_AXI_awaddr(sys_ps8_M_AXI_HPM0_LPD_AWADDR),
        .S00_AXI_awburst(sys_ps8_M_AXI_HPM0_LPD_AWBURST),
        .S00_AXI_awcache(sys_ps8_M_AXI_HPM0_LPD_AWCACHE),
        .S00_AXI_awid(sys_ps8_M_AXI_HPM0_LPD_AWID),
        .S00_AXI_awlen(sys_ps8_M_AXI_HPM0_LPD_AWLEN),
        .S00_AXI_awlock(sys_ps8_M_AXI_HPM0_LPD_AWLOCK),
        .S00_AXI_awprot(sys_ps8_M_AXI_HPM0_LPD_AWPROT),
        .S00_AXI_awqos(sys_ps8_M_AXI_HPM0_LPD_AWQOS),
        .S00_AXI_awready(sys_ps8_M_AXI_HPM0_LPD_AWREADY),
        .S00_AXI_awsize(sys_ps8_M_AXI_HPM0_LPD_AWSIZE),
        .S00_AXI_awuser(sys_ps8_M_AXI_HPM0_LPD_AWUSER),
        .S00_AXI_awvalid(sys_ps8_M_AXI_HPM0_LPD_AWVALID),
        .S00_AXI_bid(sys_ps8_M_AXI_HPM0_LPD_BID),
        .S00_AXI_bready(sys_ps8_M_AXI_HPM0_LPD_BREADY),
        .S00_AXI_bresp(sys_ps8_M_AXI_HPM0_LPD_BRESP),
        .S00_AXI_bvalid(sys_ps8_M_AXI_HPM0_LPD_BVALID),
        .S00_AXI_rdata(sys_ps8_M_AXI_HPM0_LPD_RDATA),
        .S00_AXI_rid(sys_ps8_M_AXI_HPM0_LPD_RID),
        .S00_AXI_rlast(sys_ps8_M_AXI_HPM0_LPD_RLAST),
        .S00_AXI_rready(sys_ps8_M_AXI_HPM0_LPD_RREADY),
        .S00_AXI_rresp(sys_ps8_M_AXI_HPM0_LPD_RRESP),
        .S00_AXI_rvalid(sys_ps8_M_AXI_HPM0_LPD_RVALID),
        .S00_AXI_wdata(sys_ps8_M_AXI_HPM0_LPD_WDATA),
        .S00_AXI_wlast(sys_ps8_M_AXI_HPM0_LPD_WLAST),
        .S00_AXI_wready(sys_ps8_M_AXI_HPM0_LPD_WREADY),
        .S00_AXI_wstrb(sys_ps8_M_AXI_HPM0_LPD_WSTRB),
        .S00_AXI_wvalid(sys_ps8_M_AXI_HPM0_LPD_WVALID),
        .aclk(sys_cpu_clk),
        .aresetn(sys_cpu_resetn));
  system_axi_sysid_0_0 axi_sysid_0
       (.pr_rom_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rom_addr(axi_sysid_0_rom_addr),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M05_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_hpm0_lpd_interconnect_M05_AXI_ARPROT),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M05_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M05_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M05_AXI_AWADDR),
        .s_axi_awprot(axi_hpm0_lpd_interconnect_M05_AXI_AWPROT),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M05_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M05_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M05_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M05_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M05_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M05_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M05_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M05_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M05_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M05_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M05_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M05_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M05_AXI_WVALID),
        .sys_rom_data(rom_sys_0_rom_data));
  system_pl_sysmon_0 pl_sysmon
       (.ip2intc_irpt(pl_sysmon_ip2intc_irpt),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_hpm0_lpd_interconnect_M06_AXI_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arready(axi_hpm0_lpd_interconnect_M06_AXI_ARREADY),
        .s_axi_arvalid(axi_hpm0_lpd_interconnect_M06_AXI_ARVALID),
        .s_axi_awaddr(axi_hpm0_lpd_interconnect_M06_AXI_AWADDR),
        .s_axi_awready(axi_hpm0_lpd_interconnect_M06_AXI_AWREADY),
        .s_axi_awvalid(axi_hpm0_lpd_interconnect_M06_AXI_AWVALID),
        .s_axi_bready(axi_hpm0_lpd_interconnect_M06_AXI_BREADY),
        .s_axi_bresp(axi_hpm0_lpd_interconnect_M06_AXI_BRESP),
        .s_axi_bvalid(axi_hpm0_lpd_interconnect_M06_AXI_BVALID),
        .s_axi_rdata(axi_hpm0_lpd_interconnect_M06_AXI_RDATA),
        .s_axi_rready(axi_hpm0_lpd_interconnect_M06_AXI_RREADY),
        .s_axi_rresp(axi_hpm0_lpd_interconnect_M06_AXI_RRESP),
        .s_axi_rvalid(axi_hpm0_lpd_interconnect_M06_AXI_RVALID),
        .s_axi_wdata(axi_hpm0_lpd_interconnect_M06_AXI_WDATA),
        .s_axi_wready(axi_hpm0_lpd_interconnect_M06_AXI_WREADY),
        .s_axi_wstrb(axi_hpm0_lpd_interconnect_M06_AXI_WSTRB),
        .s_axi_wvalid(axi_hpm0_lpd_interconnect_M06_AXI_WVALID),
        .vauxn0(s_1v2_ps_ddr4_sns_n),
        .vauxn1(s_2v5_sns_n),
        .vauxn10(s_1p8_rf_sns_n),
        .vauxn2(s_1p3_rf_sns_n),
        .vauxn3(s_1p0_rf_sns_n),
        .vauxn4(s_1v8_mgtravtt_sns_n),
        .vauxn5(s_1v2_sns_n),
        .vauxn6(s_5v0_sns_n),
        .vauxn7(s_0v85_mgtravcc_sns_n),
        .vauxn8(s_vtt_ps_ddr4_sns_n),
        .vauxn9(s_5v0_rf_sns_n),
        .vauxp0(s_1v2_ps_ddr4_sns_p),
        .vauxp1(s_2v5_sns_p),
        .vauxp10(s_1p8_rf_sns_p),
        .vauxp2(s_1p3_rf_sns_p),
        .vauxp3(s_1p0_rf_sns_p),
        .vauxp4(s_1v8_mgtravtt_sns_p),
        .vauxp5(s_1v2_sns_p),
        .vauxp6(s_5v0_sns_p),
        .vauxp7(s_0v85_mgtravcc_sns_p),
        .vauxp8(s_vtt_ps_ddr4_sns_p),
        .vauxp9(s_5v0_rf_sns_p));
  system_rom_sys_0_0 rom_sys_0
       (.clk(sys_cpu_clk),
        .rom_addr(axi_sysid_0_rom_addr),
        .rom_data(rom_sys_0_rom_data));
  system_sys_250m_rstgen_0 sys_250m_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sys_ps8_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(sys_250m_resetn),
        .peripheral_reset(sys_250m_reset),
        .slowest_sync_clk(sys_250m_clk));
  system_sys_500m_rstgen_0 sys_500m_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sys_ps8_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(sys_500m_resetn),
        .peripheral_reset(sys_500m_reset),
        .slowest_sync_clk(sys_500m_clk));
  assign sys_concat_intc_0_dout = {GND_1_dout, GND_1_dout, GND_1_dout, GND_1_dout, GND_1_dout, GND_1_dout, GND_1_dout, GND_1_dout};
  assign sys_concat_intc_1_dout = {GND_1_dout, GND_1_dout, axi_adrv9001_rx1_dma_irq, axi_adrv9001_rx2_dma_irq, axi_adrv9001_tx1_dma_irq, axi_adrv9001_tx2_dma_irq, pl_sysmon_ip2intc_irpt, GND_1_dout};
  system_sys_ps8_0 sys_ps8
       (.emio_gpio_i(gpio_i),
        .emio_gpio_o(gpio_o),
        .emio_gpio_t(gpio_t),
        .emio_spi0_m_i(spi0_miso),
        .emio_spi0_m_o(spi0_mosi),
        .emio_spi0_s_i(GND_1_dout),
        .emio_spi0_sclk_i(GND_1_dout),
        .emio_spi0_sclk_o(spi0_sclk),
        .emio_spi0_ss_i_n(VCC_1_dout),
        .emio_spi0_ss_o_n(spi0_csn),
        .maxigp2_araddr(sys_ps8_M_AXI_HPM0_LPD_ARADDR),
        .maxigp2_arburst(sys_ps8_M_AXI_HPM0_LPD_ARBURST),
        .maxigp2_arcache(sys_ps8_M_AXI_HPM0_LPD_ARCACHE),
        .maxigp2_arid(sys_ps8_M_AXI_HPM0_LPD_ARID),
        .maxigp2_arlen(sys_ps8_M_AXI_HPM0_LPD_ARLEN),
        .maxigp2_arlock(sys_ps8_M_AXI_HPM0_LPD_ARLOCK),
        .maxigp2_arprot(sys_ps8_M_AXI_HPM0_LPD_ARPROT),
        .maxigp2_arqos(sys_ps8_M_AXI_HPM0_LPD_ARQOS),
        .maxigp2_arready(sys_ps8_M_AXI_HPM0_LPD_ARREADY),
        .maxigp2_arsize(sys_ps8_M_AXI_HPM0_LPD_ARSIZE),
        .maxigp2_aruser(sys_ps8_M_AXI_HPM0_LPD_ARUSER),
        .maxigp2_arvalid(sys_ps8_M_AXI_HPM0_LPD_ARVALID),
        .maxigp2_awaddr(sys_ps8_M_AXI_HPM0_LPD_AWADDR),
        .maxigp2_awburst(sys_ps8_M_AXI_HPM0_LPD_AWBURST),
        .maxigp2_awcache(sys_ps8_M_AXI_HPM0_LPD_AWCACHE),
        .maxigp2_awid(sys_ps8_M_AXI_HPM0_LPD_AWID),
        .maxigp2_awlen(sys_ps8_M_AXI_HPM0_LPD_AWLEN),
        .maxigp2_awlock(sys_ps8_M_AXI_HPM0_LPD_AWLOCK),
        .maxigp2_awprot(sys_ps8_M_AXI_HPM0_LPD_AWPROT),
        .maxigp2_awqos(sys_ps8_M_AXI_HPM0_LPD_AWQOS),
        .maxigp2_awready(sys_ps8_M_AXI_HPM0_LPD_AWREADY),
        .maxigp2_awsize(sys_ps8_M_AXI_HPM0_LPD_AWSIZE),
        .maxigp2_awuser(sys_ps8_M_AXI_HPM0_LPD_AWUSER),
        .maxigp2_awvalid(sys_ps8_M_AXI_HPM0_LPD_AWVALID),
        .maxigp2_bid(sys_ps8_M_AXI_HPM0_LPD_BID),
        .maxigp2_bready(sys_ps8_M_AXI_HPM0_LPD_BREADY),
        .maxigp2_bresp(sys_ps8_M_AXI_HPM0_LPD_BRESP),
        .maxigp2_bvalid(sys_ps8_M_AXI_HPM0_LPD_BVALID),
        .maxigp2_rdata(sys_ps8_M_AXI_HPM0_LPD_RDATA),
        .maxigp2_rid(sys_ps8_M_AXI_HPM0_LPD_RID),
        .maxigp2_rlast(sys_ps8_M_AXI_HPM0_LPD_RLAST),
        .maxigp2_rready(sys_ps8_M_AXI_HPM0_LPD_RREADY),
        .maxigp2_rresp(sys_ps8_M_AXI_HPM0_LPD_RRESP),
        .maxigp2_rvalid(sys_ps8_M_AXI_HPM0_LPD_RVALID),
        .maxigp2_wdata(sys_ps8_M_AXI_HPM0_LPD_WDATA),
        .maxigp2_wlast(sys_ps8_M_AXI_HPM0_LPD_WLAST),
        .maxigp2_wready(sys_ps8_M_AXI_HPM0_LPD_WREADY),
        .maxigp2_wstrb(sys_ps8_M_AXI_HPM0_LPD_WSTRB),
        .maxigp2_wvalid(sys_ps8_M_AXI_HPM0_LPD_WVALID),
        .maxihpm0_lpd_aclk(sys_cpu_clk),
        .pl_clk0(sys_cpu_clk),
        .pl_clk1(sys_250m_clk),
        .pl_clk2(sys_500m_clk),
        .pl_ps_irq0(sys_concat_intc_0_dout),
        .pl_ps_irq1(sys_concat_intc_1_dout),
        .pl_resetn0(sys_ps8_pl_resetn0),
        .saxigp0_araddr(axi_hpc0_interconnect_M00_AXI_ARADDR),
        .saxigp0_arburst(axi_hpc0_interconnect_M00_AXI_ARBURST),
        .saxigp0_arcache(axi_hpc0_interconnect_M00_AXI_ARCACHE),
        .saxigp0_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp0_arlen(axi_hpc0_interconnect_M00_AXI_ARLEN),
        .saxigp0_arlock(axi_hpc0_interconnect_M00_AXI_ARLOCK),
        .saxigp0_arprot(axi_hpc0_interconnect_M00_AXI_ARPROT),
        .saxigp0_arqos(axi_hpc0_interconnect_M00_AXI_ARQOS),
        .saxigp0_arready(axi_hpc0_interconnect_M00_AXI_ARREADY),
        .saxigp0_arsize(axi_hpc0_interconnect_M00_AXI_ARSIZE),
        .saxigp0_aruser(1'b0),
        .saxigp0_arvalid(axi_hpc0_interconnect_M00_AXI_ARVALID),
        .saxigp0_awaddr(axi_hpc0_interconnect_M00_AXI_AWADDR),
        .saxigp0_awburst(axi_hpc0_interconnect_M00_AXI_AWBURST),
        .saxigp0_awcache(axi_hpc0_interconnect_M00_AXI_AWCACHE),
        .saxigp0_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp0_awlen(axi_hpc0_interconnect_M00_AXI_AWLEN),
        .saxigp0_awlock(axi_hpc0_interconnect_M00_AXI_AWLOCK),
        .saxigp0_awprot(axi_hpc0_interconnect_M00_AXI_AWPROT),
        .saxigp0_awqos(axi_hpc0_interconnect_M00_AXI_AWQOS),
        .saxigp0_awready(axi_hpc0_interconnect_M00_AXI_AWREADY),
        .saxigp0_awsize(axi_hpc0_interconnect_M00_AXI_AWSIZE),
        .saxigp0_awuser(1'b0),
        .saxigp0_awvalid(axi_hpc0_interconnect_M00_AXI_AWVALID),
        .saxigp0_bready(axi_hpc0_interconnect_M00_AXI_BREADY),
        .saxigp0_bresp(axi_hpc0_interconnect_M00_AXI_BRESP),
        .saxigp0_bvalid(axi_hpc0_interconnect_M00_AXI_BVALID),
        .saxigp0_rdata(axi_hpc0_interconnect_M00_AXI_RDATA),
        .saxigp0_rlast(axi_hpc0_interconnect_M00_AXI_RLAST),
        .saxigp0_rready(axi_hpc0_interconnect_M00_AXI_RREADY),
        .saxigp0_rresp(axi_hpc0_interconnect_M00_AXI_RRESP),
        .saxigp0_rvalid(axi_hpc0_interconnect_M00_AXI_RVALID),
        .saxigp0_wdata(axi_hpc0_interconnect_M00_AXI_WDATA),
        .saxigp0_wlast(axi_hpc0_interconnect_M00_AXI_WLAST),
        .saxigp0_wready(axi_hpc0_interconnect_M00_AXI_WREADY),
        .saxigp0_wstrb(axi_hpc0_interconnect_M00_AXI_WSTRB),
        .saxigp0_wvalid(axi_hpc0_interconnect_M00_AXI_WVALID),
        .saxihpc0_fpd_aclk(sys_250m_clk));
  system_sys_rstgen_0 sys_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sys_ps8_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(sys_cpu_resetn),
        .peripheral_reset(sys_cpu_reset),
        .slowest_sync_clk(sys_cpu_clk));
  system_util_adc_1_pack_0 util_adc_1_pack
       (.clk(axi_adrv9001_adc_1_clk),
        .enable_0(axi_adrv9001_adc_1_enable_i0),
        .enable_1(axi_adrv9001_adc_1_enable_q0),
        .enable_2(axi_adrv9001_adc_1_enable_i1),
        .enable_3(axi_adrv9001_adc_1_enable_q1),
        .fifo_wr_data_0(axi_adrv9001_adc_1_data_i0),
        .fifo_wr_data_1(axi_adrv9001_adc_1_data_q0),
        .fifo_wr_data_2(axi_adrv9001_adc_1_data_i1),
        .fifo_wr_data_3(axi_adrv9001_adc_1_data_q1),
        .fifo_wr_en(axi_adrv9001_adc_1_valid_i0),
        .fifo_wr_overflow(util_adc_1_pack_fifo_wr_overflow),
        .packed_fifo_wr_data(util_adc_1_pack_packed_fifo_wr_DATA),
        .packed_fifo_wr_en(util_adc_1_pack_packed_fifo_wr_EN),
        .packed_fifo_wr_overflow(util_adc_1_pack_packed_fifo_wr_OVERFLOW),
        .reset(axi_adrv9001_adc_1_rst));
  system_util_adc_2_pack_0 util_adc_2_pack
       (.clk(axi_adrv9001_adc_2_clk),
        .enable_0(axi_adrv9001_adc_2_enable_i0),
        .enable_1(axi_adrv9001_adc_2_enable_q0),
        .enable_2(GND_1_dout),
        .enable_3(GND_1_dout),
        .fifo_wr_data_0(axi_adrv9001_adc_2_data_i0),
        .fifo_wr_data_1(axi_adrv9001_adc_2_data_q0),
        .fifo_wr_data_2(GND_16_dout),
        .fifo_wr_data_3(GND_16_dout),
        .fifo_wr_en(axi_adrv9001_adc_2_valid_i0),
        .fifo_wr_overflow(util_adc_2_pack_fifo_wr_overflow),
        .packed_fifo_wr_data(util_adc_2_pack_packed_fifo_wr_DATA),
        .packed_fifo_wr_en(util_adc_2_pack_packed_fifo_wr_EN),
        .packed_fifo_wr_overflow(util_adc_2_pack_packed_fifo_wr_OVERFLOW),
        .reset(axi_adrv9001_adc_2_rst));
  system_util_dac_1_upack_0 util_dac_1_upack
       (.clk(axi_adrv9001_dac_1_clk),
        .enable_0(axi_adrv9001_dac_1_enable_i0),
        .enable_1(axi_adrv9001_dac_1_enable_q0),
        .enable_2(axi_adrv9001_dac_1_enable_i1),
        .enable_3(axi_adrv9001_dac_1_enable_q1),
        .fifo_rd_data_0(util_dac_1_upack_fifo_rd_data_0),
        .fifo_rd_data_1(util_dac_1_upack_fifo_rd_data_1),
        .fifo_rd_data_2(util_dac_1_upack_fifo_rd_data_2),
        .fifo_rd_data_3(util_dac_1_upack_fifo_rd_data_3),
        .fifo_rd_en(axi_adrv9001_dac_1_valid_i0),
        .fifo_rd_underflow(util_dac_1_upack_fifo_rd_underflow),
        .reset(axi_adrv9001_dac_1_rst),
        .s_axis_data(axi_adrv9001_tx1_dma_m_axis_TDATA),
        .s_axis_ready(axi_adrv9001_tx1_dma_m_axis_TREADY),
        .s_axis_valid(axi_adrv9001_tx1_dma_m_axis_TVALID));
  system_util_dac_2_upack_0 util_dac_2_upack
       (.clk(axi_adrv9001_dac_2_clk),
        .enable_0(axi_adrv9001_dac_2_enable_i0),
        .enable_1(axi_adrv9001_dac_2_enable_q0),
        .fifo_rd_data_0(util_dac_2_upack_fifo_rd_data_0),
        .fifo_rd_data_1(util_dac_2_upack_fifo_rd_data_1),
        .fifo_rd_en(axi_adrv9001_dac_2_valid_i0),
        .fifo_rd_underflow(util_dac_2_upack_fifo_rd_underflow),
        .reset(axi_adrv9001_dac_2_rst),
        .s_axis_data(axi_adrv9001_tx2_dma_m_axis_TDATA),
        .s_axis_ready(axi_adrv9001_tx2_dma_m_axis_TREADY),
        .s_axis_valid(axi_adrv9001_tx2_dma_m_axis_TVALID));
endmodule
