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

adi_ip_create sync_slow_to_fast
adi_ip_files sync_slow_to_fast [list \
  "sync_slow_to_fast.v" ]

adi_ip_properties_lite sync_slow_to_fast

set cc [ipx::current_core]

foreach {k v} { \
  "DEPTH" "FIFO Depth" \
  "WIDTH" "Data Width" \
  "CONTINUOUS" "Continuous mode" \
  } { \
  set p [ipgui::get_guiparamspec -name $k -component $cc]
#  ipgui::move_param -component $cc -order $i $p -parent $
  set_property -dict [list \
    DISPLAY_NAME $v \
  ] $p
  incr i
}

set_property widget {checkBox} [ipgui::get_guiparamspec -name "CONTINUOUS" -component $cc ]
set_property value true [ipx::get_user_parameters CONTINUOUS -of_objects $cc]
set_property value true [ipx::get_hdl_parameters CONTINUOUS -of_objects $cc]
set_property value_format bool [ipx::get_user_parameters CONTINUOUS -of_objects $cc]
set_property value_format bool [ipx::get_hdl_parameters CONTINUOUS -of_objects $cc]

set_property enablement_dependency {spirit:decode(id('PARAM_VALUE.CONTINUOUS')) == false} [ipx::get_ports *_tick -of_objects $cc]
set_property driver_value 1 [ipx::get_ports in_tick -of_objects $cc]

ipx::save_core $cc
