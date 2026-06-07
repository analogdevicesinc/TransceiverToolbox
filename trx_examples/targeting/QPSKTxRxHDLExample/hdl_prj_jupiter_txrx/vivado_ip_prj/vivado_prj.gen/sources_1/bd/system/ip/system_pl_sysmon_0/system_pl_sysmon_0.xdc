# file: system_pl_sysmon_0.xdc
# (c) Copyright 2013 - 2023 AMD, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of AMD, Inc. and is protected under U.S. and
# international copyright and other intellectual property
# laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.


# Input clock periods. These duplicate the values entered for the
#  input clocks. You can use these to time your system
#----------------------------------------------------------------
#create_clock -name s_axi_aclk -period 10.0 [get_ports s_axi_aclk]
set_property PACKAGE_PIN A9 [get_ports vauxp0]
set_property IOSTANDARD ANALOG [get_ports  vauxp0]
set_property PACKAGE_PIN A8 [get_ports vauxn0]
set_property IOSTANDARD ANALOG [get_ports  vauxn0]
set_property PACKAGE_PIN C8 [get_ports vauxp1]
set_property IOSTANDARD ANALOG [get_ports  vauxp1]
set_property PACKAGE_PIN B8 [get_ports vauxn1]
set_property IOSTANDARD ANALOG [get_ports  vauxn1]

set_property PACKAGE_PIN G7 [get_ports vauxp2]
set_property IOSTANDARD ANALOG [get_ports  vauxp2]
set_property PACKAGE_PIN F7 [get_ports vauxn2]
set_property IOSTANDARD ANALOG [get_ports  vauxn2]

set_property PACKAGE_PIN G8 [get_ports vauxp3]
set_property IOSTANDARD ANALOG [get_ports  vauxp3]
set_property PACKAGE_PIN F8 [get_ports vauxn3]
set_property IOSTANDARD ANALOG [get_ports  vauxn3]

set_property PACKAGE_PIN B3 [get_ports vauxp4]
set_property IOSTANDARD ANALOG [get_ports  vauxp4]
set_property PACKAGE_PIN B2 [get_ports vauxn4]
set_property IOSTANDARD ANALOG [get_ports  vauxn4]

set_property PACKAGE_PIN A3 [get_ports vauxp5]
set_property IOSTANDARD ANALOG [get_ports  vauxp5]
set_property PACKAGE_PIN A2 [get_ports vauxn5]
set_property IOSTANDARD ANALOG [get_ports  vauxn5]

set_property PACKAGE_PIN H4 [get_ports vauxp6]
set_property IOSTANDARD ANALOG [get_ports  vauxp6]
set_property PACKAGE_PIN H3 [get_ports vauxn6]
set_property IOSTANDARD ANALOG [get_ports  vauxn6]

set_property PACKAGE_PIN G3 [get_ports vauxp7]
set_property IOSTANDARD ANALOG [get_ports  vauxp7]
set_property PACKAGE_PIN F3 [get_ports vauxn7]
set_property IOSTANDARD ANALOG [get_ports  vauxn7]

set_property PACKAGE_PIN C5 [get_ports vauxp8]
set_property IOSTANDARD ANALOG [get_ports  vauxp8]
set_property PACKAGE_PIN B5 [get_ports vauxn8]
set_property IOSTANDARD ANALOG [get_ports  vauxn8]

set_property PACKAGE_PIN A6 [get_ports vauxp9]
set_property IOSTANDARD ANALOG [get_ports  vauxp9]
set_property PACKAGE_PIN A5 [get_ports vauxn9]
set_property IOSTANDARD ANALOG [get_ports  vauxn9]

set_property PACKAGE_PIN H6 [get_ports vauxp10]
set_property IOSTANDARD ANALOG [get_ports  vauxp10]
set_property PACKAGE_PIN G6 [get_ports vauxn10]
set_property IOSTANDARD ANALOG [get_ports  vauxn10]


set_property LOC SYSMONE4_X0Y0 [get_cells -hier {*inst_sysmon} -filter {NAME =~ *inst_sysmon}]
set_property DONT_TOUCH true [get_cells -hierarchical -filter {NAME =~*/inst_sysmon*}]


