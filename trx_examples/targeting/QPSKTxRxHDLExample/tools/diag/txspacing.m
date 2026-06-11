% txspacing -- is the FPGA Tx gapless? Capture the FPGA-Tx waveform over the
% cable and measure inter-preamble spacing. Gapless => exactly 9064 samples
% (1133 sym x 8 sps at 15.36M). Any other spacing = per-packet sample slip.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
C=commhdlQPSKTxRxParameters;
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); pause(2);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^19; try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
wr('0x9D000000',1); pause(1); wr('0x9D000118',0); wr('0x9D000114',1); pause(2);
for k=1:6,[y,~]=rx(); end
z=double(y)/2^14; release(tx); release(rx);
save('txspacing_capture.mat','z');
% preamble matched filter at 8 sps: upsample preamble symbols, RRC-shape
pres=C.preambleSymbols(:);
p8=zeros(numel(pres)*8,1); p8(1:8:end)=pres;
p8=conv(p8, resample(C.RRCCoef,2,1));
% coarse CFO removal via s^4 (small for cable)
zz=z(:);
m=conv(abs(conv(zz, conj(flipud(p8)), 'same')), ones(4,1)/4, 'same');
th=4*median(m);
pk=find(m>th);
% group peaks, take local maxima
g=[true; diff(pk)>4000]; grp=cumsum(g);
locs=zeros(max(grp),1);
for k=1:max(grp)
    ii=pk(grp==k);
    [~,j]=max(m(ii)); locs(k)=ii(j);
end
d=diff(locs);
d=d(d>8000 & d<10000);            % adjacent frames only
fprintf('TXSP frames=%d spacings: ', numel(d)+1);
u=unique(d);
for k=1:numel(u), fprintf('%d x%d  ', u(k), nnz(d==u(k))); end
fprintf('\nTXSP expected 9064; mean=%.3f\n', mean(d));
fprintf('TXSPACING_DONE\n');
