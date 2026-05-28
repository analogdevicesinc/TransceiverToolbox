#!/bin/bash
# patch_carrier_sync_gain.sh <new_gain_decimal>
#
# Post-codegen Verilog patch: change Carrier_Synchronizer's Loop Filter
# Gain1 coefficient. Original is 98 (= 17'sb00000000001100010 ≈ 0.0015).
# Lower → narrower loop BW → less noise tracked → potentially lower BER
# on noisy channels. Higher → wider BW → faster lock, more noise.
#
# Patches ALL 4 copies of the file in the Vivado project tree:
#   hdlsrc/, ipcore/, vivado_ip_prj/ipcore/, vivado_prj.gen/sources_1/.../
#
# Usage: bash patch_carrier_sync_gain.sh 49   # half default
#        bash patch_carrier_sync_gain.sh 196  # double default
set -euo pipefail
NEW_GAIN="${1:?usage: $0 <new_gain_decimal>}"
PRJ="/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl_prj_jupiter_composite"

# Convert decimal to 17-bit signed binary
NEW_BIN=$(python3 -c "v = int('$NEW_GAIN');
assert -65536 <= v <= 65535, 'out of 17-bit signed range'
if v < 0: v += (1<<17)
print(format(v, '017b'))")
echo "new gain coeff: $NEW_GAIN dec → 17'sb$NEW_BIN"

# Patch the Gain1_mul_temp line regardless of current coefficient value.
NEW_LINE="  assign Gain1_mul_temp = 17'sb$NEW_BIN * Delay7_out1;"

patched=0
for f in $(find "$PRJ" -name "TxRxCompo_ip_src_Loop_Filter_block.v"); do
    cur_line=$(grep "Gain1_mul_temp = 17'sb" "$f" | head -1)
    if [ -n "$cur_line" ]; then
        # Use Perl-style sed: substitute the entire line
        sed -i "s|assign Gain1_mul_temp = 17'sb[01]\+ \* Delay7_out1;|assign Gain1_mul_temp = 17'sb${NEW_BIN} * Delay7_out1;|" "$f"
        new_cur=$(grep -oE "Gain1_mul_temp = 17'sb[01]+" "$f" | head -1)
        echo "patched: $f  (now: $new_cur)"
        patched=$((patched+1))
    else
        echo "  no Gain1 found in: $f"
    fi
done
echo "patched $patched copies"

# Reset Vivado OOC synth caches so the new coeff actually rebuilds
echo "--- clearing OOC synth state ---"
find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "__synthesis_is_complete__" -delete 2>/dev/null || true
find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "*.runs.log" -delete 2>/dev/null || true
echo "OOC checkpoints cleared"
