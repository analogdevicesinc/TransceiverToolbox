//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Tue May 26 18:58:24 2026
//Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
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
  wire ref_clk;
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

  system system_i
       (.gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .gpio_rx1_enable_in(gpio_rx1_enable_in),
        .gpio_rx2_enable_in(gpio_rx2_enable_in),
        .gpio_t(gpio_t),
        .gpio_tx1_enable_in(gpio_tx1_enable_in),
        .gpio_tx2_enable_in(gpio_tx2_enable_in),
        .mcs_in(mcs_in),
        .mcs_out(mcs_out),
        .mcs_src(mcs_src),
        .mssi_sync(mssi_sync),
        .ref_clk(ref_clk),
        .rx1_dclk_in_n(rx1_dclk_in_n),
        .rx1_dclk_in_p(rx1_dclk_in_p),
        .rx1_enable(rx1_enable),
        .rx1_idata_in_n(rx1_idata_in_n),
        .rx1_idata_in_p(rx1_idata_in_p),
        .rx1_qdata_in_n(rx1_qdata_in_n),
        .rx1_qdata_in_p(rx1_qdata_in_p),
        .rx1_strobe_in_n(rx1_strobe_in_n),
        .rx1_strobe_in_p(rx1_strobe_in_p),
        .rx2_dclk_in_n(rx2_dclk_in_n),
        .rx2_dclk_in_p(rx2_dclk_in_p),
        .rx2_enable(rx2_enable),
        .rx2_idata_in_n(rx2_idata_in_n),
        .rx2_idata_in_p(rx2_idata_in_p),
        .rx2_qdata_in_n(rx2_qdata_in_n),
        .rx2_qdata_in_p(rx2_qdata_in_p),
        .rx2_strobe_in_n(rx2_strobe_in_n),
        .rx2_strobe_in_p(rx2_strobe_in_p),
        .s_0v85_mgtravcc_sns_n(s_0v85_mgtravcc_sns_n),
        .s_0v85_mgtravcc_sns_p(s_0v85_mgtravcc_sns_p),
        .s_1p0_rf_sns_n(s_1p0_rf_sns_n),
        .s_1p0_rf_sns_p(s_1p0_rf_sns_p),
        .s_1p3_rf_sns_n(s_1p3_rf_sns_n),
        .s_1p3_rf_sns_p(s_1p3_rf_sns_p),
        .s_1p8_rf_sns_n(s_1p8_rf_sns_n),
        .s_1p8_rf_sns_p(s_1p8_rf_sns_p),
        .s_1v2_ps_ddr4_sns_n(s_1v2_ps_ddr4_sns_n),
        .s_1v2_ps_ddr4_sns_p(s_1v2_ps_ddr4_sns_p),
        .s_1v2_sns_n(s_1v2_sns_n),
        .s_1v2_sns_p(s_1v2_sns_p),
        .s_1v8_mgtravtt_sns_n(s_1v8_mgtravtt_sns_n),
        .s_1v8_mgtravtt_sns_p(s_1v8_mgtravtt_sns_p),
        .s_2v5_sns_n(s_2v5_sns_n),
        .s_2v5_sns_p(s_2v5_sns_p),
        .s_5v0_rf_sns_n(s_5v0_rf_sns_n),
        .s_5v0_rf_sns_p(s_5v0_rf_sns_p),
        .s_5v0_sns_n(s_5v0_sns_n),
        .s_5v0_sns_p(s_5v0_sns_p),
        .s_vtt_ps_ddr4_sns_n(s_vtt_ps_ddr4_sns_n),
        .s_vtt_ps_ddr4_sns_p(s_vtt_ps_ddr4_sns_p),
        .spi0_csn(spi0_csn),
        .spi0_miso(spi0_miso),
        .spi0_mosi(spi0_mosi),
        .spi0_sclk(spi0_sclk),
        .tx1_dclk_in_n(tx1_dclk_in_n),
        .tx1_dclk_in_p(tx1_dclk_in_p),
        .tx1_dclk_out_n(tx1_dclk_out_n),
        .tx1_dclk_out_p(tx1_dclk_out_p),
        .tx1_enable(tx1_enable),
        .tx1_idata_out_n(tx1_idata_out_n),
        .tx1_idata_out_p(tx1_idata_out_p),
        .tx1_qdata_out_n(tx1_qdata_out_n),
        .tx1_qdata_out_p(tx1_qdata_out_p),
        .tx1_strobe_out_n(tx1_strobe_out_n),
        .tx1_strobe_out_p(tx1_strobe_out_p),
        .tx2_dclk_in_n(tx2_dclk_in_n),
        .tx2_dclk_in_p(tx2_dclk_in_p),
        .tx2_dclk_out_n(tx2_dclk_out_n),
        .tx2_dclk_out_p(tx2_dclk_out_p),
        .tx2_enable(tx2_enable),
        .tx2_idata_out_n(tx2_idata_out_n),
        .tx2_idata_out_p(tx2_idata_out_p),
        .tx2_qdata_out_n(tx2_qdata_out_n),
        .tx2_qdata_out_p(tx2_qdata_out_p),
        .tx2_strobe_out_n(tx2_strobe_out_n),
        .tx2_strobe_out_p(tx2_strobe_out_p),
        .tx_output_enable(tx_output_enable));
endmodule
