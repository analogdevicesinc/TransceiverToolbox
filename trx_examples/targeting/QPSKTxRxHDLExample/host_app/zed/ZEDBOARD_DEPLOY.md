# ZedBoard (ADRV9002) byte-DMA modem — hardware deployment

Brings up the QPSK byte-DMA composite modem on a **ZedBoard (Zynq-7000,
xc7z020) + ADRV9002 FMC** card. The FPGA design is the `adrv9002/zed` byte
reference design (`commit b01ba8d0`); the build-time-configurable host_app
(`commit 74e15b6c`) targets it with `BOARD=zed`.

## Hardware / image prerequisites
- ZedBoard + ADRV9002 (ADRV9002 evaluation card on the FMC-LPC connector).
- An **ADI Kuiper Linux** SD image for ADRV9002/ZedBoard (provides kernel +
  rootfs + the base `zynq-zed-adrv9002` device tree with the `axi-adrv9001`
  + `adrv9002-phy` IIO nodes). The daemon needs `/dev/mem`, `/dev/net/tun`,
  native `gcc`, and the `iio_*` tools — all present in Kuiper.

## 1. Bitstream / BOOT.BIN  (builds locally — xc7z020 is WebPACK)
```
cd <kit>/zed_bytetx && ./run_zed_build.sh        # -> .../boot/BOOT.BIN (~4.5 MB)
```
`BOOT.BIN` = FSBL + `system_top.bit` + u-boot (Zynq-7000 `bootgen -arch zynq`).
Copy it to the SD card's **BOOT** (FAT) partition, replacing the stock one.

## 2. Device tree — reserved-memory  (REQUIRED)
The daemon mmaps the DMA-ring buffer at physical **0x1FF00000** (top 1 MB of
ZedBoard's 512 MB DDR). Linux must be told to keep out of it, or the mmap
corrupts kernel RAM. Add `qpsk_byte_buf.dtsi` (this dir) to the base board
`.dts` and recompile:
```
# in the kernel/dts source tree, in zynq-zed-adrv9002.dts add near the top:
#include "qpsk_byte_buf.dtsi"          # or paste the reserved-memory node
dtc -I dts -O dtb -o devicetree.dtb zynq-zed-adrv9002.dts   # then copy to BOOT/
```
A runtime **overlay won't work** here — the kernel reserves memory too early
in boot for a late overlay to take effect. It must be in the base `.dtb`.
(The node mirrors Jupiter's `qpsk_byte_buf@7ff00000`, in Zynq-7000 single-cell
form: `reg = <0x1ff00000 0x00100000>; no-map;`.)

## 3. ADRV9002 SSI profile — HALF RATE  (REQUIRED)
The ZedBoard's -1 speed grade can't close timing at the full 15.36 MHz sample
rate, so the design was timing-closed at **10 MHz** by halving the SSI DCLK
(`cmos_constr.xdc`: `rx*/tx*_dclk_out` 12.5 ns -> 25 ns = 80 -> 40 MHz, giving
`adc_clk_div_s` = 10 MHz). **The ADRV9002 MUST be run with a matching half-rate
profile (7.68 MHz sample rate / 40 MHz LVDS DCLK).** Generate it with ADI's
Transceiver Evaluation Software (TES) — take the stock ADRV9002 profile and
halve the sample rate — and load it via the driver's profile/stream path. A
full-rate profile would drive the SSI at 80 MHz DCLK and violate timing on the
fabric (the modem would not decode).

## 4. host_app — build on the board with BOARD=zed
```
scp -r host_app root@<zed-ip>:/root/      # or via the SD rootfs
ssh root@<zed-ip> 'cd /root/host_app && make BOARD=zed'
```
`BOARD=zed` bakes the Zynq-7000 addresses (regs 0x43C..., buffer 0x1FF00000)
from `qpsk_hw.h`. Builds `qpsk_tun` + `qpsk_capture`.

## 5. Bring up the modem network
```
# on the ZedBoard, with the ADRV9002 half-rate profile loaded + RF/cable connected:
cd /root/host_app
QPSK_BOARD=zed ./qpsk_net_setup.sh up cable     # modem regs at 0x43C00000, daemon @0x43C1/2/3
ip netns exec nsA ping 10.66.0.2                # single-board loopback over the radio
```
`QPSK_BOARD=zed` points `qpsk_net_setup.sh` at the 0x43C00000 modem base
(matching how `qpsk_tun` was compiled).

## 6. Two-radio link (ZedBoard Tx -> Jupiter Rx)
The composite Tx waveform is bit-identical to what the Jupiter Rx expects
(same model), so the radios are PHY-compatible — **with one caveat: the sample
rates must match.** The ZedBoard runs at **7.68 MHz** (half rate, per step 3),
so the Jupiter must run a 7.68 MHz profile too for the link (its default is
15.36 MHz). Either run both at 7.68 MHz, or, if a faster ZedBoard speed grade
or pipelining of the preamble-detector MAC is done later, run both at 15.36.

## Quick checklist
| Artifact | Source | On SD card |
|---|---|---|
| BOOT.BIN | `run_zed_build.sh` | BOOT/ (replace) |
| devicetree.dtb | base dts + `qpsk_byte_buf.dtsi` | BOOT/ |
| ADRV9002 half-rate profile | ADI TES (7.68 MHz) | rootfs / loaded at runtime |
| host_app (`BOARD=zed`) | `make BOARD=zed` on target | rootfs |
| kernel + rootfs | ADI Kuiper (ADRV9002) | as-is |
