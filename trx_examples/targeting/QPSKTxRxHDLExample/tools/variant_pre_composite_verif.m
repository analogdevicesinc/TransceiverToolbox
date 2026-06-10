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
% valid-high beats and is half-shifted/stale on off-beats. Take the ADC ports at
% 1/30.72e6 and run the entire Rx subtree at that single rate, natively gated by
% adc_validIn (section 1c). rx_input_select/iq_debug_mux/rstCS feed that subtree
% and move with it.
for pn = {'adc_validIn','adc_dataInI','adc_dataInQ', ...
          'rx_input_select','iq_debug_mux','rstCS'}
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

% --- (1c) single-rate valid-gated Rx front-end ---
% The silicon timing DISTRIBUTION of adc_validIn beats is unobservable from the
% host (every capture path is paced by the valid itself), and behavioral RTL +
% post-synthesis netlist sims both decode this design with a regular gap-2
% valid while silicon decodes 0 packets: the only untested degree of freedom is
% the valid's beat placement (CDC FIFOs upstream of the TPL can clump beats).
% Any fixed-phase /2 resampler drops/duplicates samples under bursty valid.
% Eliminate the assumption instead of modeling it: run the whole Rx subtree at
% the full 30.72 MHz rate with the Receiver natively gated by adc_validIn --
% one consume per valid beat, no resampling, immune to any valid distribution.
%
% Cable branch: the base wiring (adc_dataInI/Q -> MUX_Rx u1, adc_validIn ->
% MUX_RxValid u1) is already correct at the re-rated 30.72 ports. The base
% RT_Rx pass-throughs between MUX and Receiver just move to the same rate.
for rt = {'RT_RxI','RT_RxQ','RT_RxValid'}
    set_param([loop '/' rt{1}], 'OutPortSampleTime', '1/30.72e6');
end
% Internal branch to 30.72: Repeat x2 the 15.36 REP_Tx stream (each Tx sample
% now held 4 clocks) and gate with a 1-in-2 toggle so the Receiver consumes
% each Tx sample exactly twice -- the same sample flow as the original
% 15.36-rate internal loop.
for dd = {{'I'},{'Q'}}
    d=dd{1}{1};
    delete_line(loop, ['REP_Tx' d '/1'], ['MUX_Rx' d '/3']);
    add_block('dspsigops/Repeat', [loop '/REP_Rx' d], 'N','2', ...
        'Position',[440+60*(d=='Q') 480 480+60*(d=='Q') 520]);
    add_line(loop, ['REP_Tx' d '/1'], ['REP_Rx' d '/1'], 'autorouting','on');
    add_line(loop, ['REP_Rx' d '/1'], ['MUX_Rx' d '/3'], 'autorouting','on');
end
delete_line(loop, 'REP_TxValid/1', 'MUX_RxValid/3');
add_block('dspsigops/Repeat', [loop '/REP_RxV'], 'N','2', ...
    'Position',[440 600 480 640]);
add_line(loop, 'REP_TxValid/1', 'REP_RxV/1', 'autorouting','on');
% 1-in-2 toggle at 30.72: NOT-feedback Delay
add_block('built-in/Delay', [loop '/TogReg'], 'DelayLength','1', ...
    'InitialCondition','0', 'SampleTime','1/30.72e6', 'Position',[380 660 420 700]);
add_block('built-in/Logic', [loop '/TogNot'], 'Operator','NOT', 'Inputs','1', ...
    'AllPortsSameDT','off', 'OutDataTypeStr','boolean', 'Position',[440 660 470 700]);
add_line(loop, 'TogReg/1', 'TogNot/1', 'autorouting','on');
add_line(loop, 'TogNot/1', 'TogReg/1', 'autorouting','on');
add_block('built-in/Logic', [loop '/IntValidAnd'], 'Operator','AND', 'Inputs','2', ...
    'AllPortsSameDT','off', 'OutDataTypeStr','boolean', 'Position',[510 610 540 650]);
add_line(loop, 'REP_RxV/1', 'IntValidAnd/1', 'autorouting','on');
add_line(loop, 'TogNot/1',  'IntValidAnd/2', 'autorouting','on');
add_line(loop, 'IntValidAnd/1', 'MUX_RxValid/3', 'autorouting','on');

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
