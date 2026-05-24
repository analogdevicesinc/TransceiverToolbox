#!/bin/bash
# make_variant_kit.sh <variant_name> <sps> <rsym> <urx> <utx>
#
# Creates an isolated build dir under /mnt/onetb/scratch/qpsk_variants/<name>/
# containing per-variant copies of:
#   commhdlQPSKTxRxParameters.m       (with SamplesPerSymbol overridden to <sps>)
#   commhdlQPSKTxRxLoopback.slx       (read-only-copy; init/rsym tweaked at runtime)
#   commhdlQPSKTxRx.slx               (so Receiver/Transmitter library blocks resolve)
#   commhdlQPSKTxRxModelInit.m        (mask-init script — unchanged)
#   qpskFindTxInputData.m
#   hdlworkflow_loopback.m            (build workflow — unchanged, uses relative paths)
#   variant_pre.m                     (per-variant InitFcn / Rsym patch invoked just
#                                       before runWorkflow)
#   build_variant.m                   (entry point: variant_pre then hdlworkflow)
#
# After this, parallel build is:
#   ( cd <dir> && matlab -batch "run('build_variant.m')" > build.log 2>&1 ) &
#
# Each MATLAB process has its own cwd, so the local Parameters.m / .slx are
# picked up (cwd precedence over path).
set -euo pipefail

NAME=${1:?variant name}; SPS=${2:?sps}; RSYM=${3:?Rsym}; URX=${4:?UpsamplesRx}; UTX=${5:?UpsamplesTx}
SRC=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
DST=/mnt/onetb/scratch/qpsk_variants/$NAME
mkdir -p "$DST"

# files we need locally
for f in commhdlQPSKTxRxLoopback.slx commhdlQPSKTxRx.slx \
         commhdlQPSKTxRxModelInit.m qpskFindTxInputData.m \
         hdlworkflow_loopback.m; do
  cp -f "$SRC/$f" "$DST/$f"
done

# Parameters.m: override SamplesPerSymbol
python3 - "$SRC/commhdlQPSKTxRxParameters.m" "$DST/commhdlQPSKTxRxParameters.m" "$SPS" <<'PY'
import sys, re
src, dst, sps = sys.argv[1], sys.argv[2], int(sys.argv[3])
txt = open(src).read()
txt = re.sub(r'Params\.SamplesPerSymbol\s*=\s*\d+\s*;',
             f'Params.SamplesPerSymbol         = {sps};', txt, count=1)
open(dst, 'w').write(txt)
PY

# variant_pre.m: open the model, patch InitFcn UpsamplesRx/Tx + Input Data Rsym,
# and (critical for low-SPS variants) wrap HDL-Counter CountWordLen formulas in
# max(1,...) so the counter never has 0 bits.
cat > "$DST/variant_pre.m" <<EOF
% Auto-generated for variant: $NAME (SPS=$SPS Rsym=$RSYM Urx=$URX Utx=$UTX)
sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);
% Patch InitFcn UpsamplesRx/Tx
ic = get_param(sys,'InitFcn');
ic = regexprep(ic,'UpsamplesRx\s*=\s*\d+\s*;','UpsamplesRx = $URX;');
ic = regexprep(ic,'UpsamplesTx\s*=\s*\d+\s*;','UpsamplesTx = $UTX;');
set_param(sys,'InitFcn',ic);
% Patch Input Data Rsym in both Transmitter copies
candidates = {[sys '/Transmitter/Input Data'], [sys '/TxRxLoopback/Transmitter/Input Data']};
for k=1:numel(candidates)
  try, set_param(candidates{k},'Rsym','$RSYM'); fprintf('Rsym set on %s\n',candidates{k}); catch, end
end
% --- Patch HDL Counter CountWordLen formulas to never collapse to 0 bits at SPS<4
counterPaths = { ...
  [sys '/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
  [sys '/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3'], ...
  [sys '/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/HDL Counter'], ...
  [sys '/TxRxLoopback/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/HDL Counter3']};
for k=1:numel(counterPaths)
  b = counterPaths{k};
  try
    wl = get_param(b,'CountWordLen');
    if ~startsWith(strtrim(wl),'max(1,')
      newWl = sprintf('max(1,%s)', wl);
      set_param(b,'CountWordLen',newWl);
      fprintf('CountWordLen patched on %s: %s -> %s\n', b, wl, newWl);
    end
    cm = get_param(b,'CountMax');
    if ~startsWith(strtrim(cm),'max(1,')
      newCm = sprintf('max(1,%s)', cm);
      set_param(b,'CountMax', newCm);
      fprintf('CountMax patched on %s: %s -> %s\n', b, cm, newCm);
    end
  catch e
    fprintf('warn: could not patch %s: %s\n', b, e.message);
  end
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
EOF

# build_variant.m: orchestrator
cat > "$DST/build_variant.m" <<EOF
% Build entry for variant $NAME
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
run('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/setup.m');
% NOTE: cwd is the variant dir, so local Parameters.m + .slx are used
% Clean any stale smart-build status so the IP-core task always runs end-to-end.
fprintf('build_variant cwd=%s\n', pwd);
try; rmdir(fullfile(pwd,'hdl_prj_jupiter_loopback'),'s'); catch; end
try; rmdir(fullfile(pwd,'slprj'),'s'); catch; end
run('variant_pre.m');
% Bump the model Description so HDL Coder's smart-build cannot claim "no
% functional changes" (which causes the IP core packaging step to skip and
% then fail when its expected doc/* dir doesn't exist).
sys = 'commhdlQPSKTxRxLoopback';
set_param(sys,'Description', sprintf('variant=%s build=%s', '$NAME', char(datetime('now'))));
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
run('hdlworkflow_loopback.m');
fprintf('VARIANT_BUILD_DONE: %s\n', '$NAME');
EOF

echo "variant kit ready at $DST"
echo "  SPS=$SPS Rsym=$RSYM UpsamplesRx=$URX UpsamplesTx=$UTX"
ls -la "$DST/" | grep -v '^total\|^\.\|^d'
