#!/bin/bash
# regen_bootbin.sh — after rebuild_patched.tcl finishes, copy new bitstream
# into boot/ and run bootgen to produce a fresh BOOT.BIN.
set -eo pipefail   # NOTE: no -u (Vivado settings hit unbound PYTHONPATH)
PRJ=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl_prj_jupiter_composite/vivado_ip_prj
BIT=$PRJ/vivado_prj.runs/impl_1/system_top.bit
BOOT=$PRJ/boot

[ -f "$BIT" ] || { echo "ERROR: $BIT missing"; exit 1; }
cp -f "$BIT" "$BOOT/system_top.bit"
cd "$BOOT"
source /tools/Xilinx/2025.1/Vivado/settings64.sh
bootgen -arch zynqmp -image zynq.bif -o BOOT.BIN -w
echo "BOOT.BIN size: $(stat -c %s BOOT.BIN), md5: $(md5sum BOOT.BIN | cut -d' ' -f1)"
