% tap_ber -- bisect the 7.27% floor on the LIVE cable link: capture the
% Receiver's post-carrier-sync tap (iq_debug_mux=3 -> debugI1/Q1 -> rx DMA)
% while the BIST is decoding, then decode the tap OFFLINE and compare BER
% against the BIST's count over the same period.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);

C=commhdlQPSKTxRxParameters; sps=C.SamplesPerSymbol; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
syms=[]; for f=1:30, st=[1 0 1 1 1 0 1]; sc=zeros(size(pay0)); for i=1:numel(pay0),bb=mod(nnz(st(poly==1)),2);sc(i)=xor(pay0(i),bb);st=[st(2:7) bb];end; fb=[pre;sc]; s=pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray'); syms=[syms;s(:)]; end
w4=zeros(numel(syms)*sps,1); w4(1:sps:end)=syms; w4=filter(C.RRCCoef,1,w4);
txw=resample(w4,2,1); txw=txw/rms(txw); gold=int16(txw*2^14);

% cable golden + reset procedure (proven: ~1900 pkts/s, BER ~7.27%)
wr('0x9D000118',1); wr('0x9D000114',1); wr('0x9D00010C',3);   % tap3 = constellation
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx.SamplesPerFrame=numel(gold); tx(gold);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^18; [y,~]=rx();
wr('0x9D000000',1); pause(3);

% verify BIST decoding while we capture
p0=rd('0x9D000104'); e0=rd('0x9D000108');
for k=1:6, [y,~]=rx(); end          % fresh buffers well after reset
p1=rd('0x9D000104'); e1=rd('0x9D000108');
fprintf('TAPBER BIST during capture: dPkts=%d dErrs=%d BER=%.4f%%\n', ...
    p1-p0, e1-e0, 100*(e1-e0)/max(1,(p1-p0)*120));
z=double(y)/2^14; save('tap3_capture.mat','z');
fprintf('TAPBER capture: N=%d rms=%.4f uniq-ratio=%.3f\n', numel(z), rms(z), numel(unique(real(z)))/numel(z));

% offline decode of the tap: post-CS symbols arrive ~4x duplicated (symbol
% rate on the 15.36M DMA). Dedup by run-length, then hard-demod QPSK,
% frame-align on the preamble, descramble, compare to the reference payload.
zz=z(abs(z)>1e-3);
d=[true; abs(diff(zz))>1e-6]; symsHW=zz(d);    % collapse holds
fprintf('TAPBER dedup: %d raw -> %d symbols (ratio %.2f)\n', numel(zz), numel(symsHW), numel(zz)/max(1,numel(symsHW)));
% hard decisions at the 4 QPSK phases (Gray, pi/4 offset, matching pskmod above)
bitsHW=zeros(2*numel(symsHW),1);
sd=pskdemod(symsHW,4,pi/4,'gray');
bitsHW(1:2:end)=floor(sd/2); bitsHW(2:2:end)=mod(sd,2);
% preamble bit pattern
preB=pre(:);
% locate frame starts by correlation against the preamble bits (+/- all 4
% phase ambiguities are already resolved by HW phase-ambiguity stage)
L=numel(preB); n=numel(bitsHW); bb=2*bitsHW-1; pp=2*preB-1;
sc=conv(bb,flipud(pp),'valid');
th=0.9*L; starts=find(sc>th);
starts=starts([true; diff(starts)>2000]);
fprintf('TAPBER frames found: %d\n', numel(starts));
% reference scrambled payload bits (deterministic, same every frame)
st=[1 0 1 1 1 0 1]; scr=zeros(DBPP,1);
for i=1:DBPP, bbit=mod(nnz(st(poly==1)),2); scr(i)=xor(pay0(i),bbit); st=[st(2:7) bbit]; end
% descramble each frame's first 120 payload bits and compare to msg
nerr=0; nchk=0; nfr=0;
for s0=starts.'
    i0=s0+L;                       % payload starts after preamble
    if i0+DBPP-1>n, break; end
    rxp=bitsHW(i0:i0+119);
    % additive descramble: payload XOR scrambler sequence = original bits
    dec=xor(rxp, scr(1:120));
    nerr=nerr+sum(dec~=msg(1:120)); nchk=nchk+120; nfr=nfr+1;
end
fprintf('TAPBER OFFLINE (tap2 post-CS): frames=%d checkedBits=%d errors=%d BER=%.4f%%\n', ...
    nfr, nchk, nerr, 100*nerr/max(1,nchk));
release(tx); release(rx);
fprintf('TAP_BER_DONE\n');
