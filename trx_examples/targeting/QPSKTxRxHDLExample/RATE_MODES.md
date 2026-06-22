# Rate-scalable QPSK modem — CMOS (ZedBoard) and LVDS (Jupiter) modes

The QPSK modem model (`commhdlQPSKTxRxLoopback` / DUT `TxRxComposite`) is
**bit-identical** for both the CMOS ADRV9002 ZedBoard and the LVDS Jupiter
reference designs. It decodes the *same* 7.68 MHz / 4-samples-per-symbol signal
in both. A single selector — `qpsk_rate_mode_config.m` — captures the small set
of integration differences so one codebase supports both platforms.

## Selecting a mode

```matlab
setappdata(0, 'QPSK_RATE_MODE', 'cmos');     % ZedBoard ADRV9002 (default)
setappdata(0, 'QPSK_RATE_MODE', 'jupiter');  % Jupiter LVDS
```

The build scripts (`hdlworkflow_zed.m`, `build_variant_zed.m`) read it via
`qpsk_rate_mode_config()` and expand it into the reference design, the
Fast-slow clock ratio, and the rate-scaled CFC window. Default is `cmos`, so
existing ZedBoard builds are unchanged.

## What differs between modes (and what does not)

| Element | CMOS (ZedBoard) | LVDS (Jupiter) | How it is set |
|---|---|---|---|
| Reference design | `ADRV9002 ZED (RX & TX, BYTE DMA)` | `JUPITER (RX & TX ...)` | config → `hdlset_param ReferenceDesign` |
| IPCORE / model-base clock | 30.72 MHz | 15.36 MHz | the chosen RD (`adc_1_clk`) |
| Rx decode divider | `enb_1_4` (clk/4) | `enb_1_2` (clk/2) | **auto-generated** by HDL Coder from `IPCORE_clk / 7.68 MHz` — not a parameter |
| `multiple` (Fast-slow clock ratio) | **2** (30.72→15.36 Tx-output crossing) | **1** (1:1) | config → `ReferenceDesignParameter` → `sync_fast_to_slow` RATIO |
| `integAvgLen` (CFC window) | `2^12` at the 240 ksym stock profile | `2^15` | config, scaled `2^15 / rateRatio` to hold the CFO-tracking *time* constant |
| SPS, RRC, AGC, CSBnXTsamp, SSBnXTsamp, CFOChangeDetectThreshold, preamble threshold, SearchSamples | **identical** | **identical** | symbol-rate-normalized / structural — never scale with absolute rate |

Notes:
- The **Rx-input** `sync_slow_to_fast` is a plain clock-domain-crossing FIFO
  with no RATIO; it is correctly `multiple=1` in both modes (it is *not* the
  rate-matcher — only the **Tx-output** `sync_fast_to_slow` uses `multiple`).
- `integAvgLen` is the *only* rate-scaled model parameter. It is a sample
  count: at a lower symbol rate the same count spans more time, so it is
  divided by the rate ratio. Set `setappdata(0,'QPSK_CMOS_RSYM', 1.92e6)` to
  build the CMOS path for a (future) 15.36 MHz-SSI design-rate profile, which
  reverts `integAvgLen` to `2^15` (= Jupiter).

## Known CMOS-stock-rate limit

The stock CMOS ADRV9002 profile runs the SSI at 1.92 MHz → **240 ksym, 8× below
the 1.92 Msym design rate** (no design-rate CMOS profile matched to the board
API exists). At that 8×-low operating point the modem decodes arbitrary data at
**0.00000% in clean windows**, but its lock *convergence* is bimodal — only
~10% of acquisitions settle clean; ~90% settle to a degraded ~2% steady state —
giving ~1% aggregate, not <0.01%. This is a rate-beat / clock-enable
**integration artifact tied to the 8×-low operating point**, not a model bug
(the model simulates at 0%). Running CMOS at the design symbol rate (a
15.36 MHz-SSI profile) removes it; the parameterization above already supports
that via `QPSK_CMOS_RSYM`.
