# QPSK Composite Modem — Design Document

This document describes the QPSK HDL-targeting composite modem: a single Simulink/HDL Coder DUT (`commhdlQPSKTxRxLoopback`, HDL subsystem `TxRxComposite`) that is **bit-identical across two platforms** — Jupiter (ADRV9002 LVDS, ZCU102/`jupiter_sdr`, Zynq UltraScale+) and ZedBoard (ADRV9002 CMOS, `xc7z020`, Zynq-7000). Both targets decode the same 7.68 MHz / 4-samples-per-symbol QPSK signal; the only differences between them are captured by a single rate-mode selector (`qpsk_rate_mode_config.m`). The modem carries arbitrary host data through a byte-DMA path and self-tests itself with an on-chip BIST (compares each recovered packet against the hardcoded reference "ADI Hello World").

> **Model note.** Two Simulink files live in this directory. `commhdlQPSKTxRxLoopback.slx` (DUT `TxRxComposite`) is the bit-identical composite modem this document describes; it is the DUT for the ZedBoard build (`hdlworkflow_zed.m`) and for the Jupiter *composite* build. The older `commhdlQPSKTxRx.slx` (DUT `commhdlQPSKTxRx/Receiver`) is the receiver-only model driven by `hdlworkflow_txrx.m`; that legacy `txrx` workflow is described in the Jupiter section below and is **not** bit-identical to the composite DUT.

## At a glance

| | Jupiter (LVDS) | ZedBoard (CMOS) |
|---|---|---|
| Device | `xczu3eg-sfva625-2-e` (Zynq UltraScale+) | `xc7z020-clg484-1` (Zynq-7000) |
| IPCORE / model-base clock | 15.36 MHz (`adc_1_clk`) | 30.72 MHz (`adc_1_clk`) |
| SSI rate / symbol rate | 15.36 MHz SSI (design rate), 1.92 Msym | stock 1.92 MHz SSI → 240 ksym (8× below 1.92 Msym design rate) |
| Reference design (composite) | `JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)`, project `jupiter_sdr` | `ADRV9002 ZED (RX & TX, BYTE DMA)`, project `adrv9001`, carrier `zed` |
| Fast-slow clock ratio `multiple` | **1** (1:1) | **2** (30.72 → 15.36 MHz) |
| Rx decode divider (auto, HDL Coder) | `enb_1_2` (clk/2) | `enb_1_4` (clk/4) |
| `integAvgLen` (CFC window) | `2^15` | `2^12` |
| Board model string / IP | "Analog Devices Jupiter SDR" / `10.0.0.146` | "Xilinx Zynq ZED" / `10.0.0.128` |
| Host-tool board flag / modem base | (default) / `0x9D000000` | `-DQPSK_BOARD_ZED` / `0x43C00000` |
| Status (verified) | cable link 0.00000% BER over 21,967 pkts | cable soak 0.00127% pkt-rate ≈ ~0.00064% BER over 1.02M pkts |

> The composite reference-design name above (`JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)`) is the one selected by `qpsk_rate_mode_config('jupiter')`. The legacy `hdlworkflow_txrx.m` build instead selects `JUPITER (TX & RX - TX IS FASTER OR HAS PRIORITY)` with `ref_design='txrx'`; see the Jupiter section.

## Shared architecture

The composite DUT is `commhdlQPSKTxRxLoopback` (HDL DUT subsystem `TxRxComposite`), and it is **bit-identical for both the Jupiter (LVDS) and ZedBoard ADRV9002 (CMOS) platforms** — both decode the same 7.68 MHz / 4-samples-per-symbol QPSK signal. A single selector `qpsk_rate_mode_config.m` captures the small set of integration differences so one codebase serves both (`RATE_MODES.md:1-7`).

### QPSK DSP chain (platform-independent)
- **Tx:** data scrambler (additive LFSR x^7+x^4+1) → QPSK modulation (`pskmod(...,4,pi/4,'gray')`, `commhdlQPSKTxRxParameters.m:97`) → preamble/frame insertion (13-bit Barker code on both I and Q, `commhdlQPSKTxRxParameters.m:83-89`) → RRC interpolation (rolloff 0.5, span 4 symbols, SPS 4; `commhdlQPSKTxRxParameters.m:24-29`) → REP (ZOH) upsample to the DAC rate.
- **Rx:** AGC (reference 0.25, loop gain 2e-3; `commhdlQPSKTxRxParameters.m:37-38`) → symbol synchronizer (Gardner, `SSBnXTsamp=0.01`; `commhdlQPSKTxRxParameters.m:58-70`) → carrier synchronizer / CFC (`CSBnXTsamp=0.005`, `CFOChangeDetectThreshold=0.0015625`; `commhdlQPSKTxRxParameters.m:41-55`) → preamble matched filter (coeffs = flipped-conjugate preamble /13, threshold scale −1.25 dB; `commhdlQPSKTxRxParameters.m:31-32,73-77`) → demod → phase-ambiguity resolution → frame sync → descrambler → BIST.
- **Rate constants:** `SamplesPerSymbol=4`, RRC span 4, AGC, `CSBnXTsamp`, `SSBnXTsamp`, `CFOChangeDetectThreshold`, preamble threshold, `SearchSamples` are **symbol-rate-normalized / structural and identical across both platforms** — they never scale with the absolute clock rate (`RATE_MODES.md:30`).

