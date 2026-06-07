// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


#include "system_bit_concatenator_shifter_1_sc.h"

#include "system_bit_concatenator_shifter_1_core.h"

#include <map>
#include <string>

system_bit_concatenator_shifter_1_sc::system_bit_concatenator_shifter_1_sc(const sc_core::sc_module_name& nm) : sc_core::sc_module(nm), mp_impl(NULL)
{
  // configure connectivity manager
  xsc::utils::xsc_sim_manager::addInstance("system_bit_concatenator_shifter_1", this);

  // initialize module
    xsc::common_cpp::properties model_param_props;
    model_param_props.addLong("IN0_WIDTH", "16");
    model_param_props.addLong("IN1_WIDTH", "16");
    model_param_props.addLong("IN2_WIDTH", "16");
    model_param_props.addLong("IN3_WIDTH", "16");
    model_param_props.addLong("IN4_WIDTH", "1");
    model_param_props.addLong("IN5_WIDTH", "1");
    model_param_props.addLong("IN6_WIDTH", "1");
    model_param_props.addLong("IN7_WIDTH", "1");
    model_param_props.addLong("IN8_WIDTH", "1");
    model_param_props.addLong("IN9_WIDTH", "1");
    model_param_props.addLong("IN10_WIDTH", "1");
    model_param_props.addLong("IN11_WIDTH", "1");
    model_param_props.addLong("IN12_WIDTH", "1");
    model_param_props.addLong("IN13_WIDTH", "1");
    model_param_props.addLong("IN14_WIDTH", "1");
    model_param_props.addLong("IN15_WIDTH", "1");
    model_param_props.addLong("IN16_WIDTH", "1");
    model_param_props.addLong("IN17_WIDTH", "1");
    model_param_props.addLong("IN18_WIDTH", "1");
    model_param_props.addLong("IN19_WIDTH", "1");
    model_param_props.addLong("IN20_WIDTH", "1");
    model_param_props.addLong("IN21_WIDTH", "1");
    model_param_props.addLong("IN22_WIDTH", "1");
    model_param_props.addLong("IN23_WIDTH", "1");
    model_param_props.addLong("IN24_WIDTH", "1");
    model_param_props.addLong("IN25_WIDTH", "1");
    model_param_props.addLong("IN26_WIDTH", "1");
    model_param_props.addLong("IN27_WIDTH", "1");
    model_param_props.addLong("IN28_WIDTH", "1");
    model_param_props.addLong("IN29_WIDTH", "1");
    model_param_props.addLong("IN30_WIDTH", "1");
    model_param_props.addLong("IN31_WIDTH", "1");
    model_param_props.addLong("IN32_WIDTH", "1");
    model_param_props.addLong("IN33_WIDTH", "1");
    model_param_props.addLong("IN34_WIDTH", "1");
    model_param_props.addLong("IN35_WIDTH", "1");
    model_param_props.addLong("IN36_WIDTH", "1");
    model_param_props.addLong("IN37_WIDTH", "1");
    model_param_props.addLong("IN38_WIDTH", "1");
    model_param_props.addLong("IN39_WIDTH", "1");
    model_param_props.addLong("IN40_WIDTH", "1");
    model_param_props.addLong("IN41_WIDTH", "1");
    model_param_props.addLong("IN42_WIDTH", "1");
    model_param_props.addLong("IN43_WIDTH", "1");
    model_param_props.addLong("IN44_WIDTH", "1");
    model_param_props.addLong("IN45_WIDTH", "1");
    model_param_props.addLong("IN46_WIDTH", "1");
    model_param_props.addLong("IN47_WIDTH", "1");
    model_param_props.addLong("IN48_WIDTH", "1");
    model_param_props.addLong("IN49_WIDTH", "1");
    model_param_props.addLong("IN50_WIDTH", "1");
    model_param_props.addLong("IN51_WIDTH", "1");
    model_param_props.addLong("IN52_WIDTH", "1");
    model_param_props.addLong("IN53_WIDTH", "1");
    model_param_props.addLong("IN54_WIDTH", "1");
    model_param_props.addLong("IN55_WIDTH", "1");
    model_param_props.addLong("IN56_WIDTH", "1");
    model_param_props.addLong("IN57_WIDTH", "1");
    model_param_props.addLong("IN58_WIDTH", "1");
    model_param_props.addLong("IN59_WIDTH", "1");
    model_param_props.addLong("IN60_WIDTH", "1");
    model_param_props.addLong("IN61_WIDTH", "1");
    model_param_props.addLong("IN62_WIDTH", "1");
    model_param_props.addLong("IN63_WIDTH", "1");
    model_param_props.addLong("IN64_WIDTH", "1");
    model_param_props.addLong("IN65_WIDTH", "1");
    model_param_props.addLong("IN66_WIDTH", "1");
    model_param_props.addLong("IN67_WIDTH", "1");
    model_param_props.addLong("IN68_WIDTH", "1");
    model_param_props.addLong("IN69_WIDTH", "1");
    model_param_props.addLong("IN70_WIDTH", "1");
    model_param_props.addLong("IN71_WIDTH", "1");
    model_param_props.addLong("IN72_WIDTH", "1");
    model_param_props.addLong("IN73_WIDTH", "1");
    model_param_props.addLong("IN74_WIDTH", "1");
    model_param_props.addLong("IN75_WIDTH", "1");
    model_param_props.addLong("IN76_WIDTH", "1");
    model_param_props.addLong("IN77_WIDTH", "1");
    model_param_props.addLong("IN78_WIDTH", "1");
    model_param_props.addLong("IN79_WIDTH", "1");
    model_param_props.addLong("IN80_WIDTH", "1");
    model_param_props.addLong("IN81_WIDTH", "1");
    model_param_props.addLong("IN82_WIDTH", "1");
    model_param_props.addLong("IN83_WIDTH", "1");
    model_param_props.addLong("IN84_WIDTH", "1");
    model_param_props.addLong("IN85_WIDTH", "1");
    model_param_props.addLong("IN86_WIDTH", "1");
    model_param_props.addLong("IN87_WIDTH", "1");
    model_param_props.addLong("IN88_WIDTH", "1");
    model_param_props.addLong("IN89_WIDTH", "1");
    model_param_props.addLong("IN90_WIDTH", "1");
    model_param_props.addLong("IN91_WIDTH", "1");
    model_param_props.addLong("IN92_WIDTH", "1");
    model_param_props.addLong("IN93_WIDTH", "1");
    model_param_props.addLong("IN94_WIDTH", "1");
    model_param_props.addLong("IN95_WIDTH", "1");
    model_param_props.addLong("IN96_WIDTH", "1");
    model_param_props.addLong("IN97_WIDTH", "1");
    model_param_props.addLong("IN98_WIDTH", "1");
    model_param_props.addLong("IN99_WIDTH", "1");
    model_param_props.addLong("IN100_WIDTH", "1");
    model_param_props.addLong("IN101_WIDTH", "1");
    model_param_props.addLong("IN102_WIDTH", "1");
    model_param_props.addLong("IN103_WIDTH", "1");
    model_param_props.addLong("IN104_WIDTH", "1");
    model_param_props.addLong("IN105_WIDTH", "1");
    model_param_props.addLong("IN106_WIDTH", "1");
    model_param_props.addLong("IN107_WIDTH", "1");
    model_param_props.addLong("IN108_WIDTH", "1");
    model_param_props.addLong("IN109_WIDTH", "1");
    model_param_props.addLong("IN110_WIDTH", "1");
    model_param_props.addLong("IN111_WIDTH", "1");
    model_param_props.addLong("IN112_WIDTH", "1");
    model_param_props.addLong("IN113_WIDTH", "1");
    model_param_props.addLong("IN114_WIDTH", "1");
    model_param_props.addLong("IN115_WIDTH", "1");
    model_param_props.addLong("IN116_WIDTH", "1");
    model_param_props.addLong("IN117_WIDTH", "1");
    model_param_props.addLong("IN118_WIDTH", "1");
    model_param_props.addLong("IN119_WIDTH", "1");
    model_param_props.addLong("IN120_WIDTH", "1");
    model_param_props.addLong("IN121_WIDTH", "1");
    model_param_props.addLong("IN122_WIDTH", "1");
    model_param_props.addLong("IN123_WIDTH", "1");
    model_param_props.addLong("IN124_WIDTH", "1");
    model_param_props.addLong("IN125_WIDTH", "1");
    model_param_props.addLong("IN126_WIDTH", "1");
    model_param_props.addLong("IN127_WIDTH", "1");
    model_param_props.addLong("dout_width", "65");
    model_param_props.addLong("NUM_PORTS", "5");
    model_param_props.addString("COMPONENT_NAME", "system_bit_concatenator_shifter_1");

  mp_impl = new system_bit_concatenator_shifter_1_core("inst", model_param_props);
}

system_bit_concatenator_shifter_1_sc::~system_bit_concatenator_shifter_1_sc()
{
  xsc::utils::xsc_sim_manager::clean();

  delete mp_impl;
}

