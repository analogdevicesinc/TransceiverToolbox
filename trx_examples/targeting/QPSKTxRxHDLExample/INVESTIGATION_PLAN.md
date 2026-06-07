# QPSK 7.27% BER Investigation — State & Plan

## ====== 2026-05-31 (post-reboot) CORRECTED FINDINGS — read first ======

Re-verified from deployed Verilog + captures + Vivado reports. Several prior conclusions were WRONG:

1. **"Descrambler is the culprit" is DISPROVEN.** `test-results/dma_postdemod.mat` is a degenerate
   constant (`data`=-8192 for all 262144 samples) — a constant trivially autocorrelates 100%, so the
   "post-demod bits repeat → descrambler culprit" chain was an artifact. Scrambler AND descrambler RTL
   are CORRECT + matched (additive x^7+x^4+1, init [1011101], reset on startIn, LFSR advances on delayed
   validIn). The 6 descrambler/BIST builds could never have worked — they can't fix a corrupted INPUT.
2. **BIST reference confirmed** from `TxRxCompo_ip_src_MATLAB_Function.v`: hardcoded 120-bit array =
   ASCII "ADI Hello World". Error when `count<=120 && datain!=ref[count-1]`; `count` resets on `start`,
   increments per `valid`. (Ignore sim_postdemod.m / internal_loopback_per_stage_report.m — they use
   WRONG refs: randsrc PN / x^7+x^3+1 / [1001000].)
3. **Vivado timing is MET**: WNS=+0.145ns, WHS=+0.010ns, THS=0, 0 failing endpoints. So 7.27% is NOT a
   timing-closure issue — plan step #3 (retiming/phys-opt) will NOT help. Deterministic-across-builds also
   rules out metastability. It is a **deterministic functional RTL-vs-model divergence**.
4. **Symbols are clean** (tap3 EVM≈0.011 vs nearest ideal) BUT EVM-to-nearest-ideal is BLIND to
   90/180/270° rotation. So clean EVM is consistent with ~14.5% of packets being phase-rotated/misframed
   (14.5%×50% = 7.27%). The error is digital, downstream of clean symbols.
5. **Cable=1.37% < Internal=7.27%** — the internal *digital* loopback is 5× WORSE than the analog cable.
   The cable path exercises the identical Rx decode chain at 1.37%, so the Rx chain is PROVEN GOOD. The
   defect is SPECIFIC to the composite internal-loopback path (Tx → Repeat×2 ZOH → MUX → Rate Transition
   → Rx Downsample×2) — code that only exists in build_composite.m.
6. **Slip mechanism CONFIRMED in RTL**: `Symbol_Synchronizer/Rate_Handle` is a FIFO (push=interpolator
   strobe at NCO rate, pop=validIn/4 fixed, validOut=FIFO_validPop). Push≠pop rate → FIFO over/underflow
   → missing/extra validOut = a slip → descrambler LFSR + BIST `count` desync → V15 position ramp.
   Leading root cause: the internal loopback feeds a ZOH-upsampled, perfectly sample-aligned signal — a
   degenerate stimulus for the symbol-timing NCO → FIFO slips. The cable path's analog smoothing +
   fractional delay breaks the degeneracy → loop locks → 1.37%.

**Open question (pending sim):** does an INTERNAL-loopback Simulink sim reproduce ~7% (=> model-fixable,
debug the timing loop / use FIR interp instead of Repeat ZOH in the loopback path), or give ~0%
(=> RTL/fixed-point-specific)? See `/tmp/run_internal_sim2.m`, `sim_internal_tap3.mat`.

## ====== 2026-05-31 SESSION-2 RESULTS (cosim + HW fix attempt + tap localization) ======

Progress beyond the CORRECTED FINDINGS above:

1. **HDL cosim: generated RTL ≡ model ≡ 0% BER.** `makehdl`+`makehdltb` on TxRxComposite
   (internal-loopback stimulus) → iverilog → TEST PASSED, 0 mismatches. So the DUT RTL is
   correct; the 7.3% is NOT in the model or RTL. (Tools: /tmp/gen_cosim_tb.m, /tmp/run_cosim.sh.)
2. **clk_enable/valid gate fix: RULED OUT.** Patched `enb = dut_enable & adc_validIn` in all 4
   TxRxCompo_ip_dut.v copies, rebuilt (cache-disabled), verified the gate IS in the netlist
   (forward trace: data_valid → 16151 DUT CE pins), deployed, rebooted, measured: internal BER
   still **7.30%**. The gate is present but does not help. The "strobed-valid" mechanism was a
   CONSTRUCTED-testbench artifact (/tmp/cosim_hdl/.../mech_tb.v), not real HW behavior.