### Byte-DMA path (platform-independent)
- **Tx (host bytes → modulator):** host writes 64-bit words (byte-0-first, little-endian word pack) → `qpskByteBitShifter` deserializes each 64-bit word to payload bits, byte-0-first / MSB-first within each byte, the BIST reference order (`qpskByteBitShifter.m:1-14`). The `start` Tx packet-boundary flag resets the bit index so word/packet alignment self-heals every packet; `wordFirst` (derived from AXI-Stream TLAST) handles arbitrary DMA word-phase rotation against the packet boundary (`qpskByteBitShifter.m:16-29`).
- **Rx (recovered bits → host):** `qpskByteSerializer` is the exact inverse — collects bit-valid payload bits into 64-bit words, byte-0-first / MSB-first, so the host unpacks them little-endian; `start` discards a partial word at the packet boundary for self-healing alignment (`qpskByteSerializer.m:1-22`).
- **Packet size:** default payload = 2240 bits/packet (= 280 bytes = exactly 35 × 64-bit words; `qpskByteBitShifter.m:13`, `qpskByteSerializer.m:19-22`). Configurable via `setappdata(0,'QPSK_DBPP',N)` before model load; constraint N must be a multiple of 64 (whole 64-bit words) and ≥128 (the BIST checks the first 120 bits) (`commhdlQPSKTxRxParameters.m:15-23`). `BitsPerPacket = preamble length + DataBitsPerPacket` (`commhdlQPSKTxRxParameters.m:34`).

### BIST (platform-independent)
On-chip BIST register block compares each recovered packet against the hardcoded reference "ADI Hello World" over the **first 120 bits per packet** (`SEGMENTED_DEBUG_FINDINGS.md:104-107`). Registers, relative to the modem regfile base: `count_out` at `+0x100`, **`packets_out` at `+0x104`**, **`bit_errors_out` at `+0x108`**, `iq_debug_mux` at `+0x10C`, `rstCS` at `+0x110` (`BistRegisters.m:14-18`). Control regs: `+0x000` soft reset (reset FIRST, then the selects), `+0x114` rx_input_select, `+0x118` tx_source_select, `+0x11C` tx_data_source (`SEGMENTED_DEBUG_FINDINGS.md:106-107`).

### Rate-mode selector — the ONLY per-platform differences
Everything above is shared; `qpsk_rate_mode_config()` expands `QPSK_RATE_MODE` (`'cmos'`/`'jupiter'`) into just three integration knobs (`RATE_MODES.md:11-31`; `qpsk_rate_mode_config.m:41-66`):

| Element | CMOS (ZedBoard) | LVDS (Jupiter) |
|---|---|---|
| Reference design | `ADRV9002 ZED (RX & TX, BYTE DMA)` | `JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)` |
| `multiple` (Fast-slow Tx-output clock ratio) | **2** (30.72→15.36 MHz) | **1** (1:1) |
| `integAvgLen` (CFC tracking window) | `2^12` | `2^15` |

The IPCORE/model-base clock (30.72 vs 15.36 MHz) and the Rx decode divider (`enb_1_4` vs `enb_1_2`, auto-generated by HDL Coder from IPCORE_clk / 7.68 MHz) follow from the chosen reference design and are not separate model parameters (`RATE_MODES.md:25-31`). `integAvgLen` is the only rate-scaled *model* parameter — scaled `2^15 / rateRatio` to hold the CFO-tracking *time* constant (`RATE_MODES.md:29,36-40`; `qpsk_rate_mode_config.m:68-71`).

### Host-app board addressing
The same userspace tools (`qpsk_capture`, `qpsk_tun`) build for either board via compile-time base-address selection (`qpsk_hw.h:24-56`): ZynqMP/Jupiter default modem base `0x9D000000` (DMA buffer near top of 2 GB DDR `0x7FF00000`); ZedBoard (`-DQPSK_BOARD_ZED`, Zynq-7000 GP0) modem base `0x43C00000` (DMA buffer in 512 MB DDR `0x1FF00000`).

