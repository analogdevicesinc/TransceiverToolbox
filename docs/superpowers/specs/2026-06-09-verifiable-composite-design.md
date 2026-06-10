# Verifiable Composite: FPGA-deployed QPSK modem to <0.01% BER over the RF cable

**Date:** 2026-06-09
**Status:** Approved
**Goal:** A fully FPGA-deployed QPSK modem (HDL Tx + HDL Rx, no host DSP in the loop) whose
on-board BIST measures `errors / (packets x 120 checked bits) < 0.01%` over the physical
ADRV9002 -> cable -> ADRV9002 RF path, sustained over >= 1M checked bits.

## Context

The host-first investigation (June 2026) proved two things definitively:

1. **The RF path and the QPSK receiver algorithm are correct.** A host-side modem
   (`QPSKRxChainTest.genTxWaveform` -> ADRV9002 Tx DMA -> cable -> Rx DMA ->
   `demodPlutoCapture`) over the stock `jupiter_sdr` reference design decodes the loopback at
   **0.00000% BER over 34,200 checked bits** (EVM 0.028, capture image rejection 75.9 dB).
2. **The deployed HDL design fails for integration reasons, not algorithmic ones**, and the
   failures are now precisely characterized:
   - **Architecture gap:** no existing build provides both host-Tx->DAC *and*
     ADC->HDL-Receiver. The composite (`TxRxComposite` DUT) feeds its Receiver only because
     the DUT bundles a rate-bridging wrapper (Repeat/RateTransition/MUX + validIn handling);
     its DAC is owned by the in-FPGA Transmitter. Bare `DUT=Receiver` builds receive zero ADC
     valids (`count_out = 0`) under both `txrx` (DUT clocked on the inactive Tx clock domain)
     and `rxtx` reference designs.
   - **Sim/HW divergence:** the composite's internal loopback reads 0% BER in simulation and
     7.27% on hardware (timing/metastability class: WHS ~6 ps, 9 CDC warnings); the cable
     path through the in-FPGA Tx historically reads 1.37% (best) to ~50% (typical).
   - **Broken observability:** on custom builds, host RX-DMA captures are I/Q-corrupted (one
     axis collapsed; a known-clean in-FPGA signal captures identically corrupted), bit-rate
     debug captures alias, and ILA is blocked. The stock build captures cleanly, proving the
     pack/DMA chain itself is sound -- the corruption is a generated-BD wiring defect.
   - **Board fragility:** runtime ADRV9002 profile loads error and wedge the board (physical
     power-cycle required). The composite-lineage builds boot at 15.36 MHz by default, and
     `adi.ADRV9002.Tx` preserves that rate, so no profile loads are needed.

This design closes the gaps with one re-architected composite ("Verifiable Composite") whose
every verification experiment after the build is a runtime register write, not a rebuild.

## Decisions (fixed by prior evidence)

- **Rate:** UpsamplesRx=2, radio at 15.36 MHz (8 sps at Rsym = 1.92 MHz). The only
  combination where ADC data demonstrably reaches the HDL Receiver. Boot-default profile for
  these builds is 15.36 MHz; **no runtime profile loads, ever**.
- **Base structure:** the proven composite wrapper from `build_composite_local.m`
  (`tools/make_composite_variant_kit.sh` lineage), reference design `jupiter_sdr`,
  `ref_design='rxtx'`, `multiple=1`, `GenerateIPCoreReport=false`.
- **Success metric:** deployed BIST over the cable, < 0.01% of checked bits, >= 1M bits.

## Architecture

New model `commhdlQPSKTxRxVerif` (a composite variant; DUT = `TxRxComposite`-style wrapper):

```
                          tx_source_select (AXI x"118")
  host TX DMA --upack-->--+
  (IP Data ... IN)        |-- DAC MUX --> tx_dataOutI/Q --> DAC --> RF cable
  in-FPGA Transmitter -->-+                                          |
         | (REP upsample, unchanged)                                 v
         +--> internal branch                                       ADC
                   |                                                 |
  rx_input_select -+- MUX (AXI x"114", existing) -> RateTransition -> QPSK Rx -> BIST
                   ^ cable branch -----------------+                   (x"100/104/108")
  adc_dataInI/Q ---+--> raw-ADC passthrough --> IP Data 0..3 OUT --> host RX DMA (capture)
```

Three additions to the proven composite; everything else is unchanged:

1. **DAC-source MUX** -- new AXI4-Lite register `tx_source_select` at x"118"
   (0 = in-FPGA Transmitter, 1 = host TX DMA). Host samples enter the DUT through the
   reference design's TX-DMA-input interfaces (`IP Data ... IN` / util_upack), which the
   composite previously did not consume. The MUX drives `tx_dataOutI/Q` (mapped to
   `ADRV9002 DAC Data I0/Q0`) and the `tx_validOut` / `IP Load Tx Data OUT` logic.
2. **Raw-ADC -> host-DMA passthrough with the capture-path fix** -- route `adc_dataInI/Q`
   (+ valid) to DUT outports mapped to the RX-DMA interfaces, driving **all four**
   `util_adc_1_pack` inputs (I0, Q0, I1, Q1) so the pack/enable wiring matches the stock
   design's. The generated `system.bd` wiring is verified against the stock BD **before
   synthesis**.
