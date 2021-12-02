proc preprocess_bd {project carrier rxtx} {

    puts "Preprocessing $project $carrier $rxtx"

    switch $project {
        fmcomms2 {
            switch $carrier {
                zed {
                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]
                        delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
                        delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
                        delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_2]
                        delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_3]
                    }
                    if {$rxtx == "tx" || $rxtx == "rxtx"} {
                        delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_dout_data_0]
                        delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_dout_data_1]
                        delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_dout_data_2]
                        delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_dout_data_3]
                    }
                    set_property -dict [list CONFIG.NUM_MI {12}] [get_bd_cells axi_cpu_interconnect]
                    connect_bd_net -net [get_bd_nets util_ad9361_divclk_clk_out] [get_bd_pins axi_cpu_interconnect/M11_ACLK] [get_bd_pins util_ad9361_divclk/clk_out]
                    connect_bd_net [get_bd_pins util_ad9361_divclk_reset/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M11_ARESETN]
                }
            }
        }

    }
}
