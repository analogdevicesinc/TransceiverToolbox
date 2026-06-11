% probe_inputdata -- introspect the REAL wiring of Transmitter/Input Data
% in commhdlQPSKTxRx.slx (chart enable/reset sources, port lists, rates).
cd('/home/tcollins/dev/qpsk_ai/TransceiverToolbox/trx_examples/targeting/QPSKTxRxHDLExample');
addpath(pwd);
sys = 'commhdlQPSKTxRx';
load_system(sys);
try, evalin('base', get_param(sys,'InitFcn')); catch e, fprintf('InitFcn: %s\n', e.message); end

tx = [sys '/Transmitter'];
id = [tx '/Input Data'];

fprintf('=== Transmitter ports ===\n');
p = get_param(tx,'PortHandles');
fprintf('Tx: %d in, %d out\n', numel(p.Inport), numel(p.Outport));
blks = find_system(tx,'SearchDepth',1,'BlockType','Inport');
for k=1:numel(blks), fprintf('  TxIn %s port=%s\n', blks{k}, get_param(blks{k},'Port')); end
blks = find_system(tx,'SearchDepth',1,'BlockType','Outport');
for k=1:numel(blks), fprintf('  TxOut %s port=%s\n', blks{k}, get_param(blks{k},'Port')); end

fprintf('=== Transmitter top-level (depth1) blocks ===\n');
blks = find_system(tx,'SearchDepth',1);
for k=2:numel(blks)
    fprintf('  [%s] %s\n', get_param(blks{k},'BlockType'), blks{k});
end

fprintf('=== Input Data ports ===\n');
blks = find_system(id,'SearchDepth',1,'BlockType','Inport');
for k=1:numel(blks), fprintf('  IDIn %s port=%s\n', blks{k}, get_param(blks{k},'Port')); end
blks = find_system(id,'SearchDepth',1,'BlockType','Outport');
for k=1:numel(blks), fprintf('  IDOut %s port=%s\n', blks{k}, get_param(blks{k},'Port')); end

fprintf('=== Input Data (depth1) blocks ===\n');
blks = find_system(id,'SearchDepth',1);
for k=2:numel(blks)
    fprintf('  [%s] %s\n', get_param(blks{k},'BlockType'), blks{k});
end

% Wiring of Input Data ports: who feeds Input Data inputs inside Transmitter
fprintf('=== Transmitter-level connectivity of Input Data block ===\n');
pc = get_param(id,'PortConnectivity');
for k=1:numel(pc)
    c = pc(k);
    if ~isempty(c.SrcBlock) && all(c.SrcBlock ~= -1)
        fprintf('  ID port %s <- %s/%d\n', c.Type, get_param(c.SrcBlock,'Name'), c.SrcPort+1);
    end
    if ~isempty(c.DstBlock)
        for j=1:numel(c.DstBlock)
            fprintf('  ID port %s -> %s/%d\n', c.Type, get_param(c.DstBlock(j),'Name'), c.DstPort(j)+1);
        end
    end
end

% Message Generator subsystem internals
mg = [id '/Message Generator'];
fprintf('=== Message Generator (depth1) blocks ===\n');
blks = find_system(mg,'SearchDepth',1);
for k=2:numel(blks)
    fprintf('  [%s] %s\n', get_param(blks{k},'BlockType'), blks{k});
end
fprintf('=== Message Generator port connectivity (within Input Data) ===\n');
pc = get_param(mg,'PortConnectivity');
for k=1:numel(pc)
    c = pc(k);
    if ~isempty(c.SrcBlock) && all(c.SrcBlock ~= -1)
        fprintf('  MG port %s <- %s/%d\n', c.Type, get_param(c.SrcBlock,'Name'), c.SrcPort+1);
    end
    if ~isempty(c.DstBlock)
        for j=1:numel(c.DstBlock)
            fprintf('  MG port %s -> %s/%d\n', c.Type, get_param(c.DstBlock(j),'Name'), c.DstPort(j)+1);
        end
    end
end

% MATLAB Function chart inside Message Generator
mf = [mg '/MATLAB Function'];
fprintf('=== chart connectivity inside Message Generator ===\n');
pc = get_param(mf,'PortConnectivity');
for k=1:numel(pc)
    c = pc(k);
    if ~isempty(c.SrcBlock) && all(c.SrcBlock ~= -1)
        fprintf('  MF port %s <- %s/%d\n', c.Type, get_param(c.SrcBlock,'Name'), c.SrcPort+1);
    end
    if ~isempty(c.DstBlock)
        for j=1:numel(c.DstBlock)
            fprintf('  MF port %s -> %s/%d\n', c.Type, get_param(c.DstBlock(j),'Name'), c.DstPort(j)+1);
        end
    end
end

fprintf('=== chart script ===\n');
rt = sfroot;
ch = rt.find('-isa','Stateflow.EMChart','Path', mf);
disp(ch.Script);

% Full connectivity dump of every depth-1 block in Input Data
fprintf('=== Input Data full depth-1 connectivity ===\n');
blks = find_system(id,'SearchDepth',1);
for k=2:numel(blks)
    b = blks{k};
    pc = get_param(b,'PortConnectivity');
    for q=1:numel(pc)
        c = pc(q);
        if ~isempty(c.SrcBlock) && all(c.SrcBlock ~= -1)
            fprintf('  %s in[%s] <- %s/%d\n', get_param(b,'Name'), c.Type, get_param(c.SrcBlock,'Name'), c.SrcPort+1);
        end
    end
end

% Also dump Transmitter depth-1 connectivity
fprintf('=== Transmitter full depth-1 connectivity ===\n');
blks = find_system(tx,'SearchDepth',1);
for k=2:numel(blks)
    b = blks{k};
    pc = get_param(b,'PortConnectivity');
    for q=1:numel(pc)
        c = pc(q);
        if ~isempty(c.SrcBlock) && all(c.SrcBlock ~= -1)
            fprintf('  %s in[%s] <- %s/%d\n', get_param(b,'Name'), c.Type, get_param(c.SrcBlock,'Name'), c.SrcPort+1);
        end
    end
end
fprintf('PROBE_DONE\n');
