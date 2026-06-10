# Verifiable Composite Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** An FPGA-deployed QPSK modem (HDL Tx + HDL Rx) whose on-board BIST measures < 0.01% of checked bits over the physical ADRV9002→cable→ADRV9002 RF path, sustained over ≥ 1M checked bits.

**Architecture:** One re-architected composite (`TxRxComposite` DUT lineage) with a runtime DAC-source MUX (in-FPGA Tx or host TX DMA via `IP Data 0/1 IN`), a raw-ADC→host-DMA capture passthrough, and the existing BIST — all verification stages selectable by AXI register writes on a single bitstream. Spec: `docs/superpowers/specs/2026-06-09-verifiable-composite-design.md`.

**Tech Stack:** MATLAB R2025b (`/mnt/onetb/MATLAB/R2025b/bin/matlab -batch`), Simulink + HDL Coder IP Core Generation, Vivado 2025.1 (`source /tools/Xilinx/2025.1/Vivado/settings64.sh`), ADI jupiter_sdr reference design (`ref_design='rxtx'`), board `root@10.0.0.146` (password `analog`).

---

## ROOT CAUSE RESOLVED AT PLAN TIME (supersedes spec assumptions A1/A2)

**A1 (TX-DMA-in interfaces): CONFIRMED.** `hdl/vendor/AnalogDevices/+AnalogDevices/ports.json` (jupiter) defines DUT-input interfaces `IP Data 0 IN`…`IP Data 3 IN` (= `sync_input/data_out_tx_0..3`, the util_dac_1_upack stream) and `IP Valid Tx Data IN` (= `sync_input/data_valid_out_tx_0`).

