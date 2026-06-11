here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
m='sim_internal_baseline_TB'; load_system(m);
ch=[m '/Channel'];
fprintf('=== Channel mask params ===\n');
try, mn=get_param(ch,'MaskNames'); mv=get_param(ch,'MaskValues');
  for i=1:numel(mn), fprintf('  %s = %s\n', mn{i}, mv{i}); end
catch ME, fprintf('  no mask: %s\n', ME.message); end
fprintf('\n=== Channel internal blocks ===\n');
b=find_system(ch,'LookUnderMasks','all','FollowLinks','on','Type','block');
for i=1:numel(b)
  if strcmp(b{i},ch), continue; end
  bt=get_param(b{i},'BlockType'); nm=strrep(b{i},[ch '/'],''); nm=regexprep(nm,'\s+',' ');
  ex='';
  for pr={'Value','Gain','Frequency','phase','FrequencyOffset','Variance','SNR'}
    try,v=get_param(b{i},pr{1}); if ischar(v)&&~isempty(v), ex=[ex ' ' pr{1} '=' v]; end;catch,end
  end
  fprintf('  [%-14s] %s%s\n', bt, nm, ex);
end
% scopes/spectrum to disable for fast runs
fprintf('\n=== viz blocks to disable for fast sim ===\n');
for bt={'SpectrumAnalyzer','Scope'}
  vb=find_system(m,'BlockType',bt{1});
  for i=1:numel(vb), fprintf('  %s: %s\n', bt{1}, regexprep(strrep(vb{i},[m '/'],''),'\s+',' ')); end
end
