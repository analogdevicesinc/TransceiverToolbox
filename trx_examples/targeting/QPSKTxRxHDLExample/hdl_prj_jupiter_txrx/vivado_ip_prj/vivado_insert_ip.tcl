open_project vivado_prj.xpr
set project {jupiter_sdr}
set ref_design {txrx}
set preprocess {off}
set postprocess {off}
set number_of_inputs {4}
set number_of_bits {16}
set number_of_valids {1}
set multiple {1}
set HDLVerifierAXI {off}
update_ip_catalog -delete_ip {./ipcore/Receiver_ip_v1_0/component.xml} -repo_path {./ipcore} -quiet
update_ip_catalog -add_ip {./ipcore/Receiver_ip_v1_0.zip} -repo_path {./ipcore}
update_ip_catalog
set HDLCODERIPVLNV [get_property VLNV [get_ipdefs -filter {NAME==Receiver_ip && VERSION==1.0}]]
set HDLCODERIPINST Receiver_ip_0
set BDFILEPATH [get_files -quiet system.bd]
open_bd_design $BDFILEPATH
create_bd_cell -type ip -vlnv $HDLCODERIPVLNV $HDLCODERIPINST
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins axi_adrv9001/dac_1_clk]] [get_bd_pins $HDLCODERIPINST/AXI4_Lite_ACLK] [get_bd_pins axi_adrv9001/dac_1_clk]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins tx_rstn_inverter/Res]] [get_bd_pins $HDLCODERIPINST/AXI4_Lite_ARESETN] [get_bd_pins tx_rstn_inverter/Res]
connect_bd_intf_net [get_bd_intf_pins $HDLCODERIPINST/AXI4_Lite] [get_bd_intf_pins axi_hpm0_lpd_interconnect/M07_AXI]
create_bd_addr_seg -range 0x10000 -offset 0x9D000000 [get_bd_addr_spaces sys_ps8/Data] [get_bd_addr_segs $HDLCODERIPINST/AXI4_Lite/reg0] SEG_${HDLCODERIPINST}_reg0
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_output/data_valid_in_rx_0]] [get_bd_pins $HDLCODERIPINST/dut_data_valid_out_rx] [get_bd_pins sync_output/data_valid_in_rx_0]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_input/data_valid_out_rx_0]] [get_bd_pins $HDLCODERIPINST/dut_data_valid_in_rx] [get_bd_pins sync_input/data_valid_out_rx_0]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_output/data_in_rx_0]] [get_bd_pins $HDLCODERIPINST/dut_data_out_0_rx] [get_bd_pins sync_output/data_in_rx_0]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_output/data_in_rx_1]] [get_bd_pins $HDLCODERIPINST/dut_data_out_1_rx] [get_bd_pins sync_output/data_in_rx_1]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_output/data_in_rx_2]] [get_bd_pins $HDLCODERIPINST/dut_data_out_2_rx] [get_bd_pins sync_output/data_in_rx_2]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_output/data_in_rx_3]] [get_bd_pins $HDLCODERIPINST/dut_data_out_3_rx] [get_bd_pins sync_output/data_in_rx_3]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_input/data_out_rx_0]] [get_bd_pins $HDLCODERIPINST/dut_data_in_0_rx] [get_bd_pins sync_input/data_out_rx_0]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins sync_input/data_out_rx_1]] [get_bd_pins $HDLCODERIPINST/dut_data_in_1_rx] [get_bd_pins sync_input/data_out_rx_1]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins axi_adrv9001/dac_1_clk]] [get_bd_pins $HDLCODERIPINST/IPCORE_CLK] [get_bd_pins axi_adrv9001/dac_1_clk]
connect_bd_net -net [get_bd_nets -of_objects [get_bd_pins tx_rstn_inverter/Res]] [get_bd_pins $HDLCODERIPINST/IPCORE_RESETN] [get_bd_pins tx_rstn_inverter/Res]
add_files -norecurse {projects/jupiter_sdr/system_top.v}
update_compile_order -fileset sources_1
validate_bd_design
save_bd_design
add_files -fileset constrs_1 -norecurse projects/jupiter_sdr/system_constr.xdc
close_project
exit
