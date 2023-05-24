set prj_carrier $project$carrier

if {$project == "adrv9361z7035"} {
    set fpga_board "adrv9361"
} elseif {$project == "adrv9364z7020"} {
    set fpga_board "adrv9364"
} else {
    set fpga_board_lc [string tolower $fpga_board]
}
puts "FPGA Board: $fpga_board_lc"

# Verify support files exist
if {![file exists $project_dir/projects/common/boot/$fpga_board_lc/u-boot.elf]} {
    puts "ERROR: Missing u-boot.elf for $fpga_board_lc"
    return
}

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

# Define local variables
set cdir [pwd]
set sdk_loc vivado_prj.sdk
set project_system_dir vivado_prj.srcs/sources_1/bd/system

# Export the hdf
file delete -force $sdk_loc
file mkdir $sdk_loc
write_hw_platform -fixed -force  -include_bit -file $sdk_loc/system_top.xsa

# Close the Vivado project
close_project

# Create the BOOT.bin
file mkdir $cdir/boot
set xsct_script "exec xsct $cdir/projects/scripts/adi_make_boot_bin.tcl"
set arm_tr_frm_elf $cdir/projects/common/boot/bl31.elf
set uboot_elf $cdir/projects/common/boot/$fpga_board_lc/u-boot.elf

set build_args "$sdk_loc/system_top.xsa $uboot_elf $cdir/boot $arm_tr_frm_elf"
puts "Please wait, this may take a few minutes."
eval $xsct_script $build_args
puts "------------------------------------"
puts "Embedded system build completed."
puts "You may close this shell."
puts "------------------------------------"
exit
