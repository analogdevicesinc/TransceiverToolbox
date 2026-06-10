#!/bin/bash
# make_composite_variant_kit.sh <variant_name> <variant_pre_basename>
#
# Creates an isolated build dir under /mnt/onetb/scratch/qpsk_variants/<name>/
# for building a CUSTOM COMPOSITE variant. The kit contains:
#   commhdlQPSKTxRx.slx                (source library w/ Tx, Rx subsystems)
#   commhdlQPSKTxRxParameters.m
#   commhdlQPSKTxRxModelInit.m
#   qpskFindTxInputData.m
#   hdlworkflow_loopback.m             (composite workflow; uses cwd-relative paths)
#   build_composite_local.m            (build_composite.m, but using cwd-local paths)
#   variant_pre.m                      (= tools/<variant_pre_basename>.m)
#   build_variant.m                    (entry point: build_composite_local + variant_pre + hdlworkflow)
#
# Parallel build:
#   ( cd <dir> && matlab -batch "run('build_variant.m')" > build.log 2>&1 ) &
set -euo pipefail

NAME=${1:?variant name}
PRE_BASENAME=${2:?variant_pre script basename (without .m)}
SRC=/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample
DST=/mnt/onetb/scratch/qpsk_variants/$NAME

mkdir -p "$DST"

# Files needed locally (cwd has precedence over path for .slx/.m resolution).
for f in commhdlQPSKTxRx.slx commhdlQPSKTxRxParameters.m \
         commhdlQPSKTxRxModelInit.m qpskFindTxInputData.m \
         hdlworkflow_loopback.m; do
  cp -f "$SRC/$f" "$DST/$f"
done

# variant_pre.m: copy the named overlay from tools/.
cp -f "$SRC/tools/${PRE_BASENAME}.m" "$DST/variant_pre.m"

# Sync the reference-design scripts the build ACTUALLY sources (the vendor
# copy, not CI/scripts) -- builds silently use stale BD wiring otherwise.
REPO=/home/tcollins/dev/qpsk_ai/TransceiverToolbox
VENDOR_SCRIPTS=$REPO/hdl/vendor/AnalogDevices/vivado/projects/scripts
if [ -d "$VENDOR_SCRIPTS" ]; then
  cp -f "$REPO/CI/scripts/matlab_processors.tcl" "$VENDOR_SCRIPTS/matlab_processors.tcl"
  cp -f "$REPO/CI/scripts/util_valid_regularizer.v" "$VENDOR_SCRIPTS/util_valid_regularizer.v" 2>/dev/null || true
  echo "  vendor ref-design scripts synced from CI/scripts"
fi

# build_composite_local.m: composite construction script with cwd-local file paths.
# Translates the absolute paths in build_composite.m to cwd-relative.
cat > "$DST/build_composite_local.m" <<'EOF'
% build_composite_local.m -- run from variant cwd; writes commhdlQPSKTxRxLoopback.slx
% into cwd. Source library commhdlQPSKTxRx.slx is in cwd too.
srcSlx = 'commhdlQPSKTxRx.slx';
dstSlx = 'commhdlQPSKTxRxLoopback.slx';
if exist(dstSlx,'file'), delete(dstSlx); end
copyfile(srcSlx, dstSlx);
fprintf('cloned -> %s\n', dstSlx);

load_system('commhdlQPSKTxRxLoopback'); sys='commhdlQPSKTxRxLoopback';
eval(get_param(sys,'InitFcn'));

for n = {'TxRxComposite','TxRxLoopback'}
  prev = find_system(sys,'SearchDepth',1,'Name',n{1});
  for k=1:numel(prev), delete_block(prev{k}); end
end

loop = [sys '/TxRxComposite'];
add_block('built-in/SubSystem', loop, 'Position',[100 600 280 800]);

in_spec = {
  'adc_validIn',      'boolean', '1/15.36e6'; ...
  'adc_dataInI',      'int16',   '1/15.36e6'; ...
  'adc_dataInQ',      'int16',   '1/15.36e6'; ...
  'rstCS',            'boolean', '1/15.36e6'; ...
  'iq_debug_mux',     'uint32',  '1/15.36e6'; ...
  'rx_input_select',  'boolean', '1/15.36e6'};
