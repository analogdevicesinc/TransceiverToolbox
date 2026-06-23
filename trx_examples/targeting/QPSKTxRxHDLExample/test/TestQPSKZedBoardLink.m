classdef TestQPSKZedBoardLink < matlab.unittest.TestCase
    % TestQPSKZedBoardLink -- HW verification for the ZedBoard CMOS byte-DMA
    % QPSK composite design (ADRV9002 + xc7z020, Zynq-7000) running standalone
    % at 1.92 MHz SSI / 240 ksym. Unlike the Jupiter designs (0x9D... regfile,
    % libiio streaming), the ZedBoard exposes the modem on the Zynq-7000 GP0
    % window at 0x43C00000 and is driven entirely through the on-board
    % host_app/qpsk_capture tool over ssh + /dev/mem -- no libiio, no
    % adi.ADRV9002 System objects.
    %
    % This is the ZedBoard standalone 1.92 MHz CMOS cable SELF-loopback case:
    % unlike Jupiter (whose in-FPGA-Tx self-loopback is an unreliable
    % single-board self-test artifact at 1.92 MHz), the ZedBoard build PASSES
    % its cable self-loopback cleanly -- 0% garbage in clean windows
    % (1.02M-packet soak = 0.00064% BER) -- because its bitstream carries the
    % multiple=2 + regularizer/AdcCap path that the Jupiter build lacks.
    %
    %   Board: root@10.0.0.128 (password 'analog'), modem @ 0x43C00000,
    %   stock ADRV9002 profile (1.92 MHz SSI / 240 ksym).
    %   Override the IP with the IIO_URI_ZED env var (ip:host form ok).
    %
    % Run: results = runtests('TestQPSKZedBoardLink');

    properties (Constant)
        AppDir   = '/root/host_app';
        PktBytes = 280;
        % cable RF loopback gate: the stock-rate cable link decodes at
        % ~0% in clean windows (1.02M-pkt soak = 0.00064% BER); allow a
        % small margin for occasional RF loss-of-lock.
        GarbageGate = 0.05;   % < 5% garbage packets
    end

    properties
        host = 'root@10.0.0.128';
    end

    methods (TestClassSetup)
        function addPaths(~)
            % the example dir carries the shared helpers (BistRegisters,
            % ByteDmaRegisters) and must be on the path for runtests.
            here = fileparts(fileparts(mfilename('fullpath')));
            addpath(here);
        end
        function resolveHost(testCase)
            uri = getenv('IIO_URI_ZED');
            if ~isempty(uri)
                ip = regexprep(uri, '^ip:', '');
                testCase.host = ['root@' ip];
            end
        end
        function checkBoardAndTool(testCase)
            % board reachable + ZedBoard modem regfile present?
            [rc, out] = testCase.ssh('busybox devmem 0x43C00100 32', 12);
            testCase.assumeEqual(rc, 0, sprintf('ZedBoard %s not reachable over ssh', testCase.host));
            testCase.assumeTrue(contains(out, '0x'), ...
                'ZedBoard modem regfile (0x43C00100) not readable -- is the byte BOOT.BIN deployed?');
            % build the byte-DMA host tool for the ZedBoard (native gcc, -DQPSK_BOARD_ZED)
            [rc, out] = testCase.ssh(['cd ' testCase.AppDir ...
                ' && make BOARD=zed qpsk_capture 2>&1'], 90);
            testCase.assertEqual(rc, 0, sprintf('qpsk_capture build failed: %s', out));
        end
    end

    methods (Static)
        function [rc, out] = ssh(remoteCmd, timeoutSec)
            % password ssh to the ZedBoard via an askpass + setsid wrapper
            % (the board has no key auth). Mirrors BistRegisters.sshExec but
            % targets this class's host.
            if nargin < 2, timeoutSec = 12; end
            host = 'root@10.0.0.128';
            uri = getenv('IIO_URI_ZED');
            if ~isempty(uri), host = ['root@' regexprep(uri,'^ip:','')]; end
            ap = ['/tmp/QPSKZed_askpass_' num2str(feature('getpid')) '.sh'];
            fid = fopen(ap,'w'); fprintf(fid,'#!/bin/bash\necho analog\n'); fclose(fid);
            fileattrib(ap,'+x');
            cmd = sprintf(['SSH_ASKPASS=%s SSH_ASKPASS_REQUIRE=force DISPLAY=:0 setsid -w ' ...
                'ssh -o StrictHostKeyChecking=accept-new -o ConnectTimeout=%d ' ...
                '-o PreferredAuthentications=password -o PubkeyAuthentication=no ' ...
                '%s "%s" 2>/dev/null'], ap, timeoutSec, host, strrep(remoteCmd,'"','\"'));
            [rc, out] = system(cmd);
            try, delete(ap); catch, end
        end

        function g = captureGarbageRate(host, nPkt, rxsel) %#ok<INUSL>
            % run qpsk_capture for nPkt packets at the given loopback select
            % and return the fraction of "garbage" (>30% byte-error) packets,
            % computed on the board by per-byte majority vote (cyclic payload).
            pkt = TestQPSKZedBoardLink.PktBytes;
            py = sprintf([ ...
                'python3 - <<PYEOF\n' ...
                'from collections import Counter\n' ...
                'PKT=%d;d=open("/tmp/zbt.bin","rb").read();N=len(d)//PKT\n' ...
                'pk=[d[i*PKT:(i+1)*PKT] for i in range(N)]\n' ...
                'ref=bytes(Counter(p[j] for p in pk).most_common(1)[0][0] for j in range(PKT))\n' ...
                'g=sum(1 for p in pk if sum(1 for j in range(PKT) if p[j]!=ref[j])>PKT*0.3)\n' ...
                'print("GARBAGE %%d %%d"%%(g,N))\n' ...
                'PYEOF\n'], pkt);
            remote = sprintf(['cd %s; D=/sys/bus/iio/devices/iio:device0; ' ...
                'echo 0 > $D/out_voltage0_hardwaregain 2>/dev/null; ' ...
                './qpsk_capture %d %d /tmp/zbt.bin 42 %d >/dev/null 2>&1; %s'], ...
                TestQPSKZedBoardLink.AppDir, nPkt, pkt, rxsel, py);
            [~, out] = TestQPSKZedBoardLink.ssh(remote, 90);
            tok = regexp(out, 'GARBAGE\s+(\d+)\s+(\d+)', 'tokens', 'once');
            assert(~isempty(tok), sprintf('no capture result from board: %s', out));
            g = str2double(tok{1}) / max(1, str2double(tok{2}));
        end
    end

    methods (Test)
        function testModemAlive(testCase)
            % The composite is framing if the BIST packet counter
            % (0x43C00104) shows activity. NOTE: this counter is a
            % short-window packet count that RESETS frequently and reads 0
            % between windows -- especially under the bimodal lock at the
            % 8x-low 240-ksym operating point (observed sequence e.g.
            % 0,0,38,35,3,49,0,0,...). A single before/after pair therefore
            % reads equal (both 0) by chance ~half the time, so sample the
            % counter many times over a few seconds and require it to be
            % non-zero / advance at least once -> robust liveness check.
            % arm a framing configuration (soft-reset FIRST, then internal
            % generator -> in-FPGA Tx -> cable Rx) so the counter advances,
            % then sample it repeatedly from MATLAB (single-read ssh calls,
            % which are robust; a remote shell loop is not portable through
            % the ssh wrapper).
            testCase.ssh(['busybox devmem 0x43C00000 32 1; sleep 1; ' ...
                'busybox devmem 0x43C0011C 32 0; busybox devmem 0x43C00118 32 0; ' ...
                'busybox devmem 0x43C00114 32 1'], 15);
            pause(1);
            vals = [];
            for k = 1:14
                [rc, o] = testCase.ssh('busybox devmem 0x43C00104 32', 10);
                t = regexp(o, '0x([0-9A-Fa-f]+)', 'tokens', 'once');
                if rc == 0 && ~isempty(t), vals(end+1) = hex2dec(t{1}); end %#ok<AGROW>
                pause(0.3);
            end
            testCase.assertNotEmpty(vals, ...
                'no packet-counter readings from ZedBoard (0x43C00104) -- board/modem unreachable');
            advanced = (max(vals) > 0) || (numel(unique(vals)) > 1);
            testCase.verifyTrue(advanced, sprintf( ...
                ['ZedBoard BIST packet counter (0x43C00104) never advanced over %d ' ...
                 'samples (all %s) -- modem idle / not framing'], numel(vals), mat2str(vals(:)')));
        end

        function testCableLinkClean(testCase)
            % CMOS cable RF loopback: arbitrary byte-DMA data must decode with
            % a low garbage rate (the real-link operating point).
            g = TestQPSKZedBoardLink.captureGarbageRate(testCase.host, 600, 1);
            fprintf('ZedBoard cable garbage rate: %.3f%%\n', 100*g);
            testCase.verifyLessThan(g, testCase.GarbageGate, ...
                sprintf('ZedBoard cable byte-DMA garbage %.2f%% exceeds %.0f%% gate', ...
                100*g, 100*testCase.GarbageGate));
        end

        function testOversizeCaptureRefused(testCase)
            % the 512 KB RX-buffer bounds-check must REFUSE an oversize capture
            % (>1872 pkts) instead of overrunning kernel RAM and wedging the board.
            [~, out] = testCase.ssh(['cd ' testCase.AppDir ...
                ' && ./qpsk_capture 4000 280 /tmp/zbt_big.bin 42 0 2>&1; echo RC=$?'], 20);
            testCase.verifyTrue(contains(out, 'exceeds') && contains(out, 'RX buffer'), ...
                'oversize capture was not refused by the bounds-check');
            % board must still be alive (not wedged)
            [rc, o] = testCase.ssh('busybox devmem 0x43C00100 32', 12);
            testCase.verifyEqual(rc, 0, 'board unreachable after oversize-capture attempt (wedged?)');
            testCase.verifyTrue(contains(o, '0x'), 'modem regfile unreadable after oversize attempt');
        end
    end
end