3. **Retained controls:** BIST (`count_out` x"100", `packets_out` x"104", `bit_errors_out`
   x"108"), `iq_debug_mux` x"10C", `rstCS` x"110", `rx_input_select` x"114".

### Design assumptions to verify first (M0, no hardware)

- **A1:** the JUPITER reference design exposes TX-DMA-input interfaces an HDL Coder DUT
  inport can map to (check `CI/scripts/ports.json` and `matlab_processors.tcl`; the
  composite's "DMA upack was deleted" note suggests the path exists and was dropped because
  no inport consumed it). If A1 fails, fallback: keep the DAC MUX but source "host Tx" from
  a BRAM/DDS playback block loaded over AXI -- same verification capability, more logic.
- **A2:** the custom-build capture corruption is reproducible as a pack/enable wiring
  difference visible by diffing the generated `system.bd` against the stock
  `jupiter_sdr` BD (`util_adc_1_pack` connections and enables). If the diff shows nothing,
  fall back to validating the fix empirically at stage 0 before relying on captures.

## Staged verification (one bitstream, all runtime-selectable)

| stage | tx_source | rx path | proves | tool |
|---|---|---|---|---|
| 0 | host (complex tone) | passthrough capture | capture path clean: image rejection > 40 dB | `host_tone_test.m` pattern |
| i | host (golden QPSK) | cable -> HDL Rx BIST | deployed receiver decodes a known-good input < 0.01% | BIST + `phase2b_count.m` |
| ii | FPGA Tx | cable -> host capture -> golden decode | deployed transmitter signal decodes < 0.01% | `demodPlutoCapture.m` |
| iii | FPGA Tx | cable -> HDL Rx BIST | **success criterion** < 0.01% over >= 1M checked bits | BIST |
| reg | FPGA Tx | internal loopback | regression vs the 7.27% baseline | BIST |

Pre-build gate: the new wrapper must simulate at 0% BER in both internal and host-injection
modes (existing sim testbench lineage, `sim_internal_baseline_TB.slx`).

Host golden tools (all existing, validated): `genTxWaveform` (8 sps @ 15.36 via
`resample(w4,2,1)`), `demodPlutoCapture` (0% with 20 kHz CFO @ 20 dB), `confirm_host_ber.m`,
`host_tone_test.m`, `phase2b_count.m`.

## Failure isolation rules

- **Stage 0 fails:** capture wiring still wrong -- fix in the generated BD (compare stock);
  do not proceed on corrupted captures.
- **Stage i fails:** capture exactly what the Rx saw (passthrough), decode the same capture
  with the host golden, and replay it through the sim testbench (`RxCaptureFromHW` input
  exists). The divergence becomes a specific observable receiver stage; apply targeted
  CDC/timing fixes and rebuild.
- **Stage ii fails:** the captured FPGA-Tx signal is directly characterizable (EVM, spectrum,
  CFO) -- the historical in-FPGA-Tx delivery defect becomes visible and fixable.
- **Stage iii fails after i and ii pass:** a Tx+Rx simultaneous-operation interaction;
  attack with both observability tools live (e.g., per-stage timing constraints).
- **Operational:** no runtime profile loads (board wedge); `rstCS` only for internal mode
  (it breaks cable re-acquisition); timing-met gate on every build; physical power-cycle is
  the documented last resort.

## Milestones

- **M0** -- verify A1 + A2 from the repo and generated/stock BDs. No hardware, no build.
- **M1** -- build the Verifiable Composite (kit-based on `/mnt/onetb`, ~90 min), deploy
  (`/mnt/onetb/deploy_boot.sh`), pass stage 0.
- **M2** -- stage i: deployed HDL Rx proven on the golden input.
- **M3** -- stage ii: deployed HDL Tx proven by host decode.
- **M4** -- stage iii: sustained < 0.01% over >= 1M checked bits. Done.

Iteration between milestones uses runtime switches and captures; rebuilds happen only when a
stage isolates a fix that requires HDL changes.

## Key files

- Build lineage: `trx_examples/targeting/QPSKTxRxHDLExample/tools/make_composite_variant_kit.sh`
  (embedded `build_composite_local.m`), `hdlworkflow_loopback.m` (rxtx ref design + AXI map).
- Ref-design integration: `CI/scripts/matlab_processors.tcl`, `CI/scripts/ports.json`.
- Stock comparison: `/mnt/onetb/hdl_stock/projects/jupiter_sdr/` (clean BD + working BOOT.BIN
  at `boot_pkg/BOOT.BIN`, md5 875fde2b).
- Host golden tools: `demodPlutoCapture.m`, `QPSKRxChainTest.m`, `host_loopback.m`,
  `host_tone_test.m`, `confirm_host_ber.m`, `phase2b_count.m`.
- Deploy: `/mnt/onetb/deploy_boot.sh`; board `root@10.0.0.146` (pw `analog`), boots 15.36 MHz
  on composite-lineage BOOT.BINs; backups at `/boot/BOOT.BIN.composite.bak` and
  `/mnt/onetb/scratch/boot_backups/`.
