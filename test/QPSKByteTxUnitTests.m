classdef QPSKByteTxUnitTests < matlab.unittest.TestCase
    % QPSKByteTxUnitTests -- logic-level tests for the host->FPGA byte
    % transfer path (no hardware, no HDL build, no Simulink model).
    %
    % Units under test (shared verbatim by the Simulink MATLAB Function
    % blocks, so passing here means the modeled logic is correct):
    %   qpskByteBitShifter  -- 64-bit word -> payload bit deserializer
    %                          (byte-0-first, MSB-first per byte; resyncs
    %                          its bit index on the packet start flag)
    %   qpskByteWordBuffer  -- 2-deep AXIS-side word FIFO with registered
    %                          ready backpressure
    %   ByteDmaRegisters.pack -- host-side byte->uint64 word packer (the
    %                          exact inverse ordering of the shifter)
    %   AnalogDevices.jupiter.plugin_rd_rxtx_byte -- reference design
    %                          variant exposing the byte interfaces

    properties (Constant)
        DBPP = 2240;               % payload bits per packet
        WordsPerPacket = 35;       % 2240 / 64
        BytesPerPacket = 280;      % 2240 / 8
    end

    methods (TestClassSetup)
        function addToolPaths(testCase) %#ok<MANU>
            here = fileparts(mfilename('fullpath'));
            addpath(fileparts(here));   % repo root (+adi, hdl vendor pkgs)
            addpath(fullfile(fileparts(here), 'hdl', 'vendor', 'AnalogDevices'));
            addpath(fullfile(fileparts(here), ...
                'trx_examples','targeting','QPSKTxRxHDLExample'));
        end
    end

    methods
        function bits = shiftWords(testCase, words, nBits)
            % run the shifter over a word stream, continuous enable, one
            % start pulse at bit 1 (packet boundary), collecting nBits
            bits = false(nBits,1);
            state = qpskByteBitShifter();          % reset/init call
            wi = 1;
            for k = 1:nBits
                start = (mod(k-1, testCase.DBPP) == 0);
                [b, pop, state] = qpskByteBitShifter(state, true, start, ...
                    words(min(wi,numel(words))), true);
                bits(k) = b;
                if pop
                    wi = wi + 1;
                end
            end
        end
    end

    methods (Test)
        function testBitOrdering(testCase)
            % shifting the packed BIST-reference payload must reproduce the
            % BIST reference bit order exactly: dec2bin(...,8) row-reshape
            % (byte 0 first, MSB first within each byte)
            sA  = dec2bin(double('ADI Hello World'), 8);
            msg = logical(reshape(sA.',1,[]).' - '0');
            payloadBytes = zeros(testCase.BytesPerPacket, 1, 'uint8');
            payloadBytes(1:15) = uint8('ADI Hello World');
            words = ByteDmaRegisters.pack(payloadBytes);
            testCase.verifyEqual(numel(words), testCase.WordsPerPacket, ...
                'pack must yield exactly 35 words for 280 bytes');
            bits = testCase.shiftWords(words, testCase.DBPP);
            testCase.verifyEqual(bits(1:120), msg, ...
                'first 120 shifted bits must equal the BIST reference order');
            testCase.verifyFalse(any(bits(121:end)), ...
                'zero padding must shift out as zeros');
        end

        function testPackerShifterRoundtrip(testCase)
            % random payloads survive pack -> shift -> repack, byte-exact
            rng(7);
            for it = 1:100
                payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
                words = ByteDmaRegisters.pack(payload);
                bits = testCase.shiftWords(words, testCase.DBPP);
                back = uint8(zeros(testCase.BytesPerPacket,1));
                for b = 1:testCase.BytesPerPacket
                    back(b) = uint8(bin2dec(char('0' + ...
                        bits((b-1)*8+1 : b*8).')));
                end
                testCase.verifyEqual(back, payload, ...
                    sprintf('roundtrip mismatch at fuzz iteration %d', it));
            end
        end

        function testShifterPacketResync(testCase)
            % a start pulse arriving with the shifter mid-word must reset
            % the bit index: alignment self-heals at every packet boundary
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            state = qpskByteBitShifter();
            % desync deliberately: consume 13 bits with no start
            for k = 1:13
                [~, ~, state] = qpskByteBitShifter(state, true, false, words(1), true);
            end
            % now a packet start: the next 2240 bits must decode payload
            bits = false(testCase.DBPP,1);
            wi = 1;
            for k = 1:testCase.DBPP
                [b, pop, state] = qpskByteBitShifter(state, true, k==1, ...
                    words(min(wi,end)), true);
                bits(k) = b;
                if pop, wi = wi + 1; end
            end
            back = uint8(zeros(testCase.BytesPerPacket,1));
            for b = 1:testCase.BytesPerPacket
                back(b) = uint8(bin2dec(char('0' + bits((b-1)*8+1:b*8).')));
            end
            testCase.verifyEqual(back, payload, 'post-resync packet corrupt');
            % 35 words consumed per packet, invariant over 10 packets
            state = qpskByteBitShifter();
            pops = 0;
            for pkt = 1:10
                for k = 1:testCase.DBPP
                    [~, pop, state] = qpskByteBitShifter(state, true, k==1, ...
                        uint64(pkt), true);
                    pops = pops + pop;
                end
            end
            testCase.verifyEqual(pops, 10*testCase.WordsPerPacket, ...
                'word consumption must be exactly 35 per packet');
        end

        function testWordBufferHandshake(testCase)
            % 2-deep FIFO: ready deasserts at occupancy 2; accepts only on
            % valid&ready; pops in order; no drop/duplicate under fuzz
            rng(11);
            state = qpskByteWordBuffer();
            pushed = uint64([]); popped = uint64([]);
            nextVal = uint64(1);
            for k = 1:1000
                vIn  = rand < 0.6;
                pReq = rand < 0.35;
                [word, avail, ready, state] = qpskByteWordBuffer( ...
                    state, nextVal, vIn, pReq);
                if vIn && ready
                    pushed(end+1) = nextVal; %#ok<AGROW>
                    nextVal = nextVal + 1;
                end
                if pReq && avail
                    popped(end+1) = word; %#ok<AGROW>
                end
                occ = numel(pushed) - numel(popped);
                testCase.verifyGreaterThanOrEqual(occ, 0);
                testCase.verifyLessThanOrEqual(occ, 2, ...
                    'occupancy exceeded FIFO depth');
                if occ >= 2
                    % ready must be deasserted on the NEXT cycle (registered)
                    [~, ~, readyNext, state] = qpskByteWordBuffer( ...
                        state, nextVal, false, false);
                    testCase.verifyFalse(logical(readyNext), ...
                        'ready asserted while full');
                end
            end
            testCase.verifyEqual(popped.', pushed(1:numel(popped)).', ...
                'FIFO order/drop/duplicate violation');
        end

        function testPluginInterfaces(testCase)
            % the byte reference design variant must expose the three byte
            % interfaces with the right widths and BD connections, and a
            % distinct ReferenceDesignName
            hRD = AnalogDevices.jupiter.plugin_rd_rxtx_byte();
            testCase.verifySubstring(upper(hRD.ReferenceDesignName), 'BYTE');
            w = warning('off','all'); cleanup = onCleanup(@() warning(w));
            s = struct(hRD);
            il = struct(s.hRAWInterfaceList);
            ids = il.InterfaceIDList;
            need = {'Byte Data IN','Byte Valid IN','Byte Ready OUT'};
            for k = 1:numel(need)
                testCase.verifyTrue(any(strcmp(ids, need{k})), ...
                    sprintf('missing interface %s', need{k}));
            end
            iData = il.InterfaceIDMap('Byte Data IN');
            testCase.verifyEqual(double(iData.PortWidth), 64);
            testCase.verifySubstring(char(iData.InterfaceConnection), ...
                'byte_breakout/byte_data');
            % the variant must carry the byte_dma parameter for the BD tcl
            pl = struct(s.hParameterList);
            testCase.verifyTrue(any(strcmp(pl.ParameterIDList,'byte_dma')), ...
                'byte_dma parameter missing from reference design');
            % and stock tcl branching must still see ref_design = rxtx
            prm = pl.ParameterIDMap('ref_design');
            testCase.verifyEqual(char(prm.DefaultValue), 'rxtx');
        end
    end
end
