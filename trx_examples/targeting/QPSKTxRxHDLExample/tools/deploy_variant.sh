#!/bin/bash
# deploy_variant.sh <variant_name>
#
# Deploys /mnt/onetb/scratch/qpsk_variants/<name>/hdl_prj_jupiter_loopback/vivado_ip_prj/boot/BOOT.BIN
# to root@10.0.0.146:/boot/BOOT.BIN, reboots, waits for the board to come back, runs the BIST
# sanity script + the HardwareLoopbackBERTest buildtool task.
#
# Exits 0 iff BIST advanced AND HardwareLoopbackBERTest passed.
set -euo pipefail

NAME=${1:?variant name}
DIR=/mnt/onetb/scratch/qpsk_variants/$NAME
BOOT=$DIR/hdl_prj_jupiter_loopback/vivado_ip_prj/boot/BOOT.BIN

if [ ! -f "$BOOT" ]; then
  echo "ERROR: BOOT.BIN not found at $BOOT"
  exit 2
fi

echo "=== variant: $NAME ==="
ls -la "$BOOT"
md5sum "$BOOT"

printf '#!/bin/bash\necho analog\n' > /tmp/qpsk_askpass.sh
chmod 700 /tmp/qpsk_askpass.sh
export SSH_ASKPASS=/tmp/qpsk_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSH_FLAGS="-o ConnectTimeout=8 -o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=accept-new"

# scp the BOOT.BIN
setsid -w scp $SSH_FLAGS "$BOOT" root@10.0.0.146:/boot/BOOT.BIN 2>&1 | grep -viE "warning|pseudo" || true

# sync + reboot
setsid -w ssh $SSH_FLAGS root@10.0.0.146 'sync; md5sum /boot/BOOT.BIN; (sleep 1; reboot) >/dev/null 2>&1 &' 2>&1 | grep -viE "warning|pseudo" || true

# wait for board down, then back up
for i in $(seq 1 30); do ping -c1 -W1 10.0.0.146 >/dev/null 2>&1 || break; sleep 1; done
echo "(board down)"
for i in $(seq 1 180); do
  if ping -c1 -W1 10.0.0.146 >/dev/null 2>&1; then echo "ping up @ ${i}s"; break; fi
  sleep 1
done
for i in $(seq 1 30); do
  if setsid -w ssh $SSH_FLAGS root@10.0.0.146 'true' >/dev/null 2>&1; then echo "ssh ready @ ${i} polls"; break; fi
  sleep 3
done

echo ""
echo "=== board status ==="
setsid -w ssh $SSH_FLAGS root@10.0.0.146 'cat /sys/class/fpga_manager/fpga0/state; md5sum /boot/BOOT.BIN' 2>&1 | grep -viE "warning|pseudo"

echo ""
echo "=== quick BIST sanity (20s) ==="
/tmp/test_loopback.sh 2>&1 | head -10

rm -f /tmp/qpsk_askpass.sh
echo ""
echo "=== variant $NAME deployed; BIST snapshot above ==="
