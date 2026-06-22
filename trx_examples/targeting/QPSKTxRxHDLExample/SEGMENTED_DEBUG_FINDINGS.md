# Segmented debug of the QPSK Tx/Rx DSP — source of the loss-of-lock "artifact"

This documents a stage-by-stage debug of the long-standing QPSK error
("~7% / ~2% / ~14%" depending on build) on the ADRV9002 ZedBoard byte-DMA
modem (deployed multiple=2 build, `BOOT.BIN` md5 `c8673d15`, stock 1.92 MHz
SSI / 240 ksym profile).

## What the errors actually are

Bit-exact capture of the recovered byte stream (internal loopback, fixed
cyclic payload, per-byte majority-vote reference) shows the errors are **not**
per-bit decode noise:

- **~85% of packets decode PERFECTLY** (0 byte errors).
- The rest are **whole-packet garbage** (i.i.d.-random from byte 0 = frame-sync
  loss), in **contiguous blocks**.
- The loss-of-lock recurs with a **deterministic ~100-packet period**
  (garbage-block start spacing clusters on 99–100). Most events last 1 packet;
  occasionally one cascades into a ~95-packet block. The two large blocks held
  191 of 209 garbage packets in a 1500-packet capture.

So when locked the modem is flawless; periodically it **loses frame lock** for a
block of packets, then re-acquires.

## Segmentation — where the error is and is NOT

Each cut isolates a layer by changing exactly one thing:

| Cut | Measurement | Result | Conclusion |
|---|---|---|---|
| Host-capture path vs on-chip | on-chip BIST (0x104/0x108), no host DMA | shows the same loss | **not** a host DMA-capture artifact — it's on-chip |
| Data source | internal generator (tx_data_source=0) vs byte-DMA (=1) | both ~15% loss | **not** the byte serializer / Tx byte FIFO |
| Loopback path | **internal (rx_input_select=0)** vs **cable (rx_input_select=1)** | internal **16.8%** vs cable **0.0%** | **the error is specific to the internal-loopback path** |

The cable/RF path exercises **every Tx and Rx DSP stage** (scrambler, QPSK mod,
RRC, AGC, symbol sync, carrier sync, matched filter, demod, frame sync,
descrambler) and decodes arbitrary host data at **0%** — so **no Tx or Rx DSP
stage is the source**.

## Root cause (RTL)

`TxRxCompo_ip_src_TxRxComposite.v`:

```verilog
assign IntValidConst_out1 = 1'b1;                              // internal valid = always high
assign MUX_RxValid_out1 = (rx_input_select==0 ? IntValidConst_out1 : RxValidConst_out1);
// internal: Rx data = REP_TxI/Q  (ZOH-upsampled Tx, exact integer samples/symbol)
// external: Rx data = AdcCap S/H of adc_dataIn (real ADC sample with analog fractional delay)
```

On the internal path the Rx is fed the **ZOH-upsampled Tx with exactly zero
fractional timing offset** and valid permanently high. A perfectly
sample-aligned signal is the degenerate operating point for the Rx
symbol-timing-recovery loop — it has no fractional timing error to track, so it
drifts and periodically **cycle-slips**, which destroys frame alignment for a
block of packets. The real RF path always carries an analog fractional delay,
which gives timing recovery a proper error signal → it locks → **0%**.

## Fixes

1. **Real link (implemented + verified).** Use the RF path
   (`rx_input_select=1`). This is already the default in `qpsk_net_setup.sh`
   (Tx atten 0 dB + Rx AGC). Verified: arbitrary byte-DMA data over the
   DAC→cable→ADC path decodes at **0.00000%** over a multi-iteration soak
   (`qpsk_capture <N> 280 out.bin 42 1`). The earlier "<0.01% over 1M blocked"
   measurements had used the *internal* path (`rxsel=0`) — the wrong one.

2. **Internal-loopback self-test (single-board, no cable) — proposed, not yet built.**

   *Why the fix can only be HW-validated:* a long functional simulation does
   **not** reproduce the artifact. Driving the internal loopback (rx_input_select=0,
   internal generator) past the ~49-packet gate window hits a Tx Bit-Packetizer
   "Data Bits FIFO" assertion at a fixed sim time (0.0507503 s) — a sim-pacing
   artifact of the fabricated `adc_validIn` rate, identical for the *external*
   harness too. The functional RTL is correct (matches every prior "sim = 0% /
   HDL cosim = 0%"); the artifact is a **physical marginal-stability / rate-beat
   effect on the degenerate internal-loopback signal** that no functional sim or
   RTL cosim exposes. The HW internal-loopback measurement (`qpsk_capture N 280
   out.bin SEED 0`, ~14% garbage) is therefore the only available failing test.

   *Injection point (verified):* `REP_TxI_out1_1` feeds **both** the internal Rx
   (`MUX_RxI`, `TxRxComposite.v:690`) **and** the DAC (`MUX_DacI`, :1058). To
   avoid touching the proven cable Tx, inject only on the **`MUX_RxI/MUX_RxQ`
   output gated by `rx_input_select==0`** (model Switch blocks `MUX_RxI`,
   `MUX_RxQ` in `TxRxComposite`; or Verilog lines 690/800 post-codegen on all
   four copies).

   *Candidate fixes to build as parallel variants* (each is a ~2 h synth+impl and
   HW-validate-only; build on the host while a soak runs on the board):
   - **dither** — add a small (±1–2 LSB on sfix16, ≈ −78 dBFS) LFSR/PN dither to
     the internal Rx samples. Breaks timing-recovery degeneracy regardless of
     placement; negligible SNR cost. Highest-confidence single fix.
   - **fractional delay** — a true half-sample (Farrow/2-tap) delay at the Rx
     *input* rate (not on `REP_Tx`, which is downsampled away) to mimic the
     cable's analog fractional offset.
   - **rate-match** — route the internal branch through the same gap-2-valid /
     `AdcCap` S-and-H structure the external path uses, so the internal rate
     structure matches the (working) external one.

   Lower priority than the real link, which is unaffected and verified.

## Operating notes

- ZedBoard byte modem: `MODEM_BASE 0x43C00000`; BIST `0x104` packets / `0x108`
  bit_errors (internal-gen "ADI Hello World" reference, 120 checked bits/pkt);
  write-only `0x114` rx_input_select / `0x118` tx_source_select /
  `0x11C` tx_data_source; `0x000` soft reset (reset FIRST, then the selects).
- **RX byte-DMA capture buffer is only 512 KB** (`RX_BUF 0x1FF80000` to DDR end
  `0x20000000`): capture **≤ 1800 packets** of 280 B per transfer, or it
  overruns kernel RAM and wedges the board.
