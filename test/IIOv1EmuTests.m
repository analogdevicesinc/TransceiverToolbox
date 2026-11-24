classdef IIOv1EmuTests < matlab.unittest.TestCase
    % IIOv1EmuTests AD9361 family on the libiio v1 bindings, without hardware
    %   Runs adi.AD9361.Rx/Tx and adi.Pluto.Rx/Tx against the emulation
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
        function uri = emuUri(testCase, xmlName, wideRates)
            % Copy the XML file into the temporary folder, write the
            % receive data file beside it, return the URI. With wideRates
            % the copy has the range of sampling_frequency that the
            % driver reports while a filter that decimates by 4 is
            % enabled: from 520833 instead of 2083333.
            src = fullfile(fileparts(mfilename('fullpath')), 'emu', xmlName);
            testCase.assertTrue(isfile(src), ['Missing ' src]);
            dst = fullfile(testCase.Folder, xmlName);
            copyfile(src, dst);
            if nargin >= 3 && wideRates
                text = fileread(src);
                narrow = '[2083333 1 61440000]';
                testCase.assertTrue(contains(text, narrow), [xmlName ' has no range ' narrow]);
                fid = fopen(dst, 'w');
                testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot write ' dst]);
                fwrite(fid, strrep(text, narrow, '[520833 1 61440000]'), 'char*1');
                fclose(fid);
            end
            k = 0:testCase.RampPairs - 1;
            words = zeros(1, 2 * testCase.RampPairs, 'int16');
            words(1:2:end) = k - 2048;
            words(2:2:end) = 2047 - k;
            name = fullfile(testCase.Folder, [testCase.RxDevice '_buf0.bin']);
            fid = fopen(name, 'w');
            testCase.assertGreaterThanOrEqual(fid, 0, ['Cannot write ' name]);
            n = fwrite(fid, words, 'int16', 0, 'ieee-le');
            fclose(fid);
            testCase.assertEqual(n, numel(words));
            uri = ['emu:' dst];
        end

        function v = sentWords(testCase)
            % int16 column: what the transmit device received last
            name = fullfile(testCase.Folder, [testCase.TxDevice '_buf0.bin']);
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
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(2000000));
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
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(2000000));
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -12.5);
            testCase.verifyEqual(tx.getAttributeRAW('voltage0', 'rf_port_select', true), 'B');
            % the host is the data source: the DDS is off
            testCase.verifyEqual(tx.getAttributeBool('altvoltage0', 'raw', true, dds), false);
            % tunable after setup
            tx.AttenuationChannel0 = -20.25;
            testCase.verifyEqual(tx.getAttributeDouble('voltage0', 'hardwaregain', true), -20.25);
            tx.CenterFrequency = 2.43e9;
            testCase.verifyEqual(tx.getAttributeLongLong('altvoltage1', 'frequency', true), int64(2430000000));
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
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(2000000));
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
            testCase.verifyEqual(tx.getAttributeLongLong('voltage0', 'rf_bandwidth', true), int64(2000000));
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
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = file;
            rx.SamplingRate = 4e6;
            rx.RFBandwidth = 2e6;
            [d, v] = rx();
            testCase.verifyEqual(v, true);
            testCase.verifyEqual(d, testCase.ramp(0:1023));
            testCase.verifyEqual(rx.getDeviceAttributeRAW('filter_fir_config', 8192), want);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', false), true);
            testCase.verifyEqual(rx.getAttributeBool('voltage0', 'filter_fir_en', true), true);
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'sampling_frequency', true), int64(30720000));
            testCase.verifyEqual(rx.getAttributeLongLong('voltage0', 'rf_bandwidth', false), int64(18000000));
            % with the custom filter a new rate is kept in the property only
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
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = file;
            tx.SamplingRate = 4e6;
            tx.RFBandwidth = 2e6;
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
