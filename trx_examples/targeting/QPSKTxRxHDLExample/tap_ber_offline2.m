% tap_ber_offline2 -- decode tap2 (post-CS, 2 sps @7.68M after dedup) with the
% certified golden receiver. If the golden decodes the Receiver's own post-CS
% stream at ~0%% while the BIST said 7.5%% in the same window, the floor enters
% downstream of carrier sync; if ~7%%, upstream.
here=fileparts(mfilename('fullpath')); addpath(here);
S=load('tap2_capture.mat'); z=S.z(:);
x=z(1:2:end);                                   % drop exact 2x duplication
% bridge brief stalls (isolated near-zero samples) by linear interpolation
bad=abs(x)<1e-3; gi=find(~bad);
x(bad)=interp1(gi, x(~bad), find(bad), 'linear', 0);
fprintf('OFF2 stream: %d samples @7.68M, %d stalls bridged (%.2f%%)\n', numel(x), nnz(bad), 100*nnz(bad)/numel(x));
[ber,nf,evm,info]=demodPlutoCapture(x, 7.68e6);
fprintf('OFF2 GOLDEN-ON-TAP2: %s\n', info);
fprintf('TAP_BER_OFFLINE2_DONE\n');
