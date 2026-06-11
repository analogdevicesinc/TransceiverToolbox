# Diagnostic archive

One-off investigation scripts from the QPSK deployed-link debugging campaign
(2025-2026). Kept for forensic reference; none are needed to build, verify,
or operate the Verifiable Composite. The operational entry points live one
directory up:

- `../../stages_final.m` / `../../stage1_sustained.m` -- staged verification
  with the mandatory soft-reset measurement procedure.
- `../sim_internal_gate.m`, `../../sim_vq_gate.m` -- pre-build sim gates.
- `test/QPSKDeployedLinkTests.m` (repo test dir) -- hardware acceptance
  suite (CFO/gain envelopes, acquisition reliability, soak).

Highlights of what these scripts established, in rough order: I/Q lane-order
fix, valid-qualified front-end, soft-reset acquisition procedure (the key:
reset clears the register file, select the input mux AFTER reset), cable BER
0.000000% sustained, and the characterization of the BIST-on-FPGA-Tx
self-test artifact (waveform-independent; see project memory notes).
