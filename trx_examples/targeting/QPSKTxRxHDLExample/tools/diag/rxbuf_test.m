% Does holding an RX DMA buffer un-freeze the DUT (adc_1_clk/interface)?
here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
uri='ip:10.0.0.146';
rd=@(a) double(BistRegisters.read(a,8));
BistRegisters.sshExec('busybox devmem 0x9D000114 32 0; busybox devmem 0x9D000118 32 0',8);  % internal, fpga tx
p0=rd('0x9D000104'); fprintf('packets BEFORE rx buffer: %d\n', p0);
rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
rx.SamplesPerFrame=2^14; [y,v]=rx();   % creates + starts the RX buffer
fprintf('rx buffer up (valid=%d). polling with buffer HELD:\n', v);
for k=1:4
  a=rd('0x9D000104'); pause(2); b=rd('0x9D000104');
  fprintf('  delta/2s = %d\n', b-a);
end
release(rx);
pause(2); a=rd('0x9D000104'); pause(2); b=rd('0x9D000104');
fprintf('after release: delta/2s = %d\n', b-a);