**A2 (capture corruption): ROOT CAUSE FOUND — an I/Q lane-order bug in `CI/scripts/matlab_processors.tcl`.** The plugin interface names assume IQ-pair lane order (lane0=i0, lane1=q0, lane2=i1, lane3=q1 — matching the stock design's pack/upack wiring, `/mnt/onetb/hdl_stock/projects/jupiter_sdr/system_bd.tcl:465-505`), but the `jupiter_sdr` block of `matlab_processors.tcl` wires the lanes channel-major (i0, **i1**, **q0**, q1) on both the ADC→sync side (lines 837-838) and the sync→DAC side (lines 862-863). Consequences in every custom build to date:

- DUT inport mapped to `ADRV9002 ADC Data Q0` (lane 1) received `adc_1_data_i1` — **channel 2's I, i.e. silence**. The HDL Receiver never saw the Q axis.
- DUT outport mapped to `ADRV9002 DAC Data Q0` (lane 1) drove `dac_1_data_i1`; the real `dac_1_data_q0` (lane 2) was undriven. The transmitted cable signal had **Q = 0**.
- Host captures inherited the same swap (pack slot 1 = i1 = silence → "dead Q" captures).

This one fix is why the cable path read ~50% BER for six rounds, why no constellation transform helped (the information was physically absent), and why simulation never reproduced it (the bug exists only in generated block-design wiring). The `adrv9001`/zcu102 block (lines 753-754, 778-779) has the same bug; it is out of scope here (different board, no hardware to verify) — noted, not changed.

## Operational rules (hard-won; apply to every hardware task)

- **Never load ADRV9002 profiles at runtime** (`EnableCustomProfile`) — it errors and wedges the board (physical power-cycle). Composite-lineage builds boot at 15.36 MHz by default; `adi.ADRV9002.Tx` preserves that rate.
- Set the Rx LO board-side via sysfs (`echo 2400000000 > /sys/bus/iio/devices/iio:device2/out_altvoltage0_RX1_LO_frequency`), never via an `adi.ADRV9002.Rx` object property change on custom builds if avoidable (the Rx object is safe for DMA capture; it must NOT set a custom profile).
- `rstCS` (x"110") only in internal-loopback mode; it breaks cable re-acquisition.
- Deploy with `bash /mnt/onetb/deploy_boot.sh <BOOT.BIN>`; builds run in kits under `/mnt/onetb/scratch/qpsk_variants/` (main disk is nearly full).
- Every build must pass the timing gate (`grep -i "timing constraints met" build.log`).
- If the board becomes unreachable > 5 min, ask the user for a power-cycle; arm an auto-resume watcher.

## AXI register map (final)

| addr | reg | dir | meaning |
|---|---|---|---|
| x"100" | count_out | R | bits processed |
| x"104" | packets_out | R | packets detected |
| x"108" | bit_errors_out | R | errors in first 120 bits/packet |
| x"10C" | iq_debug_mux | W | Receiver debug tap select (0-3) → debugI1/Q1 |
| x"110" | rstCS | W | carrier-sync reset (internal mode only) |
| x"114" | rx_input_select | W | 0=internal Tx loopback, 1=cable ADC |
| x"118" | tx_source_select | W | 0=in-FPGA Tx, 1=host TX DMA |

Base address `0x9D000000`; read with `busybox devmem 0x9D0001xx` over ssh (helper `BistRegisters.read/sshExec` on the MATLAB path in `trx_examples/targeting/QPSKTxRxHDLExample`).

---

### Task 1: Fix the I/Q lane-order bug in the jupiter_sdr integration

**Files:**
- Modify: `CI/scripts/matlab_processors.tcl:837-838,862-863` (the `jupiter_sdr` block — 4-tab indented lines only; do NOT touch the 6-tab `adrv9001`/zcu102 copies)

- [ ] **Step 1: Apply the lane swap (RX side: lane1↔lane2 right-hand sides)**

Run this exact script (uses a placeholder token so the two replacements don't collide; targets only the 4-tab jupiter_sdr lines):

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
python3 - <<'EOF'
p='CI/scripts/matlab_processors.tcl'
s=open(p).read()
T='\t\t\t\t'  # 4 tabs = jupiter_sdr block
pairs=[
 (T+'connect_bd_net [get_bd_pins sync_input/data_in_rx_1] [get_bd_pins axi_adrv9001/adc_1_data_i1]',
  T+'connect_bd_net [get_bd_pins sync_input/data_in_rx_1] [get_bd_pins axi_adrv9001/adc_1_data_q0]'),
 (T+'connect_bd_net [get_bd_pins sync_input/data_in_rx_2] [get_bd_pins axi_adrv9001/adc_1_data_q0]',
  T+'connect_bd_net [get_bd_pins sync_input/data_in_rx_2] [get_bd_pins axi_adrv9001/adc_1_data_i1]'),
 (T+'connect_bd_net [get_bd_pins sync_output/data_out_tx_1] [get_bd_pins axi_adrv9001/dac_1_data_i1]',
  T+'connect_bd_net [get_bd_pins sync_output/data_out_tx_1] [get_bd_pins axi_adrv9001/dac_1_data_q0]'),
 (T+'connect_bd_net [get_bd_pins sync_output/data_out_tx_2] [get_bd_pins axi_adrv9001/dac_1_data_q0]',
  T+'connect_bd_net [get_bd_pins sync_output/data_out_tx_2] [get_bd_pins axi_adrv9001/dac_1_data_i1]'),
]
# two-phase replace with tokens to avoid collisions
for i,(old,new) in enumerate(pairs):
    assert s.count(old)==1, f'pattern {i} count={s.count(old)}'
    s=s.replace(old, f'@@TOKEN{i}@@')
for i,(old,new) in enumerate(pairs):
    s=s.replace(f'@@TOKEN{i}@@', new)
open(p,'w').write(s)
print('lane swap applied')
EOF
```

Expected: `lane swap applied` (assertions guarantee each pattern matched exactly once).

- [ ] **Step 2: Verify the corrected wiring**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
grep -nE "data_in_rx_[123]\]|data_out_tx_[123]\]" CI/scripts/matlab_processors.tcl | grep -E "^8[0-9]{2}:"
```

Expected (jupiter_sdr block, lines ~837-838 and ~862-863):
```
837: ... sync_input/data_in_rx_1] ... adc_1_data_q0]
838: ... sync_input/data_in_rx_2] ... adc_1_data_i1]
862: ... sync_output/data_out_tx_1] ... dac_1_data_q0]
863: ... sync_output/data_out_tx_2] ... dac_1_data_i1]
```
(line numbers may drift ±2; the i/q assignments are what matters). Lines `data_in_rx_3`/`data_out_tx_3` (q1) and `_0` (i0) unchanged.

- [ ] **Step 3: Commit**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
git add CI/scripts/matlab_processors.tcl
git commit -m "fix: jupiter_sdr I/Q lane order in HDL Coder integration

matlab_processors.tcl wired the sync lanes channel-major (i0,i1,q0,q1) while
the plugin interface names and the stock jupiter_sdr pack/upack assume IQ-pair
order (i0,q0,i1,q1). Every custom build's DUT therefore received silence on
'ADRV9002 ADC Data Q0' and drove 'DAC Data Q0' onto channel-2 I -- the root
cause of the ~50% cable BER and the dead-Q host captures. adrv9001/zcu102
block has the same issue (out of scope, different board)."
```

### Task 2: Verifiable Composite overlay (DAC MUX + raw-ADC passthrough + new AXI reg)

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/tools/variant_pre_composite_verif.m`

The overlay runs inside a kit after `build_composite_local.m` has built `commhdlQPSKTxRxLoopback.slx` with the `TxRxComposite` subsystem (inports 1-6: `adc_validIn`, `adc_dataInI`, `adc_dataInQ`, `rstCS`, `iq_debug_mux`, `rx_input_select`; outports incl. `tx_dataOutI/Q`, `tx_validOut`, `debugI/Q/Valid`, `debugI1/Q1`; internal blocks `REP_TxI/Q/Valid`, `MUX_RxI/Q/Valid`, `Receiver`, `Transmitter`).

- [ ] **Step 1: Write the overlay**

```matlab
% variant_pre_composite_verif -- the Verifiable Composite:
%  (1) DAC-source MUX: tx_source_select (AXI x"118") picks in-FPGA Tx (0) or
%      host TX DMA (1) as the DAC driver. Host samples arrive via the ref
%      design's 'IP Data 0/1 IN' (util_dac_1_upack stream into the DUT).
%  (2) Raw-ADC passthrough: debugI/Q/Valid carry adc_dataInI/Q/validIn to the
%      Rx DMA ('IP Data 0/1 OUT') for trustworthy host capture. debugI1/Q1
%      keep the Receiver's iq_debug_mux taps (-> 'IP Data 2/3 OUT').
% Requires the Task-1 lane-order fix in CI/scripts/matlab_processors.tcl.
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];
ff = {'SearchDepth',1};

% --- (1a) new inports 7..10 ---
in_new = { 'host_txI','int16'; 'host_txQ','int16'; ...
           'host_txValid','boolean'; 'tx_source_select','uint32' };
for k = 1:size(in_new,1)
    blk = [loop '/' in_new{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(6+k), ...
        'Position', [40 820+40*k 70 840+40*k]);
    set_param(blk, 'OutDataTypeStr', in_new{k,2}, 'SampleTime', '1/15.36e6');
end
% tx_source_select arrives uint32; switches compare u2 ~= 0 directly.

% --- (1b) DAC MUX: re-route REP_TxI/Q -> tx_dataOutI/Q through switches ---
delete_line(loop, 'REP_TxI/1', 'tx_dataOutI/1');
delete_line(loop, 'REP_TxQ/1', 'tx_dataOutQ/1');
add_block('built-in/Switch', [loop '/MUX_DacI'], 'Criteria','u2 ~= 0', ...
    'Position',[700 860 730 890]);
add_block('built-in/Switch', [loop '/MUX_DacQ'], 'Criteria','u2 ~= 0', ...
    'Position',[700 910 730 940]);
% u1 = host (selected when tx_source_select ~= 0), u3 = in-FPGA Tx
add_line(loop, 'host_txI/1',          'MUX_DacI/1', 'autorouting','on');
add_line(loop, 'tx_source_select/1',  'MUX_DacI/2', 'autorouting','on');
add_line(loop, 'REP_TxI/1',           'MUX_DacI/3', 'autorouting','on');
add_line(loop, 'host_txQ/1',          'MUX_DacQ/1', 'autorouting','on');
add_line(loop, 'tx_source_select/1',  'MUX_DacQ/2', 'autorouting','on');
add_line(loop, 'REP_TxQ/1',           'MUX_DacQ/3', 'autorouting','on');
add_line(loop, 'MUX_DacI/1', 'tx_dataOutI/1', 'autorouting','on');
add_line(loop, 'MUX_DacQ/1', 'tx_dataOutQ/1', 'autorouting','on');
% tx_validOut stays driven by REP_TxValid (constant DAC-rate strobe; it is the
% upack fifo_rd_en via 'IP Load Tx Data OUT' and must run in BOTH modes).
% host_txValid is consumed (terminated) to keep the interface mapped.
add_block('built-in/Terminator', [loop '/T_hostValid'], 'Position',[700 990 720 1010]);
add_line(loop, 'host_txValid/1', 'T_hostValid/1', 'autorouting','on');

% --- (2) raw-ADC passthrough on debugI/Q/Valid (Receiver taps stay on I1/Q1) ---
for pp = {{'debugI','adc_dataInI'},{'debugQ','adc_dataInQ'},{'debugValid','adc_validIn'}}
    dst = pp{1}{1}; src = pp{1}{2};
    oc = get_param([loop '/' dst],'PortConnectivity');
    if ~isempty(oc(1).SrcBlock) && isnumeric(oc(1).SrcBlock) && any(oc(1).SrcBlock~=-1)
        sn = get_param(oc(1).SrcBlock,'Name'); sp = oc(1).SrcPort + 1;
        delete_line(loop, sprintf('%s/%d', sn, sp), [dst '/1']);
    end
    add_line(loop, [src '/1'], [dst '/1'], 'autorouting','on');
end
fprintf('verif overlay: model edits done\n');

% --- (3) patch the kit hdlworkflow_loopback.m: new IOInterface mappings ---
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_verif')
    patch = sprintf([ ...
      '%% --- variant_pre_composite_verif mappings ---\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txI'',  ''IOInterface'', ''IP Data 0 IN [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txI'',  ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txQ'',  ''IOInterface'', ''IP Data 1 IN [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txQ'',  ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txValid'', ''IOInterface'', ''IP Valid Tx Data IN'');\n' ...
      'hdlset_param(''%s/TxRxComposite/host_txValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/tx_source_select'', ''IOInterface'', ''AXI4-Lite'');\n' ...
      'hdlset_param(''%s/TxRxComposite/tx_source_select'', ''IOInterfaceMapping'', ''x"118"'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterface'', ''IP Data 2 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ1'',    ''IOInterface'', ''IP Data 3 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ1'',    ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      '%% --- end variant_pre_composite_verif ---\n'], ...
      sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys,sys);
    anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
    idx = strfind(wfTxt, anchor); assert(~isempty(idx), 'anchor not found');
    at = idx(1) + numel(anchor);
    if at <= numel(wfTxt) && wfTxt(at) == newline, at = at + 1; end
    fid = fopen(wfFile,'w');
    fwrite(fid, [wfTxt(1:at-1) newline patch wfTxt(at:end)]); fclose(fid);
    fprintf('verif overlay: hdlworkflow patched\n');
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
```

- [ ] **Step 2: Verify the overlay applies cleanly (kit dry-run, no synthesis)**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
bash tools/make_composite_variant_kit.sh verif variant_pre_composite_verif
KIT=/mnt/onetb/scratch/qpsk_variants/verif
cat > $KIT/verify_overlay.m <<'EOF'
run('build_composite_local.m'); run('variant_pre.m');
loop='commhdlQPSKTxRxLoopback/TxRxComposite';
for b={'host_txI','host_txQ','host_txValid','tx_source_select','MUX_DacI','MUX_DacQ'}
  assert(~isempty(find_system(loop,'SearchDepth',1,'Name',b{1})), ['missing ' b{1}]);
end
oc=get_param([loop '/tx_dataOutI'],'PortConnectivity');
fprintf('tx_dataOutI <- %s\n', get_param(oc(1).SrcBlock,'Name'));   % expect MUX_DacI
oc=get_param([loop '/debugI'],'PortConnectivity');
fprintf('debugI <- %s\n', get_param(oc(1).SrcBlock,'Name'));        % expect adc_dataInI
assert(contains(fileread('hdlworkflow_loopback.m'),'IP Data 0 IN'), 'workflow not patched');
fprintf('OVERLAY OK\n');
EOF
(cd $KIT && /mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('verify_overlay.m')" 2>&1 | tail -5)
```

Expected output ends with: `tx_dataOutI <- MUX_DacI`, `debugI <- adc_dataInI`, `OVERLAY OK`.

- [ ] **Step 3: Commit**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
git add trx_examples/targeting/QPSKTxRxHDLExample/tools/variant_pre_composite_verif.m
git commit -m "feat: Verifiable Composite overlay (DAC-source MUX + raw-ADC passthrough + x118)"
```

### Task 3: Simulation gate (0% BER in both modes before any build)

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/sim_verif_gate.m`

- [ ] **Step 1: Write the sim gate** (drives the kit's `commhdlQPSKTxRxLoopback` root inports via `LoadExternalInput`; BIST outports come back in `yout`)

```matlab
% sim_verif_gate -- run from the verif kit dir. Two cases must decode 0% BER:
%   A: internal loopback (tx_source=0, rx_input_select=0)
%   B: host-injection   (tx_source=1, host_tx = golden 8sps, adc_dataIn = same
%      golden waveform, rx_input_select=1)  [simulates a perfect cable]
addpath(pwd); addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
Ts=1/15.36e6; Tstop=20e-3; N=round(Tstop/Ts); t=(0:N-1)'*Ts;
% golden 8sps@15.36 waveform, int16 scaled
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[];
for f=1:12
  st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0));
  for i=1:numel(pay0), bb=mod(nnz(st(poly==1)),2); sc(i)=xor(pay0(i),bb); st=[st(2:7) bb]; end
  fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)];
