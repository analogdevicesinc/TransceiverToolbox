global ref_design
global fpga_board
global dma

## Add 1 extra AXI master ports to the interconnect
set_property -dict [list CONFIG.NUM_MI {6}] [get_bd_cells axi_cpu_interconnect]
connect_bd_net [get_bd_pins axi_cpu_interconnect/M05_ACLK] [get_bd_pins axi_ad9361/l_clk]
#connect_bd_net [get_bd_pins axi_cpu_interconnect/M05_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_cpu_interconnect/M05_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]

# Remove filters
#delete_bd_objs [get_bd_cells fir_decimator]
#delete_bd_objs [get_bd_cells fir_interpolator]
delete_bd_objs [get_bd_nets axi_ad9361_adc_valid_i0] [get_bd_nets axi_ad9361_adc_data_i0] [get_bd_nets axi_ad9361_adc_enable_q0] [get_bd_nets rx_fir_decimator_enable_out_1] [get_bd_nets rx_fir_decimator_data_out_1] [get_bd_nets rx_fir_decimator_enable_out_0] [get_bd_nets active_1] [get_bd_nets axi_ad9361_adc_enable_i0] [get_bd_nets rx_fir_decimator_valid_out_0] [get_bd_nets rx_fir_decimator_data_out_0] [get_bd_nets axi_ad9361_adc_valid_q0] [get_bd_nets axi_ad9361_adc_data_q0] [get_bd_cells rx_fir_decimator]
delete_bd_objs [get_bd_nets active_2] [get_bd_nets GND_32_dout] [get_bd_nets axi_ad9361_dac_enable_i0] [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_upack_fifo_rd_data_0] [get_bd_nets tx_fir_interpolator_data_out_0] [get_bd_nets axi_ad9361_dac_valid_q0] [get_bd_nets tx_upack_fifo_rd_data_1] [get_bd_nets axi_ad9361_dac_valid_i0] [get_bd_nets tx_fir_interpolator_enable_out_0] [get_bd_nets axi_ad9361_dac_enable_q0] [get_bd_nets tx_fir_interpolator_enable_out_1] [get_bd_nets tx_fir_interpolator_data_out_1] [get_bd_cells tx_fir_interpolator]
#delete_bd_objs [get_bd_nets fir_decimator_m_axis_data_tvalid] [get_bd_nets fir_decimator_m_axis_data_tdata] [get_bd_nets decim_slice_Dout] [get_bd_cells fir_decimator]
#delete_bd_objs [get_bd_nets axi_ad9361_dac_dma_fifo_rd_valid] [get_bd_nets fir_interpolator_s_axis_data_tready] [get_bd_nets interp_slice_Dout] [get_bd_nets axi_ad9361_dac_valid_i0] [get_bd_cells fir_interpolator]




