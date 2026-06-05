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

## Algorithm validation (already done, no hardware)

The bit-level PRBS logic was validated independently of MATLAB (`/tmp/prbs_check.py`
port, faithful to MATLAB's 1-based `bitget`):

- clean loopback → **0 errors** on both lanes
- PRBS-15 is **maximal-length** (period 32767 = 2¹⁵−1)
- single in-transit bit flip → detected (≈3 counts, multiplicative-descrambler ×3 spread)
- I/Q swap (PRBS-15 into the PRBS-9 checker) → 4015 errors (clearly detected)
- engine-in-loopback → both lanes lock, 0 errors, sample count advances

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
