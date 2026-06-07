% variant_pre_composite_descr_io_sym -- SYMBOL-RATE descrambler-I/O capture.
% Fix for descr_io aliasing: the iq_debug_mux/DMA debug path runs at the SYMBOL
% rate, and the demod/descrambler outputs are ufix2 (2 bits/symbol). So pack at the
% symbol rate (like the proven composite_postdemod overlay):
%   bits[1:0] = QPSK Demodulator output symbol (ufix2)  -> descrambler INPUT
%   bits[3:2] = HDL Data Descrambler output symbol (ufix2) -> descrambler OUTPUT (= BIST input)
%   bit [4]   = HDL Data Descrambler startOut (packet boundary / BIST dataSrt)
% into debugI raw int16, routed via iq_debug_mux tap 3 -> debugI -> IP Data 0 OUT -> DMA.
% Off-board: unpack 2+2+1, build descrambler-output bit stream framed by start, compare
% to "ADI Hello World" (=> is descrambler output correct?  real bug vs BIST artifact);
% and SW-descramble the demod symbols to cross-check the HW descrambler.
sys = 'commhdlQPSKTxRxLoopback'; load_system(sys);
qpskRx = [sys '/TxRxComposite/Receiver/QPSK Rx'];
packSys = [qpskRx '/DescrIOsym_Pack'];
if ~isempty(find_system(qpskRx,'SearchDepth',1,'LookUnderMasks','all','Name','DescrIOsym_Pack'))
  fprintf('descr_io_sym: already instrumented, skipping.\n'); return;
end
ff={'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on'};
assert(~isempty(find_system(qpskRx,ff{:},'Name','QPSK Demodulator')),'demod missing');
assert(~isempty(find_system(qpskRx,ff{:},'Name','HDL Data Descrambler')),'descr missing');

add_block('simulink/User-Defined Functions/MATLAB Function', packSys, 'Position',[100 900 290 990]);
sfRoot=sfroot; ch=sfRoot.find('-isa','Stateflow.EMChart'); ok=false;
for k=1:numel(ch)
  if strcmp(ch(k).Path,packSys)
    ch(k).Script=sprintf([ ...
      'function iq = pack(xsym,st)\n' ...
      '%%#codegen\n' ...
      '%% xsym = descrambler output symbol (ufix2 0..3); st = startOut (logical)\n' ...
      'code = uint16(xsym);\n' ...
      'if st, code = code + uint16(4); end\n' ...
      'I = reinterpretcast(fi(code,0,16,0), numerictype(1,16,14));\n' ...
      'iq = complex(I, fi(0,1,16,14));\n']);
    ok=true; break;
  end
end
assert(ok,'DescrIOsym_Pack chart not found');

% taps: descrambler out symbol (out1), descrambler startOut (out2)
add_line(qpskRx, 'HDL Data Descrambler/1', 'DescrIOsym_Pack/1', 'autorouting','on');
add_line(qpskRx, 'HDL Data Descrambler/2', 'DescrIOsym_Pack/2', 'autorouting','on');

% route to iq_debug_mux tap 3 (input 5) -- handle-based (mux name has newline)
muxList = find_system(qpskRx,ff{:},'BlockType','MultiPortSwitch');
assert(~isempty(muxList),'iq_debug_mux not found');
mux=muxList{1}; muxPH=get_param(mux,'PortHandles');
ol=get_param(muxPH.Inport(5),'Line'); if ol~=-1, delete_line(ol); end
packPH=get_param(packSys,'PortHandles');
add_line(qpskRx, packPH.Outport(1), muxPH.Inport(5), 'autorouting','on');

% DMA mapping (same anchor as postdemod/dma_postagc)
wfFile='hdlworkflow_loopback.m'; wfTxt=fileread(wfFile);
if ~contains(wfTxt,'variant_pre_composite_descr_io_sym')
  patch=sprintf([ ...
   '%% --- variant_pre_composite_descr_io_sym: route taps to DMA ---\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n' ...
   '%% --- end variant_pre_composite_descr_io_sym ---\n'], sys,sys,sys,sys,sys,sys);
  anchor=sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
  idx=strfind(wfTxt,anchor); assert(~isempty(idx),'anchor not found');
  insertAt=idx(1)+numel(anchor); if insertAt<=numel(wfTxt)&&wfTxt(insertAt)==newline, insertAt=insertAt+1; end
  newTxt=[wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
  fid=fopen(wfFile,'w'); fwrite(fid,newTxt); fclose(fid); fprintf('  patched %s\n',wfFile);
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('descr_io_sym: packed demod-sym + descr-sym + start at SYMBOL rate into tap 3.\n');
