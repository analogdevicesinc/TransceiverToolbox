#!/bin/bash
# Test the deployed digital-loopback design: just read the BIST over time.
# No host transmit needed -- the FPGA internally generates QPSK (Tx subsystem)
# and decodes it (Rx subsystem). Clean digital path => bit_errors should be 0.
printf '#!/bin/bash\necho analog\n' > /tmp/qpsk_askpass.sh && chmod 700 /tmp/qpsk_askpass.sh
export SSH_ASKPASS=/tmp/qpsk_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSH="setsid -w ssh -o StrictHostKeyChecking=accept-new -o ConnectTimeout=10 -o NumberOfPasswordPrompts=1 root@10.0.0.146"

echo "=== current deployed BIST + iq_debug_mux + rstCS ==="
$SSH 'echo "count=$((`busybox devmem 0x9D000100 32`)) packets=$((`busybox devmem 0x9D000104 32`)) bit_errors=$((`busybox devmem 0x9D000108 32`))"; echo "iq_debug_mux=$((`busybox devmem 0x9D00010C 32`)) rstCS=$((`busybox devmem 0x9D000110 32`))"' 2>&1 | grep -viE "warning|pseudo"

echo "=== BIST over 20 s ==="
$SSH 'pv=0; pe=0; for t in 0 5 10 15 20; do
  p=$((`busybox devmem 0x9D000104 32`)); e=$((`busybox devmem 0x9D000108 32`))
  [ $p -gt 0 ] && r=$(awk -v e=$e -v p=$p "BEGIN{printf \"%.3f\", 100.0*e/(p*2240)}") || r=0
  printf "  t=%2ds packets=%-10d (+%d) bit_errors=%-10d (+%d) BER=%s%%\n" $t $p $((p-pv)) $e $((e-pe)) $r
  pv=$p; pe=$e; sleep 5
done' 2>&1 | grep -viE "warning|pseudo"

rm -f /tmp/qpsk_askpass.sh
