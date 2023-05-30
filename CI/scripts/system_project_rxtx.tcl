set start_dir [pwd]
puts "Starting Transceiver Toolbox HDL build"

if {$preprocess == "on"} {
    source $preprocess_script
}

if {$project == "pluto"} {
	cd projects/$project/
	source ../scripts/adi_make.tcl
} else {
	cd projects/$project/$carrier
	source ../../scripts/adi_make.tcl
}
adi_make::lib all

set ::env(SKIP_SYNTHESIS) 1
set ::env(MATLAB) 1
set ::env(ADI_USE_OOC_SYNTHESYS) 1

source ./system_project.tcl

# Update block design to make room for new IP
if {$project == "pluto"} {
	source ../scripts/matlab_processors.tcl
} else {
	source ../../scripts/matlab_processors.tcl
}
preprocess_bd $project $carrier $ref_design $number_of_inputs $number_of_bits $number_of_valids $multiple

if {$postprocess == "on"} {
    cd $start_dir
    source $postprocess_script
}

regenerate_bd_layout
save_bd_design
validate_bd_design

# Back to root
cd $start_dir
