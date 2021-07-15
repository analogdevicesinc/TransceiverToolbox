global ref_design
global fpga_board

if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
    # Remove ADC->Pack
    delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i0]
    delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q0]
    delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i1]
    delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q1]
    # Remove enable aka valid
    delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_valid_i0]
}

########################

if {$ref_design eq "Tx" || $ref_design eq "Rx & Tx"} {
    # Remove UPack->DAC
    delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_0]
    delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_1]
    delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_2]
    delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_3]
}

########################

# Connect clock
if {$fpga_board eq "ZCU102"} {



}