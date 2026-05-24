# QPSK loopback bandwidth-variant build infra

Parallel-build helpers for exploring rate variants of the digital-loopback HDL design.

Each variant gets an isolated scratch directory containing its own copies of
`commhdlQPSKTxRxParameters.m` (with `SamplesPerSymbol` overridden) and the
`commhdlQPSKTxRxLoopback.slx` model. Build is fired from that directory so the
local files (cwd precedence over path) drive mask init.

## Layout

- `make_variant_kit.sh <name> <sps> <rsym> <urx> <utx>` — create an isolated
  build dir under `/mnt/onetb/scratch/qpsk_variants/<name>/`. Patches
  `Parameters.m` (SamplesPerSymbol), and emits a `variant_pre.m` that on
  every run patches the model's `InitFcn` (`UpsamplesRx/Tx`), Input Data
  block `Rsym`, and the two HDL Counter mask-init expressions that
  collapse to 0-bit at low SPS (`max(1,...)` wrapping on `CountMax` and
  `CountWordLen`).
- `deploy_variant.sh <name>` — once `<name>/hdl_prj_jupiter_loopback/.../BOOT.BIN`
  exists, scp it to root@10.0.0.146:/boot/, reboot, wait for the board
  back up, and run a quick BIST sanity check.

## Running two variants in parallel

```bash
./make_variant_kit.sh V1_sps2_rsym3p84 2 3.84e6 2 1
./make_variant_kit.sh V3_sps4_rsym3p84 4 3.84e6 1 1

source /tools/Xilinx/2025.1/Vivado/settings64.sh
( cd /mnt/onetb/scratch/qpsk_variants/V1_sps2_rsym3p84 && \
    matlab -batch "run('build_variant.m')" > build.log 2>&1 ) &
( cd /mnt/onetb/scratch/qpsk_variants/V3_sps4_rsym3p84 && \
    matlab -batch "run('build_variant.m')" > build.log 2>&1 ) &
wait
```

Each MATLAB process has its own cwd. The variant directory's
`Parameters.m` and `.slx` take precedence over the repo's. `slprj/` and
`hdl_prj_jupiter_loopback/` land inside the variant scratch dir, so there
is no cross-contamination.

## Known architectural limits (as of this commit)

- The composite-loopback model
  (`commhdlQPSKTxRxLoopback.slx`) carries hard-coded sample-time
  expectations on its wrapper blocks (RT_I, RT_Q, RT_valid, Switch,
  TxSourceControl, Channel). Variants that change the Rx-internal rate
  (e.g. by setting `UpsamplesRx=1` for a 2× rate) trigger data-integrity
  errors at update-diagram time between the wrapper blocks at 7.68 MHz
  and the Receiver inports at 15.36 MHz.
- The Receiver / Transmitter subsystems themselves carry SPS-dependent
  mask expressions in two `HDL Counter` blocks (`Rate Handle` inside the
  symbol synchronizer; `Data Bits FIFO` inside the bit packetizer). At
  SPS=2 these collapse to a 0-bit counter (`nextpow2(SPS-1) = 0`). The
  `max(1, ...)` patch in `variant_pre.m` is enough to get the mask
  initialization through, but the algorithm semantics at SPS=2 still
  needs review (the `Bit Packetizer` 2:1 interleaver becomes degenerate).
- For 2× bandwidth without touching SPS, the easiest path is V3
  (SPS=4, Rsym=3.84M, Urx=1, Utx=1) — all rates land cleanly on the
  15.36 MHz ADC clock without composite-wrapper mismatch.

See [[qpsk-bandwidth-ceiling]] memory for the prior architectural-ceiling
investigation that this work re-opens.
