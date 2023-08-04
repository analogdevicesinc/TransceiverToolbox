# ***************************************************************************
# ***************************************************************************
# Copyright 2023 (c) Analog Devices, Inc. All rights reserved.
#
# Each core or library found in this collection may have its own licensing terms.
# The user should keep this in in mind while exploring these cores.
#
# Redistribution and use in source and binary forms,
# with or without modification of this file, are permitted under the terms of either
#  (at the option of the user):
#
#   1. The GNU General Public License version 2 as published by the
#      Free Software Foundation, which can be found in the top level directory, or at:
# https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
#
# OR
#
#   2.  An ADI specific BSD license as noted in the top level directory, or on-line at:
# https://github.com/analogdevicesinc/hdl/blob/dev/LICENSE
#
# ***************************************************************************
# ***************************************************************************

source ../../../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create util_delay
adi_ip_files util_delay [list \
  "util_delay.v" ]

adi_ip_properties_lite util_delay

set cc [ipx::current_core]

foreach {k v} { \
  "DELAY_CYCLES" "Delay Cycles" \
  "DATA_WIDTH" "Data Width" \
  } { \
  set p [ipgui::get_guiparamspec -name $k -component $cc]
#  ipgui::move_param -component $cc -order $i $p -parent $
  set_property -dict [list \
    DISPLAY_NAME $v \
  ] $p
  incr i
}

ipx::save_core [ipx::current_core]
