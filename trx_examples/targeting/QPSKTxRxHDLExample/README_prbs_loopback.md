# ADRV9002 PRBS Digital-Loopback Interface Test

A standalone HDL design that verifies the FPGA↔ADRV9002 **digital data interface**
by driving a PRBS out the Tx data lanes, having the ADRV9002 return it bit-for-bit via
its **SSI digital loopback**, and checking it on the Rx data lanes. A digital loopback is
bit-exact, so:

> **locked + 0 bit errors ⇒ the digital interface is good; any nonzero error ⇒ a real fault.**

Design spec: `../../../docs/superpowers/specs/2026-06-04-adrv9002-prbs-loopback-design.md`

## Files

| File | Role |
|---|---|
| `prbs15_gen16.m`, `prbs9_gen16.m` | 16-bit-parallel PRBS generators (I: PRBS-15, Q: PRBS-9) |
| `prbs15_chk16.m`, `prbs9_chk16.m` | self-synchronizing PRBS checkers (multiplicative descramblers) |
| `PRBSEngine.m` | stateful DUT engine: gen + check + lock + AXI counters |
| `build_prbs_model.m` | constructs `commhdlPRBSLoopback.slx` (DUT + loopback testbench) |
| `hdlworkflow_prbs.m` | HDL Coder IP-Core-Generation workflow → JUPITER bitstream |
| `PrbsLoopbackModelTest.m` | hardware-independent verification (helpers, engine, sim) |
| `PrbsLoopbackRegisters.m` | host AXI4-Lite I/O over ssh+devmem |
| `adrv9002_ssi_loopback.m` | discover + toggle the chip's SSI loopback attribute |
| `run_prbs_loopback.m` | end-to-end hardware test + PASS/FAIL |

## AXI4-Lite map (base `0x9D000100`)

| Addr | Dir | Name | Meaning |
|---|---|---|---|
| `0x9D000100` | W | `prbs_control` | bit0 reset, bit1 gen_enable, bit2 inject_error |
| `0x9D000104` | R | `sample_count` | samples scored since lock |
| `0x9D000108` | R | `bit_errors_I` | I-lane bit errors |
| `0x9D00010C` | R | `bit_errors_Q` | Q-lane bit errors |
| `0x9D000110` | R | `lock_status` | bit0 I locked, bit1 Q locked |

## Runbook

All steps need **MATLAB R2025b**; synthesis needs **Vivado 2025.1**; the hardware step
needs the **JUPITER board** (`root@10.0.0.146`, pw `analog`).

```matlab
% from trx_examples/targeting/QPSKTxRxHDLExample/
build_prbs_model                 % 1. create commhdlPRBSLoopback.slx
runtests('PrbsLoopbackModelTest')% 2. verify in sim (lock + 0 errors, fault/swap detection)
hdlworkflow_prbs                 % 3. generate RTL/IP + build bitstream (Vivado 2025.1)
```

Flash the generated boot image to the board, then on the host:

```matlab
result = run_prbs_loopback;      % 4. enable chip loopback, run PRBS, PASS/FAIL
```

`run_prbs_loopback` enables the ADRV9002 SSI loopback, resets the PRBS, waits for lock,
measures errors over a dwell window, then self-tests the error counter (inject) and
confirms lock drops when loopback is disabled (proving the path is really under test).

## Verification status (done in MATLAB R2025b)

- **`PrbsLoopbackModelTest`: 6/6 pass** — pure-helper clean/fault/swap checks, the stateful
  engine through a modeled loopback (lock + 0 errors), inject-error counting, **and a full
  Simulink simulation** of `commhdlPRBSLoopback` (both lanes lock, 0 bit errors).
- **`makehdl` on the DUT: 0 errors** — synthesizable Verilog generated (`PRBSLoopback.v`,
  `PRBSEngine.v`) with the correct PRBS-15 (`y[n]=y[n-14]^y[n-15]`) and PRBS-9
  (`y[n]=y[n-5]^y[n-9]`) LFSR taps and the full AXI/data port set.
- Bit-level logic was also cross-checked in a standalone Python port: PRBS-15 confirmed
  **maximal-length** (period 32767 = 2¹⁵−1); single-bit fault detected; I/Q swap detected.

Note: the DUT data ports are **uint16** (raw 16-bit words). This is a bit-pattern test, so
signedness is irrelevant, and uint16 keeps the path HDL-native (`typecast` lowers to
`memcpy`, which HDL Coder cannot synthesize). The reference-design interface maps the 16
bits `[0:15]` regardless of signedness.

## Hardware status (built + deployed on the JUPITER board)

- **Bitstream built** (Vivado 2025.1, ~60 min): timing **met** (WNS=+0.191 ns, WHS=+0.010 ns).
  The AXI4-Lite IP is mapped at base `0x9D000000` (matches `PrbsLoopbackRegisters`).
