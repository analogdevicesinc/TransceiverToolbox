set ad_hdl_dir    	[pwd]

#### Move files
file rename -force $ad_hdl_dir/hdl/vendor/AnalogDevices/vivado/scripts $ad_hdl_dir/scripts
file rename -force $ad_hdl_dir/hdl/vendor/AnalogDevices/vivado/projects $ad_hdl_dir/projects
file rename -force $ad_hdl_dir/hdl/vendor/AnalogDevices/vivado/library $ad_hdl_dir/library
file copy -force $ad_hdl_dir/trx_examples/targeting/frequency-hopping/ccfmc_lvds_hop/system_top.v $ad_hdl_dir/projects/adrv9361z7035/ccfmc_lvds/system_top.v
set f [open $ad_hdl_dir/projects/adrv9361z7035/ccfmc_lvds/system_bd.tcl "a"]
puts $f "create_bd_port -dir O gpio_en_agc"
puts $f "create_bd_port -from 0 -to 7 -dir I gpio_status"
puts $f "create_bd_port -from 0 -to 3 -dir O gpio_ctl"
close $f