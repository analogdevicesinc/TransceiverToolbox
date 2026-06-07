set_property SRC_FILE_INFO {cfile:/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/hdl_prj_jupiter_txrx/vivado_ip_prj/vivado_prj.gen/sources_1/bd/system/ip/system_axi_adrv9001_0/system_axi_adrv9001_0_constr.xdc rfile:../../../vivado_prj.gen/sources_1/bd/system/ip/system_axi_adrv9001_0/system_axi_adrv9001_0_constr.xdc id:1 order:LATE scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -quiet -datapath_only -from [get_pins -hierarchical * -filter {NAME=~*i_rx_1_phy/bufdiv_clr_reg/Q}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_rx_1_phy/i_dac_div_clk_rbuf/CLR}] [get_property -min PERIOD [get_clocks -of_objects [get_ports rx1_dclk_in_p_dclk_in]]]
set_property src_info {type:SCOPED_XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -quiet -datapath_only -from [get_pins -hierarchical * -filter {NAME=~*i_tx_1_phy/bufdiv_clr_reg/Q}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_tx_1_phy/i_dac_div_clk_rbuf/CLR}] [get_property -min PERIOD [get_clocks -of_objects [get_ports tx1_dclk_in_p_dclk_in]]]
set_property src_info {type:SCOPED_XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -quiet -datapath_only -from [get_pins -hierarchical * -filter {NAME=~*i_rx_2_phy/bufdiv_clr_reg/Q}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_rx_2_phy/i_dac_div_clk_rbuf/CLR}] [get_property -min PERIOD [get_clocks -of_objects [get_ports rx2_dclk_in_p_dclk_in]]]
set_property src_info {type:SCOPED_XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -quiet -datapath_only -from [get_pins -hierarchical * -filter {NAME=~*i_tx_2_phy/bufdiv_clr_reg/Q}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_tx_2_phy/i_dac_div_clk_rbuf/CLR}] [get_property -min PERIOD [get_clocks -of_objects [get_ports tx2_dclk_in_p_dclk_in]]]
set_property src_info {type:SCOPED_XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_pins -hierarchical * -filter {NAME=~*i_sync/mssi_sync_reg*/C}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_*_phy/mssi_sync_d1_reg/D}] 4.0
set_property src_info {type:SCOPED_XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins -hierarchical * -filter {NAME=~*i_sync/mssi_sync_reg*/C}] -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_*_phy/mssi_sync_d1_reg/D}] 6.0
