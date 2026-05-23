classdef BistRegisters
    %BistRegisters  AXI4-Lite BIST register I/O over ssh+devmem for the
    %   deployed composite TxRxLoopback / Receiver designs on Jupiter
    %   (root@10.0.0.146). Static utility -- no instance state.
    %
    %   read*    methods return doubles parsed from devmem hex output.
    %   write    method sets a 32-bit value.
    %   readAll  returns a struct of all five BIST registers.
    %   parseHex is pure (no ssh) -- exposed for unit testing.

    properties (Constant)
        Host                = 'root@10.0.0.146';
        SshConnectTimeoutSec = 5;
        CountAddr           = '0x9D000100';   % count_out
        PacketsAddr         = '0x9D000104';   % packets_out
        BitErrorsAddr       = '0x9D000108';   % bit_errors_out
        IqDebugMuxAddr      = '0x9D00010C';   % iq_debug_mux (AXI input)
        RstCsAddr           = '0x9D000110';   % rstCS (AXI input)
    end

    methods (Static)
        % ---- pure helpers (unit-testable, no ssh) ----
        function vals = parseHex(stdout)
            % Extract every 0x... token from devmem-style stdout and return
            % them as a column vector of doubles.
            toks = regexp(char(stdout), '0[xX][0-9A-Fa-f]+', 'match');
            vals = zeros(numel(toks), 1);
            for k = 1:numel(toks)
                vals(k) = double(hex2dec(toks{k}(3:end)));
            end
        end

        function s = registerMap()
            % Name -> address map for all five BIST registers (so tests
            % iterate them by name).
            s = struct( ...
                'count',       BistRegisters.CountAddr,      ...
                'packets',     BistRegisters.PacketsAddr,    ...
                'bit_errors',  BistRegisters.BitErrorsAddr,  ...
                'iq_debug_mux',BistRegisters.IqDebugMuxAddr, ...
                'rstCS',       BistRegisters.RstCsAddr);
        end

        % ---- shell I/O ----
        function [rc, out] = sshExec(remoteCmd, sshTimeoutSec)
            if nargin < 2, sshTimeoutSec = BistRegisters.SshConnectTimeoutSec; end
            askpass = ['/tmp/BistRegisters_askpass_' num2str(feature('getpid')) '.sh'];
            fid = fopen(askpass,'w'); fprintf(fid,'#!/bin/bash\necho analog\n'); fclose(fid);
            fileattrib(askpass,'+x');
            sshcmd = sprintf( ...
                'SSH_ASKPASS=%s SSH_ASKPASS_REQUIRE=force DISPLAY=:0 setsid -w ssh -o StrictHostKeyChecking=accept-new -o ConnectTimeout=%d -o NumberOfPasswordPrompts=1 %s "%s" 2>/dev/null', ...
                askpass, sshTimeoutSec, BistRegisters.Host, strrep(remoteCmd,'"','\"'));
            [rc, out] = system(sshcmd);
            try, delete(askpass); catch, end
        end

        % ---- single register ----
        function v = read(addr, sshTimeoutSec)
            if nargin < 2, sshTimeoutSec = BistRegisters.SshConnectTimeoutSec; end
            cmd = sprintf('busybox devmem %s 32', addr);
            [rc, out] = BistRegisters.sshExec(cmd, sshTimeoutSec);
            if rc ~= 0, v = NaN; return; end
            v = BistRegisters.parseHex(out);
            if isempty(v), v = NaN; else, v = v(1); end
        end

        function write(addr, value, sshTimeoutSec)
            if nargin < 3, sshTimeoutSec = BistRegisters.SshConnectTimeoutSec; end
            cmd = sprintf('busybox devmem %s 32 0x%X', addr, uint32(value));
            BistRegisters.sshExec(cmd, sshTimeoutSec);
        end

        % ---- batched ----
        function S = readAll(sshTimeoutSec)
            if nargin < 1, sshTimeoutSec = BistRegisters.SshConnectTimeoutSec; end
            cmd = sprintf('busybox devmem %s 32; busybox devmem %s 32; busybox devmem %s 32; busybox devmem %s 32; busybox devmem %s 32', ...
                BistRegisters.CountAddr, BistRegisters.PacketsAddr, ...
                BistRegisters.BitErrorsAddr, BistRegisters.IqDebugMuxAddr, ...
                BistRegisters.RstCsAddr);
            [rc, out] = BistRegisters.sshExec(cmd, sshTimeoutSec);
            if rc ~= 0
                S = struct('count',NaN,'packets',NaN,'bit_errors',NaN,'iq_debug_mux',NaN,'rstCS',NaN);
                return;
            end
            v = BistRegisters.parseHex(out);
            v(end+1:5) = NaN;
            S = struct('count', v(1), 'packets', v(2), 'bit_errors', v(3), ...
                       'iq_debug_mux', v(4), 'rstCS', v(5));
        end
    end
end
