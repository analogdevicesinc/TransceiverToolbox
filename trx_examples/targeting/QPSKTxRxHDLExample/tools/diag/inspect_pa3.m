here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
pac='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction';
function dumplvl(p)
  fprintf('\n##### %s #####\n', strrep(p,'commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction',''));
  b=find_system(p,'SearchDepth',1,'LookUnderMasks','all','FollowLinks','on','Type','block');
  for i=1:numel(b)
    if strcmp(b{i},p), continue; end
    try,bt=get_param(b{i},'BlockType');catch,bt='?';end
    nm=strrep(b{i},[p '/'],''); nm=regexprep(nm,'\s+',' ');
    pc=get_param(b{i},'PortConnectivity'); srcs={};
    for k=1:numel(pc), if ~isempty(pc(k).SrcBlock)&&isnumeric(pc(k).SrcBlock)&&any(pc(k).SrcBlock~=-1)
        try, srcs{end+1}=regexprep(get_param(pc(k).SrcBlock,'Name'),'\s+',' '); catch, end
    end; end
    extra='';
    for pr={'Value','Gain','Function','Operator','OutDataTypeStr'}
      try,v=get_param(b{i},pr{1}); if ~isempty(v)&&ischar(v), extra=[extra ' ' pr{1} '=' regexprep(v,'\s+',' ')]; end;catch,end
    end
    fprintf('  [%-10s] %-28s <- {%s}%s\n', bt, nm, strjoin(srcs,', '), extra);
  end
end
dumplvl(pac);
dumplvl([pac '/Phase Ambiguity Estimator']);
dumplvl([pac '/Average Estimates']);
dumplvl([pac '/Phase Ambiguity Corrector']);
