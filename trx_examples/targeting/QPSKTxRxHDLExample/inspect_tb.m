here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
for M={'sim_internal_baseline_TB','sim_taps_TB'}
  m=M{1};
  try
    load_system(m);
    fprintf('\n##### %s : StopTime=%s solver=%s #####\n', m, get_param(m,'StopTime'), get_param(m,'Solver'));
    b=find_system(m,'SearchDepth',1,'Type','block');
    for i=1:numel(b)
      if strcmp(b{i},m), continue; end
      bt=get_param(b{i},'BlockType'); nm=strrep(b{i},[m '/'],''); nm=regexprep(nm,'\s+',' ');
      fprintf('  [%-12s] %s\n', bt, nm);
    end
    % logged signals / To Workspace
    tw=find_system(m,'LookUnderMasks','all','FollowLinks','on','BlockType','ToWorkspace');
    for i=1:numel(tw), fprintf('   ToWorkspace: %s -> var %s\n', regexprep(strrep(tw{i},[m '/'],''),'\s+',' '), get_param(tw{i},'VariableName')); end
    close_system(m,0);
  catch ME
    fprintf('  %s: ERROR %s\n', m, ME.message);
  end
end
