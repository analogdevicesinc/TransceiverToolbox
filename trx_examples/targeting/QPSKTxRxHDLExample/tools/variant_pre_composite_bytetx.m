% variant_pre_composite_bytetx -- the Verifiable Composite overlay PLUS the
% host->FPGA byte-transfer path (section 1d below). Targets the byte
% reference design variant 'JUPITER (RX & TX, BYTE DMA)'
% (AnalogDevices.jupiter.plugin_rd_rxtx_byte): a 64-bit AXIS word stream
% ('Byte Data IN [0:63]' / 'Byte Valid IN' / 'Byte Ready OUT') feeds a
% 2-deep ByteWordBuffer FIFO (qpskByteWordBuffer, unit-tested) at 30.72 MHz;
% words cross to the Transmitter's 7.68 MHz domain where the in-Tx
% ByteBitShifter (added by tools/add_byte_tx_path.m) deserializes them into
% payload bits. tx_data_source (AXI x"11C") = 0 selects the internal
% generator/BIST message, 1 selects the byte stream. One packet payload =
% 2240 bits = exactly 35 words. Everything from here to section (1d) is
% verbatim the validated verif overlay.
%
% --- original verif overlay header ---
%
% Applied on top of build_composite (which clones Transmitter + Receiver into
% TxRxComposite), this overlay turns the composite into a staged-verification
% modem on the jupiter_sdr 'rxtx' reference design. Validated end to end on
% hardware: host->HDL-Rx over the RF cable at BER 0.000000% sustained
% (200M+ checked bits), HDL-Tx->host at 0.000% every frame.
%
% Architecture added by this overlay:
%   * DAC source MUX  -- tx_source_select (AXI x"118") picks the in-FPGA Tx
%     (0) or the host Tx DMA stream (1) as the DAC driver. Host samples
%     arrive via 'IP Data 0/1 IN' (util_dac_1_upack); the upack read enable
%     ('IP Load Tx Data OUT') is paced by the DAC's own request so DAC data
%     updates exactly when the DAC latches.
%   * Rx source MUX   -- rx_input_select (AXI x"114") picks internal
%     loopback (0) or the cable/ADC stream (1) into the Receiver.
%   * Valid-qualified Rx front-end -- ADC ports run at the full 30.72 MHz
%     bus rate; data is registered on valid beats, rate-transitioned to
%     15.36 MHz, and pinned for the full period before the Receiver. The
%     reference design additionally re-times the valid through the BD-level
%     util_valid_regularizer (see CI/scripts/matlab_processors.tcl), so the
%     DUT always sees a regular 1-in-2 valid.
%   * 2x interpolating FIR on the Tx output (replaces the base ZOH Repeat)
%     for a properly band-limited DAC waveform.
%   * Debug taps -- debugI1/Q1 ('IP Data 0/1 OUT') carry the Receiver's
%     iq_debug_mux-selected internal taps; debugI/Q ('IP Data 2/3 OUT')
%     carry the raw ADC stream; debugValid paces the capture DMA.
%
% AXI map (byte offsets from the IP base, e.g. 0x9D000000 on jupiter_sdr):
%   0x000 soft reset (bit0 strobe -- resets the datapath AND the register
%         file: rx_input_select/tx_source_select revert to 0)
%   0x100 count_out   0x104 packets_out   0x108 bit_errors_out
%   0x10C iq_debug_mux   0x110 rstCS
%   0x114 rx_input_select   0x118 tx_source_select
%
% MEASUREMENT PROCEDURE (load-bearing): arm the host Tx/Rx buffers, pulse
% the soft reset, THEN write x118/x114. The Receiver only acquires when its
% input mux is selected early after reset; switching live on a long-running
% chain does not acquire, and a stream interruption requires another reset.
% See test/QPSKDeployedLinkTests.m for the reference implementation.
%
% Requires the I/Q lane-order fix + valid regularizer in
% CI/scripts/matlab_processors.tcl (synced to the vendor scripts copy by
% tools/make_composite_variant_kit.sh).
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];

