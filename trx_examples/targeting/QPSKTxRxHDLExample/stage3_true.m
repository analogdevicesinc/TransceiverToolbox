% stage3_true -- full modem with corrected procedure: reset -> x114=1 (cable),
% x118=0 (FPGA Tx drives DAC; zeros-cyclic host buffer keeps dac requests
% flowing). BIST BER + simultaneous host capture decode for content audit.
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146'; fc=2.4e9; fs=15.36e6;
rd=@(a) double(BistRegisters.read(a,8));
wr=@(a,v) BistRegisters.sshExec(sprintf('busybox devmem %s 32 %d',a,v),8);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=fc;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16')));
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=fc;
rx.SamplesPerFrame=2^18; [y,~]=rx(); pause(2);
wr('0x9D000000',1); pause(1);
wr('0x9D000118',0); wr('0x9D000114',1); pause(2);
p0=rd('0x9D000104'); e0=rd('0x9D000108'); pause(30);
p1=rd('0x9D000104'); e1=rd('0x9D000108');
dp=p1-p0; de=e1-e0;
fprintf('S3T BIST: pkts/30s=%d errors=%d BER=%.5f%% errs/pkt=%.3f\n', dp, de, 100*de/max(1,dp*120), de/max(1,dp));
% simultaneous-ish host capture of the FPGA Tx (via cable, raw ADC on slots 2/3
% is unreliable; use the normal rx channel which carries debug slots 0/1 --
% set mux to tap0 post-AGC? No: for content audit use demod of RF via rx2?
% Simplest: capture what the BIST sees is impossible; instead decode the RF
% with the golden on the standard rx (it captures debugI1/Q1 = receiver taps).
% Set iq_debug_mux=0 (post-AGC IQ at full rate) and decode that.
wr('0x9D00010C',0);
for k=1:8,[y,~]=rx(); end
iq=double(y)/2^14;
[b3,nf3,evm3,info3]=demodPlutoCapture(iq, fs);
fprintf('S3T HOST-DECODE of post-AGC tap: %s\n', info3);
release(tx); release(rx);
fprintf('STAGE3_TRUE_DONE\n');
