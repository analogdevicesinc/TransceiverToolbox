% variant_pre_composite_verif -- the Verifiable Composite:
%  (1) DAC-source MUX: tx_source_select (AXI x"118") picks in-FPGA Tx (0) or
%      host TX DMA (1) as the DAC driver. Host samples arrive via the ref
%      design's 'IP Data 0/1 IN' (util_dac_1_upack stream into the DUT).
%  (2) Raw-ADC passthrough: debugI/Q/Valid carry adc_dataInI/Q/validIn to the
%      Rx DMA ('IP Data 0/1 OUT') for trustworthy host capture. debugI1/Q1
%      keep the Receiver's iq_debug_mux taps (-> 'IP Data 2/3 OUT').
% Requires the I/Q lane-order fix in CI/scripts/matlab_processors.tcl.
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];

% Root-level sim-harness remnant references a .mat absent from build kits and
% breaks Update Diagram (now required by the multirate DUT). Comment it out.
try, set_param([sys '/RxCaptureFromHW'], 'Commented', 'on'); catch, end

% --- (0) interface ports at the FULL clock rate (30.72 MHz) ---
% The ref-design bus delivers one word per IPCORE_CLK cycle: data completes on
% valid-high beats and is half-shifted/stale on off-beats. Sampling it on the
% DUT's free-phase /2 enable is a per-bitstream phase lottery (the capture path,
% paced by valid, can never witness the bad beats). Take the ports at 1/30.72e6
% and valid-qualify below.
for pn = {'adc_validIn','adc_dataInI','adc_dataInQ'}
    set_param([loop '/' pn{1}], 'SampleTime', '1/30.72e6');
end

% --- (1a) new inports 7..10 ---
in_new = { 'host_txI','int16','1/30.72e6'; 'host_txQ','int16','1/30.72e6'; ...
           'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6' };
