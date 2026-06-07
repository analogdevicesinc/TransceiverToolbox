function res = measure_and_tune(label, doSweep)
% Verify the cable MUX works on the currently-deployed variant, measure the
% cable-RF BER, and (optionally) sweep chip-side knobs (Tx atten) for the best
% SNR. Run AFTER deploying a variant's BOOT.BIN. Returns a struct of results.
%   label   : name for the printout
%   doSweep : if true, sweep Tx attenuation and report the best
    if nargin < 2, doSweep = false; end
    here = fileparts(mfilename('fullpath')); addpath(here);
    addpath(fileparts(fileparts(fileparts(here))));
    uri = 'ip:10.0.0.146';
    res = struct('label',label,'mux_ok',false,'ber_match',NaN,'ber_mismatch',NaN,'best_atten',NaN,'best_ber',NaN);

    tx = adi.ADRV9002.Tx('uri', uri);
    tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = 2.4e9; tx.AttenuationChannel0 = -10;
    tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
    try, tx(complex(zeros(4096,1,'int16'),zeros(4096,1,'int16'))); catch ME, warning(ME.message); end
    rx = adi.ADRV9002.Rx('uri', uri);
    rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = 2.4e9;
    try, setup(rx); catch ME, warning(ME.message); end
    pause(5);

    function ber = berMeas(rxsel, dwell)
        BistRegisters.sshExec(sprintf('busybox devmem 0x9D000114 32 %d', rxsel), 8);
        BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0', 8);
        pause(2);
        p0 = BistRegisters.read('0x9D000104',8); e0 = BistRegisters.read('0x9D000108',8);
        pause(dwell);
        p1 = BistRegisters.read('0x9D000104',8); e1 = BistRegisters.read('0x9D000108',8);
        dp = p1-p0; de = e1-e0; ber = 100*de/max(1,dp*120);
    end

    fprintf('\n=== %s ===\n', label);
    rx.CenterFrequencyChannel0 = 2.4e9; pause(1);
    bMatch = berMeas(1, 10);
    rx.CenterFrequencyChannel0 = 2.5e9; pause(2);
    bMis   = berMeas(1, 8);
    rx.CenterFrequencyChannel0 = 2.4e9; pause(2);
    res.ber_match = bMatch; res.ber_mismatch = bMis;
    res.mux_ok = (bMis > bMatch + 2);   % cable live only if mismatch is much worse
    fprintf('  cable MUX live: %d  (match BER=%.4f%%, 100MHz-mismatch BER=%.4f%%)\n', ...
        res.mux_ok, bMatch, bMis);

    if doSweep && res.mux_ok
        attens = [0 -5 -10 -20]; best = inf; ba = NaN;
        for a = attens
            tx.AttenuationChannel0 = a; pause(2);
            b = berMeas(1, 10);
            fprintf('  atten=%+d dB -> cable BER=%.4f%%\n', a, b);
            if b < best, best = b; ba = a; end
        end
        res.best_atten = ba; res.best_ber = best;
        fprintf('  >>> best: atten=%+d dB  BER=%.4f%%\n', ba, best);
    end

    BistRegisters.sshExec('busybox devmem 0x9D000114 32 0', 8);
    release(tx); try, release(rx); catch, end
end
