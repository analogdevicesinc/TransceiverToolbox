global fpga_board

if {[info exists fpga_board]} {
    puts "==========="
    puts $fpga_board
    puts "==========="
} else {
    # Set to something not ZCU102
    set fpga_board "ZYNQ"
}

set prj_carrier $project$carrier

# Define local variables
set cdir [pwd]
set sdk_loc vivado_prj.sdk
set project_system_dir vivado_prj.srcs/sources_1/bd/system

# Build the project
update_compile_order -fileset sources_1
reset_run impl_1
reset_run synth_1
set_property synth_checkpoint_mode Hierarchical [get_files $project_system_dir/system.bd]
export_ip_user_files -of_objects [get_files $project_system_dir/system.bd] -no_script -sync -force -quiet
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# Export the hdf
file delete -force $sdk_loc
file mkdir $sdk_loc
write_hw_platform -fixed -force  -include_bit -file $sdk_loc/system_top.xsa

# Close the Vivado project
close_project

# Create the BOOT.bin
file mkdir $cdir/boot
if {$fpga_board eq "ZCU102"} {
    set vversion [version -short]
    exec xsct $cdir/projects/scripts/fsbl_build_zynqmp.tcl $vversion
    if {[file exist boot/BOOT.BIN] eq 0} {
        puts "ERROR: BOOT.BIN not built"
        return -code error 11
    } else {
        puts "BOOT.BIN built correctly!"
    }

} else {
    exec xsct $cdir/projects/scripts/fsbl_build_zynq.tcl
    if {[file exist boot/BOOT.BIN] eq 0} {
        puts "ERROR: BOOT.BIN not built"
        return -code error 11
    } else {
        puts "BOOT.BIN built correctly!"
    }
}

puts "------------------------------------"
puts "Embedded system build completed."
puts "You may close this shell."
puts "------------------------------------"
exit
