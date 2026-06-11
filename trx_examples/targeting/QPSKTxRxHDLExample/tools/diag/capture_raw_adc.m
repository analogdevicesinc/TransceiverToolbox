function capture_raw_adc()
% On the deployed raw_adc_dma bitstream: debugI/Q carry the RAW cable ADC
% (adc_dataInI/Q) -> Rx DMA, present whenever the in-FPGA Tx transmits (no receiver
% lock needed). Power the chip Tx (host cyclic zeros), select cable, capture the raw
% ADC, save raw_adc_cable.mat for offline analysis. Also log BIST pkts for context.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3; N=2^18; out=struct();
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
    for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);          % cable
    tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
    rx.SamplesPerFrame=N; try,setup(rx);catch,end; pause(3);
    % BIST context (does the receiver lock at all?)
    p0=BistRegisters.read('0x9D000104',8); pause(4); p1=BistRegisters.read('0x9D000104',8);
    fprintf('  receiver lock context: pkts/4s=%d\n', p1-p0);
    d=[]; for w=1:3, d=rx(); end                 % flush + grab raw cable ADC
    out.sel1 = double(d);
    fprintf('  captured %d raw-ADC samples  |s|mean=%.0f std/mean=%.3f\n', numel(d), mean(abs(double(d(abs(d)>0)))), std(abs(double(d(abs(d)>0))))/mean(abs(double(d(abs(d)>0)))));
    save('raw_adc_cable.mat','-struct','out');
    fprintf('saved raw_adc_cable.mat\n');
    release(rx); try,release(tx);catch,end
end
