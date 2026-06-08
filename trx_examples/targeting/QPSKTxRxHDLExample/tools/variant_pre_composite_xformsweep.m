% xformsweep: insert a RUNTIME-selectable D4 transform on the cable I/Q path,
% controlled by a new AXI4-Lite register rx_xform (x"118"), so the host can sweep
% all 8 rotations+reflections from ONE bitstream and find the one that drives
% cable BER -> 0. Identity(0) (I,Q); conj(1) (I,-Q); negI(2) (-I,Q); 180(3) (-I,-Q);
% swap(4) (Q,I); 270(5) (Q,-I); 90(6) (-Q,I); swap+neg(7) (-Q,-I).
% Two 8-way Multiport Switches (I' and Q') fed by {I,-I,Q,-Q}, control=rx_xform.
% Only the cable branch (adc_dataIn* -> MUX_Rx*/1) is transformed; internal untouched.
sys  = 'commhdlQPSKTxRxLoopback';
load_system(sys);
loop = [sys '/TxRxComposite'];
assert(~isempty(find_system(loop,'SearchDepth',1,'Name','MUX_RxI')),'MUX_RxI not found');

% --- new AXI input rx_xform (uint32), port 7 (after the 6 existing inports) ---
xin = [loop '/rx_xform'];
add_block('built-in/Inport', xin, 'Port','7', 'Position',[40 360 70 380]);
set_param(xin, 'OutDataTypeStr','uint32', 'SampleTime','1/15.36e6');
% cast control to uint8 for the switch
add_block('built-in/DataTypeConversion',[loop '/XformCtl'], 'OutDataTypeStr','uint8', ...
          'Position',[110 360 150 380]);
add_line(loop, 'rx_xform/1', 'XformCtl/1', 'autorouting','on');

% --- negated copies of the cable I and Q ---
add_block('built-in/Gain',[loop '/NegI'], 'Gain','-1','OutDataTypeStr','int16', ...
          'SaturateOnIntegerOverflow','on','Position',[300 120 330 150]);
add_block('built-in/Gain',[loop '/NegQ'], 'Gain','-1','OutDataTypeStr','int16', ...
          'SaturateOnIntegerOverflow','on','Position',[300 170 330 200]);
add_line(loop, 'adc_dataInI/1', 'NegI/1', 'autorouting','on');
add_line(loop, 'adc_dataInQ/1', 'NegQ/1', 'autorouting','on');

% --- two 8-way Multiport Switches (zero-based), control first ---
muxI = [loop '/XformI']; muxQ = [loop '/XformQ'];
add_block('built-in/MultiPortSwitch', muxI, 'Inputs','8', ...
          'DataPortOrder','Zero-based contiguous', 'Position',[420 300 460 470]);
add_block('built-in/MultiPortSwitch', muxQ, 'Inputs','8', ...
          'DataPortOrder','Zero-based contiguous', 'Position',[420 500 460 670]);
% control -> port 1 of each
add_line(loop, 'XformCtl/1', 'XformI/1', 'autorouting','on');
add_line(loop, 'XformCtl/1', 'XformQ/1', 'autorouting','on');
% data tables (port 2..9 = data index 0..7):
%   I' = [ I  I -I -I  Q  Q -Q -Q ]
%   Q' = [ Q -Q  Q -Q  I -I  I -I ]
Isrc = {'adc_dataInI','adc_dataInI','NegI','NegI','adc_dataInQ','adc_dataInQ','NegQ','NegQ'};
Qsrc = {'adc_dataInQ','NegQ','adc_dataInQ','NegQ','adc_dataInI','NegI','adc_dataInI','NegI'};
for d = 1:8
    add_line(loop, [Isrc{d} '/1'], sprintf('XformI/%d',d+1), 'autorouting','on');
    add_line(loop, [Qsrc{d} '/1'], sprintf('XformQ/%d',d+1), 'autorouting','on');
end

% --- re-route cable branch through the transform ---
delete_line(loop, 'adc_dataInI/1', 'MUX_RxI/1');
delete_line(loop, 'adc_dataInQ/1', 'MUX_RxQ/1');
add_line(loop, 'XformI/1', 'MUX_RxI/1', 'autorouting','on');
add_line(loop, 'XformQ/1', 'MUX_RxQ/1', 'autorouting','on');

% --- patch hdlworkflow_loopback.m (cwd copy) to map rx_xform to AXI4-Lite x"118" ---
wfFile = 'hdlworkflow_loopback.m';
wfTxt  = fileread(wfFile);
if ~contains(wfTxt,'rx_xform')
    anchor = sprintf(['hdlset_param(''commhdlQPSKTxRxLoopback/TxRxComposite/rx_input_select'', ''IOInterfaceMapping'', ''x"114"'');']);
    ins = sprintf(['\n%% --- xformsweep: runtime D4 transform select (0..7) ---\n' ...
        'hdlset_param(''commhdlQPSKTxRxLoopback/TxRxComposite/rx_xform'', ''IOInterface'', ''AXI4-Lite'');\n' ...
        'hdlset_param(''commhdlQPSKTxRxLoopback/TxRxComposite/rx_xform'', ''IOInterfaceMapping'', ''x"118"'');']);
    wfTxt = strrep(wfTxt, anchor, [anchor ins]);
    f=fopen(wfFile,'w'); fwrite(f,wfTxt); fclose(f);
    assert(contains(fileread(wfFile),'rx_xform'),'workflow patch failed');
end
fprintf('xformsweep: added rx_xform AXI x"118" + 8-way D4 transform on cable I/Q\n');
