// (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
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
////////////////////////////////////////////////////////////
/*
 * Amd SystemC/TLM-2.0 ZynqMP Wrapper.
 *
 * Written by Edgar E. Iglesias <edgar.iglesias@Amd.com>
 *
 * Copyright (c) 2016, Amd Inc.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "systemc.h"

#include "tlm_utils/simple_initiator_socket.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/tlm_quantumkeeper.h"

#include "remote_port_tlm.h"
#include "remote_port_tlm_memory_master.h"
#include "remote_port_tlm_memory_slave.h"
#include "remote_port_tlm_wires.h"
#include "wire_splitter.h"
namespace zynqmp_tlm_vitis {
class xilinx_emio_bank
{
private:
public:
	sc_vector<sc_signal<bool> > in;
	sc_vector<sc_signal<bool> > out;
	sc_vector<sc_signal<bool> > out_enable;
	xilinx_emio_bank(const char *name_in, const char *name_out,
		         const char *name_out_en, int num);
};

class xilinx_mio_bank
{
private:
public:
	sc_vector<sc_signal<bool> > in;
	sc_vector<sc_signal<bool> > out;
	xilinx_mio_bank(const char *name_in, const char *name_out,
		         int num);
};

class xilinx_zynqmp
: public remoteport_tlm
{
private:
	remoteport_tlm_memory_master rp_axi_hpm0_fpd;
	remoteport_tlm_memory_master rp_axi_hpm1_fpd;
	remoteport_tlm_memory_master rp_axi_hpm_lpd;
	remoteport_tlm_memory_master rp_lpd_reserved;

	remoteport_tlm_memory_slave rp_axi_hpc0_fpd;
	remoteport_tlm_memory_slave rp_axi_hpc1_fpd;
	remoteport_tlm_memory_slave rp_axi_hp0_fpd;
	remoteport_tlm_memory_slave rp_axi_hp1_fpd;
	remoteport_tlm_memory_slave rp_axi_hp2_fpd;
	remoteport_tlm_memory_slave rp_axi_hp3_fpd;
	remoteport_tlm_memory_slave rp_axi_lpd;
	remoteport_tlm_memory_slave rp_axi_acp_fpd;
	remoteport_tlm_memory_slave rp_axi_ace_fpd;

	remoteport_tlm_wires rp_wires_in;
	remoteport_tlm_wires rp_wires_out;
	remoteport_tlm_wires rp_irq_out;
	remoteport_tlm_wires rp_emio0;
	remoteport_tlm_wires rp_emio1;
	remoteport_tlm_wires rp_emio2;
	remoteport_tlm_wires rp_mio_in;
	remoteport_tlm_wires rp_mio_out;

	sc_vector<remoteport_tlm_memory_master > rp_user_master;
	sc_vector<remoteport_tlm_memory_slave > rp_user_slave;

	/*
	 * In order to get Master-IDs right, we need to proxy all
	 * transactions and inject generic attributes with Master IDs.
	 */
	sc_vector<tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> > proxy_in;
	sc_vector<tlm_utils::simple_initiator_socket_tagged<xilinx_zynqmp> > proxy_out;

	/*
	 * Proxies for friendly named pl_resets.
	 */
	wire_splitter *pl_resetn_splitter[4];

	virtual void b_transport(int id,
				 tlm::tlm_generic_payload& trans,
				 sc_time& delay);
    virtual tlm::tlm_sync_enum nb_transport_fw(int id,tlm::tlm_generic_payload& trans,
			tlm::tlm_phase& phase, sc_core::sc_time& delay);
    virtual tlm::tlm_sync_enum nb_transport_bw(int id,tlm::tlm_generic_payload& trans,
			tlm::tlm_phase& phase, sc_core::sc_time& delay);
	virtual unsigned int transport_dbg(int id,
					   tlm::tlm_generic_payload& trans);
public:
	/*
	 * HPM0 - 1 _FPD.
	 * These sockets represent the High speed PS to PL interfaces.
	 * These are AXI Slave ports on the PS side and AXI Master ports
	 * on the PL side.
	 *
	 * HPM_LPD
	 * Used to transfer data quickly from the LPD to the PL.
	 *
	 * Used to transfer data from the PS to the PL.
	 */
	tlm_utils::simple_initiator_socket<remoteport_tlm_memory_master> *s_axi_hpm_fpd[2];
	tlm_utils::simple_initiator_socket<remoteport_tlm_memory_master> *s_axi_hpm_lpd;
	tlm_utils::simple_initiator_socket<remoteport_tlm_memory_master> *s_lpd_reserved;

	/*
	 * HPC0 - 1.
	 * These sockets represent the High speed IO Coherent PL to PS
	 * interfaces.
	 *
	 * HP0 - 3.
	 * These sockets represent the High speed PL to PS interfaces.
	 *
	 * PL_LPD
	 * Low-Power interface used to transfer data to the Low Power Domain.
	 *
	 * ACP
	 * Accelerator Coherency Port, used to transfered coherent data to
	 * the PS via the Cortex-A53 subsystem.
	 *
	 * These are AXI Master ports on the PS side and AXI Slave ports
	 * on the PL side.
	 *
	 * Used to transfer data from the PL to the PS.
	 */
	tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> *s_axi_hpc_fpd[2];
	tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> *s_axi_hp_fpd[4];
	tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> *s_axi_lpd;
	tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> *s_axi_acp_fpd;
	tlm_utils::simple_target_socket_tagged<xilinx_zynqmp> *s_axi_ace_fpd;

	sc_vector<sc_signal<bool> > pl2ps_irq;
	sc_vector<sc_signal<bool> > ps2pl_irq;

	xilinx_emio_bank *emio[3];
	xilinx_mio_bank mio;

	/*
	 * 4 PL resets, same as EMIO[2][31:28] but with friendly names.
	 * See the TRM, Chapter 27 GPIO, page 761.
	 */
	sc_vector<sc_signal<bool> > pl_resetn;

	tlm_utils::simple_initiator_socket<remoteport_tlm_memory_master> *user_master[10];
	tlm_utils::simple_target_socket<remoteport_tlm_memory_slave> *user_slave[10];
	xilinx_zynqmp(sc_core::sc_module_name name, const char *sk_descr);
	~xilinx_zynqmp(void);
	void tie_off(void);
};
}
