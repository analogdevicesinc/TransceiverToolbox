set start_dir [pwd]
puts "Starting Transceiver Toolbox HDL build"

# hdl_2026_r1's adi_env.tcl uses a global variable named carrier. Preserve
# the MATLAB reference-design values before the project scripts are sourced.
set mw_project $project
set mw_carrier $carrier
set mw_ref_design $ref_design
set mw_number_of_inputs $number_of_inputs
set mw_number_of_bits $number_of_bits
set mw_number_of_valids $number_of_valids
set mw_multiple $multiple

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
set mw_libs {}
foreach mw_lib [adi_make::get_libraries] {
	# Corundum is optional and requires a separate checkout that the toolbox
	# does not ship or enable for MATLAB targeting builds.
	if {[string match "corundum*" $mw_lib]} {
		puts "Skipping optional corundum library: $mw_lib"
		continue
	}
	lappend mw_libs $mw_lib
}
adi_make::lib $mw_libs

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
preprocess_bd $mw_project $mw_carrier $mw_ref_design $mw_number_of_inputs $mw_number_of_bits $mw_number_of_valids $mw_multiple

if {$postprocess == "on"} {
    cd $start_dir
    source $postprocess_script
}

regenerate_bd_layout
save_bd_design
validate_bd_design

# Back to root
cd $start_dir
