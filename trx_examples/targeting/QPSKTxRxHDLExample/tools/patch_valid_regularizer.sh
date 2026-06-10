#!/bin/bash
# patch_valid_regularizer.sh <prj_dir>
#
# Insert a "valid regularizer" into the IP wrapper TxRxCompo_ip.v, between the
# dut_data_* input ports and the inner TxRxCompo_ip_dut instance:
#   - depth-4 FIFO absorbs bursty/jittered placement of dut_data_valid_in_rx
#     beats (CDC upstream in the BD) and re-emits a perfectly regular 1-in-2
#     strobe toward the DUT (whose internal fixed-phase resampler assumes it).
#   - irregularity counters are exposed on the existing (otherwise useless)
#     count_out AXI readback at offset 0x100 as {gap3_events[15:0],
#     burst_events[15:0]}: both stay 0 iff the incoming valid is already a
#     regular gap-2 strobe, so ONE register read on hardware confirms or
#     refutes the burstiness hypothesis.
#
# Post-codegen Verilog patch -- requires only a Vivado-only rebuild
# (synth + impl + bitgen), not a full HDL Coder regen.
#
# KEY LESSON (see patch_bist_gate_rx_input_select.sh): Vivado uses
# IP-packaged + IP-shared COPIES of the generated Verilog, NOT the original
# hdlsrc/ copy. Patch EVERY copy of TxRxCompo_ip.v under the project tree and
# clear the OOC synthesis completion markers.
set -euo pipefail
PRJ=${1:?usage: $0 <project_dir>}

[ -d "$PRJ" ] || { echo "ERROR: $PRJ not found"; exit 2; }
echo "=== patching all TxRxCompo_ip.v copies under: $PRJ ==="

BLK=$(mktemp /tmp/vr_block.XXXXXX.v)
trap 'rm -f "$BLK"' EXIT
cat > "$BLK" <<'EOF'
  // ---- valid regularizer: absorbs bursty/jittered valid beat placement and
  // re-emits a perfectly regular 1-in-2 strobe toward the DUT. count_out is
  // repurposed as {gap3_events[15:0], burst_events[15:0]} on AXI 0x100:
  // both stay 0 iff the incoming valid is already a regular gap-2 strobe. ----
  reg signed [15:0] vr_fI [0:3];
  reg signed [15:0] vr_fQ [0:3];
  reg  [2:0] vr_wr;
  reg  [2:0] vr_rd;
  reg        vr_ph;
  reg        vr_valid_d1;
  reg        vr_seen;       // a valid has been seen since reset/enable
  reg  [3:0] vr_gap;
  reg [15:0] vr_burst_cnt;
  reg [15:0] vr_gap3_cnt;
  wire [2:0] vr_fill = vr_wr - vr_rd;
  wire       vr_pop  = vr_ph && (vr_fill != 3'd0);
  always @(posedge IPCORE_CLK) begin
    if (reset) begin
      vr_wr <= 3'd0; vr_rd <= 3'd0; vr_ph <= 1'b0;
      vr_valid_d1 <= 1'b0; vr_seen <= 1'b0; vr_gap <= 4'd0;
      vr_burst_cnt <= 16'd0; vr_gap3_cnt <= 16'd0;
    end
    else begin
      if (dut_data_valid_in_rx) begin
        vr_fI[vr_wr[1:0]] <= dut_data_in_0_rx;
        vr_fQ[vr_wr[1:0]] <= dut_data_in_1_rx;
        vr_wr <= vr_wr + 3'd1;
      end
      if (vr_pop) begin
        vr_rd <= vr_rd + 3'd1;
      end
      vr_ph <= ~vr_ph;
      vr_valid_d1 <= dut_data_valid_in_rx;
      if (dut_data_valid_in_rx) begin
        if (vr_valid_d1) begin
          vr_burst_cnt <= vr_burst_cnt + 16'd1;
        end
        if (vr_seen && (vr_gap >= 4'd3)) begin
          // vr_seen guard: don't count the (arbitrarily long) idle gap
          // before the very first valid after reset/enable
          vr_gap3_cnt <= vr_gap3_cnt + 16'd1;
        end
        vr_seen <= 1'b1;
        vr_gap <= 4'd1;
      end
      else if (vr_gap != 4'hF) begin
        vr_gap <= vr_gap + 4'd1;
      end
    end
  end
  wire        vr_out_valid = vr_pop;
  wire signed [15:0] vr_out_I = vr_fI[vr_rd[1:0]];
  wire signed [15:0] vr_out_Q = vr_fQ[vr_rd[1:0]];

EOF

patch_wrapper() {
  F=$1
  if grep -q "vr_out_valid" "$F"; then
    echo "  already patched (skip):     $F"
    return 0
  fi
  # sanity anchors -- fail loudly if generated code drifted
  grep -q '^  assign adc_dataInI_sig = dut_data_in_0_rx;$' "$F" || { echo "ERROR: I-assign anchor missing in $F"; exit 3; }
  grep -q '^  assign adc_dataInQ_sig = dut_data_in_1_rx;$' "$F" || { echo "ERROR: Q-assign anchor missing in $F"; exit 3; }
  grep -q '\.adc_validIn(dut_data_valid_in_rx),' "$F"           || { echo "ERROR: validIn anchor missing in $F"; exit 3; }
  grep -q '\.read_count_out(count_out_sig),' "$F"               || { echo "ERROR: count_out anchor missing in $F"; exit 3; }
  grep -q '^  TxRxCompo_ip_dut u_TxRxCompo_ip_dut_inst' "$F"    || { echo "ERROR: dut-inst anchor missing in $F"; exit 3; }

  # insert regularizer block just before the first use of its outputs (the
  # adc_dataInI_sig assign) so vr_* declarations precede all references --
  # the AXI-lite and dut instances that consume them come later in the file
  awk 'NR==FNR { blk = blk $0 ORS; next }
       /^  assign adc_dataInI_sig = dut_data_in_0_rx;$/ && !done { printf "%s", blk; done = 1 }
       { print }' "$BLK" "$F" > "$F.vrtmp" && mv "$F.vrtmp" "$F"

  # rewire: DUT now consumes the regularized stream; AXI 0x100 now reads the
  # irregularity counters
  sed -i 's|^  assign adc_dataInI_sig = dut_data_in_0_rx;$|  assign adc_dataInI_sig = vr_out_I;|' "$F"
  sed -i 's|^  assign adc_dataInQ_sig = dut_data_in_1_rx;$|  assign adc_dataInQ_sig = vr_out_Q;|' "$F"
  sed -i 's|\.adc_validIn(dut_data_valid_in_rx),|.adc_validIn(vr_out_valid),|' "$F"
  sed -i 's|\.read_count_out(count_out_sig),|.read_count_out({vr_gap3_cnt, vr_burst_cnt}),|' "$F"
  echo "  patched:                    $F"
}

NPATCH=0
while read -r f; do
  patch_wrapper "$f"
  NPATCH=$((NPATCH+1))
done < <(find "$PRJ" -name "TxRxCompo_ip.v" | sort)
[ "$NPATCH" -gt 0 ] || { echo "ERROR: no TxRxCompo_ip.v found under $PRJ"; exit 4; }
echo "=== $NPATCH copies processed ==="

echo ""
echo "=== clearing OOC synth state ==="
if [ -d "$PRJ/vivado_ip_prj/vivado_prj.runs" ]; then
  find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "__synthesis_is_complete__" -delete 2>/dev/null || true
  echo "OOC cache cleared"
else
  echo "no vivado_ip_prj/vivado_prj.runs under $PRJ (sim-only tree) -- skipped"
fi
