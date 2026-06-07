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


#include "system_axi_hpm0_lpd_interconnect_0_sc.h"

#include "system_axi_hpm0_lpd_interconnect_0.h"

#include "smartconnect.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
system_axi_hpm0_lpd_interconnect_0::system_axi_hpm0_lpd_interconnect_0(const sc_core::sc_module_name& nm) : system_axi_hpm0_lpd_interconnect_0_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awid("S00_AXI_awid"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awuser("S00_AXI_awuser"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bid("S00_AXI_bid"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S00_AXI_arid("S00_AXI_arid"), S00_AXI_araddr("S00_AXI_araddr"), S00_AXI_arlen("S00_AXI_arlen"), S00_AXI_arsize("S00_AXI_arsize"), S00_AXI_arburst("S00_AXI_arburst"), S00_AXI_arlock("S00_AXI_arlock"), S00_AXI_arcache("S00_AXI_arcache"), S00_AXI_arprot("S00_AXI_arprot"), S00_AXI_arqos("S00_AXI_arqos"), S00_AXI_aruser("S00_AXI_aruser"), S00_AXI_arvalid("S00_AXI_arvalid"), S00_AXI_arready("S00_AXI_arready"), S00_AXI_rid("S00_AXI_rid"), S00_AXI_rdata("S00_AXI_rdata"), S00_AXI_rresp("S00_AXI_rresp"), S00_AXI_rlast("S00_AXI_rlast"), S00_AXI_rvalid("S00_AXI_rvalid"), S00_AXI_rready("S00_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"), M01_AXI_awaddr("M01_AXI_awaddr"), M01_AXI_awprot("M01_AXI_awprot"), M01_AXI_awvalid("M01_AXI_awvalid"), M01_AXI_awready("M01_AXI_awready"), M01_AXI_wdata("M01_AXI_wdata"), M01_AXI_wstrb("M01_AXI_wstrb"), M01_AXI_wvalid("M01_AXI_wvalid"), M01_AXI_wready("M01_AXI_wready"), M01_AXI_bresp("M01_AXI_bresp"), M01_AXI_bvalid("M01_AXI_bvalid"), M01_AXI_bready("M01_AXI_bready"), M01_AXI_araddr("M01_AXI_araddr"), M01_AXI_arprot("M01_AXI_arprot"), M01_AXI_arvalid("M01_AXI_arvalid"), M01_AXI_arready("M01_AXI_arready"), M01_AXI_rdata("M01_AXI_rdata"), M01_AXI_rresp("M01_AXI_rresp"), M01_AXI_rvalid("M01_AXI_rvalid"), M01_AXI_rready("M01_AXI_rready"), M02_AXI_awaddr("M02_AXI_awaddr"), M02_AXI_awprot("M02_AXI_awprot"), M02_AXI_awvalid("M02_AXI_awvalid"), M02_AXI_awready("M02_AXI_awready"), M02_AXI_wdata("M02_AXI_wdata"), M02_AXI_wstrb("M02_AXI_wstrb"), M02_AXI_wvalid("M02_AXI_wvalid"), M02_AXI_wready("M02_AXI_wready"), M02_AXI_bresp("M02_AXI_bresp"), M02_AXI_bvalid("M02_AXI_bvalid"), M02_AXI_bready("M02_AXI_bready"), M02_AXI_araddr("M02_AXI_araddr"), M02_AXI_arprot("M02_AXI_arprot"), M02_AXI_arvalid("M02_AXI_arvalid"), M02_AXI_arready("M02_AXI_arready"), M02_AXI_rdata("M02_AXI_rdata"), M02_AXI_rresp("M02_AXI_rresp"), M02_AXI_rvalid("M02_AXI_rvalid"), M02_AXI_rready("M02_AXI_rready"), M03_AXI_awaddr("M03_AXI_awaddr"), M03_AXI_awprot("M03_AXI_awprot"), M03_AXI_awvalid("M03_AXI_awvalid"), M03_AXI_awready("M03_AXI_awready"), M03_AXI_wdata("M03_AXI_wdata"), M03_AXI_wstrb("M03_AXI_wstrb"), M03_AXI_wvalid("M03_AXI_wvalid"), M03_AXI_wready("M03_AXI_wready"), M03_AXI_bresp("M03_AXI_bresp"), M03_AXI_bvalid("M03_AXI_bvalid"), M03_AXI_bready("M03_AXI_bready"), M03_AXI_araddr("M03_AXI_araddr"), M03_AXI_arprot("M03_AXI_arprot"), M03_AXI_arvalid("M03_AXI_arvalid"), M03_AXI_arready("M03_AXI_arready"), M03_AXI_rdata("M03_AXI_rdata"), M03_AXI_rresp("M03_AXI_rresp"), M03_AXI_rvalid("M03_AXI_rvalid"), M03_AXI_rready("M03_AXI_rready"), M04_AXI_awaddr("M04_AXI_awaddr"), M04_AXI_awprot("M04_AXI_awprot"), M04_AXI_awvalid("M04_AXI_awvalid"), M04_AXI_awready("M04_AXI_awready"), M04_AXI_wdata("M04_AXI_wdata"), M04_AXI_wstrb("M04_AXI_wstrb"), M04_AXI_wvalid("M04_AXI_wvalid"), M04_AXI_wready("M04_AXI_wready"), M04_AXI_bresp("M04_AXI_bresp"), M04_AXI_bvalid("M04_AXI_bvalid"), M04_AXI_bready("M04_AXI_bready"), M04_AXI_araddr("M04_AXI_araddr"), M04_AXI_arprot("M04_AXI_arprot"), M04_AXI_arvalid("M04_AXI_arvalid"), M04_AXI_arready("M04_AXI_arready"), M04_AXI_rdata("M04_AXI_rdata"), M04_AXI_rresp("M04_AXI_rresp"), M04_AXI_rvalid("M04_AXI_rvalid"), M04_AXI_rready("M04_AXI_rready"), M05_AXI_awaddr("M05_AXI_awaddr"), M05_AXI_awprot("M05_AXI_awprot"), M05_AXI_awvalid("M05_AXI_awvalid"), M05_AXI_awready("M05_AXI_awready"), M05_AXI_wdata("M05_AXI_wdata"), M05_AXI_wstrb("M05_AXI_wstrb"), M05_AXI_wvalid("M05_AXI_wvalid"), M05_AXI_wready("M05_AXI_wready"), M05_AXI_bresp("M05_AXI_bresp"), M05_AXI_bvalid("M05_AXI_bvalid"), M05_AXI_bready("M05_AXI_bready"), M05_AXI_araddr("M05_AXI_araddr"), M05_AXI_arprot("M05_AXI_arprot"), M05_AXI_arvalid("M05_AXI_arvalid"), M05_AXI_arready("M05_AXI_arready"), M05_AXI_rdata("M05_AXI_rdata"), M05_AXI_rresp("M05_AXI_rresp"), M05_AXI_rvalid("M05_AXI_rvalid"), M05_AXI_rready("M05_AXI_rready"), M06_AXI_awaddr("M06_AXI_awaddr"), M06_AXI_awprot("M06_AXI_awprot"), M06_AXI_awvalid("M06_AXI_awvalid"), M06_AXI_awready("M06_AXI_awready"), M06_AXI_wdata("M06_AXI_wdata"), M06_AXI_wstrb("M06_AXI_wstrb"), M06_AXI_wvalid("M06_AXI_wvalid"), M06_AXI_wready("M06_AXI_wready"), M06_AXI_bresp("M06_AXI_bresp"), M06_AXI_bvalid("M06_AXI_bvalid"), M06_AXI_bready("M06_AXI_bready"), M06_AXI_araddr("M06_AXI_araddr"), M06_AXI_arprot("M06_AXI_arprot"), M06_AXI_arvalid("M06_AXI_arvalid"), M06_AXI_arready("M06_AXI_arready"), M06_AXI_rdata("M06_AXI_rdata"), M06_AXI_rresp("M06_AXI_rresp"), M06_AXI_rvalid("M06_AXI_rvalid"), M06_AXI_rready("M06_AXI_rready"), M07_AXI_awaddr("M07_AXI_awaddr"), M07_AXI_awprot("M07_AXI_awprot"), M07_AXI_awvalid("M07_AXI_awvalid"), M07_AXI_awready("M07_AXI_awready"), M07_AXI_wdata("M07_AXI_wdata"), M07_AXI_wstrb("M07_AXI_wstrb"), M07_AXI_wvalid("M07_AXI_wvalid"), M07_AXI_wready("M07_AXI_wready"), M07_AXI_bresp("M07_AXI_bresp"), M07_AXI_bvalid("M07_AXI_bvalid"), M07_AXI_bready("M07_AXI_bready"), M07_AXI_araddr("M07_AXI_araddr"), M07_AXI_arprot("M07_AXI_arprot"), M07_AXI_arvalid("M07_AXI_arvalid"), M07_AXI_arready("M07_AXI_arready"), M07_AXI_rdata("M07_AXI_rdata"), M07_AXI_rresp("M07_AXI_rresp"), M07_AXI_rvalid("M07_AXI_rvalid"), M07_AXI_rready("M07_AXI_rready")
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S00_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M01_AXI_transactor = NULL;
  mp_M02_AXI_transactor = NULL;
  mp_M03_AXI_transactor = NULL;
  mp_M04_AXI_transactor = NULL;
  mp_M05_AXI_transactor = NULL;
  mp_M06_AXI_transactor = NULL;
  mp_M07_AXI_transactor = NULL;

  // initialize socket stubs

}

void system_axi_hpm0_lpd_interconnect_0::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "40");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<32,40,16,16,1,1,16,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWID(S00_AXI_awid);
    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWUSER(S00_AXI_awuser);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BID(S00_AXI_bid);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->ARID(S00_AXI_arid);
    mp_S00_AXI_transactor->ARADDR(S00_AXI_araddr);
    mp_S00_AXI_transactor->ARLEN(S00_AXI_arlen);
    mp_S00_AXI_transactor->ARSIZE(S00_AXI_arsize);
    mp_S00_AXI_transactor->ARBURST(S00_AXI_arburst);
    mp_S00_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_arlock_converter");
    mp_S00_AXI_arlock_converter->vector_in(S00_AXI_arlock);
    mp_S00_AXI_arlock_converter->scalar_out(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARLOCK(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARCACHE(S00_AXI_arcache);
    mp_S00_AXI_transactor->ARPROT(S00_AXI_arprot);
    mp_S00_AXI_transactor->ARQOS(S00_AXI_arqos);
    mp_S00_AXI_transactor->ARUSER(S00_AXI_aruser);
    mp_S00_AXI_transactor->ARVALID(S00_AXI_arvalid);
    mp_S00_AXI_transactor->ARREADY(S00_AXI_arready);
    mp_S00_AXI_transactor->RID(S00_AXI_rid);
    mp_S00_AXI_transactor->RDATA(S00_AXI_rdata);
    mp_S00_AXI_transactor->RRESP(S00_AXI_rresp);
    mp_S00_AXI_transactor->RLAST(S00_AXI_rlast);
    mp_S00_AXI_transactor->RVALID(S00_AXI_rvalid);
    mp_S00_AXI_transactor->RREADY(S00_AXI_rready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M01_AXI' transactor parameters
    xsc::common_cpp::properties M01_AXI_transactor_param_props;
    M01_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M01_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M01_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M01_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M01_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M01_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M01_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M01_AXI_transactor", M01_AXI_transactor_param_props);

    // M01_AXI' transactor ports

    mp_M01_AXI_transactor->AWADDR(M01_AXI_awaddr);
    mp_M01_AXI_transactor->AWPROT(M01_AXI_awprot);
    mp_M01_AXI_transactor->AWVALID(M01_AXI_awvalid);
    mp_M01_AXI_transactor->AWREADY(M01_AXI_awready);
    mp_M01_AXI_transactor->WDATA(M01_AXI_wdata);
    mp_M01_AXI_transactor->WSTRB(M01_AXI_wstrb);
    mp_M01_AXI_transactor->WVALID(M01_AXI_wvalid);
    mp_M01_AXI_transactor->WREADY(M01_AXI_wready);
    mp_M01_AXI_transactor->BRESP(M01_AXI_bresp);
    mp_M01_AXI_transactor->BVALID(M01_AXI_bvalid);
    mp_M01_AXI_transactor->BREADY(M01_AXI_bready);
    mp_M01_AXI_transactor->ARADDR(M01_AXI_araddr);
    mp_M01_AXI_transactor->ARPROT(M01_AXI_arprot);
    mp_M01_AXI_transactor->ARVALID(M01_AXI_arvalid);
    mp_M01_AXI_transactor->ARREADY(M01_AXI_arready);
    mp_M01_AXI_transactor->RDATA(M01_AXI_rdata);
    mp_M01_AXI_transactor->RRESP(M01_AXI_rresp);
    mp_M01_AXI_transactor->RVALID(M01_AXI_rvalid);
    mp_M01_AXI_transactor->RREADY(M01_AXI_rready);
    mp_M01_AXI_transactor->CLK(aclk);
    mp_M01_AXI_transactor->RST(aresetn);

    // M01_AXI' transactor sockets

    mp_impl->M01_AXI_tlm_aximm_read_socket->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_impl->M01_AXI_tlm_aximm_write_socket->bind(*(mp_M01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M02_AXI' transactor parameters
    xsc::common_cpp::properties M02_AXI_transactor_param_props;
    M02_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M02_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M02_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M02_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M02_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M02_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M02_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M02_AXI_transactor", M02_AXI_transactor_param_props);

    // M02_AXI' transactor ports

    mp_M02_AXI_transactor->AWADDR(M02_AXI_awaddr);
    mp_M02_AXI_transactor->AWPROT(M02_AXI_awprot);
    mp_M02_AXI_transactor->AWVALID(M02_AXI_awvalid);
    mp_M02_AXI_transactor->AWREADY(M02_AXI_awready);
    mp_M02_AXI_transactor->WDATA(M02_AXI_wdata);
    mp_M02_AXI_transactor->WSTRB(M02_AXI_wstrb);
    mp_M02_AXI_transactor->WVALID(M02_AXI_wvalid);
    mp_M02_AXI_transactor->WREADY(M02_AXI_wready);
    mp_M02_AXI_transactor->BRESP(M02_AXI_bresp);
    mp_M02_AXI_transactor->BVALID(M02_AXI_bvalid);
    mp_M02_AXI_transactor->BREADY(M02_AXI_bready);
    mp_M02_AXI_transactor->ARADDR(M02_AXI_araddr);
    mp_M02_AXI_transactor->ARPROT(M02_AXI_arprot);
    mp_M02_AXI_transactor->ARVALID(M02_AXI_arvalid);
    mp_M02_AXI_transactor->ARREADY(M02_AXI_arready);
    mp_M02_AXI_transactor->RDATA(M02_AXI_rdata);
    mp_M02_AXI_transactor->RRESP(M02_AXI_rresp);
    mp_M02_AXI_transactor->RVALID(M02_AXI_rvalid);
    mp_M02_AXI_transactor->RREADY(M02_AXI_rready);
    mp_M02_AXI_transactor->CLK(aclk);
    mp_M02_AXI_transactor->RST(aresetn);

    // M02_AXI' transactor sockets

    mp_impl->M02_AXI_tlm_aximm_read_socket->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_impl->M02_AXI_tlm_aximm_write_socket->bind(*(mp_M02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M03_AXI' transactor parameters
    xsc::common_cpp::properties M03_AXI_transactor_param_props;
    M03_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M03_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M03_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M03_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M03_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M03_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M03_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M03_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M03_AXI_transactor", M03_AXI_transactor_param_props);

    // M03_AXI' transactor ports

    mp_M03_AXI_transactor->AWADDR(M03_AXI_awaddr);
    mp_M03_AXI_transactor->AWPROT(M03_AXI_awprot);
    mp_M03_AXI_transactor->AWVALID(M03_AXI_awvalid);
    mp_M03_AXI_transactor->AWREADY(M03_AXI_awready);
    mp_M03_AXI_transactor->WDATA(M03_AXI_wdata);
    mp_M03_AXI_transactor->WSTRB(M03_AXI_wstrb);
    mp_M03_AXI_transactor->WVALID(M03_AXI_wvalid);
    mp_M03_AXI_transactor->WREADY(M03_AXI_wready);
    mp_M03_AXI_transactor->BRESP(M03_AXI_bresp);
    mp_M03_AXI_transactor->BVALID(M03_AXI_bvalid);
    mp_M03_AXI_transactor->BREADY(M03_AXI_bready);
    mp_M03_AXI_transactor->ARADDR(M03_AXI_araddr);
    mp_M03_AXI_transactor->ARPROT(M03_AXI_arprot);
    mp_M03_AXI_transactor->ARVALID(M03_AXI_arvalid);
    mp_M03_AXI_transactor->ARREADY(M03_AXI_arready);
    mp_M03_AXI_transactor->RDATA(M03_AXI_rdata);
    mp_M03_AXI_transactor->RRESP(M03_AXI_rresp);
    mp_M03_AXI_transactor->RVALID(M03_AXI_rvalid);
    mp_M03_AXI_transactor->RREADY(M03_AXI_rready);
    mp_M03_AXI_transactor->CLK(aclk);
    mp_M03_AXI_transactor->RST(aresetn);

    // M03_AXI' transactor sockets

    mp_impl->M03_AXI_tlm_aximm_read_socket->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_impl->M03_AXI_tlm_aximm_write_socket->bind(*(mp_M03_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M04_AXI' transactor parameters
    xsc::common_cpp::properties M04_AXI_transactor_param_props;
    M04_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M04_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M04_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M04_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M04_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M04_AXI_transactor", M04_AXI_transactor_param_props);

    // M04_AXI' transactor ports

    mp_M04_AXI_transactor->AWADDR(M04_AXI_awaddr);
    mp_M04_AXI_transactor->AWPROT(M04_AXI_awprot);
    mp_M04_AXI_transactor->AWVALID(M04_AXI_awvalid);
    mp_M04_AXI_transactor->AWREADY(M04_AXI_awready);
    mp_M04_AXI_transactor->WDATA(M04_AXI_wdata);
    mp_M04_AXI_transactor->WSTRB(M04_AXI_wstrb);
    mp_M04_AXI_transactor->WVALID(M04_AXI_wvalid);
    mp_M04_AXI_transactor->WREADY(M04_AXI_wready);
    mp_M04_AXI_transactor->BRESP(M04_AXI_bresp);
    mp_M04_AXI_transactor->BVALID(M04_AXI_bvalid);
    mp_M04_AXI_transactor->BREADY(M04_AXI_bready);
    mp_M04_AXI_transactor->ARADDR(M04_AXI_araddr);
    mp_M04_AXI_transactor->ARPROT(M04_AXI_arprot);
    mp_M04_AXI_transactor->ARVALID(M04_AXI_arvalid);
    mp_M04_AXI_transactor->ARREADY(M04_AXI_arready);
    mp_M04_AXI_transactor->RDATA(M04_AXI_rdata);
    mp_M04_AXI_transactor->RRESP(M04_AXI_rresp);
    mp_M04_AXI_transactor->RVALID(M04_AXI_rvalid);
    mp_M04_AXI_transactor->RREADY(M04_AXI_rready);
    mp_M04_AXI_transactor->CLK(aclk);
    mp_M04_AXI_transactor->RST(aresetn);

    // M04_AXI' transactor sockets

    mp_impl->M04_AXI_tlm_aximm_read_socket->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_impl->M04_AXI_tlm_aximm_write_socket->bind(*(mp_M04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M05_AXI' transactor parameters
    xsc::common_cpp::properties M05_AXI_transactor_param_props;
    M05_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M05_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M05_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M05_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M05_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M05_AXI_transactor", M05_AXI_transactor_param_props);

    // M05_AXI' transactor ports

    mp_M05_AXI_transactor->AWADDR(M05_AXI_awaddr);
    mp_M05_AXI_transactor->AWPROT(M05_AXI_awprot);
    mp_M05_AXI_transactor->AWVALID(M05_AXI_awvalid);
    mp_M05_AXI_transactor->AWREADY(M05_AXI_awready);
    mp_M05_AXI_transactor->WDATA(M05_AXI_wdata);
    mp_M05_AXI_transactor->WSTRB(M05_AXI_wstrb);
    mp_M05_AXI_transactor->WVALID(M05_AXI_wvalid);
    mp_M05_AXI_transactor->WREADY(M05_AXI_wready);
    mp_M05_AXI_transactor->BRESP(M05_AXI_bresp);
    mp_M05_AXI_transactor->BVALID(M05_AXI_bvalid);
    mp_M05_AXI_transactor->BREADY(M05_AXI_bready);
    mp_M05_AXI_transactor->ARADDR(M05_AXI_araddr);
    mp_M05_AXI_transactor->ARPROT(M05_AXI_arprot);
    mp_M05_AXI_transactor->ARVALID(M05_AXI_arvalid);
    mp_M05_AXI_transactor->ARREADY(M05_AXI_arready);
    mp_M05_AXI_transactor->RDATA(M05_AXI_rdata);
    mp_M05_AXI_transactor->RRESP(M05_AXI_rresp);
    mp_M05_AXI_transactor->RVALID(M05_AXI_rvalid);
    mp_M05_AXI_transactor->RREADY(M05_AXI_rready);
    mp_M05_AXI_transactor->CLK(aclk);
    mp_M05_AXI_transactor->RST(aresetn);

    // M05_AXI' transactor sockets

    mp_impl->M05_AXI_tlm_aximm_read_socket->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_impl->M05_AXI_tlm_aximm_write_socket->bind(*(mp_M05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M06_AXI' transactor parameters
    xsc::common_cpp::properties M06_AXI_transactor_param_props;
    M06_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "13");
    M06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M06_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M06_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M06_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M06_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,13,1,1,1,1,1,1>("M06_AXI_transactor", M06_AXI_transactor_param_props);

    // M06_AXI' transactor ports

    mp_M06_AXI_transactor->AWADDR(M06_AXI_awaddr);
    mp_M06_AXI_transactor->AWPROT(M06_AXI_awprot);
    mp_M06_AXI_transactor->AWVALID(M06_AXI_awvalid);
    mp_M06_AXI_transactor->AWREADY(M06_AXI_awready);
    mp_M06_AXI_transactor->WDATA(M06_AXI_wdata);
    mp_M06_AXI_transactor->WSTRB(M06_AXI_wstrb);
    mp_M06_AXI_transactor->WVALID(M06_AXI_wvalid);
    mp_M06_AXI_transactor->WREADY(M06_AXI_wready);
    mp_M06_AXI_transactor->BRESP(M06_AXI_bresp);
    mp_M06_AXI_transactor->BVALID(M06_AXI_bvalid);
    mp_M06_AXI_transactor->BREADY(M06_AXI_bready);
    mp_M06_AXI_transactor->ARADDR(M06_AXI_araddr);
    mp_M06_AXI_transactor->ARPROT(M06_AXI_arprot);
    mp_M06_AXI_transactor->ARVALID(M06_AXI_arvalid);
    mp_M06_AXI_transactor->ARREADY(M06_AXI_arready);
    mp_M06_AXI_transactor->RDATA(M06_AXI_rdata);
    mp_M06_AXI_transactor->RRESP(M06_AXI_rresp);
    mp_M06_AXI_transactor->RVALID(M06_AXI_rvalid);
    mp_M06_AXI_transactor->RREADY(M06_AXI_rready);
    mp_M06_AXI_transactor->CLK(aclk);
    mp_M06_AXI_transactor->RST(aresetn);

    // M06_AXI' transactor sockets

    mp_impl->M06_AXI_tlm_aximm_read_socket->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_impl->M06_AXI_tlm_aximm_write_socket->bind(*(mp_M06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M07_AXI' transactor parameters
    xsc::common_cpp::properties M07_AXI_transactor_param_props;
    M07_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M07_AXI_transactor_param_props.addLong("FREQ_HZ", "100000000");
    M07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M07_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M07_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M07_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_axi_adrv9001_0_dac_1_clk");

    mp_M07_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M07_AXI_transactor", M07_AXI_transactor_param_props);

    // M07_AXI' transactor ports

    mp_M07_AXI_transactor->AWADDR(M07_AXI_awaddr);
    mp_M07_AXI_transactor->AWPROT(M07_AXI_awprot);
    mp_M07_AXI_transactor->AWVALID(M07_AXI_awvalid);
    mp_M07_AXI_transactor->AWREADY(M07_AXI_awready);
    mp_M07_AXI_transactor->WDATA(M07_AXI_wdata);
    mp_M07_AXI_transactor->WSTRB(M07_AXI_wstrb);
    mp_M07_AXI_transactor->WVALID(M07_AXI_wvalid);
    mp_M07_AXI_transactor->WREADY(M07_AXI_wready);
    mp_M07_AXI_transactor->BRESP(M07_AXI_bresp);
    mp_M07_AXI_transactor->BVALID(M07_AXI_bvalid);
    mp_M07_AXI_transactor->BREADY(M07_AXI_bready);
    mp_M07_AXI_transactor->ARADDR(M07_AXI_araddr);
    mp_M07_AXI_transactor->ARPROT(M07_AXI_arprot);
    mp_M07_AXI_transactor->ARVALID(M07_AXI_arvalid);
    mp_M07_AXI_transactor->ARREADY(M07_AXI_arready);
    mp_M07_AXI_transactor->RDATA(M07_AXI_rdata);
    mp_M07_AXI_transactor->RRESP(M07_AXI_rresp);
    mp_M07_AXI_transactor->RVALID(M07_AXI_rvalid);
    mp_M07_AXI_transactor->RREADY(M07_AXI_rready);
    mp_M07_AXI_transactor->CLK(aclk1);
    mp_M07_AXI_transactor->RST(aresetn);

    // M07_AXI' transactor sockets

    mp_impl->M07_AXI_tlm_aximm_read_socket->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_impl->M07_AXI_tlm_aximm_write_socket->bind(*(mp_M07_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
system_axi_hpm0_lpd_interconnect_0::system_axi_hpm0_lpd_interconnect_0(const sc_core::sc_module_name& nm) : system_axi_hpm0_lpd_interconnect_0_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awid("S00_AXI_awid"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awuser("S00_AXI_awuser"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bid("S00_AXI_bid"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S00_AXI_arid("S00_AXI_arid"), S00_AXI_araddr("S00_AXI_araddr"), S00_AXI_arlen("S00_AXI_arlen"), S00_AXI_arsize("S00_AXI_arsize"), S00_AXI_arburst("S00_AXI_arburst"), S00_AXI_arlock("S00_AXI_arlock"), S00_AXI_arcache("S00_AXI_arcache"), S00_AXI_arprot("S00_AXI_arprot"), S00_AXI_arqos("S00_AXI_arqos"), S00_AXI_aruser("S00_AXI_aruser"), S00_AXI_arvalid("S00_AXI_arvalid"), S00_AXI_arready("S00_AXI_arready"), S00_AXI_rid("S00_AXI_rid"), S00_AXI_rdata("S00_AXI_rdata"), S00_AXI_rresp("S00_AXI_rresp"), S00_AXI_rlast("S00_AXI_rlast"), S00_AXI_rvalid("S00_AXI_rvalid"), S00_AXI_rready("S00_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"), M01_AXI_awaddr("M01_AXI_awaddr"), M01_AXI_awprot("M01_AXI_awprot"), M01_AXI_awvalid("M01_AXI_awvalid"), M01_AXI_awready("M01_AXI_awready"), M01_AXI_wdata("M01_AXI_wdata"), M01_AXI_wstrb("M01_AXI_wstrb"), M01_AXI_wvalid("M01_AXI_wvalid"), M01_AXI_wready("M01_AXI_wready"), M01_AXI_bresp("M01_AXI_bresp"), M01_AXI_bvalid("M01_AXI_bvalid"), M01_AXI_bready("M01_AXI_bready"), M01_AXI_araddr("M01_AXI_araddr"), M01_AXI_arprot("M01_AXI_arprot"), M01_AXI_arvalid("M01_AXI_arvalid"), M01_AXI_arready("M01_AXI_arready"), M01_AXI_rdata("M01_AXI_rdata"), M01_AXI_rresp("M01_AXI_rresp"), M01_AXI_rvalid("M01_AXI_rvalid"), M01_AXI_rready("M01_AXI_rready"), M02_AXI_awaddr("M02_AXI_awaddr"), M02_AXI_awprot("M02_AXI_awprot"), M02_AXI_awvalid("M02_AXI_awvalid"), M02_AXI_awready("M02_AXI_awready"), M02_AXI_wdata("M02_AXI_wdata"), M02_AXI_wstrb("M02_AXI_wstrb"), M02_AXI_wvalid("M02_AXI_wvalid"), M02_AXI_wready("M02_AXI_wready"), M02_AXI_bresp("M02_AXI_bresp"), M02_AXI_bvalid("M02_AXI_bvalid"), M02_AXI_bready("M02_AXI_bready"), M02_AXI_araddr("M02_AXI_araddr"), M02_AXI_arprot("M02_AXI_arprot"), M02_AXI_arvalid("M02_AXI_arvalid"), M02_AXI_arready("M02_AXI_arready"), M02_AXI_rdata("M02_AXI_rdata"), M02_AXI_rresp("M02_AXI_rresp"), M02_AXI_rvalid("M02_AXI_rvalid"), M02_AXI_rready("M02_AXI_rready"), M03_AXI_awaddr("M03_AXI_awaddr"), M03_AXI_awprot("M03_AXI_awprot"), M03_AXI_awvalid("M03_AXI_awvalid"), M03_AXI_awready("M03_AXI_awready"), M03_AXI_wdata("M03_AXI_wdata"), M03_AXI_wstrb("M03_AXI_wstrb"), M03_AXI_wvalid("M03_AXI_wvalid"), M03_AXI_wready("M03_AXI_wready"), M03_AXI_bresp("M03_AXI_bresp"), M03_AXI_bvalid("M03_AXI_bvalid"), M03_AXI_bready("M03_AXI_bready"), M03_AXI_araddr("M03_AXI_araddr"), M03_AXI_arprot("M03_AXI_arprot"), M03_AXI_arvalid("M03_AXI_arvalid"), M03_AXI_arready("M03_AXI_arready"), M03_AXI_rdata("M03_AXI_rdata"), M03_AXI_rresp("M03_AXI_rresp"), M03_AXI_rvalid("M03_AXI_rvalid"), M03_AXI_rready("M03_AXI_rready"), M04_AXI_awaddr("M04_AXI_awaddr"), M04_AXI_awprot("M04_AXI_awprot"), M04_AXI_awvalid("M04_AXI_awvalid"), M04_AXI_awready("M04_AXI_awready"), M04_AXI_wdata("M04_AXI_wdata"), M04_AXI_wstrb("M04_AXI_wstrb"), M04_AXI_wvalid("M04_AXI_wvalid"), M04_AXI_wready("M04_AXI_wready"), M04_AXI_bresp("M04_AXI_bresp"), M04_AXI_bvalid("M04_AXI_bvalid"), M04_AXI_bready("M04_AXI_bready"), M04_AXI_araddr("M04_AXI_araddr"), M04_AXI_arprot("M04_AXI_arprot"), M04_AXI_arvalid("M04_AXI_arvalid"), M04_AXI_arready("M04_AXI_arready"), M04_AXI_rdata("M04_AXI_rdata"), M04_AXI_rresp("M04_AXI_rresp"), M04_AXI_rvalid("M04_AXI_rvalid"), M04_AXI_rready("M04_AXI_rready"), M05_AXI_awaddr("M05_AXI_awaddr"), M05_AXI_awprot("M05_AXI_awprot"), M05_AXI_awvalid("M05_AXI_awvalid"), M05_AXI_awready("M05_AXI_awready"), M05_AXI_wdata("M05_AXI_wdata"), M05_AXI_wstrb("M05_AXI_wstrb"), M05_AXI_wvalid("M05_AXI_wvalid"), M05_AXI_wready("M05_AXI_wready"), M05_AXI_bresp("M05_AXI_bresp"), M05_AXI_bvalid("M05_AXI_bvalid"), M05_AXI_bready("M05_AXI_bready"), M05_AXI_araddr("M05_AXI_araddr"), M05_AXI_arprot("M05_AXI_arprot"), M05_AXI_arvalid("M05_AXI_arvalid"), M05_AXI_arready("M05_AXI_arready"), M05_AXI_rdata("M05_AXI_rdata"), M05_AXI_rresp("M05_AXI_rresp"), M05_AXI_rvalid("M05_AXI_rvalid"), M05_AXI_rready("M05_AXI_rready"), M06_AXI_awaddr("M06_AXI_awaddr"), M06_AXI_awprot("M06_AXI_awprot"), M06_AXI_awvalid("M06_AXI_awvalid"), M06_AXI_awready("M06_AXI_awready"), M06_AXI_wdata("M06_AXI_wdata"), M06_AXI_wstrb("M06_AXI_wstrb"), M06_AXI_wvalid("M06_AXI_wvalid"), M06_AXI_wready("M06_AXI_wready"), M06_AXI_bresp("M06_AXI_bresp"), M06_AXI_bvalid("M06_AXI_bvalid"), M06_AXI_bready("M06_AXI_bready"), M06_AXI_araddr("M06_AXI_araddr"), M06_AXI_arprot("M06_AXI_arprot"), M06_AXI_arvalid("M06_AXI_arvalid"), M06_AXI_arready("M06_AXI_arready"), M06_AXI_rdata("M06_AXI_rdata"), M06_AXI_rresp("M06_AXI_rresp"), M06_AXI_rvalid("M06_AXI_rvalid"), M06_AXI_rready("M06_AXI_rready"), M07_AXI_awaddr("M07_AXI_awaddr"), M07_AXI_awprot("M07_AXI_awprot"), M07_AXI_awvalid("M07_AXI_awvalid"), M07_AXI_awready("M07_AXI_awready"), M07_AXI_wdata("M07_AXI_wdata"), M07_AXI_wstrb("M07_AXI_wstrb"), M07_AXI_wvalid("M07_AXI_wvalid"), M07_AXI_wready("M07_AXI_wready"), M07_AXI_bresp("M07_AXI_bresp"), M07_AXI_bvalid("M07_AXI_bvalid"), M07_AXI_bready("M07_AXI_bready"), M07_AXI_araddr("M07_AXI_araddr"), M07_AXI_arprot("M07_AXI_arprot"), M07_AXI_arvalid("M07_AXI_arvalid"), M07_AXI_arready("M07_AXI_arready"), M07_AXI_rdata("M07_AXI_rdata"), M07_AXI_rresp("M07_AXI_rresp"), M07_AXI_rvalid("M07_AXI_rvalid"), M07_AXI_rready("M07_AXI_rready")
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S00_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M01_AXI_transactor = NULL;
  mp_M02_AXI_transactor = NULL;
  mp_M03_AXI_transactor = NULL;
  mp_M04_AXI_transactor = NULL;
  mp_M05_AXI_transactor = NULL;
  mp_M06_AXI_transactor = NULL;
  mp_M07_AXI_transactor = NULL;

  // initialize socket stubs

}

void system_axi_hpm0_lpd_interconnect_0::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "40");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<32,40,16,16,1,1,16,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWID(S00_AXI_awid);
    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWUSER(S00_AXI_awuser);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BID(S00_AXI_bid);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->ARID(S00_AXI_arid);
    mp_S00_AXI_transactor->ARADDR(S00_AXI_araddr);
    mp_S00_AXI_transactor->ARLEN(S00_AXI_arlen);
    mp_S00_AXI_transactor->ARSIZE(S00_AXI_arsize);
    mp_S00_AXI_transactor->ARBURST(S00_AXI_arburst);
    mp_S00_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_arlock_converter");
    mp_S00_AXI_arlock_converter->vector_in(S00_AXI_arlock);
    mp_S00_AXI_arlock_converter->scalar_out(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARLOCK(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARCACHE(S00_AXI_arcache);
    mp_S00_AXI_transactor->ARPROT(S00_AXI_arprot);
    mp_S00_AXI_transactor->ARQOS(S00_AXI_arqos);
    mp_S00_AXI_transactor->ARUSER(S00_AXI_aruser);
    mp_S00_AXI_transactor->ARVALID(S00_AXI_arvalid);
    mp_S00_AXI_transactor->ARREADY(S00_AXI_arready);
    mp_S00_AXI_transactor->RID(S00_AXI_rid);
    mp_S00_AXI_transactor->RDATA(S00_AXI_rdata);
    mp_S00_AXI_transactor->RRESP(S00_AXI_rresp);
    mp_S00_AXI_transactor->RLAST(S00_AXI_rlast);
    mp_S00_AXI_transactor->RVALID(S00_AXI_rvalid);
    mp_S00_AXI_transactor->RREADY(S00_AXI_rready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M01_AXI' transactor parameters
    xsc::common_cpp::properties M01_AXI_transactor_param_props;
    M01_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M01_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M01_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M01_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M01_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M01_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M01_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M01_AXI_transactor", M01_AXI_transactor_param_props);

    // M01_AXI' transactor ports

    mp_M01_AXI_transactor->AWADDR(M01_AXI_awaddr);
    mp_M01_AXI_transactor->AWPROT(M01_AXI_awprot);
    mp_M01_AXI_transactor->AWVALID(M01_AXI_awvalid);
    mp_M01_AXI_transactor->AWREADY(M01_AXI_awready);
    mp_M01_AXI_transactor->WDATA(M01_AXI_wdata);
    mp_M01_AXI_transactor->WSTRB(M01_AXI_wstrb);
    mp_M01_AXI_transactor->WVALID(M01_AXI_wvalid);
    mp_M01_AXI_transactor->WREADY(M01_AXI_wready);
    mp_M01_AXI_transactor->BRESP(M01_AXI_bresp);
    mp_M01_AXI_transactor->BVALID(M01_AXI_bvalid);
    mp_M01_AXI_transactor->BREADY(M01_AXI_bready);
    mp_M01_AXI_transactor->ARADDR(M01_AXI_araddr);
    mp_M01_AXI_transactor->ARPROT(M01_AXI_arprot);
    mp_M01_AXI_transactor->ARVALID(M01_AXI_arvalid);
    mp_M01_AXI_transactor->ARREADY(M01_AXI_arready);
    mp_M01_AXI_transactor->RDATA(M01_AXI_rdata);
    mp_M01_AXI_transactor->RRESP(M01_AXI_rresp);
    mp_M01_AXI_transactor->RVALID(M01_AXI_rvalid);
    mp_M01_AXI_transactor->RREADY(M01_AXI_rready);
    mp_M01_AXI_transactor->CLK(aclk);
    mp_M01_AXI_transactor->RST(aresetn);

    // M01_AXI' transactor sockets

    mp_impl->M01_AXI_tlm_aximm_read_socket->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_impl->M01_AXI_tlm_aximm_write_socket->bind(*(mp_M01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M02_AXI' transactor parameters
    xsc::common_cpp::properties M02_AXI_transactor_param_props;
    M02_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M02_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M02_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M02_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M02_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M02_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M02_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M02_AXI_transactor", M02_AXI_transactor_param_props);

    // M02_AXI' transactor ports

    mp_M02_AXI_transactor->AWADDR(M02_AXI_awaddr);
    mp_M02_AXI_transactor->AWPROT(M02_AXI_awprot);
    mp_M02_AXI_transactor->AWVALID(M02_AXI_awvalid);
    mp_M02_AXI_transactor->AWREADY(M02_AXI_awready);
    mp_M02_AXI_transactor->WDATA(M02_AXI_wdata);
    mp_M02_AXI_transactor->WSTRB(M02_AXI_wstrb);
    mp_M02_AXI_transactor->WVALID(M02_AXI_wvalid);
    mp_M02_AXI_transactor->WREADY(M02_AXI_wready);
    mp_M02_AXI_transactor->BRESP(M02_AXI_bresp);
    mp_M02_AXI_transactor->BVALID(M02_AXI_bvalid);
    mp_M02_AXI_transactor->BREADY(M02_AXI_bready);
    mp_M02_AXI_transactor->ARADDR(M02_AXI_araddr);
    mp_M02_AXI_transactor->ARPROT(M02_AXI_arprot);
    mp_M02_AXI_transactor->ARVALID(M02_AXI_arvalid);
    mp_M02_AXI_transactor->ARREADY(M02_AXI_arready);
    mp_M02_AXI_transactor->RDATA(M02_AXI_rdata);
    mp_M02_AXI_transactor->RRESP(M02_AXI_rresp);
    mp_M02_AXI_transactor->RVALID(M02_AXI_rvalid);
    mp_M02_AXI_transactor->RREADY(M02_AXI_rready);
    mp_M02_AXI_transactor->CLK(aclk);
    mp_M02_AXI_transactor->RST(aresetn);

    // M02_AXI' transactor sockets

    mp_impl->M02_AXI_tlm_aximm_read_socket->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_impl->M02_AXI_tlm_aximm_write_socket->bind(*(mp_M02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M03_AXI' transactor parameters
    xsc::common_cpp::properties M03_AXI_transactor_param_props;
    M03_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M03_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M03_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M03_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M03_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M03_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M03_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M03_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M03_AXI_transactor", M03_AXI_transactor_param_props);

    // M03_AXI' transactor ports

    mp_M03_AXI_transactor->AWADDR(M03_AXI_awaddr);
    mp_M03_AXI_transactor->AWPROT(M03_AXI_awprot);
    mp_M03_AXI_transactor->AWVALID(M03_AXI_awvalid);
    mp_M03_AXI_transactor->AWREADY(M03_AXI_awready);
    mp_M03_AXI_transactor->WDATA(M03_AXI_wdata);
    mp_M03_AXI_transactor->WSTRB(M03_AXI_wstrb);
    mp_M03_AXI_transactor->WVALID(M03_AXI_wvalid);
    mp_M03_AXI_transactor->WREADY(M03_AXI_wready);
    mp_M03_AXI_transactor->BRESP(M03_AXI_bresp);
    mp_M03_AXI_transactor->BVALID(M03_AXI_bvalid);
    mp_M03_AXI_transactor->BREADY(M03_AXI_bready);
    mp_M03_AXI_transactor->ARADDR(M03_AXI_araddr);
    mp_M03_AXI_transactor->ARPROT(M03_AXI_arprot);
    mp_M03_AXI_transactor->ARVALID(M03_AXI_arvalid);
    mp_M03_AXI_transactor->ARREADY(M03_AXI_arready);
    mp_M03_AXI_transactor->RDATA(M03_AXI_rdata);
    mp_M03_AXI_transactor->RRESP(M03_AXI_rresp);
    mp_M03_AXI_transactor->RVALID(M03_AXI_rvalid);
    mp_M03_AXI_transactor->RREADY(M03_AXI_rready);
    mp_M03_AXI_transactor->CLK(aclk);
    mp_M03_AXI_transactor->RST(aresetn);

    // M03_AXI' transactor sockets

    mp_impl->M03_AXI_tlm_aximm_read_socket->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_impl->M03_AXI_tlm_aximm_write_socket->bind(*(mp_M03_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M04_AXI' transactor parameters
    xsc::common_cpp::properties M04_AXI_transactor_param_props;
    M04_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M04_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M04_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M04_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M04_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M04_AXI_transactor", M04_AXI_transactor_param_props);

    // M04_AXI' transactor ports

    mp_M04_AXI_transactor->AWADDR(M04_AXI_awaddr);
    mp_M04_AXI_transactor->AWPROT(M04_AXI_awprot);
    mp_M04_AXI_transactor->AWVALID(M04_AXI_awvalid);
    mp_M04_AXI_transactor->AWREADY(M04_AXI_awready);
    mp_M04_AXI_transactor->WDATA(M04_AXI_wdata);
    mp_M04_AXI_transactor->WSTRB(M04_AXI_wstrb);
    mp_M04_AXI_transactor->WVALID(M04_AXI_wvalid);
    mp_M04_AXI_transactor->WREADY(M04_AXI_wready);
    mp_M04_AXI_transactor->BRESP(M04_AXI_bresp);
    mp_M04_AXI_transactor->BVALID(M04_AXI_bvalid);
    mp_M04_AXI_transactor->BREADY(M04_AXI_bready);
    mp_M04_AXI_transactor->ARADDR(M04_AXI_araddr);
    mp_M04_AXI_transactor->ARPROT(M04_AXI_arprot);
    mp_M04_AXI_transactor->ARVALID(M04_AXI_arvalid);
    mp_M04_AXI_transactor->ARREADY(M04_AXI_arready);
    mp_M04_AXI_transactor->RDATA(M04_AXI_rdata);
    mp_M04_AXI_transactor->RRESP(M04_AXI_rresp);
    mp_M04_AXI_transactor->RVALID(M04_AXI_rvalid);
    mp_M04_AXI_transactor->RREADY(M04_AXI_rready);
    mp_M04_AXI_transactor->CLK(aclk);
    mp_M04_AXI_transactor->RST(aresetn);

    // M04_AXI' transactor sockets

    mp_impl->M04_AXI_tlm_aximm_read_socket->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_impl->M04_AXI_tlm_aximm_write_socket->bind(*(mp_M04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M05_AXI' transactor parameters
    xsc::common_cpp::properties M05_AXI_transactor_param_props;
    M05_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M05_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M05_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M05_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M05_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M05_AXI_transactor", M05_AXI_transactor_param_props);

    // M05_AXI' transactor ports

    mp_M05_AXI_transactor->AWADDR(M05_AXI_awaddr);
    mp_M05_AXI_transactor->AWPROT(M05_AXI_awprot);
    mp_M05_AXI_transactor->AWVALID(M05_AXI_awvalid);
    mp_M05_AXI_transactor->AWREADY(M05_AXI_awready);
    mp_M05_AXI_transactor->WDATA(M05_AXI_wdata);
    mp_M05_AXI_transactor->WSTRB(M05_AXI_wstrb);
    mp_M05_AXI_transactor->WVALID(M05_AXI_wvalid);
    mp_M05_AXI_transactor->WREADY(M05_AXI_wready);
    mp_M05_AXI_transactor->BRESP(M05_AXI_bresp);
    mp_M05_AXI_transactor->BVALID(M05_AXI_bvalid);
    mp_M05_AXI_transactor->BREADY(M05_AXI_bready);
    mp_M05_AXI_transactor->ARADDR(M05_AXI_araddr);
    mp_M05_AXI_transactor->ARPROT(M05_AXI_arprot);
    mp_M05_AXI_transactor->ARVALID(M05_AXI_arvalid);
    mp_M05_AXI_transactor->ARREADY(M05_AXI_arready);
    mp_M05_AXI_transactor->RDATA(M05_AXI_rdata);
    mp_M05_AXI_transactor->RRESP(M05_AXI_rresp);
    mp_M05_AXI_transactor->RVALID(M05_AXI_rvalid);
    mp_M05_AXI_transactor->RREADY(M05_AXI_rready);
    mp_M05_AXI_transactor->CLK(aclk);
    mp_M05_AXI_transactor->RST(aresetn);

    // M05_AXI' transactor sockets

    mp_impl->M05_AXI_tlm_aximm_read_socket->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_impl->M05_AXI_tlm_aximm_write_socket->bind(*(mp_M05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M06_AXI' transactor parameters
    xsc::common_cpp::properties M06_AXI_transactor_param_props;
    M06_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "13");
    M06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M06_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M06_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M06_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M06_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,13,1,1,1,1,1,1>("M06_AXI_transactor", M06_AXI_transactor_param_props);

    // M06_AXI' transactor ports

    mp_M06_AXI_transactor->AWADDR(M06_AXI_awaddr);
    mp_M06_AXI_transactor->AWPROT(M06_AXI_awprot);
    mp_M06_AXI_transactor->AWVALID(M06_AXI_awvalid);
    mp_M06_AXI_transactor->AWREADY(M06_AXI_awready);
    mp_M06_AXI_transactor->WDATA(M06_AXI_wdata);
    mp_M06_AXI_transactor->WSTRB(M06_AXI_wstrb);
    mp_M06_AXI_transactor->WVALID(M06_AXI_wvalid);
    mp_M06_AXI_transactor->WREADY(M06_AXI_wready);
    mp_M06_AXI_transactor->BRESP(M06_AXI_bresp);
    mp_M06_AXI_transactor->BVALID(M06_AXI_bvalid);
    mp_M06_AXI_transactor->BREADY(M06_AXI_bready);
    mp_M06_AXI_transactor->ARADDR(M06_AXI_araddr);
    mp_M06_AXI_transactor->ARPROT(M06_AXI_arprot);
    mp_M06_AXI_transactor->ARVALID(M06_AXI_arvalid);
    mp_M06_AXI_transactor->ARREADY(M06_AXI_arready);
    mp_M06_AXI_transactor->RDATA(M06_AXI_rdata);
    mp_M06_AXI_transactor->RRESP(M06_AXI_rresp);
    mp_M06_AXI_transactor->RVALID(M06_AXI_rvalid);
    mp_M06_AXI_transactor->RREADY(M06_AXI_rready);
    mp_M06_AXI_transactor->CLK(aclk);
    mp_M06_AXI_transactor->RST(aresetn);

    // M06_AXI' transactor sockets

    mp_impl->M06_AXI_tlm_aximm_read_socket->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_impl->M06_AXI_tlm_aximm_write_socket->bind(*(mp_M06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M07_AXI' transactor parameters
    xsc::common_cpp::properties M07_AXI_transactor_param_props;
    M07_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M07_AXI_transactor_param_props.addLong("FREQ_HZ", "100000000");
    M07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M07_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M07_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M07_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_axi_adrv9001_0_dac_1_clk");

    mp_M07_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M07_AXI_transactor", M07_AXI_transactor_param_props);

    // M07_AXI' transactor ports

    mp_M07_AXI_transactor->AWADDR(M07_AXI_awaddr);
    mp_M07_AXI_transactor->AWPROT(M07_AXI_awprot);
    mp_M07_AXI_transactor->AWVALID(M07_AXI_awvalid);
    mp_M07_AXI_transactor->AWREADY(M07_AXI_awready);
    mp_M07_AXI_transactor->WDATA(M07_AXI_wdata);
    mp_M07_AXI_transactor->WSTRB(M07_AXI_wstrb);
    mp_M07_AXI_transactor->WVALID(M07_AXI_wvalid);
    mp_M07_AXI_transactor->WREADY(M07_AXI_wready);
    mp_M07_AXI_transactor->BRESP(M07_AXI_bresp);
    mp_M07_AXI_transactor->BVALID(M07_AXI_bvalid);
    mp_M07_AXI_transactor->BREADY(M07_AXI_bready);
    mp_M07_AXI_transactor->ARADDR(M07_AXI_araddr);
    mp_M07_AXI_transactor->ARPROT(M07_AXI_arprot);
    mp_M07_AXI_transactor->ARVALID(M07_AXI_arvalid);
    mp_M07_AXI_transactor->ARREADY(M07_AXI_arready);
    mp_M07_AXI_transactor->RDATA(M07_AXI_rdata);
    mp_M07_AXI_transactor->RRESP(M07_AXI_rresp);
    mp_M07_AXI_transactor->RVALID(M07_AXI_rvalid);
    mp_M07_AXI_transactor->RREADY(M07_AXI_rready);
    mp_M07_AXI_transactor->CLK(aclk1);
    mp_M07_AXI_transactor->RST(aresetn);

    // M07_AXI' transactor sockets

    mp_impl->M07_AXI_tlm_aximm_read_socket->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_impl->M07_AXI_tlm_aximm_write_socket->bind(*(mp_M07_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
system_axi_hpm0_lpd_interconnect_0::system_axi_hpm0_lpd_interconnect_0(const sc_core::sc_module_name& nm) : system_axi_hpm0_lpd_interconnect_0_sc(nm), aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awid("S00_AXI_awid"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awuser("S00_AXI_awuser"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bid("S00_AXI_bid"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S00_AXI_arid("S00_AXI_arid"), S00_AXI_araddr("S00_AXI_araddr"), S00_AXI_arlen("S00_AXI_arlen"), S00_AXI_arsize("S00_AXI_arsize"), S00_AXI_arburst("S00_AXI_arburst"), S00_AXI_arlock("S00_AXI_arlock"), S00_AXI_arcache("S00_AXI_arcache"), S00_AXI_arprot("S00_AXI_arprot"), S00_AXI_arqos("S00_AXI_arqos"), S00_AXI_aruser("S00_AXI_aruser"), S00_AXI_arvalid("S00_AXI_arvalid"), S00_AXI_arready("S00_AXI_arready"), S00_AXI_rid("S00_AXI_rid"), S00_AXI_rdata("S00_AXI_rdata"), S00_AXI_rresp("S00_AXI_rresp"), S00_AXI_rlast("S00_AXI_rlast"), S00_AXI_rvalid("S00_AXI_rvalid"), S00_AXI_rready("S00_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"), M01_AXI_awaddr("M01_AXI_awaddr"), M01_AXI_awprot("M01_AXI_awprot"), M01_AXI_awvalid("M01_AXI_awvalid"), M01_AXI_awready("M01_AXI_awready"), M01_AXI_wdata("M01_AXI_wdata"), M01_AXI_wstrb("M01_AXI_wstrb"), M01_AXI_wvalid("M01_AXI_wvalid"), M01_AXI_wready("M01_AXI_wready"), M01_AXI_bresp("M01_AXI_bresp"), M01_AXI_bvalid("M01_AXI_bvalid"), M01_AXI_bready("M01_AXI_bready"), M01_AXI_araddr("M01_AXI_araddr"), M01_AXI_arprot("M01_AXI_arprot"), M01_AXI_arvalid("M01_AXI_arvalid"), M01_AXI_arready("M01_AXI_arready"), M01_AXI_rdata("M01_AXI_rdata"), M01_AXI_rresp("M01_AXI_rresp"), M01_AXI_rvalid("M01_AXI_rvalid"), M01_AXI_rready("M01_AXI_rready"), M02_AXI_awaddr("M02_AXI_awaddr"), M02_AXI_awprot("M02_AXI_awprot"), M02_AXI_awvalid("M02_AXI_awvalid"), M02_AXI_awready("M02_AXI_awready"), M02_AXI_wdata("M02_AXI_wdata"), M02_AXI_wstrb("M02_AXI_wstrb"), M02_AXI_wvalid("M02_AXI_wvalid"), M02_AXI_wready("M02_AXI_wready"), M02_AXI_bresp("M02_AXI_bresp"), M02_AXI_bvalid("M02_AXI_bvalid"), M02_AXI_bready("M02_AXI_bready"), M02_AXI_araddr("M02_AXI_araddr"), M02_AXI_arprot("M02_AXI_arprot"), M02_AXI_arvalid("M02_AXI_arvalid"), M02_AXI_arready("M02_AXI_arready"), M02_AXI_rdata("M02_AXI_rdata"), M02_AXI_rresp("M02_AXI_rresp"), M02_AXI_rvalid("M02_AXI_rvalid"), M02_AXI_rready("M02_AXI_rready"), M03_AXI_awaddr("M03_AXI_awaddr"), M03_AXI_awprot("M03_AXI_awprot"), M03_AXI_awvalid("M03_AXI_awvalid"), M03_AXI_awready("M03_AXI_awready"), M03_AXI_wdata("M03_AXI_wdata"), M03_AXI_wstrb("M03_AXI_wstrb"), M03_AXI_wvalid("M03_AXI_wvalid"), M03_AXI_wready("M03_AXI_wready"), M03_AXI_bresp("M03_AXI_bresp"), M03_AXI_bvalid("M03_AXI_bvalid"), M03_AXI_bready("M03_AXI_bready"), M03_AXI_araddr("M03_AXI_araddr"), M03_AXI_arprot("M03_AXI_arprot"), M03_AXI_arvalid("M03_AXI_arvalid"), M03_AXI_arready("M03_AXI_arready"), M03_AXI_rdata("M03_AXI_rdata"), M03_AXI_rresp("M03_AXI_rresp"), M03_AXI_rvalid("M03_AXI_rvalid"), M03_AXI_rready("M03_AXI_rready"), M04_AXI_awaddr("M04_AXI_awaddr"), M04_AXI_awprot("M04_AXI_awprot"), M04_AXI_awvalid("M04_AXI_awvalid"), M04_AXI_awready("M04_AXI_awready"), M04_AXI_wdata("M04_AXI_wdata"), M04_AXI_wstrb("M04_AXI_wstrb"), M04_AXI_wvalid("M04_AXI_wvalid"), M04_AXI_wready("M04_AXI_wready"), M04_AXI_bresp("M04_AXI_bresp"), M04_AXI_bvalid("M04_AXI_bvalid"), M04_AXI_bready("M04_AXI_bready"), M04_AXI_araddr("M04_AXI_araddr"), M04_AXI_arprot("M04_AXI_arprot"), M04_AXI_arvalid("M04_AXI_arvalid"), M04_AXI_arready("M04_AXI_arready"), M04_AXI_rdata("M04_AXI_rdata"), M04_AXI_rresp("M04_AXI_rresp"), M04_AXI_rvalid("M04_AXI_rvalid"), M04_AXI_rready("M04_AXI_rready"), M05_AXI_awaddr("M05_AXI_awaddr"), M05_AXI_awprot("M05_AXI_awprot"), M05_AXI_awvalid("M05_AXI_awvalid"), M05_AXI_awready("M05_AXI_awready"), M05_AXI_wdata("M05_AXI_wdata"), M05_AXI_wstrb("M05_AXI_wstrb"), M05_AXI_wvalid("M05_AXI_wvalid"), M05_AXI_wready("M05_AXI_wready"), M05_AXI_bresp("M05_AXI_bresp"), M05_AXI_bvalid("M05_AXI_bvalid"), M05_AXI_bready("M05_AXI_bready"), M05_AXI_araddr("M05_AXI_araddr"), M05_AXI_arprot("M05_AXI_arprot"), M05_AXI_arvalid("M05_AXI_arvalid"), M05_AXI_arready("M05_AXI_arready"), M05_AXI_rdata("M05_AXI_rdata"), M05_AXI_rresp("M05_AXI_rresp"), M05_AXI_rvalid("M05_AXI_rvalid"), M05_AXI_rready("M05_AXI_rready"), M06_AXI_awaddr("M06_AXI_awaddr"), M06_AXI_awprot("M06_AXI_awprot"), M06_AXI_awvalid("M06_AXI_awvalid"), M06_AXI_awready("M06_AXI_awready"), M06_AXI_wdata("M06_AXI_wdata"), M06_AXI_wstrb("M06_AXI_wstrb"), M06_AXI_wvalid("M06_AXI_wvalid"), M06_AXI_wready("M06_AXI_wready"), M06_AXI_bresp("M06_AXI_bresp"), M06_AXI_bvalid("M06_AXI_bvalid"), M06_AXI_bready("M06_AXI_bready"), M06_AXI_araddr("M06_AXI_araddr"), M06_AXI_arprot("M06_AXI_arprot"), M06_AXI_arvalid("M06_AXI_arvalid"), M06_AXI_arready("M06_AXI_arready"), M06_AXI_rdata("M06_AXI_rdata"), M06_AXI_rresp("M06_AXI_rresp"), M06_AXI_rvalid("M06_AXI_rvalid"), M06_AXI_rready("M06_AXI_rready"), M07_AXI_awaddr("M07_AXI_awaddr"), M07_AXI_awprot("M07_AXI_awprot"), M07_AXI_awvalid("M07_AXI_awvalid"), M07_AXI_awready("M07_AXI_awready"), M07_AXI_wdata("M07_AXI_wdata"), M07_AXI_wstrb("M07_AXI_wstrb"), M07_AXI_wvalid("M07_AXI_wvalid"), M07_AXI_wready("M07_AXI_wready"), M07_AXI_bresp("M07_AXI_bresp"), M07_AXI_bvalid("M07_AXI_bvalid"), M07_AXI_bready("M07_AXI_bready"), M07_AXI_araddr("M07_AXI_araddr"), M07_AXI_arprot("M07_AXI_arprot"), M07_AXI_arvalid("M07_AXI_arvalid"), M07_AXI_arready("M07_AXI_arready"), M07_AXI_rdata("M07_AXI_rdata"), M07_AXI_rresp("M07_AXI_rresp"), M07_AXI_rvalid("M07_AXI_rvalid"), M07_AXI_rready("M07_AXI_rready")
{

  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S00_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M01_AXI_transactor = NULL;
  mp_M02_AXI_transactor = NULL;
  mp_M03_AXI_transactor = NULL;
  mp_M04_AXI_transactor = NULL;
  mp_M05_AXI_transactor = NULL;
  mp_M06_AXI_transactor = NULL;
  mp_M07_AXI_transactor = NULL;

  // initialize socket stubs

}

void system_axi_hpm0_lpd_interconnect_0::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "S00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'S00_AXI' transactor parameters
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "40");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<32,40,16,16,1,1,16,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);

    // S00_AXI' transactor ports

    mp_S00_AXI_transactor->AWID(S00_AXI_awid);
    mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
    mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
    mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
    mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
    mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
    mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
    mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
    mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
    mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
    mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
    mp_S00_AXI_transactor->AWUSER(S00_AXI_awuser);
    mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
    mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
    mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
    mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
    mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
    mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
    mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
    mp_S00_AXI_transactor->BID(S00_AXI_bid);
    mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
    mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
    mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
    mp_S00_AXI_transactor->ARID(S00_AXI_arid);
    mp_S00_AXI_transactor->ARADDR(S00_AXI_araddr);
    mp_S00_AXI_transactor->ARLEN(S00_AXI_arlen);
    mp_S00_AXI_transactor->ARSIZE(S00_AXI_arsize);
    mp_S00_AXI_transactor->ARBURST(S00_AXI_arburst);
    mp_S00_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_arlock_converter");
    mp_S00_AXI_arlock_converter->vector_in(S00_AXI_arlock);
    mp_S00_AXI_arlock_converter->scalar_out(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARLOCK(m_S00_AXI_arlock_converter_signal);
    mp_S00_AXI_transactor->ARCACHE(S00_AXI_arcache);
    mp_S00_AXI_transactor->ARPROT(S00_AXI_arprot);
    mp_S00_AXI_transactor->ARQOS(S00_AXI_arqos);
    mp_S00_AXI_transactor->ARUSER(S00_AXI_aruser);
    mp_S00_AXI_transactor->ARVALID(S00_AXI_arvalid);
    mp_S00_AXI_transactor->ARREADY(S00_AXI_arready);
    mp_S00_AXI_transactor->RID(S00_AXI_rid);
    mp_S00_AXI_transactor->RDATA(S00_AXI_rdata);
    mp_S00_AXI_transactor->RRESP(S00_AXI_rresp);
    mp_S00_AXI_transactor->RLAST(S00_AXI_rlast);
    mp_S00_AXI_transactor->RVALID(S00_AXI_rvalid);
    mp_S00_AXI_transactor->RREADY(S00_AXI_rready);
    mp_S00_AXI_transactor->CLK(aclk);
    mp_S00_AXI_transactor->RST(aresetn);

    // S00_AXI' transactor sockets

    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M00_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M00_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M00_AXI' transactor parameters
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);

    // M00_AXI' transactor ports

    mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
    mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
    mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
    mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
    mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
    mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
    mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
    mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
    mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
    mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
    mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
    mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
    mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
    mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
    mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
    mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
    mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
    mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
    mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
    mp_M00_AXI_transactor->CLK(aclk);
    mp_M00_AXI_transactor->RST(aresetn);

    // M00_AXI' transactor sockets

    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M01_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M01_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M01_AXI' transactor parameters
    xsc::common_cpp::properties M01_AXI_transactor_param_props;
    M01_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M01_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M01_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M01_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M01_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M01_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M01_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M01_AXI_transactor", M01_AXI_transactor_param_props);

    // M01_AXI' transactor ports

    mp_M01_AXI_transactor->AWADDR(M01_AXI_awaddr);
    mp_M01_AXI_transactor->AWPROT(M01_AXI_awprot);
    mp_M01_AXI_transactor->AWVALID(M01_AXI_awvalid);
    mp_M01_AXI_transactor->AWREADY(M01_AXI_awready);
    mp_M01_AXI_transactor->WDATA(M01_AXI_wdata);
    mp_M01_AXI_transactor->WSTRB(M01_AXI_wstrb);
    mp_M01_AXI_transactor->WVALID(M01_AXI_wvalid);
    mp_M01_AXI_transactor->WREADY(M01_AXI_wready);
    mp_M01_AXI_transactor->BRESP(M01_AXI_bresp);
    mp_M01_AXI_transactor->BVALID(M01_AXI_bvalid);
    mp_M01_AXI_transactor->BREADY(M01_AXI_bready);
    mp_M01_AXI_transactor->ARADDR(M01_AXI_araddr);
    mp_M01_AXI_transactor->ARPROT(M01_AXI_arprot);
    mp_M01_AXI_transactor->ARVALID(M01_AXI_arvalid);
    mp_M01_AXI_transactor->ARREADY(M01_AXI_arready);
    mp_M01_AXI_transactor->RDATA(M01_AXI_rdata);
    mp_M01_AXI_transactor->RRESP(M01_AXI_rresp);
    mp_M01_AXI_transactor->RVALID(M01_AXI_rvalid);
    mp_M01_AXI_transactor->RREADY(M01_AXI_rready);
    mp_M01_AXI_transactor->CLK(aclk);
    mp_M01_AXI_transactor->RST(aresetn);

    // M01_AXI' transactor sockets

    mp_impl->M01_AXI_tlm_aximm_read_socket->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_impl->M01_AXI_tlm_aximm_write_socket->bind(*(mp_M01_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M02_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M02_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M02_AXI' transactor parameters
    xsc::common_cpp::properties M02_AXI_transactor_param_props;
    M02_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M02_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M02_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M02_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M02_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M02_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M02_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M02_AXI_transactor", M02_AXI_transactor_param_props);

    // M02_AXI' transactor ports

    mp_M02_AXI_transactor->AWADDR(M02_AXI_awaddr);
    mp_M02_AXI_transactor->AWPROT(M02_AXI_awprot);
    mp_M02_AXI_transactor->AWVALID(M02_AXI_awvalid);
    mp_M02_AXI_transactor->AWREADY(M02_AXI_awready);
    mp_M02_AXI_transactor->WDATA(M02_AXI_wdata);
    mp_M02_AXI_transactor->WSTRB(M02_AXI_wstrb);
    mp_M02_AXI_transactor->WVALID(M02_AXI_wvalid);
    mp_M02_AXI_transactor->WREADY(M02_AXI_wready);
    mp_M02_AXI_transactor->BRESP(M02_AXI_bresp);
    mp_M02_AXI_transactor->BVALID(M02_AXI_bvalid);
    mp_M02_AXI_transactor->BREADY(M02_AXI_bready);
    mp_M02_AXI_transactor->ARADDR(M02_AXI_araddr);
    mp_M02_AXI_transactor->ARPROT(M02_AXI_arprot);
    mp_M02_AXI_transactor->ARVALID(M02_AXI_arvalid);
    mp_M02_AXI_transactor->ARREADY(M02_AXI_arready);
    mp_M02_AXI_transactor->RDATA(M02_AXI_rdata);
    mp_M02_AXI_transactor->RRESP(M02_AXI_rresp);
    mp_M02_AXI_transactor->RVALID(M02_AXI_rvalid);
    mp_M02_AXI_transactor->RREADY(M02_AXI_rready);
    mp_M02_AXI_transactor->CLK(aclk);
    mp_M02_AXI_transactor->RST(aresetn);

    // M02_AXI' transactor sockets

    mp_impl->M02_AXI_tlm_aximm_read_socket->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_impl->M02_AXI_tlm_aximm_write_socket->bind(*(mp_M02_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M03_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M03_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M03_AXI' transactor parameters
    xsc::common_cpp::properties M03_AXI_transactor_param_props;
    M03_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M03_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M03_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M03_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M03_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M03_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M03_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M03_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M03_AXI_transactor", M03_AXI_transactor_param_props);

    // M03_AXI' transactor ports

    mp_M03_AXI_transactor->AWADDR(M03_AXI_awaddr);
    mp_M03_AXI_transactor->AWPROT(M03_AXI_awprot);
    mp_M03_AXI_transactor->AWVALID(M03_AXI_awvalid);
    mp_M03_AXI_transactor->AWREADY(M03_AXI_awready);
    mp_M03_AXI_transactor->WDATA(M03_AXI_wdata);
    mp_M03_AXI_transactor->WSTRB(M03_AXI_wstrb);
    mp_M03_AXI_transactor->WVALID(M03_AXI_wvalid);
    mp_M03_AXI_transactor->WREADY(M03_AXI_wready);
    mp_M03_AXI_transactor->BRESP(M03_AXI_bresp);
    mp_M03_AXI_transactor->BVALID(M03_AXI_bvalid);
    mp_M03_AXI_transactor->BREADY(M03_AXI_bready);
    mp_M03_AXI_transactor->ARADDR(M03_AXI_araddr);
    mp_M03_AXI_transactor->ARPROT(M03_AXI_arprot);
    mp_M03_AXI_transactor->ARVALID(M03_AXI_arvalid);
    mp_M03_AXI_transactor->ARREADY(M03_AXI_arready);
    mp_M03_AXI_transactor->RDATA(M03_AXI_rdata);
    mp_M03_AXI_transactor->RRESP(M03_AXI_rresp);
    mp_M03_AXI_transactor->RVALID(M03_AXI_rvalid);
    mp_M03_AXI_transactor->RREADY(M03_AXI_rready);
    mp_M03_AXI_transactor->CLK(aclk);
    mp_M03_AXI_transactor->RST(aresetn);

    // M03_AXI' transactor sockets

    mp_impl->M03_AXI_tlm_aximm_read_socket->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_impl->M03_AXI_tlm_aximm_write_socket->bind(*(mp_M03_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M04_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M04_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M04_AXI' transactor parameters
    xsc::common_cpp::properties M04_AXI_transactor_param_props;
    M04_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M04_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M04_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M04_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M04_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M04_AXI_transactor", M04_AXI_transactor_param_props);

    // M04_AXI' transactor ports

    mp_M04_AXI_transactor->AWADDR(M04_AXI_awaddr);
    mp_M04_AXI_transactor->AWPROT(M04_AXI_awprot);
    mp_M04_AXI_transactor->AWVALID(M04_AXI_awvalid);
    mp_M04_AXI_transactor->AWREADY(M04_AXI_awready);
    mp_M04_AXI_transactor->WDATA(M04_AXI_wdata);
    mp_M04_AXI_transactor->WSTRB(M04_AXI_wstrb);
    mp_M04_AXI_transactor->WVALID(M04_AXI_wvalid);
    mp_M04_AXI_transactor->WREADY(M04_AXI_wready);
    mp_M04_AXI_transactor->BRESP(M04_AXI_bresp);
    mp_M04_AXI_transactor->BVALID(M04_AXI_bvalid);
    mp_M04_AXI_transactor->BREADY(M04_AXI_bready);
    mp_M04_AXI_transactor->ARADDR(M04_AXI_araddr);
    mp_M04_AXI_transactor->ARPROT(M04_AXI_arprot);
    mp_M04_AXI_transactor->ARVALID(M04_AXI_arvalid);
    mp_M04_AXI_transactor->ARREADY(M04_AXI_arready);
    mp_M04_AXI_transactor->RDATA(M04_AXI_rdata);
    mp_M04_AXI_transactor->RRESP(M04_AXI_rresp);
    mp_M04_AXI_transactor->RVALID(M04_AXI_rvalid);
    mp_M04_AXI_transactor->RREADY(M04_AXI_rready);
    mp_M04_AXI_transactor->CLK(aclk);
    mp_M04_AXI_transactor->RST(aresetn);

    // M04_AXI' transactor sockets

    mp_impl->M04_AXI_tlm_aximm_read_socket->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_impl->M04_AXI_tlm_aximm_write_socket->bind(*(mp_M04_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M05_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M05_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M05_AXI' transactor parameters
    xsc::common_cpp::properties M05_AXI_transactor_param_props;
    M05_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M05_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M05_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M05_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M05_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M05_AXI_transactor", M05_AXI_transactor_param_props);

    // M05_AXI' transactor ports

    mp_M05_AXI_transactor->AWADDR(M05_AXI_awaddr);
    mp_M05_AXI_transactor->AWPROT(M05_AXI_awprot);
    mp_M05_AXI_transactor->AWVALID(M05_AXI_awvalid);
    mp_M05_AXI_transactor->AWREADY(M05_AXI_awready);
    mp_M05_AXI_transactor->WDATA(M05_AXI_wdata);
    mp_M05_AXI_transactor->WSTRB(M05_AXI_wstrb);
    mp_M05_AXI_transactor->WVALID(M05_AXI_wvalid);
    mp_M05_AXI_transactor->WREADY(M05_AXI_wready);
    mp_M05_AXI_transactor->BRESP(M05_AXI_bresp);
    mp_M05_AXI_transactor->BVALID(M05_AXI_bvalid);
    mp_M05_AXI_transactor->BREADY(M05_AXI_bready);
    mp_M05_AXI_transactor->ARADDR(M05_AXI_araddr);
    mp_M05_AXI_transactor->ARPROT(M05_AXI_arprot);
    mp_M05_AXI_transactor->ARVALID(M05_AXI_arvalid);
    mp_M05_AXI_transactor->ARREADY(M05_AXI_arready);
    mp_M05_AXI_transactor->RDATA(M05_AXI_rdata);
    mp_M05_AXI_transactor->RRESP(M05_AXI_rresp);
    mp_M05_AXI_transactor->RVALID(M05_AXI_rvalid);
    mp_M05_AXI_transactor->RREADY(M05_AXI_rready);
    mp_M05_AXI_transactor->CLK(aclk);
    mp_M05_AXI_transactor->RST(aresetn);

    // M05_AXI' transactor sockets

    mp_impl->M05_AXI_tlm_aximm_read_socket->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_impl->M05_AXI_tlm_aximm_write_socket->bind(*(mp_M05_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M06_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M06_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M06_AXI' transactor parameters
    xsc::common_cpp::properties M06_AXI_transactor_param_props;
    M06_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "13");
    M06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M06_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M06_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M06_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M06_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,13,1,1,1,1,1,1>("M06_AXI_transactor", M06_AXI_transactor_param_props);

    // M06_AXI' transactor ports

    mp_M06_AXI_transactor->AWADDR(M06_AXI_awaddr);
    mp_M06_AXI_transactor->AWPROT(M06_AXI_awprot);
    mp_M06_AXI_transactor->AWVALID(M06_AXI_awvalid);
    mp_M06_AXI_transactor->AWREADY(M06_AXI_awready);
    mp_M06_AXI_transactor->WDATA(M06_AXI_wdata);
    mp_M06_AXI_transactor->WSTRB(M06_AXI_wstrb);
    mp_M06_AXI_transactor->WVALID(M06_AXI_wvalid);
    mp_M06_AXI_transactor->WREADY(M06_AXI_wready);
    mp_M06_AXI_transactor->BRESP(M06_AXI_bresp);
    mp_M06_AXI_transactor->BVALID(M06_AXI_bvalid);
    mp_M06_AXI_transactor->BREADY(M06_AXI_bready);
    mp_M06_AXI_transactor->ARADDR(M06_AXI_araddr);
    mp_M06_AXI_transactor->ARPROT(M06_AXI_arprot);
    mp_M06_AXI_transactor->ARVALID(M06_AXI_arvalid);
    mp_M06_AXI_transactor->ARREADY(M06_AXI_arready);
    mp_M06_AXI_transactor->RDATA(M06_AXI_rdata);
    mp_M06_AXI_transactor->RRESP(M06_AXI_rresp);
    mp_M06_AXI_transactor->RVALID(M06_AXI_rvalid);
    mp_M06_AXI_transactor->RREADY(M06_AXI_rready);
    mp_M06_AXI_transactor->CLK(aclk);
    mp_M06_AXI_transactor->RST(aresetn);

    // M06_AXI' transactor sockets

    mp_impl->M06_AXI_tlm_aximm_read_socket->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_impl->M06_AXI_tlm_aximm_write_socket->bind(*(mp_M06_AXI_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'M07_AXI' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M07_AXI_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'M07_AXI' transactor parameters
    xsc::common_cpp::properties M07_AXI_transactor_param_props;
    M07_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M07_AXI_transactor_param_props.addLong("FREQ_HZ", "100000000");
    M07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M07_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M07_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M07_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_axi_adrv9001_0_dac_1_clk");

    mp_M07_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M07_AXI_transactor", M07_AXI_transactor_param_props);

    // M07_AXI' transactor ports

    mp_M07_AXI_transactor->AWADDR(M07_AXI_awaddr);
    mp_M07_AXI_transactor->AWPROT(M07_AXI_awprot);
    mp_M07_AXI_transactor->AWVALID(M07_AXI_awvalid);
    mp_M07_AXI_transactor->AWREADY(M07_AXI_awready);
    mp_M07_AXI_transactor->WDATA(M07_AXI_wdata);
    mp_M07_AXI_transactor->WSTRB(M07_AXI_wstrb);
    mp_M07_AXI_transactor->WVALID(M07_AXI_wvalid);
    mp_M07_AXI_transactor->WREADY(M07_AXI_wready);
    mp_M07_AXI_transactor->BRESP(M07_AXI_bresp);
    mp_M07_AXI_transactor->BVALID(M07_AXI_bvalid);
    mp_M07_AXI_transactor->BREADY(M07_AXI_bready);
    mp_M07_AXI_transactor->ARADDR(M07_AXI_araddr);
    mp_M07_AXI_transactor->ARPROT(M07_AXI_arprot);
    mp_M07_AXI_transactor->ARVALID(M07_AXI_arvalid);
    mp_M07_AXI_transactor->ARREADY(M07_AXI_arready);
    mp_M07_AXI_transactor->RDATA(M07_AXI_rdata);
    mp_M07_AXI_transactor->RRESP(M07_AXI_rresp);
    mp_M07_AXI_transactor->RVALID(M07_AXI_rvalid);
    mp_M07_AXI_transactor->RREADY(M07_AXI_rready);
    mp_M07_AXI_transactor->CLK(aclk1);
    mp_M07_AXI_transactor->RST(aresetn);

    // M07_AXI' transactor sockets

    mp_impl->M07_AXI_tlm_aximm_read_socket->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_impl->M07_AXI_tlm_aximm_write_socket->bind(*(mp_M07_AXI_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
system_axi_hpm0_lpd_interconnect_0::system_axi_hpm0_lpd_interconnect_0(const sc_core::sc_module_name& nm) : system_axi_hpm0_lpd_interconnect_0_sc(nm),  aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awid("S00_AXI_awid"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awuser("S00_AXI_awuser"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bid("S00_AXI_bid"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S00_AXI_arid("S00_AXI_arid"), S00_AXI_araddr("S00_AXI_araddr"), S00_AXI_arlen("S00_AXI_arlen"), S00_AXI_arsize("S00_AXI_arsize"), S00_AXI_arburst("S00_AXI_arburst"), S00_AXI_arlock("S00_AXI_arlock"), S00_AXI_arcache("S00_AXI_arcache"), S00_AXI_arprot("S00_AXI_arprot"), S00_AXI_arqos("S00_AXI_arqos"), S00_AXI_aruser("S00_AXI_aruser"), S00_AXI_arvalid("S00_AXI_arvalid"), S00_AXI_arready("S00_AXI_arready"), S00_AXI_rid("S00_AXI_rid"), S00_AXI_rdata("S00_AXI_rdata"), S00_AXI_rresp("S00_AXI_rresp"), S00_AXI_rlast("S00_AXI_rlast"), S00_AXI_rvalid("S00_AXI_rvalid"), S00_AXI_rready("S00_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"), M01_AXI_awaddr("M01_AXI_awaddr"), M01_AXI_awprot("M01_AXI_awprot"), M01_AXI_awvalid("M01_AXI_awvalid"), M01_AXI_awready("M01_AXI_awready"), M01_AXI_wdata("M01_AXI_wdata"), M01_AXI_wstrb("M01_AXI_wstrb"), M01_AXI_wvalid("M01_AXI_wvalid"), M01_AXI_wready("M01_AXI_wready"), M01_AXI_bresp("M01_AXI_bresp"), M01_AXI_bvalid("M01_AXI_bvalid"), M01_AXI_bready("M01_AXI_bready"), M01_AXI_araddr("M01_AXI_araddr"), M01_AXI_arprot("M01_AXI_arprot"), M01_AXI_arvalid("M01_AXI_arvalid"), M01_AXI_arready("M01_AXI_arready"), M01_AXI_rdata("M01_AXI_rdata"), M01_AXI_rresp("M01_AXI_rresp"), M01_AXI_rvalid("M01_AXI_rvalid"), M01_AXI_rready("M01_AXI_rready"), M02_AXI_awaddr("M02_AXI_awaddr"), M02_AXI_awprot("M02_AXI_awprot"), M02_AXI_awvalid("M02_AXI_awvalid"), M02_AXI_awready("M02_AXI_awready"), M02_AXI_wdata("M02_AXI_wdata"), M02_AXI_wstrb("M02_AXI_wstrb"), M02_AXI_wvalid("M02_AXI_wvalid"), M02_AXI_wready("M02_AXI_wready"), M02_AXI_bresp("M02_AXI_bresp"), M02_AXI_bvalid("M02_AXI_bvalid"), M02_AXI_bready("M02_AXI_bready"), M02_AXI_araddr("M02_AXI_araddr"), M02_AXI_arprot("M02_AXI_arprot"), M02_AXI_arvalid("M02_AXI_arvalid"), M02_AXI_arready("M02_AXI_arready"), M02_AXI_rdata("M02_AXI_rdata"), M02_AXI_rresp("M02_AXI_rresp"), M02_AXI_rvalid("M02_AXI_rvalid"), M02_AXI_rready("M02_AXI_rready"), M03_AXI_awaddr("M03_AXI_awaddr"), M03_AXI_awprot("M03_AXI_awprot"), M03_AXI_awvalid("M03_AXI_awvalid"), M03_AXI_awready("M03_AXI_awready"), M03_AXI_wdata("M03_AXI_wdata"), M03_AXI_wstrb("M03_AXI_wstrb"), M03_AXI_wvalid("M03_AXI_wvalid"), M03_AXI_wready("M03_AXI_wready"), M03_AXI_bresp("M03_AXI_bresp"), M03_AXI_bvalid("M03_AXI_bvalid"), M03_AXI_bready("M03_AXI_bready"), M03_AXI_araddr("M03_AXI_araddr"), M03_AXI_arprot("M03_AXI_arprot"), M03_AXI_arvalid("M03_AXI_arvalid"), M03_AXI_arready("M03_AXI_arready"), M03_AXI_rdata("M03_AXI_rdata"), M03_AXI_rresp("M03_AXI_rresp"), M03_AXI_rvalid("M03_AXI_rvalid"), M03_AXI_rready("M03_AXI_rready"), M04_AXI_awaddr("M04_AXI_awaddr"), M04_AXI_awprot("M04_AXI_awprot"), M04_AXI_awvalid("M04_AXI_awvalid"), M04_AXI_awready("M04_AXI_awready"), M04_AXI_wdata("M04_AXI_wdata"), M04_AXI_wstrb("M04_AXI_wstrb"), M04_AXI_wvalid("M04_AXI_wvalid"), M04_AXI_wready("M04_AXI_wready"), M04_AXI_bresp("M04_AXI_bresp"), M04_AXI_bvalid("M04_AXI_bvalid"), M04_AXI_bready("M04_AXI_bready"), M04_AXI_araddr("M04_AXI_araddr"), M04_AXI_arprot("M04_AXI_arprot"), M04_AXI_arvalid("M04_AXI_arvalid"), M04_AXI_arready("M04_AXI_arready"), M04_AXI_rdata("M04_AXI_rdata"), M04_AXI_rresp("M04_AXI_rresp"), M04_AXI_rvalid("M04_AXI_rvalid"), M04_AXI_rready("M04_AXI_rready"), M05_AXI_awaddr("M05_AXI_awaddr"), M05_AXI_awprot("M05_AXI_awprot"), M05_AXI_awvalid("M05_AXI_awvalid"), M05_AXI_awready("M05_AXI_awready"), M05_AXI_wdata("M05_AXI_wdata"), M05_AXI_wstrb("M05_AXI_wstrb"), M05_AXI_wvalid("M05_AXI_wvalid"), M05_AXI_wready("M05_AXI_wready"), M05_AXI_bresp("M05_AXI_bresp"), M05_AXI_bvalid("M05_AXI_bvalid"), M05_AXI_bready("M05_AXI_bready"), M05_AXI_araddr("M05_AXI_araddr"), M05_AXI_arprot("M05_AXI_arprot"), M05_AXI_arvalid("M05_AXI_arvalid"), M05_AXI_arready("M05_AXI_arready"), M05_AXI_rdata("M05_AXI_rdata"), M05_AXI_rresp("M05_AXI_rresp"), M05_AXI_rvalid("M05_AXI_rvalid"), M05_AXI_rready("M05_AXI_rready"), M06_AXI_awaddr("M06_AXI_awaddr"), M06_AXI_awprot("M06_AXI_awprot"), M06_AXI_awvalid("M06_AXI_awvalid"), M06_AXI_awready("M06_AXI_awready"), M06_AXI_wdata("M06_AXI_wdata"), M06_AXI_wstrb("M06_AXI_wstrb"), M06_AXI_wvalid("M06_AXI_wvalid"), M06_AXI_wready("M06_AXI_wready"), M06_AXI_bresp("M06_AXI_bresp"), M06_AXI_bvalid("M06_AXI_bvalid"), M06_AXI_bready("M06_AXI_bready"), M06_AXI_araddr("M06_AXI_araddr"), M06_AXI_arprot("M06_AXI_arprot"), M06_AXI_arvalid("M06_AXI_arvalid"), M06_AXI_arready("M06_AXI_arready"), M06_AXI_rdata("M06_AXI_rdata"), M06_AXI_rresp("M06_AXI_rresp"), M06_AXI_rvalid("M06_AXI_rvalid"), M06_AXI_rready("M06_AXI_rready"), M07_AXI_awaddr("M07_AXI_awaddr"), M07_AXI_awprot("M07_AXI_awprot"), M07_AXI_awvalid("M07_AXI_awvalid"), M07_AXI_awready("M07_AXI_awready"), M07_AXI_wdata("M07_AXI_wdata"), M07_AXI_wstrb("M07_AXI_wstrb"), M07_AXI_wvalid("M07_AXI_wvalid"), M07_AXI_wready("M07_AXI_wready"), M07_AXI_bresp("M07_AXI_bresp"), M07_AXI_bvalid("M07_AXI_bvalid"), M07_AXI_bready("M07_AXI_bready"), M07_AXI_araddr("M07_AXI_araddr"), M07_AXI_arprot("M07_AXI_arprot"), M07_AXI_arvalid("M07_AXI_arvalid"), M07_AXI_arready("M07_AXI_arready"), M07_AXI_rdata("M07_AXI_rdata"), M07_AXI_rresp("M07_AXI_rresp"), M07_AXI_rvalid("M07_AXI_rvalid"), M07_AXI_rready("M07_AXI_rready")
{
  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S00_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M01_AXI_transactor = NULL;
  mp_M02_AXI_transactor = NULL;
  mp_M03_AXI_transactor = NULL;
  mp_M04_AXI_transactor = NULL;
  mp_M05_AXI_transactor = NULL;
  mp_M06_AXI_transactor = NULL;
  mp_M07_AXI_transactor = NULL;

  // Instantiate Socket Stubs

  // configure S00_AXI_transactor
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "40");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<32,40,16,16,1,1,16,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);
  mp_S00_AXI_transactor->AWID(S00_AXI_awid);
  mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
  mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
  mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
  mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
  mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
  mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
  mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
  mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
  mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
  mp_S00_AXI_transactor->AWUSER(S00_AXI_awuser);
  mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
  mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
  mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
  mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
  mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
  mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
  mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
  mp_S00_AXI_transactor->BID(S00_AXI_bid);
  mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
  mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
  mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
  mp_S00_AXI_transactor->ARID(S00_AXI_arid);
  mp_S00_AXI_transactor->ARADDR(S00_AXI_araddr);
  mp_S00_AXI_transactor->ARLEN(S00_AXI_arlen);
  mp_S00_AXI_transactor->ARSIZE(S00_AXI_arsize);
  mp_S00_AXI_transactor->ARBURST(S00_AXI_arburst);
  mp_S00_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_arlock_converter");
  mp_S00_AXI_arlock_converter->vector_in(S00_AXI_arlock);
  mp_S00_AXI_arlock_converter->scalar_out(m_S00_AXI_arlock_converter_signal);
  mp_S00_AXI_transactor->ARLOCK(m_S00_AXI_arlock_converter_signal);
  mp_S00_AXI_transactor->ARCACHE(S00_AXI_arcache);
  mp_S00_AXI_transactor->ARPROT(S00_AXI_arprot);
  mp_S00_AXI_transactor->ARQOS(S00_AXI_arqos);
  mp_S00_AXI_transactor->ARUSER(S00_AXI_aruser);
  mp_S00_AXI_transactor->ARVALID(S00_AXI_arvalid);
  mp_S00_AXI_transactor->ARREADY(S00_AXI_arready);
  mp_S00_AXI_transactor->RID(S00_AXI_rid);
  mp_S00_AXI_transactor->RDATA(S00_AXI_rdata);
  mp_S00_AXI_transactor->RRESP(S00_AXI_rresp);
  mp_S00_AXI_transactor->RLAST(S00_AXI_rlast);
  mp_S00_AXI_transactor->RVALID(S00_AXI_rvalid);
  mp_S00_AXI_transactor->RREADY(S00_AXI_rready);
  mp_S00_AXI_transactor->CLK(aclk);
  mp_S00_AXI_transactor->RST(aresetn);
  // configure M00_AXI_transactor
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);
  mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
  mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
  mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
  mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
  mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
  mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
  mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
  mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
  mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
  mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
  mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
  mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
  mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
  mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
  mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
  mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
  mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
  mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
  mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
  mp_M00_AXI_transactor->CLK(aclk);
  mp_M00_AXI_transactor->RST(aresetn);
  // configure M01_AXI_transactor
    xsc::common_cpp::properties M01_AXI_transactor_param_props;
    M01_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M01_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M01_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M01_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M01_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M01_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M01_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M01_AXI_transactor", M01_AXI_transactor_param_props);
  mp_M01_AXI_transactor->AWADDR(M01_AXI_awaddr);
  mp_M01_AXI_transactor->AWPROT(M01_AXI_awprot);
  mp_M01_AXI_transactor->AWVALID(M01_AXI_awvalid);
  mp_M01_AXI_transactor->AWREADY(M01_AXI_awready);
  mp_M01_AXI_transactor->WDATA(M01_AXI_wdata);
  mp_M01_AXI_transactor->WSTRB(M01_AXI_wstrb);
  mp_M01_AXI_transactor->WVALID(M01_AXI_wvalid);
  mp_M01_AXI_transactor->WREADY(M01_AXI_wready);
  mp_M01_AXI_transactor->BRESP(M01_AXI_bresp);
  mp_M01_AXI_transactor->BVALID(M01_AXI_bvalid);
  mp_M01_AXI_transactor->BREADY(M01_AXI_bready);
  mp_M01_AXI_transactor->ARADDR(M01_AXI_araddr);
  mp_M01_AXI_transactor->ARPROT(M01_AXI_arprot);
  mp_M01_AXI_transactor->ARVALID(M01_AXI_arvalid);
  mp_M01_AXI_transactor->ARREADY(M01_AXI_arready);
  mp_M01_AXI_transactor->RDATA(M01_AXI_rdata);
  mp_M01_AXI_transactor->RRESP(M01_AXI_rresp);
  mp_M01_AXI_transactor->RVALID(M01_AXI_rvalid);
  mp_M01_AXI_transactor->RREADY(M01_AXI_rready);
  mp_M01_AXI_transactor->CLK(aclk);
  mp_M01_AXI_transactor->RST(aresetn);
  // configure M02_AXI_transactor
    xsc::common_cpp::properties M02_AXI_transactor_param_props;
    M02_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M02_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M02_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M02_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M02_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M02_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M02_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M02_AXI_transactor", M02_AXI_transactor_param_props);
  mp_M02_AXI_transactor->AWADDR(M02_AXI_awaddr);
  mp_M02_AXI_transactor->AWPROT(M02_AXI_awprot);
  mp_M02_AXI_transactor->AWVALID(M02_AXI_awvalid);
  mp_M02_AXI_transactor->AWREADY(M02_AXI_awready);
  mp_M02_AXI_transactor->WDATA(M02_AXI_wdata);
  mp_M02_AXI_transactor->WSTRB(M02_AXI_wstrb);
  mp_M02_AXI_transactor->WVALID(M02_AXI_wvalid);
  mp_M02_AXI_transactor->WREADY(M02_AXI_wready);
  mp_M02_AXI_transactor->BRESP(M02_AXI_bresp);
  mp_M02_AXI_transactor->BVALID(M02_AXI_bvalid);
  mp_M02_AXI_transactor->BREADY(M02_AXI_bready);
  mp_M02_AXI_transactor->ARADDR(M02_AXI_araddr);
  mp_M02_AXI_transactor->ARPROT(M02_AXI_arprot);
  mp_M02_AXI_transactor->ARVALID(M02_AXI_arvalid);
  mp_M02_AXI_transactor->ARREADY(M02_AXI_arready);
  mp_M02_AXI_transactor->RDATA(M02_AXI_rdata);
  mp_M02_AXI_transactor->RRESP(M02_AXI_rresp);
  mp_M02_AXI_transactor->RVALID(M02_AXI_rvalid);
  mp_M02_AXI_transactor->RREADY(M02_AXI_rready);
  mp_M02_AXI_transactor->CLK(aclk);
  mp_M02_AXI_transactor->RST(aresetn);
  // configure M03_AXI_transactor
    xsc::common_cpp::properties M03_AXI_transactor_param_props;
    M03_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M03_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M03_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M03_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M03_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M03_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M03_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M03_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M03_AXI_transactor", M03_AXI_transactor_param_props);
  mp_M03_AXI_transactor->AWADDR(M03_AXI_awaddr);
  mp_M03_AXI_transactor->AWPROT(M03_AXI_awprot);
  mp_M03_AXI_transactor->AWVALID(M03_AXI_awvalid);
  mp_M03_AXI_transactor->AWREADY(M03_AXI_awready);
  mp_M03_AXI_transactor->WDATA(M03_AXI_wdata);
  mp_M03_AXI_transactor->WSTRB(M03_AXI_wstrb);
  mp_M03_AXI_transactor->WVALID(M03_AXI_wvalid);
  mp_M03_AXI_transactor->WREADY(M03_AXI_wready);
  mp_M03_AXI_transactor->BRESP(M03_AXI_bresp);
  mp_M03_AXI_transactor->BVALID(M03_AXI_bvalid);
  mp_M03_AXI_transactor->BREADY(M03_AXI_bready);
  mp_M03_AXI_transactor->ARADDR(M03_AXI_araddr);
  mp_M03_AXI_transactor->ARPROT(M03_AXI_arprot);
  mp_M03_AXI_transactor->ARVALID(M03_AXI_arvalid);
  mp_M03_AXI_transactor->ARREADY(M03_AXI_arready);
  mp_M03_AXI_transactor->RDATA(M03_AXI_rdata);
  mp_M03_AXI_transactor->RRESP(M03_AXI_rresp);
  mp_M03_AXI_transactor->RVALID(M03_AXI_rvalid);
  mp_M03_AXI_transactor->RREADY(M03_AXI_rready);
  mp_M03_AXI_transactor->CLK(aclk);
  mp_M03_AXI_transactor->RST(aresetn);
  // configure M04_AXI_transactor
    xsc::common_cpp::properties M04_AXI_transactor_param_props;
    M04_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M04_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M04_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M04_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M04_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M04_AXI_transactor", M04_AXI_transactor_param_props);
  mp_M04_AXI_transactor->AWADDR(M04_AXI_awaddr);
  mp_M04_AXI_transactor->AWPROT(M04_AXI_awprot);
  mp_M04_AXI_transactor->AWVALID(M04_AXI_awvalid);
  mp_M04_AXI_transactor->AWREADY(M04_AXI_awready);
  mp_M04_AXI_transactor->WDATA(M04_AXI_wdata);
  mp_M04_AXI_transactor->WSTRB(M04_AXI_wstrb);
  mp_M04_AXI_transactor->WVALID(M04_AXI_wvalid);
  mp_M04_AXI_transactor->WREADY(M04_AXI_wready);
  mp_M04_AXI_transactor->BRESP(M04_AXI_bresp);
  mp_M04_AXI_transactor->BVALID(M04_AXI_bvalid);
  mp_M04_AXI_transactor->BREADY(M04_AXI_bready);
  mp_M04_AXI_transactor->ARADDR(M04_AXI_araddr);
  mp_M04_AXI_transactor->ARPROT(M04_AXI_arprot);
  mp_M04_AXI_transactor->ARVALID(M04_AXI_arvalid);
  mp_M04_AXI_transactor->ARREADY(M04_AXI_arready);
  mp_M04_AXI_transactor->RDATA(M04_AXI_rdata);
  mp_M04_AXI_transactor->RRESP(M04_AXI_rresp);
  mp_M04_AXI_transactor->RVALID(M04_AXI_rvalid);
  mp_M04_AXI_transactor->RREADY(M04_AXI_rready);
  mp_M04_AXI_transactor->CLK(aclk);
  mp_M04_AXI_transactor->RST(aresetn);
  // configure M05_AXI_transactor
    xsc::common_cpp::properties M05_AXI_transactor_param_props;
    M05_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M05_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M05_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M05_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M05_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M05_AXI_transactor", M05_AXI_transactor_param_props);
  mp_M05_AXI_transactor->AWADDR(M05_AXI_awaddr);
  mp_M05_AXI_transactor->AWPROT(M05_AXI_awprot);
  mp_M05_AXI_transactor->AWVALID(M05_AXI_awvalid);
  mp_M05_AXI_transactor->AWREADY(M05_AXI_awready);
  mp_M05_AXI_transactor->WDATA(M05_AXI_wdata);
  mp_M05_AXI_transactor->WSTRB(M05_AXI_wstrb);
  mp_M05_AXI_transactor->WVALID(M05_AXI_wvalid);
  mp_M05_AXI_transactor->WREADY(M05_AXI_wready);
  mp_M05_AXI_transactor->BRESP(M05_AXI_bresp);
  mp_M05_AXI_transactor->BVALID(M05_AXI_bvalid);
  mp_M05_AXI_transactor->BREADY(M05_AXI_bready);
  mp_M05_AXI_transactor->ARADDR(M05_AXI_araddr);
  mp_M05_AXI_transactor->ARPROT(M05_AXI_arprot);
  mp_M05_AXI_transactor->ARVALID(M05_AXI_arvalid);
  mp_M05_AXI_transactor->ARREADY(M05_AXI_arready);
  mp_M05_AXI_transactor->RDATA(M05_AXI_rdata);
  mp_M05_AXI_transactor->RRESP(M05_AXI_rresp);
  mp_M05_AXI_transactor->RVALID(M05_AXI_rvalid);
  mp_M05_AXI_transactor->RREADY(M05_AXI_rready);
  mp_M05_AXI_transactor->CLK(aclk);
  mp_M05_AXI_transactor->RST(aresetn);
  // configure M06_AXI_transactor
    xsc::common_cpp::properties M06_AXI_transactor_param_props;
    M06_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "13");
    M06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M06_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M06_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M06_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M06_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,13,1,1,1,1,1,1>("M06_AXI_transactor", M06_AXI_transactor_param_props);
  mp_M06_AXI_transactor->AWADDR(M06_AXI_awaddr);
  mp_M06_AXI_transactor->AWPROT(M06_AXI_awprot);
  mp_M06_AXI_transactor->AWVALID(M06_AXI_awvalid);
  mp_M06_AXI_transactor->AWREADY(M06_AXI_awready);
  mp_M06_AXI_transactor->WDATA(M06_AXI_wdata);
  mp_M06_AXI_transactor->WSTRB(M06_AXI_wstrb);
  mp_M06_AXI_transactor->WVALID(M06_AXI_wvalid);
  mp_M06_AXI_transactor->WREADY(M06_AXI_wready);
  mp_M06_AXI_transactor->BRESP(M06_AXI_bresp);
  mp_M06_AXI_transactor->BVALID(M06_AXI_bvalid);
  mp_M06_AXI_transactor->BREADY(M06_AXI_bready);
  mp_M06_AXI_transactor->ARADDR(M06_AXI_araddr);
  mp_M06_AXI_transactor->ARPROT(M06_AXI_arprot);
  mp_M06_AXI_transactor->ARVALID(M06_AXI_arvalid);
  mp_M06_AXI_transactor->ARREADY(M06_AXI_arready);
  mp_M06_AXI_transactor->RDATA(M06_AXI_rdata);
  mp_M06_AXI_transactor->RRESP(M06_AXI_rresp);
  mp_M06_AXI_transactor->RVALID(M06_AXI_rvalid);
  mp_M06_AXI_transactor->RREADY(M06_AXI_rready);
  mp_M06_AXI_transactor->CLK(aclk);
  mp_M06_AXI_transactor->RST(aresetn);
  // configure M07_AXI_transactor
    xsc::common_cpp::properties M07_AXI_transactor_param_props;
    M07_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M07_AXI_transactor_param_props.addLong("FREQ_HZ", "100000000");
    M07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M07_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M07_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M07_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_axi_adrv9001_0_dac_1_clk");

    mp_M07_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M07_AXI_transactor", M07_AXI_transactor_param_props);
  mp_M07_AXI_transactor->AWADDR(M07_AXI_awaddr);
  mp_M07_AXI_transactor->AWPROT(M07_AXI_awprot);
  mp_M07_AXI_transactor->AWVALID(M07_AXI_awvalid);
  mp_M07_AXI_transactor->AWREADY(M07_AXI_awready);
  mp_M07_AXI_transactor->WDATA(M07_AXI_wdata);
  mp_M07_AXI_transactor->WSTRB(M07_AXI_wstrb);
  mp_M07_AXI_transactor->WVALID(M07_AXI_wvalid);
  mp_M07_AXI_transactor->WREADY(M07_AXI_wready);
  mp_M07_AXI_transactor->BRESP(M07_AXI_bresp);
  mp_M07_AXI_transactor->BVALID(M07_AXI_bvalid);
  mp_M07_AXI_transactor->BREADY(M07_AXI_bready);
  mp_M07_AXI_transactor->ARADDR(M07_AXI_araddr);
  mp_M07_AXI_transactor->ARPROT(M07_AXI_arprot);
  mp_M07_AXI_transactor->ARVALID(M07_AXI_arvalid);
  mp_M07_AXI_transactor->ARREADY(M07_AXI_arready);
  mp_M07_AXI_transactor->RDATA(M07_AXI_rdata);
  mp_M07_AXI_transactor->RRESP(M07_AXI_rresp);
  mp_M07_AXI_transactor->RVALID(M07_AXI_rvalid);
  mp_M07_AXI_transactor->RREADY(M07_AXI_rready);
  mp_M07_AXI_transactor->CLK(aclk1);
  mp_M07_AXI_transactor->RST(aresetn);

  // initialize transactors stubs
  S00_AXI_transactor_target_wr_socket_stub = nullptr;
  S00_AXI_transactor_target_rd_socket_stub = nullptr;
  M00_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M00_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M01_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M01_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M02_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M02_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M03_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M03_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M04_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M04_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M05_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M05_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M06_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M06_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M07_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M07_AXI_transactor_initiator_rd_socket_stub = nullptr;

}

void system_axi_hpm0_lpd_interconnect_0::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "S00_AXI_TLM_MODE") != 1)
  {
    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  
  }
  else
  {
    S00_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S00_AXI_transactor_target_wr_socket_stub->bind(*(mp_S00_AXI_transactor->wr_socket));
    S00_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S00_AXI_transactor_target_rd_socket_stub->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_S00_AXI_transactor->disable_transactor();
  }

  // configure 'M00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M00_AXI_TLM_MODE") != 1)
  {
    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  
  }
  else
  {
    M00_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M00_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M00_AXI_transactor->wr_socket));
    M00_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M00_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_M00_AXI_transactor->disable_transactor();
  }

  // configure 'M01_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M01_AXI_TLM_MODE") != 1)
  {
    mp_impl->M01_AXI_tlm_aximm_read_socket->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_impl->M01_AXI_tlm_aximm_write_socket->bind(*(mp_M01_AXI_transactor->wr_socket));
  
  }
  else
  {
    M01_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M01_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M01_AXI_transactor->wr_socket));
    M01_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M01_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_M01_AXI_transactor->disable_transactor();
  }

  // configure 'M02_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M02_AXI_TLM_MODE") != 1)
  {
    mp_impl->M02_AXI_tlm_aximm_read_socket->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_impl->M02_AXI_tlm_aximm_write_socket->bind(*(mp_M02_AXI_transactor->wr_socket));
  
  }
  else
  {
    M02_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M02_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M02_AXI_transactor->wr_socket));
    M02_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M02_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_M02_AXI_transactor->disable_transactor();
  }

  // configure 'M03_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M03_AXI_TLM_MODE") != 1)
  {
    mp_impl->M03_AXI_tlm_aximm_read_socket->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_impl->M03_AXI_tlm_aximm_write_socket->bind(*(mp_M03_AXI_transactor->wr_socket));
  
  }
  else
  {
    M03_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M03_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M03_AXI_transactor->wr_socket));
    M03_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M03_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_M03_AXI_transactor->disable_transactor();
  }

  // configure 'M04_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M04_AXI_TLM_MODE") != 1)
  {
    mp_impl->M04_AXI_tlm_aximm_read_socket->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_impl->M04_AXI_tlm_aximm_write_socket->bind(*(mp_M04_AXI_transactor->wr_socket));
  
  }
  else
  {
    M04_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M04_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M04_AXI_transactor->wr_socket));
    M04_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M04_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_M04_AXI_transactor->disable_transactor();
  }

  // configure 'M05_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M05_AXI_TLM_MODE") != 1)
  {
    mp_impl->M05_AXI_tlm_aximm_read_socket->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_impl->M05_AXI_tlm_aximm_write_socket->bind(*(mp_M05_AXI_transactor->wr_socket));
  
  }
  else
  {
    M05_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M05_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M05_AXI_transactor->wr_socket));
    M05_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M05_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_M05_AXI_transactor->disable_transactor();
  }

  // configure 'M06_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M06_AXI_TLM_MODE") != 1)
  {
    mp_impl->M06_AXI_tlm_aximm_read_socket->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_impl->M06_AXI_tlm_aximm_write_socket->bind(*(mp_M06_AXI_transactor->wr_socket));
  
  }
  else
  {
    M06_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M06_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M06_AXI_transactor->wr_socket));
    M06_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M06_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_M06_AXI_transactor->disable_transactor();
  }

  // configure 'M07_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M07_AXI_TLM_MODE") != 1)
  {
    mp_impl->M07_AXI_tlm_aximm_read_socket->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_impl->M07_AXI_tlm_aximm_write_socket->bind(*(mp_M07_AXI_transactor->wr_socket));
  
  }
  else
  {
    M07_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M07_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M07_AXI_transactor->wr_socket));
    M07_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M07_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_M07_AXI_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
system_axi_hpm0_lpd_interconnect_0::system_axi_hpm0_lpd_interconnect_0(const sc_core::sc_module_name& nm) : system_axi_hpm0_lpd_interconnect_0_sc(nm),  aclk("aclk"), aclk1("aclk1"), aresetn("aresetn"), S00_AXI_awid("S00_AXI_awid"), S00_AXI_awaddr("S00_AXI_awaddr"), S00_AXI_awlen("S00_AXI_awlen"), S00_AXI_awsize("S00_AXI_awsize"), S00_AXI_awburst("S00_AXI_awburst"), S00_AXI_awlock("S00_AXI_awlock"), S00_AXI_awcache("S00_AXI_awcache"), S00_AXI_awprot("S00_AXI_awprot"), S00_AXI_awqos("S00_AXI_awqos"), S00_AXI_awuser("S00_AXI_awuser"), S00_AXI_awvalid("S00_AXI_awvalid"), S00_AXI_awready("S00_AXI_awready"), S00_AXI_wdata("S00_AXI_wdata"), S00_AXI_wstrb("S00_AXI_wstrb"), S00_AXI_wlast("S00_AXI_wlast"), S00_AXI_wvalid("S00_AXI_wvalid"), S00_AXI_wready("S00_AXI_wready"), S00_AXI_bid("S00_AXI_bid"), S00_AXI_bresp("S00_AXI_bresp"), S00_AXI_bvalid("S00_AXI_bvalid"), S00_AXI_bready("S00_AXI_bready"), S00_AXI_arid("S00_AXI_arid"), S00_AXI_araddr("S00_AXI_araddr"), S00_AXI_arlen("S00_AXI_arlen"), S00_AXI_arsize("S00_AXI_arsize"), S00_AXI_arburst("S00_AXI_arburst"), S00_AXI_arlock("S00_AXI_arlock"), S00_AXI_arcache("S00_AXI_arcache"), S00_AXI_arprot("S00_AXI_arprot"), S00_AXI_arqos("S00_AXI_arqos"), S00_AXI_aruser("S00_AXI_aruser"), S00_AXI_arvalid("S00_AXI_arvalid"), S00_AXI_arready("S00_AXI_arready"), S00_AXI_rid("S00_AXI_rid"), S00_AXI_rdata("S00_AXI_rdata"), S00_AXI_rresp("S00_AXI_rresp"), S00_AXI_rlast("S00_AXI_rlast"), S00_AXI_rvalid("S00_AXI_rvalid"), S00_AXI_rready("S00_AXI_rready"), M00_AXI_awaddr("M00_AXI_awaddr"), M00_AXI_awprot("M00_AXI_awprot"), M00_AXI_awvalid("M00_AXI_awvalid"), M00_AXI_awready("M00_AXI_awready"), M00_AXI_wdata("M00_AXI_wdata"), M00_AXI_wstrb("M00_AXI_wstrb"), M00_AXI_wvalid("M00_AXI_wvalid"), M00_AXI_wready("M00_AXI_wready"), M00_AXI_bresp("M00_AXI_bresp"), M00_AXI_bvalid("M00_AXI_bvalid"), M00_AXI_bready("M00_AXI_bready"), M00_AXI_araddr("M00_AXI_araddr"), M00_AXI_arprot("M00_AXI_arprot"), M00_AXI_arvalid("M00_AXI_arvalid"), M00_AXI_arready("M00_AXI_arready"), M00_AXI_rdata("M00_AXI_rdata"), M00_AXI_rresp("M00_AXI_rresp"), M00_AXI_rvalid("M00_AXI_rvalid"), M00_AXI_rready("M00_AXI_rready"), M01_AXI_awaddr("M01_AXI_awaddr"), M01_AXI_awprot("M01_AXI_awprot"), M01_AXI_awvalid("M01_AXI_awvalid"), M01_AXI_awready("M01_AXI_awready"), M01_AXI_wdata("M01_AXI_wdata"), M01_AXI_wstrb("M01_AXI_wstrb"), M01_AXI_wvalid("M01_AXI_wvalid"), M01_AXI_wready("M01_AXI_wready"), M01_AXI_bresp("M01_AXI_bresp"), M01_AXI_bvalid("M01_AXI_bvalid"), M01_AXI_bready("M01_AXI_bready"), M01_AXI_araddr("M01_AXI_araddr"), M01_AXI_arprot("M01_AXI_arprot"), M01_AXI_arvalid("M01_AXI_arvalid"), M01_AXI_arready("M01_AXI_arready"), M01_AXI_rdata("M01_AXI_rdata"), M01_AXI_rresp("M01_AXI_rresp"), M01_AXI_rvalid("M01_AXI_rvalid"), M01_AXI_rready("M01_AXI_rready"), M02_AXI_awaddr("M02_AXI_awaddr"), M02_AXI_awprot("M02_AXI_awprot"), M02_AXI_awvalid("M02_AXI_awvalid"), M02_AXI_awready("M02_AXI_awready"), M02_AXI_wdata("M02_AXI_wdata"), M02_AXI_wstrb("M02_AXI_wstrb"), M02_AXI_wvalid("M02_AXI_wvalid"), M02_AXI_wready("M02_AXI_wready"), M02_AXI_bresp("M02_AXI_bresp"), M02_AXI_bvalid("M02_AXI_bvalid"), M02_AXI_bready("M02_AXI_bready"), M02_AXI_araddr("M02_AXI_araddr"), M02_AXI_arprot("M02_AXI_arprot"), M02_AXI_arvalid("M02_AXI_arvalid"), M02_AXI_arready("M02_AXI_arready"), M02_AXI_rdata("M02_AXI_rdata"), M02_AXI_rresp("M02_AXI_rresp"), M02_AXI_rvalid("M02_AXI_rvalid"), M02_AXI_rready("M02_AXI_rready"), M03_AXI_awaddr("M03_AXI_awaddr"), M03_AXI_awprot("M03_AXI_awprot"), M03_AXI_awvalid("M03_AXI_awvalid"), M03_AXI_awready("M03_AXI_awready"), M03_AXI_wdata("M03_AXI_wdata"), M03_AXI_wstrb("M03_AXI_wstrb"), M03_AXI_wvalid("M03_AXI_wvalid"), M03_AXI_wready("M03_AXI_wready"), M03_AXI_bresp("M03_AXI_bresp"), M03_AXI_bvalid("M03_AXI_bvalid"), M03_AXI_bready("M03_AXI_bready"), M03_AXI_araddr("M03_AXI_araddr"), M03_AXI_arprot("M03_AXI_arprot"), M03_AXI_arvalid("M03_AXI_arvalid"), M03_AXI_arready("M03_AXI_arready"), M03_AXI_rdata("M03_AXI_rdata"), M03_AXI_rresp("M03_AXI_rresp"), M03_AXI_rvalid("M03_AXI_rvalid"), M03_AXI_rready("M03_AXI_rready"), M04_AXI_awaddr("M04_AXI_awaddr"), M04_AXI_awprot("M04_AXI_awprot"), M04_AXI_awvalid("M04_AXI_awvalid"), M04_AXI_awready("M04_AXI_awready"), M04_AXI_wdata("M04_AXI_wdata"), M04_AXI_wstrb("M04_AXI_wstrb"), M04_AXI_wvalid("M04_AXI_wvalid"), M04_AXI_wready("M04_AXI_wready"), M04_AXI_bresp("M04_AXI_bresp"), M04_AXI_bvalid("M04_AXI_bvalid"), M04_AXI_bready("M04_AXI_bready"), M04_AXI_araddr("M04_AXI_araddr"), M04_AXI_arprot("M04_AXI_arprot"), M04_AXI_arvalid("M04_AXI_arvalid"), M04_AXI_arready("M04_AXI_arready"), M04_AXI_rdata("M04_AXI_rdata"), M04_AXI_rresp("M04_AXI_rresp"), M04_AXI_rvalid("M04_AXI_rvalid"), M04_AXI_rready("M04_AXI_rready"), M05_AXI_awaddr("M05_AXI_awaddr"), M05_AXI_awprot("M05_AXI_awprot"), M05_AXI_awvalid("M05_AXI_awvalid"), M05_AXI_awready("M05_AXI_awready"), M05_AXI_wdata("M05_AXI_wdata"), M05_AXI_wstrb("M05_AXI_wstrb"), M05_AXI_wvalid("M05_AXI_wvalid"), M05_AXI_wready("M05_AXI_wready"), M05_AXI_bresp("M05_AXI_bresp"), M05_AXI_bvalid("M05_AXI_bvalid"), M05_AXI_bready("M05_AXI_bready"), M05_AXI_araddr("M05_AXI_araddr"), M05_AXI_arprot("M05_AXI_arprot"), M05_AXI_arvalid("M05_AXI_arvalid"), M05_AXI_arready("M05_AXI_arready"), M05_AXI_rdata("M05_AXI_rdata"), M05_AXI_rresp("M05_AXI_rresp"), M05_AXI_rvalid("M05_AXI_rvalid"), M05_AXI_rready("M05_AXI_rready"), M06_AXI_awaddr("M06_AXI_awaddr"), M06_AXI_awprot("M06_AXI_awprot"), M06_AXI_awvalid("M06_AXI_awvalid"), M06_AXI_awready("M06_AXI_awready"), M06_AXI_wdata("M06_AXI_wdata"), M06_AXI_wstrb("M06_AXI_wstrb"), M06_AXI_wvalid("M06_AXI_wvalid"), M06_AXI_wready("M06_AXI_wready"), M06_AXI_bresp("M06_AXI_bresp"), M06_AXI_bvalid("M06_AXI_bvalid"), M06_AXI_bready("M06_AXI_bready"), M06_AXI_araddr("M06_AXI_araddr"), M06_AXI_arprot("M06_AXI_arprot"), M06_AXI_arvalid("M06_AXI_arvalid"), M06_AXI_arready("M06_AXI_arready"), M06_AXI_rdata("M06_AXI_rdata"), M06_AXI_rresp("M06_AXI_rresp"), M06_AXI_rvalid("M06_AXI_rvalid"), M06_AXI_rready("M06_AXI_rready"), M07_AXI_awaddr("M07_AXI_awaddr"), M07_AXI_awprot("M07_AXI_awprot"), M07_AXI_awvalid("M07_AXI_awvalid"), M07_AXI_awready("M07_AXI_awready"), M07_AXI_wdata("M07_AXI_wdata"), M07_AXI_wstrb("M07_AXI_wstrb"), M07_AXI_wvalid("M07_AXI_wvalid"), M07_AXI_wready("M07_AXI_wready"), M07_AXI_bresp("M07_AXI_bresp"), M07_AXI_bvalid("M07_AXI_bvalid"), M07_AXI_bready("M07_AXI_bready"), M07_AXI_araddr("M07_AXI_araddr"), M07_AXI_arprot("M07_AXI_arprot"), M07_AXI_arvalid("M07_AXI_arvalid"), M07_AXI_arready("M07_AXI_arready"), M07_AXI_rdata("M07_AXI_rdata"), M07_AXI_rresp("M07_AXI_rresp"), M07_AXI_rvalid("M07_AXI_rvalid"), M07_AXI_rready("M07_AXI_rready")
{
  // initialize pins
  mp_impl->aclk(aclk);
  mp_impl->aclk1(aclk1);
  mp_impl->aresetn(aresetn);

  // initialize transactors
  mp_S00_AXI_transactor = NULL;
  mp_S00_AXI_awlock_converter = NULL;
  mp_S00_AXI_arlock_converter = NULL;
  mp_M00_AXI_transactor = NULL;
  mp_M01_AXI_transactor = NULL;
  mp_M02_AXI_transactor = NULL;
  mp_M03_AXI_transactor = NULL;
  mp_M04_AXI_transactor = NULL;
  mp_M05_AXI_transactor = NULL;
  mp_M06_AXI_transactor = NULL;
  mp_M07_AXI_transactor = NULL;

  // Instantiate Socket Stubs

  // configure S00_AXI_transactor
    xsc::common_cpp::properties S00_AXI_transactor_param_props;
    S00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    S00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    S00_AXI_transactor_param_props.addLong("ID_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "40");
    S00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "16");
    S00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    S00_AXI_transactor_param_props.addLong("HAS_BURST", "1");
    S00_AXI_transactor_param_props.addLong("HAS_LOCK", "1");
    S00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    S00_AXI_transactor_param_props.addLong("HAS_CACHE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_QOS", "1");
    S00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    S00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    S00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    S00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    S00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    S00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    S00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    S00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    S00_AXI_transactor_param_props.addLong("HAS_SIZE", "1");
    S00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    S00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    S00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4");
    S00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    S00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_S00_AXI_transactor = new xtlm::xaximm_pin2xtlm_t<32,40,16,16,1,1,16,1>("S00_AXI_transactor", S00_AXI_transactor_param_props);
  mp_S00_AXI_transactor->AWID(S00_AXI_awid);
  mp_S00_AXI_transactor->AWADDR(S00_AXI_awaddr);
  mp_S00_AXI_transactor->AWLEN(S00_AXI_awlen);
  mp_S00_AXI_transactor->AWSIZE(S00_AXI_awsize);
  mp_S00_AXI_transactor->AWBURST(S00_AXI_awburst);
  mp_S00_AXI_awlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_awlock_converter");
  mp_S00_AXI_awlock_converter->vector_in(S00_AXI_awlock);
  mp_S00_AXI_awlock_converter->scalar_out(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWLOCK(m_S00_AXI_awlock_converter_signal);
  mp_S00_AXI_transactor->AWCACHE(S00_AXI_awcache);
  mp_S00_AXI_transactor->AWPROT(S00_AXI_awprot);
  mp_S00_AXI_transactor->AWQOS(S00_AXI_awqos);
  mp_S00_AXI_transactor->AWUSER(S00_AXI_awuser);
  mp_S00_AXI_transactor->AWVALID(S00_AXI_awvalid);
  mp_S00_AXI_transactor->AWREADY(S00_AXI_awready);
  mp_S00_AXI_transactor->WDATA(S00_AXI_wdata);
  mp_S00_AXI_transactor->WSTRB(S00_AXI_wstrb);
  mp_S00_AXI_transactor->WLAST(S00_AXI_wlast);
  mp_S00_AXI_transactor->WVALID(S00_AXI_wvalid);
  mp_S00_AXI_transactor->WREADY(S00_AXI_wready);
  mp_S00_AXI_transactor->BID(S00_AXI_bid);
  mp_S00_AXI_transactor->BRESP(S00_AXI_bresp);
  mp_S00_AXI_transactor->BVALID(S00_AXI_bvalid);
  mp_S00_AXI_transactor->BREADY(S00_AXI_bready);
  mp_S00_AXI_transactor->ARID(S00_AXI_arid);
  mp_S00_AXI_transactor->ARADDR(S00_AXI_araddr);
  mp_S00_AXI_transactor->ARLEN(S00_AXI_arlen);
  mp_S00_AXI_transactor->ARSIZE(S00_AXI_arsize);
  mp_S00_AXI_transactor->ARBURST(S00_AXI_arburst);
  mp_S00_AXI_arlock_converter = new xsc::common::vectorN2scalar_converter<1>("S00_AXI_arlock_converter");
  mp_S00_AXI_arlock_converter->vector_in(S00_AXI_arlock);
  mp_S00_AXI_arlock_converter->scalar_out(m_S00_AXI_arlock_converter_signal);
  mp_S00_AXI_transactor->ARLOCK(m_S00_AXI_arlock_converter_signal);
  mp_S00_AXI_transactor->ARCACHE(S00_AXI_arcache);
  mp_S00_AXI_transactor->ARPROT(S00_AXI_arprot);
  mp_S00_AXI_transactor->ARQOS(S00_AXI_arqos);
  mp_S00_AXI_transactor->ARUSER(S00_AXI_aruser);
  mp_S00_AXI_transactor->ARVALID(S00_AXI_arvalid);
  mp_S00_AXI_transactor->ARREADY(S00_AXI_arready);
  mp_S00_AXI_transactor->RID(S00_AXI_rid);
  mp_S00_AXI_transactor->RDATA(S00_AXI_rdata);
  mp_S00_AXI_transactor->RRESP(S00_AXI_rresp);
  mp_S00_AXI_transactor->RLAST(S00_AXI_rlast);
  mp_S00_AXI_transactor->RVALID(S00_AXI_rvalid);
  mp_S00_AXI_transactor->RREADY(S00_AXI_rready);
  mp_S00_AXI_transactor->CLK(aclk);
  mp_S00_AXI_transactor->RST(aresetn);
  // configure M00_AXI_transactor
    xsc::common_cpp::properties M00_AXI_transactor_param_props;
    M00_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M00_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M00_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M00_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M00_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M00_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M00_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M00_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M00_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M00_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M00_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M00_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M00_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M00_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M00_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M00_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M00_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M00_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M00_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M00_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M00_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M00_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M00_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M00_AXI_transactor", M00_AXI_transactor_param_props);
  mp_M00_AXI_transactor->AWADDR(M00_AXI_awaddr);
  mp_M00_AXI_transactor->AWPROT(M00_AXI_awprot);
  mp_M00_AXI_transactor->AWVALID(M00_AXI_awvalid);
  mp_M00_AXI_transactor->AWREADY(M00_AXI_awready);
  mp_M00_AXI_transactor->WDATA(M00_AXI_wdata);
  mp_M00_AXI_transactor->WSTRB(M00_AXI_wstrb);
  mp_M00_AXI_transactor->WVALID(M00_AXI_wvalid);
  mp_M00_AXI_transactor->WREADY(M00_AXI_wready);
  mp_M00_AXI_transactor->BRESP(M00_AXI_bresp);
  mp_M00_AXI_transactor->BVALID(M00_AXI_bvalid);
  mp_M00_AXI_transactor->BREADY(M00_AXI_bready);
  mp_M00_AXI_transactor->ARADDR(M00_AXI_araddr);
  mp_M00_AXI_transactor->ARPROT(M00_AXI_arprot);
  mp_M00_AXI_transactor->ARVALID(M00_AXI_arvalid);
  mp_M00_AXI_transactor->ARREADY(M00_AXI_arready);
  mp_M00_AXI_transactor->RDATA(M00_AXI_rdata);
  mp_M00_AXI_transactor->RRESP(M00_AXI_rresp);
  mp_M00_AXI_transactor->RVALID(M00_AXI_rvalid);
  mp_M00_AXI_transactor->RREADY(M00_AXI_rready);
  mp_M00_AXI_transactor->CLK(aclk);
  mp_M00_AXI_transactor->RST(aresetn);
  // configure M01_AXI_transactor
    xsc::common_cpp::properties M01_AXI_transactor_param_props;
    M01_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M01_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M01_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M01_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M01_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M01_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M01_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M01_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M01_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M01_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M01_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M01_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M01_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M01_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M01_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M01_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M01_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M01_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M01_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M01_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M01_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M01_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M01_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M01_AXI_transactor", M01_AXI_transactor_param_props);
  mp_M01_AXI_transactor->AWADDR(M01_AXI_awaddr);
  mp_M01_AXI_transactor->AWPROT(M01_AXI_awprot);
  mp_M01_AXI_transactor->AWVALID(M01_AXI_awvalid);
  mp_M01_AXI_transactor->AWREADY(M01_AXI_awready);
  mp_M01_AXI_transactor->WDATA(M01_AXI_wdata);
  mp_M01_AXI_transactor->WSTRB(M01_AXI_wstrb);
  mp_M01_AXI_transactor->WVALID(M01_AXI_wvalid);
  mp_M01_AXI_transactor->WREADY(M01_AXI_wready);
  mp_M01_AXI_transactor->BRESP(M01_AXI_bresp);
  mp_M01_AXI_transactor->BVALID(M01_AXI_bvalid);
  mp_M01_AXI_transactor->BREADY(M01_AXI_bready);
  mp_M01_AXI_transactor->ARADDR(M01_AXI_araddr);
  mp_M01_AXI_transactor->ARPROT(M01_AXI_arprot);
  mp_M01_AXI_transactor->ARVALID(M01_AXI_arvalid);
  mp_M01_AXI_transactor->ARREADY(M01_AXI_arready);
  mp_M01_AXI_transactor->RDATA(M01_AXI_rdata);
  mp_M01_AXI_transactor->RRESP(M01_AXI_rresp);
  mp_M01_AXI_transactor->RVALID(M01_AXI_rvalid);
  mp_M01_AXI_transactor->RREADY(M01_AXI_rready);
  mp_M01_AXI_transactor->CLK(aclk);
  mp_M01_AXI_transactor->RST(aresetn);
  // configure M02_AXI_transactor
    xsc::common_cpp::properties M02_AXI_transactor_param_props;
    M02_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M02_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M02_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M02_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M02_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M02_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M02_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M02_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M02_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M02_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M02_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M02_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M02_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M02_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M02_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M02_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M02_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M02_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M02_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M02_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M02_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M02_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M02_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M02_AXI_transactor", M02_AXI_transactor_param_props);
  mp_M02_AXI_transactor->AWADDR(M02_AXI_awaddr);
  mp_M02_AXI_transactor->AWPROT(M02_AXI_awprot);
  mp_M02_AXI_transactor->AWVALID(M02_AXI_awvalid);
  mp_M02_AXI_transactor->AWREADY(M02_AXI_awready);
  mp_M02_AXI_transactor->WDATA(M02_AXI_wdata);
  mp_M02_AXI_transactor->WSTRB(M02_AXI_wstrb);
  mp_M02_AXI_transactor->WVALID(M02_AXI_wvalid);
  mp_M02_AXI_transactor->WREADY(M02_AXI_wready);
  mp_M02_AXI_transactor->BRESP(M02_AXI_bresp);
  mp_M02_AXI_transactor->BVALID(M02_AXI_bvalid);
  mp_M02_AXI_transactor->BREADY(M02_AXI_bready);
  mp_M02_AXI_transactor->ARADDR(M02_AXI_araddr);
  mp_M02_AXI_transactor->ARPROT(M02_AXI_arprot);
  mp_M02_AXI_transactor->ARVALID(M02_AXI_arvalid);
  mp_M02_AXI_transactor->ARREADY(M02_AXI_arready);
  mp_M02_AXI_transactor->RDATA(M02_AXI_rdata);
  mp_M02_AXI_transactor->RRESP(M02_AXI_rresp);
  mp_M02_AXI_transactor->RVALID(M02_AXI_rvalid);
  mp_M02_AXI_transactor->RREADY(M02_AXI_rready);
  mp_M02_AXI_transactor->CLK(aclk);
  mp_M02_AXI_transactor->RST(aresetn);
  // configure M03_AXI_transactor
    xsc::common_cpp::properties M03_AXI_transactor_param_props;
    M03_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M03_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M03_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M03_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M03_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M03_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M03_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M03_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M03_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M03_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M03_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M03_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M03_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M03_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M03_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M03_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M03_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M03_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M03_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M03_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M03_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M03_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M03_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M03_AXI_transactor", M03_AXI_transactor_param_props);
  mp_M03_AXI_transactor->AWADDR(M03_AXI_awaddr);
  mp_M03_AXI_transactor->AWPROT(M03_AXI_awprot);
  mp_M03_AXI_transactor->AWVALID(M03_AXI_awvalid);
  mp_M03_AXI_transactor->AWREADY(M03_AXI_awready);
  mp_M03_AXI_transactor->WDATA(M03_AXI_wdata);
  mp_M03_AXI_transactor->WSTRB(M03_AXI_wstrb);
  mp_M03_AXI_transactor->WVALID(M03_AXI_wvalid);
  mp_M03_AXI_transactor->WREADY(M03_AXI_wready);
  mp_M03_AXI_transactor->BRESP(M03_AXI_bresp);
  mp_M03_AXI_transactor->BVALID(M03_AXI_bvalid);
  mp_M03_AXI_transactor->BREADY(M03_AXI_bready);
  mp_M03_AXI_transactor->ARADDR(M03_AXI_araddr);
  mp_M03_AXI_transactor->ARPROT(M03_AXI_arprot);
  mp_M03_AXI_transactor->ARVALID(M03_AXI_arvalid);
  mp_M03_AXI_transactor->ARREADY(M03_AXI_arready);
  mp_M03_AXI_transactor->RDATA(M03_AXI_rdata);
  mp_M03_AXI_transactor->RRESP(M03_AXI_rresp);
  mp_M03_AXI_transactor->RVALID(M03_AXI_rvalid);
  mp_M03_AXI_transactor->RREADY(M03_AXI_rready);
  mp_M03_AXI_transactor->CLK(aclk);
  mp_M03_AXI_transactor->RST(aresetn);
  // configure M04_AXI_transactor
    xsc::common_cpp::properties M04_AXI_transactor_param_props;
    M04_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M04_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M04_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ADDR_WIDTH", "11");
    M04_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M04_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M04_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M04_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M04_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M04_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M04_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M04_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M04_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M04_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M04_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M04_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M04_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M04_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M04_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M04_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M04_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M04_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M04_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M04_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,11,1,1,1,1,1,1>("M04_AXI_transactor", M04_AXI_transactor_param_props);
  mp_M04_AXI_transactor->AWADDR(M04_AXI_awaddr);
  mp_M04_AXI_transactor->AWPROT(M04_AXI_awprot);
  mp_M04_AXI_transactor->AWVALID(M04_AXI_awvalid);
  mp_M04_AXI_transactor->AWREADY(M04_AXI_awready);
  mp_M04_AXI_transactor->WDATA(M04_AXI_wdata);
  mp_M04_AXI_transactor->WSTRB(M04_AXI_wstrb);
  mp_M04_AXI_transactor->WVALID(M04_AXI_wvalid);
  mp_M04_AXI_transactor->WREADY(M04_AXI_wready);
  mp_M04_AXI_transactor->BRESP(M04_AXI_bresp);
  mp_M04_AXI_transactor->BVALID(M04_AXI_bvalid);
  mp_M04_AXI_transactor->BREADY(M04_AXI_bready);
  mp_M04_AXI_transactor->ARADDR(M04_AXI_araddr);
  mp_M04_AXI_transactor->ARPROT(M04_AXI_arprot);
  mp_M04_AXI_transactor->ARVALID(M04_AXI_arvalid);
  mp_M04_AXI_transactor->ARREADY(M04_AXI_arready);
  mp_M04_AXI_transactor->RDATA(M04_AXI_rdata);
  mp_M04_AXI_transactor->RRESP(M04_AXI_rresp);
  mp_M04_AXI_transactor->RVALID(M04_AXI_rvalid);
  mp_M04_AXI_transactor->RREADY(M04_AXI_rready);
  mp_M04_AXI_transactor->CLK(aclk);
  mp_M04_AXI_transactor->RST(aresetn);
  // configure M05_AXI_transactor
    xsc::common_cpp::properties M05_AXI_transactor_param_props;
    M05_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M05_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M05_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M05_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M05_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M05_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M05_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M05_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M05_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M05_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M05_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M05_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M05_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M05_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M05_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M05_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M05_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M05_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M05_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M05_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M05_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M05_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M05_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M05_AXI_transactor", M05_AXI_transactor_param_props);
  mp_M05_AXI_transactor->AWADDR(M05_AXI_awaddr);
  mp_M05_AXI_transactor->AWPROT(M05_AXI_awprot);
  mp_M05_AXI_transactor->AWVALID(M05_AXI_awvalid);
  mp_M05_AXI_transactor->AWREADY(M05_AXI_awready);
  mp_M05_AXI_transactor->WDATA(M05_AXI_wdata);
  mp_M05_AXI_transactor->WSTRB(M05_AXI_wstrb);
  mp_M05_AXI_transactor->WVALID(M05_AXI_wvalid);
  mp_M05_AXI_transactor->WREADY(M05_AXI_wready);
  mp_M05_AXI_transactor->BRESP(M05_AXI_bresp);
  mp_M05_AXI_transactor->BVALID(M05_AXI_bvalid);
  mp_M05_AXI_transactor->BREADY(M05_AXI_bready);
  mp_M05_AXI_transactor->ARADDR(M05_AXI_araddr);
  mp_M05_AXI_transactor->ARPROT(M05_AXI_arprot);
  mp_M05_AXI_transactor->ARVALID(M05_AXI_arvalid);
  mp_M05_AXI_transactor->ARREADY(M05_AXI_arready);
  mp_M05_AXI_transactor->RDATA(M05_AXI_rdata);
  mp_M05_AXI_transactor->RRESP(M05_AXI_rresp);
  mp_M05_AXI_transactor->RVALID(M05_AXI_rvalid);
  mp_M05_AXI_transactor->RREADY(M05_AXI_rready);
  mp_M05_AXI_transactor->CLK(aclk);
  mp_M05_AXI_transactor->RST(aresetn);
  // configure M06_AXI_transactor
    xsc::common_cpp::properties M06_AXI_transactor_param_props;
    M06_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M06_AXI_transactor_param_props.addLong("FREQ_HZ", "99999001");
    M06_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ADDR_WIDTH", "13");
    M06_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M06_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M06_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M06_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M06_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M06_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M06_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M06_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M06_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M06_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M06_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M06_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M06_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M06_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M06_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M06_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M06_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M06_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M06_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_sys_ps8_0_pl_clk0");

    mp_M06_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,13,1,1,1,1,1,1>("M06_AXI_transactor", M06_AXI_transactor_param_props);
  mp_M06_AXI_transactor->AWADDR(M06_AXI_awaddr);
  mp_M06_AXI_transactor->AWPROT(M06_AXI_awprot);
  mp_M06_AXI_transactor->AWVALID(M06_AXI_awvalid);
  mp_M06_AXI_transactor->AWREADY(M06_AXI_awready);
  mp_M06_AXI_transactor->WDATA(M06_AXI_wdata);
  mp_M06_AXI_transactor->WSTRB(M06_AXI_wstrb);
  mp_M06_AXI_transactor->WVALID(M06_AXI_wvalid);
  mp_M06_AXI_transactor->WREADY(M06_AXI_wready);
  mp_M06_AXI_transactor->BRESP(M06_AXI_bresp);
  mp_M06_AXI_transactor->BVALID(M06_AXI_bvalid);
  mp_M06_AXI_transactor->BREADY(M06_AXI_bready);
  mp_M06_AXI_transactor->ARADDR(M06_AXI_araddr);
  mp_M06_AXI_transactor->ARPROT(M06_AXI_arprot);
  mp_M06_AXI_transactor->ARVALID(M06_AXI_arvalid);
  mp_M06_AXI_transactor->ARREADY(M06_AXI_arready);
  mp_M06_AXI_transactor->RDATA(M06_AXI_rdata);
  mp_M06_AXI_transactor->RRESP(M06_AXI_rresp);
  mp_M06_AXI_transactor->RVALID(M06_AXI_rvalid);
  mp_M06_AXI_transactor->RREADY(M06_AXI_rready);
  mp_M06_AXI_transactor->CLK(aclk);
  mp_M06_AXI_transactor->RST(aresetn);
  // configure M07_AXI_transactor
    xsc::common_cpp::properties M07_AXI_transactor_param_props;
    M07_AXI_transactor_param_props.addLong("DATA_WIDTH", "32");
    M07_AXI_transactor_param_props.addLong("FREQ_HZ", "100000000");
    M07_AXI_transactor_param_props.addLong("ID_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ADDR_WIDTH", "16");
    M07_AXI_transactor_param_props.addLong("AWUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("ARUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("RUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("BUSER_WIDTH", "0");
    M07_AXI_transactor_param_props.addLong("HAS_BURST", "0");
    M07_AXI_transactor_param_props.addLong("HAS_LOCK", "0");
    M07_AXI_transactor_param_props.addLong("HAS_PROT", "1");
    M07_AXI_transactor_param_props.addLong("HAS_CACHE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_QOS", "0");
    M07_AXI_transactor_param_props.addLong("HAS_REGION", "0");
    M07_AXI_transactor_param_props.addLong("HAS_WSTRB", "1");
    M07_AXI_transactor_param_props.addLong("HAS_BRESP", "1");
    M07_AXI_transactor_param_props.addLong("HAS_RRESP", "1");
    M07_AXI_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "0");
    M07_AXI_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "8");
    M07_AXI_transactor_param_props.addLong("MAX_BURST_LENGTH", "1");
    M07_AXI_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    M07_AXI_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_SIZE", "0");
    M07_AXI_transactor_param_props.addLong("HAS_RESET", "1");
    M07_AXI_transactor_param_props.addFloat("PHASE", "0.0");
    M07_AXI_transactor_param_props.addString("PROTOCOL", "AXI4LITE");
    M07_AXI_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    M07_AXI_transactor_param_props.addString("CLK_DOMAIN", "system_axi_adrv9001_0_dac_1_clk");

    mp_M07_AXI_transactor = new xtlm::xaximm_xtlm2pin_t<32,16,1,1,1,1,1,1>("M07_AXI_transactor", M07_AXI_transactor_param_props);
  mp_M07_AXI_transactor->AWADDR(M07_AXI_awaddr);
  mp_M07_AXI_transactor->AWPROT(M07_AXI_awprot);
  mp_M07_AXI_transactor->AWVALID(M07_AXI_awvalid);
  mp_M07_AXI_transactor->AWREADY(M07_AXI_awready);
  mp_M07_AXI_transactor->WDATA(M07_AXI_wdata);
  mp_M07_AXI_transactor->WSTRB(M07_AXI_wstrb);
  mp_M07_AXI_transactor->WVALID(M07_AXI_wvalid);
  mp_M07_AXI_transactor->WREADY(M07_AXI_wready);
  mp_M07_AXI_transactor->BRESP(M07_AXI_bresp);
  mp_M07_AXI_transactor->BVALID(M07_AXI_bvalid);
  mp_M07_AXI_transactor->BREADY(M07_AXI_bready);
  mp_M07_AXI_transactor->ARADDR(M07_AXI_araddr);
  mp_M07_AXI_transactor->ARPROT(M07_AXI_arprot);
  mp_M07_AXI_transactor->ARVALID(M07_AXI_arvalid);
  mp_M07_AXI_transactor->ARREADY(M07_AXI_arready);
  mp_M07_AXI_transactor->RDATA(M07_AXI_rdata);
  mp_M07_AXI_transactor->RRESP(M07_AXI_rresp);
  mp_M07_AXI_transactor->RVALID(M07_AXI_rvalid);
  mp_M07_AXI_transactor->RREADY(M07_AXI_rready);
  mp_M07_AXI_transactor->CLK(aclk1);
  mp_M07_AXI_transactor->RST(aresetn);

  // initialize transactors stubs
  S00_AXI_transactor_target_wr_socket_stub = nullptr;
  S00_AXI_transactor_target_rd_socket_stub = nullptr;
  M00_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M00_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M01_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M01_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M02_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M02_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M03_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M03_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M04_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M04_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M05_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M05_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M06_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M06_AXI_transactor_initiator_rd_socket_stub = nullptr;
  M07_AXI_transactor_initiator_wr_socket_stub = nullptr;
  M07_AXI_transactor_initiator_rd_socket_stub = nullptr;

}

void system_axi_hpm0_lpd_interconnect_0::before_end_of_elaboration()
{
  // configure 'S00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "S00_AXI_TLM_MODE") != 1)
  {
    mp_impl->S00_AXI_tlm_aximm_read_socket->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_impl->S00_AXI_tlm_aximm_write_socket->bind(*(mp_S00_AXI_transactor->wr_socket));
  
  }
  else
  {
    S00_AXI_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    S00_AXI_transactor_target_wr_socket_stub->bind(*(mp_S00_AXI_transactor->wr_socket));
    S00_AXI_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    S00_AXI_transactor_target_rd_socket_stub->bind(*(mp_S00_AXI_transactor->rd_socket));
    mp_S00_AXI_transactor->disable_transactor();
  }

  // configure 'M00_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M00_AXI_TLM_MODE") != 1)
  {
    mp_impl->M00_AXI_tlm_aximm_read_socket->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_impl->M00_AXI_tlm_aximm_write_socket->bind(*(mp_M00_AXI_transactor->wr_socket));
  
  }
  else
  {
    M00_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M00_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M00_AXI_transactor->wr_socket));
    M00_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M00_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M00_AXI_transactor->rd_socket));
    mp_M00_AXI_transactor->disable_transactor();
  }

  // configure 'M01_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M01_AXI_TLM_MODE") != 1)
  {
    mp_impl->M01_AXI_tlm_aximm_read_socket->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_impl->M01_AXI_tlm_aximm_write_socket->bind(*(mp_M01_AXI_transactor->wr_socket));
  
  }
  else
  {
    M01_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M01_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M01_AXI_transactor->wr_socket));
    M01_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M01_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M01_AXI_transactor->rd_socket));
    mp_M01_AXI_transactor->disable_transactor();
  }

  // configure 'M02_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M02_AXI_TLM_MODE") != 1)
  {
    mp_impl->M02_AXI_tlm_aximm_read_socket->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_impl->M02_AXI_tlm_aximm_write_socket->bind(*(mp_M02_AXI_transactor->wr_socket));
  
  }
  else
  {
    M02_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M02_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M02_AXI_transactor->wr_socket));
    M02_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M02_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M02_AXI_transactor->rd_socket));
    mp_M02_AXI_transactor->disable_transactor();
  }

  // configure 'M03_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M03_AXI_TLM_MODE") != 1)
  {
    mp_impl->M03_AXI_tlm_aximm_read_socket->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_impl->M03_AXI_tlm_aximm_write_socket->bind(*(mp_M03_AXI_transactor->wr_socket));
  
  }
  else
  {
    M03_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M03_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M03_AXI_transactor->wr_socket));
    M03_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M03_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M03_AXI_transactor->rd_socket));
    mp_M03_AXI_transactor->disable_transactor();
  }

  // configure 'M04_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M04_AXI_TLM_MODE") != 1)
  {
    mp_impl->M04_AXI_tlm_aximm_read_socket->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_impl->M04_AXI_tlm_aximm_write_socket->bind(*(mp_M04_AXI_transactor->wr_socket));
  
  }
  else
  {
    M04_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M04_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M04_AXI_transactor->wr_socket));
    M04_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M04_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M04_AXI_transactor->rd_socket));
    mp_M04_AXI_transactor->disable_transactor();
  }

  // configure 'M05_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M05_AXI_TLM_MODE") != 1)
  {
    mp_impl->M05_AXI_tlm_aximm_read_socket->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_impl->M05_AXI_tlm_aximm_write_socket->bind(*(mp_M05_AXI_transactor->wr_socket));
  
  }
  else
  {
    M05_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M05_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M05_AXI_transactor->wr_socket));
    M05_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M05_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M05_AXI_transactor->rd_socket));
    mp_M05_AXI_transactor->disable_transactor();
  }

  // configure 'M06_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M06_AXI_TLM_MODE") != 1)
  {
    mp_impl->M06_AXI_tlm_aximm_read_socket->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_impl->M06_AXI_tlm_aximm_write_socket->bind(*(mp_M06_AXI_transactor->wr_socket));
  
  }
  else
  {
    M06_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M06_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M06_AXI_transactor->wr_socket));
    M06_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M06_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M06_AXI_transactor->rd_socket));
    mp_M06_AXI_transactor->disable_transactor();
  }

  // configure 'M07_AXI' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("system_axi_hpm0_lpd_interconnect_0", "M07_AXI_TLM_MODE") != 1)
  {
    mp_impl->M07_AXI_tlm_aximm_read_socket->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_impl->M07_AXI_tlm_aximm_write_socket->bind(*(mp_M07_AXI_transactor->wr_socket));
  
  }
  else
  {
    M07_AXI_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    M07_AXI_transactor_initiator_wr_socket_stub->bind(*(mp_M07_AXI_transactor->wr_socket));
    M07_AXI_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    M07_AXI_transactor_initiator_rd_socket_stub->bind(*(mp_M07_AXI_transactor->rd_socket));
    mp_M07_AXI_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




system_axi_hpm0_lpd_interconnect_0::~system_axi_hpm0_lpd_interconnect_0()
{
  delete mp_S00_AXI_transactor;
  delete mp_S00_AXI_awlock_converter;
  delete mp_S00_AXI_arlock_converter;

  delete mp_M00_AXI_transactor;

  delete mp_M01_AXI_transactor;

  delete mp_M02_AXI_transactor;

  delete mp_M03_AXI_transactor;

  delete mp_M04_AXI_transactor;

  delete mp_M05_AXI_transactor;

  delete mp_M06_AXI_transactor;

  delete mp_M07_AXI_transactor;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(system_axi_hpm0_lpd_interconnect_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(system_axi_hpm0_lpd_interconnect_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(system_axi_hpm0_lpd_interconnect_0);
SC_REGISTER_BV(40);
#endif

