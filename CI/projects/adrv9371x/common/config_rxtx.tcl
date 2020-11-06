
global ref_design
global fpga_board

if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
    # Remove decimator
    delete_bd_objs [get_bd_nets rx_fir_decimator_valid_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_0] [get_bd_nets rx_ad9371_tpl_core_adc_enable_1] [get_bd_nets rx_ad9371_tpl_core_adc_valid_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_2] [get_bd_nets rx_ad9371_tpl_core_adc_enable_3] [get_bd_nets rx_fir_decimator_enable_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_1] [get_bd_nets rx_fir_decimator_enable_out_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_3] [get_bd_nets active_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_0] [get_bd_nets rx_fir_decimator_data_out_0] [get_bd_nets rx_fir_decimator_enable_out_1] [get_bd_nets rx_fir_decimator_data_out_2] [get_bd_nets rx_fir_decimator_enable_out_3] [get_bd_nets rx_ad9371_tpl_core_adc_enable_0] [get_bd_nets rx_ad9371_tpl_core_adc_valid_1] [get_bd_nets rx_fir_decimator_data_out_1] [get_bd_nets rx_ad9371_tpl_core_adc_enable_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_3] [get_bd_nets rx_fir_decimator_data_out_3] [get_bd_cells rx_fir_decimator]

    # Connect the ADC PACK valid signals together
    connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_1]
    connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_2]
    connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_3]
}

if {$ref_design eq "Tx" || $ref_design eq "Rx & Tx"} {
    # Remove interpolators
    delete_bd_objs [get_bd_nets active_1] [get_bd_nets tx_fir_interpolator_enable_out_0] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_1] [get_bd_nets tx_ad9371_tpl_core_dac_valid_2] [get_bd_nets tx_ad9371_tpl_core_dac_enable_3] [get_bd_nets tx_fir_interpolator_data_out_3] [get_bd_nets tx_ad9371_tpl_core_dac_enable_0] [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_data_out_0] [get_bd_nets tx_fir_interpolator_enable_out_1] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_2] [get_bd_nets tx_ad9371_tpl_core_dac_valid_3] [get_bd_nets tx_ad9371_tpl_core_dac_valid_0] [get_bd_nets tx_ad9371_tpl_core_dac_enable_1] [get_bd_nets tx_fir_interpolator_data_out_1] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets tx_fir_interpolator_enable_out_2] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_3] [get_bd_nets GND_32_dout] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_0] [get_bd_nets tx_ad9371_tpl_core_dac_valid_1] [get_bd_nets tx_ad9371_tpl_core_dac_enable_2] [get_bd_nets tx_fir_interpolator_data_out_2] [get_bd_nets tx_fir_interpolator_enable_out_3] [get_bd_cells tx_fir_interpolator]

    # Connect the DAC PACK valid signals together
    connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_1] [get_bd_pins util_ad9371_tx_upack/enable_0]
    connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_2] [get_bd_pins util_ad9371_tx_upack/enable_0]
    connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_3] [get_bd_pins util_ad9371_tx_upack/enable_0]
    connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_0] [get_bd_pins util_ad9371_tx_upack/enable_1]
}

# Tie clocks to only use RX clocks
if {$ref_design eq "Rx & Tx"} {
  #delete_bd_objs [get_bd_nets axi_ad9371_tx_clkgen_clk]
  delete_bd_objs [get_bd_nets ad9371_tx_device_clk]

  connect_bd_net [get_bd_pins util_ad9371_xcvr/tx_clk_0] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins util_ad9371_xcvr/tx_clk_1] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins util_ad9371_xcvr/tx_clk_2] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins util_ad9371_xcvr/tx_clk_3] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]

  connect_bd_net [get_bd_pins axi_ad9371_tx_jesd/device_clk] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins util_ad9371_tx_upack/clk] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins ad9371_tx_device_clk_rstgen/slowest_sync_clk] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins axi_ad9371_dacfifo/dac_clk] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
  connect_bd_net [get_bd_pins tx_ad9371_tpl_core/link_clk] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
}
########################
# Connect clock
if {$ref_design eq "Tx" || $ref_design eq "Rx & Tx"} {
    # Remove valid combiner
    delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
}

if {$fpga_board eq "ZC706"} {
    if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
        connect_bd_net -net [get_bd_nets axi_ad9371_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
    }
    if {$ref_design eq "Tx"} {
        connect_bd_net -net [get_bd_nets axi_ad9371_tx_clkgen] [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_ad9371_tx_clkgen/clk_0]
    }
}

if {$fpga_board eq "ZCU102"} {
    if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
        connect_bd_net -net [get_bd_nets axi_ad9371_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
    }
    if {$ref_design eq "Tx"} {
        # Remove valid combiner
        delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
        connect_bd_net -net [get_bd_nets axi_ad9371_tx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_ad9371_tx_clkgen/clk_0]
    }
}