3. **Tap localization (build-free): divergence is in the Rx FRONT-END.** With validated framing
   (sim post-phase-ambiguity constellation tap3 = 0.00% packet-to-packet consensus mismatch),
   HW tap3 = 28% → HW produces a packet-INCONSISTENT post-phase-ambiguity constellation while
   sim is identical. Pre-ambiguity taps (post-SS/post-CS) can't be framed offline (no packet
   markers + legit per-packet rotation). So: divergence at/upstream of the constellation tap
   (AGC/SymSync/CarrierSync/PhaseAmbiguity), downstream (Demod/Descrambler/BIST) is clean.
4. **A real Vivado ILA is NOT usable here** — no JTAG/FTDI cable on the host, no hw_server, no
   XVC/debug-bridge on the board. The board is network/SSH/AXI-only.

### READY-TO-RUN NEXT STEP: capture the Phase Ambiguity estimate via the existing DMA tap
The prime suspect is the Phase Ambiguity decision (tap3 = post-phase-ambiguity is where HW
diverges). `Average_Estimates` outputs `avgEst_re/im` — the averaged per-packet rotation
estimate, ALREADY COMPLEX, held per packet (so its value sequence self-frames and shows
HW-vs-sim consistency directly). Recipe (clone `tools/variant_pre_composite_postdemod.m`):
route `.../Phase Ambiguity Estimation and Correction/Average Estimates` avgEst up through
Phase-Ambig-E&C → Freq&Time-Sync → QPSK Rx, into iq_debug_mux (Index Vector) input 5 (tap 3),
build via the variant kit, deploy, set rx_input_select=0 + iq_debug_mux=3, DMA-capture, and
compare the per-packet avgEst value sequence sim-vs-HW. If HW avgEst is inconsistent while sim
is constant → Phase Ambiguity resolution confirmed as the HW culprit. (Alt: also expose
syncPulseOut for exact packet framing of tap3.) Then the fix is a HW-physical investigation of
that stage (reset/CDC/clocking of the preamble-detect + phase-ambiguity path).

Memory: [[qpsk-descrambler-culprit-disproven]], [[qpsk-sim0-hw7-divergence-downstream-of-constellation]],
[[qpsk-7pct-rootcause-ipcore-clock-mismatch]], [[qpsk-divergence-at-phase-ambiguity-tap]].
GOAL (internal BER < 0.01%) NOT met this session.

## ====================================================================

**Status as of 2026-05-31:** Investigation paused for system reboot. Comprehensive snapshot below.

## Goal

Drive internal-loopback BER from the stable 7.27% baseline down to < 0.01%.

## Confirmed facts

| Fact | Source |
|---|---|
| **Sim BER = 0%** | Extended Simulink sim of `commhdlQPSKTxRxLoopback` printed "ADI Hello World" 8× over 30ms / 49 packets |
| **HW BER = 7.27%** | Stable across 6 different bitstream builds, varies < 0.05% between them |
| **Tx data = "ADI Hello World" + msg counter + toggle** | `Transmitter/Input Data/Message Generator/MATLAB Function` (Stateflow script) |
| **BIST reference = "ADI Hello World" hardcoded** | `Receiver/Capture Data Bits/MATLAB Function` (Stateflow script) |
| **Tx scrambler = Rx descrambler = x^7+x^4+1 additive, init [1011101]** | Both verified in generated Verilog (see `hdlsrc/.../TxRxCompo_ip_src_HDL_Data_Scrambler.v` and `..._HDL_Data_Descrambler.v`) |
| **Post-Demod bits are bit-identical packet-to-packet** | `composite_postdemod` variant + DMA capture, autocorrelation 100% at lag 1133/2266 sym |
| **Post-SymSync IQ at EVM=0.0102** | Perfect unit-mag QPSK before descrambler — see `qpsk-dma-postss-evm-001` memory |
| **Vivado WHS = +0.010 ns** | Hold slack 10ps (extremely tight but technically met) |
| **V15 per-bit error histogram is position-dependent** | 2.3% at positions 8-19 → 6.2% at positions 80-99, peak 11.6% at position 98 |

## Eliminated hypotheses

