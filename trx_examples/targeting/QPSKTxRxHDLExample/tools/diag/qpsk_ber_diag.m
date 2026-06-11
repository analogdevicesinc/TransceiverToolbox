function qpsk_ber_diag()
% Diagnose whether the composite's rx_input_select=1 cable path is actually
% live, by comparing internal vs cable and Rx-freq matched vs mismatched.
    here = fileparts(mfilename('fullpath')); addpath(here);
    tbxRoot = fileparts(fileparts(fileparts(here))); addpath(tbxRoot);
    uri = 'ip:10.0.0.146';

    tx = adi.ADRV9002.Tx('uri', uri);
    tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = 2.4e9; tx.AttenuationChannel0 = -10;
    tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
    try, tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx = adi.ADRV9002.Rx('uri', uri);
    rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = 2.4e9;
    try, setup(rx); catch ME, warning(ME.message); end
    pause(5);

    function ber = meas(label, rxsel, dwell)
        BistRegisters.sshExec(sprintf('busybox devmem 0x9D000114 32 %d', rxsel), 8);
        BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0', 8);
        pause(2);
        p0 = BistRegisters.read('0x9D000104',8); e0 = BistRegisters.read('0x9D000108',8);
        pause(dwell);
        p1 = BistRegisters.read('0x9D000104',8); e1 = BistRegisters.read('0x9D000108',8);
        dp = p1-p0; de = e1-e0; ber = 100*de/max(1,dp*120);
        fprintf('  %-28s rx_sel=%d  pkts=%6d  BER(per120)=%.4f%%\n', label, rxsel, dp, ber);
    end

    fprintf('\n=== rx_input_select path diagnostic (Tx transmitting @ 2.4GHz) ===\n');
    rx.CenterFrequencyChannel0 = 2.4e9; pause(1);
    meas('internal (rx_sel=0)', 0, 8);
    meas('cable, Rx=2.4 (match)', 1, 8);
    fprintf('  -- now mismatch Rx to 2.5GHz: if cable path live, BER must jump --\n');
    rx.CenterFrequencyChannel0 = 2.5e9; pause(2);
    meas('cable, Rx=2.5 (MISMATCH)', 1, 8);
    rx.CenterFrequencyChannel0 = 2.4e9; pause(2);
    meas('cable, Rx=2.4 (match again)', 1, 8);

    BistRegisters.sshExec('busybox devmem 0x9D000114 32 0', 8);
    release(tx); try, release(rx); catch, end
end
