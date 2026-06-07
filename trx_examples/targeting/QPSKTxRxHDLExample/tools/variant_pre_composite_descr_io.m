% variant_pre_composite_descr_io -- composite_descr_io
%
% Packs the FULL descrambler-region bit-level interface into the debugI DMA tap
% so we can verify the HW descrambler in isolation and settle whether the 7.27%
% is a real LFSR/startIn-phase error or a BIST self-test artifact.
%
% 6 one-bit chain signals (captured EVERY clock, debugValid forced 1) packed into
% debugI's raw int16 (bit k = 2^k), routed through iq_debug_mux tap 3 -> debugI ->
% IP Data 0 OUT -> libiio DMA:
%   bit0 = QPSK Demodulator dataOut   (descrambler dataIn  = scrambled bit)
%   bit1 = QPSK Demodulator startOut  (descrambler startIn = LFSR reset)
%   bit2 = QPSK Demodulator validOut  (descrambler validIn)
%   bit3 = HDL Data Descrambler dataOut  (descrambled bit out)
%   bit4 = HDL Data Descrambler startOut
%   bit5 = HDL Data Descrambler validOut
% Analysis (off-board): reconstruct the demod bit stream (gated by bit2), SW-descramble
% (x^7+x^4+1, reset on bit1), compare to HW descrambled stream (bit3 gated by bit5),
% and compare HW descrambled bits to "ADI Hello World".
%
% Deploy: rx_input_select=0, iq_debug_mux=3, capture debugI via adi.ADRV9002.Rx DMA.

sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);
qpskRx = [sys '/TxRxComposite/Receiver/QPSK Rx'];
packSys = [qpskRx '/DescrIO_Pack'];

if ~isempty(find_system(qpskRx,'SearchDepth',1,'Name','DescrIO_Pack'))
    fprintf('variant_pre_composite_descr_io: already instrumented, skipping.\n'); return;
end

% locate the demod + descrambler blocks (names mirror the generated Verilog u_*)
ff = {'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on'};
assert(~isempty(find_system(qpskRx,ff{:},'Name','QPSK Demodulator')), 'QPSK Demodulator not found');
assert(~isempty(find_system(qpskRx,ff{:},'Name','HDL Data Descrambler')), 'HDL Data Descrambler not found');

% MATLAB Function packer: 6 boolean inputs -> complex IQ whose I raw int16 = packed code
add_block('simulink/User-Defined Functions/MATLAB Function', packSys, 'Position',[100 900 280 990]);
sfRoot = sfroot; charts = sfRoot.find('-isa','Stateflow.EMChart'); ok=false;
for k=1:numel(charts)
  if strcmp(charts(k).Path, packSys)
    charts(k).Script = sprintf([ ...
      'function iq = pack(dD,dS,dV,xD,xS,xV)\n' ...
      '%%#codegen\n' ...
      'c = uint16(0);\n' ...
      'if dD, c = c + uint16(1);  end\n' ...
      'if dS, c = c + uint16(2);  end\n' ...
      'if dV, c = c + uint16(4);  end\n' ...
      'if xD, c = c + uint16(8);  end\n' ...
      'if xS, c = c + uint16(16); end\n' ...
      'if xV, c = c + uint16(32); end\n' ...
      '%% bit-preserving reinterpret (no float cast): raw int16 = packed code\n' ...
      'I = reinterpretcast(fi(c,0,16,0), numerictype(1,16,14));\n' ...
      'iq = complex(I, fi(0,1,16,14));\n']);
    ok=true; break;
  end
end
assert(ok,'DescrIO_Pack chart not found');

% wire 6 taps into the packer (branch off existing output lines)
% block outputs are [1]=data [2]=start [3]=end [4]=valid for BOTH blocks
add_line(qpskRx, 'QPSK Demodulator/1', 'DescrIO_Pack/1', 'autorouting','on');     % demod data
add_line(qpskRx, 'QPSK Demodulator/2', 'DescrIO_Pack/2', 'autorouting','on');     % demod start
add_line(qpskRx, 'QPSK Demodulator/4', 'DescrIO_Pack/3', 'autorouting','on');     % demod valid
add_line(qpskRx, 'HDL Data Descrambler/1', 'DescrIO_Pack/4', 'autorouting','on'); % descr data
add_line(qpskRx, 'HDL Data Descrambler/2', 'DescrIO_Pack/5', 'autorouting','on'); % descr start
add_line(qpskRx, 'HDL Data Descrambler/4', 'DescrIO_Pack/6', 'autorouting','on'); % descr valid

% route packer to iq_debug_mux tap 3 (input 5) -- use handles (mux name has a newline)
muxList = find_system(qpskRx,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','BlockType','MultiPortSwitch');
assert(~isempty(muxList),'iq_debug_mux (MultiPortSwitch) not found');
mux = muxList{1};
muxPH = get_param(mux,'PortHandles');
oldline = get_param(muxPH.Inport(5),'Line');
if oldline ~= -1, delete_line(oldline); end
packPH = get_param(packSys,'PortHandles');
add_line(qpskRx, packPH.Outport(1), muxPH.Inport(5), 'autorouting','on');

% force debugValid = 1 so DMA captures every clock (full bit-timing visibility).
% TxRxComposite/debugValid is driven from QPSK Rx debugValid output; simplest is to
% leave it -- the analysis uses the embedded valid bits (bit2/bit5) instead.

% DMA IOInterface mapping (same as dma_postagc)
wfFile = 'hdlworkflow_loopback.m'; wfTxt = fileread(wfFile);
if ~contains(wfTxt,'variant_pre_composite_descr_io')
  patch = sprintf([ ...
   '%% --- variant_pre_composite_descr_io: route taps to DMA ---\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
   '%% --- end variant_pre_composite_descr_io ---\n'], sys,sys,sys,sys,sys,sys);
  anchor = sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
  idx = strfind(wfTxt, anchor); assert(~isempty(idx),'anchor not found');
  insertAt = idx(1)+numel(anchor); if insertAt<=numel(wfTxt) && wfTxt(insertAt)==newline, insertAt=insertAt+1; end
  newTxt = [wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
  fid=fopen(wfFile,'w'); fwrite(fid,newTxt); fclose(fid);
  fprintf('  patched %s\n', wfFile);
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('variant_pre_composite_descr_io: packed 6 descrambler-region bits into debugI tap 3.\n');
