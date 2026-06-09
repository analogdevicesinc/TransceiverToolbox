function measure_xform_rot()
% Test the README "wrong-quadrant" hypothesis: a fixed rotation pre-applied BEFORE
% acquisition (xformsweep bitstream) may cancel the 90-deg the phase-ambiguity
% corrector mis-resolves on HW. Round-5 stats only covered identity(0) & swap(4);
% the pure ROTATIONS (3=180,5=270,6=90) were never tested fresh-boot. If any gives
% low BER at a strong lock -> the impairment is a fixed rotation, and pre-rotation fixes it.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3;
    lab=containers.Map({0,3,5,6},{'id(I,Q)','180(-I,-Q)','270(Q,-I)','90(-Q,I)'});
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    REBOOTS=9;
    for xf=[6 5 3]
        bers=[];
        fprintf('\n=== xform=%d %s : %d fresh boots ===\n', xf, lab(xf), REBOOTS);
        for rb=1:REBOOTS
            BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
            for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
            BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);
            BistRegisters.sshExec(sprintf('busybox devmem 0x9D000118 32 %d',xf),8);
            tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
            tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
            try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
            rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
            try, rx.GainControlMode='spi'; catch, end
            try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
            try,setup(rx);catch,end; pause(6);
            [dp,de,ber]=meas(12);
            if dp>30, fprintf('  boot %2d: pkts=%7d  BER=%8.4f%%\n', rb, dp, ber); bers(end+1)=ber;
            else, fprintf('  boot %2d: pkts=%7d  (no lock)\n', rb, dp); end
            release(tx); try,release(rx);catch,end
        end
        if isempty(bers), fprintf('  >>> xform=%d %s: ZERO locks\n', xf, lab(xf));
        else, fprintf('  >>> xform=%d %s: %d locks | min=%.3f%% median=%.3f%%\n', xf, lab(xf), numel(bers), min(bers), median(bers)); end
    end
end
