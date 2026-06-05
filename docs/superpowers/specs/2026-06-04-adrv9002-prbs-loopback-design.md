# ADRV9002 PRBS Digital-Loopback Interface Test — Design

**Date:** 2026-06-04
**Status:** Approved (decisions below locked via /goal directive)
**Goal:** Build an HDL design that runs PRBS testing through an ADRV9002 *digital* (SSI)
loopback to verify the FPGA↔ADRV9002 digital data interface.

## Why

The QPSK targeting work hit a deterministic 7.27% internal-loopback BER that simulation
could not reproduce. Every diagnostic pointed at the *integration* layer (clocking, SSI
data interface, sample alignment) rather than the DSP. A PRBS digital-loopback test
removes all DSP ambiguity: it drives a known pseudo-random pattern straight out the Tx
data lanes, has the ADRV9002 return it bit-for-bit over its SSI digital loopback, and
checks it on the Rx data lanes. A digital loopback is **bit-exact**, so:

> **0 errors + locked ⇒ the FPGA↔ADRV9002 digital interface is good.
> Any nonzero error ⇒ a real digital-interface fault.**

This gives a clean go/no-go on the interface that the QPSK chain could never isolate.

## Locked decisions

1. **Loopback point:** ADRV9002 SSI / digital loopback (chip returns Tx-SSI data on Rx-SSI).
2. **PRBS engine:** implemented in the HDL design (Simulink → HDL Coder), not the chip BIST.
3. **Model:** new standalone `commhdlPRBSLoopback.slx`, independent of the QPSK chain.
4. **Checker style:** self-synchronizing PRBS monitor (approach A) — latency-agnostic, no
   alignment FSM. (Approaches B replica+align and C counter-ramp rejected.)
5. **PRBS polynomial:** 16-bit-parallel, **per-lane distinct** so an I/Q swap is detectable
   — I-lane PRBS-15 (`x¹⁵ + x¹⁴ + 1`), Q-lane PRBS-9 (`x⁹ + x⁵ + 1`). (Refined during
   implementation: the self-synchronizing/multiplicative checker is phase-insensitive, so
   two same-polynomial lanes could swap undetected; distinct polynomials fix this at zero
   cost.)
6. **Initial scope:** channel-0 I and Q (2 lanes), matching the existing single-channel
   port mapping. Channel-1 (I1/Q1) is a documented drop-in extension.

## Architecture

New model `commhdlPRBSLoopback.slx` with a single atomic subsystem `PRBSLoopback`
(the HDL DUT). All blocks HDL-Coder compatible; fixed-point, single clock domain.

```
                       ┌──────────────────────── PRBSLoopback (DUT) ───────────────────────┐
 AXI prbs_control ───▶ │  decode: reset / gen_enable / inject_error                          │
                       │                                                                     │
                       │  ┌─ PRBS-15 gen (seed_I) ─16b─▶ tx_dataOutI ─▶[ADRV9002 DAC I0]     │
                       │  └─ PRBS-15 gen (seed_Q) ─16b─▶ tx_dataOutQ ─▶[ADRV9002 DAC Q0]     │
                       │                              gen_valid ─────▶ tx_validOut            │
                       │                                                                     │
   [ADRV9002 ADC I0]─▶ │ adc_dataInI ─▶ self-sync checker I ─▶ err_I (accum), lock_I         │
   [ADRV9002 ADC Q0]─▶ │ adc_dataInQ ─▶ self-sync checker Q ─▶ err_Q (accum), lock_Q         │
   [IP Valid Rx Data]─▶│ adc_validIn ─▶ qualifies both checkers + sample_count               │
                       │                                                                     │
                       │  AXI status ◀─ sample_count, bit_errors_I, bit_errors_Q, lock_status│
                       └─────────────────────────────────────────────────────────────────────┘
            ADRV9002 placed in SSI digital loopback: DAC-side SSI data returned on ADC-side SSI.
```

### Generator (multiplicative scrambler driven with 0)
Each lane is a multiplicative scrambler fed a constant 0, which emits the maximal-length
PRBS for its polynomial (I: PRBS-15, Q: PRBS-9). Per sample it processes 16 bits (MSB-
first), updating a small history register, yielding one 16-bit word per clock. Distinct
polynomials per lane make an I/Q swap or inter-lane coupling detectable. Output gated by
`gen_enable`; history reset on `reset`. `inject_error` XORs a single bit into the Tx word
for one sample (self-test that the checker actually counts).

### Checker (self-synchronizing multiplicative descrambler, per lane)
The matching multiplicative descrambler recovers the scrambler's input from the *received*
word: `x̂ = y ⊕ y[n-a] ⊕ y[n-L]`, using only the received-bit history. If the link is
bit-exact, `x̂ ≡ 0`; every recovered `1` is a real bit error (popcount accumulated). A
multiplicative descrambler **self-synchronizes inherently** after `L` received bits (≤ one
16-bit sample) — no seed sharing, no alignment FSM, latency-agnostic:
- `lock` asserts after `N_LOCK` (e.g. 64) consecutive error-free samples.
- Once locked, `bit_errors` accumulates the popcount of each mismatch; `sample_count`
  counts qualified samples. A mismatch burst drops `lock` (re-arm).