| Hypothesis | Eliminated by |
|---|---|
| Random metastability / PVT variation | BER is deterministic to 0.01% across 6 builds → would vary otherwise |
| Descrambler combinational timing margin | `composite_descr_op2` (OutputPipeline=2 + InputPipeline=1 + XOR ppl) → 7.29% unchanged |
| `validIn` signal needs more registering | `composite_descr_ip2` (InputPipeline=2 + OutputPipeline=2) → 7.28% unchanged |
| Descrambler reset can be safely removed | `composite_descr_no_reset` → chain halts (startIn is structural) |
| Multi-cycle start pulse glitch at BIST input | `composite_bist_edge_start` (rising-edge detector) → 7.29% unchanged |
| LFSR cycle offset between Tx/Rx | All 127 MLS offsets give ~50% BER, none give 7.27% |
| Scrambler poly / init mismatch Tx vs Rx | Both Verilog files show x^7+x^4+1 + [1011101]; sim works |
| BIST reference mismatch with Tx data | Both reference "ADI Hello World" 120 bits; sim works |

## Most likely remaining cause

**Rate Transition / Symbol Synchronizer Rate Handle producing deterministic sample slips.**

Math: V15's per-position ramp matches `P(error at pos P) = 0.5 × (1 - (1-p_slip)^P)` with p_slip ≈ 0.0013/cycle. This is consistent with the chain occasionally dropping or doubling a sample at a rate-domain boundary (most likely Symbol Sync's FIFO over/underflow logic in `commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle`).

This is HW-only because pure Simulink simulation runs all signals at logical instants — the rate-handle FIFO in sim doesn't exhibit the over/underflow that occurs in HW where the FIFO's read/write clocks have real timing relationships.

## Build infrastructure

All work happens via the **variant kit** pattern:

```
trx_examples/targeting/QPSKTxRxHDLExample/
├── tools/
│   ├── make_composite_variant_kit.sh    # Stages a build dir under /mnt/onetb/scratch/qpsk_variants/<name>/
│   ├── deploy_composite_variant.sh      # scp BOOT.BIN + reboot board
│   ├── variant_pre_composite_*.m        # Variant overlays (model patches before HDL gen)
│   └── (other utility scripts)
├── build_composite.m                    # Composite model construction (called by build_composite_local.m)
├── hdlworkflow_loopback.m               # HDL Coder workflow (Vivado bitstream gen)
├── sim_with_dma_capture.m               # libiio DMA capture script (262K samples in <2s)
├── sim_postdemod.m                      # post-Demod tap capture/decode
└── INVESTIGATION_PLAN.md                # THIS FILE
```

### Build cycle (~70 min per variant)
```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
bash trx_examples/targeting/QPSKTxRxHDLExample/tools/make_composite_variant_kit.sh \
    <variant_name> variant_pre_composite_<variant_name>
cd /mnt/onetb/scratch/qpsk_variants/<variant_name>
nohup /mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('build_variant.m')" > build.log 2>&1 &
# Wait ~70 min for "VARIANT_BUILD_DONE: <variant_name>" in build.log
bash /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample/tools/deploy_composite_variant.sh <variant_name>
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('/tmp/measure_op2_ber.m')"
```

### Board access
- IP: `root@10.0.0.146` password `analog`
- SSH wrapper: `/tmp/ssh_axi_snap.sh` (sshpass+ssh)
- AXI registers: `0x9D000100..0x9D000114` (BIST counters + control)

## Variants built and their results

Variants are at `/mnt/onetb/scratch/qpsk_variants/<name>/`:

| Variant | Bitstream MD5 | HW BER | Notes |
|---|---|---|---|
| composite_postdemod | 9e7ae3b5f0175c26611a6446fd8860b5 | 7.27% | Tap=3 → post-Demod bits as IQ ±0.5 (DIAGNOSTIC only) |
| composite_descr_op2 | 13c69e681a15124b8416193cf889b971 | 7.29% | OutputPipeline=2/InputPipeline=1/XOR ppl=1 |
| composite_descr_no_reset | 77826dd2b88269c8c3194f4431fa17de | (halted) | startIn forced false → chain stops |
| composite_descr_validIn_sync | e2f145e05471cb5cfe2eaa111c54097d | (halted) | 2 Delays on validIn only → desync |
| composite_descr_ip2 | 285eac0e91e67022a47955c7cdc5197d | 7.28% | InputPipeline=2 + OutputPipeline=2 |
| composite_bist_edge_start | 62a32e0969d0c462ed094bf3a6c24f89 | 7.29% | BIST counter uses rising-edge of start |

## Concrete next steps (priority order)

### 1. Build `composite_postdescr` tap (highest information value)
Add a new tap that exposes the **descrambler output bits** as IQ ±0.5 (same pattern as `composite_postdemod`).

