global ref_design
global fpga_board
global dma

## Add System Reset IP
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0
endgroup
connect_bd_net [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins sys_rstgen/peripheral_aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins axi_ad9361/l_clk]

## Add 1 extra AXI master ports to the interconnect
set_property -dict [list CONFIG.NUM_MI {6}] [get_bd_cells axi_cpu_interconnect]
connect_bd_net [get_bd_pins axi_cpu_interconnect/M05_ACLK] [get_bd_pins axi_ad9361/l_clk]
connect_bd_net [get_bd_pins axi_cpu_interconnect/M05_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]

# Remove filters
#delete_bd_objs [get_bd_cells fir_decimator]
#delete_bd_objs [get_bd_cells fir_interpolator]
delete_bd_objs [get_bd_nets fir_decimator_m_axis_data_tvalid] [get_bd_nets fir_decimator_m_axis_data_tdata] [get_bd_nets decim_slice_Dout] [get_bd_cells fir_decimator]
delete_bd_objs [get_bd_nets axi_ad9361_dac_dma_fifo_rd_valid] [get_bd_nets fir_interpolator_s_axis_data_tready] [get_bd_nets interp_slice_Dout] [get_bd_nets axi_ad9361_dac_valid_i0] [get_bd_cells fir_interpolator]

# Configure DMA
#if {$dma eq "Packetized"} {
#    set_property -dict [list CONFIG.DMA_DATA_WIDTH_SRC {32} CONFIG.DMA_DATA_WIDTH_DEST {256} CONFIG.SYNC_TRANSFER_START {false} CONFIG.DMA_AXI_PROTOCOL_DEST {0} CONFIG.DMA_TYPE_SRC {1} CONFIG.MAX_BYTES_PER_BURST {32768}] [get_bd_cells axi_ad9361_adc_dma]
#    connect_bd_net [get_bd_pins axi_ad9361_adc_dma/s_axis_aclk] [get_bd_pins axi_ad9361/l_clk]
#}

## Insert pack cores
startgroup
create_bd_cell -type ip -vlnv analog.com:user:util_cpack2:1.0 util_cpack_0
endgroup
set_property -dict [list CONFIG.NUM_OF_CHANNELS {2}] [get_bd_cells util_cpack_0]

# Clocks and resets
connect_bd_net [get_bd_pins util_cpack_0/clk] [get_bd_pins axi_ad9361/l_clk]
connect_bd_net [get_bd_pins util_cpack_0/reset] [get_bd_pins proc_sys_reset_0/peripheral_reset]

## Connect enables
connect_bd_net [get_bd_pins axi_ad9361/adc_enable_i0] [get_bd_pins util_cpack_0/enable_0]
connect_bd_net [get_bd_pins axi_ad9361/adc_enable_q0] [get_bd_pins util_cpack_0/enable_1]


############ DMA MODE
#if {$dma eq "Packetized"} {
#    # Packetized DMA
#    connect_bd_net [get_bd_pins util_cpack_0/adc_data] [get_bd_pins axi_ad9361_adc_dma/s_axis_data]
#    connect_bd_net [get_bd_pins util_cpack_0/adc_valid] [get_bd_pins axi_ad9361_adc_dma/s_axis_valid]
#} else {
#    # FIFO DMA
    connect_bd_net [get_bd_pins util_cpack_0/packed_fifo_wr_en] [get_bd_pins axi_ad9361_adc_dma/fifo_wr_en]
    connect_bd_net [get_bd_pins axi_ad9361_adc_dma/fifo_wr_din] [get_bd_pins util_cpack_0/packed_fifo_wr_data]
#}

###### UnPack
startgroup
create_bd_cell -type ip -vlnv analog.com:user:util_upack2:1.0 util_upack_0
endgroup
set_property -dict [list CONFIG.NUM_OF_CHANNELS {2}] [get_bd_cells util_upack_0]

## Connect data
connect_bd_net [get_bd_pins util_upack_0/fifo_rd_data_0] [get_bd_pins axi_ad9361/dac_data_i0]
connect_bd_net [get_bd_pins util_upack_0/fifo_rd_data_1] [get_bd_pins axi_ad9361/dac_data_q0]
connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_dout] [get_bd_pins util_upack_0/s_axis_data]

## Connect Clock
connect_bd_net [get_bd_pins util_upack_0/clk] [get_bd_pins axi_ad9361/clk]
## Valid from pack to DMA
connect_bd_net [get_bd_pins util_upack_0/fifo_rd_valid] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_en]

# 
#connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid] [get_bd_pins util_upack_0/dac_valid_0]
#connect_bd_net [get_bd_pins util_upack_0/dac_valid_1] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid]

# Input valids
connect_bd_net [get_bd_pins axi_ad9361/dac_valid_i0] [get_bd_pins util_upack_0/enable_0]
connect_bd_net [get_bd_pins axi_ad9361/dac_valid_q0] [get_bd_pins util_upack_0/enable_1]
connect_bd_net [get_bd_pins util_upack_0/s_axis_valid] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid]

# Reset
connect_bd_net [get_bd_pins util_upack_0/reset] [get_bd_pins proc_sys_reset_0/peripheral_reset]

#connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid] [get_bd_pins util_upack_0/dac_enable_0]
#connect_bd_net [get_bd_pins util_upack_0/dac_valid_0] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid]
#connect_bd_net [get_bd_pins util_upack_0/dac_valid_1] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid]
#connect_bd_net [get_bd_pins util_upack_0/dac_enable_1] [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid]


