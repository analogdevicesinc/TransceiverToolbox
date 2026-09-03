function results = runSweep(outFile, configs, synthesizeDesign)
%RUNSWEEP Run restartable BSPTests builds one configuration at a time.
%
% runSweep()                         creates/packages every registered design.
% runSweep(file, configs, true)      also builds the FPGA bitstream.
% configs may be a cell array, "all", or "standard-modes". The latter runs
% every RX/TX/RXTX design and excludes only special modes such as TXRX.

if nargin < 1 || isempty(outFile)
    outFile = 'sweep_results.txt';
end
if nargin < 2 || isempty(configs)
    configs = board_variants;
elseif ischar(configs) || isstring(configs)
    if strcmpi(string(configs),'all')
        configs = board_variants;
    elseif strcmpi(string(configs),'standard-modes')
        configs = board_variants;
        configs = configs(endsWith(configs, ...
            {'plugin_rd_rx','plugin_rd_tx','plugin_rd_rxtx'}));
    else
        configs = cellstr(configs);
    end
end
if nargin < 3
    synthesizeDesign = false;
end

results = struct('Config',{},'Status',{},'Duration',{},'Details',{});
initialTempDirs = string({dir('tp*').name});
appendLine(outFile, sprintf('# sweep started %s (%d configs, synthesize=%d)', ...
    string(datetime('now','Format','yyyy-MM-dd HH:mm:ss')), ...
    numel(configs), synthesizeDesign));

for k = 1:numel(configs)
    config = configs{k};
    started = tic;
    status = 'ERROR';
    details = '';
    try
        r = runOneHDLTest(['*',config], synthesizeDesign);
        if all([r.Passed])
            status = 'PASS';
        elseif any([r.Incomplete])
            status = 'INCOMPLETE';
        else
            status = 'FAIL';
        end
    catch exception
        details = strrep(exception.message, newline, ' ');
    end
    duration = toc(started);
    results(end+1) = struct('Config',config,'Status',status, ... %#ok<AGROW>
        'Duration',duration,'Details',details);
    appendLine(outFile, sprintf('%-10s %8.1fs  %s  %s', ...
        status, duration, config, details));
    fprintf('[%d/%d] %s %s\n', k, numel(configs), status, config);
    bdclose('all');
    generated = setdiff(string({dir('tp*').name}), initialTempDirs);
    for folder = generated
        try
            rmdir(folder,'s');
        catch
        end
    end
end

appendLine(outFile, '# sweep complete');
if ~all(strcmp({results.Status},'PASS'))
    error('One or more HDL builds did not pass; see %s.', outFile);
end
end

function appendLine(outFile, line)
file = fopen(outFile,'a');
cleanup = onCleanup(@() fclose(file));
fprintf(file,'%s\n',line);
end
