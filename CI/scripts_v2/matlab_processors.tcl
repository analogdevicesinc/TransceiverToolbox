proc preprocess_bd {project carrier rxtx} {

    puts "Preprocessing $project $carrier $rxtx"

    switch $project {
        adrv9361z7035 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Disconnect the ADC PACK pins
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_3]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]

                global dma_config
                # Configure DMA
                if {[info exists dma_config]} {
                    if {$dma_config eq "Packetized"} {
                        set_property -dict [list CONFIG.DMA_DATA_WIDTH_DEST {256} CONFIG.DMA_TYPE_SRC {1} CONFIG.MAX_BYTES_PER_BURST {32768}] [get_bd_cells axi_ad9361_adc_dma]
                        connect_bd_net [get_bd_pins axi_ad9361_adc_dma/s_axis_aclk] [get_bd_pins util_ad9361_divclk/clk_out]
                        connect_bd_net [get_bd_pins util_ad9361_adc_pack/packed_fifo_wr_data] [get_bd_pins axi_ad9361_adc_dma/s_axis_data]
                        connect_bd_net [get_bd_pins axi_ad9361_adc_dma/s_axis_valid] [get_bd_pins util_ad9361_adc_pack/packed_fifo_wr_en]
                    }
                }
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Disconnect the DAC UNPACK pins
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_3]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_valid]

                # Connect fifo valids together
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_1] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_2] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_3] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]

                # Remove data lines where IP will go
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_3]
            }
            switch $carrier {
                ccbob_cmos {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {8}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M07_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M07_ARESETN]
                }
                ccbob_lvds {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {8}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M07_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M07_ARESETN]
                }
                ccbox_lvds {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {6}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M05_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M05_ARESETN]
                }                
                ccfmc_lvds {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {13}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M12_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M12_ARESETN]
                }
                ccpackrf_lvds {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M06_ARESETN]
                }
            }
        }
        adrv9364z7020 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Disconnect the ADC PACK pins
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_3]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Disconnect the DAC PACK pins
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_3]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_valid]

                # Connect fifo valids together
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_1] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_2] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_3] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
            }
            switch $carrier {
                ccbob_cmos {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M06_ARESETN]
                }
                ccbob_lvds {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M06_ARESETN]
                }
                ccbox_lvds {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M06_ARESETN]
                }
            }
        }
        fmcomms2 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Disconnect the ADC PACK pins
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]

                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_3]
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Disconnect the DAC UNPACK pins
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_valid]

                # Connect fifo valids together
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_1] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_2] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]
                connect_bd_net [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_3] [get_bd_pins axi_ad9361_dac_fifo/din_valid_in_0]

                # Remove data lines where IP will go
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_0]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_1]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_2]
                delete_bd_objs [get_bd_nets util_ad9361_dac_upack_fifo_rd_data_3]
            }
            switch $carrier {
                zed {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {12}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M11_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M11_ARESETN]
                }
                zc702 {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {10}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M09_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M09_ARESETN]
                }
                zc706 {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {10}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M09_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M09_ARESETN]
                }
                zcu102 {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {5}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M04_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M04_ARESETN]
                }
            }
        }
        fmcomms5 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
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
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
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
            # Add 1 extra AXI master ports to the interconnect
            set_property -dict [list CONFIG.NUM_MI {11}] [get_bd_cells axi_cpu_interconnect]
            connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M10_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
            connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M10_ARESETN]
        }
        pluto {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Disconnect the ADC PACK pins
                delete_bd_objs [get_bd_nets axi_ad9361_adc_data_i0]
                delete_bd_objs [get_bd_nets axi_ad9361_adc_data_q0]
                # Disconnect valid
                delete_bd_objs [get_bd_nets axi_ad9361_adc_valid_i0]
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Disconnect the DAC UNPACK pins
                delete_bd_objs [get_bd_nets fir_interpolator_channel_0]
                delete_bd_objs [get_bd_nets fir_interpolator_channel_1]
                # Disconnect valid
                #delete_bd_objs [get_bd_nets axi_ad9361_dac_dma_fifo_rd_valid]
            }
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
        }
        adrv9009 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Remove decimators
                delete_bd_objs [get_bd_nets rx_fir_decimator_valid_out_0] [get_bd_nets rx_adrv9009_tpl_core_adc_data_0] [get_bd_nets rx_adrv9009_tpl_core_adc_enable_1] [get_bd_nets rx_adrv9009_tpl_core_adc_valid_2] [get_bd_nets rx_adrv9009_tpl_core_adc_data_2] [get_bd_nets rx_adrv9009_tpl_core_adc_enable_3] [get_bd_nets rx_fir_decimator_enable_out_0] [get_bd_nets rx_adrv9009_tpl_core_adc_data_1] [get_bd_nets rx_fir_decimator_enable_out_2] [get_bd_nets rx_adrv9009_tpl_core_adc_data_3] [get_bd_nets active_2] [get_bd_nets rx_adrv9009_tpl_core_adc_valid_0] [get_bd_nets rx_fir_decimator_data_out_0] [get_bd_nets rx_fir_decimator_enable_out_1] [get_bd_nets rx_fir_decimator_data_out_2] [get_bd_nets rx_fir_decimator_enable_out_3] [get_bd_nets rx_adrv9009_tpl_core_adc_enable_0] [get_bd_nets rx_adrv9009_tpl_core_adc_valid_1] [get_bd_nets rx_fir_decimator_data_out_1] [get_bd_nets rx_adrv9009_tpl_core_adc_enable_2] [get_bd_nets rx_adrv9009_tpl_core_adc_valid_3] [get_bd_nets rx_fir_decimator_data_out_3] [get_bd_cells rx_fir_decimator]

                # Connect the ADC PACK valid signals together
                connect_bd_net [get_bd_pins util_adrv9009_rx_cpack/enable_0] [get_bd_pins util_adrv9009_rx_cpack/enable_1]
                connect_bd_net [get_bd_pins util_adrv9009_rx_cpack/enable_0] [get_bd_pins util_adrv9009_rx_cpack/enable_2]
                connect_bd_net [get_bd_pins util_adrv9009_rx_cpack/enable_0] [get_bd_pins util_adrv9009_rx_cpack/enable_3]
                # Connect enables
                connect_bd_net [get_bd_pins rx_adrv9009_tpl_core/adc_enable_0] [get_bd_pins util_adrv9009_rx_cpack/enable_0]               
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Remove interpolators
                delete_bd_objs [get_bd_nets active_1] [get_bd_nets tx_fir_interpolator_enable_out_0] [get_bd_nets util_adrv9009_tx_upack_fifo_rd_data_1] [get_bd_nets tx_adrv9009_tpl_core_dac_valid_2] [get_bd_nets tx_adrv9009_tpl_core_dac_enable_3] [get_bd_nets tx_fir_interpolator_data_out_3] [get_bd_nets tx_adrv9009_tpl_core_dac_enable_0] [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_data_out_0] [get_bd_nets tx_fir_interpolator_enable_out_1] [get_bd_nets util_adrv9009_tx_upack_fifo_rd_data_2] [get_bd_nets tx_adrv9009_tpl_core_dac_valid_3] [get_bd_nets tx_adrv9009_tpl_core_dac_valid_0] [get_bd_nets tx_adrv9009_tpl_core_dac_enable_1] [get_bd_nets tx_fir_interpolator_data_out_1] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets tx_fir_interpolator_enable_out_2] [get_bd_nets util_adrv9009_tx_upack_fifo_rd_data_3] [get_bd_nets GND_32_dout] [get_bd_nets util_adrv9009_tx_upack_fifo_rd_data_0] [get_bd_nets tx_adrv9009_tpl_core_dac_valid_1] [get_bd_nets tx_adrv9009_tpl_core_dac_enable_2] [get_bd_nets tx_fir_interpolator_data_out_2] [get_bd_nets tx_fir_interpolator_enable_out_3] [get_bd_cells tx_fir_interpolator]

                # Connect enables together
                connect_bd_net [get_bd_pins util_adrv9009_tx_upack/enable_0] [get_bd_pins tx_adrv9009_tpl_core/dac_enable_0]
                connect_bd_net [get_bd_pins util_adrv9009_tx_upack/enable_1] [get_bd_pins tx_adrv9009_tpl_core/dac_enable_1]
                connect_bd_net [get_bd_pins util_adrv9009_tx_upack/enable_2] [get_bd_pins tx_adrv9009_tpl_core/dac_enable_2]
                connect_bd_net [get_bd_pins util_adrv9009_tx_upack/enable_3] [get_bd_pins tx_adrv9009_tpl_core/dac_enable_3]
            }
            switch $carrier {
                zc706 {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {22}] [get_bd_cells axi_cpu_interconnect]

                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    }
                    if {$rxtx == "tx" || $rxtx == "rxtx"} {
                        # Remove valid combiner
                        delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
                    }
                    if {$rxtx == "rxtx"} {
                        # Map all TX clocks to RX
                        delete_bd_objs [get_bd_nets adrv9009_tx_device_clk]

                        connect_bd_net [get_bd_pins axi_adrv9009_tx_jesd/device_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_tx_upack/clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins tx_adrv9009_tpl_core/link_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins axi_adrv9009_dacfifo/dac_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins adrv9009_tx_device_clk_rstgen/slowest_sync_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]

                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_0] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_1] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_2] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_3] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    }
                    if {$rxtx == "tx"} {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_adrv9009_tx_clkgen/clk_0]
                    }
                }
                zcu102 {

                    # RX ONLY
                    # IPCORE_RESETN ->     adrv9009_rx_device_clk_rstgen/peripheral_aresetn
                    # AXI4_LITE_ARESETN -> adrv9009_rx_device_clk_rstgen/peripheral_aresetn
                    # M16_RESET -> adrv9009_rx_device_clk_rstgen/peripheral_aresetn
                    # M16 -> rx_clkgen/clk_0

                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {17}] [get_bd_cells axi_cpu_interconnect]
                    #connect_bd_net [get_bd_pins axi_cpu_interconnect/M16_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
                    #connect_bd_net -net [get_bd_nets axi_adrv9009_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    #connect_bd_net [get_bd_pins sys_rstgen/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M16_ARESETN]

                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    }
                    if {$rxtx == "tx" || $rxtx == "rxtx"} {
                        # Remove valid combiner
                        delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
                    }
                    if {$rxtx == "rxtx"} {
                        # Map all TX clocks to RX
                        delete_bd_objs [get_bd_nets adrv9009_tx_device_clk]

                        connect_bd_net [get_bd_pins axi_adrv9009_tx_jesd/device_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_tx_upack/clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins tx_adrv9009_tpl_core/link_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins axi_adrv9009_dacfifo/dac_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins adrv9009_tx_device_clk_rstgen/slowest_sync_clk] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]

                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_0] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_1] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_2] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                        connect_bd_net [get_bd_pins util_adrv9009_xcvr/tx_clk_3] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    }
                    if {$rxtx == "tx"} {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_adrv9009_tx_clkgen/clk_0]
                    }
                }
            }
        }
        fmcomms8 {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Remove data between TPL and CPACK
                for { set port 0}  {$port < 8} {incr port} {
                    delete_bd_objs [get_bd_nets rx_adrv9009_fmc_tpl_core_adc_data_$port]
                }
                # Remove valid
                delete_bd_objs [get_bd_nets rx_adrv9009_fmc_tpl_core_adc_valid_0]

            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Remove data between TPL and CPACK
                for { set port 0}  {$port < 8} {incr port} {
                    delete_bd_objs [get_bd_nets util_fmc_tx_upack_fifo_rd_data_$port]
                }
            }
            switch $carrier {
                zcu102 {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {14}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net [get_bd_pins axi_cpu_interconnect/M13_ACLK] [get_bd_pins sys_ps8/pl_clk0]
                    connect_bd_net [get_bd_pins axi_cpu_interconnect/M13_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
                    
                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        # connect_bd_net [get_bd_pins axi_cpu_interconnect/M13_ACLK] [get_bd_pins core_clk_d]
                        # connect_bd_net [get_bd_pins core_clk_d_rstgen/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M13_ARESETN]
                    }
                    if {$rxtx == "tx" || $rxtx == "rxtx"} {
                        # Remove valid combiner
                        # delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
                    }
                    if {$rxtx == "tx"} {
                        # connect_bd_net [get_bd_pins axi_cpu_interconnect/M13_ACLK] [get_bd_pins core_clk_c]
                    }
                }                
            }
        }
        adrv9001 {            
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Remove ADC->Pack
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i0]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q0]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i1]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q1]
                # Remove enable aka valid
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_valid_i0]
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Remove UPack->DAC
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_0]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_1]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_2]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_3]
            }
            switch $carrier {                
                zcu102 {                    
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
                    # Connect clock and reset
                    connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins sys_ps8/pl_clk0]
                    connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
                }                
            }
        }
        adrv9371x {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Remove decimator
                delete_bd_objs [get_bd_nets rx_fir_decimator_valid_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_0] [get_bd_nets rx_ad9371_tpl_core_adc_enable_1] [get_bd_nets rx_ad9371_tpl_core_adc_valid_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_2] [get_bd_nets rx_ad9371_tpl_core_adc_enable_3] [get_bd_nets rx_fir_decimator_enable_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_1] [get_bd_nets rx_fir_decimator_enable_out_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_3] [get_bd_nets active_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_0] [get_bd_nets rx_fir_decimator_data_out_0] [get_bd_nets rx_fir_decimator_enable_out_1] [get_bd_nets rx_fir_decimator_data_out_2] [get_bd_nets rx_fir_decimator_enable_out_3] [get_bd_nets rx_ad9371_tpl_core_adc_enable_0] [get_bd_nets rx_ad9371_tpl_core_adc_valid_1] [get_bd_nets rx_fir_decimator_data_out_1] [get_bd_nets rx_ad9371_tpl_core_adc_enable_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_3] [get_bd_nets rx_fir_decimator_data_out_3] [get_bd_cells rx_fir_decimator]

                # Connect the ADC PACK valid signals together
                connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_1]
                connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_2]
                connect_bd_net [get_bd_pins util_ad9371_rx_cpack/enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_3]
            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Remove interpolators
                delete_bd_objs [get_bd_nets active_1] [get_bd_nets tx_fir_interpolator_enable_out_0] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_1] [get_bd_nets tx_ad9371_tpl_core_dac_valid_2] [get_bd_nets tx_ad9371_tpl_core_dac_enable_3] [get_bd_nets tx_fir_interpolator_data_out_3] [get_bd_nets tx_ad9371_tpl_core_dac_enable_0] [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_data_out_0] [get_bd_nets tx_fir_interpolator_enable_out_1] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_2] [get_bd_nets tx_ad9371_tpl_core_dac_valid_3] [get_bd_nets tx_ad9371_tpl_core_dac_valid_0] [get_bd_nets tx_ad9371_tpl_core_dac_enable_1] [get_bd_nets tx_fir_interpolator_data_out_1] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets tx_fir_interpolator_enable_out_2] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_3] [get_bd_nets GND_32_dout] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_0] [get_bd_nets tx_ad9371_tpl_core_dac_valid_1] [get_bd_nets tx_ad9371_tpl_core_dac_enable_2] [get_bd_nets tx_fir_interpolator_data_out_2] [get_bd_nets tx_fir_interpolator_enable_out_3] [get_bd_cells tx_fir_interpolator]

                # Connect the DAC PACK valid signals together
                connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_1] [get_bd_pins util_ad9371_tx_upack/enable_0]
                connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_2] [get_bd_pins util_ad9371_tx_upack/enable_0]
                connect_bd_net [get_bd_pins util_ad9371_tx_upack/enable_3] [get_bd_pins util_ad9371_tx_upack/enable_0]
                connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_0] [get_bd_pins util_ad9371_tx_upack/enable_1]

                # Remove valid combiner
                delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
            }
            if {$rxtx == "rxtx"} {
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
            switch $carrier {
                zc706 {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {22}] [get_bd_cells axi_cpu_interconnect]
                    #connect_bd_net -net [get_bd_nets axi_adrv9009_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M13_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    connect_bd_net [get_bd_pins sys_rstgen/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M21_ARESETN]

                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        connect_bd_net -net [get_bd_nets axi_ad9371_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
                    }
                    if {$rxtx == "tx"} {
                        connect_bd_net -net [get_bd_nets axi_ad9371_tx_clkgen] [get_bd_pins axi_cpu_interconnect/M21_ACLK] [get_bd_pins axi_ad9371_tx_clkgen/clk_0]
                    }
                }
                zcu102 {
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {17}] [get_bd_cells axi_cpu_interconnect]
                    #connect_bd_net -net [get_bd_nets axi_adrv9009_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    connect_bd_net [get_bd_pins sys_rstgen/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M16_ARESETN]
                    
                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        connect_bd_net -net [get_bd_nets axi_ad9371_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_ad9371_rx_clkgen/clk_0]
                    }                    
                    if {$rxtx == "tx"} {
                        # Remove valid combiner
                        delete_bd_objs [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets logic_or_Res] [get_bd_cells logic_or]
                        connect_bd_net -net [get_bd_nets axi_ad9371_tx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_ad9371_tx_clkgen/clk_0]
                    }                    
                }
            }
        }
    }
}
