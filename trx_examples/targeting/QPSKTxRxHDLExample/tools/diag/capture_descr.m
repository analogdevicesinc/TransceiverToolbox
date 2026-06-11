function capture_descr(sel)
% Deploy-independent: on the deployed descr_io bitstream, capture the 6 descrambler-
% region bits (packed in debugI = the GOOD DMA channel) and localize the payload error.
% sel=0 internal (easy lock, 7.27%), sel=1 cable (50%). iq_debug_mux=3 routes the pack.
    if nargin<1, sel=0; end
    here=fileparts(mfilename('fullpath')); addpath(here); addpath(fileparts(fileparts(fileparts(here))));
    uri='ip:10.0.0.146'; N=2^18;
    BistRegisters.sshExec('(sleep 1; reboot)>/dev/null 2>&1 &',8); pause(10);
    for k=1:40,[rc,~]=BistRegisters.sshExec('true',5); if rc==0,break; end; pause(3); end; pause(3);
    BistRegisters.sshExec(sprintf('busybox devmem 0x9D000114 32 %d',sel),8);   % rx_input_select
    BistRegisters.sshExec('busybox devmem 0x9D00010C 32 3',8);                  % iq_debug_mux=3 (descr pack)
    tx=adi.ADRV9002.Tx('uri',uri); tx.EnabledChannels=1; tx.CenterFrequencyChannel0=2.4e9;
    tx.AttenuationChannel0=0; tx.DataSource='DMA'; tx.EnableCyclicBuffers=true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx=adi.ADRV9002.Rx('uri',uri); rx.EnabledChannels=1; rx.CenterFrequencyChannel0=2.4e9+2e3*(sel==1);
    try, rx.GainControlMode='spi'; catch, end
    try, rx.GainChannel0=30; catch, try,rx.Gain=30;catch,end; end
    rx.SamplesPerFrame=N; try,setup(rx);catch,end; pause(3);
    p0=BistRegisters.read('0x9D000104',8); pause(4); p1=BistRegisters.read('0x9D000104',8);
    fprintf('sel=%d lock: pkts/4s=%d\n', sel, p1-p0);
    d=[]; for w=1:3, d=rx(); end
    code = double(real(d)); code=round(code);
    b = @(k) double(bitand(int32(code),2^k)>0);
    demod=b(0); startIn=b(1); vIn=b(2); hwDescr=b(3); startO=b(4); vOut=b(5);
    fprintf('captured %d samples. valid-in density=%.3f valid-out density=%.3f startIn pulses=%d\n', ...
        numel(code), mean(vIn), mean(vOut), sum(diff([0;startIn])>0));
    % reconstruct demod bit stream (gated by validIn)
    db = demod(vIn>0); st = startIn(vIn>0);
    % SW-descramble (additive x^7+x^4+1, LFSR reset to init on startIn) -- matches Verilog init [1 0 1 1 1 0 1]
    state=[1 0 1 1 1 0 1]; sw=zeros(size(db));
    for i=1:numel(db)
        if st(i), state=[1 0 1 1 1 0 1]; end
        fb = xor(state(7), state(4));         % x^7 + x^4 + 1 additive
        sw(i)=xor(db(i), fb);
        state=[fb state(1:6)];
    end
    hd = hwDescr(vOut>0);
    L=min(numel(sw),numel(hd));
    fprintf('SW-descramble vs HW-descramble mismatch: %.3f%% over %d bits\n', 100*mean(sw(1:L)~=hd(1:L)), L);
    save(sprintf('descr_sel%d.mat',sel),'demod','startIn','vIn','hwDescr','startO','vOut','sw');
    release(rx); try,release(tx);catch,end
end