% Root-level sim-harness remnant references a .mat absent from build kits and
% breaks Update Diagram. Comment it out.
try, set_param([sys '/RxCaptureFromHW'], 'Commented', 'on'); catch, end

% --- (0) ADC interface ports at the full bus rate (30.72 MHz) ---
% The ref-design bus delivers one word per IPCORE_CLK cycle; data is only
% guaranteed complete on valid-high beats. Take the ports at 1/30.72e6 and
% valid-qualify in section (1c).
for pn = {'adc_validIn','adc_dataInI','adc_dataInQ'}
    set_param([loop '/' pn{1}], 'SampleTime', '1/30.72e6');
end

% --- (0b) 2x interpolating FIR on the Tx output ---
% The base composite upsamples the 7.68M Transmitter output with Repeat
% (zero-order hold), leaving images at +/-3.84 MHz. Replace with a proper
% interpolation filter. The interpolated stream is continuous, so the
% internal MUX branch valid becomes constant true (REP_TxValid remains only
% as the legacy wire, terminated in 1b).
for dd = {{'I'},{'Q'}}
    d=dd{1}{1};
    % delete the old lines first: delete_block leaves them dangling and a
    % same-position replacement block auto-captures them
    delete_line(loop, sprintf('Transmitter/%d', 1+(d=='Q')), ['REP_Tx' d '/1']);
    delete_line(loop, ['REP_Tx' d '/1'], ['MUX_Rx' d '/3']);
    delete_line(loop, ['REP_Tx' d '/1'], ['tx_dataOut' d '/1']);
    delete_block([loop '/REP_Tx' d]);
    add_block('dspmlti4/FIR Interpolation', [loop '/REP_Tx' d], ...
        'FilterSource','Dialog parameters', ...
        'h','2*fir1(22,0.45)', 'L','2', ...
        'InputProcessing','Elements as channels (sample based)', ...
        'framing','Allow multirate processing', ...
        'roundingMode','Nearest', 'overflowMode','on', ...
        'outputMode','Same as input', ...
        'Position',[470 220+40*(d=='Q') 510 240+40*(d=='Q')]);
    add_line(loop, sprintf('Transmitter/%d', 1+(d=='Q')), ['REP_Tx' d '/1'], 'autorouting','on');
    add_line(loop, ['REP_Tx' d '/1'], ['MUX_Rx' d '/3'], 'autorouting','on');
    % restore the base REP_Tx -> tx_dataOut line; section (1b) re-routes it
    % through the DAC MUX
    add_line(loop, ['REP_Tx' d '/1'], ['tx_dataOut' d '/1'], 'autorouting','on');
end
delete_line(loop, 'REP_TxValid/1', 'MUX_RxValid/3');
add_block('built-in/Constant', [loop '/IntValidConst'], 'Value','true', ...
    'OutDataTypeStr','boolean', 'SampleTime','1/15.36e6', 'Position',[470 340 500 360]);
add_line(loop, 'IntValidConst/1', 'MUX_RxValid/3', 'autorouting','on');

% --- (1a) host-Tx and control inports 7..10 ---
in_new = { 'host_txI','int16','1/30.72e6'; 'host_txQ','int16','1/30.72e6'; ...
           'host_txValid','boolean','1/30.72e6'; 'tx_source_select','uint32','1/15.36e6' };
