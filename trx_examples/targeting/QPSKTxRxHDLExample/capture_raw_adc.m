function capture_raw_adc()
% On the deployed raw_adc_dma bitstream: get a strong cable lock (pre-set +2kHz),
% capture the RAW cable ADC (debugI/Q now carry adc_dataInI/Q) via Rx DMA, save to
% raw_adc_cable.mat for offline analysis + sim replay. Also grab rx_input_select=0
% (internal REP_Tx) for comparison.
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; trim=2e3; N=2^18; out=struct();
    for sel=[1 0]   % 1=cable, 0=internal
        tx=[]; got=false;
        for att=1:8
            BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
            for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
            BistRegisters.sshExec(sprintf('busybox devmem 0x9D000114 32 %d',sel),8);
            tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
            tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
            try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
            p0=BistRegisters.read('0x9D000104',8); pause(5); p1=BistRegisters.read('0x9D000104',8);
            dp=p1-p0; fprintf('  sel=%d att=%d: pkts/5s=%d\n', sel, att, dp);
            if dp>300 || sel==0, got=true; break; end   % internal always locks
            release(tx); tx=[];
        end
        if ~got, fprintf('  sel=%d: no lock, skipping capture\n', sel); continue; end
        rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+trim*(sel==1);
        try, rx.GainControlMode='spi'; catch, end
        try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
        rx.SamplesPerFrame=N; try,setup(rx);catch,end; pause(2);
        d=[]; for w=1:2, d=rx(); end
        s=double(d);
        fn=sprintf('sel%d', sel); out.(fn)=s;
        fprintf('  sel=%d captured %d raw-ADC samples |s|mean=%.0f\n', sel, numel(s), mean(abs(s(abs(s)>0))));
        release(rx); try,release(tx);catch,end
    end
    save('raw_adc_cable.mat','-struct','out');
    fprintf('saved raw_adc_cable.mat\n');
end
