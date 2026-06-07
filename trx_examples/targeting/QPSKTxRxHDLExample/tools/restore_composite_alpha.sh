#!/bin/bash
# restore_composite_alpha.sh - re-deploy the baseline composite-α BOOT.BIN
# (the one this branch built before any variant experiments).
set -eo pipefail
BOOT=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl_prj_jupiter_composite/vivado_ip_prj/boot/BOOT.BIN
[ -f "$BOOT" ] || { echo "ERROR: baseline BOOT.BIN missing at $BOOT"; exit 2; }
echo "=== restoring composite-α baseline ==="
ls -la "$BOOT"; md5sum "$BOOT"
printf '#!/bin/bash\necho analog\n' > /tmp/qpsk_askpass.sh
chmod 700 /tmp/qpsk_askpass.sh
export SSH_ASKPASS=/tmp/qpsk_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSHFLAGS="-o ConnectTimeout=8 -o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=accept-new"
setsid -w scp $SSHFLAGS "$BOOT" root@10.0.0.146:/boot/BOOT.BIN 2>&1 | grep -viE "warning|pseudo" || true
setsid -w ssh $SSHFLAGS root@10.0.0.146 'sync; (sleep 1; reboot) >/dev/null 2>&1 &' 2>&1 | grep -viE "warning|pseudo" || true
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
rm -f /tmp/qpsk_askpass.sh
echo "=== composite-α baseline restored ==="