This would let us compare descrambled bits position-by-position to "ADI Hello World". If specific positions show 100% deterministic error → narrows to a structural pattern. If positions show fractional errors → confirms stochastic-but-HW-deterministic slip.

**Implementation**: clone `tools/variant_pre_composite_postdemod.m` to `variant_pre_composite_postdescr.m`. Change the tapped signal from `QPSK Demodulator/dataOut` to `HDL Data Descrambler/dataOut`. The PostDemod_IQ_Pack subsystem maps a single bit to (I=±0.5, Q=±0.5) — for the descrambler tap, simpler since dataOut is already 1-bit. Just pack as I=bit, Q=0 (or similar).

### 2. Investigate `Symbol Synchronizer/Rate Handle` deeply
Open `commhdlQPSKTxRx.slx` in Simulink, navigate to `Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle`. Find the FIFO + Push Counter + Pop Counter logic. Look at the `Validate Input Push Pop` subsystem — that's likely the over/underflow detector.

Possible interventions:
- Add asserts inside Rate Handle FIFO to detect over/underflow
- Replace FIFO with a fixed-ratio counter-based rate adapter
- Add explicit hold-time-safe registers on the FIFO read/write pointers crossing rate domains

### 3. Try different Vivado synthesis strategy
Set `hWC.Objective = hdlcoder.Objective.SpeedOptimization` in `hdlworkflow_loopback.m`. Or set the Vivado strategy via TCL:
```matlab
hWC.SynthesisToolStrategy = 'Performance_RetimingOptimization';
hWC.ImplementationToolStrategy = 'Performance_ExplorePostRoutePhysOpt';
```

These tell Vivado to use retiming + more aggressive post-route physical optimization to improve hold/setup margins. Different from pipelining (which is structural). ~70 min build, no model surgery.

### 4. Capture-bit accumulator on HW
Write a continuous-capture script that uses the post-descr (or even post-demod) tap to log millions of bits at the receiver output, then analyze the EXACT bit-error positions across many packets. If errors cluster at SAME positions every packet → structural model bug not yet found. If errors are random per position → stochastic HW issue.

This doesn't need a new build if we use existing `composite_postdemod` and just collect more data over a longer capture window.

## Key memory files (in `/home/tcollins/.claude/projects/-home-tcollins-dev-qpsk-ai-TransceiverToolbox/memory/`)

| Memory | Topic |
|---|---|
| `qpsk-sim-clean-hw-7pct-final-summary.md` | Final state summary |
| `qpsk-postdemod-bits-100pct-repeat.md` | post-Demod tap proves Demod is clean |
| `qpsk-dma-postss-evm-001.md` | post-SS EVM=0.01 proves chain clean to descrambler |
| `qpsk-descrambler-verilog-analysis.md` | x^7+x^4+1 additive structure confirmed |
| `qpsk-descr-pipeline-no-help.md` | Pipelining op2 doesn't help |
| `qpsk-descr-no-reset-kills-chain.md` | Removing startIn halts chain |
| `qpsk-descr-validin-only-delay-breaks.md` | validIn-only delay breaks data/valid sync |
| `qpsk-bist-edge-start-no-help.md` | rising-edge BIST counter doesn't help |
| `qpsk-7pct-is-packet-misalignment.md` | "14.5% packet misalignment" hypothesis (disproven) |
| `qpsk-7pct-is-hdl-timing-margin.md` | Earlier WHS=6ps observation |
| `qpsk-7pct-localized-postdemod-or-phase-ambiguity.md` | Initial localization to Demod/PhAmbig |
| `qpsk-7pct-chain-floor-exhaustive-sweep.md` | Earlier 9 variants × CS gain etc. |
| `MEMORY.md` | Index of all above |

## Resumption protocol

After reboot, to pick up where we left off:

1. `git status` — should be clean (working tree clean as of pause)
2. `cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox` — root of toolbox
3. Read this file + `MEMORY.md` for context
4. Decide on next step from "Concrete next steps" above (recommend #1 — postdescr tap)
5. Use variant kit pattern to build/deploy/measure

The board at `10.0.0.146` is currently running `composite_bist_edge_start` bitstream. If you want to revert to a known baseline, deploy `composite_postdemod` (last clean tap-mode variant) or the original BOOT.BIN.

## Conversation context

- Session start: 2026-05-29 (Sat)
- 6 variant builds completed, ~7 hours of build time
- /goal evolved: "build postdemod tap" → "identify error block & fix" → "get BER < 0.01%"
- Final state: model algorithmically correct in sim, HW deterministic 7.27% across builds — next move is post-descr tap (Plan #1) or rate-handle restructure (Plan #2).
