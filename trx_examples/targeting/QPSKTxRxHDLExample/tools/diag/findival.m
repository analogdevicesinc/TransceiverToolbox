here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
load_system('commhdlQPSKTxRx');
% walk up: which block has a mask defining integAvgLen?
allb=find_system('commhdlQPSKTxRx','LookUnderMasks','all','FollowLinks','on','Regexp','on','Name','.');
found=false;
for i=1:numel(allb)
  try
    mo=Simulink.Mask.get(allb{i});
    if ~isempty(mo)
      names={mo.Parameters.Name};
      idx=find(strcmp(names,'integAvgLen'));
      if ~isempty(idx)
        fprintf('MASK DEFINES integAvgLen on:\n  %s\n', allb{i});
        for k=idx, fprintf('   value="%s" evaluated=', mo.Parameters(k).Value);
          try, fprintf('%s\n', mat2str(get_param(allb{i},'integAvgLen'))); catch, fprintf('?\n'); end
        end
        % dump all mask params of this block
        for k=1:numel(mo.Parameters)
          try, ev=get_param(allb{i},mo.Parameters(k).Name); if isnumeric(ev), ev=mat2str(ev); end; catch, ev='?'; end
          fprintf('     %s = %s  (def "%s")\n', mo.Parameters(k).Name, ev, mo.Parameters(k).Value);
        end
        found=true;
      end
    end
  catch
  end
end
if ~found, fprintf('No mask defines integAvgLen; checking get_param on Coarse Freq Estimator directly\n');
  cfe='commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency Estimator';
  try, fprintf('  CFE integAvgLen=%s\n', mat2str(get_param(cfe,'integAvgLen'))); catch ME, fprintf('  %s\n',ME.message); end
end
