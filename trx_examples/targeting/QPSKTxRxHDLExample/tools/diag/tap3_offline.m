% tap3_offline -- decode tap3 (post-phase-ambiguity) with a FIXED global
% rotation (no per-frame phase recovery, unlike the golden demod) so that
% per-packet wrong-rotation events by the HW corrector remain visible.
% Diagnostic: per-frame error distribution. Bimodal {~0, ~50%} with ~15%% bad
% frames => HW phase-ambiguity corrector picks wrong rotation per packet
% (0.145*50%% = 7.27%%). Uniform ~7%%/frame => demod/descrambler side.
here=fileparts(mfilename('fullpath')); addpath(here);
S=load('tap3_capture.mat'); z=S.z(:);
C=commhdlQPSKTxRxParameters; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; pre=C.Preamble(:); poly=[1 0 0 1 0 0 0];
st=[1 0 1 1 1 0 1]; scr=zeros(DBPP,1);
for i=1:DBPP, bbit=mod(nnz(st(poly==1)),2); scr(i)=xor(pay0(i),bbit); st=[st(2:7) bbit]; end

% inspect duplication of the active stream
act=abs(z)>1e-3; zz=z(act);
dup2 = mean(abs(zz(1:2:end-1)-zz(2:2:end))<1e-6);
fprintf('T3 N=%d active=%.1f%% pairdup=%.2f\n', numel(z), 100*mean(act), dup2);
x = z(1:2:end);                                   % assume 2x dup like tap2
bad=abs(x)<1e-3; gi=find(~bad);
x(bad)=interp1(gi, x(~bad), find(bad), 'linear', 0);

% if still 2 sps (symbol+midpoint), select symbol instants by constellation
% proximity at the two phases; if 1 sps, offset selection is a no-op choice.
c4 = 0.495*exp(1j*(pi/4+ (0:3)*pi/2));
dist=@(v) min(abs(v(:).'-c4(:)),[],1);
d0=mean(dist(x(1:2:end))); d1=mean(dist(x(2:2:end)));
fprintf('T3 phase-dist: d0=%.4f d1=%.4f\n', d0, d1);
if abs(d0-d1)>0.02
    if d0<d1, sy=x(1:2:end); else, sy=x(2:2:end); end
else
    sy=x;  % likely already symbol rate
end
fprintf('T3 symbols=%d\n', numel(sy));

L=numel(pre); pp=2*pre-1;
best=struct('nfr',0,'r',-1,'perr',[]);
for r=0:3
    s=sy*exp(-1j*r*pi/2);
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
    fprintf('T3 rot=%d frames=%d errors=%d BER=%.3f%%\n', r, nfr, nerr, 100*nerr/max(1,nchk));
    if nfr>best.nfr, best=struct('nfr',nfr,'r',r,'perr',perr); end
end
if best.nfr>0
    pe=best.perr;
    fprintf('T3 BEST rot=%d frames=%d: perfect=%d (<=2 errs: %d), ~50%%-class(>=40 errs): %d\n', ...
        best.r, best.nfr, nnz(pe==0), nnz(pe<=2), nnz(pe>=40));
    fprintf('T3 per-frame errors: %s\n', mat2str(pe));
else
    fprintf('T3 NO FRAMES at any rotation; angle hist (deg):\n');
    edges=-180:45:180; hc=histcounts(rad2deg(angle(sy)),edges); disp([edges(1:end-1).' hc.']);
end
fprintf('TAP3_OFFLINE_DONE\n');
