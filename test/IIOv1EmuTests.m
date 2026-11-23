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
        function uri = emuUri(testCase, xmlName)
            % Copy the XML file into the temporary folder, write the
            % receive data file beside it, return the URI
            src = fullfile(fileparts(mfilename('fullpath')), 'emu', xmlName);
            testCase.assertTrue(isfile(src), ['Missing ' src]);
            dst = fullfile(testCase.Folder, xmlName);
            copyfile(src, dst);
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
            end
            testCase.verifyEqual(d(1:2), complex([-2048; -2047], [2047; 2046]));
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

        function noSuchContext(testCase)
            % An XML file that does not exist: the error of the bindings
            rx = adi.AD9361.Rx('uri', ['emu:' fullfile(testCase.Folder, 'none.xml')]);
            testCase.verifyError(@() rx(), ?MException);
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
            tx = feval(board{2}, 'uri', testCase.emuUri(board{3}));
            testCase.verifyError(@() tx(complex(zeros(256, 2), ones(256, 2))), ?MException);
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

    end

end

function setProperty(obj, name, value)
% Assignment as a function, for verifyError
obj.(name) = value;
end
