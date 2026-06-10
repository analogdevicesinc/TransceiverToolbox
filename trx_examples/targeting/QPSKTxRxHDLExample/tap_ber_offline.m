% tap_ber_offline -- decode the saved tap2 (post-CS) capture properly:
% per-run parity decimation (symbols duplicated exactly 2x; runs separated by
% idle gaps), 4-rotation search (tap2 precedes the phase-ambiguity corrector),
% preamble frame alignment, additive descramble, BER vs "ADI Hello World".
here=fileparts(mfilename('fullpath')); addpath(here);
S=load('tap2_capture.mat'); z=S.z(:);
C=commhdlQPSKTxRxParameters; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
st=[1 0 1 1 1 0 1]; scr=zeros(DBPP,1);
for i=1:DBPP, bbit=mod(nnz(st(poly==1)),2); scr(i)=xor(pay0(i),bbit); st=[st(2:7) bbit]; end

% contiguous active runs, decimate each by 2 from its own start
act=abs(z)>1e-3; d=diff([0;act;0]); r0=find(d==1); r1=find(d==-1)-1;
symsHW=[];
for k=1:numel(r0)
    seg=z(r0(k):r1(k));
    symsHW=[symsHW; seg(1:2:end)]; %#ok<AGROW>
end
fprintf('OFF runs=%d symbols=%d\n', numel(r0), numel(symsHW));

L=numel(pre); pp=2*pre-1;
best=struct('nfr',0);
for r=0:3
    s=symsHW*exp(-1j*r*pi/2);
    sd=pskdemod(s,4,pi/4,'gray');
    bits=zeros(2*numel(s),1); bits(1:2:end)=floor(sd/2); bits(2:2:end)=mod(sd,2);
    bb=2*bits-1;
    sc=conv(bb,flipud(pp),'valid');
    starts=find(sc>0.9*L);
    if numel(starts)>1, starts=starts([true; diff(starts)>2000]); end
    nfr=0; nerr=0; nchk=0; perr=[];
    for s0=starts.'
        i0=s0+L; if i0+119>numel(bits), break; end
        dec=xor(bits(i0:i0+119), scr(1:120));
        e=sum(dec~=msg(1:120));
        nerr=nerr+e; nchk=nchk+120; nfr=nfr+1; perr(end+1)=e; %#ok<AGROW>
    end
    fprintf('OFF rot=%d frames=%d checked=%d errors=%d BER=%.4f%%\n', r, nfr, nchk, nerr, 100*nerr/max(1,nchk));
    if nfr>best.nfr, best=struct('nfr',nfr,'r',r,'nerr',nerr,'nchk',nchk,'perr',perr); end
end
if best.nfr>0
    fprintf('OFF BEST rot=%d: frames=%d BER=%.4f%%  per-frame errors: min=%d med=%d max=%d  (frames with 0 errs: %d)\n', ...
        best.r, best.nfr, 100*best.nerr/best.nchk, min(best.perr), round(median(best.perr)), max(best.perr), nnz(best.perr==0));
    fprintf('OFF per-frame error list (first 40): %s\n', mat2str(best.perr(1:min(40,end))));
else
    fprintf('OFF NO FRAMES FOUND at any rotation -- dump diagnostics\n');
    fprintf('OFF |sym| stats: mean=%.3f std=%.3f; angle histogram (deg):\n', mean(abs(symsHW)), std(abs(symsHW)));
    edges=-180:45:180; hc=histcounts(rad2deg(angle(symsHW)),edges);
    disp([edges(1:end-1).' hc.']);
end
fprintf('TAP_BER_OFFLINE_DONE\n');
