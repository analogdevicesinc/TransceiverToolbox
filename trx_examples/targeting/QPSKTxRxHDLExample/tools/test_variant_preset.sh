#!/bin/bash
# test_variant_preset.sh <variant_name>
# Deploy a built composite variant's BOOT.BIN, then measure cable BER using the
# RELIABLE methodology found in round 5: pre-set Rx LO = 2.4 GHz + 2 kHz BEFORE
# acquisition (cancels the board's intrinsic ~-2 kHz Tx/Rx LO offset, centering
# the narrow ~+-2 kHz pull-in window), NO rstCS, 3 reboots for lock consistency.
# Look for the deterministic 50.43% per-120 floor dropping toward 0 (= the static
# rotation/spectral-inversion is fixed).
set -uo pipefail
NAME=${1:?usage: $0 <variant_name>}
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
echo "########## DEPLOY $NAME ##########"
bash tools/deploy_composite_variant.sh "$NAME" 2>&1 | tail -8
echo "########## MEASURE $NAME (pre-set +2kHz CFO, 3 reboots) ##########"
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "measure_cfo_preset" 2>&1 | grep -vE "Trial License|^\s*$|Signal 127"
echo "########## DONE $NAME ##########"
