function runSweep(outFile, configs)
% Run BSPTests (SynthesizeDesign=false) one config at a time, appending a
% one-line result per config to outFile.
%
% runSweep()                     - every entry in board_variants
% runSweep(outFile)              - same, custom results file
% runSweep(outFile, 'family')    - one representative mode per board+carrier
% runSweep(outFile, {'a','b'})   - an explicit list of plugin_rd names
%
% Written per-config rather than as one runner.run(suite) so a crash in one
% design does not lose the results of the configs already completed.

if nargin < 1 || isempty(outFile)
    outFile = 'sweep_results.txt';
end
if nargin < 2 || isempty(configs)
    configs = board_variants;
end

if ischar(configs) || isstring(configs)
    if strcmpi(configs,'family')
        configs = representativeConfigs(board_variants,'rx');
    elseif strcmpi(configs,'family-tx')
        configs = representativeConfigs(board_variants,'tx');
    else
        configs = {char(configs)};
    end
end

import matlab.unittest.TestSuite
import matlab.unittest.parameters.Parameter

setenv('CUSTOM_VIVADO_PATH','/tools/Xilinx/2025.1/Vivado/bin/vivado');

% Newly registered boards only show up after a customization refresh.
try
    Advisor.Manager.refresh_customizations;
catch
end
rehash toolboxcache

param = Parameter.fromData('SynthesizeDesign',{false});

appendLine(outFile, sprintf('# sweep started %s (%d configs)', ...
    string(datetime('now','Format','yyyy-MM-dd HH:mm:ss')), numel(configs)));

for k = 1:numel(configs)
    cfg = configs{k};
    t0 = tic;
    status = 'ERROR';
    detail = '';
    try
        suite = TestSuite.fromClass(?BSPTests,'ExternalParameters',param);
        suite = suite.selectIf('ParameterProperty','configs','ParameterName',['*',cfg]);
        if isempty(suite)
            status = 'NOTFOUND';
        else
            runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail',1);
            r = runner.run(suite);
            if all([r.Passed])
                status = 'PASS';
            elseif any([r.Incomplete])
                status = 'INCOMPLETE';
            else
                status = 'FAIL';
            end
        end
    catch ME
        detail = strrep(ME.message, newline, ' ');
    end
    appendLine(outFile, sprintf('%-10s %7.1fs  %s  %s', status, toc(t0), cfg, detail));
    fprintf('[%d/%d] %s %s\n', k, numel(configs), status, cfg);

    % Each build leaves a tempname folder behind; clear them so a long sweep
    % does not fill the disk.
    d = dir('tp*');
    for j = 1:numel(d)
        if d(j).isdir
            try
                rmdir(d(j).name,'s');
            catch
            end
        end
    end
    bdclose('all');
end

appendLine(outFile, '# sweep complete');
fprintf('sweep complete\n');
end

function appendLine(outFile, line)
fid = fopen(outFile,'a');
fprintf(fid,'%s\n',line);
fclose(fid);
end

function out = representativeConfigs(all, mode)
% Keep one config per board+carrier. mode 'rx' (default) takes the first
% listed variant; mode 'tx' takes the tx variant, which exercises a different
% port map and has broken independently of rx.
if nargin < 2
    mode = 'rx';
end
out = {};
seen = containers.Map();
for k = 1:numel(all)
    parts = strsplit(all{k},'.');
    boardKey = strjoin(parts(1:end-1),'.');
    isTx = strcmp(parts{end},'plugin_rd_tx');
    if strcmp(mode,'tx') ~= isTx
        continue
    end
    if ~isKey(seen,boardKey)
        seen(boardKey) = true;
        out{end+1} = all{k}; %#ok<AGROW>
    end
end
end