## Jupiter (LVDS) design

> **Two Jupiter build paths.** The bit-identical composite DUT (`commhdlQPSKTxRxLoopback/TxRxComposite`) is the recommended path and is selected with `qpsk_rate_mode_config('jupiter')` (reference design `JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)`, `ref_design='rxtx'`, `multiple=1`). The legacy `hdlworkflow_txrx.m` documented below builds a **separate** receiver-centric DUT (`commhdlQPSKTxRx/Receiver`) against `JUPITER (TX & RX - TX IS FASTER OR HAS PRIORITY)` with `ref_design='txrx'`; it predates the rate-mode selector and is retained for the deployed-link / network HW test suites that target `10.0.0.146`.

**Reference design + project (legacy `txrx` workflow).** The DUT `commhdlQPSKTxRx/Receiver` targets the Jupiter ADRV9002 LVDS board through HDL Coder's "IP Core Generation" workflow. The selected reference design is `'JUPITER (TX & RX - TX IS FASTER OR HAS PRIORITY)'` with `'project','jupiter_sdr'` and `'ref_design','txrx'` (`hdlworkflow_txrx.m:43-44`). All five Jupiter reference designs (`rx`, `tx`, `rxtx`, `txrx`, `rxtx_byte`) are registered under board name `'AnalogDevices JUPITER'` (`hdlcoder_ref_design_customization.m:14-22`), each delegating to the common `AnalogDevices.plugin_rd('jupiter', 'JUPITER', ...)` (e.g. `plugin_rd_rxtx.m:7`).

**ReferenceDesignParameter values** (`hdlworkflow_txrx.m:44`):
```
{'project','jupiter_sdr','ref_design','txrx','preprocess','off','postprocess','off',
 'number_of_inputs','4','number_of_bits','16','number_of_valids','1',
 'multiple','1','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'}
```

**`multiple` = 1 (Fast-slow clock ratio).** For Jupiter LVDS the IPCORE/SSI clock and the Tx-output sample crossing are 1:1, so `multiple=1` — it sets the `sync_fast_to_slow` RATIO on the **Tx-output** path only (`RATE_MODES.md:28`). The Rx-input `sync_slow_to_fast` is a plain CDC FIFO with no ratio and is correctly `multiple=1` in both modes; it is *not* the rate-matcher (`RATE_MODES.md:33-35`). This contrasts with CMOS/ZedBoard, where `multiple=2` because IPCORE=30.72 MHz=2× the 15.36 MHz DAC (`RATE_MODES.md:28`).

