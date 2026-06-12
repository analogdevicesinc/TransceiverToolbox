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
        BufPhys = '0x7FF00000';    % reserved-memory region qpsk_byte_buf (DT node, last 1 MB of DDR)
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
    end
end
