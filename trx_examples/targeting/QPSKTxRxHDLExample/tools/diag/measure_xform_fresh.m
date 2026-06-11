function measure_xform_fresh()
% Valid per-transform test: set rx_xform BEFORE acquisition (each transform
% acquired FRESH), unlike measure_xform_sweep which acquires at identity then
% switches at runtime (breaks reflection locks). Boot xformsweep bitstream with
% the target xform + cable + pre-set +2 kHz, retry for a STRONG lock, measure BER
% with a long dwell. Confirms swap(4) strong-lock floor vs identity(0).
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3;
    lab=containers.Map({0,1,4},{'id(I,Q)','conj(I,-Q)','swap(Q,I)'});
    function [dp,de,ber]=meas(dwell)
        p0=BistRegisters.read('0x9D000104',8); e0=BistRegisters.read('0x9D000108',8); pause(dwell);
        p1=BistRegisters.read('0x9D000104',8); e1=BistRegisters.read('0x9D000108',8);
        dp=p1-p0; de=e1-e0; ber=100*de/max(1,dp*120);
    end
    targets=[4 0 4];   % swap, identity (control), swap again (reproducibility)
    fprintf('\n=== FRESH-boot per-transform BER (xformsweep, +2kHz, atten=0, gain=30) ===\n');
    for xf=targets
        got=false;
        for att=1:8
            BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
            for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
            BistRegisters.sshExec('busybox devmem 0x9D000114 32 1',8);                 % cable
            BistRegisters.sshExec(sprintf('busybox devmem 0x9D000118 32 %d',xf),8);    % xform BEFORE acq
            tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
            tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
            try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
            rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim;
            try, rx.GainControlMode='spi'; catch, end
            try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
            try,setup(rx);catch,end; pause(6);
            [dp,~,~]=meas(4);
            if dp>600
                [dp,de,ber]=meas(20);
                fprintf('  xform=%d %-11s : pkts/20s=%7d errors=%8d  BER(per120)=%8.4f%%  BER(per2240)=%8.5f%%  (att %d)\n', ...
                    xf, lab(xf), dp, de, ber, 100*de/max(1,dp*2240), att);
                got=true; release(tx); try,release(rx);catch,end; break;
            end
            release(tx); try,release(rx);catch,end
        end
        if ~got, fprintf('  xform=%d %-11s : no strong lock in 8 reboots\n', xf, lab(xf)); end
    end
end
