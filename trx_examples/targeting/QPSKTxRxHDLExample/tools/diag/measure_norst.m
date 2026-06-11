function measure_norst(label)
% Measure cable BER WITHOUT pulsing rstCS (the rstCS pulse breaks cable
% re-acquisition; the receiver locks at cold boot and must be left alone).
    if nargin<1, label='cable'; end
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146';
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
    for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);   % cable, early
    tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9;
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
    try,setup(rx);catch,end; pause(5);
    % NO rstCS. just measure over a long window for low-BER resolution.
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8);
        pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    fprintf('\n=== %s cable BER, NO rstCS (Tx atten=0, Rx gain=30) ===\n', label);
    [dp,de,ber]=meas(20);
    fprintf('  20s: pkts=%d errors=%d  BER(per120)=%.5f%%  BER(per2240)=%.5f%%\n', ...
        dp, de, ber, 100*de/max(1,dp*2240));
    release(tx); try,release(rx);catch,end
end
