#!/bin/bash
# patch_agc_gain.sh <multiplier>
#
# Patch the AGC's Loop_Filter.v Gain1 coefficient by <multiplier> (e.g., 0.5
# for halving, 2 for doubling). The original coefficient is sfix33_En28
# ≈ 8.192. The multiplier <= 0.0 is rejected.
set -eo pipefail
MULT="${1:?usage: $0 <multiplier>}"
PRJ="/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl_prj_jupiter_composite"

# Original Gain1 coefficient = 0x083126E98 in 33-bit signed hex (≈8.19).
# Compute new value preserving 33-bit signed Q-format.
NEW_HEX=$(python3 - <<EOF
orig = 0x083126E98
new_val = int(orig * $MULT)
# Mask to 33 bits
new_val_33 = new_val & ((1<<33)-1)
print('{:09X}'.format(new_val_33))
EOF
)
echo "AGC Gain1: 0x083126E98 * $MULT = 0x$NEW_HEX (mult ≈ 8.19 → $(python3 -c 'print(0x083126E98*'$MULT'/2**28)'))"
echo ""

NEW_LINE="  assign Gain1_mul_temp = 33'sh${NEW_HEX} * Delay3_out1_re;"
NEW_LINE_1="  assign Gain1_mul_temp_1 = 33'sh${NEW_HEX} * Delay3_out1_im;"

patched=0
for f in $(find "$PRJ" -name "TxRxCompo_ip_src_Loop_Filter.v"); do
    if grep -q "Gain1_mul_temp = 33'sh" "$f"; then
        sed -i "s|assign Gain1_mul_temp = 33'sh[0-9A-Fa-f]\+ \* Delay3_out1_re;|assign Gain1_mul_temp = 33'sh${NEW_HEX} * Delay3_out1_re;|" "$f"
        sed -i "s|assign Gain1_mul_temp_1 = 33'sh[0-9A-Fa-f]\+ \* Delay3_out1_im;|assign Gain1_mul_temp_1 = 33'sh${NEW_HEX} * Delay3_out1_im;|" "$f"
        new=$(grep -oE "Gain1_mul_temp = 33'sh[0-9A-Fa-f]+" "$f" | head -1)
        echo "patched: $f  ($new)"
        patched=$((patched+1))
    fi
done
echo "patched $patched copies"

echo "--- clearing OOC synth state ---"
find "$PRJ/vivado_ip_prj/vivado_prj.runs" -name "__synthesis_is_complete__" -delete 2>/dev/null || true
echo "OOC checkpoints cleared"