for k = 1:size(in_new,1)
    blk = [loop '/' in_new{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(6+k), ...
        'Position', [40 820+40*k 70 840+40*k]);
    set_param(blk, 'OutDataTypeStr', in_new{k,2}, 'SampleTime', in_new{k,3});
end

% --- (1b) DAC source MUX ---
% u1 = host stream (tx_source_select ~= 0), u3 = in-FPGA Tx. Host samples
% are valid-qualified at 30.72 then rate-transitioned to the DAC rate.
delete_line(loop, 'REP_TxI/1', 'tx_dataOutI/1');
delete_line(loop, 'REP_TxQ/1', 'tx_dataOutQ/1');
add_block('built-in/Switch', [loop '/MUX_DacI'], 'Criteria','u2 ~= 0', ...
    'Position',[700 860 730 890]);
add_block('built-in/Switch', [loop '/MUX_DacQ'], 'Criteria','u2 ~= 0', ...
    'Position',[700 910 730 940]);
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

% tx_validOut drives 'IP Load Tx Data OUT' (= upack fifo_rd_en). Pacing it
% with host_txValid (= 'IP Valid Tx Data IN' = the DAC's own request)
% recreates the stock rd_en=dac_valid loop, so DAC data updates exactly when
% the DAC latches. A free-running model strobe here duplicates/drops DAC
% samples (measured EVM ~0.6).
delete_line(loop, 'REP_TxValid/1', 'tx_validOut/1');
add_line(loop, 'host_txValid/1', 'tx_validOut/1', 'autorouting','on');
add_block('built-in/Terminator', [loop '/T_repValid'], 'Position',[700 990 720 1010]);
add_line(loop, 'REP_TxValid/1', 'T_repValid/1', 'autorouting','on');

% --- (1c) valid-qualified Rx front-end ---
% The cable branch of MUX_RxValid is constant true: the regularized ADC
% stream is continuous at 15.36 Msps, and the data path below delivers each
% sample exactly once per period regardless of the bus valid phase.
delete_line(loop, 'adc_validIn/1', 'MUX_RxValid/1');
add_block('built-in/Constant', [loop '/RxValidConst'], 'Value','true', ...
    'OutDataTypeStr','boolean', 'SampleTime','1/15.36e6', 'Position',[470 300 500 320]);
add_line(loop, 'RxValidConst/1', 'MUX_RxValid/1', 'autorouting','on');
% AdcCap registers data on valid-high beats at 30.72; AdcRT moves the held
% stream to 15.36; AdcStab pins the value for the whole period so the
% Receiver's input registers see one stable word per sample.
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
    add_block('built-in/Delay', [loop '/AdcStab' d], 'DelayLength','1', ...
        'Position',[500+60*(d=='Q') 540 540+60*(d=='Q') 580]);
    add_line(loop, ['AdcRT' d '/1'], ['AdcStab' d '/1'], 'autorouting','on');
    add_line(loop, ['AdcStab' d '/1'], ['MUX_Rx' d '/1'], 'autorouting','on');
end

% --- (1d) host->FPGA byte-transfer path ---
% Composite grows three inports (11..13) and one outport (12). The AXIS-side
% ByteWordBuffer runs at the 30.72 MHz bus rate; its head word/avail cross to
% the Transmitter's 7.68 MHz domain through RateTransitions. The Transmitter's
% extWordPop TOGGLE (flips once per word latch, so the slow->fast crossing
% cannot drop it) comes back at 30.72 MHz and is edge-detected into the FIFO
% pop pulse.
in_byte = { 'byte_data','uint64','1/30.72e6'; 'byte_valid','boolean','1/30.72e6'; ...
            'tx_data_source','uint32','1/15.36e6'; 'byte_first','boolean','1/30.72e6' };
for k = 1:size(in_byte,1)
    blk = [loop '/' in_byte{k,1}];
    add_block('built-in/Inport', blk, 'Port', num2str(10+k), ...
        'Position', [40 1020+40*k 70 1040+40*k]);
    set_param(blk, 'OutDataTypeStr', in_byte{k,2}, 'SampleTime', in_byte{k,3});
end
add_block('built-in/Outport', [loop '/byte_ready'], 'Port', '12', ...
    'Position', [800 540 830 560]);

% drop the generator-mode tie-offs build_composite put on the Transmitter's
% byte ports (delete lines BEFORE blocks -- dangling-line auto-capture gotcha)
delete_line(loop, 'c_extWord/1',  'Transmitter/5');  delete_block([loop '/c_extWord']);
delete_line(loop, 'c_extAvail/1', 'Transmitter/6');  delete_block([loop '/c_extAvail']);
delete_line(loop, 'c_extSel/1',   'Transmitter/7');  delete_block([loop '/c_extSel']);
delete_line(loop, 'c_extFirst/1', 'Transmitter/8');  delete_block([loop '/c_extFirst']);
delete_line(loop, 'Transmitter/9', 'T_extPop/1');    delete_block([loop '/T_extPop']);

% extWordPop toggle: 7.68M -> 30.72M (slow->fast RT is safe), then edge-detect
add_block('built-in/RateTransition', [loop '/PopRT'], ...
    'OutPortSampleTime','1/30.72e6', 'Position',[240 1180 280 1200]);
add_line(loop, 'Transmitter/9', 'PopRT/1', 'autorouting','on');
add_block('built-in/Delay', [loop '/PopDly'], 'DelayLength','1', ...
    'Position',[300 1210 340 1230]);
add_block('built-in/Logic', [loop '/PopEdge'], 'Operator','XOR', 'Inputs','2', ...
    'Position',[360 1180 400 1210]);
add_line(loop, 'PopRT/1',  'PopDly/1',  'autorouting','on');
add_line(loop, 'PopRT/1',  'PopEdge/1', 'autorouting','on');
add_line(loop, 'PopDly/1', 'PopEdge/2', 'autorouting','on');

% ByteWordBuffer @30.72M -- MATLAB Function wrapping qpskByteWordBuffer (the
% unit-tested single source of truth) with persistent state. The block emits
% readyNext (= state.readyReg AFTER the update); the explicit Delay below is
% the AXIS-mandated tready register, so byte_ready == the function's own
% registered ready, while keeping the byte_valid->byte_ready path free of
% direct feedthrough (no false algebraic loop against a reactive host source).
add_block('simulink/User-Defined Functions/MATLAB Function', ...
    [loop '/ByteWordBuffer'], 'Position',[430 1080 540 1200]);
bwbCh = sfroot().find('-isa','Stateflow.EMChart','Path',[loop '/ByteWordBuffer']);
assert(~isempty(bwbCh), 'ByteWordBuffer chart not found');
bwbCh.Script = sprintf([ ...
'function [word, avail, readyNext, wordFirst] = byteWordBufferBlk(dataIn, validIn, popReq, firstIn)\n' ...
'%% Block wrapper around qpskByteWordBuffer (unit-tested single source of\n' ...
'%% truth); persistent state only. readyNext = the post-update registered\n' ...
'%% ready; an external Delay (IC=1) turns it back into the AXIS tready.\n' ...
'%% firstIn/wordFirst carry the in-band first-word marker alongside data.\n' ...
'persistent state\n' ...
'if isempty(state)\n' ...
'    state = qpskByteWordBuffer();\n' ...
'end\n' ...
'[word, avail, ~, wordFirst, state] = qpskByteWordBuffer(state, uint64(dataIn), ...\n' ...
'    logical(validIn), logical(popReq), logical(firstIn));\n' ...
'readyNext = state.readyReg;\n']);
add_line(loop, 'byte_data/1',  'ByteWordBuffer/1', 'autorouting','on');
add_line(loop, 'byte_valid/1', 'ByteWordBuffer/2', 'autorouting','on');
add_line(loop, 'PopEdge/1',    'ByteWordBuffer/3', 'autorouting','on');
add_line(loop, 'byte_first/1', 'ByteWordBuffer/4', 'autorouting','on');
add_block('built-in/Delay', [loop '/ReadyDly'], 'DelayLength','1', ...
    'InitialCondition','1', 'Position',[600 1080 640 1100]);
add_line(loop, 'ByteWordBuffer/3', 'ReadyDly/1',   'autorouting','on');
add_line(loop, 'ReadyDly/1',       'byte_ready/1', 'autorouting','on');

% head word/avail/first: 30.72M -> 7.68M into the Transmitter byte ports
add_block('built-in/RateTransition', [loop '/WordRT'], ...
    'OutPortSampleTime','1/7.68e6', 'Position',[600 1120 640 1140]);
add_block('built-in/RateTransition', [loop '/AvailRT'], ...
    'OutPortSampleTime','1/7.68e6', 'Position',[600 1160 640 1180]);
add_block('built-in/RateTransition', [loop '/FirstRT'], ...
    'OutPortSampleTime','1/7.68e6', 'Position',[600 1200 640 1220]);
add_line(loop, 'ByteWordBuffer/1', 'WordRT/1',  'autorouting','on');
add_line(loop, 'ByteWordBuffer/2', 'AvailRT/1', 'autorouting','on');
add_line(loop, 'ByteWordBuffer/4', 'FirstRT/1', 'autorouting','on');
add_line(loop, 'WordRT/1',  'Transmitter/5', 'autorouting','on');
add_line(loop, 'AvailRT/1', 'Transmitter/6', 'autorouting','on');
add_line(loop, 'FirstRT/1', 'Transmitter/8', 'autorouting','on');

% tx_data_source (uint32 AXI reg) -> boolean (u ~= 0) -> 7.68M -> extBitSel
add_block('simulink/Logic and Bit Operations/Compare To Constant', ...
    [loop '/ByteSel'], 'relop','~=', 'const','0', 'Position',[240 1100 280 1130]);
add_block('built-in/RateTransition', [loop '/SelRT'], ...
    'OutPortSampleTime','1/7.68e6', 'Position',[300 1100 340 1130]);
add_line(loop, 'tx_data_source/1', 'ByteSel/1', 'autorouting','on');
add_line(loop, 'ByteSel/1', 'SelRT/1', 'autorouting','on');
add_line(loop, 'SelRT/1', 'Transmitter/7', 'autorouting','on');

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

% --- (3b) bytetx hdlworkflow patch: byte interface mappings + the byte
% reference design. The RD name is read from the plugin itself so the
% override can never drift from hdl/vendor ('JUPITER (RX & TX, BYTE DMA)').
addpath('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/hdl/vendor/AnalogDevices');
hRDbyte = AnalogDevices.jupiter.plugin_rd_rxtx_byte();
rdName  = hRDbyte.ReferenceDesignName;
assert(strcmp(rdName, 'JUPITER (RX & TX, BYTE DMA)'), ...
    'unexpected byte RD name: %s', rdName);
wfTxt = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_bytetx')
    patch = sprintf([ ...
      '%% --- variant_pre_composite_bytetx mappings ---\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_data'',  ''IOInterface'', ''Byte Data IN [0:63]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_data'',  ''IOInterfaceMapping'', ''[0:63]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_valid'', ''IOInterface'', ''Byte Valid IN'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_valid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_ready'', ''IOInterface'', ''Byte Ready OUT'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_ready'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_first'', ''IOInterface'', ''Byte First IN'');\n' ...
      'hdlset_param(''%s/TxRxComposite/byte_first'', ''IOInterfaceMapping'', ''[0]'');\n' ...
      'hdlset_param(''%s/TxRxComposite/tx_data_source'', ''IOInterface'', ''AXI4-Lite'');\n' ...
      'hdlset_param(''%s/TxRxComposite/tx_data_source'', ''IOInterfaceMapping'', ''x"11C"'');\n' ...
      '%% --- end variant_pre_composite_bytetx ---\n'], ...
      sys,sys,sys,sys,sys,sys,sys,sys,sys,sys);
    anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
    idx = strfind(wfTxt, anchor); assert(~isempty(idx), 'anchor not found');
    at = idx(1) + numel(anchor);
    if at <= numel(wfTxt) && wfTxt(at) == newline, at = at + 1; end
    wfTxt = [wfTxt(1:at-1) newline patch wfTxt(at:end)];
    % retarget the workflow at the byte reference design variant
    oldRD = sprintf('hdlset_param(''%s'', ''ReferenceDesign'', ''JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)'');', sys);
    newRD = sprintf('hdlset_param(''%s'', ''ReferenceDesign'', ''%s'');', sys, rdName);
    assert(contains(wfTxt, oldRD), 'ReferenceDesign line not found');
    wfTxt = strrep(wfTxt, oldRD, newRD);
    fid = fopen(wfFile,'w');
    fwrite(fid, wfTxt); fclose(fid);
    fprintf('bytetx overlay: hdlworkflow patched (RD=%s)\n', rdName);
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('bytetx overlay: done\n');
