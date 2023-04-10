proc connect_interfaces {rxtx hierarchy shift_register synchronizer number_of_inputs number_of_valids number_of_bits delay multiple} {
	set number_of_inputs_total [expr $number_of_inputs + $number_of_valids]
	set number_of_bits_total [expr $number_of_inputs*$number_of_bits + $number_of_valids]
	
	set version ":1.0"
	
	create_bd_cell -type ip -vlnv analog.com:user:$synchronizer$version $hierarchy/${synchronizer}
	set_property -dict [list CONFIG.DEPTH {6}] [get_bd_cells $hierarchy/${synchronizer}]
	set_property CONFIG.WIDTH $number_of_bits_total [get_bd_cells $hierarchy/${synchronizer}]
	if {$multiple != 1} {
		set_property CONFIG.RATIO $multiple [get_bd_cells $hierarchy/${synchronizer}]
	}

	create_bd_cell -type ip -vlnv analog.com:user:$shift_register$version $hierarchy/${shift_register}
	set_property CONFIG.DATA_WIDTH $number_of_bits_total [get_bd_cells $hierarchy/${shift_register}]
	set_property CONFIG.DELAY_CYCLES $delay [get_bd_cells $hierarchy/${shift_register}]

	create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 $hierarchy/bit_concatenator_sync
	set_property CONFIG.NUM_PORTS $number_of_inputs_total [get_bd_cells $hierarchy/bit_concatenator_sync]

	ad_connect $hierarchy/${synchronizer}/in_data $hierarchy/bit_concatenator_sync/dout

	create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 $hierarchy/bit_concatenator_shifter
	set_property CONFIG.NUM_PORTS $number_of_inputs_total [get_bd_cells $hierarchy/bit_concatenator_shifter]

	ad_connect $hierarchy/${shift_register}/din $hierarchy/bit_concatenator_shifter/dout

	# data priority / faster data
	if {$rxtx == "rxtx"} {
		# clocking
		ad_connect $hierarchy/${shift_register}/clk $hierarchy/rx_clk

		# reset
		ad_connect $hierarchy/${shift_register}/rstn $hierarchy/rx_rstn
	} else {
		# clocking
		ad_connect $hierarchy/${shift_register}/clk $hierarchy/tx_clk

		# reset
		ad_connect $hierarchy/${shift_register}/rstn $hierarchy/tx_rstn
	}

	set i 0
	for {} {$i < $number_of_inputs} {incr i} {
		create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 $hierarchy/bit_slicer_rx_${i}
		set_property -dict [list CONFIG.DIN_TO [expr int($i*$number_of_bits)] CONFIG.DIN_FROM [expr int(($i+1)*$number_of_bits-1)] CONFIG.DIN_WIDTH [expr int($number_of_bits_total)]] [get_bd_cells $hierarchy/bit_slicer_rx_${i}]

		create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 $hierarchy/bit_slicer_tx_${i}
		set_property -dict [list CONFIG.DIN_TO [expr int($i*$number_of_bits)] CONFIG.DIN_FROM [expr int(($i+1)*$number_of_bits-1)] CONFIG.DIN_WIDTH [ expr int($number_of_bits_total)]] [get_bd_cells $hierarchy/bit_slicer_tx_${i}]

		set_property CONFIG.IN${i}_WIDTH.VALUE_SRC USER [get_bd_cells $hierarchy/bit_concatenator_sync]
		set_property CONFIG.IN${i}_WIDTH $number_of_bits [get_bd_cells $hierarchy/bit_concatenator_sync]

		set_property CONFIG.IN${i}_WIDTH.VALUE_SRC USER [get_bd_cells $hierarchy/bit_concatenator_shifter]
		set_property CONFIG.IN${i}_WIDTH $number_of_bits [get_bd_cells $hierarchy/bit_concatenator_shifter]

		# data priority / faster data
		if {$rxtx == "rxtx"} {
			# data
			ad_connect $hierarchy/${synchronizer}/out_data $hierarchy/bit_slicer_tx_${i}/Din
			ad_connect $hierarchy/bit_concatenator_sync/In${i} $hierarchy/data_in_tx_${i}
			ad_connect $hierarchy/bit_slicer_tx_${i}/Dout $hierarchy/data_out_tx_${i}

			ad_connect $hierarchy/${shift_register}/dout $hierarchy/bit_slicer_rx_${i}/Din
			ad_connect $hierarchy/bit_concatenator_shifter/In${i} $hierarchy/data_in_rx_${i}
			ad_connect $hierarchy/bit_slicer_rx_${i}/Dout $hierarchy/data_out_rx_${i}
		} else {
			# data
			ad_connect $hierarchy/${synchronizer}/out_data $hierarchy/bit_slicer_rx_${i}/Din
			ad_connect $hierarchy/bit_concatenator_sync/In${i} $hierarchy/data_in_rx_${i}
			ad_connect $hierarchy/bit_slicer_rx_${i}/Dout $hierarchy/data_out_rx_${i}

			ad_connect $hierarchy/${shift_register}/dout $hierarchy/bit_slicer_tx_${i}/Din
			ad_connect $hierarchy/bit_concatenator_shifter/In${i} $hierarchy/data_in_tx_${i}
			ad_connect $hierarchy/bit_slicer_tx_${i}/Dout $hierarchy/data_out_tx_${i}
		}
	}

	for {set j 0} {$i < $number_of_inputs+$number_of_valids} {incr i} {
		create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 $hierarchy/bit_slicer_valid_rx_${j}
		set_property -dict [list CONFIG.DIN_TO [expr int($number_of_inputs*$number_of_bits+$i-$number_of_inputs)] CONFIG.DIN_FROM [expr int($number_of_inputs*$number_of_bits+$i-$number_of_inputs)] CONFIG.DIN_WIDTH [expr int($number_of_bits_total)]] [get_bd_cells $hierarchy/bit_slicer_valid_rx_${j}]

		create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 $hierarchy/bit_slicer_valid_tx_${j}
		set_property -dict [list CONFIG.DIN_TO [expr int($number_of_inputs*$number_of_bits+$i-$number_of_inputs)] CONFIG.DIN_FROM [expr int($number_of_inputs*$number_of_bits+$i-$number_of_inputs)] CONFIG.DIN_WIDTH [expr int($number_of_bits_total)]] [get_bd_cells $hierarchy/bit_slicer_valid_tx_${j}]

		set_property CONFIG.IN${i}_WIDTH.VALUE_SRC USER [get_bd_cells $hierarchy/bit_concatenator_sync]
		set_property CONFIG.IN${i}_WIDTH {1} [get_bd_cells $hierarchy/bit_concatenator_sync]

		set_property CONFIG.IN${i}_WIDTH.VALUE_SRC USER [get_bd_cells $hierarchy/bit_concatenator_shifter]
		set_property CONFIG.IN${i}_WIDTH {1} [get_bd_cells $hierarchy/bit_concatenator_shifter]

		# data priority / faster data
		if {$rxtx == "rxtx"} {
			# data
			ad_connect $hierarchy/${synchronizer}/out_data $hierarchy/bit_slicer_valid_tx_${j}/Din
			ad_connect $hierarchy/bit_concatenator_sync/In${i} $hierarchy/data_valid_in_tx_${j}
			ad_connect $hierarchy/bit_slicer_valid_tx_${j}/Dout $hierarchy/data_valid_out_tx_${j}

			ad_connect $hierarchy/${shift_register}/dout $hierarchy/bit_slicer_valid_rx_${j}/Din
			ad_connect $hierarchy/bit_concatenator_shifter/In${i} $hierarchy/data_valid_in_rx_${j}
			ad_connect $hierarchy/bit_slicer_valid_rx_${j}/Dout $hierarchy/data_valid_out_rx_${j}
		} else {
			# data
			ad_connect $hierarchy/${synchronizer}/out_data $hierarchy/bit_slicer_valid_rx_${j}/Din
			ad_connect $hierarchy/bit_concatenator_sync/In${i} $hierarchy/data_valid_in_rx_${j}
			ad_connect $hierarchy/bit_slicer_valid_rx_${j}/Dout $hierarchy/data_valid_out_rx_${j}

			ad_connect $hierarchy/${shift_register}/dout $hierarchy/bit_slicer_valid_tx_${j}/Din
			ad_connect $hierarchy/bit_concatenator_shifter/In${i} $hierarchy/data_valid_in_tx_${j}
			ad_connect $hierarchy/bit_slicer_valid_tx_${j}/Dout $hierarchy/data_valid_out_tx_${j}
		}

		incr j
	}
}

