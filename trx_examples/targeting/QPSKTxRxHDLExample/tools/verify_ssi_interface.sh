#!/bin/bash
# verify_ssi_interface.sh
#
# Verify the ADRV9002 <-> FPGA digital (SSI) interface bit-exactly, using the
# chip's Rx-SSI test-pattern generator and the deployed PRBS bitstream's
# checker + capture buffer (no rebuild). Two checks:
#   1. PRBS through SSI : chip Rx-SSI = PRBS15 -> FPGA PRBS-15 checker LOCKS with
#      0 bit errors (negative control: NORMAL -> no lock).
#   2. IQ data through SSI : chip Rx-SSI = RAMP_16_BIT -> FPGA capture buffer sees
#      a perfect +1 ramp on both I and Q (bit-exact 16-bit sample transfer).
#
# Serialization confirmed: MSB-first, PRBS-15 polynomial x^15 + x^14 + 1
# (the ADRV9002 SSI standard, matching the design's I-lane checker).
set -uo pipefail
HOST=root@10.0.0.146
printf '#!/bin/bash\necho analog\n' > /tmp/vssi_askpass.sh; chmod 700 /tmp/vssi_askpass.sh
export SSH_ASKPASS=/tmp/vssi_askpass.sh SSH_ASKPASS_REQUIRE=force DISPLAY=:0
SSHF="-o ConnectTimeout=10 -o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=accept-new"
ssh_board(){ setsid -w ssh $SSHF "$HOST" "$1" 2>&1 | grep -viE "warning|pseudo"; }

D=/sys/kernel/debug/iio/iio:device2
echo "=== [1] PRBS through SSI (chip Rx-SSI PRBS15 -> FPGA checker) ==="
ssh_board "echo 0 > $D/tx0_ssi_test_mode_loopback_en 2>/dev/null; echo 0 > $D/tx1_ssi_test_mode_loopback_en 2>/dev/null;
  echo TESTMODE_DATA_PRBS15 > $D/rx0_ssi_test_mode_data; echo 1 > $D/rx0_ssi_test_mode_configure;
  echo TESTMODE_DATA_PRBS15 > $D/rx1_ssi_test_mode_data; echo 1 > $D/rx1_ssi_test_mode_configure;
  busybox devmem 0x9D000100 32 0x1; busybox devmem 0x9D000100 32 0x0; sleep 2;
  L=\$(busybox devmem 0x9D000110 32); E=\$(busybox devmem 0x9D000108 32); S=\$(busybox devmem 0x9D000104 32);
  echo \"PRBS15: lock=\$L errI=\$E samples=\$S\";
  if [ \$((L & 1)) -eq 1 ] && [ \$((E)) -eq 0 ]; then echo 'PRBS THROUGH SSI: PASS (I locked, 0 errors)'; else echo 'PRBS THROUGH SSI: FAIL'; fi"
echo "    negative control (NORMAL -> expect no lock):"
ssh_board "echo TESTMODE_DATA_NORMAL > $D/rx0_ssi_test_mode_data; echo 1 > $D/rx0_ssi_test_mode_configure;
  busybox devmem 0x9D000100 32 0x1; busybox devmem 0x9D000100 32 0x0; sleep 1.5;
  L=\$(busybox devmem 0x9D000110 32); echo \"NORMAL: lock=\$L \$([ \$((L & 1)) -eq 0 ] && echo '(correctly NOT locked)' || echo '(UNEXPECTED lock)')\""

echo "=== [2] IQ data through SSI (chip Rx-SSI 16-bit ramp -> FPGA capture buffer) ==="
ssh_board "echo TESTMODE_DATA_RAMP_16_BIT > $D/rx0_ssi_test_mode_data; echo 1 > $D/rx0_ssi_test_mode_configure;
  echo TESTMODE_DATA_RAMP_16_BIT > $D/rx1_ssi_test_mode_data; echo 1 > $D/rx1_ssi_test_mode_configure; sleep 0.3;
  busybox devmem 0x9D000100 32 0x3; busybox devmem 0x9D000100 32 0x2; sleep 0.15;
  busybox devmem 0x9D000100 32 0xA; sleep 0.15; busybox devmem 0x9D000100 32 0x2;
  prevI=-1; prevQ=-1; okI=1; okQ=1;
  for i in \$(seq 0 31); do busybox devmem 0x9D000118 32 \$i >/dev/null;
    ai=\$(( \$(busybox devmem 0x9D000120 32) & 0xffff )); aq=\$(( \$(busybox devmem 0x9D000124 32) & 0xffff ));
    if [ \$prevI -ge 0 ]; then [ \$(( (prevI+1) & 0xffff )) -ne \$ai ] && okI=0; [ \$(( (prevQ+1) & 0xffff )) -ne \$aq ] && okQ=0; fi
    prevI=\$ai; prevQ=\$aq; done
  echo \"ramp I monotonic+1: \$okI   ramp Q monotonic+1: \$okQ\";
  if [ \$okI -eq 1 ] && [ \$okQ -eq 1 ]; then echo 'IQ DATA THROUGH SSI: PASS (I and Q ramps bit-exact +1)'; else echo 'IQ DATA THROUGH SSI: FAIL'; fi"

echo "=== restore NORMAL ==="
ssh_board "echo TESTMODE_DATA_NORMAL > $D/rx0_ssi_test_mode_data; echo 1 > $D/rx0_ssi_test_mode_configure;
  echo TESTMODE_DATA_NORMAL > $D/rx1_ssi_test_mode_data; echo 1 > $D/rx1_ssi_test_mode_configure;
  busybox devmem 0x9D000100 32 0x0"
rm -f /tmp/vssi_askpass.sh