for k=1:size(in_spec,1)
  blk = [loop '/' in_spec{k,1}];
  add_block('built-in/Inport', blk, 'Port', num2str(k), ...
            'Position', [30 30+40*k 60 50+40*k]);
  set_param(blk, 'OutDataTypeStr', in_spec{k,2}, 'SampleTime', in_spec{k,3});
end

out_names = {'count_out','packets_out','bit_errors_out', ...
             'debugI','debugQ','debugValid','debugI1','debugQ1', ...
             'tx_dataOutI','tx_dataOutQ','tx_validOut'};
for k=1:numel(out_names)
  add_block('built-in/Outport', [loop '/' out_names{k}], ...
            'Port', num2str(k), 'Position', [800 30+40*k 830 50+40*k]);
end

add_block([sys '/Transmitter'], [loop '/Transmitter'], 'CopyOption','duplicate', 'Position',[300 200 430 350]);
add_block([sys '/Receiver'],    [loop '/Receiver'],    'CopyOption','duplicate', 'Position',[600 200 730 400]);

gp = @(nm,p) get_param([sys '/' nm], p);
make_const = @(name, orig) add_block('built-in/Constant', [loop '/' name], ...
   'Value', gp(orig,'Value'), 'SampleTime','1/7.68e6', ...
   'OutDataTypeStr', gp(orig,'OutDataTypeStr'), 'Position', [150 200 180 220]);
make_const('c_dbg','Debug');   set_param([loop '/c_dbg'],  'Position', [150 210 180 230]);
make_const('c_dataI','Debug1'); set_param([loop '/c_dataI'],'Position', [150 240 180 260]);
make_const('c_dataQ','Debug2'); set_param([loop '/c_dataQ'],'Position', [150 270 180 290]);

add_block('dspsigops/Downsample', [loop '/DS_TxValid'], ...
    'N','2', 'InputProcessing','Elements as channels (sample based)', ...
    'RateOptions','Allow multirate processing', 'Position',[200 280 230 320]);
add_line(loop, 'adc_validIn/1', 'DS_TxValid/1');
add_line(loop, 'c_dbg/1',       'Transmitter/1');
add_line(loop, 'c_dataI/1',     'Transmitter/2');
add_line(loop, 'c_dataQ/1',     'Transmitter/3');
add_line(loop, 'DS_TxValid/1',  'Transmitter/4');

add_block('dspsigops/Repeat', [loop '/REP_TxI'], ...
    'FactorSource','Dialog parameter','N','2','Nmax','16', ...
    'InputProcessing','Elements as channels (sample based)', ...
    'RateOptions','Allow multirate processing','ic','0', ...
    'Position',[470 220 500 240]);
add_block('dspsigops/Repeat', [loop '/REP_TxQ'], ...
    'FactorSource','Dialog parameter','N','2','Nmax','16', ...
    'InputProcessing','Elements as channels (sample based)', ...
    'RateOptions','Allow multirate processing','ic','0', ...
    'Position',[470 260 500 280]);
add_block('dspsigops/Repeat', [loop '/REP_TxValid'], ...
    'FactorSource','Dialog parameter','N','2','Nmax','16', ...
    'InputProcessing','Elements as channels (sample based)', ...
    'RateOptions','Allow multirate processing','ic','0', ...
    'Position',[470 300 500 320]);
add_line(loop, 'Transmitter/1', 'REP_TxI/1');
add_line(loop, 'Transmitter/2', 'REP_TxQ/1');
add_line(loop, 'Transmitter/4', 'REP_TxValid/1');

add_line(loop, 'REP_TxI/1',     'tx_dataOutI/1');
add_line(loop, 'REP_TxQ/1',     'tx_dataOutQ/1');
add_line(loop, 'REP_TxValid/1', 'tx_validOut/1');

add_block('built-in/Switch', [loop '/MUX_RxI'],     'Criteria','u2 ~= 0', 'Position',[540 215 570 245]);
add_block('built-in/Switch', [loop '/MUX_RxQ'],     'Criteria','u2 ~= 0', 'Position',[540 255 570 285]);
add_block('built-in/Switch', [loop '/MUX_RxValid'], 'Criteria','u2 ~= 0', 'Position',[540 295 570 325]);

