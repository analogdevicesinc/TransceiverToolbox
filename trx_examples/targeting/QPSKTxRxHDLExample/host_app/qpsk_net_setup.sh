#!/bin/bash
# qpsk_net_setup.sh -- board-side bring-up for the QPSK network interface.
#
# Subcommands:
#   regs [internal|cable]   program the modem for DMA-byte Tx (default cable)
#   up   [internal|cable]   regs + daemon + two-netns topology (nsA/nsB)
#   down                    kill daemon, delete namespaces
#
# Topology (single board): nsA{qpsk0 10.66.0.1, ret0 10.77.0.1} <-RF->
# nsB{qpsk1 10.66.0.2, ret1 10.77.0.2}. Forward traffic nsA->nsB rides the
# modem (daemon bridges qpsk0 -> Tx DMA -> RF -> Rx DMA -> qpsk1); the
# reverse direction is routed over ret0/ret1, a second qpsk_tun instance
# in -l loopback mode (this kernel has no CONFIG_VETH; an in-process tun
# bridge serves as the return link). rp_filter is disabled to allow the
# asymmetric paths.
#
# Register order is the proven recipe from ByteDmaRegisters.m: soft reset
# (clears the register file too) THEN the select writes THEN DMA start (the
# daemon performs its own engine resets when launched).
set -e
cd "$(dirname "$0")"

MODEM=0x9D000000
DEVMEM="busybox devmem"

# Enable the ADRV9002 front-end: Tx attenuation 0 dB + Rx AGC (echo-mode
# sweep 2026-06-12: 83% frame survival on cable, equal to internal --
# only the parked Tx artifact's episodes remain; -10 dB or manual Rx gain
# collapse the link). The cyclic all-zeros host buffer only keeps the Tx
# channel enabled (the in-FPGA Tx drives the DAC); the background Rx
# reader keeps the ADC streaming.
rf() {
    pkill -f iio_writedev 2>/dev/null || true
    pkill -f iio_readdev 2>/dev/null || true
    sleep 0.5
    iio_attr -q -o -c adrv9002-phy voltage0 hardwaregain 0
    iio_attr -q -i -c adrv9002-phy voltage0 gain_control_mode automatic
    dd if=/dev/zero of=/tmp/zeros.bin bs=16384 count=1 2>/dev/null
    nohup iio_writedev -c -b 4096 axi-adrv9002-tx-lpc voltage0 voltage1 \
        < /tmp/zeros.bin >/tmp/iio_tx.log 2>&1 &
    nohup iio_readdev -b 16384 axi-adrv9002-rx-lpc voltage0_i voltage0_q \
        >/dev/null 2>/tmp/iio_rx.log &
    sleep 2
    echo "rf armed (tx atten 0 dB, rx agc)"
}

regs() {
    local rxsel=1
    [ "$1" = internal ] && rxsel=0
    $DEVMEM $MODEM 32 1                 # soft reset strobe (regs revert to 0)
    sleep 0.1
    $DEVMEM $((MODEM + 0x11C)) 32 1     # tx_data_source = DMA bytes
    $DEVMEM $((MODEM + 0x118)) 32 0     # tx_source_select
    $DEVMEM $((MODEM + 0x114)) 32 $rxsel  # rx_input_select
    echo "regs set (rx_input_select=$rxsel)"
}

down() {
    pkill -f 'qpsk_tun -i qpsk0' 2>/dev/null || true
    pkill -f 'qpsk_tun -l -i ret0' 2>/dev/null || true
    pkill -f iio_writedev 2>/dev/null || true
    pkill -f iio_readdev 2>/dev/null || true
    sleep 0.3
    ip netns del nsA 2>/dev/null || true
    ip netns del nsB 2>/dev/null || true
    echo "down"
}

up() {
    down >/dev/null
    rf
    regs "$1"
    [ -x ./qpsk_tun ] || { echo "build qpsk_tun first"; exit 1; }

    nohup ./qpsk_tun -i qpsk0 -i qpsk1 -s 60 >/tmp/qpsk_tun.log 2>&1 &
    nohup ./qpsk_tun -l -i ret0 -i ret1 >/tmp/qpsk_ret.log 2>&1 &
    for i in $(seq 50); do
        ip link show qpsk0 >/dev/null 2>&1 && ip link show ret1 >/dev/null 2>&1 && break
        sleep 0.1
    done
    ip link show qpsk1 >/dev/null

    ip netns add nsA
    ip netns add nsB
    ip link set qpsk0 netns nsA
    ip link set qpsk1 netns nsB
    ip link set ret0 netns nsA
    ip link set ret1 netns nsB

    ip -n nsA addr add 10.66.0.1 peer 10.66.0.2 dev qpsk0
    ip -n nsB addr add 10.66.0.2 peer 10.66.0.1 dev qpsk1
    ip -n nsA addr add 10.77.0.1 peer 10.77.0.2 dev ret0
    ip -n nsB addr add 10.77.0.2 peer 10.77.0.1 dev ret1
    ip -n nsA link set qpsk0 up mtu 268
    ip -n nsB link set qpsk1 up mtu 268
    ip -n nsA link set ret0 up mtu 268
    ip -n nsB link set ret1 up mtu 268
    ip -n nsA link set lo up
    ip -n nsB link set lo up

    # forward nsA->10.66.0.2 rides RF (qpsk0 peer route, present already);
    # reverse nsB->10.66.0.1 returns over the ret pair, NOT qpsk1
    # rto_min: link RTT is ~5 ms; the default 200 ms RTO turns each
    # residual ARQ loss into a long stall (measured 0.98 vs 1.21 Mbit/s
    # short-run TCP). advmss keeps TCP segments inside one QPSK frame.
    ip -n nsB route replace 10.66.0.1 via 10.77.0.1 dev ret1 rto_min 25ms
    ip -n nsA route replace 10.66.0.2 dev qpsk0 advmss 200 rto_min 25ms
    ip netns exec nsA sysctl -qw net.ipv4.conf.all.rp_filter=0 \
        net.ipv4.conf.default.rp_filter=0 net.ipv4.conf.qpsk0.rp_filter=0 \
        net.ipv4.conf.ret0.rp_filter=0
    ip netns exec nsB sysctl -qw net.ipv4.conf.all.rp_filter=0 \
        net.ipv4.conf.default.rp_filter=0 net.ipv4.conf.qpsk1.rp_filter=0 \
        net.ipv4.conf.ret1.rp_filter=0
    echo "up (daemon log: /tmp/qpsk_tun.log)"
}

case "$1" in
    rf)   rf ;;
    regs) regs "$2" ;;
    up)   up "$2" ;;
    down) down ;;
    *)    echo "usage: $0 {rf|regs|up|down} [internal|cable]"; exit 2 ;;
esac