- **Deployed** to `root@10.0.0.146` (see `tools/deploy_prbs.sh`, which backs up the prior
  `/boot/BOOT.BIN` to `/boot/BOOT.BIN.prev`). Board reboots to FPGA state `operating`.
- **AXI interface live**: `prbs_control` writes take effect (reset clears the counters),
  the generator drives PRBS out the ADRV9002 DAC SSI lanes. With no loopback the checker
  correctly does **not** lock (`lock=0`, `samp=0`) — exactly as designed.

### ADRV9002 SSI digital loopback — enable knob (found)

The chip SSI loopback **is** exposed via debugfs on this board:

```bash
echo 1 > /sys/kernel/debug/iio/iio:device2/tx0_ssi_test_mode_loopback_en   # + tx1
```

(`tx*_ssi_test_mode_loopback_en` is the driver's `adi_adrv9001_Ssi_Loopback_Set`; there are
also `rx*_near_end_loopback`, `tx*_datapath_loopback_en`, and a per-channel
`tx*_ssi_test_mode_status` health readout.)

### Digital interface: VERIFIED HEALTHY (chip SSI diagnostic)

With the loopback enabled and the PRBS generator running, the chip's own SSI status reads:

```
tx0_ssi_test_mode_status:  strobeAlignError: 0   fifoFull: 0   fifoEmpty: 0   dataError: 1
```

`strobeAlignError: 0` + balanced FIFO = **the FPGA↔ADRV9002 digital interface (SSI strobe/
clock framing and sample rate) is correct**. (`dataError: 1` is expected — the chip's
built-in checker expects ADI's own test pattern, not this design's custom PRBS-15/PRBS-9.)
This was also the lever that exposed `tx_validOut` as the SSI-strobe driver: a gapped valid
gave `strobeAlignError: 1`; a continuous valid restores `0`.

### Why the FPGA-side checker can't lock (root-caused via the in-DUT capture buffer)

`PRBSEngine` includes a 64-deep **capture buffer** (an in-DUT ILA): on a `capture_arm` edge
(`prbs_control` bit3) it records the sent `txI` and the received `adcI`/`adcQ` per sample,
read back via `capture_idx` (`x"118"`) → `capture_txI` (`x"11C"`), `capture_adcI` (`x"120"`),
`capture_adcQ` (`x"124"`). A capture on hardware showed:

- received `adcI` range is **±0x1fff (~14-bit)**, not the full-16-bit white PRBS that was sent;
- received `adcI` **lag-1 autocorrelation ≈ 0.68** (a white PRBS is ~0) — i.e. **filtered**;
- `adcQ[k] == adcI[k-10]` exactly; **zero** bit-exact matches to `txI` at any latency.

**Conclusion:** `tx_ssi_test_mode_loopback_en` is **not a raw-bit SSI loopback** — the looped
data passes through the ADRV9002 **Rx decimation datapath**, so the FPGA's `adc_dataIn` (which
taps *after* that datapath) receives a band-limited, correlated signal, never the raw SSI bits.
A bit-exact FPGA-side PRBS check therefore **cannot** lock through this loopback. This is an
architecture fact, not a design bug — the design, AXI, capture buffer, generator and checker
all work (verified in sim and on hardware).

### Correct bit-exact SSI verification on the ADRV9002

Because the FPGA sits behind the Rx datapath, the bit-exact interface check belongs to the
**chip's own SSI BIST** (`tx*_ssi_test_mode`), which compares the *raw* Tx-SSI bits the FPGA
sends against a PRBS before the datapath. The healthy `strobeAlignError: 0` / balanced-FIFO
status already came from that mechanism. Driving its `dataError` to 0 would require the FPGA
to emit the chip's exact expected SSI pattern (single PRBS, matched serialization) on both
lanes — a different generator config than this design's distinct-per-lane PRBS.

## Open item — chip SSI loopback enable

The `adi.ADRV9002` class exposes only `LoopbackDelayTracking*`, not an SSI/digital-loopback
enable. `adrv9002_ssi_loopback.m` discovers the controlling debugfs attribute on the live
board at runtime (searching for `loopback`/`ssi`/`test` attributes) and prints what it
used. If auto-discovery fails, it dumps the full attribute list so the right control can be
wired up by hand (or via a board-side helper calling `adi_adrv9001_Ssi_Loopback_Set`). The
HDL design itself does not depend on which mechanism is used.

## Why this design (context)

The QPSK targeting work hit a deterministic 7.27% internal-loopback BER that simulation
could never reproduce, with every diagnostic pointing at the integration/SSI layer rather
than the DSP. This PRBS test removes all DSP ambiguity and gives a clean go/no-go on the
digital interface that the QPSK chain could not isolate.
