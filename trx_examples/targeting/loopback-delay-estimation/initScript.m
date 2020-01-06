%%
% This script is called by InitFcn callback function in the model

clc;
clear;
close all;

L = 8;
a = 0.25;
d = 12;
len1 = 13;

s = zadoffChuSeq(25, len1);
txfilt  = comm.RaisedCosineTransmitFilter('OutputSamplesPerSymbol', L, 'RolloffFactor', a, 'FilterSpanInSymbols', d);
zc = txfilt([s; zeros(256-len1, 1)]);
zc_re = real(zc);
zc_im = imag(zc);
scale = 25000;

max_val_re = max(abs(zc_re));
max_val_im = max(abs(zc_im));
zc_re = round(scale*zc_re/max_val_re);
zc_im = round(scale*zc_im/max_val_im);

% amplitude difference of input
len2 = (len1+d)*L;
zc_re2 = zc_re(1:len2).^2;
zc_im2 = zc_im(1:len2).^2;
zc2 = zc_re2 + zc_im2;
zc2_diff = zc2(1:end-1)-zc2(2:end);
sign_res = sign(zc2_diff);
tx_input_ampl_diff = sign_res;
bool_ref = (tx_input_ampl_diff<0);

t = 0:1/64:1-1/64;
cst = exp(1i*2*pi*t);
cst = round(scale*cst);
cst_re = real(cst);
cst_im = imag(cst);
sync_seq_re = int16([cst_re zc_re.' zeros(1, 6000)]);
sync_seq_im = int16([cst_im zc_im.' zeros(1, 6000)]);