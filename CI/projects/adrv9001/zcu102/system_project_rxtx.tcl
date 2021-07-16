set ad_hdl_dir    	[pwd]
set ad_phdl_dir   	[pwd]
set proj_dir		$ad_hdl_dir/projects/adrv9001/zcu102

#source $ad_hdl_dir/projects/scripts/adi_env.tcl

#source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

#set CMOS_LVDS_N [get_env_param CMOS_LVDS_N 1]
set CMOS_LVDS_N 0

#adi_project adrv9001_zcu102 0 [list \
#  CMOS_LVDS_N $CMOS_LVDS_N \
#]

adi_project_xilinx adrv9001_zcu102 $proj_dir config_rxtx.tcl 0 [list \
    CMOS_LVDS_N $CMOS_LVDS_N \
]

adi_project_files adrv9001_zcu102 [list \
  "system_top.v" \
  "system_constr.xdc"\
  "$ad_hdl_dir/library/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/common/zcu102/zcu102_system_constr.xdc" ]

if {$CMOS_LVDS_N == 0} {
  adi_project_files {} [list \
    "lvds_constr.xdc" \
  ]
} else {
  adi_project_files {} [list \
    "cmos_constr.xdc" \
  ]
}

adi_project_run adrv9001_zcu102

# Copy the boot file to the root directory
file copy -force $proj_dir/boot $ad_hdl_dir/boot