proc data_synchronizer {rxtx number_of_inputs number_of_bits number_of_valids multiple} {
	set hierarchy sync_input

	create_bd_cell -type hier $hierarchy

	set hierarchy sync_output

	create_bd_cell -type hier $hierarchy

	if {$rxtx != "tx"} {
		set hierarchy sync_input

		create_bd_pin -dir I $hierarchy/rx_clk
		create_bd_pin -dir I $hierarchy/rx_rstn

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			create_bd_pin -dir I -from [expr $number_of_bits-1] -to 0 $hierarchy/data_in_rx_${i}
			create_bd_pin -dir O -from [expr $number_of_bits-1] -to 0 $hierarchy/data_out_rx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			create_bd_pin -dir I $hierarchy/data_valid_in_rx_${i}
			create_bd_pin -dir O $hierarchy/data_valid_out_rx_${i}
		}

		set hierarchy sync_output

		create_bd_pin -dir I $hierarchy/rx_clk
		create_bd_pin -dir I $hierarchy/rx_rstn

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			create_bd_pin -dir I -from [expr $number_of_bits-1] -to 0 $hierarchy/data_in_rx_${i}
			create_bd_pin -dir O -from [expr $number_of_bits-1] -to 0 $hierarchy/data_out_rx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			create_bd_pin -dir I $hierarchy/data_valid_in_rx_${i}
			create_bd_pin -dir O $hierarchy/data_valid_out_rx_${i}
		}
	}
	if {$rxtx != "rx"} {
		set hierarchy sync_input

		create_bd_pin -dir I $hierarchy/tx_clk
		create_bd_pin -dir I $hierarchy/tx_rstn

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			create_bd_pin -dir I -from [expr $number_of_bits-1] -to 0 $hierarchy/data_in_tx_${i}
			create_bd_pin -dir O -from [expr $number_of_bits-1] -to 0 $hierarchy/data_out_tx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			create_bd_pin -dir I $hierarchy/data_valid_in_tx_${i}
			create_bd_pin -dir O $hierarchy/data_valid_out_tx_${i}
		}

		set hierarchy sync_output

		create_bd_pin -dir I $hierarchy/tx_clk
		create_bd_pin -dir I $hierarchy/tx_rstn

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			create_bd_pin -dir I -from [expr $number_of_bits-1] -to 0 $hierarchy/data_in_tx_${i}
			create_bd_pin -dir O -from [expr $number_of_bits-1] -to 0 $hierarchy/data_out_tx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			create_bd_pin -dir I $hierarchy/data_valid_in_tx_${i}
			create_bd_pin -dir O $hierarchy/data_valid_out_tx_${i}
		}
	}
	if {$rxtx == "rx"} {
		set hierarchy sync_input

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			ad_connect $hierarchy/data_in_rx_${i} $hierarchy/data_out_rx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			ad_connect $hierarchy/data_valid_in_rx_${i} $hierarchy/data_valid_out_rx_${i}
		}

		set hierarchy sync_output

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			ad_connect $hierarchy/data_in_rx_${i} $hierarchy/data_out_rx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			ad_connect $hierarchy/data_valid_in_rx_${i} $hierarchy/data_valid_out_rx_${i}
		}
	}
	if {$rxtx == "tx"} {
		set hierarchy sync_input

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			ad_connect $hierarchy/data_in_tx_${i} $hierarchy/data_out_tx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			ad_connect $hierarchy/data_valid_in_tx_${i} $hierarchy/data_valid_out_tx_${i}
		}

		set hierarchy sync_output

		for {set i 0} {$i < $number_of_inputs} {incr i} {
			ad_connect $hierarchy/data_in_tx_${i} $hierarchy/data_out_tx_${i}
		}

		for {set i 0} {$i < $number_of_valids} {incr i} {
			ad_connect $hierarchy/data_valid_in_tx_${i} $hierarchy/data_valid_out_tx_${i}
		}
	}
	if {$rxtx == "rxtx" || $rxtx == "txrx"} {
		# build synchronizer IPs
		exec cp ../../../../../hdl/vendor/AnalogDevices/vivado/quiet.mk ../../../.
		exec make -C ../../../library/util_sync/sync_delay
		exec make -C ../../../library/util_sync/sync_fast_to_slow
		exec make -C ../../../library/util_sync/sync_slow_to_fast
		update_ip_catalog -rebuild

		### synchronize the input

		set hierarchy sync_input

		set shift_register util_delay

		set synchronizer sync_slow_to_fast

		set delay [expr {$multiple+3}]

		#create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 $hierarchy/VCC
		#set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells $hierarchy/VCC]

		connect_interfaces $rxtx $hierarchy $shift_register $synchronizer $number_of_inputs $number_of_valids $number_of_bits $delay 1

		#ad_connect $hierarchy/${synchronizer}/in_tick $hierarchy/VCC/dout

		# data priority / faster data
		if {$rxtx == "rxtx"} {
			# clocking
			ad_connect $hierarchy/${synchronizer}/in_clk $hierarchy/tx_clk
			ad_connect $hierarchy/${synchronizer}/out_clk $hierarchy/rx_clk

			# reset
			ad_connect $hierarchy/${synchronizer}/in_resetn $hierarchy/tx_rstn
			ad_connect $hierarchy/${synchronizer}/out_resetn $hierarchy/rx_rstn
		} else {
			# clocking
			ad_connect $hierarchy/${synchronizer}/in_clk $hierarchy/rx_clk
			ad_connect $hierarchy/${synchronizer}/out_clk $hierarchy/tx_clk

			# reset
			ad_connect $hierarchy/${synchronizer}/in_resetn $hierarchy/rx_rstn
			ad_connect $hierarchy/${synchronizer}/out_resetn $hierarchy/tx_rstn
		}

		### synchronize the output

		set hierarchy sync_output

		if {$multiple==1} {
			#create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 $hierarchy/VCC
			#set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells $hierarchy/VCC]
		} else {
			set synchronizer sync_fast_to_slow

			if {$multiple>3} {
				set delay [expr {$multiple-2}]
			} else {
				set delay [expr {($multiple-1)*2}]
			}
		}
		
		connect_interfaces $rxtx $hierarchy $shift_register $synchronizer $number_of_inputs $number_of_valids $number_of_bits $delay $multiple

		#if {$multiple==1} {
			#ad_connect $hierarchy/${synchronizer}/in_tick $hierarchy/VCC/dout
		#}

		# data priority / faster data
		if {$rxtx == "rxtx"} {
			# clocking
			ad_connect $hierarchy/${synchronizer}/in_clk $hierarchy/rx_clk
			ad_connect $hierarchy/${synchronizer}/out_clk $hierarchy/tx_clk

			# reset
			ad_connect $hierarchy/${synchronizer}/in_resetn $hierarchy/rx_rstn
			ad_connect $hierarchy/${synchronizer}/out_resetn $hierarchy/tx_rstn
		} else {
			# clocking
			ad_connect $hierarchy/${synchronizer}/in_clk $hierarchy/tx_clk
			ad_connect $hierarchy/${synchronizer}/out_clk $hierarchy/rx_clk

			# reset
			ad_connect $hierarchy/${synchronizer}/in_resetn $hierarchy/tx_rstn
			ad_connect $hierarchy/${synchronizer}/out_resetn $hierarchy/rx_rstn
		}
	}
}

proc preprocess_bd {project carrier rxtx number_of_inputs number_of_bits number_of_valids multiple} {

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
					set_property -dict [list CONFIG.NUM_CLKS {2}] [get_bd_cells axi_cpu_interconnect]
                    set_property -dict [list CONFIG.NUM_MI {17}] [get_bd_cells axi_cpu_interconnect]
                    #connect_bd_net [get_bd_pins axi_cpu_interconnect/M16_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
                    #connect_bd_net -net [get_bd_nets axi_adrv9009_rx_clkgen] [get_bd_pins axi_cpu_interconnect/M16_ACLK] [get_bd_pins axi_adrv9009_rx_clkgen/clk_0]
                    #connect_bd_net [get_bd_pins sys_rstgen/interconnect_aresetn] [get_bd_pins axi_cpu_interconnect/M16_ARESETN]

                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
						connect_bd_net [get_bd_pins axi_cpu_interconnect/aclk1] [get_bd_pins util_adrv9009_xcvr/rx_out_clk_0]
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
            if {$rxtx != "tx"} {
                # Remove ADC->Pack
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i0]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q0]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_i1]
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_data_q1]
                # Remove enable aka valid
                delete_bd_objs [get_bd_nets axi_adrv9001_adc_1_valid_i0]
            }
            if {$rxtx != "rx"} {
                # Remove UPack->DAC
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_0]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_1]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_2]
                delete_bd_objs [get_bd_nets util_dac_1_upack_fifo_rd_data_3]
				# Remove enable aka valid
				delete_bd_objs [get_bd_nets axi_adrv9001_dac_1_valid_i0]
            }
            switch $carrier {
                zcu102 {
					# Create and connect synchronizers
					data_synchronizer $rxtx $number_of_inputs $number_of_bits $number_of_valids $multiple
					
                    # Add 1 extra AXI master ports to the interconnect
                    set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
					
					create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 rx_rstn_inverter
					set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells rx_rstn_inverter]
					
					ad_connect axi_adrv9001/adc_1_rst rx_rstn_inverter/Op1
					
					create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 tx_rstn_inverter
					set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells tx_rstn_inverter]
					
					ad_connect axi_adrv9001/dac_1_rst tx_rstn_inverter/Op1
					
                    # Connect clock and reset
                    if {$rxtx == "rx" || $rxtx == "rxtx"} {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins axi_adrv9001/adc_1_clk]
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ARESETN] [get_bd_pins rx_rstn_inverter/Res]
					} else {
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins axi_adrv9001/dac_1_clk]
                        connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ARESETN] [get_bd_pins tx_rstn_inverter/Res]
					}
					if {$rxtx != "tx"} {
						# clock and reset
						connect_bd_net [get_bd_pins axi_adrv9001/adc_1_clk] [get_bd_pins sync_input/rx_clk]
						connect_bd_net [get_bd_pins rx_rstn_inverter/Res] [get_bd_pins sync_input/rx_rstn]
						connect_bd_net [get_bd_pins axi_adrv9001/adc_1_clk] [get_bd_pins sync_output/rx_clk]
						connect_bd_net [get_bd_pins rx_rstn_inverter/Res] [get_bd_pins sync_output/rx_rstn]
						# sync input connections
						connect_bd_net [get_bd_pins sync_input/data_in_rx_0] [get_bd_pins axi_adrv9001/adc_1_data_i0]
						connect_bd_net [get_bd_pins sync_input/data_in_rx_1] [get_bd_pins axi_adrv9001/adc_1_data_i1]
						connect_bd_net [get_bd_pins sync_input/data_in_rx_2] [get_bd_pins axi_adrv9001/adc_1_data_q0]
						connect_bd_net [get_bd_pins sync_input/data_in_rx_3] [get_bd_pins axi_adrv9001/adc_1_data_q1]
						connect_bd_net [get_bd_pins sync_input/data_valid_in_rx_0] [get_bd_pins axi_adrv9001/adc_1_valid_i0]
						# sync ouput connections
						connect_bd_net [get_bd_pins sync_output/data_out_rx_0] [get_bd_pins util_adc_1_pack/fifo_wr_data_0]
						connect_bd_net [get_bd_pins sync_output/data_out_rx_1] [get_bd_pins util_adc_1_pack/fifo_wr_data_1]
						connect_bd_net [get_bd_pins sync_output/data_out_rx_2] [get_bd_pins util_adc_1_pack/fifo_wr_data_2]
						connect_bd_net [get_bd_pins sync_output/data_out_rx_3] [get_bd_pins util_adc_1_pack/fifo_wr_data_3]
						connect_bd_net [get_bd_pins sync_output/data_valid_out_rx_0] [get_bd_pins util_adc_1_pack/fifo_wr_en]
					}
					if {$rxtx != "rx"} {
						# clock and reset
						connect_bd_net [get_bd_pins axi_adrv9001/dac_1_clk] [get_bd_pins sync_input/tx_clk]
						connect_bd_net [get_bd_pins tx_rstn_inverter/Res] [get_bd_pins sync_input/tx_rstn]
						connect_bd_net [get_bd_pins axi_adrv9001/dac_1_clk] [get_bd_pins sync_output/tx_clk]
						connect_bd_net [get_bd_pins tx_rstn_inverter/Res] [get_bd_pins sync_output/tx_rstn]
						# sync input connections
						connect_bd_net [get_bd_pins sync_input/data_in_tx_0] [get_bd_pins util_dac_1_upack/fifo_rd_data_0]
						connect_bd_net [get_bd_pins sync_input/data_in_tx_1] [get_bd_pins util_dac_1_upack/fifo_rd_data_1]
						connect_bd_net [get_bd_pins sync_input/data_in_tx_2] [get_bd_pins util_dac_1_upack/fifo_rd_data_2]
						connect_bd_net [get_bd_pins sync_input/data_in_tx_3] [get_bd_pins util_dac_1_upack/fifo_rd_data_3]
						connect_bd_net [get_bd_pins sync_input/data_valid_in_tx_0] [get_bd_pins axi_adrv9001/dac_1_valid_i0]
						# sync ouput connections
						connect_bd_net [get_bd_pins sync_output/data_out_tx_0] [get_bd_pins axi_adrv9001/dac_1_data_i0]
						connect_bd_net [get_bd_pins sync_output/data_out_tx_1] [get_bd_pins axi_adrv9001/dac_1_data_i1]
						connect_bd_net [get_bd_pins sync_output/data_out_tx_2] [get_bd_pins axi_adrv9001/dac_1_data_q0]
						connect_bd_net [get_bd_pins sync_output/data_out_tx_3] [get_bd_pins axi_adrv9001/dac_1_data_q1]
						connect_bd_net [get_bd_pins sync_output/data_valid_out_tx_0] [get_bd_pins util_dac_1_upack/fifo_rd_en]
					}
                }
            }
        }
        adrv9371x {
            if {$rxtx == "rx" || $rxtx == "rxtx"} {
                # Remove decimator
                delete_bd_objs [get_bd_nets rx_fir_decimator_valid_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_0] [get_bd_nets rx_ad9371_tpl_core_adc_enable_1] [get_bd_nets rx_ad9371_tpl_core_adc_valid_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_2] [get_bd_nets rx_ad9371_tpl_core_adc_enable_3] [get_bd_nets rx_fir_decimator_enable_out_0] [get_bd_nets rx_ad9371_tpl_core_adc_data_1] [get_bd_nets rx_fir_decimator_enable_out_2] [get_bd_nets rx_ad9371_tpl_core_adc_data_3] [get_bd_nets active_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_0] [get_bd_nets rx_fir_decimator_data_out_0] [get_bd_nets rx_fir_decimator_enable_out_1] [get_bd_nets rx_fir_decimator_data_out_2] [get_bd_nets rx_fir_decimator_enable_out_3] [get_bd_nets rx_ad9371_tpl_core_adc_enable_0] [get_bd_nets rx_ad9371_tpl_core_adc_valid_1] [get_bd_nets rx_fir_decimator_data_out_1] [get_bd_nets rx_ad9371_tpl_core_adc_enable_2] [get_bd_nets rx_ad9371_tpl_core_adc_valid_3] [get_bd_nets rx_fir_decimator_data_out_3] [get_bd_cells rx_fir_decimator]

                # Connect the TPL enables to pack enables
                connect_bd_net [get_bd_pins rx_ad9371_tpl_core/adc_enable_0] [get_bd_pins util_ad9371_rx_cpack/enable_0]
                connect_bd_net [get_bd_pins rx_ad9371_tpl_core/adc_enable_1] [get_bd_pins util_ad9371_rx_cpack/enable_1]
                connect_bd_net [get_bd_pins rx_ad9371_tpl_core/adc_enable_2] [get_bd_pins util_ad9371_rx_cpack/enable_2]
                connect_bd_net [get_bd_pins rx_ad9371_tpl_core/adc_enable_3] [get_bd_pins util_ad9371_rx_cpack/enable_3]


            }
            if {$rxtx == "tx" || $rxtx == "rxtx"} {
                # Remove interpolators
                delete_bd_objs [get_bd_nets active_1] [get_bd_nets tx_fir_interpolator_enable_out_0] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_1] [get_bd_nets tx_ad9371_tpl_core_dac_valid_2] [get_bd_nets tx_ad9371_tpl_core_dac_enable_3] [get_bd_nets tx_fir_interpolator_data_out_3] [get_bd_nets tx_ad9371_tpl_core_dac_enable_0] [get_bd_nets tx_fir_interpolator_valid_out_0] [get_bd_nets tx_fir_interpolator_data_out_0] [get_bd_nets tx_fir_interpolator_enable_out_1] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_2] [get_bd_nets tx_ad9371_tpl_core_dac_valid_3] [get_bd_nets tx_ad9371_tpl_core_dac_valid_0] [get_bd_nets tx_ad9371_tpl_core_dac_enable_1] [get_bd_nets tx_fir_interpolator_data_out_1] [get_bd_nets tx_fir_interpolator_valid_out_2] [get_bd_nets tx_fir_interpolator_enable_out_2] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_3] [get_bd_nets GND_32_dout] [get_bd_nets util_ad9371_tx_upack_fifo_rd_data_0] [get_bd_nets tx_ad9371_tpl_core_dac_valid_1] [get_bd_nets tx_ad9371_tpl_core_dac_enable_2] [get_bd_nets tx_fir_interpolator_data_out_2] [get_bd_nets tx_fir_interpolator_enable_out_3] [get_bd_cells tx_fir_interpolator]

                # Connect the TPL enables to pack enables
                connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_0] [get_bd_pins util_ad9371_tx_upack/enable_0]
                connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_1] [get_bd_pins util_ad9371_tx_upack/enable_1]
                connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_2] [get_bd_pins util_ad9371_tx_upack/enable_2]
                connect_bd_net [get_bd_pins tx_ad9371_tpl_core/dac_enable_3] [get_bd_pins util_ad9371_tx_upack/enable_3]

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
