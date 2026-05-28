# rebuild_patched.tcl
# Re-synth + impl + bitstream using patched Verilog source.
# Resets ALL synth runs (including OOC IP synth) to force re-synthesis
# with the new Loop_Filter_block.v gain coefficient.

open_project vivado_prj.xpr

# Disable auto-incremental (forces full re-synth on next launch)
set_property AUTO_INCREMENTAL_CHECKPOINT 0 [get_runs synth_1]
set_property AUTO_INCREMENTAL_CHECKPOINT 0 [get_runs impl_1]

# Reset every synth run (top + OOC IP synth runs)
foreach r [get_runs *synth*] {
    puts "resetting run: $r"
    catch { reset_run $r }
}
catch { reset_run impl_1 }

# Sync IP user files
update_compile_order -fileset sources_1
export_ip_user_files -of_objects [get_files vivado_prj.srcs/sources_1/bd/system/system.bd] -no_script -sync -force -quiet

# Re-run
launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

puts "=== rebuild complete ==="
