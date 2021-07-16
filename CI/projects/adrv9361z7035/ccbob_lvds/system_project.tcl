
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set p_device "xc7z035ifbg676-2L"
adi_project adrv9361z7035_ccbob_lvds
adi_project_files adrv9361z7035_ccbob_lvds [list \
  "$ad_hdl_dir/library/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/adrv9361z7035/common/adrv9361z7035_constr.xdc" \
  "$ad_hdl_dir/projects/adrv9361z7035/common/adrv9361z7035_constr_lvds.xdc" \
  "$ad_hdl_dir/projects/adrv9361z7035/common/ccbob_constr.xdc" \
  "system_top.v" ]

adi_project_run adrv9361z7035_ccbob_lvds
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl

