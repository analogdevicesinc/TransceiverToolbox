#!/bin/bash
# deploy_composite_variant.sh <variant_name>
#
# Deploy a /mnt/onetb/scratch/qpsk_variants/<name>/hdl_prj_jupiter_composite/
# .../boot/BOOT.BIN to root@10.0.0.146, reboot, sanity-check AXI state.
# Common wrapper for composite_internal_zero_BER / composite_postagc_capture.
set -euo pipefail
NAME=${1:?usage: $0 <variant_name>}
BOOT=/mnt/onetb/scratch/qpsk_variants/$NAME/hdl_prj_jupiter_composite/vivado_ip_prj/boot/BOOT.BIN

[ -f "$BOOT" ] || { echo "ERROR: $BOOT missing"; exit 2; }

echo "=== deploying variant: $NAME ==="
ls -la "$BOOT"; md5sum "$BOOT"

printf '#!/bin/bash\necho analog\n' > /tmp/qpsk_askpass.sh
chmod 700 /tmp/qpsk_askpass.sh
export SSH_ASKPASS=/tmp/qpsk_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSHFLAGS="-o ConnectTimeout=8 -o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=accept-new"

echo ""
echo "=== scp BOOT.BIN ==="
setsid -w scp $SSHFLAGS "$BOOT" root@10.0.0.146:/boot/BOOT.BIN 2>&1 | grep -viE "warning|pseudo" || true

echo ""
echo "=== sync + reboot ==="
setsid -w ssh $SSHFLAGS root@10.0.0.146 'sync; md5sum /boot/BOOT.BIN; (sleep 1; reboot) >/dev/null 2>&1 &' 2>&1 | grep -viE "warning|pseudo" || true

# wait for board down then up
for i in $(seq 1 30); do ping -c1 -W1 10.0.0.146 >/dev/null 2>&1 || break; sleep 1; done
echo "(board down)"
for i in $(seq 1 180); do
  if ping -c1 -W1 10.0.0.146 >/dev/null 2>&1; then echo "ping up @ ${i}s"; break; fi
  sleep 1
done
for i in $(seq 1 30); do
  if setsid -w ssh $SSHFLAGS root@10.0.0.146 'true' >/dev/null 2>&1; then echo "ssh ready @ ${i} polls"; break; fi
  sleep 3
done

SSH="setsid -w ssh $SSHFLAGS root@10.0.0.146"
echo ""
echo "=== FPGA state + BOOT.BIN md5 on board ==="
$SSH 'cat /sys/class/fpga_manager/fpga0/state; md5sum /boot/BOOT.BIN' 2>&1 | grep -viE "warning|pseudo"

echo ""
echo "=== AXI defaults at boot ==="
$SSH 'echo count=$(busybox devmem 0x9D000100 32) packets=$(busybox devmem 0x9D000104 32) errors=$(busybox devmem 0x9D000108 32);
echo iq_mux=$(busybox devmem 0x9D00010C 32) rstCS=$(busybox devmem 0x9D000110 32) rx_sel=$(busybox devmem 0x9D000114 32)' 2>&1 | grep -viE "warning|pseudo"

rm -f /tmp/qpsk_askpass.sh
echo ""
echo "=== $NAME deploy complete ==="