end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
g=resample(w4,2,1); g=g/rms(g); g16=double(int16(g*2^13));
g16(end+1:N)=0; g16=g16(1:N);
% input column order = inport order 1..10:
% adc_validIn adc_dataInI adc_dataInQ rstCS iq_debug_mux rx_input_select
% host_txI host_txQ host_txValid tx_source_select
mk=@(adcI,adcQ,rxsel,hI,hQ,txsrc) [t, ones(N,1), adcI, adcQ, zeros(N,1), ...
    zeros(N,1), rxsel*ones(N,1), hI, hQ, ones(N,1), txsrc*ones(N,1)];
for mode=['A','B']
  if mode=='A', u=mk(zeros(N,1),zeros(N,1),0,zeros(N,1),zeros(N,1),0);
  else,         u=mk(real(g16),imag(g16),1,real(g16),imag(g16),1); end
  assignin('base','u_ext',u);
  so=sim(sys,'LoadExternalInput','on','ExternalInput','u_ext', ...
          'StopTime',num2str(Tstop),'SaveOutput','on');
  y=so.yout; pk=y{2}.Values.Data(end); er=y{3}.Values.Data(end); % outports 2/3 = packets/errors
  fprintf('mode %c: packets=%d errors=%d BER=%.4f%%\n', mode, pk, er, 100*double(er)/max(1,double(pk)*120));
  assert(pk>3, sprintf('mode %c: no packets', mode));
  assert(er==0, sprintf('mode %c: errors', mode));
