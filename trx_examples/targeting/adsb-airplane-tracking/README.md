# ADS-B Airplane Tracking on ADRV9361-Z7035

Receives 1090 MHz ADS-B (Mode S extended squitter) transmissions from
aircraft, detects and CRC-validates the frames in FPGA fabric, and decodes
them in MATLAB.

The detector is ported from the MathWorks HDL Coder example *Airplane
Tracking with ADS-B Captured Data* (`HDLRx` subsystem), retargeted from
captured-data simulation to a live receiver on the ADRV9361-Z7035.

## Files

| File | Purpose |
| --- | --- |
| `adsb_rx_targeting.slx` | Targeting model. The `HDL_DUT` subsystem is what becomes fabric. |
| `hdlworkflow.m` | HDL Workflow Advisor script — generates the IP core and builds `BOOT.BIN`. |
| `initScript.m` | Model `InitFcn`; sets up detector constants. |
| `run_adsb.m` | Live receiver: tunes the board, streams frames, prints and plots aircraft. |
| `adsbFrameConstants.m` | Frame-stream contract shared by model, host script, and hardware test. |
| `extractADSBFrames.m` | Recovers squitter bits from the DUT's frame-stream channel. |
| `decodeADSBFrames.m` | Decodes squitters into callsign / altitude / velocity / position fields. |
| `cprGlobalPosition.m` | Resolves latitude and longitude from an even/odd frame pair. |
| `adsbCRC.m` | Mode S 24-bit parity. |
| `genADSBWaveform.m` | Synthesizes a squitter as a PPM waveform — loopback stimulus for the hardware test. |

## Building

Vivado 2025.1 and the ADI HDL BSP (`make -C CI/scripts build`) are required.

```matlab
cd trx_examples/targeting/adsb-airplane-tracking
hdlworkflow
```

This produces `hdl_prj/vivado_ip_prj/boot/BOOT.BIN`.

## Running

Boot the ADRV9361-Z7035 from that `BOOT.BIN` — the stock HDL image has no
ADS-B detector and will return no frames — attach a 1090 MHz antenna, then:

```matlab
tracks = run_adsb('uri','ip:analog.local','Duration',120);
```

## How it works

The DUT sits inline between the AD9361 ADC FIFO and the ADC packer:

- Channels 1/2 of the receive buffer carry the raw baseband, passed straight
  through, so the signal remains visible to the host.
- Channels 3/4 carry the frame stream: a `0x5AA5` marker word followed by
  seven 16-bit words holding a CRC-valid 112-bit squitter, zero-filled
  between frames.
- AXI4-Lite registers carry the correlation threshold and enable in, and
  preamble-detection / CRC-pass counters out.

The output valid strobe is a pass-through of the input strobe rather than
being asserted only on detected frames. Gating it on detection would leave
the DMA buffer unfilled until enough aircraft happened to pass overhead,
blocking the host read for minutes or indefinitely.

The AD9361 must be run at **4 MSPS** — the detector consumes one sample per
valid strobe and its correlation timing assumes four samples per 1 Mbps PPM
symbol.

Both RF channels must be enabled. The frame stream rides `fifo_wr_data_2/3`,
which the ADC packer only carries when the second channel is active; on a
single-channel configuration the frame channel does not reach the DMA at all
and the receiver sees no frames even though the detector is working.

## Testing

- Build regression: `DemoTests.buildHDLADSB`.
- Hardware: `DeployedADSBTests`, run through the labgrid HW-CI path
  (`test/hw_ci/board_map.yaml`, `.github/workflows/hw-matlab.yml`). It
  transmits a known squitter through AD9361 digital loopback and asserts
  bit-exact recovery, so the result does not depend on live air traffic. It
  filters itself out when the ADS-B design is not the deployed image.

## Attribution

The detection algorithm derives from a MathWorks shipping example. Confirm
redistribution terms before publishing this folder.
