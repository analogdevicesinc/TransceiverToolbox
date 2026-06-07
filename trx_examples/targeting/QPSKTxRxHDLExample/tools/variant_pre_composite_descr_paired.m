% variant_pre_composite_descr_paired -- SYMBOL-RATE paired demod+descrambler capture.
% Packs, per symbol, both the descrambler INPUT and OUTPUT so we can verify the HW
% descrambler in isolation (SW-descramble the demod symbols, compare to HW descr out):
%   bits[1:0] = QPSK Demodulator output symbol (ufix2)      = descrambler INPUT
%   bits[3:2] = HDL Data Descrambler output symbol (ufix2)  = descrambler OUTPUT
%   bit [4]   = HDL Data Descrambler startOut (packet boundary)
% via iq_debug_mux tap 3 -> debugI -> IP Data 0 OUT -> DMA. (If the two stages are at
% different sample rates this build fails codegen fast; descr_io_sym is the safe fallback.)
sys='commhdlQPSKTxRxLoopback'; load_system(sys);
qpskRx=[sys '/TxRxComposite/Receiver/QPSK Rx'];
packSys=[qpskRx '/DescrPaired_Pack'];
if ~isempty(find_system(qpskRx,'SearchDepth',1,'LookUnderMasks','all','Name','DescrPaired_Pack'))
  fprintf('descr_paired: already instrumented, skipping.\n'); return;
end
ff={'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on'};
add_block('simulink/User-Defined Functions/MATLAB Function', packSys, 'Position',[100 900 290 990]);
sfRoot=sfroot; ch=sfRoot.find('-isa','Stateflow.EMChart'); ok=false;
for k=1:numel(ch)
  if strcmp(ch(k).Path,packSys)
    ch(k).Script=sprintf([ ...
      'function iq = pack(dsym,xsym,st)\n%%#codegen\n' ...
      'code = uint16(dsym) + uint16(xsym)*uint16(4);\n' ...
      'if st, code = code + uint16(16); end\n' ...
      'I = reinterpretcast(fi(code,0,16,0), numerictype(1,16,14));\n' ...
      'iq = complex(I, fi(0,1,16,14));\n']);
    ok=true; break;
  end
end
assert(ok,'DescrPaired_Pack chart not found');
add_line(qpskRx, 'QPSK Demodulator/1', 'DescrPaired_Pack/1', 'autorouting','on');
add_line(qpskRx, 'HDL Data Descrambler/1', 'DescrPaired_Pack/2', 'autorouting','on');
add_line(qpskRx, 'HDL Data Descrambler/2', 'DescrPaired_Pack/3', 'autorouting','on');
muxList=find_system(qpskRx,ff{:},'BlockType','MultiPortSwitch'); mux=muxList{1};
muxPH=get_param(mux,'PortHandles'); ol=get_param(muxPH.Inport(5),'Line'); if ol~=-1, delete_line(ol); end
packPH=get_param(packSys,'PortHandles');
add_line(qpskRx, packPH.Outport(1), muxPH.Inport(5), 'autorouting','on');
wfFile='hdlworkflow_loopback.m'; wfTxt=fileread(wfFile);
if ~contains(wfTxt,'variant_pre_composite_descr_paired')
  patch=sprintf([ ...
   '%% --- variant_pre_composite_descr_paired ---\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterface'', ''IP Data 0 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugI'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterface'', ''IP Data 1 OUT [0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugQ'',     ''IOInterfaceMapping'', ''[0:15]'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterface'', ''IP Data Valid OUT'');\n' ...
   'hdlset_param(''%s/TxRxComposite/debugValid'', ''IOInterfaceMapping'', ''[0]'');\n'], sys,sys,sys,sys,sys,sys);
  anchor=sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');', sys);
  idx=strfind(wfTxt,anchor); insertAt=idx(1)+numel(anchor); if insertAt<=numel(wfTxt)&&wfTxt(insertAt)==newline, insertAt=insertAt+1; end
  newTxt=[wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
  fid=fopen(wfFile,'w'); fwrite(fid,newTxt); fclose(fid);
end
save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('descr_paired: packed demod-sym + descr-sym + start at symbol rate into tap 3.\n');
