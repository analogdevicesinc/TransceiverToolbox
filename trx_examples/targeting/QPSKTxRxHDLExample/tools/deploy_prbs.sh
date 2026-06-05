#!/bin/bash
# deploy_prbs.sh
#
# Deploy the PRBS digital-loopback BOOT.BIN to the JUPITER board
# (root@10.0.0.146), backing up the current image first, then reboot and
# sanity-check the PRBS AXI registers (base 0x9D000100).
#
# Mirrors tools/deploy_composite_variant.sh but for hdl_prj_jupiter_prbs and
# with a board-side backup (/boot/BOOT.BIN.prev) so the previous image can be
# restored: ssh root@10.0.0.146 'cp /boot/BOOT.BIN.prev /boot/BOOT.BIN; reboot'
set -euo pipefail
HERE="$(cd "$(dirname "$0")/.." && pwd)"
BOOT="$HERE/hdl_prj_jupiter_prbs/vivado_ip_prj/boot/BOOT.BIN"
HOST=root@10.0.0.146

[ -f "$BOOT" ] || { echo "ERROR: $BOOT missing (run hdlworkflow_prbs first)"; exit 2; }

echo "=== deploying PRBS BOOT.BIN ==="
ls -la "$BOOT"; md5sum "$BOOT"

printf '#!/bin/bash\necho analog\n' > /tmp/prbs_askpass.sh
chmod 700 /tmp/prbs_askpass.sh
export SSH_ASKPASS=/tmp/prbs_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSHFLAGS="-o ConnectTimeout=8 -o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=accept-new"
SSH="setsid -w ssh $SSHFLAGS $HOST"

echo ""
echo "=== backup current /boot/BOOT.BIN -> /boot/BOOT.BIN.prev ==="
$SSH 'cp -n /boot/BOOT.BIN /boot/BOOT.BIN.prev 2>/dev/null; md5sum /boot/BOOT.BIN /boot/BOOT.BIN.prev 2>/dev/null' 2>&1 | grep -viE "warning|pseudo" || true

echo ""
echo "=== scp new BOOT.BIN ==="
setsid -w scp $SSHFLAGS "$BOOT" "$HOST:/boot/BOOT.BIN" 2>&1 | grep -viE "warning|pseudo" || true

echo ""
echo "=== sync + reboot ==="
$SSH 'sync; md5sum /boot/BOOT.BIN; (sleep 1; reboot) >/dev/null 2>&1 &' 2>&1 | grep -viE "warning|pseudo" || true

for i in $(seq 1 30); do ping -c1 -W1 10.0.0.146 >/dev/null 2>&1 || break; sleep 1; done
echo "(board down)"
for i in $(seq 1 180); do
  if ping -c1 -W1 10.0.0.146 >/dev/null 2>&1; then echo "ping up @ ${i}s"; break; fi
  sleep 1
done
for i in $(seq 1 40); do
  if $SSH 'true' >/dev/null 2>&1; then echo "ssh ready @ ${i} polls"; break; fi
  sleep 3
done

echo ""
echo "=== FPGA state + BOOT.BIN md5 on board ==="
$SSH 'cat /sys/class/fpga_manager/fpga0/state 2>/dev/null; md5sum /boot/BOOT.BIN' 2>&1 | grep -viE "warning|pseudo"

echo ""
echo "=== PRBS AXI registers at boot (base 0x9D000100) ==="
$SSH 'echo control=$(busybox devmem 0x9D000100 32) samples=$(busybox devmem 0x9D000104 32) errI=$(busybox devmem 0x9D000108 32);
echo errQ=$(busybox devmem 0x9D00010C 32) lock=$(busybox devmem 0x9D000110 32)' 2>&1 | grep -viE "warning|pseudo"

rm -f /tmp/prbs_askpass.sh
echo ""
echo "=== PRBS deploy complete ==="
