%RSTCS_PHASE_TEST  Test the carrier-sync reset (rstCS) fix for the 90-deg phase ambiguity.
%
%   Background
%   ----------
%   Deployed RX-debug build (BOOT.BIN md5 7483c31e) exposes the QPSK Rx
%   carrier-synchronizer reset on AXI4-Lite register x"110" (byte offset
%   0x110 on the HDL Coder IP @ base 0x9D000000). Previously rstCS was tied
%   to a Constant false, so the carrier loop free-ran and could lock on a
%   90-deg-rotated phase that the phase-ambiguity corrector left unresolved
%   on the live loopback (exactly 60/120 = 50% payload bit errors, while the
%   preamble still synced because it sits on the I=Q diagonal).
%
%   This script transmits the model's exact (correctly scrambled) "ADI Hello
%   World" QPSK at Rsym=1.92 MHz over the TX1->RX1 cable, then pulses rstCS to
%   force a clean carrier re-acquisition, and reads the in-FPGA BIST registers
%   before/after to see whether bit_errors drops from ~50% toward 0.
%
%   BIST AXI registers (IP base 0x9D000000): 0x100 count, 0x104 packets,
%   0x108 bit_errors; rstCS write-only at 0x110.
%
%   Requires libiio support package; run on the host connected to the radio.
%
%   Usage:
%     rstcs_phase_test('ip:10.0.0.146','analog')

function rstcs_phase_test(uri, rootpw)
if nargin<1, uri='ip:10.0.0.146'; end
if nargin<2, rootpw='analog'; end
host = regexprep(uri,'^ip:','');

% --- Load the validated waveform (model Tx, scrambled, 8 sps @ 15.36 MHz) ---
S = load('qpsk_modelTx_8sps_15p36M.mat');
x = S.qpsk_modelTx_8sps_15p36M(:);
x = x./max(abs(x)) .* 2^15;

% --- Transmit cyclically (no host RX capture: it starves the TX DMA) ---
tx = adi.ADRV9002.Tx('uri',uri);
tx.DataSource='DMA'; tx.EnableCyclicBuffers=true; tx.AttenuationChannel0=-30;
tx.CenterFrequencyChannel1 = tx.CenterFrequencyChannel0; tx.EnabledChannels = 1;
tx(x);
fprintf('Transmitting model QPSK (Rsym=1.92 MHz) cyclically on TX1.\n');
pause(2);

rd = @() readBist(host, rootpw);
b0 = rd();
fprintf('Free-running: packets=%d bit_errors=%d (%.0f%%/pkt)\n', b0.p, b0.e, errpct(b0));

% --- Pulse rstCS a few times; report per-interval error rate after each ---
prev = b0;
for k = 1:6
    pulseRstcs(host, rootpw);          % assert reset then release -> clean re-acquire
    pause(2);
    b = rd();
    dp = b.p - prev.p; de = b.e - prev.e;
    if dp > 0
        fprintf('  rstCS pulse %d: +pkts=%d +err=%d  -> %.0f%% bit errors\n', k, dp, de, 100*de/(dp*120));
    else
        fprintf('  rstCS pulse %d: no new packets (transmit may have stalled)\n', k);
    end
    prev = b;
end
release(tx);
fprintf('Done. Error rate near 0%% after a pulse => the rstCS re-acquisition fix works.\n');
end

function b = readBist(host, pw)
cmd = sprintf(['sshpass -p %s ssh -o StrictHostKeyChecking=accept-new root@%s ' ...
    '"echo $((`busybox devmem 0x9D000104 32`)) $((`busybox devmem 0x9D000108 32`))"'], pw, host);
[~,out] = system(cmd); v = sscanf(out,'%d');
b.p = v(1); b.e = v(2);
end

function pulseRstcs(host, pw)
cmd = sprintf(['sshpass -p %s ssh -o StrictHostKeyChecking=accept-new root@%s ' ...
    '"busybox devmem 0x9D000110 32 1; busybox devmem 0x9D000110 32 0"'], pw, host);
system(cmd);
end

function r = errpct(b)
if b.p>0, r = 100*b.e/(b.p*120); else, r = -1; end
end
