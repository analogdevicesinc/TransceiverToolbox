#!/bin/bash
# measure_one_variant.sh <variant_name>
# Generate BOOT.BIN for a scratch variant, deploy, then run a 30s window in
# internal mode and one in cable mode -- compact one-line summary per mode.
set -eo pipefail
NAME=${1:?usage: $0 <variant_name>}
PRJ=/mnt/onetb/scratch/qpsk_variants/$NAME/hdl_prj_jupiter_composite/vivado_ip_prj
HERE=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample

bash "$PRJ/regen_bootbin.sh" 2>&1 | grep -E "size:|generated|ERROR" || true
"$HERE/tools/deploy_composite_variant.sh" "$NAME" 2>&1 | grep -E "md5:|operating|errors=|deploy complete|board down|ping up" || true

# 30 s internal (rx_sel=0 is default at boot)
echo ""
echo "=== INTERNAL 30s ($NAME) ==="
P0=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000104 32' | tr -d '[:space:]')
E0=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000108 32' | tr -d '[:space:]')
sleep 30
P1=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000104 32' | tr -d '[:space:]')
E1=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000108 32' | tr -d '[:space:]')
python3 - <<EOF
p0=int("$P0",16); p1=int("$P1",16); e0=int("$E0",16); e1=int("$E1",16)
dp=p1-p0; de=e1-e0
if dp>0:
  print(f"  packets={dp}  errors={de}  BER legacy={100*de/(dp*2240):.4f}%  true(/120)={100*de/(dp*120):.4f}%")
else:
  print(f"  no packets received (chain not locked)")
EOF

# Switch to cable + run 30s
echo ""
echo "=== CABLE 30s ($NAME) ==="
/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000114 32 1' >/dev/null
sleep 5  # settle
P0=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000104 32' | tr -d '[:space:]')
E0=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000108 32' | tr -d '[:space:]')
sleep 30
P1=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000104 32' | tr -d '[:space:]')
E1=$(/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000108 32' | tr -d '[:space:]')
python3 - <<EOF
p0=int("$P0",16); p1=int("$P1",16); e0=int("$E0",16); e1=int("$E1",16)
dp=p1-p0; de=e1-e0
if dp>0:
  print(f"  packets={dp}  errors={de}  BER legacy={100*de/(dp*2240):.4f}%  true(/120)={100*de/(dp*120):.4f}%")
else:
  print(f"  no packets received (chain not locked)")
EOF

# Restore internal
/tmp/ssh_axi_snap.sh 'busybox devmem 0x9D000114 32 0' >/dev/null
