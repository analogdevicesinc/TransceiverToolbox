// util_axis_byte_breakout -- exposes an AXI-Stream slave's member signals
// as plain BD pins so an HDL Coder DUT's internal IO interfaces can attach
// to them (interface pins on IP Integrator cells cannot be wired to plain
// DUT pins directly). Pure pass-through; the DUT drives byte_ready, giving
// true AXIS backpressure toward the byte-stream DMA.

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

  output wire [63:0] byte_data,
  output wire        byte_valid,
  input  wire        byte_ready
);

  assign byte_data     = s_axis_tdata;
  assign byte_valid    = s_axis_tvalid;
  assign s_axis_tready = byte_ready;

endmodule
