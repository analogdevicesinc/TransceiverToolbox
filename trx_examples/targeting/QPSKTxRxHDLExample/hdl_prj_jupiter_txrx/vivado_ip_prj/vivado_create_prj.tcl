set_param board.repoPaths [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]
create_project vivado_prj {} -part xczu3eg-sfva625-2-e -force
set_property target_language Verilog [current_project]
set defaultRepoPath {./ipcore}
set_property ip_repo_paths $defaultRepoPath [current_fileset]
update_ip_catalog
set ipList [glob -nocomplain -directory $defaultRepoPath *.zip]
foreach ipCore $ipList {
  set folderList [glob -nocomplain -directory $defaultRepoPath -type d *]
  if {[lsearch -exact $folderList [file rootname $ipCore]] == -1} {
    catch {update_ip_catalog -add_ip $ipCore -repo_path $defaultRepoPath}
  }
}
update_ip_catalog
set project {jupiter_sdr}
set ref_design {txrx}
set preprocess {off}
set postprocess {off}
set number_of_inputs {4}
set number_of_bits {16}
set number_of_valids {1}
set multiple {1}
set HDLVerifierAXI {off}
source vivado_custom_block_design.tcl
# Use global synthesis for this project
set_property synth_checkpoint_mode None [get_files system.bd]
save_bd_design
close_project
exit
