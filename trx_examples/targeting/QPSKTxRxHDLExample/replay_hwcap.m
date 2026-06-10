addpath(pwd); addpath(fileparts(fileparts(fileparts(pwd))));
m='sim_internal_baseline_TB'; load_system(m);
for v={'Spectrum Analyzer','Spectrum Analyzer1','Time Scope'}, try, set_param([m '/' v{1}],'Commented','on'); catch, end; end
% Select HW-capture source instead of the sim Tx+Channel
set_param([m '/TxSourceControl'],'Value','false');
fprintf('Replaying rx_capture_adrv9002_hdl.mat through the SIM receiver...\n');
t0=tic; out=evalc('sim(m);'); dt=toc(t0);
n=numel(strfind(out,'ADI Hello World'));
fprintf('REPLAY: %.0fs  ADIHelloWorld_prints=%d\n', dt, n);
% show a few lines of decode output
lines=strsplit(out,newline); k=0;
for i=1:numel(lines), if contains(lines{i},'Hello')||contains(lines{i},'World')||contains(lines{i},'synchron')||contains(lines{i},'Frequency'), fprintf('  > %s\n', strtrim(lines{i})); k=k+1; if k>8, break; end; end; end
