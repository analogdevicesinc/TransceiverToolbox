// util_axis_byte_breakout_m -- the AXIS MASTER mirror of
// util_axis_byte_breakout: exposes an AXI-Stream master's member signals as
// plain BD pins so an HDL Coder DUT's internal IO interfaces can DRIVE them
// (interface pins on IP Integrator cells cannot be wired to plain DUT pins
// directly). Pure pass-through: the DUT drives byte_data/byte_valid/
// byte_last toward the rx_byte_dma write channel (s_axis) and samples
// byte_ready (= the DMA's tready) for its drop-on-stall decision.
//
// The DUT-side beat gate guarantees byte_valid is asserted for exactly one
// ACCEPTED beat per serialized word (held until tvalid && tready), so no
// extra handshake logic is needed here.

`timescale 1ns/1ps

module util_axis_byte_breakout_m (
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK" *)
  (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis" *)
  input  wire        m_axis_aclk,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
  output wire [63:0] m_axis_tdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
  output wire        m_axis_tvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
  input  wire        m_axis_tready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
  output wire        m_axis_tlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *)
  output wire        m_axis_tuser,

  // quasi-static control: 1 = per-packet TLAST (280 B one-shot captures,
  // legacy behavior), 0 = no TLAST so the DMA can run multi-packet
  // transfers bounded by X_LENGTH only (TUSER still marks packet starts
  // for SYNC_TRANSFER_START alignment). Driven by byte_ctrl_gpio bit 0.
  input  wire        tlast_en,

  input  wire [63:0] byte_data,
  input  wire        byte_valid,
  input  wire        byte_last,
  input  wire        byte_user,
  output wire        byte_ready
);

  assign m_axis_tdata  = byte_data;
  assign m_axis_tvalid = byte_valid;
  assign m_axis_tlast  = byte_last & tlast_en;
  assign m_axis_tuser  = byte_user;
  assign byte_ready    = m_axis_tready;

endmodule
