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

% --- (1a) new inports 7..10 ---
in_new = { 'host_txI','int16'; 'host_txQ','int16'; ...
           'host_txValid','boolean'; 'tx_source_select','uint32' };
for k = 1:size(in_new,1)
    blk = [loop '/' in_new{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(6+k), ...
        'Position', [40 820+40*k 70 840+40*k]);
    set_param(blk, 'OutDataTypeStr', in_new{k,2}, 'SampleTime', '1/15.36e6');
end

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
