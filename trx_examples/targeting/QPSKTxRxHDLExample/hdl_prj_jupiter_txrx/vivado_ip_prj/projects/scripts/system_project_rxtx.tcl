set start_dir [pwd]
puts "Starting Transceiver Toolbox HDL build"

if {$preprocess == "on"} {
    source $preprocess_script
}

if {![info exists carrier] || $carrier == ""} {
	cd projects/$project/
    set carrier ""
	source ../scripts/adi_make.tcl
} else {
	cd projects/$project/$carrier
	source ../../scripts/adi_make.tcl
}
adi_make::lib all

set ::env(SKIP_SYNTHESIS) 1
set ::env(ADI_USE_OOC_SYNTHESYS) 1
# MATLAB workflows pre-create the Vivado project; skipping create_project is
# only correct in that context. Standalone callers (e.g. the hdl_no_matlab
# pytest) set `matlab off` so adi_project_create actually creates the project.
if {![info exists matlab] || $matlab == "on"} {
    set ::env(MATLAB) 1
}

source ./system_project.tcl

# Update block design to make room for new IP
if {![info exists carrier] || $carrier == ""} {
	source ../scripts/matlab_processors.tcl
} else {
	source ../../scripts/matlab_processors.tcl
}

# if do_preprocess flag does not exist, set it to "on" by default
if {![info exists do_preprocess]} {
	set do_preprocess "on"
}

if {$do_preprocess == "on"} {
	preprocess_bd $project $carrier $ref_design $number_of_inputs $number_of_bits $number_of_valids $multiple
}

if {$postprocess == "on"} {
    cd $start_dir
    source $postprocess_script
}

regenerate_bd_layout
save_bd_design
validate_bd_design

# Back to root
cd $start_dir
