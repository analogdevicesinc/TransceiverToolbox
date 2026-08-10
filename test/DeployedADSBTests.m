classdef DeployedADSBTests < HardwareTests
    % DeployedADSBTests Validates the deployed ADS-B detector bitstream.
    %
    % Exercises the HDL detector built by
    % trx_examples/targeting/adsb-airplane-tracking/hdlworkflow.m on an
    % ADRV9361-Z7035. Rather than waiting for an aircraft to fly overhead --
    % which would make the result depend on the airspace, not the design --
    % the test transmits a known extended squitter into the receiver through
    % the AD9361's internal loopback and checks that the FPGA recovers it
    % bit for bit.
    %
    % The labgrid HW-CI path boots each place with the daughter-board's
    % stock HDL image, which has no ADS-B detector. TestClassSetup therefore
    % probes for the design and filters the test out when it is absent, so
    % this is inert on a stock image and only truly runs on a place staged
    % with the ADS-B BOOT.BIN.

    properties
        author = 'ADI'
        uri = 'ip:analog.local'
    end

    properties (Constant)
        % A well-formed DF17 airborne position squitter. Parity is
        % recomputed by genADSBWaveform, so the literal need not be valid.
        TestMessage = '8D4840D6202CC371C32CE0576098'
        % Correlation threshold written to the DUT for the loopback test.
        % Loopback delivers a clean, strong signal, so this is comfortably
        % above the noise without being so high it rejects the pulses.
        SyncThreshold = 40
    end

    methods (TestClassSetup)
        function CheckForADSBDesign(testCase)
            % Proceed only when the ADS-B detector is actually deployed.
            %
            % Deliberately narrow error handling: an unreachable board is a
            % legitimate skip, but a broken register API is not. If the
            % latter were swallowed here the whole class would assume out
            % on every run and report green without ever asserting anything.
            c = adsbFrameConstants();

            try
                rx = adi.AD9361.Rx('uri', testCase.uri);
                rx.EnabledChannels = [1 2];
                rx();
                rx.release();
            catch ME
                testCase.assumeFail(sprintf( ...
                    'Filtering test: no reachable board at %s (%s)', ...
                    testCase.uri, ME.message));
            end

            % Writing then reading back the threshold register proves the
            % ADS-B IP's AXI4-Lite map is present -- the stock HDL image has
            % nothing at this offset. Let a genuine API failure propagate.
            w = adsbRegister(testCase.uri, 'write', c.RegThreshold, 'int16');
            r = adsbRegister(testCase.uri, 'read', c.RegThreshold, 'int16');
            w(testCase.SyncThreshold);
            readBack = double(r());

            testCase.assumeEqual(readBack, double(testCase.SyncThreshold), ...
                'Filtering test: ADS-B detector design not deployed on target');
        end
    end

    methods (Test)
        function testDeployedADSBLoopbackAD9361(testCase)
            ip_str = strrep(testCase.uri, 'ip:', '');
            testCase.CheckDevice('ip', @()adi.AD9361.Rx('uri', testCase.uri), ip_str, false);

            c = adsbFrameConstants();

            % Build the stimulus and pad it so the transmit buffer is a
            % convenient length for the DMA.
            [wf, txBits] = genADSBWaveform(testCase.TestMessage, 'PadSamples', 1024);

            tx = adi.AD9361.Tx('uri', testCase.uri);
            tx.CenterFrequency = c.CenterFreq;
            tx.SamplingRate = c.SamplingRate;
            tx.RFBandwidth = 8e6;
            tx.EnabledChannels = 1;
            tx.EnableCyclicBuffers = true;

            rx = adi.AD9361.Rx('uri', testCase.uri);
            rx.CenterFrequency = c.CenterFreq;
            rx.SamplingRate = c.SamplingRate;
            rx.RFBandwidth = 8e6;
            rx.GainControlModeChannel0 = 'fast_attack';
            rx.GainControlModeChannel1 = 'fast_attack';
            % Channel 1 is the baseband pass-through, channel 2 the frame
            % stream, so both RF channels must be enabled.
            rx.EnabledChannels = [1 2];
            rx.SamplesPerFrame = 2^16;

            cleanup = onCleanup(@() testCase.releaseAll(rx, tx)); %#ok<NASGU>

            % Digital loopback keeps the test off the air and independent of
            % antennas or cabling.
            rx.setDeviceAttributeRAW('loopback', '1');

            wThreshold = adsbRegister(testCase.uri, 'write', c.RegThreshold, 'int16');
            wEnable = adsbRegister(testCase.uri, 'write', c.RegEnable, 'boolean');
            rCRCPass = adsbRegister(testCase.uri, 'read', c.RegCRCPassCount, 'uint32');

            wThreshold(testCase.SyncThreshold);
            wEnable(true);

            crcBefore = double(rCRCPass());

            tx(wf);
            pause(0.5);

            % Give the detector a few buffers to land a frame.
            frames = zeros(0, c.FrameBits);
            for k = 1:10
                data = rx();

                % Check this before blaming the detector. The frame stream
                % rides fifo_wr_data_2/3, which the ADC packer only carries
                % when the second RF channel is active. If the deployed
                % image comes up single-channel, the frame channel does not
                % exist and every downstream check fails as though the
                % detector were broken.
                testCase.assertSize(data, [rx.SamplesPerFrame 2], ...
                    ['Receive buffer has no second channel -- the frame ' ...
                     'stream on IP Data 2/3 OUT is not reaching the DMA.']);

                % 'IP Data 2 OUT' is the I word of channel 2, so the frame
                % stream arrives as the real part.
                frames = [frames; extractADSBFrames(real(data(:,2)))]; %#ok<AGROW>
                if ~isempty(frames)
                    break
                end
            end

            testCase.verifyNotEmpty(frames, ...
                'Deployed ADS-B detector produced no frames from the loopback squitter');

            msgs = decodeADSBFrames(frames);
            testCase.verifyTrue(any([msgs.CRCValid]), ...
                'Recovered ADS-B frames all failed CRC');

            % The recovered bits must match what was transmitted exactly.
            matched = false;
            for k = 1:size(frames, 1)
                if isequal(double(frames(k,:) ~= 0), double(txBits ~= 0))
                    matched = true;
                    break
                end
            end
            testCase.verifyTrue(matched, ...
                'No recovered frame matched the transmitted squitter bit for bit');

            % The DUT's own counter must corroborate the DMA frame stream.
            crcAfter = double(rCRCPass());
            testCase.verifyGreaterThan(crcAfter, crcBefore, ...
                'DUT crc_pass_count did not increment');
        end
    end

    methods (Static)
        function releaseAll(rx, tx)
            try
                rx.setDeviceAttributeRAW('loopback', '0');
            catch
            end
            try
                rx.release();
            catch
            end
            try
                tx.release();
            catch
            end
        end
    end

end
