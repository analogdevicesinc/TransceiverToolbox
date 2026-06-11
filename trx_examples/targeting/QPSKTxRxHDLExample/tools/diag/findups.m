addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
load_system('commhdlQPSKTxRx');
% find blocks referencing UpsamplesRx
b=find_system('commhdlQPSKTxRx','LookUnderMasks','all','FollowLinks','on','Regexp','on','Name','.');
hits={};
for i=1:numel(b)
  pn=get_param(b{i},'ObjectParameters'); if isempty(pn), continue; end
  fn=fieldnames(pn);
  for j=1:numel(fn)
    try v=get_param(b{i},fn{j}); catch, continue; end
    if ischar(v)&&contains(v,'UpsamplesRx')
      fprintf('  %s . %s = %s\n', strrep(b{i},'commhdlQPSKTxRx/',''), fn{j}, v); 
    end
  end
end
% also check InitFcn / model workspace
fprintf('InitFcn: %s\n', get_param('commhdlQPSKTxRx','InitFcn'));
try, fprintf('base UpsamplesRx=%s UpsamplesTx=%s\n', mat2str(evalin('base','UpsamplesRx')), mat2str(evalin('base','UpsamplesTx'))); catch, fprintf('UpsamplesRx not in base yet\n'); end
