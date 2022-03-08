# Configure DMA
set_property -dict [list CONFIG.DMA_DATA_WIDTH_DEST {256} CONFIG.DMA_TYPE_SRC {1} CONFIG.MAX_BYTES_PER_BURST {32768}] [get_bd_cells axi_ad9361_adc_dma]
connect_bd_net [get_bd_pins axi_ad9361_adc_dma/s_axis_aclk] [get_bd_pins util_ad9361_divclk/clk_out]
connect_bd_net [get_bd_pins util_ad9361_adc_pack/packed_fifo_wr_data] [get_bd_pins axi_ad9361_adc_dma/s_axis_data]
connect_bd_net [get_bd_pins axi_ad9361_adc_dma/s_axis_valid] [get_bd_pins util_ad9361_adc_pack/packed_fifo_wr_en]