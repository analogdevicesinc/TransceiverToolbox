classdef IIOv1EmuTests < matlab.unittest.TestCase
    % IIOv1EmuTests Device classes on the libiio v1 bindings, without hardware
    %   Runs adi.AD9361.Rx/Tx, adi.Pluto.Rx/Tx, adi.FMComms5.Rx/Tx,
    %   adi.ADRV9009.Rx/ORx/Tx, adi.ADRV9009ZU11EG.Rx/Tx, adi.FMComms8.Rx/Tx,
    %   adi.AD9371.Rx/ORx/Tx, adi.ADRV9371.Rx/Tx and adi.ADRV9002.Rx/Tx
    %   against the emulation
    %   backend of libiio v1 ("emu:"), which builds a context from an XML
    %   file. Attribute writes stay in that context; receive data comes
    %   from the file <device name>_buf0.bin beside the XML file, and
    %   transmitted data is written to such a file.
    %
    %   Needs the package "iio" and its MEX file (libiio-conv/matlab) on
    %   the path. See test/runEmuTests.m and
    %   .github/workflows/libiio-v1.yml.
    %
    %   Boards (test/emu, copied from pyadi-iio test/emu/devices):
    %     pluto.xml        ADALM-Pluto, one receive and one transmit channel
    %     fmcomms2-3.xml   FMComms2/3, two receive and two transmit channels
    %     ad9081.xml       AD9081-FMCA-EBZ, for adi.common.JESD204 (through
    %                      test/IIOv1JESD204Device.m). Not as in pyadi-iio:
    %                      the debug attribute "status" of axi-ad9081-rx-hpc
    %                      was "ERROR" there and holds two link lines here.
    %     ad9371.xml       ADRV9371, for adi.AD9371.Rx/ORx/Tx and for
    %                      adi.ADRV9371.Rx/Tx, which are the AD9371 classes
    %                      under the name of the board: same devices
    %     adrv9002.xml     ADRV9002 with one DMA per direction, for
    %                      adi.ADRV9002.Rx/Tx
    %     adrv9002_splitdma.xml  ADRV9002 with one DMA per channel (devices
    %                      axi-adrv9002-rx2-lpc and axi-adrv9002-tx2-lpc) and
    %                      the older names of the LO attributes. The file of
    %                      that name in pyadi-iio starts with 1011 lines that
    %                      are not XML; this is the XML text that follows them.
    %     adrv9008-1.xml   ADRV9008-1 (receiver), for adi.ADRV9009.Rx
    %     adrv9008-2.xml   ADRV9008-2 (transmitter and observation receiver),
    %                      for adi.ADRV9009.Tx
    %     adrv9009.xml     Not from pyadi-iio, which has no context file of an
    %                      ADRV9009: adrv9008-2.xml with the two receivers of
    %                      adrv9008-1.xml added, see emu/make_adrv9009_xml.py.
    %                      For adi.ADRV9009.Rx/ORx/Tx; the ORx class needs the
    %                      receivers and the observation receiver in one
    %                      adrv9009-phy.
    %     adrv9009zu11eg.xml  Not from pyadi-iio, which has no context
    %                      file of an ADRV9009-ZU11EG: adrv9009.xml with a
    %                      second transceiver adrv9009-phy-b, four I/Q pairs
    %                      on axi-adrv9009-rx-hpc and on axi-adrv9009-tx-hpc,
    %                      and the DDS tones of the pairs 3 and 4, see
    %                      emu/make_adrv9009_dual_xml.py. For
    %                      adi.ADRV9009ZU11EG.Rx/Tx.
    %     fmcomms8.xml     Not from pyadi-iio either: the same with the
    %                      transceivers adrv9009-phy-c and adrv9009-phy-d,
    %                      the names adi.FMComms8.Rx/Tx look for.
    %     fmcomms5.xml     FMComms5 (two AD9361), for adi.FMComms5.Rx/Tx
    %
    %   The values that the tests expect of a device that was not written
    %   to are the values of these XML files.
    %
    %   Sampling rate (ad9361_set_bb_rate of libad9361-iio in M-code, see
    %   adi.AD9361.Base): the expected filter texts and the expected order
    %   of the reads and writes are the files of
    %   test/emu/ad9361_bb_rate/expected. They are the output of the C
    %   source of libad9361-iio on the same context files, see generate.sh
    %   there. The emulation keeps what is written to filter_fir_config
    %   and to the enable attribute of the filter. It does not apply the
    %   filter: the range of sampling_frequency stays the one of the XML
    %   file, and a rate outside of it is refused with or without filter.
    %
    %   Multichip sync of the FMComms5 (ad9361_fmcomms5_multichip_sync of
    %   libad9361-iio in M-code, see adi.FMComms5.Base): the expected order
    %   of the attribute and register accesses are the files of
    %   test/emu/ad9361_mcs/expected, the output of the C source of
    %   libad9361-iio on fmcomms5.xml, see generate.sh there. The emulation
    %   keeps what is written to multichip_sync and ensm_mode and has no
    %   register until one is written; it synchronises nothing.
    %
    %   Receive data file: 4096 I/Q pairs of int16, pair k (counted from 0)
    %   is I = k - 2048, Q = 2047 - k. The file is read again from its
    %   start when it ends. A frame must not be longer than the file.

    properties (Constant)
        RxDevice = 'cf-ad9361-lpc';
        TxDevice = 'cf-ad9361-dds-core-lpc';
        RampPairs = 4096;
    end

    properties (TestParameter)
        % class of the receiver, class of the transmitter, XML file
        board = struct( ...
            'Pluto', {{'adi.Pluto.Rx', 'adi.Pluto.Tx', 'pluto.xml'}}, ...
            'AD9361onPluto', {{'adi.AD9361.Rx', 'adi.AD9361.Tx', 'pluto.xml'}}, ...
            'AD9361onFMComms2', {{'adi.AD9361.Rx', 'adi.AD9361.Tx', 'fmcomms2-3.xml'}});
        % board and rates: the first rate is set before setup, the others
        % after it. <board>_<rate>[_<rate>].log is the expected log in
        % test/emu/ad9361_bb_rate/expected. plutowide is pluto.xml with
        % the range of sampling_frequency from 520833.
        bbRateCase = struct( ...
            'pluto_4000000_30000000', {{'pluto', [4000000 30000000]}}, ...
            'pluto_45000000_61440000', {{'pluto', [45000000 61440000]}}, ...
            'pluto_2083333_3000000', {{'pluto', [2083333 3000000]}}, ...
            'pluto_1000000', {{'pluto', 1000000}}, ...
            'fmcomms2_1500000_25000000', {{'fmcomms2', [1500000 25000000]}}, ...
            'plutowide_520833_1000000', {{'plutowide', [520833 1000000]}});
        % class of the receiver, XML file, device that streams, number of
        % I/Q pairs of that device
        receiver = struct( ...
            'ADRV9009RxOnADRV9008_1', {{'adi.ADRV9009.Rx', 'adrv9008-1.xml', 'axi-adrv9009-rx-hpc', 2}}, ...
            'ADRV9009Rx', {{'adi.ADRV9009.Rx', 'adrv9009.xml', 'axi-adrv9009-rx-hpc', 2}}, ...
            'ADRV9009ORx', {{'adi.ADRV9009.ORx', 'adrv9009.xml', 'axi-adrv9009-rx-obs-hpc', 1}}, ...
            'AD9371Rx', {{'adi.AD9371.Rx', 'ad9371.xml', 'axi-ad9371-rx-hpc', 2}}, ...
            'AD9371ORx', {{'adi.AD9371.ORx', 'ad9371.xml', 'axi-ad9371-rx-obs-hpc', 1}}, ...
            'ADRV9002Rx', {{'adi.ADRV9002.Rx', 'adrv9002.xml', 'axi-adrv9002-rx-lpc', 2}}, ...
            'ADRV9002RxSplitDMA', {{'adi.ADRV9002.Rx', 'adrv9002_splitdma.xml', 'axi-adrv9002-rx-lpc', 1}}, ...
            'FMComms5Rx', {{'adi.FMComms5.Rx', 'fmcomms5.xml', 'cf-ad9361-A', 4}}, ...
            'ADRV9009ZU11EGRx', {{'adi.ADRV9009ZU11EG.Rx', 'adrv9009zu11eg.xml', 'axi-adrv9009-rx-hpc', 4}}, ...
            'FMComms8Rx', {{'adi.FMComms8.Rx', 'fmcomms8.xml', 'axi-adrv9009-rx-hpc', 4}}, ...
            'ADRV9371Rx', {{'adi.ADRV9371.Rx', 'ad9371.xml', 'axi-ad9371-rx-hpc', 2}});
        % class of the transmitter, XML file, device that streams, number
        % of I/Q pairs of that device that one frame can hold. That is 1
        % for adi.ADRV9009ZU11EG.Tx and adi.FMComms8.Tx, whose device has
        % four: they take no frame for more than one pair, see
        % dualADRV9009TxSeveralChannels.
        transmitter = struct( ...
            'ADRV9009TxOnADRV9008_2', {{'adi.ADRV9009.Tx', 'adrv9008-2.xml', 'axi-adrv9009-tx-hpc', 2}}, ...
            'ADRV9009Tx', {{'adi.ADRV9009.Tx', 'adrv9009.xml', 'axi-adrv9009-tx-hpc', 2}}, ...
            'AD9371Tx', {{'adi.AD9371.Tx', 'ad9371.xml', 'axi-ad9371-tx-hpc', 2}}, ...
            'ADRV9002Tx', {{'adi.ADRV9002.Tx', 'adrv9002.xml', 'axi-adrv9002-tx-lpc', 2}}, ...
            'ADRV9002TxSplitDMA', {{'adi.ADRV9002.Tx', 'adrv9002_splitdma.xml', 'axi-adrv9002-tx-lpc', 1}}, ...
            'FMComms5Tx', {{'adi.FMComms5.Tx', 'fmcomms5.xml', 'cf-ad9361-dds-core-lpc', 4}}, ...
            'ADRV9009ZU11EGTx', {{'adi.ADRV9009ZU11EG.Tx', 'adrv9009zu11eg.xml', 'axi-adrv9009-tx-hpc', 1}}, ...
            'FMComms8Tx', {{'adi.FMComms8.Tx', 'fmcomms8.xml', 'axi-adrv9009-tx-hpc', 1}}, ...
            'ADRV9371Tx', {{'adi.ADRV9371.Tx', 'ad9371.xml', 'axi-ad9371-tx-hpc', 2}});
        adrv9009RxFile = struct('adrv9008_1', 'adrv9008-1.xml', 'adrv9009', 'adrv9009.xml');
        adrv9009TxFile = struct('adrv9008_2', 'adrv9008-2.xml', 'adrv9009', 'adrv9009.xml');
        % package of the classes for two ADRV9009, XML file, name of the
        % first and of the second transceiver device, and whether setup
        % writes calibrate_fhm_en (the classes write it only under the
        % name adi.ADRV9009ZU11EG)
        dualBoard = struct( ...
            'ADRV9009ZU11EG', {{'adi.ADRV9009ZU11EG', 'adrv9009zu11eg.xml', 'adrv9009-phy', 'adrv9009-phy-b', true}}, ...
            'FMComms8', {{'adi.FMComms8', 'fmcomms8.xml', 'adrv9009-phy-c', 'adrv9009-phy-d', false}});
        % package of the classes that run on ad9371.xml
        ad9371Package = struct('AD9371', 'adi.AD9371', 'ADRV9371', 'adi.ADRV9371');
        % board, flags, sampling rate of ad9361-phy-B before the call (0:
        % as in the file). <board>_f<flags>_r<rate>.log is the expected log
        % in test/emu/ad9361_mcs/expected. fmcomms5debug is fmcomms5.xml
        % without the device attribute multichip_sync.
        mcsCase = struct( ...
            'fmcomms5_f3_r0', {{'fmcomms5', 3, 0}}, ...
            'fmcomms5_f3_r3000000', {{'fmcomms5', 3, 3000000}}, ...
            'fmcomms5_f2_r3000000', {{'fmcomms5', 2, 3000000}}, ...
            'fmcomms5_f1_r3000000', {{'fmcomms5', 1, 3000000}}, ...
            'fmcomms5_f0_r0', {{'fmcomms5', 0, 0}}, ...
            'fmcomms5debug_f3_r0', {{'fmcomms5debug', 3, 0}});
    end

    properties
        Folder = '';    % temporary folder of the running test
    end

    methods (TestClassSetup)
        function checkBindings(testCase)
            % A missing MEX file must fail the tests, not filter them
            testCase.assertEqual(exist('iio_mex', 'file'), 3, ...
                'iio_mex is not a MEX file on the path: build libiio-conv/matlab and add it.');
            testCase.assertTrue(iio.has_backend('emu'), ...
                'libiio was built without the emu backend.');
        end
    end

    methods (TestMethodSetup)
        function makeFolder(testCase)
            import matlab.unittest.fixtures.TemporaryFolderFixture
            f = testCase.applyFixture(TemporaryFolderFixture);
            testCase.Folder = f.Folder;
        end
    end

    methods (TestMethodTeardown)
        function checkNoHandleIsLeft(testCase)
            n = iio.internal.handle_count();
            iio.internal.shutdown();    % the next test starts clean
            testCase.verifyEqual(n, 0, 'libiio objects were left behind');
        end
    end

    methods
        function uri = emuUri(testCase, xmlName, wideRates, rxDevice)
            % Copy the XML file into the temporary folder, write the
            % receive data file of rxDevice (RxDevice when not given)
            % beside it, return the URI. With wideRates the copy has the
            % range of sampling_frequency that the driver reports while a
            % filter that decimates by 4 is enabled: from 520833 instead
            % of 2083333.
            if nargin >= 3 && wideRates
                uri = testCase.emuContext(xmlName, '[2083333 1 61440000]', '[520833 1 61440000]');
            else
                uri = testCase.emuContext(xmlName, '', '');
            end
            if nargin < 4
                rxDevice = testCase.RxDevice;
            end
            testCase.writeRamp(rxDevice, 0);
        end

        function uri = fmcomms5FilterOffUri(testCase, rxDevice)
            % As emuUri for fmcomms5.xml, with the FIR filter disabled on
            % both AD9361: the file has every enable attribute of the
            % filter at 1, where a test could not see that it was enabled.
            uri = testCase.emuContext('fmcomms5.xml', ...
                'filter_fir_en" value="1"', 'filter_fir_en" value="0"');
            testCase.writeRamp(rxDevice, 0);
        end

        function uri = emuContext(testCase, xmlName, old, new)
            % Copy the XML file into the temporary folder and return the
            % URI. With old not empty every occurrence of that text is
            % new in the copy, and the file must have one.
            src = fullfile(fileparts(mfilename('fullpath')), 'emu', xmlName);
            testCase.assertTrue(isfile(src), ['Missing ' src]);
            dst = fullfile(testCase.Folder, xmlName);
            if isempty(old)
                copyfile(src, dst);
            else
                text = fileread(src);
                testCase.assertTrue(contains(text, old), [xmlName ' has no ' old]);
                fid = fopen(dst, 'w');
                testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot write ' dst]);
                fwrite(fid, strrep(text, old, new), 'char*1');
                fclose(fid);
            end
            uri = ['emu:' dst];
        end

        function writeRamp(testCase, device, first)
            % Receive data file of a device in the temporary folder: the
            % 4096 pairs first, first + 1, ... of the ramp (see ramp)
            k = mod(first + (0:testCase.RampPairs - 1), testCase.RampPairs);
            words = zeros(1, 2 * testCase.RampPairs, 'int16');
            words(1:2:end) = k - 2048;
            words(2:2:end) = 2047 - k;
            name = fullfile(testCase.Folder, [device '_buf0.bin']);
            fid = fopen(name, 'w');
            testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot write ' name]);
            n = fwrite(fid, words, 'int16', 0, 'ieee-le');
            fclose(fid);
            testCase.assertEqual(n, numel(words));
        end

        function v = sentWords(testCase, device)
            % int16 column: what the transmit device (TxDevice when not
            % given) received last
            if nargin < 2
                device = testCase.TxDevice;
            end
            name = fullfile(testCase.Folder, [device '_buf0.bin']);
            fid = fopen(name, 'r');
            testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot read ' name]);
            v = fread(fid, Inf, 'int16=>int16', 0, 'ieee-le');
            fclose(fid);
            v = v(:);
        end
    end

    methods (Static)
        function text = bbRateExpected(name)
            % Content of a file of test/emu/ad9361_bb_rate/expected
            name = fullfile(fileparts(mfilename('fullpath')), 'emu', 'ad9361_bb_rate', 'expected', name);
            assert(isfile(name), 'IIOv1EmuTests:noExpectedFile', 'Missing %s', name);
            text = fileread(name);
        end

        function text = mcsExpected(name)
            % Content of a file of test/emu/ad9361_mcs/expected
            name = fullfile(fileparts(mfilename('fullpath')), 'emu', 'ad9361_mcs', 'expected', name);
            assert(isfile(name), 'IIOv1EmuTests:noExpectedFile', 'Missing %s', name);
            text = fileread(name);
        end

        function w = interleaved(a)
            % int16 column: the words a device receives for the complex
            % frame a, I then Q of each column, sample after sample
            w = zeros(2 * size(a, 2), size(a, 1), 'int16');
            w(1:2:end, :) = real(a).';
            w(2:2:end, :) = imag(a).';
            w = w(:);
        end

        function d = ramp(k)
            % Complex double column: the pairs k (counted from 0, taken
            % modulo the length of the file) of the receive data file
            k = mod(k(:), IIOv1EmuTests.RampPairs);
            d = complex(k - 2048, 2047 - k);
        end

        function a = txFrame(add)
            % 256-by-1 complex int16: I = 100 + add + (0:255), Q = -(100 + (0:255))
            n = (0:255).';
            a = complex(int16(100 + add + n), int16(-(100 + n)));
        end
    end

    methods (Test)

        function rxOutput(testCase, board)
            % Class, size, complexity, valid flag and values of the frames
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            for f = 0:5     % frame 4 starts again at the beginning of the file
                [d, v] = rx();
                msg = sprintf('frame %d', f);
                testCase.verifyClass(v, 'logical', msg);
                testCase.verifyEqual(v, true, msg);
                testCase.verifyClass(d, 'double', msg);
                testCase.verifySize(d, [1024 1], msg);
                testCase.verifyFalse(isreal(d), msg);
                testCase.verifyEqual(d, testCase.ramp(f * 1024 + (0:1023)), msg);
                if f == 0 || f == 4     % the start of the file, as literal values
                    testCase.verifyEqual(d(1:2), complex([-2048; -2047], [2047; 2046]), msg);
                end
            end
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function rxFrameThatWraps(testCase, board)
            % 1000 rows: frame 4 holds the pairs 4000 to 4095, then 0 to 903
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1000;
            for f = 0:3
                [~, v] = rx();
                testCase.verifyEqual(v, true, sprintf('frame %d', f));
            end
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1000 1]);
            testCase.verifyEqual(d, testCase.ramp(4000 + (0:999)));
            testCase.verifyEqual(d(96:97), complex([2047; -2048], [-2048; 2047]));
            rx.release();
        end

        function rxAttributesAtSetup(testCase, board)
            % What setup writes is read back from the same context
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx.CenterFrequency = 2.41e9;
            rx.SamplingRate = 4e6;
            rx.RFBandwidth = 2e6;
            rx.GainControlModeChannel0 = 'manual';
            rx.GainChannel0 = 33;
            rx.EnableQuadratureTracking = false;
            rx.EnableRFDCTracking = true;
            rx.EnableBasebandDCTracking = false;
            rx.RFPortSelect = 'B_BALANCED';
            rx.LoopbackMode = 1;
            [~, v] = rx();
            testCase.verifyEqual(v, true);
            f = rx.getAttributeLongLong('altvoltage0', 'frequency', true);
            testCase.verifyClass(f, 'int64');
            testCase.verifyEqual(f, int64(2410000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(4000000));
            % setup does not write the bandwidth: the 18 MHz of the XML file
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 33);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'rf_dc_offset_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'bb_dc_offset_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false), 'B_BALANCED');
            testCase.verifyEqual(rx.getDebugAttributeLongLong('loopback'), int64(1));
            testCase.verifyEqual(rx.SamplingRate, 4e6);
            rx.release();
        end

        function rxTunableProperties(testCase, board)
            % A property changed after setup is written at once
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx.GainControlModeChannel0 = 'manual';
            rx();
            rx.CenterFrequency = 2.45e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2450000000));
            rx.RFBandwidth = 5e6;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(5000000));
            rx.SamplingRate = 5e6;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(5000000));
            testCase.verifyEqual(rx.SamplingRate, 5e6);
            rx.GainChannel0 = 20;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 20);
            rx.GainControlModeChannel0 = 'fast_attack';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'fast_attack');
            rx.RFPortSelect = 'C_BALANCED';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false), 'C_BALANCED');
            % the data path is not disturbed: this is the second frame
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(1024 + (0:1023)));
            rx.release();
        end

        function rxReleaseAndSetupAgain(testCase, board)
            % release closes everything; the next step connects again and
            % reads the file from its start
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            d = rx();
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            rx.SamplesPerFrame = 256;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [256 1]);
            testCase.verifyEqual(d, testCase.ramp(0:255));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyWarningFree(@() rx.release());
        end

        function rxDeleteReleases(testCase, board)
            % An object that goes away while it is set up leaves nothing
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx();
            testCase.verifyGreaterThan(iio.internal.handle_count(), 0);
            delete(rx);
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function rxTwoChannels(testCase)
            % Two I/Q pairs: sample s holds pair 2s for channel 1 and
            % pair 2s + 1 for channel 2
            rx = adi.AD9361.Rx('uri', testCase.emuUri('fmcomms2-3.xml'));
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2];
            rx.GainControlModeChannel1 = 'manual';
            rx.GainChannel1 = 21;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyClass(d, 'double');
            testCase.verifySize(d, [1024 2]);
            testCase.verifyFalse(isreal(d));
            s = 0:1023;
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * s));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * s + 1));
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 21);
            rx.release();
        end

        function rxSecondChannelOnly(testCase)
            % EnabledChannels = 2 opens voltage2 and voltage3 alone: one column
            rx = adi.AD9361.Rx('uri', testCase.emuUri('fmcomms2-3.xml'));
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = 2;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 1]);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            rx.release();
        end

        function rxChannelTheBoardDoesNotHave(testCase)
            % The Pluto has one receive channel. Setup fails, the error
            % names the channel, and the context is released.
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2];
            testCase.verifyError(@() rx(), 'adi:iio:status');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyWarningFree(@() rx.release());
        end

        function rxValueTheDeviceRefuses(testCase)
            % 5 GHz passes the check of adi.AD9361.Rx, and the Pluto
            % (AD9363) refuses it. After setup that is an error which
            % releases the hardware.
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx();
            testCase.verifyError(@() setProperty(rx, 'CenterFrequency', 5e9), 'adi:iio:status');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyError(@() rx(), 'adi:iio:notConnected');
            rx.release();
            % and the object works again
            rx.CenterFrequency = 2.4e9;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            rx.release();
        end

        function rxEarlierFailureIsNotBlamed(testCase)
            % A failed write whose status the caller ignores (as
            % adi.common.DDS does) must not appear in the error of a
            % later, unrelated failure
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx();
            phy = rx.getIIODevice('ad9361-phy');
            lo = rx.iio_device_find_channel(phy, 'altvoltage0', true);
            testCase.assertNotEmpty(lo);
            % the Pluto (AD9363) refuses 5 GHz
            status = rx.iio_channel_attr_write_longlong(lo, 'frequency', 5e9);
            testCase.verifyEqual(status, -22);
            err = caught(@() rx.getChan(phy, 'voltage9', false));
            testCase.assertNotEmpty(err, 'voltage9 was found.');
            testCase.verifyEqual(err.identifier, 'adi:iio:status');
            testCase.verifyEqual(err.message, 'Failed to find channel: voltage9 (status -19)');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            rx.release();
        end

        function rxRefusedValueIsNamed(testCase)
            % The error of a refused write names the attribute and
            % carries the message of the bindings
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx();
            err = caught(@() setProperty(rx, 'CenterFrequency', 5e9));
            testCase.assertNotEmpty(err, '5 GHz was accepted.');
            testCase.verifyEqual(err.identifier, 'adi:iio:status');
            testCase.verifySubstring(err.message, 'status -22; last libiio error, write of frequency: ');
            rx.release();
        end

        function deviceEnumeration(testCase)
            % The helpers of adi.common.DeviceAttribute: counts, and
            % devices and attribute names by position (counted from 0),
            % in the order of libiio
            want = {'pluto.xml', 4, 'ad9361-phy'; 'fmcomms2-3.xml', 8, 'ad7291'};
            for k = 1:size(want, 1)
                msg = want{k, 1};
                rx = adi.AD9361.Rx('uri', testCase.emuUri(want{k, 1}));
                rx.SamplesPerFrame = 1024;
                rx();
                phy = rx.getIIODevice('ad9361-phy');
                ctx = phy.context;
                n = rx.iio_context_get_devices_count(ctx);
                testCase.verifyEqual(n, want{k, 2}, msg);
                first = rx.iio_context_get_device(ctx, 0);
                testCase.verifyClass(first, 'iio.Device', msg);
                testCase.verifyEqual(rx.iio_device_get_name(first), want{k, 3}, msg);
                last = rx.iio_context_get_device(ctx, n - 1);
                testCase.verifyClass(last, 'iio.Device', msg);
                testCase.verifyEqual(rx.iio_device_get_name(phy), 'ad9361-phy', msg);
                testCase.verifyEqual(rx.iio_device_get_attrs_count(phy), 18, msg);
                testCase.verifyEqual(rx.iio_device_get_attr(phy, 0), 'calib_mode', msg);
                testCase.verifyClass(rx.iio_device_get_attr(phy, 17), 'char', msg);
                % a position past the end is an error that releases
                err = caught(@() rx.iio_context_get_device(ctx, n));
                testCase.assertNotEmpty(err, [msg ': a device past the end was returned.']);
                testCase.verifySubstring(err.message, sprintf('Failed to find device with index: %d', n), msg);
                testCase.verifyEqual(iio.internal.handle_count(), 0, msg);
                rx.release();
            end
        end

        function noSuchContext(testCase)
            % An XML file that does not exist: the error of the bindings.
            % The emu backend of the pinned libiio answers -EINVAL.
            rx = adi.AD9361.Rx('uri', ['emu:' fullfile(testCase.Folder, 'none.xml')]);
            testCase.verifyError(@() rx(), 'iio:EINVAL');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txComplexInt16(testCase, board)
            % The device receives I and Q of each sample in turn
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            a = testCase.txFrame(0);
            v = tx(a);
            testCase.verifyClass(v, 'logical');
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(tx.SamplesPerFrame, 256);
            tx.release();   % sends what is queued
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            got = testCase.sentWords();
            testCase.verifySize(got, [512 1]);
            testCase.verifyEqual(got, reshape([real(a) imag(a)].', [], 1));
            testCase.verifyEqual(got(1:4), int16([100; -100; 101; -101]));
        end

        function txLastFrame(testCase, board)
            % Several frames: the emulated device keeps the last one
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            for f = 0:3
                testCase.verifyEqual(tx(testCase.txFrame(1000 * f)), true, sprintf('frame %d', f));
            end
            tx.release();
            b = testCase.txFrame(3000);
            testCase.verifyEqual(testCase.sentWords(), reshape([real(b) imag(b)].', [], 1));
        end

        function txDouble(testCase, board)
            % Floating-point input is rounded to the nearest integer (a
            % half to the even one) and saturates at the limits of int16.
            % The M-code data path rounded a half away from zero.
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            v = tx(complex([0.4 0.5 1.5 2.5 -0.5 -1.5 40000 -40000 1000].', ...
                [-0.4 7 -7 0 0 0 -40000 40000 -1000].'));
            testCase.verifyEqual(v, true);
            tx.release();
            got = testCase.sentWords();
            testCase.verifySize(got, [18 1]);
            testCase.verifyEqual(got(1:2:end), int16([0 0 2 2 0 -2 32767 -32768 1000]).');
            testCase.verifyEqual(got(2:2:end), int16([0 7 -7 0 0 0 -32768 32767 -1000]).');
        end

        function txRealInput(testCase, board)
            % Real input to a complex device: Q is 0
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            v = tx(int16((1:256).'));
            testCase.verifyEqual(v, true);
            tx.release();
            got = testCase.sentWords();
            testCase.verifySize(got, [512 1]);
            testCase.verifyEqual(got(1:2:end), int16((1:256).'));
            testCase.verifyEqual(got(2:2:end), zeros(256, 1, 'int16'));
        end

        function txWrongNumberOfColumns(testCase, board)
            % One channel is enabled: two columns are refused by the
            % check in adi.common.Tx, which names the size it wants
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            err = caught(@() tx(complex(zeros(256, 2), ones(256, 2))));
            testCase.assertNotEmpty(err, 'Two columns were accepted.');
            testCase.verifySubstring(err.message, 'Data size must [Nx1]');
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % and one column is accepted by the same object
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txAttributesAtSetup(testCase, board)
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.CenterFrequency = 2.42e9;
            tx.SamplingRate = 4e6;
            tx.RFBandwidth = 2e6;
            tx.AttenuationChannel0 = -12.5;
            tx.RFPortSelect = 'B';
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            dds = tx.getIIODevice(testCase.TxDevice);
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2420000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(4000000));
            % setup does not write the bandwidth: the 18 MHz of the XML file
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.5);
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true), 'B');
            % the host is the data source: the DDS is off
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % tunable after setup
            tx.AttenuationChannel0 = -20.25;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -20.25);
            tx.CenterFrequency = 2.43e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2430000000));
            tx.RFBandwidth = 5e6;
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(5000000));
            % the bandwidth of the receiver is another attribute
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            tx.release();
        end

        function txCyclic(testCase, board)
            % The first frame repeats; a second frame is an error
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.EnableCyclicBuffers = true;
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            testCase.verifyError(@() tx(testCase.txFrame(0)), 'iio:EBUSY');
            testCase.verifyWarningFree(@() tx.release());
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txDDS(testCase, board)
            % DataSource 'DDS': no input, no buffer, the tone attributes
            % are written at setup and when a DDS property changes
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.DataSource = 'DDS';
            tx.DDSFrequencies = [1e6, 2e6; 3e6, 4e6];
            tx.DDSScales = [0.5, 0.25; 0, 0.125];
            tx.DDSPhases = [90000, 0; 0, 45000];
            testCase.verifyEqual(tx(), true);
            dds = tx.getIIODevice(testCase.TxDevice);
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), true);
            % altvoltage0 and 1 are the two tones of column 1, 2 and 3 of column 2
            want = {'altvoltage0', 1e6, 0.5, 90000; 'altvoltage1', 3e6, 0, 0; ...
                'altvoltage2', 2e6, 0.25, 0; 'altvoltage3', 4e6, 0.125, 45000};
            for k = 1:size(want, 1)
                id = want{k, 1};
                testCase.verifyEqual(tx.getAttributeDouble(id, 'frequency', true, dds), want{k, 2}, id);
                testCase.verifyEqual(tx.getAttributeDouble(id, 'scale', true, dds), want{k, 3}, id);
                testCase.verifyEqual(tx.getAttributeDouble(id, 'phase', true, dds), want{k, 4}, id);
            end
            tx.DDSFrequencies = [5e5, 2e6; 3e6, 4e6];
            testCase.verifyEqual(tx.getAttributeDouble('altvoltage0', 'frequency', true, dds), 5e5);
            testCase.verifyEqual(tx(), true);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % nothing was transmitted from the host
            testCase.verifyFalse(isfile(fullfile(testCase.Folder, [testCase.TxDevice '_buf0.bin'])));
        end

        function txTwoChannels(testCase)
            % Two columns: the device receives I1, Q1, I2, Q2 of each sample
            tx = adi.AD9361.Tx('uri', testCase.emuUri('fmcomms2-3.xml'));
            tx.EnabledChannels = [1 2];
            tx.AttenuationChannel1 = -5;
            a = [testCase.txFrame(0), testCase.txFrame(2000)];
            testCase.verifyEqual(tx(a), true);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -5);
            tx.release();
            got = testCase.sentWords();
            testCase.verifySize(got, [1024 1]);
            testCase.verifyEqual(got, reshape([real(a(:, 1)) imag(a(:, 1)) real(a(:, 2)) imag(a(:, 2))].', [], 1));
            testCase.verifyEqual(got(1:4), int16([100; -100; 2100; -100]));
        end

        function rxAndTxTogether(testCase, board)
            % A receiver and a transmitter on the same URI: two contexts
            uri = testCase.emuUri(board{3});
            rx = feval(board{1}, 'uri', uri);
            rx.SamplesPerFrame = 1024;
            tx = feval(board{2}, 'uri', uri);
            a = testCase.txFrame(0);
            for f = 0:2
                msg = sprintf('step %d', f);
                [d, v] = rx();
                testCase.verifyEqual(v, true, msg);
                testCase.verifyEqual(d, testCase.ramp(f * 1024 + (0:1023)), msg);
                testCase.verifyEqual(tx(a), true, msg);
            end
            rx.release();
            testCase.verifyGreaterThan(iio.internal.handle_count(), 0);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords(), reshape([real(a) imag(a)].', [], 1));
        end

        function rxSkipInit(testCase, board)
            % SkipInit: setup writes no attribute, the device keeps the
            % values of the XML file. A property that changes after setup
            % is written.
            if strcmp(board{3}, 'pluto.xml')
                lo = int64(2400000000);
            else
                lo = int64(2300000000);
            end
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx.SkipInit = true;
            rx.CenterFrequency = 2.41e9;
            rx.SamplingRate = 4e6;
            rx.RFBandwidth = 2e6;
            rx.GainControlModeChannel0 = 'manual';
            rx.EnableQuadratureTracking = false;
            rx.RFPortSelect = 'B_BALANCED';
            rx.LoopbackMode = 1;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), lo);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', false), int64(30720000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'slow_attack');
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false), 'A_BALANCED');
            testCase.verifyEqual(rx.getDebugAttributeLongLong('loopback'), int64(0));
            rx.CenterFrequency = 2.46e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2460000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txSkipInit(testCase, board)
            % SkipInit: setup writes no attribute, and the frame is sent
            if strcmp(board{3}, 'pluto.xml')
                lo = int64(2450000000);
            else
                lo = int64(2300000000);
            end
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.SkipInit = true;
            tx.CenterFrequency = 2.42e9;
            tx.SamplingRate = 4e6;
            tx.RFBandwidth = 2e6;
            tx.AttenuationChannel0 = -12.5;
            tx.RFPortSelect = 'B';
            a = testCase.txFrame(0);
            testCase.verifyEqual(tx(a), true);
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), lo);
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -10);
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true), 'A');
            tx.AttenuationChannel0 = -20.25;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -20.25);
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), lo);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords(), reshape([real(a) imag(a)].', [], 1));
        end

        function deviceAttributeLongLong(testCase)
            % setDeviceAttributeLongLong of adi.common.Attribute. The Pluto
            % has xo_correction = 40000159, in the range [39992159 1 40008159].
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx();
            phy = rx.getIIODevice('ad9361-phy');
            v = rx.getDeviceAttributeLongLong('xo_correction');
            testCase.verifyClass(v, 'int64');
            testCase.verifyEqual(v, int64(40000159));
            % written and read back
            rx.setDeviceAttributeLongLong('xo_correction', 40000200);
            testCase.verifyEqual(rx.getDeviceAttributeLongLong('xo_correction'), int64(40000200));
            % written, not read back
            rx.setDeviceAttributeLongLong('xo_correction', 40000100, phy, false);
            testCase.verifyEqual(rx.getDeviceAttributeLongLong('xo_correction', phy), int64(40000100));
            % Without the read back nothing is read: calib_mode_available
            % refuses the write and is not a number, and neither is an error
            rx.setDeviceAttributeLongLong('calib_mode_available', 1, phy, false);
            testCase.verifyGreaterThan(iio.internal.handle_count(), 0);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calib_mode_available', 128), ...
                'auto manual manual_tx_quad tx_quad rf_dc_offs rssi_gain_step');
            % With the read back the same call is an error of the read
            err = caught(@() rx.setDeviceAttributeLongLong('calib_mode_available', 1, phy, true));
            testCase.assertNotEmpty(err, 'calib_mode_available was read as a number.');
            testCase.verifyEqual(err.identifier, 'adi:iio:status');
            testCase.verifySubstring(err.message, 'Error reading attribute: calib_mode_available (status -22; ');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            rx.release();
            % A value out of range is refused; the read back finds the
            % value of the XML file and names both
            rx();
            err = caught(@() rx.setDeviceAttributeLongLong('xo_correction', 1));
            testCase.assertNotEmpty(err, 'xo_correction = 1 was accepted.');
            testCase.verifyEqual(err.identifier, 'adi:iio:status');
            testCase.verifySubstring(err.message, 'Attribute xo_correction return value 40000159, expected 1 (status -1; ');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            rx.release();
        end

        function debugAttributeRAW(testCase)
            % getDebugAttributeRAW of adi.common.DebugAttribute: the text
            % of a debug attribute, an error for one that does not exist
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx();
            v = rx.getDebugAttributeRAW('adi,frequency-division-duplex-mode-enable');
            testCase.verifyClass(v, 'char');
            testCase.verifyEqual(v, '1');
            phy = rx.getIIODevice('ad9361-phy');
            testCase.verifyEqual(rx.getDebugAttributeRAW('loopback', phy), '0');
            rx.setDebugAttributeRAW('loopback', '2');
            testCase.verifyEqual(rx.getDebugAttributeRAW('loopback'), '2');
            err = caught(@() rx.getDebugAttributeRAW('no_such_attribute'));
            testCase.assertNotEmpty(err, 'no_such_attribute was read.');
            testCase.verifyEqual(err.identifier, 'adi:iio:status');
            testCase.verifyEqual(err.message, 'Attribute read failed for : no_such_attribute (status -1)');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            rx.release();
        end

        function bbRateFIRText(testCase)
            % The text for filter_fir_config, at both ends of each range
            % of rates: equal to what the C source writes. The decimation
            % and the number of taps are read from the expected text.
            rates = [520833 2083333 4000000 20000000 20000001 40000000 40000001 53333333 53333334 61440000];
            sizes = zeros(numel(rates), 2);
            for k = 1:numel(rates)
                msg = sprintf('rate %d', rates(k));
                want = testCase.bbRateExpected(sprintf('fir_%d.txt', rates(k)));
                [text, factor, taps] = adi.AD9361.Base.bbRateFIRConfig(rates(k));
                testCase.verifyClass(text, 'char', msg);
                testCase.verifyEqual(text, want, msg);
                lines = regexp(want, '\n', 'split');
                testCase.verifyEqual(lines{1}, sprintf('RX 3 GAIN -6 DEC %d', factor), msg);
                testCase.verifyEqual(lines{2}, sprintf('TX 3 GAIN 0 INT %d', factor), msg);
                testCase.verifyEqual(taps, nnz(contains(lines, ',')), msg);
                sizes(k, :) = [factor taps];
            end
            % the four filters, as the ranges of ad9361_set_bb_rate name them
            testCase.verifyEqual(sizes, ...
                [4 128; 4 128; 4 128; 4 128; 2 128; 2 128; 2 96; 2 96; 2 64; 2 64]);
        end

        function bbRateSequence(testCase, bbRateCase)
            % The reads and writes of each sampling rate, in order and
            % with their results, are those of ad9361_set_bb_rate of
            % libad9361-iio on the same context. A rate is an error
            % exactly when the C function returns an error.
            rates = bbRateCase{2};
            want = testCase.bbRateExpected([bbRateCase{1} sprintf('_%d', rates) '.log']);
            ret = str2double(regexp(want, '(?<=^RET )-?\d+', 'match', 'lineanchors'));
            testCase.assertNumElements(ret, numel(rates));
            if strcmp(bbRateCase{1}, 'fmcomms2')
                uri = testCase.emuUri('fmcomms2-3.xml');
            else
                uri = testCase.emuUri('pluto.xml', strcmp(bbRateCase{1}, 'plutowide'));
            end
            rx = IIOv1BBRateRecorder('uri', uri);
            rx.SamplesPerFrame = 1024;
            rx.SamplingRate = rates(1);
            for k = 1:numel(rates)
                msg = sprintf('rate %d', rates(k));
                if k == 1
                    err = caught(@() rx());
                else
                    err = caught(@() setProperty(rx, 'SamplingRate', rates(k)));
                end
                if ret(k) == 0
                    if ~isempty(err)
                        msg = [msg ': ' err.message]; %#ok<AGROW>
                    end
                    testCase.assertEmpty(err, msg);
                    testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(rates(k)), msg);
                    testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false), true, msg);
                    testCase.verifyEqual(rx.SamplingRate, rates(k), msg);
                else
                    testCase.assertNotEmpty(err, [msg ' was accepted.']);
                    testCase.verifyEqual(err.identifier, 'adi:iio:status', msg);
                    testCase.verifySubstring(err.message, sprintf( ...
                        'ad9361_set_bb_rate failed for a sampling rate of %d (status %d; ', rates(k), ret(k)), msg);
                    testCase.verifyEqual(iio.internal.handle_count(), 0, msg);
                end
            end
            testCase.verifyEqual(sprintf('%s\n', rx.Log{:}), want);
            rx.release();
        end

        function rxSamplingRateLoadsFIR(testCase, board)
            % The rate at setup and each later rate load the filter of
            % their range and enable it
            if any(strcmp(superclasses(board{1}), 'adi.AD9363.Rx'))
                rates = [4000000 20000000 2083333];     % the AD9363 classes accept up to 20e6
            else
                rates = [4000000 20000001 40000001 53333334 61440000 2083333];
            end
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx.SamplingRate = rates(1);
            rx.RFBandwidth = 2e6;
            [~, v] = rx();
            testCase.verifyEqual(v, true);
            % not written by setup: the value of the XML file
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            for k = 1:numel(rates)
                msg = sprintf('rate %d', rates(k));
                if k > 1
                    rx.SamplingRate = rates(k);
                end
                testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), ...
                    testCase.bbRateExpected(sprintf('fir_%d.txt', rates(k))), msg);
                testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false), true, msg);
                testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(rates(k)), msg);
                testCase.verifyEqual(rx.SamplingRate, rates(k), msg);
            end
            % the data path is not disturbed: this is the second frame
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(1024 + (0:1023)));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txSamplingRateLoadsFIR(testCase, board)
            % As rxSamplingRateLoadsFIR, for the transmitter
            if any(strcmp(superclasses(board{2}), 'adi.AD9363.Tx'))
                rates = [4000000 20000000 2083333];
            else
                rates = [4000000 20000001 40000001 53333334 61440000 2083333];
            end
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.SamplingRate = rates(1);
            tx.RFBandwidth = 2e6;
            a = testCase.txFrame(0);
            testCase.verifyEqual(tx(a), true);
            % not written by setup: the value of the XML file
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            for k = 1:numel(rates)
                msg = sprintf('rate %d', rates(k));
                if k > 1
                    tx.SamplingRate = rates(k);
                end
                testCase.verifyEqual(tx.getDeviceAttributeRAW('filter_fir_config', 8192), ...
                    testCase.bbRateExpected(sprintf('fir_%d.txt', rates(k))), msg);
                testCase.verifyEqual(tx.getAttributeBool('out', 'voltage_filter_fir_en', false), true, msg);
                testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(rates(k)), msg);
                testCase.verifyEqual(tx.SamplingRate, rates(k), msg);
            end
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords(), reshape([real(a) imag(a)].', [], 1));
        end

        function bbRateAfterSkipInit(testCase)
            % SkipInit: setup loads no filter (the Pluto file has none and
            % the filter off); a rate set after setup loads and enables it
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx.SkipInit = true;
            rx.SamplingRate = 4e6;
            rx();
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), 'FIR Rx: 0,0 Tx: 0,0');
            testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false), false);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            rx.SamplingRate = 20000001;
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), ...
                testCase.bbRateExpected('fir_20000001.txt'));
            testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false), true);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(20000001));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function rxCustomFilter(testCase, board)
            % EnableCustomFilter: the text of the file goes to
            % filter_fir_config and the filter is enabled on the receive
            % and the transmit channel; SamplingRate and RFBandwidth are
            % not written (on hardware the driver takes them from the
            % file; the emulation keeps the values of the XML file). The
            % order of the writes is not visible here.
            file = fullfile(fileparts(mfilename('fullpath')), 'customAD9361filter.ftr');
            want = fileread(file);
            testCase.assertSubstring(want, 'RX 3 GAIN -12 DEC 4');
            rx = feval(board{1}, 'uri', testCase.emuUri(board{3}));
            rx.SamplesPerFrame = 1024;
            rx.SamplingRate = 4e6;
            rx.RFBandwidth = 2e6;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = file;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), want);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', true), true);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            % with the custom filter a new rate is kept in the property
            % only (MATLAB warns that the property is not relevant)
            rx.SamplingRate = 5e6;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), want);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function txCustomFilter(testCase, board)
            % As rxCustomFilter, for the transmitter and another file
            file = fullfile(fileparts(mfilename('fullpath')), 'LTE15_MHz.ftr');
            want = fileread(file);
            testCase.assertSubstring(want, 'TX 3 GAIN 0 INT 2');
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            tx.SamplingRate = 4e6;
            tx.RFBandwidth = 2e6;
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = file;
            a = testCase.txFrame(0);
            testCase.verifyEqual(tx(a), true);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('filter_fir_config', 8192), want);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'filter_fir_en', false), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'filter_fir_en', true), true);
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords(), reshape([real(a) imag(a)].', [], 1));
        end

        function customFilterFileThatIsMissing(testCase)
            % The error of fileread, and the context is released
            rx = adi.AD9361.Rx('uri', testCase.emuUri('pluto.xml'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = fullfile(testCase.Folder, 'none.ftr');
            err = caught(@() rx());
            testCase.assertNotEmpty(err, 'A missing file was read.');
            testCase.verifySubstring(err.identifier, 'MATLAB:fileread:');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyWarningFree(@() rx.release());
        end

        function jesd204CheckStatus(testCase)
            % CheckStatus of adi.common.JESD204: the link lines of the
            % debug attribute "status" (the line of the JTX is the receive
            % link, the line of the JRX the transmit link) and the
            % jesd204_fsm_* device attributes, as in ad9081.xml
            dev = IIOv1JESD204Device();
            dev.uri = testCase.emuUri('ad9081.xml');
            dev();
            s = dev.CheckStatus();
            testCase.verifyClass(s, 'struct');
            testCase.verifyEqual(sort(fieldnames(s)), ...
                {'ctrl'; 'error'; 'paused'; 'rx'; 'state'; 'tx'});
            testCase.verifyEqual(s.rx, 'JESD RX (JTX) Link0 204C PLL locked, PHASE established, MODE valid');
            testCase.verifyEqual(s.tx, 'JESD TX (JRX) Link0 0xF lanes in DATA');
            testCase.verifyEqual(s.ctrl, '1');
            testCase.verifyEqual(s.error, '0');
            testCase.verifyEqual(s.paused, '0');
            testCase.verifyEqual(s.state, 'opt_post_running_stage');
            testCase.verifyEqual(dev.getDebugAttributeRAW('chip_version'), 'AD9081 Rev. 3 Grade 10');
            dev.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        %% Other transceivers: frames in and out

        function familyRxFrames(testCase, receiver)
            % Class, size, complexity, valid flag and values of the
            % frames of one channel, then of all channels of the device
            rx = feval(receiver{1}, 'uri', testCase.emuUri(receiver{2}, false, receiver{3}));
            rx.SamplesPerFrame = 1024;
            for f = 0:4     % frame 4 starts again at the beginning of the file
                [d, v] = rx();
                msg = sprintf('frame %d', f);
                testCase.verifyClass(v, 'logical', msg);
                testCase.verifyEqual(v, true, msg);
                testCase.verifyClass(d, 'double', msg);
                testCase.verifySize(d, [1024 1], msg);
                testCase.verifyFalse(isreal(d), msg);
                testCase.verifyEqual(d, testCase.ramp(f * 1024 + (0:1023)), msg);
            end
            testCase.verifyEqual(d(1:2), complex([-2048; -2047], [2047; 2046]));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % sample s holds the pairs n*s, n*s + 1, ... for the n channels
            n = receiver{4};
            if n > 1
                rx.EnabledChannels = 1:n;
                rx.SamplesPerFrame = 512;
                [d, v] = rx();
                testCase.verifyEqual(v, true);
                testCase.verifyClass(d, 'double');
                testCase.verifySize(d, [512 n]);
                testCase.verifyFalse(isreal(d));
                for c = 1:n
                    testCase.verifyEqual(d(:, c), testCase.ramp(n * (0:511) + c - 1), sprintf('column %d', c));
                end
                rx.release();
                testCase.verifyEqual(iio.internal.handle_count(), 0);
            end
        end

        function familyTxFrames(testCase, transmitter)
            % The device receives I and Q of each sample in turn, for one
            % channel and for all channels of the device
            tx = feval(transmitter{1}, 'uri', testCase.emuUri(transmitter{2}));
            a = testCase.txFrame(0);
            v = tx(a);
            testCase.verifyClass(v, 'logical');
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(tx.SamplesPerFrame, 256);
            tx.release();   % sends what is queued
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            got = testCase.sentWords(transmitter{3});
            testCase.verifySize(got, [512 1]);
            testCase.verifyEqual(got, testCase.interleaved(a));
            testCase.verifyEqual(got(1:4), int16([100; -100; 101; -101]));
            n = transmitter{4};
            if n > 1
                tx.EnabledChannels = 1:n;
                b = complex(zeros(256, n, 'int16'));
                for c = 1:n
                    b(:, c) = testCase.txFrame(1000 * c);
                end
                testCase.verifyEqual(tx(b), true);
                tx.release();
                testCase.verifyEqual(iio.internal.handle_count(), 0);
                got = testCase.sentWords(transmitter{3});
                testCase.verifySize(got, [512 * n 1]);
                testCase.verifyEqual(got, testCase.interleaved(b));
                testCase.verifyEqual(got(1:4), int16([1100; -100; 2100; -100]));
            end
        end

        %% ADRV9009

        function adrv9009RxAttributes(testCase, adrv9009RxFile)
            % What setup writes is read back from the same context. The
            % files have the gain 30, the tracking, the calibration
            % switches and the power down off and the LO at 2.4 GHz.
            rx = adi.ADRV9009.Rx('uri', testCase.emuUri(adrv9009RxFile, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2];
            rx.CenterFrequency = 2.5e9;
            rx.GainControlMode = 'manual';
            rx.GainChannel0 = 20.5;
            rx.GainChannel1 = 7;
            rx.EnableQuadratureTrackingChannel1 = false;
            rx.EnableHarmonicDistortionTrackingChannel0 = true;
            rx.EnablePhaseCorrection = true;
            rx.EnableFrequencyHoppingModeCalibration = true;
            rx.PowerdownChannel1 = true;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 2]);
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * (0:1023)));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * (0:1023) + 1));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 20.5);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 7);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'quadrature_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), false);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_qec_en', 16), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_phase_correction_en', 16), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate', 16), '1');
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false), true);
            % tunable after setup
            rx.CenterFrequency = 3e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(3000000000));
            rx.GainChannel0 = 11.5;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 11.5);
            rx.EnableQuadratureTrackingChannel0 = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), false);
            rx.EnableHarmonicDistortionTrackingChannel1 = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), true);
            rx.PowerdownChannel0 = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false), true);
            rx.GainControlMode = 'slow_attack';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'slow_attack');
            % in slow_attack the gain is kept in the property only
            rx.GainChannel0 = 3;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 11.5);
            % the data path is not disturbed: this is the second frame
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * (1024 + (0:1023))));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * (1024 + (0:1023)) + 1));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function adrv9009TxAttributes(testCase, adrv9009TxFile)
            % The files have the attenuation -10, the tracking, the
            % calibration switches and the power down off, the LO at
            % 2.4 GHz and the DDS on
            tx = adi.ADRV9009.Tx('uri', testCase.emuUri(adrv9009TxFile));
            tx.EnabledChannels = [1 2];
            tx.CenterFrequency = 2.6e9;
            tx.AttenuationChannel0 = -12;
            tx.AttenuationChannel1 = -20;
            tx.EnableLOLeakageTrackingChannel1 = false;
            tx.EnableQuadratureTrackingChannel1 = false;
            tx.EnableLOLeakageCorrectionExternal = true;
            tx.PowerdownChannel1 = true;
            a = [testCase.txFrame(0), testCase.txFrame(2000)];
            testCase.verifyEqual(tx(a), true);
            dds = tx.getIIODevice('axi-adrv9009-tx-hpc');
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2600000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -20);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'quadrature_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'lo_leakage_tracking_en', true), false);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_qec_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_ext_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '0');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate', 16), '1');
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'powerdown', true), true);
            % the host is the data source: the DDS is off
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % tunable after setup
            tx.AttenuationChannel0 = -5;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -5);
            tx.CenterFrequency = 2.7e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2700000000));
            tx.PowerdownChannel0 = true;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true), true);
            tx.EnableQuadratureTrackingChannel0 = false;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'quadrature_tracking_en', true), false);
            tx.EnableLOLeakageTrackingChannel0 = false;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true), false);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-adrv9009-tx-hpc'), testCase.interleaved(a));
        end

        function adrv9009ORxAttributes(testCase)
            % The observation receiver powers the two receivers down and
            % itself up. adrv9009.xml has the receivers up, the
            % observation receivers down with tracking off, the port
            % OBS_TX_LO, the LO at 2.4 GHz and the AUX LO at 2.4175 GHz;
            % the rate of the transmitter is 122.88 MHz, below the 250 MHz
            % from which the second observation receiver stays down.
            rx = adi.ADRV9009.ORx('uri', testCase.emuUri('adrv9009.xml', false, 'axi-adrv9009-rx-obs-hpc'));
            rx.SamplesPerFrame = 1024;
            rx.CenterFrequency = 2.5e9;
            rx.LOSourceSelect = 'OBS_AUX_LO';
            rx.AUXFrequency = 2.6e9;
            rx.Gain = 12.5;
            rx.EnableFrequencyHoppingModeCalibration = true;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage2', 'powerdown', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage3', 'powerdown', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage2', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2600000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'OBS_AUX_LO');
            testCase.verifyEqual(rx.getAttributeDouble('voltage2', 'hardwaregain', false), 12.5);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '1');
            % tunable after setup
            rx.Gain = 3;
            testCase.verifyEqual(rx.getAttributeDouble('voltage2', 'hardwaregain', false), 3);
            rx.AUXFrequency = 2.65e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2650000000));
            rx.CenterFrequency = 2.8e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2800000000));
            rx.LOSourceSelect = 'OBS_TX_LO';
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'OBS_TX_LO');
            rx.PowerdownChannel0 = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage2', 'powerdown', false), true);
            rx.PowerdownChannel1 = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage3', 'powerdown', false), true);
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(1024 + (0:1023)));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function adrv9009Profile(testCase)
            % EnableCustomProfile: the text of the file goes to
            % profile_config, which is "TB" in the XML file. The
            % emulation keeps it and loads nothing.
            file = fullfile(fileparts(mfilename('fullpath')), ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_ADRV9009.txt');
            want = fileread(file);
            testCase.assertSubstring(want, '<profile Talise version=1');
            rx = adi.ADRV9009.Rx('uri', testCase.emuUri('adrv9009.xml', false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = file;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('profile_config', 8192), want);
            rx.release();
            % and for the transmitter
            tx = adi.ADRV9009.Tx('uri', testCase.emuUri('adrv9008-2.xml'));
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = file;
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('profile_config', 8192), want);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        %% Two ADRV9009: ADRV9009-ZU11EG and FMComms8

        function dualADRV9009RxAttributes(testCase, dualBoard)
            % What setup writes to the two ADRV9009 is read back from
            % each. Both have in the files the gain 30 in the mode manual,
            % the tracking, the calibration switches and the power down
            % off and the LO at 2.4 GHz. The second ADRV9009 stays in
            % slow_attack here and has its gains set after setup: for
            % manual at setup see dualADRV9009RxGainOfChipBAtSetup.
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            testCase.verifyClass(rx, [dualBoard{1} '.Rx']);
            rx.SamplesPerFrame = 512;
            rx.EnabledChannels = [1 2 3 4];
            rx.CenterFrequency = 2.5e9;
            rx.CenterFrequencyChipB = 2.6e9;
            rx.GainControlMode = 'manual';
            rx.GainChannel0 = 20.5;
            rx.GainChannel1 = 7;
            rx.EnableQuadratureTrackingChannel1 = false;
            rx.EnableQuadratureTrackingChannel0ChipB = false;
            rx.EnableHarmonicDistortionTrackingChannel0 = true;
            rx.EnableHarmonicDistortionTrackingChannel1 = true;
            rx.EnableHarmonicDistortionTrackingChannel1ChipB = true;
            rx.EnablePhaseCorrection = true;
            rx.EnableFrequencyHoppingModeCalibration = true;
            rx.PowerdownChannel1 = true;
            rx.PowerdownChannel0ChipB = true;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyClass(d, 'double');
            testCase.verifySize(d, [512 4]);
            testCase.verifyFalse(isreal(d));
            for c = 1:4
                testCase.verifyEqual(d(:, c), testCase.ramp(4 * (0:511) + c - 1), sprintf('column %d', c));
            end
            testCase.verifyEqual(rx.phyDevName, dualBoard{3});
            testCase.verifyEqual(rx.phyDevNameChipB, dualBoard{4});
            phyB = rx.getIIODevice(dualBoard{4});
            % the first ADRV9009
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 20.5);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 7);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'quadrature_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), true);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_qec_en', 16), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_phase_correction_en', 16), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate', 16), '1');
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false), true);
            % the second ADRV9009
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'slow_attack');
            % in slow_attack setup writes no gain: the 30 of the XML file
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 30);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false, phyB), 30);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false, phyB), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'quadrature_tracking_en', false, phyB), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false, phyB), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false, phyB), true);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_qec_en', 16, phyB), '1');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_rx_phase_correction_en', 16, phyB), '0');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate', 16, phyB), '1');
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false, phyB), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false, phyB), false);
            % calibrate_fhm_en is written under the name
            % adi.ADRV9009ZU11EG.Rx only, to each ADRV9009 from its own
            % property; adi.FMComms8.Rx leaves the 0 of the XML file
            if dualBoard{5}
                testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '1');
            else
                testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '0');
            end
            testCase.verifyEqual(rx.getDeviceAttributeRAW('calibrate_fhm_en', 16, phyB), '0');
            % tunable after setup: the second ADRV9009 alone
            rx.GainControlModeChipB = 'manual';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'manual');
            rx.GainChannel0ChipB = 12.25;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 12.25);
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 20.5);
            rx.GainChannel1ChipB = 3;
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false, phyB), 3);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 7);
            rx.EnableQuadratureTrackingChannel1ChipB = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'quadrature_tracking_en', false, phyB), false);
            rx.EnableQuadratureTrackingChannel0ChipB = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false, phyB), true);
            rx.EnableHarmonicDistortionTrackingChannel0ChipB = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false, phyB), true);
            rx.EnableHarmonicDistortionTrackingChannel1ChipB = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false, phyB), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), true);
            rx.PowerdownChannel1ChipB = true;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false, phyB), true);
            rx.PowerdownChannel0ChipB = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false, phyB), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'powerdown', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'powerdown', false), true);
            % and the first alone
            rx.CenterFrequency = 3e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(3000000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            rx.GainChannel0 = 11.5;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 11.5);
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 12.25);
            rx.GainControlMode = 'slow_attack';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'slow_attack');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'manual');
            rx.GainControlModeChipB = 'slow_attack';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'slow_attack');
            % in slow_attack the gain is kept in the property only
            rx.GainChannel0ChipB = 5;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 12.25);
            % the data path is not disturbed: this is the second frame
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            for c = 1:4
                testCase.verifyEqual(d(:, c), testCase.ramp(4 * (512 + (0:511)) + c - 1), sprintf('column %d', c));
            end
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function dualADRV9009RxGainOfChipBAtSetup(testCase, dualBoard)
            % Current behaviour, a bug of the classes that is left as
            % found: with the second ADRV9009 in manual, setup writes
            % GainChannel0ChipB and GainChannel1ChipB to the first one.
            % setupInit of adi.ADRV9009ZU11EG.Rx passes the device where
            % setAttributeDouble takes the tolerance, so the write goes
            % to phyDevName. It comes after the gains of the first, which
            % it replaces; the second keeps the 30 of the XML file.
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 512;
            rx.GainControlMode = 'manual';
            rx.GainChannel0 = 20.5;
            rx.GainChannel1 = 7;
            rx.GainControlModeChipB = 'manual';
            rx.GainChannel0ChipB = 12.25;
            rx.GainChannel1ChipB = 3;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:511));
            phyB = rx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 12.25);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 3);
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 30);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false, phyB), 30);
            % the properties still hold what was asked for
            testCase.verifyEqual([rx.GainChannel0 rx.GainChannel1], [20.5 7]);
            % set after setup the gain goes to the second ADRV9009
            rx.GainChannel0ChipB = 5;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false, phyB), 5);
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 12.25);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function dualADRV9009RxHD2TrackingAtSetup(testCase, dualBoard)
            % Current behaviour, a bug of the classes that is left as
            % found: setup writes hd2_tracking_en of channel 1 of the
            % first ADRV9009 from EnableHarmonicDistortionTrackingChannel0.
            % The second ADRV9009 gets each channel from its own property.
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 512;
            rx.EnableHarmonicDistortionTrackingChannel0 = true;
            rx.EnableHarmonicDistortionTrackingChannel1 = false;
            rx.EnableHarmonicDistortionTrackingChannel0ChipB = true;
            rx.EnableHarmonicDistortionTrackingChannel1ChipB = false;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:511));
            phyB = rx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), true);
            testCase.verifyEqual(rx.EnableHarmonicDistortionTrackingChannel1, false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false, phyB), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false, phyB), false);
            % set after setup the property reaches its channel
            rx.EnableHarmonicDistortionTrackingChannel1 = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd2_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd2_tracking_en', false), true);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function dualADRV9009CenterFrequencyChipBAfterSetup(testCase, dualBoard)
            % Current behaviour, a bug of the classes that is left as
            % found: setup writes CenterFrequencyChipB to the second
            % ADRV9009, and a change after setup goes to the first one
            % (the set method of adi.ADRV9009ZU11EG.Base names no device).
            % The second keeps its LO, and CenterFrequency no longer
            % holds the LO of the first.
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 512;
            rx.CenterFrequency = 2.5e9;
            rx.CenterFrequencyChipB = 2.6e9;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:511));
            phyB = rx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            rx.CenterFrequencyChipB = 2.7e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2700000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            testCase.verifyEqual(rx.CenterFrequency, 2.5e9);
            testCase.verifyEqual(rx.CenterFrequencyChipB, 2.7e9);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % the transmitter has the set method of the same base class
            tx = feval([dualBoard{1} '.Tx'], 'uri', testCase.emuUri(dualBoard{2}));
            tx.CenterFrequency = 2.5e9;
            tx.CenterFrequencyChipB = 2.6e9;
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            phyB = tx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            tx.CenterFrequencyChipB = 2.7e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2700000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2600000000));
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function dualADRV9009RxDeleteReleases(testCase, dualBoard)
            % adi.ADRV9009ZU11EG.Rx has an empty delete method of its
            % own; the one of adi.common.RxTx still releases
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 512;
            rx();
            testCase.verifyGreaterThan(iio.internal.handle_count(), 0);
            delete(rx);
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function dualADRV9009TxAttributes(testCase, dualBoard)
            % Both ADRV9009 have in the files the attenuation -10, the
            % tracking, the calibration switches and the power down off
            % and the LO at 2.4 GHz; the DDS is on. One I/Q pair is sent:
            % for more see dualADRV9009TxSeveralChannels.
            tx = feval([dualBoard{1} '.Tx'], 'uri', testCase.emuUri(dualBoard{2}));
            testCase.verifyClass(tx, [dualBoard{1} '.Tx']);
            tx.CenterFrequency = 2.6e9;
            tx.CenterFrequencyChipB = 2.7e9;
            tx.AttenuationChannel0 = -12;
            tx.AttenuationChannel1 = -20;
            tx.AttenuationChannel0ChipB = -25;
            tx.AttenuationChannel1ChipB = -3;
            tx.EnableLOLeakageTrackingChannel1 = false;
            tx.EnableQuadratureTrackingChannel1 = false;
            tx.EnableLOLeakageTrackingChannel0ChipB = false;
            tx.EnableQuadratureTrackingChannel0ChipB = false;
            tx.EnableLOLeakageCorrectionExternal = true;
            tx.EnableFrequencyHoppingModeCalibrationChipB = true;
            tx.PowerdownChannel1 = true;
            tx.PowerdownChannel0ChipB = true;
            a = testCase.txFrame(0);
            testCase.verifyEqual(tx(a), true);
            testCase.verifyEqual(tx.phyDevName, dualBoard{3});
            testCase.verifyEqual(tx.phyDevNameChipB, dualBoard{4});
            phyB = tx.getIIODevice(dualBoard{4});
            dds = tx.getIIODevice('axi-adrv9009-tx-hpc');
            % the first ADRV9009
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2600000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -20);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'quadrature_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'lo_leakage_tracking_en', true), false);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_qec_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_ext_en', 16), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate', 16), '1');
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'powerdown', true), true);
            % the second ADRV9009
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2700000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -25);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true, phyB), -3);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'quadrature_tracking_en', true, phyB), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true, phyB), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true, phyB), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'lo_leakage_tracking_en', true, phyB), true);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_qec_en', 16, phyB), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_en', 16, phyB), '1');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_tx_lol_ext_en', 16, phyB), '0');
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate', 16, phyB), '1');
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true, phyB), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'powerdown', true, phyB), false);
            % calibrate_fhm_en is written under the name
            % adi.ADRV9009ZU11EG.Tx only, to each ADRV9009 from its own
            % property; adi.FMComms8.Tx leaves the 0 of the XML file
            testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_fhm_en', 16), '0');
            if dualBoard{5}
                testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_fhm_en', 16, phyB), '1');
            else
                testCase.verifyEqual(tx.getDeviceAttributeRAW('calibrate_fhm_en', 16, phyB), '0');
            end
            % the host is the data source: the DDS is off
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % tunable after setup: the second ADRV9009 alone
            tx.AttenuationChannel0ChipB = -7;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -7);
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12);
            tx.AttenuationChannel1ChipB = -8;
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true, phyB), -8);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -20);
            tx.PowerdownChannel1ChipB = true;
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'powerdown', true, phyB), true);
            tx.PowerdownChannel0ChipB = false;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true, phyB), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'powerdown', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'powerdown', true), true);
            tx.EnableQuadratureTrackingChannel1ChipB = false;
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true, phyB), false);
            tx.EnableQuadratureTrackingChannel0ChipB = true;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'quadrature_tracking_en', true, phyB), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true), false);
            tx.EnableLOLeakageTrackingChannel1ChipB = false;
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'lo_leakage_tracking_en', true, phyB), false);
            tx.EnableLOLeakageTrackingChannel0ChipB = true;
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true, phyB), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true), true);
            % and the first alone
            tx.AttenuationChannel0 = -5;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -5);
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -7);
            tx.CenterFrequency = 2.8e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2800000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2700000000));
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-adrv9009-tx-hpc'), testCase.interleaved(a));
        end

        function dualADRV9009TxSeveralChannels(testCase, dualBoard)
            % Current behaviour, a bug of the classes that is left as
            % found: adi.ADRV9009ZU11EG.Tx asks for one input per enabled
            % I/Q pair (getNumInputsImpl), while setup and step of
            % adi.common.Tx take one matrix with a column per pair. With
            % more than one pair enabled no call passes: one matrix is
            % too few inputs, one input per pair too many. MATLAB raises
            % both errors, not the classes. Whether it does so before or
            % after setup is not relied on: the object is released before
            % the handles are counted.
            tx = feval([dualBoard{1} '.Tx'], 'uri', testCase.emuUri(dualBoard{2}));
            testCase.verifyEqual(getNumInputs(tx), 1);
            tx.EnabledChannels = [1 2];
            testCase.verifyEqual(getNumInputs(tx), 2);
            tx.EnabledChannels = [1 2 3 4];
            testCase.verifyEqual(getNumInputs(tx), 4);
            tx.EnabledChannels = [1 2];
            b = [testCase.txFrame(0), testCase.txFrame(2000)];
            err = caught(@() tx(b));
            testCase.assertNotEmpty(err, 'One matrix of two columns was accepted.');
            testCase.verifyFalse(strncmp(err.identifier, 'adi:', 4), err.message);
            testCase.verifyFalse(contains(err.message, 'Data size must'), err.message);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            err = caught(@() tx(b(:, 1), b(:, 2)));
            testCase.assertNotEmpty(err, 'One input per I/Q pair was accepted.');
            testCase.verifyFalse(strncmp(err.identifier, 'adi:', 4), err.message);
            testCase.verifyFalse(contains(err.message, 'Data size must'), err.message);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % neither call sent a word
            name = fullfile(testCase.Folder, 'axi-adrv9009-tx-hpc_buf0.bin');
            if isfile(name)
                testCase.verifyEmpty(testCase.sentWords('axi-adrv9009-tx-hpc'));
            end
            % the number of inputs is the cause: with one pair enabled
            % the same object on the same context sends its frame
            tx.EnabledChannels = 1;
            testCase.verifyEqual(getNumInputs(tx), 1);
            testCase.verifyEqual(tx(b(:, 2)), true);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-adrv9009-tx-hpc'), testCase.interleaved(b(:, 2)));
        end

        function dualADRV9009TxDDS(testCase, dualBoard)
            % DataSource 'DDS' takes no input, so all four I/Q pairs can
            % be used: column c of the DDS properties is the two tones
            % altvoltage(2c-2) and altvoltage(2c-1) of the transmit device,
            % for the eight channels I and Q of the four pairs
            tx = feval([dualBoard{1} '.Tx'], 'uri', testCase.emuUri(dualBoard{2}));
            tx.DataSource = 'DDS';
            testCase.verifyEqual(getNumInputs(tx), 0);
            k = reshape(0:15, 2, 8);    % the number of the tone
            tx.DDSFrequencies = (k + 1) * 1e6;
            tx.DDSScales = (k + 1) / 16;
            tx.DDSPhases = (k + 1) * 1000;
            testCase.verifyEqual(tx(), true);
            dds = tx.getIIODevice('axi-adrv9009-tx-hpc');
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), true);
            for n = 0:15
                id = sprintf('altvoltage%d', n);
                testCase.verifyEqual(tx.getAttributeDouble(id, 'frequency', true, dds), (n + 1) * 1e6, id);
                testCase.verifyEqual(tx.getAttributeDouble(id, 'scale', true, dds), (n + 1) / 16, id);
                testCase.verifyEqual(tx.getAttributeDouble(id, 'phase', true, dds), (n + 1) * 1000, id);
            end
            % the attributes of the two ADRV9009 are written as with DMA
            phyB = tx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -30);
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -30);
            tx.DDSFrequencies = (16 - k) * 1e6;
            testCase.verifyEqual(tx.getAttributeDouble('altvoltage0', 'frequency', true, dds), 16e6);
            testCase.verifyEqual(tx.getAttributeDouble('altvoltage15', 'frequency', true, dds), 1e6);
            testCase.verifyEqual(tx(), true);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % nothing was transmitted from the host
            testCase.verifyFalse(isfile(fullfile(testCase.Folder, 'axi-adrv9009-tx-hpc_buf0.bin')));
        end

        function dualADRV9009Profile(testCase, dualBoard)
            % EnableCustomProfile: the text of the file goes to
            % profile_config of both ADRV9009, which is "TB" in the XML
            % file. The emulation keeps it and loads nothing.
            file = fullfile(fileparts(mfilename('fullpath')), ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_ADRV9009.txt');
            want = fileread(file);
            testCase.assertSubstring(want, '<profile Talise version=1');
            rx = feval([dualBoard{1} '.Rx'], 'uri', testCase.emuUri(dualBoard{2}, false, 'axi-adrv9009-rx-hpc'));
            rx.SamplesPerFrame = 512;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = file;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:511));
            phyB = rx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(rx.getDeviceAttributeRAW('profile_config', 8192), want);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('profile_config', 8192, phyB), want);
            rx.release();
            % and for the transmitter, on a context that has "TB" again
            tx = feval([dualBoard{1} '.Tx'], 'uri', testCase.emuUri(dualBoard{2}));
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = file;
            testCase.verifyEqual(tx(testCase.txFrame(0)), true);
            phyB = tx.getIIODevice(dualBoard{4});
            testCase.verifyEqual(tx.getDeviceAttributeRAW('profile_config', 8192), want);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('profile_config', 8192, phyB), want);
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        %% AD9371

        function ad9371RxAttributes(testCase, ad9371Package)
            % ad9371.xml has the LO at 2.5 GHz, the gain 30, the tracking
            % on and the loopback off. The classes write the LO as
            % RX_LO_frequency, the name of older drivers: libiio finds
            % the attribute "frequency" of the channel named RX_LO.
            rx = feval([ad9371Package '.Rx'], 'uri', testCase.emuUri('ad9371.xml', false, 'axi-ad9371-rx-hpc'));
            testCase.verifyClass(rx, [ad9371Package '.Rx']);
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2];
            rx.CenterFrequency = 2.4e9;
            rx.GainControlMode = 'manual';
            rx.GainChannel0 = 12.25;
            rx.GainChannel1 = 3;
            rx.EnableQuadratureTrackingChannel0 = false;
            rx.LoopbackMode = 1;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 2]);
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * (0:1023)));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * (0:1023) + 1));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2400000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'RX_LO_frequency', true), int64(2400000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 12.25);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 3);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getDebugAttributeLongLong('loopback_tx_rx'), int64(1));
            % the LO of the transmitter is not touched
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2500000000));
            % tunable after setup
            rx.CenterFrequency = 2.45e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2450000000));
            rx.GainChannel1 = 8.75;
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 8.75);
            rx.GainControlMode = 'hybrid';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'hybrid');
            % outside of manual the gain is kept in the property only
            rx.GainChannel0 = 5;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 12.25);
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * (1024 + (0:1023))));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * (1024 + (0:1023)) + 1));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function ad9371TxAttributes(testCase, ad9371Package)
            % ad9371.xml has the LO at 2.5 GHz, the attenuation -10 and
            % the DDS on
            tx = feval([ad9371Package '.Tx'], 'uri', testCase.emuUri('ad9371.xml'));
            testCase.verifyClass(tx, [ad9371Package '.Tx']);
            tx.EnabledChannels = [1 2];
            tx.CenterFrequency = 2.45e9;
            tx.AttenuationChannel0 = -12.25;
            tx.AttenuationChannel1 = -40;
            a = [testCase.txFrame(0), testCase.txFrame(2000)];
            testCase.verifyEqual(tx(a), true);
            dds = tx.getIIODevice('axi-ad9371-tx-hpc');
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2450000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.25);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -40);
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % the LO of the receiver is not touched
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            % tunable after setup
            tx.AttenuationChannel1 = -3.5;
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -3.5);
            tx.CenterFrequency = 2.46e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2460000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-ad9371-tx-hpc'), testCase.interleaved(a));
        end

        function ad9371ORxAttributes(testCase)
            % ad9371.xml has the observation receiver (voltage2) on the
            % port INTERNALCALS with tracking off, its LO at 2.6 GHz and
            % the loopback off
            rx = adi.AD9371.ORx('uri', testCase.emuUri('ad9371.xml', false, 'axi-ad9371-rx-obs-hpc'));
            rx.SamplesPerFrame = 1024;
            rx.CenterFrequency = 2.55e9;
            rx.GainControlMode = 'manual';
            rx.RFPortSelect = 'ORX1_TX_LO';
            rx.Gain = 9.5;
            rx.LoopbackMode = 1;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'ORX1_TX_LO');
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeBool('voltage2', 'quadrature_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeDouble('voltage2', 'hardwaregain', false), 9.5);
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage2', 'frequency', true), int64(2550000000));
            testCase.verifyEqual(rx.getDebugAttributeLongLong('loopback_tx_obs'), int64(1));
            % the LO of the receiver is not touched
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            % tunable after setup
            rx.RFPortSelect = 'SN_B';
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'SN_B');
            rx.Gain = 30;
            testCase.verifyEqual(rx.getAttributeDouble('voltage2', 'hardwaregain', false), 30);
            % the LO and the gain control mode are written with the port
            % off, and the port is selected again
            rx.CenterFrequency = 2.65e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage2', 'frequency', true), int64(2650000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'SN_B');
            rx.GainControlMode = 'automatic';
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'gain_control_mode', false), 'automatic');
            testCase.verifyEqual(rx.getAttributeRAW('voltage2', 'rf_port_select', false), 'SN_B');
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(1024 + (0:1023)));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function ad9371Profile(testCase, ad9371Package)
            % EnableCustomProfile: the text of the file goes to
            % profile_config, which is "TB" in the XML file, before the
            % other attributes are written. The emulation keeps it and
            % loads nothing.
            file = fullfile(fileparts(mfilename('fullpath')), 'profile_TxBW100_ORxBW100_RxBW100.txt');
            want = fileread(file);
            testCase.assertSubstring(want, '<profile AD9371 version=0');
            rx = feval([ad9371Package '.Rx'], 'uri', testCase.emuUri('ad9371.xml', false, 'axi-ad9371-rx-hpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = file;
            rx.CenterFrequency = 2.4e9;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('profile_config', 8192), want);
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2400000000));
            % what the class reads before the profile and writes again after it
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', true), -10);
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2500000000));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        %% ADRV9002

        function adrv9002RxAttributes(testCase)
            % adrv9002.xml has both receivers in rf_enabled with the gain
            % 34 by spi, the port enable by spi, the LOs at 2.4 GHz
            % (attribute "frequency"), the trackings agc, bbdc rejection,
            % quadrature fic, rfdc and rssi on, hd and quadrature w poly
            % off, and the rate 1920000
            rx = adi.ADRV9002.Rx('uri', testCase.emuUri('adrv9002.xml', false, 'axi-adrv9002-rx-lpc'));
            rx.SamplesPerFrame = 1024;
            testCase.verifyTrue(isnan(rx.SamplingRate));    % not connected
            rx.EnabledChannels = [1 2];
            rx.CenterFrequencyChannel0 = 2.41e9;
            rx.CenterFrequencyChannel1 = 2.42e9;
            rx.ENSMModeChannel1 = 'primed';
            rx.GainControllerSourceChannel0 = 'spi';
            rx.GainControllerSourceChannel1 = 'automatic';
            rx.DigitalGainControlModeChannel0 = 'spi';
            rx.AttenuationChannel0 = 7;
            rx.AttenuationChannel1 = 9;
            rx.ENSMPortModeChannel0 = 'pin';     % ENSMPortModeChannel1 stays 'spi'
            rx.AGCTrackingChannel0 = false;
            rx.RSSITrackingChannel1 = false;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 2]);
            testCase.verifyEqual(d(:, 1), testCase.ramp(2 * (0:1023)));
            testCase.verifyEqual(d(:, 2), testCase.ramp(2 * (0:1023) + 1));
            testCase.verifyEqual(rx.SamplingRate, int64(1920000));
            testCase.verifyEqual(rx.RSSIChannel0, 81.875);
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'ensm_mode', false), 'rf_enabled');
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'ensm_mode', false), 'primed');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'spi');
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'gain_control_mode', false), 'automatic');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'digital_gain_control_mode', false), 'spi');
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'digital_gain_control_mode', false), 'automatic');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'interface_gain', false), '0dB');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'port_en_mode', false), 'pin');
            % As found in the class, not as meant: setup writes
            % ENSMPortModeChannel0 to voltage1 too, so this is 'pin' and not
            % the 'spi' of ENSMPortModeChannel1 (and of the XML file). When
            % the class is corrected this line is 'spi'.
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'port_en_mode', false), 'pin');
            % set after setup the property reaches its own channel
            rx.ENSMPortModeChannel1 = 'spi';
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'port_en_mode', false), 'spi');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'port_en_mode', false), 'pin');
            % the gain is written for the source spi only
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 7);
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false), 34);
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2410000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2420000000));
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'agc_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'agc_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'hd_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_w_poly_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'rssi_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'rssi_tracking_en', false), false);
            % the LOs of the transmitters are not touched
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage2', 'frequency', true), int64(2450000000));
            % tunable after setup
            rx.CenterFrequencyChannel0 = 2.5e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2500000000));
            rx.CenterFrequencyChannel1 = 2.6e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2600000000));
            rx.NCOCorrectionFrequencyChannel0 = 1000;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'nco_frequency', false), int64(1000));
            rx.AttenuationChannel0 = 12;
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 12);
            rx.ENSMModeChannel0 = 'calibrated';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'ensm_mode', false), 'calibrated');
            rx.AGCTrackingChannel1 = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage1', 'agc_tracking_en', false), false);
            rx.HDTrackingChannel0 = false;
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd_tracking_en', false), false);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function adrv9002TxAttributes(testCase)
            % adrv9002.xml has both transmitters in rf_enabled with the
            % attenuation -10 by spi, the port enable by spi, the LOs at
            % 2.45 GHz, all trackings off and the DDS on
            tx = adi.ADRV9002.Tx('uri', testCase.emuUri('adrv9002.xml'));
            tx.EnabledChannels = [1 2];
            tx.CenterFrequencyChannel0 = 2.41e9;
            tx.CenterFrequencyChannel1 = 2.42e9;
            tx.ENSMModeChannel1 = 'primed';
            tx.AttenuationChannel0 = -12.5;
            tx.AttenuationChannel1 = -20;
            tx.AttenuationControlModeChannel1 = 'bypass';
            tx.PortEnableControlChannel0 = 'pin';
            tx.ClosedLoopTrackingChannel1 = false;
            tx.LoopbackDelayTrackingChannel0 = true;
            a = [testCase.txFrame(0), testCase.txFrame(2000)];
            testCase.verifyEqual(tx(a), true);
            dds = tx.getIIODevice('axi-adrv9002-tx-lpc');
            testCase.verifyEqual(tx.SamplingRate, int64(1920000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage2', 'frequency', true), int64(2410000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage3', 'frequency', true), int64(2420000000));
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'ensm_mode', true), 'rf_enabled');
            testCase.verifyEqual(tx.getAttributeRAW('voltage1', 'ensm_mode', true), 'primed');
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'port_en_mode', true), 'pin');
            testCase.verifyEqual(tx.getAttributeRAW('voltage1', 'port_en_mode', true), 'spi');
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'atten_control_mode', true), 'spi');
            testCase.verifyEqual(tx.getAttributeRAW('voltage1', 'atten_control_mode', true), 'bypass');
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.5);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -20);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'close_loop_gain_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'close_loop_gain_tracking_en', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'lo_leakage_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'loopback_delay_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'loopback_delay_tracking_en', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage0', 'pa_correction_tracking_en', true), false);
            testCase.verifyEqual(tx.getAttributeBool('voltage1', 'quadrature_tracking_en', true), true);
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % the LOs of the receivers are not touched
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2400000000));
            % tunable after setup
            tx.CenterFrequencyChannel1 = 2.5e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage3', 'frequency', true), int64(2500000000));
            tx.NCOCorrectionFrequencyChannel1 = 2000;
            testCase.verifyEqual(tx.getAttributeLongLong('voltage1', 'nco_frequency', true), int64(2000));
            tx.AttenuationChannel0 = -3;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -3);
            tx.ENSMModeChannel0 = 'calibrated';
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'ensm_mode', true), 'calibrated');
            tx.AttenuationControlModeChannel0 = 'pin';
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'atten_control_mode', true), 'pin');
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-adrv9002-tx-lpc'), testCase.interleaved(a));
        end

        function adrv9002Profile(testCase)
            % EnableCustomProfile: the stream file is written to
            % stream_config as the bytes it holds (32768, the third one
            % zero), then the text of the profile file to profile_config.
            % Before that the scales of the DDS tones (0.125 in the XML
            % file) are set to 0. The emulation keeps the profile text; of
            % a value with a zero byte it keeps what precedes that byte,
            % so the bytes of the stream are compared where they are
            % handed to the bindings (IIOv1ADRV9002Recorder).
            folder = fullfile(fileparts(mfilename('fullpath')), 'adrv9002_profiles');
            profile = fullfile(folder, 'lte_5_cmos_api_68_0_6.json');
            stream = fullfile(folder, 'lte_5_cmos_api_68_0_6.stream');
            wantProfile = fileread(profile);
            fid = fopen(stream, 'r');
            testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot read ' stream]);
            wantStream = fread(fid, [1 Inf], '*uint8');
            fclose(fid);
            testCase.assertNumElements(wantStream, 32768);
            testCase.assertEqual(find(wantStream == 0, 1), 3);
            rx = IIOv1ADRV9002Recorder('uri', testCase.emuUri('adrv9002.xml', false, 'axi-adrv9002-rx-lpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = profile;
            rx.CustomStreamFileName = stream;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.assertSize(rx.Writes, [2 4]);
            testCase.verifyEqual(rx.Writes(:, 1:2), {'raw', 'stream_config'; 'string', 'profile_config'});
            testCase.verifyClass(rx.Writes{1, 3}, 'uint8');
            testCase.verifyEqual(rx.Writes{1, 3}, wantStream);
            testCase.verifyEqual(rx.Writes{1, 4}, 32768);
            testCase.verifyEqual(rx.Writes{2, 3}, wantProfile);
            testCase.verifyEqual(rx.Writes{2, 4}, numel(wantProfile) + 1);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('profile_config', 65536), wantProfile);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('stream_config', 65536), char(wantStream(1:2)));
            dds = rx.getIIODevice('axi-adrv9002-tx-lpc');
            for c = 0:7
                id = sprintf('altvoltage%d', c);
                testCase.verifyEqual(rx.getAttributeDouble(id, 'scale', true, dds), 0, id);
            end
            % the attributes are written after the profile
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'hd_tracking_en', false), true);
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % A profile without a stream file is refused before anything
            % is written, and the context is released
            rx = IIOv1ADRV9002Recorder('uri', testCase.emuUri('adrv9002.xml', false, 'axi-adrv9002-rx-lpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = profile;
            err = caught(@() rx());
            testCase.assertNotEmpty(err, 'A profile without a stream file was accepted.');
            testCase.verifySubstring(err.message, 'A custom stream file must be defined for custom profiles');
            testCase.verifyEmpty(rx.Writes);
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % A stream file that does not exist
            rx = IIOv1ADRV9002Recorder('uri', testCase.emuUri('adrv9002.xml', false, 'axi-adrv9002-rx-lpc'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = profile;
            rx.CustomStreamFileName = fullfile(testCase.Folder, 'none.stream');
            testCase.verifyError(@() rx(), 'adi:ADRV9002:noStreamFile');
            testCase.verifyEmpty(rx.Writes);
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function adrv9002SplitDMA(testCase)
            % One DMA per channel: EnabledChannels = 2 streams from the
            % second device, and two channels at once are refused. The
            % file has the older names of the LO attributes
            % (RX2_LO_frequency on a channel without a name).
            uri = testCase.emuUri('adrv9002_splitdma.xml', false, 'axi-adrv9002-rx-lpc');
            testCase.writeRamp('axi-adrv9002-rx2-lpc', 1000);
            rx = adi.ADRV9002.Rx('uri', uri);
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = 2;
            rx.CenterFrequencyChannel0 = 2.41e9;
            rx.CenterFrequencyChannel1 = 2.42e9;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 1]);
            testCase.verifyEqual(d, testCase.ramp(1000 + (0:1023)));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'RX1_LO_frequency', true), int64(2410000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'RX2_LO_frequency', true), int64(2420000000));
            testCase.verifyEqual(rx.SamplingRate, int64(15360000));
            rx.CenterFrequencyChannel1 = 2.5e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage1', 'RX2_LO_frequency', true), int64(2500000000));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % the first channel streams from the first device
            rx = adi.ADRV9002.Rx('uri', uri);
            rx.SamplesPerFrame = 1024;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            rx.release();
            % two channels
            rx = adi.ADRV9002.Rx('uri', uri);
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2];
            err = caught(@() rx());
            testCase.assertNotEmpty(err, 'Two channels were accepted.');
            testCase.verifySubstring(err.message, 'Driver is in split DMA mode');
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            % the transmitter
            tx = adi.ADRV9002.Tx('uri', uri);
            tx.EnabledChannels = 2;
            tx.CenterFrequencyChannel1 = 2.43e9;
            a = testCase.txFrame(0);
            testCase.verifyEqual(tx(a), true);
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage3', 'TX2_LO_frequency', true), int64(2430000000));
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('axi-adrv9002-tx2-lpc'), testCase.interleaved(a));
            testCase.verifyFalse(isfile(fullfile(testCase.Folder, 'axi-adrv9002-tx-lpc_buf0.bin')));
        end

        %% FMComms5

        function fmcomms5RxAttributes(testCase)
            % What setup writes to the two AD9361 is read back from each.
            % fmcomms5.xml has both at 3 GHz, 4 MS/s and 18 MHz, in
            % slow_attack with all trackings on, the port A_BALANCED, the
            % loopback off, in the mode fdd, and "ERROR" as value of the
            % device attribute multichip_sync, which is written last by
            % the multichip sync (the steps 0 to 5).
            rx = adi.FMComms5.Rx('uri', testCase.fmcomms5FilterOffUri('cf-ad9361-A'));
            rx.SamplesPerFrame = 1024;
            rx.EnabledChannels = [1 2 3 4];
            rx.CenterFrequency = 2.41e9;
            rx.CenterFrequencyChipB = 2.43e9;
            rx.SamplingRate = 5e6;
            rx.RFBandwidth = 2e6;
            rx.RFBandwidthChipB = 4e6;
            rx.GainControlModeChannel0 = 'manual';
            rx.GainChannel0 = 33;
            rx.GainControlModeChannel1 = 'fast_attack';
            rx.GainControlModeChannel0ChipB = 'hybrid';
            rx.GainControlModeChannel1ChipB = 'manual';
            rx.GainChannel1ChipB = 21;
            rx.EnableQuadratureTracking = false;
            rx.EnableRFDCTrackingChipB = false;
            rx.RFPortSelect = 'B_BALANCED';
            rx.RFPortSelectChipB = 'C_BALANCED';
            rx.LoopbackMode = 1;
            rx.LoopbackModeChipB = 2;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifySize(d, [1024 4]);
            for c = 1:4
                testCase.verifyEqual(d(:, c), testCase.ramp(4 * (0:1023) + c - 1), sprintf('column %d', c));
            end
            phyB = rx.getIIODevice('ad9361-phy-B');
            % the filter of rates up to 20 MS/s
            fir = testCase.bbRateExpected('fir_4000000.txt');
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2410000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2430000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(5000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true, phyB), int64(5000000));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), fir);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192, phyB), fir);
            testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('out', 'voltage_filter_fir_en', false, phyB), true);
            % setup does not write the bandwidths: the 18 MHz of the XML file
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false, phyB), int64(18000000));
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage0', 'hardwaregain', false), 33);
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'gain_control_mode', false), 'fast_attack');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'hybrid');
            testCase.verifyEqual(rx.getAttributeRAW('voltage1', 'gain_control_mode', false, phyB), 'manual');
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false, phyB), 21);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false), false);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'quadrature_tracking_en', false, phyB), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'rf_dc_offset_tracking_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'rf_dc_offset_tracking_en', false, phyB), false);
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false), 'B_BALANCED');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false, phyB), 'C_BALANCED');
            testCase.verifyEqual(rx.getDebugAttributeRAW('loopback'), '1');
            testCase.verifyEqual(rx.getDebugAttributeRAW('loopback', phyB), '2');
            % the multichip sync ran: the last step, and the mode restored
            testCase.verifyEqual(rx.getDeviceAttributeRAW('multichip_sync', 16), '5');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('multichip_sync', 16, phyB), '5');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('ensm_mode', 16), 'fdd');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('ensm_mode', 16, phyB), 'fdd');
            % The emulation has no register 0x6 and 0x7 on ad9361-phy, so
            % there was nothing to copy: ad9361-phy-B has none either
            testCase.verifyEqual(rx.iio_device_reg_read(phyB, 6), -2);
            testCase.verifyEqual(rx.iio_device_reg_read(phyB, 7), -2);
            % tunable after setup: the second AD9361 alone
            rx.CenterFrequencyChipB = 2.44e9;
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true, phyB), int64(2440000000));
            testCase.verifyEqual(rx.getAttributeLongLong('altvoltage0', 'frequency', true), int64(2410000000));
            rx.GainChannel1ChipB = 40;
            testCase.verifyEqual(rx.getAttributeDouble('voltage1', 'hardwaregain', false, phyB), 40);
            rx.RFBandwidthChipB = 6e6;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false, phyB), int64(6000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            rx.RFBandwidth = 7e6;
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(7000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false, phyB), int64(6000000));
            rx.RFPortSelectChipB = 'A_N';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false, phyB), 'A_N');
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'rf_port_select', false), 'B_BALANCED');
            rx.GainControlModeChannel0ChipB = 'slow_attack';
            testCase.verifyEqual(rx.getAttributeRAW('voltage0', 'gain_control_mode', false, phyB), 'slow_attack');
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function fmcomms5TxAttributes(testCase)
            % fmcomms5.xml has both AD9361 at 3 GHz, 4 MS/s and 18 MHz,
            % with the attenuation -20 and the port A, and the DDS on
            tx = adi.FMComms5.Tx('uri', testCase.fmcomms5FilterOffUri(testCase.RxDevice));
            tx.EnabledChannels = [1 2 3 4];
            tx.CenterFrequency = 2.42e9;
            tx.CenterFrequencyChipB = 2.44e9;
            tx.SamplingRate = 5e6;
            tx.RFBandwidth = 2e6;
            tx.RFBandwidthChipB = 4e6;
            tx.AttenuationChannel0 = -12.5;
            tx.AttenuationChannel1 = -3;
            tx.AttenuationChannel0ChipB = -30.25;
            tx.AttenuationChannel1ChipB = -7;
            tx.RFPortSelectChipB = 'B';
            a = [testCase.txFrame(0), testCase.txFrame(1000), testCase.txFrame(2000), testCase.txFrame(3000)];
            testCase.verifyEqual(tx(a), true);
            phyB = tx.getIIODevice('ad9361-phy-B');
            dds = tx.getIIODevice('cf-ad9361-dds-core-lpc');
            fir = testCase.bbRateExpected('fir_4000000.txt');
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2420000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true, phyB), int64(2440000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(5000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'sampling_frequency', true, phyB), int64(5000000));
            testCase.verifyEqual(tx.getDeviceAttributeRAW('filter_fir_config', 8192), fir);
            testCase.verifyEqual(tx.getDeviceAttributeRAW('filter_fir_config', 8192, phyB), fir);
            testCase.verifyEqual(tx.getAttributeBool('out', 'voltage_filter_fir_en', false), true);
            testCase.verifyEqual(tx.getAttributeBool('out', 'voltage_filter_fir_en', false, phyB), true);
            % setup does not write the bandwidths: the 18 MHz of the XML file
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true, phyB), int64(18000000));
            % set after setup they are written, each to its AD9361
            tx.RFBandwidthChipB = 6e6;
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true, phyB), int64(6000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(18000000));
            tx.RFBandwidth = 7e6;
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(7000000));
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true, phyB), int64(6000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.5);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true), -3);
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -30.25);
            testCase.verifyEqual(tx.getAttributeDouble('voltage1', 'hardwaregain', true, phyB), -7);
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true), 'A');
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true, phyB), 'B');
            testCase.verifyEqual(tx.RFPortSelect, 'A');
            testCase.verifyEqual(tx.RFPortSelectChipB, 'B');
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % the transmitter makes no multichip sync
            testCase.verifyEqual(tx.getDeviceAttributeRAW('multichip_sync', 16), 'ERROR');
            % tunable after setup: the second AD9361 alone
            tx.AttenuationChannel0ChipB = -40;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true, phyB), -40);
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.5);
            tx.CenterFrequencyChipB = 2.45e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true, phyB), int64(2450000000));
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2420000000));
            tx.RFPortSelectChipB = 'A';
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true, phyB), 'A');
            % the port of the receiver of that AD9361 is not written
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', false, phyB), 'A_BALANCED');
            tx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
            testCase.verifyEqual(testCase.sentWords('cf-ad9361-dds-core-lpc'), testCase.interleaved(a));
        end

        function fmcomms5CustomFilter(testCase)
            % EnableCustomFilter: the text of the file goes to
            % filter_fir_config of both AD9361 and the filter is enabled
            % on both; the rates and bandwidths are not written
            file = fullfile(fileparts(mfilename('fullpath')), 'customAD9361filter.ftr');
            want = fileread(file);
            rx = adi.FMComms5.Rx('uri', testCase.fmcomms5FilterOffUri('cf-ad9361-A'));
            rx.SamplesPerFrame = 1024;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = file;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            phyB = rx.getIIODevice('ad9361-phy-B');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), want);
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192, phyB), want);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', true), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', false, phyB), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', true, phyB), true);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(4000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true, phyB), int64(4000000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false, phyB), int64(18000000));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('multichip_sync', 16, phyB), '5');
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

        function fmcomms5MultichipSync(testCase, mcsCase)
            % The attribute and register accesses of the multichip sync,
            % in order and with their results, are those of
            % ad9361_fmcomms5_multichip_sync of libad9361-iio on the same
            % context: the registers 0x6 and 0x7 of ad9361-phy hold 0x24
            % and 0x51, and ad9361-phy-B has the given sampling rate.
            % SkipInit keeps the values of the XML file up to the call.
            context = mcsCase{1};
            flags = mcsCase{2};
            slaveRate = mcsCase{3};
            want = testCase.mcsExpected(sprintf('%s_f%d_r%d.log', context, flags, slaveRate));
            ret = str2double(regexp(want, '(?<=^RET )-?\d+', 'match', 'lineanchors'));
            testCase.assertNumElements(ret, 1);
            isDebug = strcmp(context, 'fmcomms5debug');
            if isDebug
                uri = testCase.emuContext('fmcomms5.xml', '<attribute name="multichip_sync" value="ERROR" />', '');
            else
                uri = testCase.emuContext('fmcomms5.xml', '', '');
            end
            testCase.writeRamp('cf-ad9361-A', 0);
            rx = IIOv1MCSRecorder('uri', uri);
            rx.SamplesPerFrame = 1024;
            rx.SkipInit = true;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEmpty(rx.Log);   % SkipInit: no sync at setup
            phyA = rx.getIIODevice('ad9361-phy');
            phyB = rx.getIIODevice('ad9361-phy-B');
            testCase.assertEqual(rx.iio_device_reg_write(phyA, 6, hex2dec('24')), 0);
            testCase.assertEqual(rx.iio_device_reg_write(phyA, 7, hex2dec('51')), 0);
            if slaveRate ~= 0
                rx.setAttributeLongLong('voltage0', 'sampling_frequency', slaveRate, true, 0, phyB);
            end
            status = rx.runMultichipSync(flags);
            testCase.verifyEqual(status, ret);
            testCase.verifyEqual(sprintf('%s\n', rx.Log{:}), want);
            % the state that the calls leave
            if bitand(flags, 2) ~= 0 || slaveRate == 0
                rate = int64(4000000);      % the rate of ad9361-phy
            else
                rate = int64(slaveRate);
            end
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true, phyB), rate);
            [status6, reg6] = rx.iio_device_reg_read(phyB, 6);
            [status7, reg7] = rx.iio_device_reg_read(phyB, 7);
            if bitand(flags, 1) ~= 0
                testCase.verifyEqual([status6 status7], [0 0]);
                testCase.verifyEqual([reg6 reg7], uint32([36 81]));
            else
                testCase.verifyEqual([status6 status7], [-2 -2]);
            end
            testCase.verifyEqual(rx.getDeviceAttributeRAW('ensm_mode', 16), 'fdd');
            testCase.verifyEqual(rx.getDeviceAttributeRAW('ensm_mode', 16, phyB), 'fdd');
            if isDebug
                testCase.verifyEqual(rx.getDebugAttributeRAW('multichip_sync'), '5');
                testCase.verifyEqual(rx.getDebugAttributeRAW('multichip_sync', phyB), '5');
            else
                testCase.verifyEqual(rx.getDeviceAttributeRAW('multichip_sync', 16), '5');
                testCase.verifyEqual(rx.getDeviceAttributeRAW('multichip_sync', 16, phyB), '5');
                % the debug attribute of that name is not written
                testCase.verifyEqual(rx.getDebugAttributeRAW('multichip_sync', phyB), '0');
            end
            % the data path is not disturbed: this is the second frame
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(1024 + (0:1023)));
            rx.release();
            testCase.verifyEqual(iio.internal.handle_count(), 0);
        end

    end

end

function err = caught(f)
% The MException that f() raises, [] when it raises none
err = [];
try
    f();
catch e
    err = e;
end
end

function setProperty(obj, name, value)
% Assignment as a function, for verifyError
obj.(name) = value;
end
