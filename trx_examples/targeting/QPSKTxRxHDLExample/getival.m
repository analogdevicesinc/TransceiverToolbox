here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
try, commhdlQPSKTxRxParameters; catch, end
try, evalin('base','commhdlQPSKTxRxModelInit'); catch ME, fprintf('init: %s\n',ME.message); end
try, fprintf('integAvgLen = %s\n', mat2str(evalin('base','integAvgLen'))); catch, fprintf('integAvgLen undefined in base after init\n'); end
% where is it set? search the InitFcn / param scripts