end
fprintf('SIM GATE PASS\n');
```

- [ ] **Step 2: Run the gate in the kit**

```bash
KIT=/mnt/onetb/scratch/qpsk_variants/verif
cp trx_examples/targeting/QPSKTxRxHDLExample/sim_verif_gate.m $KIT/
(cd $KIT && /mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('build_composite_local.m'); run('variant_pre.m'); run('sim_verif_gate.m')" 2>&1 | tail -6)
```

Expected: `mode A: ... errors=0`, `mode B: ... errors=0`, `SIM GATE PASS`.
If outport indices 2/3 don't hold (yout element names differ), read elements by name `packets_out`/`bit_errors_out` instead — `y.getElement('packets_out').Values.Data(end)`.

- [ ] **Step 3: Commit**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
git add trx_examples/targeting/QPSKTxRxHDLExample/sim_verif_gate.m
git commit -m "test: Verifiable Composite sim gate (internal + host-injection 0% BER)"
```

### Task 4: Build the Verifiable Composite + block-design wiring verification

**Files:**
- Kit: `/mnt/onetb/scratch/qpsk_variants/verif/` (from Task 2)

- [ ] **Step 1: Rebuild the kit fresh (clean model state after the sim runs) and launch the build**

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
bash tools/make_composite_variant_kit.sh verif variant_pre_composite_verif
KIT=/mnt/onetb/scratch/qpsk_variants/verif
source /tools/Xilinx/2025.1/Vivado/settings64.sh
(cd $KIT && nohup /mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('build_variant.m')" > build.log 2>&1 &)
```

~60-90 min. Poll: `tail -3 $KIT/build.log`; confirm the overlay line `verif overlay: hdlworkflow patched` appears early.

- [ ] **Step 2: Gate on timing + BOOT.BIN**

```bash
KIT=/mnt/onetb/scratch/qpsk_variants/verif
ls -la $KIT/hdl_prj_jupiter_composite/vivado_ip_prj/boot/BOOT.BIN
grep -ci "timing constraints met" $KIT/build.log   # expect >= 1
```

- [ ] **Step 3: Verify the lane fix landed in the generated block design**

```bash
KIT=/mnt/onetb/scratch/qpsk_variants/verif
BD=$(find $KIT/hdl_prj_jupiter_composite/vivado_ip_prj -name "system.bd" | head -1)
python3 - "$BD" <<'EOF'
import sys,re
s=open(sys.argv[1]).read()
# net containing adc_1_data_q0 must also contain sync_input/data_in_rx_1
blocks=re.findall(r'\{[^{}]*adc_1_data_q0[^{}]*\}', s.replace('\n',' '))
ok=any('data_in_rx_1' in b for b in blocks)
print('adc q0 -> sync lane1:', 'OK' if ok else 'STILL WRONG')
blocks=re.findall(r'\{[^{}]*dac_1_data_q0[^{}]*\}', s.replace('\n',' '))
ok=any('data_out_tx_1' in b for b in blocks)
print('sync lane1 -> dac q0:', 'OK' if ok else 'STILL WRONG')
EOF
```

Expected: both `OK`. (If the .bd net-block regex misses the format, fall back to checking the Vivado journal: `grep -A1 "data_in_rx_1" $KIT/hdl_prj_jupiter_composite/vivado_ip_prj/*.jou | grep q0`.)

- [ ] **Step 4: Commit build metadata note** (no large artifacts)

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox
git commit --allow-empty -m "build: verif composite built, timing met, lane fix verified in BD"
```

### Task 5: Deploy + Stage 0 (capture-path validation)

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/stage0_capture_check.m`

- [ ] **Step 1: Deploy**

```bash
bash /mnt/onetb/deploy_boot.sh /mnt/onetb/scratch/qpsk_variants/verif/hdl_prj_jupiter_composite/vivado_ip_prj/boot/BOOT.BIN
```

Expected: md5 match echoed from the board, `ping up`, `ssh ready`.

- [ ] **Step 2: Write + run the stage-0 check** — host complex tone through the new host path (`tx_source=1`), captured via the raw-ADC passthrough; image rejection must exceed 40 dB:

```matlab
% stage0_capture_check.m
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6; f0=fs/8; N=2^15;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 1',8);   % tx_source = host
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % rx = cable
x=exp(1j*2*pi*f0/fs*(0:N-1)).'; xi=complex(int16(real(x)*2^14),int16(imag(x)*2^14));
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.SamplesPerFrame=N; tx(xi);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^16; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:15,[y,~]=rx(); end
z=double(y); z=z(abs(z)>0);
Z=abs(fftshift(fft(z.*hann(numel(z))))).^2; f=((0:numel(z)-1)/numel(z)-0.5)*fs;
pP=sum(Z(abs(f-f0)<60e3)); pN=sum(Z(abs(f+f0)<60e3)); ir=10*log10(pP/max(pN,eps));
fprintf('stage0: std(Q)/std(I)=%.3f  image-rejection=%.1f dB (gate: >40)\n', std(imag(z))/std(real(z)), ir);
release(tx); try,release(rx);catch,end
assert(ir>40, 'capture path still corrupted'); fprintf('STAGE0 PASS\n');
```

```bash
cd /home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('stage0_capture_check.m')" 2>&1 | tail -3
```

Expected: `image-rejection > 40 dB`, `STAGE0 PASS`. This simultaneously validates the host-Tx→DAC path (the tone went through `IP Data IN` + DAC MUX) and the capture path.

- [ ] **Step 3: Commit**

```bash
git add trx_examples/targeting/QPSKTxRxHDLExample/stage0_capture_check.m
git commit -m "test: stage 0 -- host tone via DAC MUX + raw-ADC capture, image rejection gate"
```

### Task 6: Stage i — deployed HDL Rx decodes the host golden signal

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/stage1_hdlrx_golden.m`

- [ ] **Step 1: Write + run** — golden 8 sps @ 15.36 via host Tx (`tx_source=1`), cable, HDL Rx BIST:

```matlab
% stage1_hdlrx_golden.m
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 1',8);   % host Tx
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable Rx
C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[];
for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0));
  for i=1:numel(pay0), bb=mod(nnz(st(poly==1)),2); sc(i)=xor(pay0(i),bb); st=[st(2:7) bb]; end
  fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)];
end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); txint=int16(txw*2^14);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(txint); tx(txint);
fprintf('Tx rate=%g (want 1.536e7)\n', tx.SamplingRate); pause(5);
rd=@(a) double(BistRegisters.read(a,8));
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
fprintf('STAGE1: pkts/30s=%d errors=%d BER=%.5f%% (gate <0.01, pkts>1000)\n', dp, de, ber);
release(tx);
assert(dp>1000 && ber<0.01, 'stage 1 gate failed'); fprintf('STAGE1 PASS\n');
```

```bash
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('stage1_hdlrx_golden.m')" 2>&1 | tail -3
```

Expected: thousands of packets, BER < 0.01%, `STAGE1 PASS`.

- [ ] **Step 2: If it fails — isolation procedure (do, don't guess):** capture via passthrough during the same lock (`rx()` 2^18 samples), run `demodPlutoCapture(double(y)/2^14, 15.36e6)`; if host decode is < 0.01% but BIST is high, the divergence is inside the HDL Rx → capture the same input, replay in sim TB; if host decode is also bad, characterize the signal (EVM/CFO) and fix Tx/RF settings (atten/gain sweep as in `host_loopback.m`).

- [ ] **Step 3: Commit**

```bash
git add trx_examples/targeting/QPSKTxRxHDLExample/stage1_hdlrx_golden.m
git commit -m "test: stage 1 -- deployed HDL Rx decodes host golden <0.01% (gate)"
```

### Task 7: Stage ii — deployed HDL Tx verified by the host golden receiver

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/stage2_hdltx_host.m`

- [ ] **Step 1: Write + run** — in-FPGA Tx (`tx_source=0`), capture the cable signal via passthrough, decode with `demodPlutoCapture`:

```matlab
% stage2_hdltx_host.m
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 0',8);   % in-FPGA Tx
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable
% power the chip Tx chain (host cyclic zeros; FPGA Tx drives the DAC data)
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16')));
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^18; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
y=[]; for k=1:12,[y,~]=rx(); end
iq=double(y)/2^14;
[ber,nf,evm,info]=demodPlutoCapture(iq, fs);
fprintf('STAGE2: %s\n', info);
release(tx); try,release(rx);catch,end
assert(nf>10 && ber<1e-4, 'stage 2 gate failed'); fprintf('STAGE2 PASS\n');
```

```bash
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('stage2_hdltx_host.m')" 2>&1 | tail -3
```

Expected: ≥10 frames, BER < 0.01%, `STAGE2 PASS`. If it fails: the captured signal is fully characterizable (EVM, s⁴ CFO, spectrum) — fix the in-FPGA Tx with evidence (this was un-observable before; now it isn't).

- [ ] **Step 2: Commit**

```bash
git add trx_examples/targeting/QPSKTxRxHDLExample/stage2_hdltx_host.m
git commit -m "test: stage 2 -- deployed HDL Tx signal decodes <0.01% via host golden"
```

### Task 8: Stage iii — full deployed modem, sustained < 0.01% (+ internal regression)

**Files:**
- Create: `trx_examples/targeting/QPSKTxRxHDLExample/stage3_full_modem.m`

- [ ] **Step 1: Write + run** — FPGA Tx + cable + HDL Rx BIST, ≥1M checked bits:

```matlab
% stage3_full_modem.m -- THE success criterion.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
BistRegisters.sshExec('busybox devmem 0x9D000118 32 0',8);   % in-FPGA Tx
BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); pause(5);
rd=@(a) double(BistRegisters.read(a,8));
totp=0; tote=0; t0=tic;
while totp*120 < 1.2e6 && toc(t0) < 600        % >=1M checked bits, max 10 min
    p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(20);
    p1=rd('0x9D000104'); e1=rd('0x9D000108');
    totp=totp+(p1-p0); tote=tote+(e1-e0);
    fprintf('  running: %d pkts, %d errs, BER=%.5f%%\n', totp, tote, 100*tote/max(1,totp*120));
end
ber=100*tote/max(1,totp*120);
fprintf('STAGE3: %d packets, %d checked bits, %d errors, BER=%.5f%% (gate <0.01)\n', ...
    totp, totp*120, tote, ber);
% internal regression (vs the historical 7.27%)
BistRegisters.sshExec('busybox devmem 0x9D000114 32 0',8); pause(3);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(20); p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('internal regression: BER=%.4f%% (baseline was 7.27%%)\n', 100*(e1-e0)/max(1,(p1-p0)*120));
release(tx);
assert(totp*120>=1e6 && ber<0.01, 'stage 3 gate failed'); fprintf('STAGE3 PASS -- GOAL MET\n');
```

```bash
/mnt/onetb/MATLAB/R2025b/bin/matlab -batch "run('stage3_full_modem.m')" 2>&1 | tail -8
```

Expected: ≥1M checked bits, BER < 0.01%, `STAGE3 PASS -- GOAL MET`. Note: if stages i and ii passed but iii fails, the failure is a Tx+Rx simultaneous-operation interaction — capture the cable signal during stage-iii operation (passthrough still live) and compare with the stage-ii capture before touching HDL.

- [ ] **Step 2: Commit**

```bash
git add trx_examples/targeting/QPSKTxRxHDLExample/stage3_full_modem.m
git commit -m "test: stage 3 -- full deployed modem sustained <0.01% over >=1M checked bits"
```

### Task 9: Record results

- [ ] **Step 1:** Update the auto-memory file `qpsk-host-first-stock-streaming.md` with: the lane-order root cause + fix commit hash, and per-stage results (numbers, not adjectives).
- [ ] **Step 2:** Final commit of any measurement scripts changed during isolation loops.

---

## Self-review notes

- Spec coverage: M0 → resolved in the plan preamble + Task 1 (fix) + Task 4 step 3 (BD verification); M1 → Tasks 2-5; M2 → Task 6; M3 → Task 7; M4 → Task 8. Register map, operational rules, and failure-isolation procedures carried over from the spec.
- The sim gate (Task 3) cannot catch the lane bug (it lives in generated BD wiring) — that is exactly why Task 4 step 3 checks the generated BD and stage 0 checks it on hardware.
- Type/name consistency: inport names (`host_txI/Q`, `host_txValid`, `tx_source_select`), interface names (`IP Data 0/1 IN`, `IP Valid Tx Data IN`, `IP Data 0..3 OUT`), and register x"118" are used identically in Tasks 2, 3, 5-8.
