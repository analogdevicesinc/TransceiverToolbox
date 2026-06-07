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


`ifndef if_framelock_v1_0
`define if_framelock_v1_0

package parameter_structs;

  typedef struct packed {
      bit    portEnabled;
      integer    portWidth;
  }portConfig;

  typedef struct packed {
    // <typeName> <LogicalName> = {<enablement>, <width>}
    portConfig s2m_framelock;
    portConfig m2s_framelock;
  }if_framelock_v1_0_port_configuration;

  parameter if_framelock_v1_0_port_configuration if_framelock_v1_0_default_port_configuration = '{s2m_framelock:'{1, -1}, m2s_framelock:'{1, -1}};

endpackage

interface if_framelock_v1_0 #(parameter_structs::if_framelock_v1_0_port_configuration port_configuration)();
  logic [port_configuration.s2m_framelock.portWidth-1:0] s2m_framelock = 0;       // 
  logic s2m_framelock_valid = 0;                                                  // 
  logic [port_configuration.m2s_framelock.portWidth-1:0] m2s_framelock = 0;       // 
  logic m2s_framelock_valid = 0;                                                  // 

  modport MASTER (
    input s2m_framelock, s2m_framelock_valid, 
    output m2s_framelock, m2s_framelock_valid
    );

  modport SLAVE (
    input m2s_framelock, m2s_framelock_valid, 
    output s2m_framelock, s2m_framelock_valid
    );

  modport MONITOR (
    input s2m_framelock, s2m_framelock_valid, m2s_framelock, m2s_framelock_valid
    );

endinterface // if_framelock_v1_0

`endif