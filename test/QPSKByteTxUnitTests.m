classdef QPSKByteTxUnitTests < matlab.unittest.TestCase
    % QPSKByteTxUnitTests -- logic-level tests for the host->FPGA byte
    % transfer path (no hardware, no HDL build, no Simulink model).
    %
    % Units under test (shared verbatim by the Simulink MATLAB Function
    % blocks, so passing here means the modeled logic is correct):
    %   qpskByteBitShifter  -- 64-bit word -> payload bit deserializer
    %                          (byte-0-first, MSB-first per byte; resyncs
    %                          its bit index on the packet start flag and
    %                          WORD-ALIGNS to the in-band first-word marker
    %                          so a rotated cyclic-DMA stream converges)
    %   qpskByteWordBuffer  -- 2-deep AXIS-side word FIFO with registered
    %                          ready backpressure; carries a first-word
    %                          flag alongside each word
    %   qpskByteSerializer  -- Rx mirror: recovered payload bit ->
    %                          64-bit word serializer (EXACT inverse of
    %                          qpskByteBitShifter; drop-on-stall, never
    %                          stalls the Receiver)
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
            % run the shifter over an ALIGNED word stream (firstIn true on
            % every 35th word starting at word 1), continuous enable, one
            % start pulse at each packet boundary, collecting nBits
            bits = false(nBits,1);
            state = qpskByteBitShifter();          % reset/init call
            wi = 1;
            for k = 1:nBits
                start = (mod(k-1, testCase.DBPP) == 0);
                wf = (mod(wi-1, testCase.WordsPerPacket) == 0);
                [b, pop, state] = qpskByteBitShifter(state, true, start, ...
                    words(min(wi,numel(words))), true, wf);
                bits(k) = b;
                if pop
                    wi = wi + 1;
                end
            end
        end

        function bytes = bitsToBytes(testCase, bits)
            % inverse of the shifter ordering: 8 bits MSB-first per byte
            bytes = uint8(zeros(testCase.BytesPerPacket,1));
            for b = 1:testCase.BytesPerPacket
                bytes(b) = uint8(bin2dec(char('0' + bits((b-1)*8+1:b*8).')));
            end
        end

        function [words, lasts, drops, state] = serializeBits( ...
                testCase, bits, state, readyFcn, startFcn)
            % run the serializer over a bit stream (bitValid=true every
            % step); readyFcn(k)/startFcn(k) parameterize the drive.
            % Returns emitted words, their wordLast flags, and the number
            % of dropped words.
            if isempty(state), state = qpskByteSerializer(); end
            if isempty(readyFcn), readyFcn = @(k) true; end
            if isempty(startFcn)
                startFcn = @(k) mod(k-1, testCase.DBPP) == 0;
            end
            words = uint64([]); lasts = false(0,1); drops = 0;
            for k = 1:numel(bits)
                [w, wv, wl, dp, state] = qpskByteSerializer(state, ...
                    bits(k), true, startFcn(k), readyFcn(k));
                if wv
                    words(end+1,1) = w; %#ok<AGROW>
                    lasts(end+1,1) = logical(wl); %#ok<AGROW>
                end
                drops = drops + double(dp);
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
                back = testCase.bitsToBytes(bits);
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
            % desync deliberately: consume 13 bits with no start. The head
            % word is first-marked, so the unaligned shifter HOLDS on it
            % (no pops) until the start arrives.
            for k = 1:13
                [~, ~, state] = qpskByteBitShifter(state, true, false, ...
                    words(1), true, true);
            end
            % now a packet start: the next 2240 bits must decode payload
            bits = false(testCase.DBPP,1);
            wi = 1;
            for k = 1:testCase.DBPP
                wf = (mod(wi-1, testCase.WordsPerPacket) == 0);
                [b, pop, state] = qpskByteBitShifter(state, true, k==1, ...
                    words(min(wi,end)), true, wf);
                bits(k) = b;
                if pop, wi = wi + 1; end
            end
            back = testCase.bitsToBytes(bits);
            testCase.verifyEqual(back, payload, 'post-resync packet corrupt');
            % 35 words consumed per packet, invariant over 10 packets
            state = qpskByteBitShifter();
            pops = 0;
            for pkt = 1:10
                for k = 1:testCase.DBPP
                    wf = (mod(pops, testCase.WordsPerPacket) == 0);
                    [~, pop, state] = qpskByteBitShifter(state, true, k==1, ...
                        uint64(pkt), true, wf);
                    pops = pops + pop;
                end
            end
            testCase.verifyEqual(pops, 10*testCase.WordsPerPacket, ...
                'word consumption must be exactly 35 per packet');
        end

        function testRotationRealignment(testCase)
            % the cyclic DMA's word phase vs the packet boundary is
            % arbitrary: the stream may start at ANY of the 35 rotations.
            % The shifter must converge via the first-word marker: discard
            % unmarked words, hold on the marked word, latch it on the next
            % start. From the SECOND packet onward decode must be
            % byte-exact, and stay byte-exact for the following packets.
            rng(23);
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            W = testCase.WordsPerPacket;
            for offset = [1 7 17 34]
                state = qpskByteBitShifter();
                p = offset + 1;             % stream head starts rotated
                nPkts = 8;                  % 1 garbage + 7 checked
                bits = false(nPkts*testCase.DBPP,1);
                for k = 1:nPkts*testCase.DBPP
                    start = (mod(k-1, testCase.DBPP) == 0);
                    wIdx = mod(p-1, W) + 1;
                    [b, pop, state] = qpskByteBitShifter(state, true, ...
                        start, words(wIdx), true, wIdx == 1);
                    bits(k) = b;
                    if pop, p = p + 1; end
                end
                for pkt = 2:nPkts
                    pb = bits((pkt-1)*testCase.DBPP + (1:testCase.DBPP));
                    back = testCase.bitsToBytes(pb);
                    testCase.verifyEqual(back, payload, sprintf( ...
                        'rotation offset %d: packet %d not byte-exact', ...
                        offset, pkt));
                end
            end
        end

        function testUnderflowRealign(testCase)
            % after alignment, a 100-step wordAvail starvation mid-packet
            % must drop alignment (zeros emitted) and the shifter must
            % re-converge within 2 packets once the (rotated) stream resumes
            rng(31);
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            W = testCase.WordsPerPacket;
            offset = 17;
            state = qpskByteBitShifter();
            p = offset + 1;
            nPkts = 7;
            % starve 100 steps starting mid-packet-3
            starve0 = 2*testCase.DBPP + 1000;
            starve1 = starve0 + 99;
            bits = false(nPkts*testCase.DBPP,1);
            for k = 1:nPkts*testCase.DBPP
                start = (mod(k-1, testCase.DBPP) == 0);
                avail = ~(k >= starve0 && k <= starve1);
                wIdx = mod(p-1, W) + 1;
                [b, pop, state] = qpskByteBitShifter(state, true, ...
                    start, words(wIdx), avail, wIdx == 1);
                bits(k) = b;
                if pop, p = p + 1; end
            end
            % packet 2: aligned before the starve -- must be byte-exact
            pb = bits(testCase.DBPP + (1:testCase.DBPP));
            testCase.verifyEqual(testCase.bitsToBytes(pb), payload, ...
                'packet 2 (pre-starve, aligned) not byte-exact');
            % packets 5..7: re-converged within 2 packets of the starve
            for pkt = 5:nPkts
                pb = bits((pkt-1)*testCase.DBPP + (1:testCase.DBPP));
                testCase.verifyEqual(testCase.bitsToBytes(pb), payload, ...
                    sprintf('packet %d after underflow not byte-exact', pkt));
            end
        end

        function testWordBufferHandshake(testCase)
            % 2-deep FIFO: ready deasserts at occupancy 2; accepts only on
            % valid&ready; pops in order; no drop/duplicate under fuzz; the
            % first-word flag travels with its word
            rng(11);
            state = qpskByteWordBuffer();
            pushed = uint64([]); popped = uint64([]);
            pushedF = false(0,1); poppedF = false(0,1);
            nextVal = uint64(1);
            for k = 1:1000
                vIn  = rand < 0.6;
                pReq = rand < 0.35;
                fIn  = rand < 0.2;
                [word, avail, ready, wordFirst, state] = qpskByteWordBuffer( ...
                    state, nextVal, vIn, pReq, fIn);
                if vIn && ready
                    pushed(end+1) = nextVal; %#ok<AGROW>
                    pushedF(end+1,1) = fIn;
                    nextVal = nextVal + 1;
                end
                if pReq && avail
                    popped(end+1) = word; %#ok<AGROW>
                    poppedF(end+1,1) = logical(wordFirst);
                end
                occ = numel(pushed) - numel(popped);
                testCase.verifyGreaterThanOrEqual(occ, 0);
                testCase.verifyLessThanOrEqual(occ, 2, ...
                    'occupancy exceeded FIFO depth');
                if occ >= 2
                    % ready must be deasserted on the NEXT cycle (registered)
                    [~, ~, readyNext, ~, state] = qpskByteWordBuffer( ...
                        state, nextVal, false, false, false);
                    testCase.verifyFalse(logical(readyNext), ...
                        'ready asserted while full');
                end
            end
            testCase.verifyEqual(popped.', pushed(1:numel(popped)).', ...
                'FIFO order/drop/duplicate violation');
            testCase.verifyEqual(poppedF, pushedF(1:numel(poppedF)), ...
                'first-word flag did not travel with its word');
        end

        function testSerializerRoundtrip(testCase)
            % ROUNDTRIP LAW: shifter(pack(bytes)) bits fed into the
            % serializer must reproduce pack(bytes) words exactly, for 50
            % random payloads (the serializer is the exact inverse of the
            % shifter: byte-0-first, MSB-first per byte)
            rng(41);
            for it = 1:50
                payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
                words = ByteDmaRegisters.pack(payload);
                bits = testCase.shiftWords(words, testCase.DBPP);
                [got, lasts] = testCase.serializeBits(bits, [], [], []);
                testCase.verifyEqual(got, words, sprintf( ...
                    'roundtrip mismatch at fuzz iteration %d', it));
                testCase.verifyEqual(numel(got), testCase.WordsPerPacket);
                testCase.verifyTrue(lasts(end), ...
                    'wordLast missing on the packet''s final word');
                testCase.verifyFalse(any(lasts(1:end-1)), ...
                    'wordLast asserted before word 35');
            end
        end

        function testSerializerWordLast(testCase)
            % wordLast exactly on every 35th word, 35 words per packet,
            % over 10 back-to-back packets (start pulse at each boundary)
            rng(43);
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            bits1 = testCase.shiftWords(words, testCase.DBPP);
            bits = repmat(bits1, 10, 1);
            [got, lasts, drops] = testCase.serializeBits(bits, [], [], []);
            testCase.verifyEqual(numel(got), 10*testCase.WordsPerPacket, ...
                'word count must be exactly 35 per packet');
            testCase.verifyEqual(drops, 0);
            expLast = false(numel(got),1);
            expLast(testCase.WordsPerPacket:testCase.WordsPerPacket:end) = true;
            testCase.verifyEqual(lasts, expLast, ...
                'wordLast must fire exactly on every 35th word');
            testCase.verifyEqual(got, repmat(words,10,1));
        end

        function testSerializerDropOnStall(testCase)
            % ready=false while words 5 and 6 complete -> exactly those two
            % words dropped (flagged via drop, no wordValid), the stream
            % resumes correctly and NO later word is corrupted; packet 2 is
            % complete. The serializer must never stall.
            rng(47);
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            bits1 = testCase.shiftWords(words, testCase.DBPP);
            bits = repmat(bits1, 2, 1);
            % words 5 and 6 of packet 1 complete at bit steps 320 and 384;
            % hold ready low across their whole collection window
            readyFcn = @(k) ~(k >= 257 && k <= 384);
            [got, lasts, drops] = testCase.serializeBits(bits, [], readyFcn, []);
            testCase.verifyEqual(drops, 2, 'exactly 2 words must be dropped');
            exp = [words([1:4 7:end]); words];
            testCase.verifyEqual(got, exp, ...
                'post-stall stream corrupt (later words must be intact)');
            % wordLast still lands on the words completing the packets
            % (word positions count dropped words too)
            expLast = false(numel(exp),1);
            expLast(testCase.WordsPerPacket-2) = true;   % packet 1 (2 dropped)
            expLast(end) = true;                          % packet 2
            testCase.verifyEqual(lasts, expLast, ...
                'wordLast misplaced around the dropped words');
        end

        function testSerializerMidWordStart(testCase)
            % a start arriving mid-word must discard the partial word: 13
            % garbage bits with no start, then a full packet with start on
            % its first bit -> exactly the 35 payload words, byte-exact
            rng(53);
            payload = uint8(randi([0 255], testCase.BytesPerPacket, 1));
            words = ByteDmaRegisters.pack(payload);
            bits1 = testCase.shiftWords(words, testCase.DBPP);
            garbage = rand(13,1) > 0.5;
            bits = [garbage; bits1];
            startFcn = @(k) k == numel(garbage) + 1;
            [got, lasts, drops] = testCase.serializeBits(bits, [], [], startFcn);
            testCase.verifyEqual(drops, 0);
            testCase.verifyEqual(numel(got), testCase.WordsPerPacket, ...
                'partial word must be discarded, not emitted');
            testCase.verifyEqual(got, words, 'post-start packet corrupt');
            testCase.verifyTrue(lasts(end));
        end

        function testPluginInterfaces(testCase)
            % the byte reference design variant must expose the four byte
            % interfaces with the right widths and BD connections, and a
            % distinct ReferenceDesignName
            hRD = AnalogDevices.jupiter.plugin_rd_rxtx_byte();
            testCase.verifySubstring(upper(hRD.ReferenceDesignName), 'BYTE');
            w = warning('off','all'); cleanup = onCleanup(@() warning(w));
            s = struct(hRD);
            il = struct(s.hRAWInterfaceList);
            ids = il.InterfaceIDList;
            need = {'Byte Data IN','Byte Valid IN','Byte Ready OUT', ...
                    'Byte First IN'};
            for k = 1:numel(need)
                testCase.verifyTrue(any(strcmp(ids, need{k})), ...
                    sprintf('missing interface %s', need{k}));
            end
            iData = il.InterfaceIDMap('Byte Data IN');
            testCase.verifyEqual(double(iData.PortWidth), 64);
            testCase.verifySubstring(char(iData.InterfaceConnection), ...
                'byte_breakout/byte_data');
            iFirst = il.InterfaceIDMap('Byte First IN');
            testCase.verifyEqual(double(iFirst.PortWidth), 1);
            testCase.verifySubstring(char(iFirst.InterfaceConnection), ...
                'byte_breakout/byte_first');
            % --- Rx-side byte path (DUT -> rx_byte_dma -> DDR) ---
            needRx = {'Byte Data OUT','Byte Valid OUT','Byte Last OUT', ...
                      'Byte Ready IN'};
            for k = 1:numel(needRx)
                testCase.verifyTrue(any(strcmp(ids, needRx{k})), ...
                    sprintf('missing Rx interface %s', needRx{k}));
            end
            rxSpec = { ...
              'Byte Data OUT',  64, 'OUT', 'dut_byte_data_out',  'rx_byte_breakout/byte_data'; ...
              'Byte Valid OUT',  1, 'OUT', 'dut_byte_valid_out', 'rx_byte_breakout/byte_valid'; ...
              'Byte Last OUT',   1, 'OUT', 'dut_byte_last_out',  'rx_byte_breakout/byte_last'; ...
              'Byte Ready IN',   1, 'IN',  'dut_byte_ready_in',  'rx_byte_breakout/byte_ready'};
            for k = 1:size(rxSpec,1)
                if ~any(strcmp(ids, rxSpec{k,1})), continue; end
                ifc = il.InterfaceIDMap(rxSpec{k,1});
                testCase.verifyEqual(double(ifc.PortWidth), rxSpec{k,2}, ...
                    sprintf('%s: wrong width', rxSpec{k,1}));
                testCase.verifyEqual(upper(char(ifc.InterfaceType)), ...
                    rxSpec{k,3}, sprintf('%s: wrong direction', rxSpec{k,1}));
                testCase.verifyEqual(char(ifc.PortName), rxSpec{k,4}, ...
                    sprintf('%s: wrong port name', rxSpec{k,1}));
                testCase.verifySubstring(char(ifc.InterfaceConnection), ...
                    rxSpec{k,5});
            end
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
