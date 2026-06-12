#!/bin/bash
# Host-side smoke test: daemon in -l loopback mode, two netns, ping across.
# Exercises the tun plumbing + netns topology with no hardware. Needs root.
set -e
cd "$(dirname "$0")"
[ "$(id -u)" = 0 ] || { echo "SKIP (needs root)"; exit 77; }
[ -x ./qpsk_tun ] || { echo "build qpsk_tun first"; exit 1; }

cleanup() {
    kill "$DPID" 2>/dev/null || true
    ip netns del qlA 2>/dev/null || true
    ip netns del qlB 2>/dev/null || true
}
trap cleanup EXIT

ip netns del qlA 2>/dev/null || true
ip netns del qlB 2>/dev/null || true

./qpsk_tun -l -i qloop0 -i qloop1 &
DPID=$!
for i in $(seq 50); do ip link show qloop0 >/dev/null 2>&1 && break; sleep 0.1; done
ip link show qloop1 >/dev/null

ip netns add qlA
ip netns add qlB
ip link set qloop0 netns qlA
ip link set qloop1 netns qlB
ip -n qlA addr add 10.99.0.1 peer 10.99.0.2 dev qloop0
ip -n qlB addr add 10.99.0.2 peer 10.99.0.1 dev qloop1
ip -n qlA link set qloop0 up mtu 268
ip -n qlB link set qloop1 up mtu 268
ip -n qlA link set lo up
ip -n qlB link set lo up

ip netns exec qlA ping -c 10 -i 0.2 -W 2 10.99.0.2 | tail -2
echo "LOOPBACK SMOKE PASS"
