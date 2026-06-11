% probe_inputdata2 -- exact port numbers + connectivity inside Input Data and
% Message Generator (masked subsystems: use LookUnderMasks).
cd('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
addpath(pwd);
sys = 'commhdlQPSKTxRx';
load_system(sys);
id = [sys '/Transmitter/Input Data'];
mg = [id '/Message Generator'];

fprintf('Input Data Mask: %s, LinkStatus: %s\n', get_param(id,'Mask'), get_param(id,'LinkStatus'));

fprintf('=== Input Data depth-1 (LookUnderMasks) ===\n');
blks = find_system(id,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on');
for k=2:numel(blks)
    b = blks{k}; bt = get_param(b,'BlockType');
    extra = '';
    if any(strcmp(bt,{'Inport','Outport'})), extra = [' Port=' get_param(b,'Port')]; end
    fprintf('  [%s]%s %s\n', bt, extra, strrep(b,newline,' '));
end
fprintf('=== Input Data depth-1 connectivity ===\n');
for k=2:numel(blks)
    b = blks{k};
    pc = get_param(b,'PortConnectivity');
    for q=1:numel(pc)
        c = pc(q);
        if ~isempty(c.SrcBlock) && all(c.SrcBlock(:) ~= -1)
            fprintf('  %s in[%s] <- %s/%d\n', get_param(b,'Name'), c.Type, ...
                strrep(get_param(c.SrcBlock,'Name'),newline,' '), c.SrcPort+1);
        end
        if ~isempty(c.DstBlock)
            for j=1:numel(c.DstBlock)
                fprintf('  %s out[%s] -> %s/%d\n', get_param(b,'Name'), c.Type, ...
                    strrep(get_param(c.DstBlock(j),'Name'),newline,' '), c.DstPort(j)+1);
            end
        end
    end
end

fprintf('=== Message Generator ports (Port numbers) ===\n');
blks = find_system(mg,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on');
for k=2:numel(blks)
    b = blks{k}; bt = get_param(b,'BlockType');
    if any(strcmp(bt,{'Inport','Outport'}))
        fprintf('  [%s] %s Port=%s\n', bt, get_param(b,'Name'), get_param(b,'Port'));
    end
end

% sample times of key blocks
fprintf('=== sample/rate info ===\n');
for bb = {[id '/enb'], [id '/Delay'], [id '/Cast To Boolean'], [id '/txData'], [id '/txValid']}
    try
        st = get_param(bb{1},'CompiledSampleTime');
        fprintf('  %s CompiledSampleTime: (uncompiled, skip)\n', bb{1});
    catch
    end
end
fprintf('PROBE2_DONE\n');
