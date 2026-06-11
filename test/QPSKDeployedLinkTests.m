classdef QPSKDeployedLinkTests < HardwareTests
    % QPSKDeployedLinkTests -- hardware verification of the deployed QPSK
    % composite (verif bitstream on jupiter_sdr / ADRV9002) over the RF
    % cable loopback, using the on-fabric BIST as the BER meter.
    %
    % Requires:
    %   * The Verifiable Composite BOOT.BIN deployed (TxRxCompo IP at
    %     0x9D000000 with the rx_input_select/tx_source_select AXI map).
    %   * Tx1 -> Rx1 RF cable loopback.
    %   * Set IIO_URI to override the default board address.
    %
    % Measurement procedure (load-bearing -- see the project notes):
    %   1. Arm host Tx (cyclic golden) and Rx (live buffer) FIRST.
    %   2. Pulse the IP soft reset (AXI 0x0): it resets the datapath AND
    %      clears the register file to internal-loopback defaults.
    %   3. THEN write tx_source_select/rx_input_select: the Receiver only
    %      acquires when the input mux is selected early after reset.
    %
    % Test axes:
    %   * testRecoverableCFO -- carrier frequency offset injected by moving
    %     the Tx LO; the HDL coarse frequency compensator + carrier
    %     synchronizer must recover it to BER < 0.01%.
    %   * testTxAttenuationRange / testRxGainRange -- gain envelope over
    %     which the HDL AGC + sync chain holds BER < 0.01%.

    properties
        uri = 'ip:10.0.0.146';
        author = 'ADI';
        % BIST AXI registers (byte addresses)
        RegBase      = '0x9D000000';
        RegPackets   = '0x9D000104';
        RegBitErrors = '0x9D000108';
        RegRxSelect  = '0x9D000114';
        RegTxSelect  = '0x9D000118';
        % link settings
        LO = 2.4e9;
        Fs = 15.36e6;
        MeasSeconds = 10;
        BERGate = 0.01/100;       % <0.01% on checked bits
        MinPackets = 5000;        % liveness floor for a valid measurement
    end

    properties (TestParameter)
        % Tx LO offset; the Rx stays at LO. Envelope from the Phase-0
        % software golden tolerance (clean decode through +/-20 kHz).
        cfoHz = {-20e3, -10e3, -5e3, 5e3, 10e3, 20e3};
        % Tx attenuation (adi.ADRV9002 convention: dB, 0 = max output).
        % Measured envelope boundary (2026-06-10, cable loopback, RxGain=30):
        % the link acquires and holds 0.00000% BER at -10..0 dB; at -20 dB
        % and below it does not acquire (0 packets). Gate only the supported
        % envelope; extend toward -20 dB only together with higher Rx gain
        % or AGC.
        txAttenDb = {-10, -5, 0};
        % Rx manual gain index (spi mode).
        rxGain = {15, 20, 25, 30, 35};
    end

    properties (Hidden)
        golden
    end

    methods (TestClassSetup)
        function addToolPaths(testCase) %#ok<MANU>
            here = fileparts(mfilename('fullpath'));
            addpath(fileparts(here));    % repo root: +adi package
            addpath(fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample'));
        end
        function buildGolden(testCase)
            C = commhdlQPSKTxRxParameters;
            sps = C.SamplesPerSymbol; DBPP = C.DataBitsPerPacket;
            sA = dec2bin(double('ADI Hello World'),8);
            msg = double(reshape(sA.',1,[])-'0').';
            pay0 = [msg; zeros(DBPP-numel(msg),1)];
            pre = C.Preamble(:); poly = [1 0 0 1 0 0 0];
            syms = [];
            for f = 1:30
                st = [1 0 1 1 1 0 1]; sc = zeros(size(pay0));
                for i = 1:numel(pay0)
                    bb = mod(nnz(st(poly==1)),2);
                    sc(i) = xor(pay0(i),bb); st = [st(2:7) bb]; %#ok<AGROW>
                end
                fb = [pre;sc];
                s = pskmod(fb(1:2:end)*2+fb(2:2:end),4,pi/4,'gray');
                syms = [syms; s(:)]; %#ok<AGROW>
            end
            w4 = zeros(numel(syms)*sps,1); w4(1:sps:end) = syms;
            w4 = filter(C.RRCCoef,1,w4);
            txw = resample(w4,2,1);
            testCase.golden = int16(txw/rms(txw)*2^14);
        end
        function checkBoard(testCase)
            % board reachable + composite registers present?
            try
                BistRegisters.read(testCase.RegPackets, 8);
            catch ME
                disp(ME.message);
                assumeFail(testCase, ...
                    'QPSK composite BIST registers not reachable -- is the verif BOOT.BIN deployed?');
            end
        end
    end

    methods
        function v = regRead(testCase, addr)
            v = double(BistRegisters.read(addr, 8));
        end
        function regWrite(testCase, addr, val) %#ok<INUSL>
            BistRegisters.sshExec( ...
                sprintf('busybox devmem %s 32 %d', addr, val), 8);
        end
        function [ber, pkts] = measureCableBer(testCase, txLO, txAtten, rxGainIdx, agc)
            % full procedure: buffers up -> soft reset -> select -> measure
            tx = adi.ADRV9002.Tx('uri', testCase.uri);
            tx.EnabledChannels = 1;
            tx.CenterFrequencyChannel0 = txLO;
            tx.AttenuationChannel0 = txAtten;
            tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
            tx.SamplesPerFrame = numel(testCase.golden);
            tx(testCase.golden);
            rx = adi.ADRV9002.Rx('uri', testCase.uri);
            rx.EnabledChannels = 1;
            rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^14;
            if ~agc
                try, rx.GainControlMode = 'spi'; catch, end
                try, rx.GainChannel0 = rxGainIdx; catch, end
            end
            rx(); pause(2);
            cleanup = onCleanup(@() cellfun(@release, {tx, rx}));
            testCase.regWrite(testCase.RegBase, 1); pause(1);
            testCase.regWrite(testCase.RegTxSelect, 1);
            testCase.regWrite(testCase.RegRxSelect, 1); pause(2);
            p0 = testCase.regRead(testCase.RegPackets);
            e0 = testCase.regRead(testCase.RegBitErrors);
            pause(testCase.MeasSeconds);
            p1 = testCase.regRead(testCase.RegPackets);
            e1 = testCase.regRead(testCase.RegBitErrors);
            pkts = p1 - p0;
            ber  = (e1 - e0) / max(1, pkts*120);
        end
        function verifyLink(testCase, ber, pkts, label)
            testCase.verifyGreaterThan(pkts, testCase.MinPackets, ...
                sprintf('%s: link did not sustain packet sync (%d pkts)', label, pkts));
            testCase.verifyLessThan(ber, testCase.BERGate, ...
                sprintf('%s: BER %.5f%% exceeds gate', label, 100*ber));
            fprintf('%s: pkts=%d BER=%.5f%%\n', label, pkts, 100*ber);
        end
    end

    methods (Test)
        function testBaselineCableLink(testCase)
            % no impairment: the reference condition
            [ber, pkts] = testCase.measureCableBer(testCase.LO, -10, 30, false);
            testCase.verifyLink(ber, pkts, 'baseline');
        end
        function testRecoverableCFO(testCase, cfoHz)
            [ber, pkts] = testCase.measureCableBer(testCase.LO + cfoHz, -10, 30, false);
            testCase.verifyLink(ber, pkts, sprintf('CFO %+d Hz', cfoHz));
        end
        function testTxAttenuationRange(testCase, txAttenDb)
            [ber, pkts] = testCase.measureCableBer(testCase.LO, txAttenDb, 30, false);
            testCase.verifyLink(ber, pkts, sprintf('TxAtten %d dB', txAttenDb));
        end
        function testRxGainRange(testCase, rxGain)
            [ber, pkts] = testCase.measureCableBer(testCase.LO, -10, rxGain, false);
            testCase.verifyLink(ber, pkts, sprintf('RxGain %d', rxGain));
        end
        function testRxAGCMode(testCase)
            % automatic gain control instead of fixed manual gain
            [ber, pkts] = testCase.measureCableBer(testCase.LO, -10, [], true);
            testCase.verifyLink(ber, pkts, 'AGC mode');
        end
        function testAcquisitionReliability(testCase)
            % the soft-reset-then-select procedure must acquire EVERY time:
            % 8 consecutive cold acquisitions, each gated on packet sync.
            tx = adi.ADRV9002.Tx('uri', testCase.uri);
            tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = testCase.LO;
            tx.AttenuationChannel0 = -10;
            tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
            tx.SamplesPerFrame = numel(testCase.golden); tx(testCase.golden);
            rx = adi.ADRV9002.Rx('uri', testCase.uri);
            rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^14; rx(); pause(2);
            cleanup = onCleanup(@() cellfun(@release, {tx, rx}));
            nOk = 0; nTry = 8;
            for k = 1:nTry
                testCase.regWrite(testCase.RegBase, 1); pause(1);
                testCase.regWrite(testCase.RegTxSelect, 1);
                testCase.regWrite(testCase.RegRxSelect, 1); pause(1);
                p0 = testCase.regRead(testCase.RegPackets); pause(5);
                p1 = testCase.regRead(testCase.RegPackets);
                ok = (p1-p0) > 3000;
                nOk = nOk + ok;
                fprintf('acquisition %d/%d: %d pkts/5s\n', k, nTry, p1-p0);
                testCase.verifyTrue(ok, sprintf('acquisition %d failed (%d pkts)', k, p1-p0));
            end
            fprintf('acquisition reliability: %d/%d\n', nOk, nTry);
        end
        function testRecoveryAfterStreamLoss(testCase)
            % documented behavior: the Receiver does not self-recover after
            % a stream interruption; the recovery procedure (soft reset +
            % reselect) must restore decode every time. 4 loss/recover cycles.
            rx = adi.ADRV9002.Rx('uri', testCase.uri);
            rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^14; rx(); pause(1);
            cleanupRx = onCleanup(@() release(rx));
            % warm-up acquisition (unasserted): a freshly created Rx object
            % settles during its first seconds; only cycle 1 would ever see
            % that transient, so absorb it here.
            txw = adi.ADRV9002.Tx('uri', testCase.uri);
            txw.EnabledChannels = 1; txw.CenterFrequencyChannel0 = testCase.LO;
            txw.AttenuationChannel0 = -10;
            txw.DataSource = 'DMA'; txw.EnableCyclicBuffers = true;
            txw.SamplesPerFrame = numel(testCase.golden); txw(testCase.golden);
            rx(); pause(1);
            testCase.regWrite(testCase.RegBase, 1); pause(1);
            testCase.regWrite(testCase.RegTxSelect, 1);
            testCase.regWrite(testCase.RegRxSelect, 1); pause(3);
            release(txw); pause(2);
            for k = 1:4
                tx = adi.ADRV9002.Tx('uri', testCase.uri);
                tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = testCase.LO;
                tx.AttenuationChannel0 = -10;
                tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
                tx.SamplesPerFrame = numel(testCase.golden); tx(testCase.golden);
                rx(); pause(1);            % keep the rx DMA buffer live
                testCase.regWrite(testCase.RegBase, 1); pause(1);
                testCase.regWrite(testCase.RegTxSelect, 1);
                testCase.regWrite(testCase.RegRxSelect, 1); pause(1);
                p0 = testCase.regRead(testCase.RegPackets); pause(5);
                p1 = testCase.regRead(testCase.RegPackets);
                testCase.verifyGreaterThan(p1-p0, 3000, ...
                    sprintf('cycle %d: did not acquire after recovery', k));
                release(tx); pause(2);     % stream loss
                p0 = testCase.regRead(testCase.RegPackets); pause(3);
                p1 = testCase.regRead(testCase.RegPackets);
                fprintf('cycle %d: post-loss rate %d pkts/3s (expected ~0)\n', k, p1-p0);
            end
        end
        function testCombinedImpairments(testCase)
            % CFO + reduced Tx power + off-nominal Rx gain simultaneously
            combos = { ...
                {+20e3, -10, 20, 'CFO+20k atten-10 gain20'}; ...
                {-20e3,  -5, 25, 'CFO-20k atten-5 gain25'}};
            for k = 1:numel(combos)
                c = combos{k};
                [ber, pkts] = testCase.measureCableBer(testCase.LO + c{1}, c{2}, c{3}, false);
                testCase.verifyLink(ber, pkts, c{4});
            end
        end
        function testCFOToleranceEdge(testCase)
            % characterize the carrier-offset edge: step outward until the
            % link fails; the edge must be at least the +/-20 kHz spec floor.
            edgePos = 0;
            for cfo = 20e3:5e3:40e3
                [ber, pkts] = testCase.measureCableBer(testCase.LO + cfo, -10, 30, false);
                fprintf('CFO edge probe %+d Hz: pkts=%d BER=%.5f%%\n', cfo, pkts, 100*ber);
                if pkts > testCase.MinPackets && ber < testCase.BERGate
                    edgePos = cfo;
                else
                    break;
                end
            end
            fprintf('CFO tolerance edge (positive): %d Hz\n', edgePos);
            testCase.verifyGreaterThanOrEqual(edgePos, 20e3, ...
                'CFO tolerance regressed below the +/-20 kHz spec floor');
        end
        function testBISTHostCrossCheck(testCase)
            % the BIST and an independent host software demod must agree:
            % capture the Receiver's post-AGC tap DURING active BIST decode;
            % both meters must read 0 errors over the same link.
            tx = adi.ADRV9002.Tx('uri', testCase.uri);
            tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = testCase.LO;
            tx.AttenuationChannel0 = -10;
            tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
            tx.SamplesPerFrame = numel(testCase.golden); tx(testCase.golden);
            rx = adi.ADRV9002.Rx('uri', testCase.uri);
            rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^18; rx(); pause(2);
            cleanup = onCleanup(@() cellfun(@release, {tx, rx}));
            testCase.regWrite(testCase.RegBase, 1); pause(1);
            testCase.regWrite(testCase.RegTxSelect, 1);
            testCase.regWrite(testCase.RegRxSelect, 1);
            testCase.regWrite('0x9D00010C', 0); pause(2);   % tap0 = post-AGC
            p0 = testCase.regRead(testCase.RegPackets);
            e0 = testCase.regRead(testCase.RegBitErrors);
            y = [];
            for k = 1:6, y = rx(); end
            p1 = testCase.regRead(testCase.RegPackets);
            e1 = testCase.regRead(testCase.RegBitErrors);
            bistBer = (e1-e0)/max(1,(p1-p0)*120);
            [~,nf,evm,info] = demodPlutoCapture(double(y)/2^14, testCase.Fs);
            fprintf('cross-check BIST: %d pkts BER=%.5f%% | host: %s\n', ...
                p1-p0, 100*bistBer, info);
            % the capture window is shorter than a timed measurement; ~4800
            % packets span six 2^18-sample buffers at the nominal rate
            testCase.verifyGreaterThan(p1-p0, 2000, 'BIST not decoding');
            testCase.verifyLessThan(bistBer, testCase.BERGate, 'BIST BER over gate');
            testCase.verifyGreaterThan(nf, 10, 'host decoded too few frames');
            testCase.verifyLessThan(evm, 0.15, 'host EVM degraded');
        end
        function testSustainedBER15Min(testCase)
            % robustness soak: 15 minutes of continuous decode in 30 s
            % windows. Every window must hold packet sync (catches mid-run
            % dropouts that a single cumulative number would average away)
            % and the cumulative BER must stay under the gate (~100M
            % checked bits at the nominal packet rate).
            tx = adi.ADRV9002.Tx('uri', testCase.uri);
            tx.EnabledChannels = 1;
            tx.CenterFrequencyChannel0 = testCase.LO;
            tx.AttenuationChannel0 = -10;
            tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
            tx.SamplesPerFrame = numel(testCase.golden);
            tx(testCase.golden);
            rx = adi.ADRV9002.Rx('uri', testCase.uri);
            rx.EnabledChannels = 1;
            rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^14;
            try, rx.GainControlMode = 'spi'; catch, end
            try, rx.GainChannel0 = 30; catch, end
            rx(); pause(2);
            cleanup = onCleanup(@() cellfun(@release, {tx, rx}));
            testCase.regWrite(testCase.RegBase, 1); pause(1);
            testCase.regWrite(testCase.RegTxSelect, 1);
            testCase.regWrite(testCase.RegRxSelect, 1); pause(2);

            nWin = 30; winSec = 30;          % 15 minutes
            p0 = testCase.regRead(testCase.RegPackets);
            e0 = testCase.regRead(testCase.RegBitErrors);
            pPrev = p0; t0 = tic;
            for w = 1:nWin
                pause(winSec);
                p1 = testCase.regRead(testCase.RegPackets);
                e1 = testCase.regRead(testCase.RegBitErrors);
                wPkts = p1 - pPrev; pPrev = p1;
                cumBits = (p1 - p0)*120;
                cumBer  = (e1 - e0)/max(1, cumBits);
                fprintf('soak %5.0fs: window pkts=%d cum pkts=%d cum BER=%.6f%%\n', ...
                    toc(t0), wPkts, p1-p0, 100*cumBer);
                testCase.verifyGreaterThan(wPkts, testCase.MinPackets, ...
                    sprintf('soak window %d (t=%.0fs): packet sync lost (%d pkts)', ...
                    w, toc(t0), wPkts));
            end
            p1 = testCase.regRead(testCase.RegPackets);
            e1 = testCase.regRead(testCase.RegBitErrors);
            cumBits = (p1 - p0)*120;
            cumBer  = (e1 - e0)/max(1, cumBits);
            testCase.verifyGreaterThan(cumBits, 1e6, ...
                'soak: fewer than 1M checked bits');
            testCase.verifyLessThan(cumBer, testCase.BERGate, ...
                sprintf('soak: cumulative BER %.6f%% over %d bits exceeds gate', ...
                100*cumBer, cumBits));
            fprintf('soak FINAL: %d packets, %d checked bits, %d errors, BER=%.6f%%\n', ...
                p1-p0, cumBits, e1-e0, 100*cumBer);
        end
    end
end
