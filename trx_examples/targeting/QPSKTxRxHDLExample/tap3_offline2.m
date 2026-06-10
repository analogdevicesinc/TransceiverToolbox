% tap3_offline2 -- align tap3 on the scrambled PAYLOAD (preamble may be
% absent post-corrector); fixed rotation; per-frame error distribution.
here=fileparts(mfilename('fullpath')); addpath(here);
S=load('tap3_capture.mat'); z=S.z(:);
C=commhdlQPSKTxRxParameters; DBPP=C.DataBitsPerPacket;
sA=dec2bin(double('ADI Hello World'),8); msg=double(reshape(sA.',1,[])-'0').';
pay0=[msg; zeros(DBPP-numel(msg),1)]; poly=[1 0 0 1 0 0 0];
st=[1 0 1 1 1 0 1]; scr=zeros(DBPP,1);
for i=1:DBPP, b=mod(nnz(st(poly==1)),2); scr(i)=xor(pay0(i),b); st=[st(2:7) b]; end
x=z(1:2:end); bad=abs(x)<1e-3; gi=find(~bad);
x(bad)=interp1(gi,x(~bad),find(bad),'linear',0);
c4=0.495*exp(1j*(pi/4+(0:3)*pi/2)); dist=@(v) min(abs(v(:).'-c4(:)),[],1);
d0=mean(dist(x(1:2:end))); d1=mean(dist(x(2:2:end)));
if d0<d1, sy=x(1:2:end); else, sy=x(2:2:end); end
fprintf('T3B symbols=%d\n', numel(sy));
ref=2*scr(1:240)-1;
for r=0:3
    s=sy*exp(-1j*r*pi/2);
    sd=pskdemod(s,4,pi/4,'gray');
    bits=zeros(2*numel(s),1); bits(1:2:end)=floor(sd/2); bits(2:2:end)=mod(sd,2);
    bb=2*bits-1;
    sc2=conv(bb,flipud(ref),'valid');
    starts=find(sc2>0.85*240);
    if numel(starts)>1, starts=starts([true; diff(starts)>2000]); end
    nfr=0; perr=[];
    for s0=starts.'
        if s0+DBPP-1>numel(bits), break; end
        dec=xor(bits(s0:s0+119), scr(1:120));
        perr(end+1)=sum(dec~=msg(1:120)); nfr=nfr+1; %#ok<AGROW>
    end
    if nfr>0
        fprintf('T3B rot=%d frames=%d BER=%.3f%% perfect=%d fifty(>=40)=%d  perr=%s\n', ...
            r, nfr, 100*sum(perr)/(120*nfr), nnz(perr==0), nnz(perr>=40), mat2str(perr(1:min(40,end))));
    else
        fprintf('T3B rot=%d frames=0\n', r);
    end
end
fprintf('T3B angle hist (deg/count): ');
edges=-180:45:180; hc=histcounts(rad2deg(angle(sy)),edges);
for k=1:8, fprintf('%d:%d ', edges(k), hc(k)); end; fprintf('\n');
fprintf('TAP3B_DONE\n');
