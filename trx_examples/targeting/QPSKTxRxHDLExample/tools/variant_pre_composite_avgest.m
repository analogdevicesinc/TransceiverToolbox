% variant_pre_composite_avgest -- expose the Phase Ambiguity averaged estimate
% (avgEst, complex per-packet rotation decision) on iq_debug_mux tap 3, flowing
% through debugI/debugQ -> IP Data 0/1 OUT -> DMA. Routes avgEst up:
%   Average Estimates -> Phase Ambig E&C -> Freq&Time Sync -> QPSK Rx -> mux in5.
% After deploy: rx_input_select=0, iq_debug_mux=3, DMA capture; captured complex
% value is held per packet = the rotation decision. Compare consistency HW vs sim.
sys = 'commhdlQPSKTxRxLoopback';
load_system(sys);
qpskRx = [sys '/TxRxComposite/Receiver/QPSK Rx'];
fts    = [qpskRx '/Frequency and Time Synchronizer'];
pa     = [fts '/Phase Ambiguity Estimation and Correction'];
ae     = [pa '/Average Estimates'];

if ~isempty(find_system(sys,'SearchDepth',inf,'Name','AvgEstTapMux'))
  fprintf('variant_pre_composite_avgest: already instrumented, skipping.\n'); return;
end

% helper: add an Outport to subsystem SS fed by source output-port handle SRCOUT
function outPortNum = add_dbg_outport(SS, name, srcOutHandle)
  np = numel(find_system(SS,'SearchDepth',1,'BlockType','Outport'));
  blk = [SS '/' name];
  add_block('built-in/Outport', blk, 'Port', num2str(np+1), 'Position',[800 40 830 60]);
  ip = get_param(blk,'PortHandles');
  add_line(SS, srcOutHandle, ip.Inport(1));   % branches from existing net
  outPortNum = np+1;
end

% 1) Average Estimates output -> new outport of Phase Ambig E&C
aePH = get_param(ae,'PortHandles');
n_pa = add_dbg_outport(pa, 'avgEstDbg', aePH.Outport(1));

% 2) the new PA outport appears on the PA block; route it up to a new FTS outport
paPH = get_param(pa,'PortHandles');
n_fts = add_dbg_outport(fts, 'avgEstDbg', paPH.Outport(n_pa));

% 3) at QPSK Rx: new FTS outport -> mux (Index Vector) input 5 (tap 3)
ftsPH = get_param(fts,'PortHandles');
mux = [qpskRx '/Index Vector'];
assert(strcmp(get_param(mux,'BlockType'),'MultiPortSwitch'),'mux not found');
muxPH = get_param(mux,'PortHandles');
% delete old source line into mux input 5
oldln = get_param(muxPH.Inport(5),'Line');
if oldln~=-1, delete_line(oldln); end
% a buffer-name marker block so idempotency check works
add_block('built-in/SubSystem',[qpskRx '/AvgEstTapMux'],'Position',[60 900 90 930]);
add_line(qpskRx, ftsPH.Outport(n_fts), muxPH.Inport(5));

fprintf('variant_pre_composite_avgest: tap 3 now = Phase Ambiguity avgEst (complex). FTS out #%d -> mux in5.\n', n_fts);

% patch hdlworkflow_loopback.m IOInterface mappings (route debug taps to DMA), same as postdemod
wfFile='hdlworkflow_loopback.m'; wfTxt=fileread(wfFile);
if ~contains(wfTxt,'variant_pre_composite_avgest')
  patch=sprintf([ ...
    '%% --- variant_pre_composite_avgest: route taps to DMA ---\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI'',''IOInterface'',''IP Data 0 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugI'',''IOInterfaceMapping'',''[0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ'',''IOInterface'',''IP Data 1 OUT [0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugQ'',''IOInterfaceMapping'',''[0:15]'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugValid'',''IOInterface'',''IP Data Valid OUT'');\n' ...
    'hdlset_param(''%s/TxRxComposite/debugValid'',''IOInterfaceMapping'',''[0]'');\n' ...
    '%% --- end variant_pre_composite_avgest ---\n'],sys,sys,sys,sys,sys,sys);
  anchor=sprintf('hdlset_param(''%s/TxRxComposite/bit_errors_out'', ''IOInterfaceMapping'', ''x"108"'');',sys);
  idx=strfind(wfTxt,anchor);
  if ~isempty(idx)
    insertAt=idx(1)+numel(anchor); if insertAt<=numel(wfTxt)&&wfTxt(insertAt)==newline, insertAt=insertAt+1; end
    newTxt=[wfTxt(1:insertAt-1) sprintf('\n') patch wfTxt(insertAt:end)];
    fid=fopen(wfFile,'w'); fwrite(fid,newTxt); fclose(fid);
    fprintf('  patched %s\n', wfFile);
  else
    fprintf('  WARN: anchor not found in %s; map debug taps manually.\n', wfFile);
  end
end

save_system(sys,[],'OverwriteIfChangedOnDisk',true);
fprintf('variant_pre_composite_avgest: done.\n');
