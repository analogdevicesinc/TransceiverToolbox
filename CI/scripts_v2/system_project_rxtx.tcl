set start_dir [pwd]
puts "Starting Transceiver Toolbox HDL build"
cd projects/$project/$carrier
source ../../scripts/adi_make.tcl
adi_make::lib all

set ::env(SKIP_SYNTHESIS) 1
set ::env(MATLAB) 1

source ./system_project.tcl

# Update block design to make room for new IP
source ../../scripts/matlab_processors.tcl
preprocess_bd $project $carrier $ref_design

regenerate_bd_layout
save_bd_design
validate_bd_design

# Back to root
cd $start_dir