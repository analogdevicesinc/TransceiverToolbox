global ref_design
global fpga_board

if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
    # Disconnect the ADC PACK pins
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]

    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_2]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_3]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_4]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_5]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_6]
    delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_7]
}

if {$ref_design eq "Tx" || $ref_design eq "Rx & Tx"} {
    # Disconnect the DAC UNPACK pins
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_valid]

    # Connect fifo valids together
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_1] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_2] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_3] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_4] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_5] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_6] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
    connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_7] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]

    # Remove data lines where IP will go
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_0]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_1]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_2]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_3]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_4]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_5]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_6]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_7]
}
