#!/bin/bash
# patch_cs_gain_in_project.sh <project_dir> <new_gain_decimal>
# Patches CS Loop Filter Gain1 coefficient in ALL Verilog copies in the project tree.
# Project-tree-relative version of patch_carrier_sync_gain.sh.
set -euo pipefail
PRJ=${1:?usage: $0 <project_dir> <new_gain_decimal>}
NEW_GAIN=${2:?need <new_gain_decimal>}

NEW_BIN=$(python3 -c "v = int('$NEW_GAIN');
assert -65536 <= v <= 65535, 'out of 17-bit signed range'
if v < 0: v += (1<<17)
print(format(v, '017b'))")
echo "new CS Gain1: $NEW_GAIN dec → 17'sb$NEW_BIN"

patched=0
for f in $(find "$PRJ" -name "TxRxCompo_ip_src_Loop_Filter_block.v"); do
    if grep -q "Gain1_mul_temp = 17'sb" "$f"; then
        sed -i "s|assign Gain1_mul_temp = 17'sb[01]\+ \* Delay7_out1;|assign Gain1_mul_temp = 17'sb${NEW_BIN} * Delay7_out1;|" "$f"
        echo "  patched: $f"
        patched=$((patched+1))
    fi
done
echo "patched $patched copies"

# Clear OOC synth caches so the new coeff actually rebuilds
find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "__synthesis_is_complete__" -delete 2>/dev/null || true
echo "OOC checkpoints cleared"
