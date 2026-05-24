#!/bin/bash
# make_impair_kit.sh <variant_name>
#
# Stages a scratch dir for the V4_gain_inj-style impairment variant: clones
# the V3 (SPS=4, Rsym=3.84M, Urx=Utx=1) kit and overlays a variant_pre.m
# that, in addition to the standard scalar patches, programmatically
# inserts an AXI4-Lite-controlled gain block (Product) on both I and Q
# loopback paths inside commhdlQPSKTxRxLoopback/TxRxLoopback. The added
# blocks are:
#
#   * Inport `inj_gain`  (signed Q1.14, AXI4-Lite at x"114")
#   * Product blocks `InjGainI`, `InjGainQ`  (Inputs="**", OutDataTypeStr=int16)
#
# Existing lines from RT_I/RT_Q to Receiver/dataInI/Q are rewired through
# the Product blocks.
#
# Note: inj_gain is a *write-only* register in HDL Coder's IP wrapper --
# readback returns 0. Use the behavioural probe in HardwareGainRobustnessTest
# (write 0 -> BIST stalls) to verify deployment.
#
# After this:
#   cd /mnt/onetb/scratch/qpsk_variants/<name>
#   source /tools/Xilinx/2025.1/Vivado/settings64.sh
#   matlab -batch "run('build_variant.m')" > build.log 2>&1
#
set -euo pipefail
NAME=${1:?variant name}
DST=/mnt/onetb/scratch/qpsk_variants/$NAME
SRC=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
V3=/mnt/onetb/scratch/qpsk_variants/V3_sps4_rsym3p84

mkdir -p "$DST"
# Clone V3 (uses unmodified .slx + V3-tuned Parameters/InitFcn baseline)
for f in commhdlQPSKTxRxLoopback.slx commhdlQPSKTxRx.slx \
         commhdlQPSKTxRxModelInit.m qpskFindTxInputData.m \
         hdlworkflow_loopback.m; do
  if [ -f "$V3/$f" ]; then cp -f "$V3/$f" "$DST/$f"; else cp -f "$SRC/$f" "$DST/$f"; fi
done
# Parameters.m with SPS=4 (V3)
python3 - "$SRC/commhdlQPSKTxRxParameters.m" "$DST/commhdlQPSKTxRxParameters.m" <<'PY'
import sys, re
src, dst = sys.argv[1], sys.argv[2]
txt = open(src).read()
txt = re.sub(r'Params\.SamplesPerSymbol\s*=\s*\d+\s*;',
             'Params.SamplesPerSymbol         = 4;', txt, count=1)
open(dst, 'w').write(txt)
PY

cat > "$DST/variant_pre.m" <<'PRE'
% V_impair: V3 (SPS=4, Rsym=3.84M, Urx=Utx=1) + AXI-controlled gain injection
% on the digital-loopback path between Tx output and Rx input.
sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxLoopback'];

% --- V3 scalar patches ---
ic = get_param(sys,'InitFcn');
ic = regexprep(ic,'UpsamplesRx\s*=\s*\d+\s*;','UpsamplesRx = 1;');
ic = regexprep(ic,'UpsamplesTx\s*=\s*\d+\s*;','UpsamplesTx = 1;');
set_param(sys,'InitFcn',ic);
for c = {[sys '/Transmitter/Input Data'], [sys '/TxRxLoopback/Transmitter/Input Data']}
  try, set_param(c{1},'Rsym','3.84e6'); catch, end
end

% --- HDL Counter mask safety (no-op at SPS=4) ---
for cp = { ...
    [sys '/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
    [sys '/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3'], ...
    [sys '/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
    [sys '/TxRxLoopback/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3']}
  b = cp{1};
  try
    wl = get_param(b,'CountWordLen');
    if ~startsWith(strtrim(wl),'max(1,'), set_param(b,'CountWordLen', sprintf('max(1,%s)', wl)); end
    cm = get_param(b,'CountMax');
    if ~startsWith(strtrim(cm),'max(1,'), set_param(b,'CountMax', sprintf('max(1,%s)', cm)); end
  catch, end
end

% --- Insert gain injection blocks (idempotent) ---
if isempty(find_system(loop,'SearchDepth',1,'Name','inj_gain'))
  fprintf('Inserting inj_gain + InjGainI/Q Product blocks...\n');
  inGain = [loop '/inj_gain'];
  add_block('built-in/Inport', inGain, 'Port', '6');
  set_param(inGain, 'OutDataTypeStr', 'fixdt(1,16,14)');  % Q1.14 signed
  for ch = ["I","Q"]
    blk = char(loop + "/InjGain" + ch);
    add_block('built-in/Product', blk, ...
        'Inputs', '**', ...
        'OutDataTypeStr', 'fixdt(1,16,0)', ...           % int16 to match Tx out
        'SaturateOnIntegerOverflow', 'on', ...
        'RndMeth', 'Nearest');
  end
  delete_line(loop, 'RT_I/1', 'Receiver/2');
  add_line(loop, 'RT_I/1', 'InjGainI/1', 'autorouting','on');
  add_line(loop, 'inj_gain/1', 'InjGainI/2', 'autorouting','on');
  add_line(loop, 'InjGainI/1', 'Receiver/2', 'autorouting','on');
  delete_line(loop, 'RT_Q/1', 'Receiver/3');
  add_line(loop, 'RT_Q/1', 'InjGainQ/1', 'autorouting','on');
  add_line(loop, 'inj_gain/1', 'InjGainQ/2', 'autorouting','on');
  add_line(loop, 'InjGainQ/1', 'Receiver/3', 'autorouting','on');
end
hdlset_param([loop '/inj_gain'], 'IOInterface', 'AXI4-Lite');
hdlset_param([loop '/inj_gain'], 'IOInterfaceMapping', 'x"114"');

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
PRE

cat > "$DST/build_variant.m" <<EOF
% Build entry for impairment variant $NAME
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
run('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/setup.m');
fprintf('build_variant cwd=%s\n', pwd);
try; rmdir(fullfile(pwd,'hdl_prj_jupiter_loopback'),'s'); catch; end
try; rmdir(fullfile(pwd,'slprj'),'s'); catch; end
run('variant_pre.m');
sys = 'commhdlQPSKTxRxLoopback';
set_param(sys,'Description', sprintf('variant=%s build=%s', '$NAME', char(datetime('now'))));
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
run('hdlworkflow_loopback.m');
fprintf('VARIANT_BUILD_DONE: $NAME\n');
EOF

echo "impair kit ready at $DST"
ls -la "$DST" | grep -v '^total\|^\.\|^d'