add_line(loop, 'adc_dataInI/1',     'MUX_RxI/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxI/2');
add_line(loop, 'REP_TxI/1',         'MUX_RxI/3');
add_line(loop, 'adc_dataInQ/1',     'MUX_RxQ/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxQ/2');
add_line(loop, 'REP_TxQ/1',         'MUX_RxQ/3');
add_line(loop, 'adc_validIn/1',     'MUX_RxValid/1');
add_line(loop, 'rx_input_select/1', 'MUX_RxValid/2');
add_line(loop, 'REP_TxValid/1',     'MUX_RxValid/3');

add_block('built-in/RateTransition', [loop '/RT_RxValid'], ...
    'OutPortSampleTime', '1/15.36e6', 'Position',[590 295 620 325]);
add_block('built-in/RateTransition', [loop '/RT_RxI'], ...
    'OutPortSampleTime', '1/15.36e6', 'Position',[590 215 620 245]);
add_block('built-in/RateTransition', [loop '/RT_RxQ'], ...
    'OutPortSampleTime', '1/15.36e6', 'Position',[590 255 620 285]);
add_line(loop, 'MUX_RxValid/1', 'RT_RxValid/1');
add_line(loop, 'MUX_RxI/1',     'RT_RxI/1');
add_line(loop, 'MUX_RxQ/1',     'RT_RxQ/1');
add_line(loop, 'RT_RxValid/1', 'Receiver/1');
add_line(loop, 'RT_RxI/1',     'Receiver/2');
add_line(loop, 'RT_RxQ/1',     'Receiver/3');

add_line(loop, 'rstCS/1',        'Receiver/4');
add_line(loop, 'iq_debug_mux/1', 'Receiver/5');

add_line(loop, 'Receiver/2', 'count_out/1');
add_line(loop, 'Receiver/3', 'packets_out/1');
add_line(loop, 'Receiver/4', 'bit_errors_out/1');
add_line(loop, 'Receiver/5', 'debugI/1');
add_line(loop, 'Receiver/6', 'debugQ/1');
add_line(loop, 'Receiver/7', 'debugValid/1');
add_line(loop, 'Receiver/8', 'debugI1/1');
add_line(loop, 'Receiver/9', 'debugQ1/1');

killtypes = {'ToFile','ToWorkspace','Scope','XYGraph','SpectrumAnalyzer','ConstellationDiagram'};
nkilled = 0;
for kt = killtypes
  bk = find_system(loop, 'LookUnderMasks','all', 'FollowLinks','on', 'BlockType', kt{1});
  for j=1:numel(bk), delete_block(bk{j}); nkilled=nkilled+1; end
end
fprintf('deleted %d sim-only logging blocks inside composite\n', nkilled);

hdlset_param(sys, 'HDLSubsystem', loop);
save_system(sys);
fprintf('build_composite_local: TxRxComposite saved in cwd.\n');
EOF

# build_variant.m: orchestrator (the entry point for MATLAB).
cat > "$DST/build_variant.m" <<EOF
% Build entry for COMPOSITE variant: $NAME (pre overlay: $PRE_BASENAME)
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox');
run('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/setup.m');
fprintf('build_variant cwd=%s\n', pwd);

% Make HDL Coder aware of Vivado (the calling shell may not have sourced settings64.sh).
try
    hdlsetuptoolpath('ToolName','Xilinx Vivado', 'ToolPath','/tools/Xilinx/2025.1/Vivado/bin/vivado');
catch err
    fprintf('hdlsetuptoolpath warning: %s\n', err.message);
end

% Wipe stale project so HDL Coder smart-build doesn't skip steps.
try; rmdir(fullfile(pwd,'hdl_prj_jupiter_composite'),'s'); catch; end
try; rmdir(fullfile(pwd,'slprj'),'s'); catch; end

% Phase 1: build the composite topology in cwd.
run('build_composite_local.m');
% Phase 2: apply the variant overlay (Gain blocks, capture buffer, etc.).
run('variant_pre.m');
% Bump model Description so HDL Coder's smart-build cannot claim "no functional changes".
sys = 'commhdlQPSKTxRxLoopback';
set_param(sys,'Description', sprintf('variant=%s pre=%s build=%s', ...
    '$NAME', '$PRE_BASENAME', char(datetime('now'))));
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
% Phase 3: synthesize + implement + bitgen.
run('hdlworkflow_loopback.m');
fprintf('VARIANT_BUILD_DONE: %s\n', '$NAME');
EOF

echo "composite variant kit ready at $DST"
echo "  variant_pre.m = tools/${PRE_BASENAME}.m"
ls -la "$DST/" | tail -n +2 | grep -v '^d'
