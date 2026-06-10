here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
cfc='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator';
function dumplvl(p,root)
  fprintf('\n##### %s #####\n', strrep(p,root,''));
  b=find_system(p,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','Type','block');
  for i=1:numel(b)
    if strcmp(b{i},p), continue; end
    try,bt=get_param(b{i},'BlockType');catch,bt='?';end
    nm=strrep(b{i},[p '/'],''); nm=regexprep(nm,'\s+',' ');
    pc=get_param(b{i},'PortConnectivity'); srcs={};
    for k=1:numel(pc), if ~isempty(pc(k).SrcBlock)&&isnumeric(pc(k).SrcBlock)&&any(pc(k).SrcBlock~=-1)
        try, srcs{end+1}=regexprep(get_param(pc(k).SrcBlock,'Name'),'\s+',' '); catch, end
    end; end
    ex='';
    for pr={'Value','Gain','Function','Operator','OutDataTypeStr','NumberOfBits','Table'}
      try,v=get_param(b{i},pr{1}); if ~isempty(v)&&ischar(v), if numel(v)>40,v=[v(1:37) '...'];end; ex=[ex ' ' pr{1} '=' regexprep(v,'\s+',' ')]; end;catch,end
    end
    fprintf('  [%-12s] %-26s <- {%s}%s\n', bt, nm, strjoin(srcs,', '), ex);
  end
end
R='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator';
dumplvl(cfc,R);
dumplvl([cfc '/Coarse Frequency Estimator'],R);
% the FFT length / resolution params likely in mask or workspace
fprintf('\n=== workspace coarse-freq params ===\n');
w=who; 
for i=1:numel(w), if ~isempty(regexpi(w{i},'coarse|freqres|fftlen|CFC|FreqEst')), fprintf('  %s = %s\n', w{i}, mat2str(evalin('base',w{i}))); end; end
