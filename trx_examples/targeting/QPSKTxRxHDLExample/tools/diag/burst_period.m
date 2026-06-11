% burst_period -- are error bursts periodic with the Tx cyclic-buffer wrap?
% Golden = 30 frames; the stream also carries ~3.7 pkts/window read cadence.
S=load('burst_poll_raw.mat'); Pu=double(S.Pu); Eu=double(S.Eu);
dP=diff(Pu); dE=diff(Eu);
ok=dP>0 & dP<=30; 
% map errors onto packet axis: cumulative E vs packet count
pk = Pu - Pu(1);
% burst events: windows with dE>=40; locate their packet positions
ev = pk([false; dE>=40 & ok]);
iei = diff(ev);                      % inter-event intervals in packets
fprintf('PER events=%d  median IEI=%.1f pkts  mode-ish:\n', numel(ev), median(iei));
edges=0:2:120; hc=histcounts(iei,edges);
[~,im]=max(hc);
for k=1:numel(hc), if hc(k)>5, fprintf('PER  IEI [%d,%d): %d\n', edges(k), edges(k+1), hc(k)); end; end
fprintf('PER strongest IEI bin = [%d,%d) pkts; buffer wrap period = 30 frames\n', edges(im), edges(im+1));
% fraction of all errors inside burst events
fprintf('PER errors in bursts: %.1f%% of total\n', 100*sum(dE(dE>=40&ok))/sum(dE(ok)));
fprintf('BURST_PERIOD_DONE\n');
