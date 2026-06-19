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

## 2b. Device tree — DISABLE THE AUDIO  (REQUIRED, or no RF)
The ZedBoard base design's I2S/SPDIF audio uses the **PS DMA (pl330)**; in this
composite bitstream that audio DMA faults continuously
(`dma-pl330 f8003000 Reset Channel CS-f FTC-20000`), which halts the pl330 and
**starves the PS-SPI path to the ADRV9002 → "Failed to reset device and set SPI
Config" → no RF on ~39/40 boots.** Stock has 0 such faults. Disable the audio
nodes in `devicetree.dtb` and the ADRV9002 inits reliably every boot:
```
fdtput -t s devicetree.dtb /fpga-axi@0/spdif@75c00000 status disabled
fdtput -t s devicetree.dtb /fpga-axi@0/i2s@77600000   status disabled
fdtput -t s devicetree.dtb /adv7511_hdmi_snd          status disabled
fdtput -t s devicetree.dtb /zed_sound                 status disabled
```
(Proper long-term fix = remove/repair the I2S/SPDIF audio peripheral in the zed
composite BD so it doesn't fault the PS-DMA; the DT-disable is the rebuild-free
fix. This is unrelated to the cold-boot hang fixed in step 3-equivalent.)

## 3. ADRV9002 SSI profile — FULL RATE 15.36 MHz  (stock profile)
The design now **closes timing at the full 15.36 MHz** sample rate on the slow
xc7z020-**1** fabric, so **the stock ADRV9002 profile is used — no half-rate
profile needed.** This was the limiter historically: the 12-cascaded-DSP48
preamble-detector/CFC path failed at -1.354 ns at full rate. The fix, applied
in `build_variant_zed.m` Phase 2c, is three layers:
1. HDL Coder **AdaptivePipelining** on the model (delay-balanced, functionally
   equivalent — verified 0% BER on Jupiter HW) → -0.836 ns.
2. Targeted **`OutputPipeline=2` on the `REP_TxI`/`REP_TxQ`** interp-FIR blocks
   (the feedforward Tx-upsampler that is the actual worst path; global
   distributed pipelining missed it and made things worse) → the big lever.
3. Vivado last-mile closure via **`ADI_PERF_TIMING=1`** (`adi_build.tcl`, commit
   `154d608c`): synth retiming + Explore/AggressiveExplore + pre/post-route
   phys_opt, which pulls the pipeline registers into the DSP cascade.

Result: **post-route WNS = +0.458 ns, WHS = +0.010 ns, timing met**, bitstream
generated. Utilization fits: LUT 77.97 %, FF 57.89 %, DSP 82.27 %, BRAM 15 %.
`cmos_constr.xdc` is at the full-rate DCLK (12.5 ns / 80 MHz → `adc_clk_div_s`
20 MHz / 15.36 MHz sample rate). Run `run_zed_build.sh` (it exports
`ADI_PERF_TIMING=1`) to reproduce.

## 4. host_app — build on the board with BOARD=zed
```
scp -r host_app root@<zed-ip>:/root/      # or via the SD rootfs
ssh root@<zed-ip> 'cd /root/host_app && make BOARD=zed'
```
`BOARD=zed` bakes the Zynq-7000 addresses (regs 0x43C..., buffer 0x1FF00000)
from `qpsk_hw.h`. Builds `qpsk_tun` + `qpsk_capture`.

## 5. Bring up the modem network
```
# on the ZedBoard, with the stock ADRV9002 (15.36 MHz) profile + RF/cable connected:
cd /root/host_app
QPSK_BOARD=zed ./qpsk_net_setup.sh up cable     # modem regs at 0x43C00000, daemon @0x43C1/2/3
ip netns exec nsA ping 10.66.0.2                # single-board loopback over the radio
```
`QPSK_BOARD=zed` points `qpsk_net_setup.sh` at the 0x43C00000 modem base
(matching how `qpsk_tun` was compiled).

## 6. Two-radio link (ZedBoard Tx -> Jupiter Rx)
The composite Tx waveform is bit-identical to what the Jupiter Rx expects
(same model), so the radios are PHY-compatible. With the preamble-detector MAC
now pipelined for full rate (step 3), **the ZedBoard and Jupiter both run the
stock 15.36 MHz profile** — they interoperate directly, no rate matching or
custom profile required.

## Quick checklist
| Artifact | Source | On SD card |
|---|---|---|
| BOOT.BIN | `run_zed_build.sh` | BOOT/ (replace) |
| devicetree.dtb | base dts + `qpsk_byte_buf.dtsi` | BOOT/ |
| ADRV9002 profile | stock full-rate 15.36 MHz (no custom profile) | rootfs / driver default |
| host_app (`BOARD=zed`) | `make BOARD=zed` on target | rootfs |
| kernel + rootfs | ADI Kuiper (ADRV9002) | as-is |
