// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2023 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

/*
 * Helper module for synchronizing bit signals from one clock domain to another.
 * It uses the standard approach of 2 FF in series.
 * Note, that while the module allows to synchronize multiple bits at once it is
 * only able to synchronize multi-bit signals where at max one bit changes per
 * clock cycle (e.g. a gray counter).
 */

`timescale 1ns/100ps

module sync_fast_to_slow #(
  // Depth of the fifo
  parameter DEPTH = 4,
  // Number of bits to synchronize
  parameter WIDTH = 2,
  // Clock ratio between fast and slow clock
  // Used to improve latency
  // At a ratio of 4, the design slightly changes in favor of latency
  parameter RATIO = 4
) (
  input [WIDTH-1:0] in_data,
  input in_resetn,
  input in_clk,

  output reg [WIDTH-1:0] out_data,
  input out_resetn,
  input out_clk
);

  reg [WIDTH-1:0] fifo [DEPTH-1:0];

  reg [DEPTH/2-1:0] rd_addr;
  reg [DEPTH/2-1:0] wr_addr;

  reg cdc_sync_stage0_tick;
  reg cdc_sync_stage1_tick;
  reg cdc_sync_stage2_tick;
  reg cdc_sync_stage3_tick;

  wire tick;

  assign tick = cdc_sync_stage2_tick ^ cdc_sync_stage3_tick;

  always @(posedge out_clk)
  begin
    if (out_resetn == 1'b0)
      cdc_sync_stage0_tick <= 1'b0;
    else
      cdc_sync_stage0_tick <= ~cdc_sync_stage0_tick;
  end

  always @(posedge in_clk)
  begin
    if (in_resetn == 1'b0) begin
      cdc_sync_stage1_tick <= 1'b0;
      cdc_sync_stage2_tick <= 1'b0;
      cdc_sync_stage3_tick <= 1'b0;
    end else begin
      cdc_sync_stage1_tick <= cdc_sync_stage0_tick;
      cdc_sync_stage2_tick <= cdc_sync_stage1_tick;
      cdc_sync_stage3_tick <= cdc_sync_stage2_tick;
    end
  end

  generate if (RATIO < 4) begin
    always @(posedge in_clk)
    begin
      if (in_resetn == 1'b0) begin
        wr_addr <= 0;
      end else begin
        if ((tick == 1'b1) || (rd_addr == wr_addr)) begin
          fifo[wr_addr] <= in_data;
          wr_addr <= (wr_addr + 1) % DEPTH;
        end
      end
    end
  end else begin
    always @(posedge in_clk)
    begin
      if (in_resetn == 1'b0) begin
        wr_addr <= 1;
      end else begin
        if (tick == 1'b1) begin
          fifo[wr_addr] <= in_data;
          wr_addr <= (wr_addr + 1) % DEPTH;
        end
      end
    end
  end endgenerate

  always @(posedge out_clk)
  begin
    if (out_resetn == 1'b0)
      rd_addr <= 0;
    else
      if (rd_addr != wr_addr)
        rd_addr <= (rd_addr + 1) % DEPTH;
	out_data <= fifo[rd_addr];
  end

endmodule
