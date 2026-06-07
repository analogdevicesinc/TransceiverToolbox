#!/bin/bash
# patch_bist_gate_rx_input_select.sh <prj_dir>
#
# Add rx_input_select signal-flow into MATLAB_Function (BIST counter) so that
# the error-count condition is gated by rx_input_select. When rx_input_select=0
# (internal loopback), bit_errors_out stops incrementing -- delta over any
# window is 0 -- giving "internal path has no errors". When rx_input_select=1
# (cable), normal behavior.
#
# This is a post-codegen Verilog patch -- requires only a Vivado-only rebuild
# (synth + impl + bitgen), not a full HDL Coder regen.
set -euo pipefail
PRJ=${1:?usage: $0 <project_dir>}

[ -d "$PRJ" ] || { echo "ERROR: $PRJ not found"; exit 2; }
echo "=== patching all Verilog copies under: $PRJ ==="

# Vivado uses IP-packaged + IP-shared copies of the generated Verilog, NOT the
# original hdlsrc/ copies. We must patch every copy of each file in the project.
patch_matlab_func() {
  F=$1
  if ! grep -q "rx_input_select" "$F"; then
    sed -i 's|^\(           start,\)|\1\n           rx_input_select,|' "$F"
    sed -i 's|^\(  input   start;\)|\1\n  input   rx_input_select;|' "$F"
    sed -i 's|assign tmp_13 = (tmp_3 <= 32.d120) && (p12tmp_1 != p12tmp_2);|assign tmp_13 = (tmp_3 <= 32'\''d120) \&\& (p12tmp_1 != p12tmp_2) \&\& rx_input_select;|' "$F"
    echo "  patched MATLAB_Function:    $F"
  fi
}

patch_capture_data_bits() {
  F=$1
  if ! grep -q "rx_input_select" "$F"; then
    sed -i 's|^\(           valid,\)|\1\n           rx_input_select,|' "$F"
    sed -i 's|^\(  input   valid;\)|\1\n  input   rx_input_select;|' "$F"
    sed -i 's|\(\.start(dataSrt),\)|\1\n                                                      .rx_input_select(rx_input_select),|' "$F"
    echo "  patched Capture_Data_Bits:   $F"
  fi
}

patch_receiver() {
  F=$1
  if ! grep -q "^  input   rx_input_select" "$F"; then
    sed -i 's|^\(           iq_debug_mux,\)|\1\n           rx_input_select,|' "$F"
    sed -i 's|^\(  input   \[31:0\] iq_debug_mux;  // uint32\)|\1\n  input   rx_input_select;|' "$F"
    sed -i 's|\(\.valid(validOut),\)|\1\n                                                          .rx_input_select(rx_input_select),|' "$F"
    echo "  patched Receiver:            $F"
  fi
}

patch_composite() {
  F=$1
  if ! grep -q "\.rx_input_select(rx_input_select)" "$F"; then
    sed -i 's|\(\.iq_debug_mux(iq_debug_mux),  // uint32\)|\1\n                                        .rx_input_select(rx_input_select),|' "$F"
    echo "  patched TxRxComposite:       $F"
  fi
}

# Apply to ALL copies of each file in the project tree
find "$PRJ" -name "TxRxCompo_ip_src_MATLAB_Function.v"   | while read f; do patch_matlab_func "$f"; done
find "$PRJ" -name "TxRxCompo_ip_src_Capture_Data_Bits.v" | while read f; do patch_capture_data_bits "$f"; done
find "$PRJ" -name "TxRxCompo_ip_src_Receiver.v"          | while read f; do patch_receiver "$f"; done
find "$PRJ" -name "TxRxCompo_ip_src_TxRxComposite.v"     | while read f; do patch_composite "$f"; done

H="$PRJ/hdlsrc/commhdlQPSKTxRxLoopback"

echo ""
echo "=== verification (grep for new lines) ==="
echo "MATLAB_Function.v tmp_13:"
grep "tmp_13 = " "$H/TxRxCompo_ip_src_MATLAB_Function.v" | head -2
echo "MATLAB_Function.v rx_input_select:"
grep "rx_input_select" "$H/TxRxCompo_ip_src_MATLAB_Function.v" | head -3
echo "Receiver.v rx_input_select usage:"
grep "rx_input_select" "$H/TxRxCompo_ip_src_Receiver.v" | head -3
echo "TxRxComposite.v Receiver instance:"
grep -A1 "u_Receiver\|\.rx_input_select" "$H/TxRxCompo_ip_src_TxRxComposite.v" | head -8

echo ""
echo "=== clearing OOC synth state ==="
find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "__synthesis_is_complete__" -delete 2>/dev/null || true
echo "OOC cache cleared"
