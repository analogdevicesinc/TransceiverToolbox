// util_valid_regularizer -- absorbs burst/jitter in the upstream valid beat
// placement and re-emits the sample stream on a perfectly regular 1-in-2
// strobe. Transparent (latency only) when the incoming valid is already a
// regular gap-2 strobe; corrective when CDC stages upstream clump beats.
// Single clock domain. Depth-4 skid FIFO per the verified post-codegen patch
// (xsim-proven to decode under regular, burst2, and jitter valid patterns).
//
// Intended use (HDL Coder reference designs): between the transceiver core's
// adc data/valid pins and the sync_input delay stage feeding the user IP, so
// generated DUTs never see an irregular valid. Average input valid duty must
// not exceed 1-in-2 long-term (true for the SSI interface rates this serves).

`timescale 1ns/1ps

module util_valid_regularizer #(
  parameter DATA_WIDTH = 16
) (
  input  wire                  clk,
  input  wire                  rstn,

  input  wire                  in_valid,
  input  wire [DATA_WIDTH-1:0] in_data_0,
  input  wire [DATA_WIDTH-1:0] in_data_1,
  input  wire [DATA_WIDTH-1:0] in_data_2,
  input  wire [DATA_WIDTH-1:0] in_data_3,

  output wire                  out_valid,
  output wire [DATA_WIDTH-1:0] out_data_0,
  output wire [DATA_WIDTH-1:0] out_data_1,
  output wire [DATA_WIDTH-1:0] out_data_2,
  output wire [DATA_WIDTH-1:0] out_data_3
);

  reg [DATA_WIDTH-1:0] fifo_0 [0:3];
  reg [DATA_WIDTH-1:0] fifo_1 [0:3];
  reg [DATA_WIDTH-1:0] fifo_2 [0:3];
  reg [DATA_WIDTH-1:0] fifo_3 [0:3];
  reg [2:0] wr_ptr;
  reg [2:0] rd_ptr;
  reg       phase;

  wire [2:0] fill = wr_ptr - rd_ptr;
  wire       pop  = phase && (fill != 3'd0);

  always @(posedge clk) begin
    if (!rstn) begin
      wr_ptr <= 3'd0;
      rd_ptr <= 3'd0;
      phase  <= 1'b0;
    end
    else begin
      if (in_valid) begin
        fifo_0[wr_ptr[1:0]] <= in_data_0;
        fifo_1[wr_ptr[1:0]] <= in_data_1;
        fifo_2[wr_ptr[1:0]] <= in_data_2;
        fifo_3[wr_ptr[1:0]] <= in_data_3;
        wr_ptr <= wr_ptr + 3'd1;
      end
      if (pop) begin
        rd_ptr <= rd_ptr + 3'd1;
      end
      phase <= ~phase;
    end
  end

  assign out_valid  = pop;
  assign out_data_0 = fifo_0[rd_ptr[1:0]];
  assign out_data_1 = fifo_1[rd_ptr[1:0]];
  assign out_data_2 = fifo_2[rd_ptr[1:0]];
  assign out_data_3 = fifo_3[rd_ptr[1:0]];

endmodule
