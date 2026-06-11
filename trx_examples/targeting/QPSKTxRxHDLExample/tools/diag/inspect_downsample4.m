%% inspect_downsample4 - find Downsample4 and the rate context

cd(fileparts(mfilename('fullpath')));
addpath(pwd);

model = 'commhdlQPSKTxRxLoopback';
load_system(model);

% Try update first to compile rates
try
    set_param(model, 'SimulationCommand', 'update');
    fprintf('Update Diagram OK.\n\n');
catch ME
    fprintf('Update Diagram failed: %s\n\n', ME.message);
end

ds = 'commhdlQPSKTxRxLoopback/TxRxComposite/Receiver/Downsample4';
fprintf('=== Downsample4 block params ===\n');
fields = {'BlockType','N','SampleOffset','FrameBased','InitialConditions',...
          'InputProcessing','OutputSampleTimeMode','OutputSampleTime'};
for k=1:numel(fields)
    try
        v = get_param(ds, fields{k});
        fprintf('  %-25s = %s\n', fields{k}, char(string(v)));
    catch
    end
end

fprintf('\n=== Downsample4 port connectivity ===\n');
ph = get_param(ds, 'PortHandles');
for k = 1:numel(ph.Inport)
    line = get_param(ph.Inport(k), 'Line');
    if line ~= -1
        src = get_param(line, 'SrcBlockHandle');
        if src ~= -1
            fprintf('  In %d  <- %s\n', k, get_param(src,'Name'));
            try
                ts = get_param(line, 'CompiledSampleTime');
                fprintf('         CompiledSampleTime = %s\n', mat2str(ts));
            catch
            end
        end
    end
end

fprintf('\n=== Receiver subsystem Inport(s) and their internal SampleTime ===\n');
rxIn = find_system('commhdlQPSKTxRxLoopback/TxRxComposite/Receiver','SearchDepth',1,'BlockType','Inport');
for k=1:numel(rxIn)
    [~,nm] = fileparts(rxIn{k});
    st = get_param(rxIn{k},'SampleTime');
    fprintf('  Inport %d (%s): SampleTime=%s\n', k, nm, st);
    % What does this Inport connect to internally?
    iph = get_param(rxIn{k},'PortHandles');
    for j = 1:numel(iph.Outport)
        ln = get_param(iph.Outport(j),'Line');
        if ln ~= -1
            dst = get_param(ln,'DstBlockHandle');
            for d = dst(:)'
                if d ~= -1
                    fprintf('           -> %s\n', get_param(d,'Name'));
                end
            end
        end
    end
end

fprintf('\n=== TxRxComposite/Receiver/Downsample* listing ===\n');
ds_all = find_system('commhdlQPSKTxRxLoopback/TxRxComposite/Receiver','LookUnderMasks','all','FollowLinks','on','BlockType','DownSample');
for k=1:numel(ds_all)
    fprintf('  %s\n', ds_all{k});
end

bdclose(model);
