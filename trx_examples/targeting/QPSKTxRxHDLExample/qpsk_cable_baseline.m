% Establish the real cable-loopback BER baseline via the proven toolbox config.
% (temp diagnostic) Configures ADRV9002 Tx+Rx at the same LO, primes the DAC
% chain, switches rx_input_select=1, and measures BER (per-120 checked bits and
% per-2240) over a window. Reports packet rate too.
function qpsk_cable_baseline()
    here = fileparts(mfilename('fullpath'));
    addpath(here);
    tbxRoot = fileparts(fileparts(fileparts(here)));
    addpath(tbxRoot);                       % repo root holds the +adi package
    addpath(fullfile(tbxRoot, '+adi', '+common'));
    uri = 'ip:10.0.0.146';

    fprintf('Configuring ADRV9002 Tx/Rx @ 2.4 GHz...\n');
    tx = adi.ADRV9002.Tx('uri', uri);
    tx.EnabledChannels = 1;
    tx.CenterFrequencyChannel0 = 2.4e9;
    tx.AttenuationChannel0 = -10;
    tx.DataSource = 'DMA';
    tx.EnableCyclicBuffers = true;
    try, tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16'))); catch ME, warning(ME.message); end

    rx = adi.ADRV9002.Rx('uri', uri);
    rx.EnabledChannels = 1;
    rx.CenterFrequencyChannel0 = 2.4e9;
    try, setup(rx); catch ME, warning(ME.message); end
    pause(5);

    fprintf('rx_input_select=1 (cable), rstCS pulse...\n');
    BistRegisters.sshExec('busybox devmem 0x9D000114 32 1', 8);
    BistRegisters.sshExec('busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0', 8);
    pause(3);

    p0 = BistRegisters.read('0x9D000104', 8); e0 = BistRegisters.read('0x9D000108', 8);
    pause(16);
    p1 = BistRegisters.read('0x9D000104', 8); e1 = BistRegisters.read('0x9D000108', 8);
    dp = p1 - p0; de = e1 - e0;
    fprintf('\n=== CABLE BASELINE (16s) ===\n');
    fprintf('  packets=%d  errors=%d  rate=%.0f pkt/s\n', dp, de, dp/16);
    fprintf('  BER(per120)=%.4f%%   BER(per2240)=%.4f%%\n', 100*de/max(1,dp*120), 100*de/max(1,dp*2240));

    release(tx); try, release(rx); catch, end
end
