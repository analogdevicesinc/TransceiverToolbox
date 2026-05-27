#!/bin/bash
# deploy_composite_alpha.sh
#
# Deploys the composite-α BOOT.BIN (first TxRxComposite Tx+Rx-in-one-DUT
# bitstream) to root@10.0.0.146, reboots, reads BIST snapshot, and tries
# both rx_input_select=0 (internal Tx-loopback) and =1 (cable from DAC to
# ADC) to compare BER between paths.
set -euo pipefail

BOOT=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl_prj_jupiter_composite/vivado_ip_prj/boot/BOOT.BIN
[ -f "$BOOT" ] || { echo "ERROR: $BOOT missing"; exit 2; }

echo "=== composite-α BOOT.BIN ==="
ls -la "$BOOT"; md5sum "$BOOT"

# SSH password automation
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
echo "=== AXI register defaults at boot ==="
$SSH 'echo "count=$((`busybox devmem 0x9D000100 32`)) packets=$((`busybox devmem 0x9D000104 32`)) bit_errors=$((`busybox devmem 0x9D000108 32`))"
echo "iq_debug_mux=$((`busybox devmem 0x9D00010C 32`)) rstCS=$((`busybox devmem 0x9D000110 32`)) rx_input_select=$((`busybox devmem 0x9D000114 32`))"' 2>&1 | grep -viE "warning|pseudo"

# --- TEST 1: default rx_input_select (whatever it is after boot, almost certainly 0 = internal Tx-loopback) ---
echo ""
echo "=== TEST 1: BIST over 20s with default rx_input_select ==="
$SSH 'pv=0; pe=0; for t in 0 5 10 15 20; do
  p=$((`busybox devmem 0x9D000104 32`)); e=$((`busybox devmem 0x9D000108 32`))
  [ $p -gt 0 ] && r=$(awk -v e=$e -v p=$p "BEGIN{printf \"%.3f\", 100.0*e/(p*2240)}") || r=0
  printf "  t=%2ds packets=%-10d (+%d) bit_errors=%-10d (+%d) BER=%s%%\n" $t $p $((p-pv)) $e $((e-pe)) $r
  pv=$p; pe=$e; sleep 5
done' 2>&1 | grep -viE "warning|pseudo"

# --- TEST 2: switch to rx_input_select=1 (external ADC path, cable loopback) ---
echo ""
echo "=== TEST 2: set rx_input_select=1 (external ADC, cable loopback) ==="
$SSH 'busybox devmem 0x9D000114 32 1; echo "rx_input_select=$((`busybox devmem 0x9D000114 32`))"' 2>&1 | grep -viE "warning|pseudo"
echo "(settle 3s)"; sleep 3
$SSH 'pv=$((`busybox devmem 0x9D000104 32`)); pe=$((`busybox devmem 0x9D000108 32`)); for t in 0 5 10 15 20; do
  p=$((`busybox devmem 0x9D000104 32`)); e=$((`busybox devmem 0x9D000108 32`))
  dp=$((p-pv)); de=$((e-pe))
  [ $dp -gt 0 ] && r=$(awk -v e=$de -v p=$dp "BEGIN{printf \"%.3f\", 100.0*e/(p*2240)}") || r=N/A
  printf "  t=%2ds packets+=%-8d bit_errors+=%-8d delta-BER=%s%%\n" $t $dp $de $r
  pv=$p; pe=$e; sleep 5
done' 2>&1 | grep -viE "warning|pseudo"

# --- TEST 3: back to rx_input_select=0 (internal Tx-loopback regression) ---
echo ""
echo "=== TEST 3: set rx_input_select=0 (internal Tx-loopback regression) ==="
$SSH 'busybox devmem 0x9D000114 32 0; echo "rx_input_select=$((`busybox devmem 0x9D000114 32`))"' 2>&1 | grep -viE "warning|pseudo"
echo "(settle 3s)"; sleep 3
$SSH 'pv=$((`busybox devmem 0x9D000104 32`)); pe=$((`busybox devmem 0x9D000108 32`)); for t in 0 5 10 15 20; do
  p=$((`busybox devmem 0x9D000104 32`)); e=$((`busybox devmem 0x9D000108 32`))
  dp=$((p-pv)); de=$((e-pe))
  [ $dp -gt 0 ] && r=$(awk -v e=$de -v p=$dp "BEGIN{printf \"%.3f\", 100.0*e/(p*2240)}") || r=N/A
  printf "  t=%2ds packets+=%-8d bit_errors+=%-8d delta-BER=%s%%\n" $t $dp $de $r
  pv=$p; pe=$e; sleep 5
done' 2>&1 | grep -viE "warning|pseudo"

rm -f /tmp/qpsk_askpass.sh

echo ""
echo "=== composite-α deploy + BIST snapshot complete ==="
