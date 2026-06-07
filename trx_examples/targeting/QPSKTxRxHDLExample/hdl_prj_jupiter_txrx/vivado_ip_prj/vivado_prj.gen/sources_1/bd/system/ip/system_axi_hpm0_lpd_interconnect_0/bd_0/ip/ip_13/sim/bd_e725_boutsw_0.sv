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


// IP VLNV: xilinx.com:ip:sc_switchboard:1.0
// IP Revision: 8

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_e725_boutsw_0 (
  aclk,
  aclken,
  s_sc_send,
  s_sc_req,
  s_sc_info,
  s_sc_payld,
  s_sc_recv,
  m_sc_recv,
  m_sc_send,
  m_sc_req,
  m_sc_info,
  m_sc_payld
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, ASSOCIATED_BUSIF M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC:S00_SC:S01_SC:S02_SC:S03_SC:S04_SC:S05_SC:S06_SC:S07_SC:S08_SC:S09_SC:S10_SC:S11_SC:S12_SC:S13_SC:S14_SC:S15_SC, INSERT_VIP 0" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 aclken CE" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclken, POLARITY ACTIVE_LOW" *)
input wire aclken;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 S00_SC SEND [0:0] [0:0], xilinx.com:interface:sc:1.0 S01_SC SEND [0:0] [1:1], xilinx.com:interface:sc:1.0 S02_SC SEND [0:0] [2:2], xilinx.com:interface:sc:1.0 S03_SC SEND [0:0] [3:3], xilinx.com:interface:sc:1.0 S04_SC SEND [0:0] [4:4], xilinx.com:interface:sc:1.0 S05_SC SEND [0:0] [5:5], xilinx.com:interface:sc:1.0 S06_SC SEND [0:0] [6:6], xilinx.com:interface:sc:1.0 S07_SC SEND [0:0] [7:7]" *)
(* X_INTERFACE_MODE = "slave S00_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S01_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S02_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S02_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S03_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S03_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S04_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S04_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S05_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S05_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S06_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S06_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
(* X_INTERFACE_MODE = "slave S07_SC" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S07_SC, BRIDGES M00_SC:M01_SC:M02_SC:M03_SC:M04_SC:M05_SC:M06_SC:M07_SC:M08_SC:M09_SC:M10_SC:M11_SC:M12_SC:M13_SC:M14_SC:M15_SC" *)
input wire [7 : 0] s_sc_send;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 S00_SC REQ [0:0] [0:0], xilinx.com:interface:sc:1.0 S01_SC REQ [0:0] [1:1], xilinx.com:interface:sc:1.0 S02_SC REQ [0:0] [2:2], xilinx.com:interface:sc:1.0 S03_SC REQ [0:0] [3:3], xilinx.com:interface:sc:1.0 S04_SC REQ [0:0] [4:4], xilinx.com:interface:sc:1.0 S05_SC REQ [0:0] [5:5], xilinx.com:interface:sc:1.0 S06_SC REQ [0:0] [6:6], xilinx.com:interface:sc:1.0 S07_SC REQ [0:0] [7:7]" *)
input wire [7 : 0] s_sc_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 S00_SC INFO [0:0] [0:0], xilinx.com:interface:sc:1.0 S01_SC INFO [0:0] [1:1], xilinx.com:interface:sc:1.0 S02_SC INFO [0:0] [2:2], xilinx.com:interface:sc:1.0 S03_SC INFO [0:0] [3:3], xilinx.com:interface:sc:1.0 S04_SC INFO [0:0] [4:4], xilinx.com:interface:sc:1.0 S05_SC INFO [0:0] [5:5], xilinx.com:interface:sc:1.0 S06_SC INFO [0:0] [6:6], xilinx.com:interface:sc:1.0 S07_SC INFO [0:0] [7:7]" *)
input wire [7 : 0] s_sc_info;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 S00_SC PAYLD [8:0] [8:0], xilinx.com:interface:sc:1.0 S01_SC PAYLD [8:0] [17:9], xilinx.com:interface:sc:1.0 S02_SC PAYLD [8:0] [26:18], xilinx.com:interface:sc:1.0 S03_SC PAYLD [8:0] [35:27], xilinx.com:interface:sc:1.0 S04_SC PAYLD [8:0] [44:36], xilinx.com:interface:sc:1.0 S05_SC PAYLD [8:0] [53:45], xilinx.com:interface:sc:1.0 S06_SC PAYLD [8:0] [62:54], xilinx.com:interface:sc:1.0 S07_SC PAYLD [8:0] [71:63]" *)
input wire [71 : 0] s_sc_payld;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 S00_SC RECV [0:0] [0:0], xilinx.com:interface:sc:1.0 S01_SC RECV [0:0] [1:1], xilinx.com:interface:sc:1.0 S02_SC RECV [0:0] [2:2], xilinx.com:interface:sc:1.0 S03_SC RECV [0:0] [3:3], xilinx.com:interface:sc:1.0 S04_SC RECV [0:0] [4:4], xilinx.com:interface:sc:1.0 S05_SC RECV [0:0] [5:5], xilinx.com:interface:sc:1.0 S06_SC RECV [0:0] [6:6], xilinx.com:interface:sc:1.0 S07_SC RECV [0:0] [7:7]" *)
output wire [7 : 0] s_sc_recv;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 M00_SC RECV" *)
(* X_INTERFACE_MODE = "master" *)
input wire [7 : 0] m_sc_recv;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 M00_SC SEND" *)
output wire [7 : 0] m_sc_send;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 M00_SC REQ" *)
output wire [7 : 0] m_sc_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 M00_SC INFO" *)
output wire [7 : 0] m_sc_info;
(* X_INTERFACE_INFO = "xilinx.com:interface:sc:1.0 M00_SC PAYLD" *)
output wire [8 : 0] m_sc_payld;

  sc_switchboard_v1_0_8_top #(
    .C_PAYLD_WIDTH(9),
    .K_MAX_INFO_WIDTH(1),
    .C_S_PIPELINES(0),
    .C_M_PIPELINES(0),
    .C_S_LATENCY(0),
    .C_NUM_SI(8),
    .C_NUM_MI(1),
    .C_TESTING_MODE(0),
    .C_CONNECTIVITY(8'B11111111)
  ) inst (
    .aclk(aclk),
    .aclken(aclken),
    .connectivity(8'B11111111),
    .s_sc_send(s_sc_send),
    .s_sc_req(s_sc_req),
    .s_sc_info(s_sc_info),
    .s_sc_payld(s_sc_payld),
    .s_sc_recv(s_sc_recv),
    .m_sc_recv(m_sc_recv),
    .m_sc_send(m_sc_send),
    .m_sc_req(m_sc_req),
    .m_sc_info(m_sc_info),
    .m_sc_payld(m_sc_payld)
  );
endmodule