- Qualified by `adc_validIn` so only valid ADC words are scored.

### Clocking
Single clock domain inside the DUT (the JUPITER `rxtx` IP core clock). The Tx and Rx SSI
rate matching is handled by the reference design exactly as in the QPSK loopback build;
this design adds no new rate-transition logic — a deliberate contrast to the QPSK model
whose Symbol-Sync Rate Handle was the suspected slip source.

## AXI4-Lite register map

Base `0x9D000100` (same window the deployed designs use; `busybox devmem` over ssh works).

| Offset | Addr | Dir | Name | Meaning |
|---|---|---|---|---|
| `x"100"` | `0x9D000100` | W | `prbs_control` | bit0 = reset/resync, bit1 = gen_enable, bit2 = inject_error |
| `x"104"` | `0x9D000104` | R | `sample_count` | qualified samples since lock |
| `x"108"` | `0x9D000108` | R | `bit_errors_I` | accumulated I-lane bit errors |
| `x"10C"` | `0x9D00010C` | R | `bit_errors_Q` | accumulated Q-lane bit errors |
| `x"110"` | `0x9D000110` | R | `lock_status` | bit0 = I locked, bit1 = Q locked |

## Build flow

`hdlworkflow_prbs.m` is `hdlworkflow_loopback.m` with only these changes:
- DUT → `commhdlPRBSLoopback/PRBSLoopback`; `load_system('commhdlPRBSLoopback')`.
- `ProjectFolder` / `TargetDirectory` → `hdl_prj_jupiter_prbs[/hdlsrc]` (no collision with QPSK).
- Port mappings:
  - `tx_dataOutI/Q` → `ADRV9002 DAC Data I0/Q0 [0:15]`, `tx_validOut` → `IP Load Tx Data OUT`
  - `adc_dataInI/Q` → `ADRV9002 ADC Data I0/Q0 [0:15]`, `adc_validIn` → `IP Valid Rx Data IN`
  - `prbs_control` → AXI4-Lite `x"100"`; `sample_count` `x"104"`; `bit_errors_I` `x"108"`;
    `bit_errors_Q` `x"10C"`; `lock_status` `x"110"`
- Everything else identical: `JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)`,
  `jupiter_sdr` / `rxtx`, `xczu3eg-sfva625-2-e`, Vivado 2025.1, `adi_build.tcl`,
  `AllowUnsupportedToolVersion=true`, free-running sync.

## Host + chip-loopback control

- `PrbsLoopbackRegisters.m` — static ssh+devmem helper mirroring `BistRegisters.m`
  (`root@10.0.0.146`, password `analog`, `busybox devmem`), with the offsets above plus
  `reset()`, `enable()`, `readAll()`, `injectError()`.
- `run_prbs_loopback.m` — end-to-end host script:
  1. Put the ADRV9002 in SSI digital loopback (see open risk).
  2. `prbs_control`: gen_enable=1, pulse reset.
  3. Poll `lock_status` until locked; read `sample_count`, `bit_errors_I/Q`.
  4. Print PASS (locked, 0 errors over ≥ M samples) / FAIL.
  5. Sanity: disable chip loopback → expect lock to drop (proves the path is under test).
  6. Optional: assert `inject_error` and confirm the counters tick.

## Open integration risk — chip SSI loopback enable

The toolbox `adi.ADRV9002` class exposes only `LoopbackDelayTracking*`, **not** an SSI/
digital-loopback enable. The enable mechanism must be confirmed on the live target.
Candidate mechanisms, in order of preference:
1. An iio device debug attribute / `direct_reg_access` on the `adrv9002-phy` iio device
   (inspect `iio_attr -d` / debugfs on the running board).
2. A board-side helper invoking the ADI API (`adi_adrv9001_Ssi_Loopback_Set`) if exposed.
3. Direct SPI/register poke if (1)/(2) are unavailable.

This is the one piece not derivable from the repo; resolve it by querying the running
device before relying on any single path. The HDL design itself does not depend on which
mechanism is used.

## Testing

- **Model / HDL behavioral sim** (`PrbsLoopbackModelTest.m`): drive `PRBSLoopback` with Tx
  outputs wired directly back to the Rx inputs (models the bit-exact loopback). Assert
  `lock_status==0b11` and `bit_errors_I==bit_errors_Q==0` after lock; assert `inject_error`
  yields a nonzero count. Deterministic, no hardware.
- **Hardware** (`PrbsLoopbackHardwareTest.m`): deploy → enable chip loopback → expect
  locked / 0 errors over a sustained window; disable loopback → expect lock lost.

## Out of scope (YAGNI)

- Channel-1 (I1/Q1) lanes — documented extension, not in v1.
- Selectable PRBS polynomial at runtime — fixed PRBS-15 for v1.
- Analog/RF loopback — explicitly excluded; this is a *digital* interface check.
