classdef PrbsLoopbackRegisters
    %PrbsLoopbackRegisters  AXI4-Lite I/O for the ADRV9002 PRBS digital-
    %   loopback design, over ssh + busybox devmem (mirrors BistRegisters).
    %
    %   Register map (base 0x9D000100), per hdlworkflow_prbs.m:
    %     0x9D000100  W  prbs_control  bit0 reset, bit1 gen_enable, bit2 inject
    %     0x9D000104  R  sample_count  valid samples scored since lock
    %     0x9D000108  R  bit_errors_I  accumulated I-lane bit errors
    %     0x9D00010C  R  bit_errors_Q  accumulated Q-lane bit errors
    %     0x9D000110  R  lock_status   bit0 I locked, bit1 Q locked
    %
    %   Static utility -- no instance state. parseHex is pure (no ssh).

    properties (Constant)
        Host                 = 'root@10.0.0.146';
        SshConnectTimeoutSec = 5;
        ControlAddr   = '0x9D000100';   % prbs_control (W)
        SampleAddr    = '0x9D000104';   % sample_count (R)
        BitErrIAddr   = '0x9D000108';   % bit_errors_I (R)
        BitErrQAddr   = '0x9D00010C';   % bit_errors_Q (R)
        LockAddr      = '0x9D000110';   % lock_status  (R)
        CapIdxAddr    = '0x9D000118';   % capture_idx  (W)
        CapTxIAddr    = '0x9D00011C';   % capture_txI  (R)
        CapAdcIAddr   = '0x9D000120';   % capture_adcI (R)
        CapAdcQAddr   = '0x9D000124';   % capture_adcQ (R)

        % control bit masks
        CTRL_RESET    = 1;
        CTRL_GEN_EN   = 2;
        CTRL_INJECT   = 4;
        CTRL_CAPTURE  = 8;   % bit3: arm the capture buffer (rising edge)
    end

    methods (Static)
        % ---- pure helpers (unit-testable, no ssh) ----
        function vals = parseHex(stdout)
            toks = regexp(char(stdout), '0[xX][0-9A-Fa-f]+', 'match');
            vals = zeros(numel(toks), 1);
            for k = 1:numel(toks)
                vals(k) = double(hex2dec(toks{k}(3:end)));
            end
        end

        function s = registerMap()
            s = struct( ...
                'prbs_control', PrbsLoopbackRegisters.ControlAddr, ...
                'sample_count', PrbsLoopbackRegisters.SampleAddr,  ...
                'bit_errors_I', PrbsLoopbackRegisters.BitErrIAddr, ...
                'bit_errors_Q', PrbsLoopbackRegisters.BitErrQAddr, ...
                'lock_status',  PrbsLoopbackRegisters.LockAddr);
        end

        % ---- shell I/O ----
        function [rc, out] = sshExec(remoteCmd, sshTimeoutSec)
            if nargin < 2, sshTimeoutSec = PrbsLoopbackRegisters.SshConnectTimeoutSec; end
            askpass = ['/tmp/PrbsReg_askpass_' num2str(feature('getpid')) '.sh'];
            fid = fopen(askpass,'w'); fprintf(fid,'#!/bin/bash\necho analog\n'); fclose(fid);
            fileattrib(askpass,'+x');
            sshcmd = sprintf( ...
                'SSH_ASKPASS=%s SSH_ASKPASS_REQUIRE=force DISPLAY=:0 setsid -w ssh -o StrictHostKeyChecking=accept-new -o ConnectTimeout=%d -o NumberOfPasswordPrompts=1 %s "%s" 2>/dev/null', ...
                askpass, sshTimeoutSec, PrbsLoopbackRegisters.Host, strrep(remoteCmd,'"','\"'));
            [rc, out] = system(sshcmd);
            try, delete(askpass); catch, end
        end

        % ---- single register ----
        function v = read(addr, sshTimeoutSec)
            if nargin < 2, sshTimeoutSec = PrbsLoopbackRegisters.SshConnectTimeoutSec; end
            cmd = sprintf('busybox devmem %s 32', addr);
            [rc, out] = PrbsLoopbackRegisters.sshExec(cmd, sshTimeoutSec);
            if rc ~= 0, v = NaN; return; end
            v = PrbsLoopbackRegisters.parseHex(out);
            if isempty(v), v = NaN; else, v = v(1); end
        end

        function write(addr, value, sshTimeoutSec)
            if nargin < 3, sshTimeoutSec = PrbsLoopbackRegisters.SshConnectTimeoutSec; end
            cmd = sprintf('busybox devmem %s 32 0x%X', addr, uint32(value));
            PrbsLoopbackRegisters.sshExec(cmd, sshTimeoutSec);
        end

        % ---- control helpers ----
        function writeControl(maskValue)
            PrbsLoopbackRegisters.write(PrbsLoopbackRegisters.ControlAddr, maskValue);
        end

        function resetAndEnable()
            % Pulse reset (with gen enabled), then hold gen enabled.
            R = PrbsLoopbackRegisters;
            R.writeControl(bitor(R.CTRL_RESET, R.CTRL_GEN_EN));
            pause(0.05);
            R.writeControl(R.CTRL_GEN_EN);
        end

        function injectError(enable)
            R = PrbsLoopbackRegisters;
            base = R.CTRL_GEN_EN;
            if enable, base = bitor(base, R.CTRL_INJECT); end
            R.writeControl(base);
        end

        % ---- batched status read ----
        function S = readAll(sshTimeoutSec)
            if nargin < 1, sshTimeoutSec = PrbsLoopbackRegisters.SshConnectTimeoutSec; end
            R = PrbsLoopbackRegisters;
            cmd = sprintf('busybox devmem %s 32; busybox devmem %s 32; busybox devmem %s 32; busybox devmem %s 32', ...
                R.SampleAddr, R.BitErrIAddr, R.BitErrQAddr, R.LockAddr);
            [rc, out] = R.sshExec(cmd, sshTimeoutSec);
            if rc ~= 0
                S = struct('sample_count',NaN,'bit_errors_I',NaN,'bit_errors_Q',NaN, ...
                           'lock_status',NaN,'I_locked',NaN,'Q_locked',NaN);
                return;
            end
            v = R.parseHex(out);
            v(end+1:4) = NaN;
            lock = v(4);
            S = struct('sample_count', v(1), 'bit_errors_I', v(2), ...
                       'bit_errors_Q', v(3), 'lock_status', lock, ...
                       'I_locked', bitand(lock,1)>0, 'Q_locked', bitand(lock,2)>0);
        end
    end
end
