% classic measurement flow: tx cyclic zeros + setup(rx) + BIST deltas (internal mode)
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146';
rd=@(a) double(BistRegisters.read(a,8));
BistRegisters.sshExec('busybox devmem 0x9D000114 32 0',8);
tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
tx.AttenuationChannel0=-10; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16')));
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
try,rx.GainControlMode='spi';catch,end; try,rx.GainChannel0=30;catch,end
try,setup(rx);catch,end; [y,v]=rx(); pause(2);
a=rd('0x9D000104'); pause(4); b=rd('0x9D000104');
fprintf('CLASSIC FLOW internal: packets delta/4s = %d (abs %d)\n', b-a, b);
release(tx); release(rx);