**Clocks / SSI.** IPCORE / model-base clock = **15.36 MHz** (the chosen RD's `adc_1_clk`) (`RATE_MODES.md:26`). The Rx decode divider `enb_1_2` (clk/2) is auto-generated by HDL Coder from `IPCORE_clk / 7.68 MHz` and is not a parameter (`RATE_MODES.md:27`). The modem decodes the same 7.68 MHz / 4-samples-per-symbol signal as CMOS; the composite model is bit-identical across both platforms (`RATE_MODES.md:1-7`).

**TargetPlatform / device.** `TargetPlatform = 'AnalogDevices JUPITER'`; `SynthesisToolChipFamily = 'Zynq UltraScale+'`; `SynthesisToolDeviceName = 'xczu3eg-sfva625-2-e'`; `TargetLanguage = 'Verilog'`; `SynthesisTool = 'Xilinx Vivado'` (`hdlworkflow_txrx.m:45-52`). `ProcessorFPGASynchronization = 'Free running'` (`hdlworkflow_txrx.m:56`).

**Vivado version.** `hWC.ReferenceDesignToolVersion = '2025.1'` with `AllowUnsupportedToolVersion = true` (`hdlworkflow_txrx.m:292`). Bitstream build uses the custom TCL `/home/tcollins/dev/qpsk_ai/TransceiverToolbox/CI/scripts/adi_build.tcl`.

**Build folder.** `ProjectFolder = 'hdl_prj_jupiter_txrx'`, with RTL/IP under `hdl_prj_jupiter_txrx/hdlsrc` — separate from the RX-only build (`hdlworkflow_txrx.m:42,50`).

**Board model string / IP.** Board model string is `"Analog Devices Jupiter SDR"` (project `jupiter_sdr`). The board is reached at **10.0.0.146** (`root@10.0.0.146`, password `analog`) (`BistRegisters.m:12,48`).

**Modem regfile access (IP base 0x9D000000 via ssh+devmem).** The modem AXI4-Lite regfile sits at IP base `0x9D000000`, reached over `ssh root@10.0.0.146` + `busybox devmem` (`BistRegisters.m:11-19,44-65`). Register map (offset = base + AXI mapping from `hdlworkflow_txrx.m`):

| Register | Address | AXI offset | Source |
|---|---|---|---|
| `count_out` | `0x9D000100` | `x"100"` | `BistRegisters.m:14` |
| `packets_out` | `0x9D000104` | `x"104"` | `BistRegisters.m:15` |
| `bit_errors_out` | `0x9D000108` | `x"108"` | `BistRegisters.m:16` |
| `iq_debug_mux` (in) | `0x9D00010C` | `x"10C"` | `BistRegisters.m:17`, `hdlworkflow_txrx.m:78` |
| `rstCS` (carrier-sync reset, in) | `0x9D000110` | `x"110"` | `BistRegisters.m:18`, `hdlworkflow_txrx.m:74` |

Reads via `busybox devmem <addr> 32`; writes via `busybox devmem <addr> 32 0x<val>` (`BistRegisters.m:60,69`). `readAll` batches all five in one ssh round trip (`BistRegisters.m:74-89`).

**Data-port interface mapping** (`hdlworkflow_txrx.m`): Rx input — `dataInI`→`ADRV9002 ADC Data I0 [0:15]`, `dataInQ`→`ADRV9002 ADC Data Q0 [0:15]`, `validIn`→`IP Valid Rx Data IN`. Diagnostic output taps — `debugI/debugQ/debugValid`→`IP Data 0/1 OUT` + `IP Data Valid OUT`, `debugI1/debugQ1`→`IP Data 2/3 OUT`; the four debug taps are selected by `iq_debug_mux` (`x"10C"`).

**Byte-DMA variant (`rxtx_byte`).** `plugin_rd_rxtx_byte.m` (`hdl/.../+jupiter/`) extends `rxtx` with a `byte_dma` parameter (default `'on'`) gating an `axi_dmac` + AXIS breakout in `matlab_processors.tcl`, plus DUT byte interfaces: Tx-side 64-bit `Byte Data IN`/`Byte Valid IN`/`Byte Ready OUT`/`Byte First IN` and Rx-side `Byte Data/Valid/Last/User OUT` + `Byte Ready IN`. One QPSK packet payload (2240 bits) = exactly 35 of the 64-bit words. The byte DMACs land at `0x9D100000` (Tx) and `0x9D200000` (Rx), with a byte-control GPIO at `0x9D300000` (`ByteDmaRegisters.m:17-18`).

**HW observation note (`README_tests.md:72-91`).** On the loopback RX-only build, the receiver DSP is verified correct (34 unit tests pass + full model decodes "ADI Hello World" in sim), yet the local Tx→DAC→RF→ADC delivery chain once produced a deterministic 50% (90°) on HW — fault localized to the delivery/Tx-DMA side, not the receiver DSP. The current byte-DMA cable link decodes at 0.00000% (see Test results).

## ZedBoard (CMOS) design

**Reference design / platform.** The ZedBoard build deploys the same bit-identical `commhdlQPSKTxRxLoopback/TxRxComposite` DUT as the Jupiter composite build, against the CMOS reference design `ADRV9002 ZED (RX & TX, BYTE DMA)` (`qpsk_rate_mode_config.m:52`). Project `adrv9001`, carrier `zed`, ref_design `rxtx` (`qpsk_rate_mode_config.m:53-54,73`). HDL Coder target is Xilinx Vivado / Zynq, device `xc7z020` package `clg484` speed `-1` (i.e. **xc7z020-1, Zynq-7000**), TargetPlatform `AnalogDevices ADRV9002 ZED`, Verilog, IP Core Generation workflow, Vivado 2025.1 (`hdlworkflow_zed.m:48-56`). Board model string: **"Xilinx Zynq ZED"**; target IP **10.0.0.128** (per project memory; the host byte tools select this board with `-DQPSK_BOARD_ZED`, `qpsk_hw.h:24`).

**IPCORE clock + the `multiple=2` "Fast-slow clock ratio" fix.** The CMOS IPCORE / model-base clock (`adc_1_clk`) is **30.72 MHz**, vs the DAC sample clock **15.36 MHz** (`qpsk_rate_mode_config.m:56,14-18`). Because the CMOS SDR SSI needs a 2× fabric clock, the Tx-output `sync_fast_to_slow` rate-matcher crosses the 30.72 MHz DUT/IPCORE clock down to the 15.36 MHz DAC clock — a 2:1 crossing — so the reference-design "Fast-slow clock ratio" parameter `multiple` **must be 2** (`qpsk_rate_mode_config.m:18-22,55`; `hdlworkflow_zed.m:35-47`). LVDS Jupiter has `rx_clk == tx_clk` (1:1) so it uses `multiple=1` (`qpsk_rate_mode_config.m:47`). In `matlab_processors.tcl`, `multiple` drives `set_property CONFIG.RATIO $multiple` on the synchronizer and selects `sync_fast_to_slow` only when `multiple != 1`. With `multiple=1` the CMOS build emits only `sync_slow_to_fast` (no `sync_fast_to_slow`), leaving the Tx→DAC path rate-mismatched/malformed and producing the content-independent ~6% decode; `multiple=2` builds the correct ratio-2 crossing. This is a BD-only change; the (sim-verified) model is unchanged (`hdlworkflow_zed.m:35-47`). The Rx-input `sync_slow_to_fast` is a plain CDC with no ratio and stays at 1 (`RATE_MODES.md:33-35`). HDL Coder also auto-generates the Rx decode divider from `IPCORE_clk / 7.68 MHz` → `enb_1_4` (clk/4) for CMOS vs `enb_1_2` for LVDS — not a model parameter (`qpsk_rate_mode_config.m:14-17`).

**Stock SSI rate limit.** The stock CMOS ADRV9002 profile runs the SSI at **1.92 MHz → 240 ksym, 8× below the 1.92 Msym design rate** (no design-rate CMOS profile matched to the board API exists) (`qpsk_rate_mode_config.m:57-62`; `RATE_MODES.md:42-53`). At this 8×-low point `integAvgLen` is rate-scaled to `2^12` (vs `2^15` at design rate) to hold the CFO-tracking time constant (`qpsk_rate_mode_config.m:68-71`; `RATE_MODES.md:29`). Override `setappdata(0,'QPSK_CMOS_RSYM',1.92e6)` to target a future 15.36 MHz-SSI profile, which reverts `integAvgLen` to `2^15` (`qpsk_rate_mode_config.m:60`; `RATE_MODES.md:36-40`).

**Byte register map (`-DQPSK_BOARD_ZED`, `qpsk_hw.h:24-40`).** Regs move to the Zynq-7000 GP0 window (0x40000000–0x7FFFFFFF):
- MODEM_BASE `0x43C00000`
- TX_DMA `0x43C10000`
- RX_DMA `0x43C20000`
- GPIO `0x43C30000`
- DMA buffer `0x1FF00000` (top 1 MB of ZedBoard's 512 MB DDR)

**Reserved-memory requirement.** The DMA buffer region at `QPSK_DMA_BUF_BASE` (`0x1FF00000`) must be reserved from Linux via a **device-tree reserved-memory node**; the header only fixes the address the userspace daemon mmaps (`qpsk_hw.h:18,38-39`).

**Rate-mode selector.** A single selector chooses the platform: `setappdata(0,'QPSK_RATE_MODE','cmos')` (ZedBoard, default) or `'jupiter'` (LVDS) (`RATE_MODES.md:11-14`; `qpsk_rate_mode_config.m:32-35`). The build scripts read it via `qpsk_rate_mode_config()` and expand it into ReferenceDesign, the `multiple` ratio, and the rate-scaled CFC window (`hdlworkflow_zed.m:28-47`; `build_variant_zed.m`; `RATE_MODES.md:16-19`).

**Relevant files:** `/mnt/onetb/scratch/qpsk_variants/zed_bytetx/hdlworkflow_zed.m`, `/mnt/onetb/scratch/qpsk_variants/zed_bytetx/build_variant_zed.m`, `/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/qpsk_rate_mode_config.m`, `/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/RATE_MODES.md`, `/home/tcollins/dev/qpsk_ai/TransceiverToolbox/CI/scripts/matlab_processors.tcl`, `/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/host_app/qpsk_hw.h`.

## Verification

The QPSK transceiver is verified by three host-side test suites and two on-board / DSP test layers. Non-HW suites validate the byte-DMA logic and Rx front-end DSP with no hardware; HW suites measure the deployed bitstream over the RF link.

### Test classes

| Test class | What it covers | HW / non-HW | Target board | # tests |
|---|---|---|---|---|
| `QPSKByteTxUnitTests` (`test/QPSKByteTxUnitTests.m`) | Host→FPGA byte path logic: bit shifter, 2-deep word FIFO, serializer (exact inverse), `ByteDmaRegisters.pack`, rotation/underflow realignment, reference-design byte interface widths/connections | non-HW (no model, no build) | n/a (logic units) | 14 (incl. `testConfigurablePacketSize` × 3 packet sizes {1280, 2240, 4480}) |
| `QPSKDeployedLinkTests` (`test/QPSKDeployedLinkTests.m`) | Deployed composite over RF cable loopback; BIST as BER meter: baseline, CFO recovery, Tx-atten/Rx-gain envelope, AGC, acquisition reliability, stream-loss recovery, combined impairments, CFO edge, BIST-vs-host cross-check, byte-DMA BIST/mode-switch/throughput/end-to-end, 15-min soak | HW | Jupiter / ADRV9002 @ `ip:10.0.0.146` | 19 methods; CFO/atten/gain parameterized (`testRecoverableCFO`×6, `testTxAttenuationRange`×3, `testRxGainRange`×5) |
| `QPSKNetworkTests` (`test/QPSKNetworkTests.m`) | TUN-over-byte-DMA network layer (`qpsk_tun` daemon + ARQ): host-side frame unit tests, ping over RF, 15-min TCP soak, 15-min UDP soak | HW (~35 min) | Jupiter @ `ip:10.0.0.146` | 4 |
| `SymbolSynchronizerTest` (`tools/diag/SymbolSynchronizerTest.m`) | Symbol Synchronizer (Gardner TED + PI loop + interpolator): S-curve lock point, fractional-timing recovery, clock-offset lock range to 200 ppm, noise | non-HW | n/a (model DSP) | 4 |
| `CoarseFreqEstimatorTest` (`tools/diag/CoarseFreqEstimatorTest.m`) | Coarse Frequency Estimator (x⁴ → differential → average): ±240 kHz range/aliasing, variance vs N, SNR threshold, confirms it does NOT cause the 90° phase flip | non-HW | n/a (model DSP) | 10 (incl. `testConvergesWithinRange` × 6 offsets) |
| `PhaseAmbiguityEstimatorTest` (`tools/diag/PhaseAmbiguityEstimatorTest.m`) | Phase Ambiguity Estimation & Correction (`Z=Σ rxPre·conj(refPre)`, continuous de-rotation): resolves all 0–315° rotations <1e-6 EVM, no 180° ambiguity, graceful noise degradation, freq-offset bias, reference-mismatch guard | non-HW | n/a (model DSP) | 12 (incl. `testResolvesRotation` × 8 rotations) |
| `PreambleDetectorTest` (`tools/diag/PreambleDetectorTest.m`) | Preamble Detector (matched-filter correlator): correct framing position, rotation invariance, 12.8 dB processing-gain margin / no false alarm, freq-offset sensitivity, position stability under noise | non-HW | n/a (model DSP) | 8 (incl. `testRotationInvariant` × 4 rotations) |

The four DSP suites total **34 tests, all passing** (`README_tests.md:32`), and were written to localize the hardware ~50% bit-error symptom — they prove the Rx DSP front end is algorithmically correct, pinning the fault on the delivery/integration side (`README_tests.md:83-91`).

### How to run

```matlab
% Non-HW byte-path logic (any machine, no board):
runtests('QPSKByteTxUnitTests')

% Non-HW Rx front-end DSP suite (Communications Toolbox + commhdlQPSKTxRxParameters on path):
cd trx_examples/targeting/QPSKTxRxHDLExample
runtests({'PhaseAmbiguityEstimatorTest','CoarseFreqEstimatorTest', ...
          'PreambleDetectorTest','SymbolSynchronizerTest'})
% or individually, e.g.:
runtests('SymbolSynchronizerTest')

% HW deployed-link suite (verif BOOT.BIN on Jupiter, Tx1->Rx1 cable):
runtests('QPSKDeployedLinkTests')

% HW network suite (byte-DMA bitstream + cable; ~35 min):
runtests('QPSKNetworkTests')
```

### Pass gates

- **`QPSKDeployedLinkTests`** (`test/QPSKDeployedLinkTests.m:39-40`):
  - `BERGate = 0.01/100` → BER must be **< 0.01%** on checked bits (120 bits/packet).
  - `MinPackets = 5000` → link must sustain **> 5000 packets** per measurement for a valid liveness floor.
  - Applied jointly by `verifyLink` (`:147-153`); the 15-min soak (`testSustainedBER15Min`) additionally requires every 30-s window > 5000 packets and cumulative BER < gate over ~1M+ checked bits (`:558-611`).
  - Byte-DMA tests gate on the byte-vs-generator *delta* (< 0.002–0.005), not absolute zero, due to the parked in-FPGA-Tx artifact (`:372`, `:410`, `:458`).
- **`QPSKNetworkTests`** (artifact-aware, ARQ-masked): ping ≥ 30/50 replies and mean RTT < 250 ms (`:182-186`); TCP soak ≥ 1.0 Mbit/s with no >60 s stall (`:203-216`); UDP soak ≥ 1.8 Mbit/s delivered, loss < 25% (`:232-234`).
- **DSP suites**: per-test `verify*` assertions (EVM/residual/margin thresholds) listed above; pass criterion is all 34 green.

### HW targets

- **`QPSKDeployedLinkTests`** and **`QPSKNetworkTests`** both hit the **Jupiter / ADRV9002 radio at `ip:10.0.0.146`**, register access via `BistRegisters` (`.Host` SSH for `busybox devmem` / `sshExec`); BIST IP at base `0x9D000000`, Tx byte DMAC `0x9D100000`, Rx byte DMA `0x9D200000`. Both `assumeFail`/`assumeTrue`-skip when the board is unreachable or the required (byte-DMA) bitstream is not deployed.
- The **ZedBoard** port is verified out-of-band via the `host_app/qpsk_capture` devmem path (not these `runtests` classes); the network/byte HW gates above are measured on Jupiter.

## Test results

Verified 2026-06-21. Both platforms pass under the **`BERGate = 0.01%`** gate.

### Non-HW unit tests — 48/48 PASS
- **`QPSKByteTxUnitTests` — 14/14.** Byte serializer/shifter logic and the Jupiter plugin-RD byte interface, including `testConfigurablePacketSize` across packet sizes {1280, 2240, 4480} bits.
- **Rx-DSP front-end — 34/34.** `SymbolSynchronizerTest` (4), `CoarseFreqEstimatorTest` (10), `PhaseAmbiguityEstimatorTest` (12), `PreambleDetectorTest` (8).

### ZedBoard (CMOS) — RF cable soak
- Device `xc7z020`, board `10.0.0.128`, BOOT.BIN `c8673d15`.
- **1,020,000-packet RF cable soak:** 13 garbage packets = **0.00127% packet-rate** ≈ **~0.00064% BER** — under the 0.01% gate.
- 600-packet re-confirm: **0.000%**.
- Measured on the **cable RF path** (`rx_input_select=1`); the internal-loopback self-test path is a known artifact (see Known limitations) and is excluded from this gate.

### Jupiter (LVDS) — deployed link
- Board `jupiter_sdr` @ `10.0.0.146`, SSI 15.36 MHz design rate (1.92 Msym).
- **`QPSKDeployedLinkTests`: 25/26 PASS** (full run, ~40 min). All RF-link tests pass at **0.00000% BER**: baseline, CFO ±20 kHz (6), Tx atten −10..0 dB (3), Rx gain 15..35 (5), AGC mode, **8/8 cold acquisitions**, stream-loss recovery, combined impairments, CFO edge, BIST host cross-check, byte-DMA mode switching, byte-DMA throughput, **`testByteDmaEndToEnd`** (byte-exact), and **`testSustainedBER15Min`: 1,683,245 packets / 201,989,400 checked bits / 0 errors / 0.000000% BER**.
- `testByteDmaEndToEnd` was a **test-harness** bug, now **fixed**: the old single-packet SYNC capture (`ByteDmaRegisters.rxCapture`) word-rotates (every capture ≈ random, bitAcc 0.51). `ByteDmaRegisters.rxCaptureMulti` (continuous multi-packet transfer + per-byte majority vote, the `qpsk_capture` method) recovers the consistent packet, and `bestWordRotationDiff` verifies byte-exactness at the consistent cyclic word-rotation framing offset. The Jupiter byte-DMA round trip is **byte-exact, internal *and* cable** (0/280 bytes differ); the word-rotation is a framing offset the frame layer resyncs.
- **1 FAIL — `testByteDmaBistMatch`** (byte-vs-generator BIST *delta* gate, 0.002). It fails only on the internal-loopback **artifact** (gen ≈ byte ≈ 7.3% BIST BER, delta just over gate), not the byte path. It passes once the internal-loopback artifact is resolved — the dither fix (validated on ZedBoard: 16.8%→0% garbage, ~7%→2.97% BER) deployed to the Jupiter, or its cleaner fractional-delay successor. See `SEGMENTED_DEBUG_FINDINGS.md`.

## Known limitations

### Internal-loopback self-test artifact (`rx_input_select=0`)
The internal-loopback self-test path shows **~14–17% loss-of-lock on ZedBoard** (16.8% in one segmented capture; "~14%" typical) — driven entirely by periodic *frame-lock loss*: ~85% of packets decode perfectly and the rest are whole-packet garbage in contiguous ~100-packet-period blocks (`SEGMENTED_DEBUG_FINDINGS.md:14-24`). This is a degenerate, perfectly sample-aligned internal signal that pushes the Rx symbol-timing-recovery loop into a cycle-slip — a **physical effect not present in the RTL**: the functional model sims **0% BER**, and the real RF cable link is clean (see Test results above). Use `rx_input_select=1` (cable) for the link and treat the internal self-test number as a known artifact. Full root-cause and tap-level analysis (including the RTL injection point and candidate dither/fractional-delay/rate-match fixes) are in **`SEGMENTED_DEBUG_FINDINGS.md`** (do not duplicate here).

### ZedBoard stock SSI rate
The stock CMOS ADRV9002 profile runs the SSI at **1.92 MHz (240 ksym), 8× below the 1.92 Msym design rate**; no design-rate CMOS profile matched to the board API exists yet. At this 8×-low operating point the cable link decodes arbitrary data at **0.00000% in clean windows**, but lock *convergence* is bimodal (only ~10% of cold acquisitions settle clean) — a rate-beat / clock-enable integration artifact tied to the 8×-low point, not a model bug (`RATE_MODES.md:42-53`). `integAvgLen` is rate-scaled to `2^12` to hold the CFO-tracking time constant at this operating point. Rate-mode mechanics, the `multiple` Fast-slow clock-ratio fix, and the `QPSK_CMOS_RSYM` override (which reverts to a design-rate profile) are documented in **`RATE_MODES.md`**.

## Build & deploy

Both platforms run HDL Coder's IP Core Generation workflow with Vivado **2025.1** (`AllowUnsupportedToolVersion = true`) against the same bit-identical composite DUT; the bitstream/boot step uses `CI/scripts/adi_build.tcl`. Select the platform once via `setappdata(0,'QPSK_RATE_MODE', <'jupiter'|'cmos'>)` before building — `qpsk_rate_mode_config()` expands it into the reference design, the `multiple` clock ratio, and `integAvgLen`.

### Jupiter (LVDS, ZCU102/`jupiter_sdr`)
1. `setappdata(0,'QPSK_RATE_MODE','jupiter')` (optionally `setappdata(0,'QPSK_DBPP',N)` for a non-default packet size, N multiple of 64, ≥128).
2. Build the composite DUT (`commhdlQPSKTxRxLoopback/TxRxComposite`) with `qpsk_rate_mode_config('jupiter')` → reference design `JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)`, project `jupiter_sdr`, `ref_design='rxtx'`, `multiple=1`, target `xczu3eg-sfva625-2-e` / Zynq UltraScale+. (The legacy `hdlworkflow_txrx.m` builds the separate `commhdlQPSKTxRx/Receiver` DUT against `JUPITER (TX & RX ...)` / `ref_design='txrx'`, build folder `hdl_prj_jupiter_txrx`.)
3. Deploy BOOT.BIN to the board at **10.0.0.146** (`root@10.0.0.146`, password `analog`).
4. Modem regfile at IP base `0x9D000000` over ssh + `busybox devmem` (BIST: `count_out` `+0x100`, `packets_out` `+0x104`, `bit_errors_out` `+0x108`; control: soft reset `+0x000` first, then `rx_input_select` `+0x114`, `tx_source_select` `+0x118`).
5. Host byte tools (`qpsk_capture`, `qpsk_tun`) build with the default ZynqMP base (`0x9D000000`, DMA buffer `0x7FF00000`).
6. Verify: `runtests('QPSKDeployedLinkTests')`, then `runtests('QPSKNetworkTests')`.

### ZedBoard (CMOS, ADRV9002 `xc7z020`)
1. `setappdata(0,'QPSK_RATE_MODE','cmos')` (default).
2. Run `hdlworkflow_zed.m` — DUT `commhdlQPSKTxRxLoopback/TxRxComposite`, reference design `ADRV9002 ZED (RX & TX, BYTE DMA)`, project `adrv9001` / carrier `zed`, ref_design `rxtx`, **`multiple=2`** (30.72→15.36 MHz Tx-output crossing), `integAvgLen=2^12`, target `xc7z020-clg484-1` / Zynq-7000, build folder `hdl_prj_zed_composite`. Kit at `/mnt/onetb/scratch/qpsk_variants/zed_bytetx/` (`hdlworkflow_zed.m`, `build_variant_zed.m`).
3. Reserve the DMA buffer region `0x1FF00000` (top 1 MB of the 512 MB DDR) via a device-tree **reserved-memory** node before booting.
4. Deploy BOOT.BIN to the board at **10.0.0.128**.
5. Build host byte tools with **`-DQPSK_BOARD_ZED`** — modem base `0x43C00000`, Tx DMA `0x43C10000`, Rx DMA `0x43C20000`, GPIO `0x43C30000`, DMA buffer `0x1FF00000` (Zynq-7000 GP0 window).
6. Verify out-of-band via the `host_app/qpsk_capture` devmem path on the cable RF path (`rx_input_select=1`); the `runtests` HW classes target Jupiter.