for k = 1:size(in_new,1)
    blk = [loop '/' in_new{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(6+k), ...
        'Position', [40 820+40*k 70 840+40*k]);
    set_param(blk, 'OutDataTypeStr', in_new{k,2}, 'SampleTime', in_new{k,3});
end

% --- (1b) DAC MUX: re-route REP_TxI/Q -> tx_dataOutI/Q through switches ---
delete_line(loop, 'REP_TxI/1', 'tx_dataOutI/1');
delete_line(loop, 'REP_TxQ/1', 'tx_dataOutQ/1');
add_block('built-in/Switch', [loop '/MUX_DacI'], 'Criteria','u2 ~= 0', ...
    'Position',[700 860 730 890]);
add_block('built-in/Switch', [loop '/MUX_DacQ'], 'Criteria','u2 ~= 0', ...
    'Position',[700 910 730 940]);
% u1 = host (selected when tx_source_select ~= 0), u3 = in-FPGA Tx
for dd = {{'I'},{'Q'}}
    d=dd{1}{1};
    add_block('built-in/Delay', [loop '/HostCap' d], 'DelayLength','1', ...
        'ShowEnablePort','on', 'Position',[560+60*(d=='Q') 760 600+60*(d=='Q') 800]);
    add_line(loop, ['host_tx' d '/1'],  ['HostCap' d '/1'], 'autorouting','on');
    add_line(loop, 'host_txValid/1',    ['HostCap' d '/2'], 'autorouting','on');
    add_block('built-in/RateTransition', [loop '/HostRT' d], ...
        'OutPortSampleTime','1/15.36e6', 'Position',[630+60*(d=='Q') 760 670+60*(d=='Q') 800]);
    add_line(loop, ['HostCap' d '/1'], ['HostRT' d '/1'], 'autorouting','on');
end
add_line(loop, 'HostRTI/1',           'MUX_DacI/1', 'autorouting','on');
add_line(loop, 'tx_source_select/1',  'MUX_DacI/2', 'autorouting','on');
add_line(loop, 'REP_TxI/1',           'MUX_DacI/3', 'autorouting','on');
add_line(loop, 'HostRTQ/1',           'MUX_DacQ/1', 'autorouting','on');
add_line(loop, 'tx_source_select/1',  'MUX_DacQ/2', 'autorouting','on');
add_line(loop, 'REP_TxQ/1',           'MUX_DacQ/3', 'autorouting','on');
add_line(loop, 'MUX_DacI/1', 'tx_dataOutI/1', 'autorouting','on');
add_line(loop, 'MUX_DacQ/1', 'tx_dataOutQ/1', 'autorouting','on');

% tx_validOut must be paced by the DAC's own request: host_txValid is
% 'IP Valid Tx Data IN' = dac_1_valid_i0. Driving 'IP Load Tx Data OUT'
% (= upack fifo_rd_en) from it recreates the stock rd_en=dac_valid loop, so
% DAC data updates exactly when the DAC latches. A free-running model strobe
% (REP_TxValid) here causes duplicated/dropped DAC samples (EVM ~0.6).
delete_line(loop, 'REP_TxValid/1', 'tx_validOut/1');
% upack rd_en pacing: forward the dac request; tx_validOut stays at 30.72 rate
% (one wire word per clock toward 'IP Load Tx Data OUT').
add_line(loop, 'host_txValid/1', 'tx_validOut/1', 'autorouting','on');
add_block('built-in/Terminator', [loop '/T_repValid'], 'Position',[700 990 720 1010]);
add_line(loop, 'REP_TxValid/1', 'T_repValid/1', 'autorouting','on');

% --- (1c) phase-robust cable valid: the DUT samples adc_validIn (gap-2 strobe
% @30.72) on its /2 clock enable; at the wrong reset phase it reads constant 0
% and the valid-gated Receiver consumes nothing (the historical cable-lock
% lottery). For a continuous full-rate stream the valid carries no information:
% drive the cable branch of MUX_RxValid with constant true instead. The data
% registers deliver each ADC sample exactly once at either phase.
delete_line(loop, 'adc_validIn/1', 'MUX_RxValid/1');
add_block('built-in/Constant', [loop '/RxValidConst'], 'Value','true', ...
    'OutDataTypeStr','boolean', 'SampleTime','1/15.36e6', 'Position',[470 300 500 320]);
add_line(loop, 'RxValidConst/1', 'MUX_RxValid/1', 'autorouting','on');
% valid-qualified capture at 30.72: register data only on valid-high beats,
% then deterministic rate transition of the held-clean stream down to 15.36.
for dd = {{'I'},{'Q'}}
    d=dd{1}{1};
    delete_line(loop, ['adc_dataIn' d '/1'], ['MUX_Rx' d '/1']);
    add_block('built-in/Delay', [loop '/AdcCap' d], 'DelayLength','1', ...
        'ShowEnablePort','on', 'Position',[300+60*(d=='Q') 540 340+60*(d=='Q') 580]);
    add_line(loop, ['adc_dataIn' d '/1'], ['AdcCap' d '/1'], 'autorouting','on');
    add_line(loop, 'adc_validIn/1',       ['AdcCap' d '/2'], 'autorouting','on');
    add_block('built-in/RateTransition', [loop '/AdcRT' d], ...
        'OutPortSampleTime','1/15.36e6', 'Position',[420+60*(d=='Q') 540 460+60*(d=='Q') 580]);
    add_line(loop, ['AdcCap' d '/1'], ['AdcRT' d '/1'], 'autorouting','on');
    % full-period stabilization register: the RT/cap outputs are combinational
    % muxes that toggle between two delayed copies within each 15.36 period;
    % Receiver input registers use BOTH enable phases on silicon and would
    % sample a mixed/stuttered stream (invisible to Simulink sim AND to the
    % valid-paced capture). A plain registered Delay pins the value for the
    % whole period.
    add_block('built-in/Delay', [loop '/AdcStab' d], 'DelayLength','1', ...
        'Position',[500+60*(d=='Q') 540 540+60*(d=='Q') 580]);
    add_line(loop, ['AdcRT' d '/1'], ['AdcStab' d '/1'], 'autorouting','on');
    add_line(loop, ['AdcStab' d '/1'], ['MUX_Rx' d '/1'], 'autorouting','on');
end

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
      'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 2 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 3 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugI1'',    ''IOInterfaceMapping'', ''[0:15]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/debugQ1'',    ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
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
