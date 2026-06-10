addpath(pwd);
f='rx_capture_adrv9002_hdl.mat';
if exist(f,'file')
  s=load(f); fn=fieldnames(s);
  fprintf('=== %s contents ===\n', f);
  for i=1:numel(fn)
    v=s.(fn{i}); sz=size(v);
    fprintf('  %s : %s %s', fn{i}, class(v), mat2str(sz));
    if isnumeric(v)&&~isempty(v)
      vv=double(v(:)); fprintf('  | real[min,max]=[%.3g,%.3g]', min(real(vv)),max(real(vv)));
      if ~isreal(vv), fprintf(' imag[min,max]=[%.3g,%.3g] complex', min(imag(vv)),max(imag(vv))); end
    end
    fprintf('\n');
  end
else
  fprintf('%s NOT FOUND\n', f);
  d=dir('*.mat'); for i=1:numel(d), fprintf('  have: %s (%d KB)\n', d(i).name, round(d(i).bytes/1024)); end
end
