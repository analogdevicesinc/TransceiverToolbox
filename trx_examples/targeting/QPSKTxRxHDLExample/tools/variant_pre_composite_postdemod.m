% variant_pre_composite_postdemod -- composite_postdemod
%
% Re-routes iq_debug_mux input 5 (tap value 3, currently "constellation") to
% expose the post-Demod 2-bit output of the QPSK Demodulator. The 2 bits are
% packed as a complex IQ sample (bit_MSB → I=±0.5, bit_LSB → Q=±0.5, sfix16_En14)
% so it flows through the existing debugI/debugQ -> IP Data 0/1 OUT path and
% is captured via adi.ADRV9002.Rx DMA just like the other taps.
%
% After deploying, set rx_input_select=0 (internal loopback), iq_debug_mux=3,
% capture via DMA, hard-decode each captured complex sample to bits, compare
% to forward-scrambled PN. If post-Demod bits match scrambled-PN at <1% BER,
% the Demodulator is clean and the 7.27% comes from the Descrambler.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);

% Idempotency check
mark = [sys '/TxRxComposite/Receiver/QPSK Rx/PostDemod_IQ_Pack'];
try
    found = ~isempty(find_system(mark, 'SearchDepth',0));
catch
    found = false;
end
if found
    fprintf('variant_pre_composite_postdemod: already instrumented, skipping.\n');
    return;
end

qpskRx = [sys '/TxRxComposite/Receiver/QPSK Rx'];

% Find iq_debug_mux (MultiPortSwitch "Index Vector") in QPSK Rx
mux = [qpskRx '/Index Vector'];
assert(strcmp(get_param(mux,'BlockType'),'MultiPortSwitch'), 'iq_debug_mux not where expected');

% Get current source of mux input 5 (tap 3 = constellation, from Delay4)
muxPH = get_param(mux,'PortHandles');
tap3_line = get_param(muxPH.Inport(5), 'Line');
assert(tap3_line ~= -1, 'mux input 5 not connected');
tap3_src = get_param(tap3_line, 'SrcBlockHandle');
tap3_srcName = get_param(tap3_src, 'Name');
tap3_srcPort = get_param(tap3_line, 'SrcPort');
fprintf('Mux input 5 (tap 3) currently from: %s (port %d)\n', tap3_srcName, tap3_srcPort);

% Locate QPSK Demodulator/dataOut source line
demod = [qpskRx '/QPSK Demodulator'];
demodPH = get_param(demod,'PortHandles');
% dataOut is outport 1 (we verified earlier)
demodOutLine = get_param(demodPH.Outport(1), 'Line');
assert(demodOutLine ~= -1, 'Demod dataOut not connected');

% Build PostDemod_IQ_Pack as a MATLAB Function block.
% Input: ufix2 (2-bit symbol) + validIn (boolean).
% Output: complex sample as packed (I=sfix16_En14, Q=sfix16_En14).
% Approach: emit a Bus or just two outputs, then merge as complex.
%
% Simpler: use TWO MATLAB Function-less blocks (Bit Slice + Constant + Switch)
% to extract bit_MSB → ±0.5, bit_LSB → ±0.5. Then a complex-pack.

% Use a MATLAB Function block — simpler & more robust than chained Simulink
% library blocks with finicky parameter names.
packSys = [qpskRx '/PostDemod_IQ_Pack'];
add_block('simulink/User-Defined Functions/MATLAB Function', packSys, ...
    'Position',[100 800 250 850]);

% Replace the chart script with our 2-bit-to-IQ packer
sfRoot = sfroot;
emCharts = sfRoot.find('-isa','Stateflow.EMChart');
foundChart = false;
for k = 1:numel(emCharts)
    if strcmp(emCharts(k).Path, packSys)
        emCharts(k).Script = sprintf([...
            'function iq = pack(u)\n' ...
            '%%#codegen\n' ...
            'persistent iI iQ\n' ...
            'if isempty(iI), iI = fi(0,1,16,14); iQ = fi(0,1,16,14); end\n' ...
            '%% u is ufix2 in 0..3. MSB = floor(u/2), LSB = mod(u,2).\n' ...
            'msb = bitshift(uint8(u), -1);\n' ...
            'lsb = bitand(uint8(u), uint8(1));\n' ...
            'if msb >= 1, iI = fi(0.5,1,16,14); else, iI = fi(-0.5,1,16,14); end\n' ...
            'if lsb >= 1, iQ = fi(0.5,1,16,14); else, iQ = fi(-0.5,1,16,14); end\n' ...
            'iq = complex(iI, iQ);\n']);
        foundChart = true;
        break;
    end
end
if ~foundChart, error('PostDemod_IQ_Pack chart not found after add_block'); end

% Wire PostDemod_IQ_Pack into QPSK Rx:
% - Input: tap into QPSK Demodulator/dataOut (port 1). Branch by path.
add_line(qpskRx, 'QPSK Demodulator/1', 'PostDemod_IQ_Pack/1', 'autorouting','on');

% - Output: replace mux input 5 source.
%   First delete the old line into mux input 5 (the connection from tap3_srcName).
delete_line(qpskRx, sprintf('%s/1', tap3_srcName), 'Index Vector/5');
%   Add new line from PostDemod_IQ_Pack output to mux input 5.
add_line(qpskRx, 'PostDemod_IQ_Pack/1', 'Index Vector/5', 'autorouting','on');

fprintf('variant_pre_composite_postdemod: tap 3 of iq_debug_mux now sources post-Demod bits packed as IQ\n');
fprintf('  Set iq_debug_mux=3 on board to capture post-Demod via existing DMA path.\n');

% Also patch hdlworkflow_loopback.m for IOInterface mapping (same as DMA variant)
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt, 'variant_pre_composite_postdemod')
    patch = sprintf([ ...
        '%% --- variant_pre_composite_postdemod: route taps to DMA ---\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
        'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
        '%% --- end variant_pre_composite_postdemod ---\n'], sys, sys, sys, sys, sys, sys);
    anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
    idx = strfind(wfTxt, anchor);
    assert(~isempty(idx), 'anchor not found in %s', wfFile);
    insertAt = idx(1) + numel(anchor);
    if insertAt <= numel(wfTxt) && wfTxt(insertAt) == newline, insertAt = insertAt + 1; end
    newTxt = [wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
    fid = fopen(wfFile, 'w'); fwrite(fid, newTxt); fclose(fid);
    fprintf('  patched %s with IOInterface mappings.\n', wfFile);
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
