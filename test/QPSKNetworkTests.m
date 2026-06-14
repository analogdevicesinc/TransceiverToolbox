classdef QPSKNetworkTests < matlab.unittest.TestCase
    % Hardware tests for the TUN-over-byte-DMA network layer (qpsk_tun).
    %
    % The board-side daemon (host_app/qpsk_tun.c) bridges two TUN
    % interfaces to the Tx/Rx byte DMAs so standard userspace tools run
    % over the QPSK RF link. Topology (qpsk_net_setup.sh up cable):
    % nsA{qpsk0 10.66.0.1} --RF cable--> nsB{qpsk1 10.66.0.2}, reverse
    % path over an in-process tun bridge (ret0/ret1; the board kernel has
    % no veth). The daemon's link-layer ARQ (gap-driven retransmit plus a
    % delayed second copy) masks the parked in-FPGA-Tx artifact's burst
    % loss (~17% raw) down to <1%.
    %
    % Requires: byte-DMA bitstream (6cb464e3 lineage), RF cable Tx1->Rx1,
    % iperf3 + the compiled daemon on the board (test setup deploys and
    % rebuilds host_app automatically). Gates are artifact-aware; see
    % each test.
    %
    % Run: results = runtests('QPSKNetworkTests');   (~35 min: two
    % 15-minute soaks plus setup)

    properties (Constant)
        SoakSeconds = 900;       % 15-minute soaks
        BoardAppDir = '/root/host_app';
        Uri = 'ip:10.0.0.146';
        LO = 2.4e9;
    end

    properties (Hidden)
        % The ADRV9002 is armed via MATLAB (full radio profile + channel
        % enable) and HELD for the whole suite, instead of the board
        % script's CLI rf(). Two reasons, both root-caused: (1) CLI
        % iio_attr only sets gain, not the profile the cold cable path
        % needs; (2) the CLI cyclic iio_writedev + its pkill on teardown
        % can wedge the tx dmaengine channel ("Device or resource busy")
        % across repeated runs. The daemon drives the independent byte
        % DMA, so MATLAB holding the sample DMA does not conflict.
        txRadio
        rxRadio
    end

    methods (TestClassSetup)
        function addToolPaths(testCase) %#ok<MANU>
            here = fileparts(mfilename('fullpath'));
            addpath(fileparts(here));
            addpath(fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample'));
        end
        function checkBoardAndDesign(testCase)
            try
                v = double(BistRegisters.read('0x9D100000', 8));
            catch
                v = 0;
            end
            testCase.assumeTrue(v > 0, ...
                'byte-DMA bitstream not deployed (tx DMAC version unreadable)');
            try
                v = double(BistRegisters.read('0x9D20000C', 8));
            catch
                v = 0;
            end
            testCase.assumeTrue(v > 0, 'rx byte DMA not in this bitstream');
        end
        function deployHostApp(testCase)
            % sync sources to the board and rebuild there (native gcc)
            here = fileparts(mfilename('fullpath'));
            appDir = fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample','host_app');
            files = {'qpsk_frame.h','qpsk_frame.c','qpsk_tun.c', ...
                     'test_frame.c','Makefile','qpsk_net_setup.sh'};
            BistRegisters.sshExec(['mkdir -p ' testCase.BoardAppDir], 15);
            for k = 1:numel(files)
                src = fullfile(appDir, files{k});
                testCase.scpToBoard(src);
            end
            [rc, out] = BistRegisters.sshExec( ...
                ['cd ' testCase.BoardAppDir ' && make clean >/dev/null && make all test'], 120);
            testCase.assertEqual(rc, 0, sprintf('board build failed: %s', out));
            testCase.assertTrue(contains(out, '0 failed'), ...
                'frame unit tests failed on the board');
        end
        function netUp(testCase)
            testCase.armRadio();   % radio profiled + channels enabled first
            [rc, out] = testCase.netSetup('up cable noRF');
            testCase.assertEqual(rc, 0, sprintf('net setup failed: %s', out));
            % iperf3 server resident in nsB for the whole class
            BistRegisters.sshExec('pkill -x iperf3; sleep 1; true', 15);
            [rc, out] = BistRegisters.sshExec( ...
                'ip netns exec nsB iperf3 -s -D -B 10.66.0.2', 15);
            testCase.assertEqual(rc, 0, sprintf('iperf3 server failed: %s', out));
            pause(2);
        end
    end

    methods (TestClassTeardown)
        function netDown(testCase)
            BistRegisters.sshExec('pkill -x iperf3; true', 15);
            testCase.netSetup('down');
            try, release(testCase.txRadio); catch, end
            try, release(testCase.rxRadio); catch, end
        end
    end

    methods
        function armRadio(testCase)
            % Configure the ADRV9002 the way the byte e2e test does (full
            % profile + channel enable) and KEEP it open for the suite; the
            % board script is told to skip its CLI rf(). Tx atten 0 dB + Rx
            % AGC is the measured cable operating point.
            %
            % NOTE: this is a PLAIN helper, NOT a TestClassSetup fixture --
            % it must run exactly once (called by netUp). If it lived in the
            % methods(TestClassSetup) block the framework would auto-run it
            % AND netUp would call it again, double-arming the tx buffer
            % ("Failed to create buffer for axi-adrv9002-tx-lpc").
            tx = adi.ADRV9002.Tx('uri', testCase.Uri);
            tx.EnabledChannels = 1; tx.CenterFrequencyChannel0 = testCase.LO;
            tx.AttenuationChannel0 = 0;
            tx.DataSource = 'DMA'; tx.EnableCyclicBuffers = true;
            tx(complex(zeros(4096,1,'int16'), zeros(4096,1,'int16')));
            rx = adi.ADRV9002.Rx('uri', testCase.Uri);
            rx.EnabledChannels = 1; rx.CenterFrequencyChannel0 = testCase.LO;
            rx.SamplesPerFrame = 2^14; rx();
            testCase.txRadio = tx; testCase.rxRadio = rx;
            pause(2);
        end
        function scpToBoard(testCase, src)
            % BistRegisters-style scp (same askpass/setsid pattern)
            askpass = ['/tmp/qpsk_net_askpass_' num2str(feature('getpid')) '.sh'];
            fid = fopen(askpass,'w'); fprintf(fid,'#!/bin/bash\necho analog\n'); fclose(fid);
            fileattrib(askpass,'+x');
            cmd = sprintf(['SSH_ASKPASS=%s SSH_ASKPASS_REQUIRE=force DISPLAY=:0 ' ...
                'setsid -w scp -o StrictHostKeyChecking=accept-new -o ConnectTimeout=15 ' ...
                '%s %s:%s/ 2>/dev/null'], askpass, src, BistRegisters.Host, ...
                testCase.BoardAppDir);
            [rc, out] = system(cmd);
            try, delete(askpass); catch, end
            testCase.assertEqual(rc, 0, sprintf('scp %s failed: %s', src, out));
        end
        function [rc, out] = netSetup(testCase, args)
            [rc, out] = BistRegisters.sshExec( ...
                sprintf('cd %s && ./qpsk_net_setup.sh %s', ...
                testCase.BoardAppDir, args), 60);
        end
        function checkDaemonAlive(testCase, label)
            [~, out] = BistRegisters.sshExec( ...
                'pgrep -f "qpsk_tun -i qpsk0" >/dev/null && echo ALIVE', 15);
            testCase.verifyTrue(contains(out, 'ALIVE'), ...
                sprintf('%s: daemon died during the run', label));
        end
        function s = iperfJson(testCase, args, timeoutSec)
            [rc, out] = BistRegisters.sshExec( ...
                sprintf('ip netns exec nsA iperf3 -c 10.66.0.2 -J %s', args), ...
                timeoutSec);
            testCase.assertEqual(rc, 0, sprintf('iperf3 run failed: %s', out));
            s = jsondecode(out);
            testCase.assertFalse(isfield(s, 'error'), ...
                sprintf('iperf3 reported: %s', jsonencode(s)));
        end
    end

    methods (Test)
        function testFrameUnit(testCase)
            % framing library contract tests on the dev host
            here = fileparts(mfilename('fullpath'));
            appDir = fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample','host_app');
            [rc, out] = system(['PATH=/usr/bin:$PATH make -C ' appDir ' test']);
            testCase.verifyEqual(rc, 0, sprintf('make test failed: %s', out));
            testCase.verifyTrue(contains(out, '0 failed'), out);
        end

        function testTunPing(testCase)
            % 50 pings nsA->nsB over the RF path. ARQ recovers artifact
            % episodes; gate well above the raw 83% frame survival.
            [rc, out] = BistRegisters.sshExec( ...
                'ip netns exec nsA ping -c 50 -i 0.2 -W 2 10.66.0.2 | tail -2', 60);
            testCase.assertEqual(rc, 0, sprintf('ping failed to run: %s', out));
            tok = regexp(out, '(\d+) received', 'tokens', 'once');
            testCase.assertNotEmpty(tok, sprintf('unparseable ping output: %s', out));
            received = str2double(tok{1});
            fprintf('tunPing: %d/50 replies\n%s\n', received, strtrim(out));
            testCase.verifyGreaterThanOrEqual(received, 30, ...
                'fewer than 60% ping replies over RF');
            rtt = regexp(out, 'rtt [^=]*= [\d.]+/([\d.]+)/', 'tokens', 'once');
            testCase.assertNotEmpty(rtt, 'no rtt stats');
            testCase.verifyLessThan(str2double(rtt{1}), 250, ...
                'mean RTT above 250 ms');
        end

        function testIperfTcp15Min(testCase)
            % 15-minute TCP soak. Cubic over the ARQ'd link measured
            % ~1.2 Mbit/s in 20 s runs; gate at 1.0 with the run
            % completing and the daemon alive afterward.
            s = testCase.iperfJson(sprintf('-t %d', testCase.SoakSeconds), ...
                testCase.SoakSeconds + 120);
            e = s.('end');   % jsondecode field; 'end' is a MATLAB keyword
            mbps = e.sum_received.bits_per_second / 1e6;
            secs = e.sum_received.seconds;
            fprintf('tcp15min: %.2f Mbit/s over %.0f s, %d retransmits\n', ...
                mbps, secs, e.sum_sent.retransmits);
            testCase.verifyGreaterThanOrEqual(secs, testCase.SoakSeconds - 10, ...
                'TCP soak ended early');
            testCase.verifyGreaterThanOrEqual(mbps, 1.0, ...
                'TCP goodput under 1.0 Mbit/s');
            % no interval stalled to zero for >60 s consecutively
            zeroRun = 0; worst = 0;
            for k = 1:numel(s.intervals)
                if s.intervals(k).sum.bytes == 0
                    zeroRun = zeroRun + s.intervals(k).sum.seconds;
                else
                    zeroRun = 0;
                end
                worst = max(worst, zeroRun);
            end
            testCase.verifyLessThanOrEqual(worst, 60, ...
                sprintf('TCP stalled for %.0f s', worst));
            testCase.checkDaemonAlive('tcp15min');
        end

        function testIperfUdp15Min(testCase)
            % 15-minute UDP soak at 2.5 Mbit/s offered (link raw rate
            % ~3.3 Mbit/s). 20 s runs measured 0.63% loss with ARQ.
            s = testCase.iperfJson(sprintf('-u -b 2.5M -t %d', ...
                testCase.SoakSeconds), testCase.SoakSeconds + 120);
            e = s.('end');   % jsondecode field; 'end' is a MATLAB keyword
            es = e.sum;
            deliveredMbps = (1 - es.lost_percent/100) * es.bits_per_second / 1e6;
            fprintf('udp15min: %.2f Mbit/s delivered, loss=%.2f%%, jitter=%.3f ms\n', ...
                deliveredMbps, es.lost_percent, es.jitter_ms);
            testCase.verifyGreaterThanOrEqual(es.seconds, testCase.SoakSeconds - 10, ...
                'UDP soak ended early');
            testCase.verifyGreaterThanOrEqual(deliveredMbps, 1.8, ...
                'UDP delivered under 1.8 Mbit/s');
            testCase.verifyLessThan(es.lost_percent, 25, ...
                'UDP loss above the artifact-aware gate');
            testCase.verifyGreaterThanOrEqual(es.jitter_ms, 0, 'jitter missing');
            testCase.checkDaemonAlive('udp15min');
        end
    end
end
