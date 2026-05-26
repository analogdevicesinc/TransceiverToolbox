#!/bin/bash
# v42_patch_carrier_sync_or.sh <kit_dir>
#
# Post-codegen Verilog patch: change the DDS reset gate inside
# Carrier_Synchronizer.v from AND to OR, so external rstCS pulses
# ALWAYS reset the CS DDS NCO (bypassing the Loop_Filter_rst gating).
#
# Empirical result (V42 v4 deployed 2026-05-26): even with this patch +
# the V40-style HDL watchdog pulsing rstCS every 8000 packets, the chain
# BER stays at 7.29%. The CS NCO is NOT the failing element.
#
# Usage: build a watchdog variant first (e.g. V40), then:
#   bash v42_patch_carrier_sync_or.sh <kit_dir>
# Then force full re-synth via vivado:
#   set_property AUTO_INCREMENTAL_CHECKPOINT 0 [get_runs synth_1]
#   find vivado_prj.runs -name __synthesis_is_complete__ -delete
#   foreach r [get_runs *synth*] { reset_run $r }
#   launch_runs synth_1; wait_on_run synth_1
#   launch_runs impl_1 -to_step write_bitstream; wait_on_run impl_1
#
# (HDL Coder caches OOC synth checkpoints — must reset every *synth*
# run including system_TxRxLoopb_ip_0_0_synth_1, not just synth_1.)
set -euo pipefail
KIT="${1:?usage: v42_patch_carrier_sync_or.sh <kit_dir>}"
patched=0
for f in $(find "$KIT" -name "TxRxLoopb_ip_src_Carrier_Synchronizer.v"); do
  if grep -q 'Logical_Operator_out1 = manualRst & Loop_Filter_rst' "$f"; then
    sed -i 's/Logical_Operator_out1 = manualRst & Loop_Filter_rst/Logical_Operator_out1 = manualRst | Loop_Filter_rst/g' "$f"
    echo "patched: $f"
    patched=$((patched+1))
  fi
done
echo "patched $patched file(s)"
