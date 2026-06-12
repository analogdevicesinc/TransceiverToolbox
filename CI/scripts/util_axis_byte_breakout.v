// util_axis_byte_breakout -- exposes an AXI-Stream slave's member signals
// as plain BD pins so an HDL Coder DUT's internal IO interfaces can attach
// to them (interface pins on IP Integrator cells cannot be wired to plain
// DUT pins directly). Pass-through for data/valid/ready; the DUT drives
// byte_ready, giving true AXIS backpressure toward the byte-stream DMA.
//
// byte_first is an in-band first-word marker: it is high while the current
// beat is the FIRST beat of a transfer. axi_dmac asserts tlast on the final
// beat of each (cyclic) transfer, so the beat after a tlast beat is word 1:
// the flag resets to 1 and, after every accepted beat (tvalid && tready),
// takes that beat's tlast. The DUT uses it to word-align the cyclic DMA
// stream to its packet boundary.

`timescale 1ns/1ps

module util_axis_byte_breakout (
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_aclk CLK" *)
  (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis" *)
  input  wire        s_axis_aclk,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
  input  wire [63:0] s_axis_tdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
  input  wire        s_axis_tvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
  output wire        s_axis_tready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
  input  wire        s_axis_tlast,

  output wire [63:0] byte_data,
  output wire        byte_valid,
  input  wire        byte_ready,
  output wire        byte_first
);

  assign byte_data     = s_axis_tdata;
  assign byte_valid    = s_axis_tvalid;
  assign s_axis_tready = byte_ready;

  // "current beat is the first of a transfer": 1 out of reset, then after
  // each accepted beat it becomes that beat's tlast (beat-after-last = first)
  reg first_r = 1'b1;
  always @(posedge s_axis_aclk) begin
    if (s_axis_tvalid && byte_ready)
      first_r <= s_axis_tlast;
  end
  assign byte_first = first_r;

endmodule
