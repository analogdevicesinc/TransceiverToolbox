S=load('tap2_capture.mat'); z=S.z(:);
fprintf('DIAG total=%d  zeros=%d (%.1f%%)\n', numel(z), nnz(abs(z)<1e-3), 100*nnz(abs(z)<1e-3)/numel(z));
act=abs(z)>1e-3; d=diff([0;act;0]); r0=find(d==1); r1=find(d==-1)-1;
rl=r1-r0+1; gaps=r0(2:end)-r1(1:end-1)-1;
fprintf('DIAG run lengths: median=%d p10=%d p90=%d max=%d\n', median(rl), prctile(rl,10), prctile(rl,90), max(rl));
fprintf('DIAG gap lengths: median=%d p10=%d p90=%d max=%d\n', median(gaps), prctile(gaps,10), prctile(gaps,90), max(gaps));
i0=r0(10);
seg=z(i0:i0+79);
for k=1:80
  fprintf('DIAG s%03d  %+.4f%+.4fj  |%.3f| %4.0fdeg\n', k, real(seg(k)), imag(seg(k)), abs(seg(k)), rad2deg(angle(seg(k))));
end
