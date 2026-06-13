classdef ByteDmaRegisters
    % ByteDmaRegisters -- host-side driver for the byte-TX axi_dmac
    % (driverless v1: registers programmed via /dev/mem over ssh, source
    % buffer in a reserved physical memory region).
    %
    % DMA register map (axi_dmac, byte offsets from DmaBase; verified
    % against hdl/vendor/.../library/axi_dmac/axi_dmac_regmap*.v):
    %   +0x080 IRQ_MASK        +0x400 CONTROL        +0x40C FLAGS (CYCLIC)
    %   +0x414 SRC_ADDRESS     +0x418 X_LENGTH (bytes-1, 8-byte aligned)
    %   +0x408 TRANSFER_SUBMIT
    %
    % Operating order (load-bearing): start() the DMA FIRST, then pulse the
    % QPSK IP soft reset (0x9D000000) and select byte mode (0x9D00011C=1).
    % A DMA restart mid-stream without the soft reset misaligns words.

    properties (Constant)
        DmaBase = '0x9D100000';
        RxDmaBase = '0x9D200000';
        BufPhys = '0x7FF00000';    % reserved-memory region qpsk_byte_buf (DT node, last 1 MB of DDR)
        RxBufPhys = '0x7FF80000';  % second half of the reserved region: S2MM capture buffer
        TxDataSourceAddr = '0x9D00011C';
    end

    methods (Static)
        function words = pack(bytes)
            % pack(bytes) -- byte vector -> uint64 word column, byte 0 in
            % the LSB byte of word 1 (little-endian memory order: the DMA
            % fetches words from RAM where the first byte sits at the
            % lowest address). Exact inverse of qpskByteBitShifter's
            % byte-0-first emission. Pads to an 8-byte multiple with zeros.
            b = uint8(bytes(:));
            n = ceil(numel(b)/8)*8;
            b(end+1:n) = 0;
            words = zeros(n/8, 1, 'uint64');
            for k = 1:8
                words = bitor(words, bitshift(uint64(b(k:8:end)), 8*(k-1)));
            end
        end

        function fill(bytes)
            % write the packed payload into the reserved buffer via the
            % board's /dev/mem (32-bit devmem writes; payloads are small)
            words = ByteDmaRegisters.pack(bytes);
            base = double(sscanf(ByteDmaRegisters.BufPhys, '0x%x'));
            cmd = '';
            for k = 1:numel(words)
                lo = double(bitand(words(k), uint64(4294967295)));
                hi = double(bitshift(words(k), -32));
                cmd = [cmd sprintf('busybox devmem 0x%X 32 %d; busybox devmem 0x%X 32 %d; ', ...
                    base + 8*(k-1), lo, base + 8*(k-1) + 4, hi)]; %#ok<AGROW>
            end
            BistRegisters.sshExec(cmd, 30);
        end

        function start(lenBytes)
            % submit a cyclic transfer of lenBytes from the reserved buffer
            assert(mod(lenBytes, 8) == 0, 'length must be 8-byte aligned');
            B = double(sscanf(ByteDmaRegisters.DmaBase, '0x%x'));
            A = double(sscanf(ByteDmaRegisters.BufPhys, '0x%x'));
            cmd = sprintf([ ...
                'busybox devmem 0x%X 32 0; sleep 1; ' ... % CONTROL: disable (engine reset -- a stale/wedged engine ignores new transfers)
                'busybox devmem 0x%X 32 3; ' ...     % IRQ_MASK: mask all
                'busybox devmem 0x%X 32 1; ' ...     % CONTROL: enable
                'busybox devmem 0x%X 32 3; ' ...     % FLAGS: CYCLIC | TLAST (tlast per loop marks word 1 for the aligner)
                'busybox devmem 0x%X 32 %d; ' ...    % SRC_ADDRESS
                'busybox devmem 0x%X 32 %d; ' ...    % X_LENGTH = bytes-1
                'busybox devmem 0x%X 32 1'], ...     % TRANSFER_SUBMIT
                B+1024, B+128, B+1024, B+1036, B+1044, A, B+1048, lenBytes-1, B+1032);
            BistRegisters.sshExec(cmd, 10);
        end

        function stop()
            B = double(sscanf(ByteDmaRegisters.DmaBase, '0x%x'));
            BistRegisters.sshExec(sprintf('busybox devmem 0x%X 32 0', B+1024), 10);
        end

        function bytes = rxCapture(lenBytes)
            % one-shot S2MM capture of the Receiver's recovered byte stream:
            % program the rx DMA for lenBytes into the capture buffer, poll
            % completion, read the buffer back. The Rx serializer asserts
            % tlast on the 35th word of each packet, so 280-byte transfers
            % complete on packet boundaries.
            assert(mod(lenBytes, 8) == 0, 'length must be 8-byte aligned');
            % per-packet TLAST must be ON for packet-aligned one-shot
            % captures. On TLAST-gated bitstreams the qpsk_tun daemon can
            % leave byte_ctrl_gpio (0x9D300000) cleared for its multi-packet
            % mode; restore the legacy default here. Tolerant of bitstreams
            % without the gpio (the write simply errors, hence || true).
            BistRegisters.sshExec('busybox devmem 0x9D300000 32 1 2>/dev/null || true', 10);
            B = double(sscanf(ByteDmaRegisters.RxDmaBase, '0x%x'));
            A = double(sscanf(ByteDmaRegisters.RxBufPhys, '0x%x'));
            % clear the buffer first so stale data cannot fake a pass
            clr = '';
            for k = 1:lenBytes/4
                clr = [clr sprintf('busybox devmem 0x%X 32 0; ', A+4*(k-1))]; %#ok<AGROW>
            end
            BistRegisters.sshExec(clr, 30);
            % SYNC_TRANSFER_START is enabled on the rx DMA: the capture begins
            % at the first beat carrying tuser[0]=1 (the serializer's
            % first-word-of-packet marker), so every transfer is
            % packet-aligned by construction.
            cmd = sprintf([ ...
                'busybox devmem 0x%X 32 0; sleep 1; ' ... % CONTROL: engine reset
                'busybox devmem 0x%X 32 3; ' ...          % IRQ_MASK: mask all
                'busybox devmem 0x%X 32 1; ' ...          % CONTROL: enable
                'busybox devmem 0x%X 32 0; ' ...          % FLAGS: one-shot
                'busybox devmem 0x%X 32 0; ' ...          % TRANSFER_ID = 0
                'busybox devmem 0x%X 32 %d; ' ...         % DEST_ADDRESS
                'busybox devmem 0x%X 32 %d; ' ...         % X_LENGTH = bytes-1
                'busybox devmem 0x%X 32 1'], ...          % TRANSFER_SUBMIT
                B+1024, B+128, B+1024, B+1036, B+1028, ...
                B+1040, A, B+1048, lenBytes-1, B+1032);
            BistRegisters.sshExec(cmd, 10);
            % poll completion (TRANSFER_DONE bit 0)
            done = false;
            for k = 1:20
                v = double(BistRegisters.read(sprintf('0x%X', B+1064), 8));
                if bitand(uint32(v), uint32(1)) > 0, done = true; break; end
                pause(0.2);
            end
            assert(done, 'rx byte DMA capture did not complete');
            % read the buffer back (32-bit words, little-endian)
            rdcmd = '';
            for k = 1:lenBytes/4
                rdcmd = [rdcmd sprintf('busybox devmem 0x%X; ', A+4*(k-1))]; %#ok<AGROW>
            end
            [~, out] = BistRegisters.sshExec(rdcmd, 30);
            tok = regexp(out, '0x([0-9A-Fa-f]{8})', 'tokens');
            words32 = cellfun(@(c) uint32(hex2dec(c{1})), tok).';
            assert(numel(words32) == lenBytes/4, 'short buffer readback');
            bytes = zeros(lenBytes, 1, 'uint8');
            for k = 1:4
                bytes(k:4:end) = uint8(bitand(bitshift(words32, -8*(k-1)), uint32(255)));
            end
        end
    end
end
