classdef ADRV9002Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
        hardware = 'adrv9002';
    end
    
    properties (TestParameter)
        GainControlMode = {'spi','pin','automatic'};
        DigitalGainControlMode = {'automatic','spi'};
        ENSMPortControl = {'pin','spi'};
        InterfaceGain = {'18dB', '12dB', '6dB', '0dB', '-6dB', '-12dB', '-18dB',...
            '-24dB', '-30dB','-36dB'};
        Tracking = {'AGCTracking','BBDCRejectionTracking','HDTracking',...
            'QuadratureFICTracking','QuadratureWidebandPolyTracking',...
            'RFDCTracking','RSSITracking'};
        TxTracking = {'ClosedLoopTracking','LOLeakageTracking',...
            'LoopbackDelayTracking','PACorrectionTracking',...
            'QuadratureTracking'};
    end
    
    methods(TestClassSetup)
        function UpdateURIFromEnv(testCase)
            urienv = getenv('IIO_URI');
            if ~isempty(urienv)
                testCase.uri = urienv;
            end
        end
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.ADRV9002.Rx;
            testCase.CheckDevice('ip',Device,testCase.uri(4:end),false);
        end
    end
    
    methods (Static)
        function estFrequency(data,fs)
            nSamp = length(data);
            FFTRxData  = fftshift(10*log10(abs(fft(data))));
            freqRangeRx = linspace(double(-fs/2),double(fs/2),double(nSamp)).'/1000;
            plot(freqRangeRx, FFTRxData);
        end
    end
    
    methods (Test)
        
        function testADRV9002Rx(testCase)
            % Test Rx DMA data output
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testADRV9002RxENSM(testCase)
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.ENSMModeChannel0 = 'calibrated';
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(sum(abs(double(out))),0);
        end
        
        function testADRV9002RxAGC(testCase,GainControlMode)
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.GainControllerSourceChannel0 = GainControlMode;
            rx.GainControllerSourceChannel1 = GainControlMode;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testADRV9002RxDAGC(testCase,DigitalGainControlMode)
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.GainControllerSourceChannel0 = 'spi';
            rx.GainControllerSourceChannel1 = 'spi';
            rx.DigitalGainControlModeChannel0 = DigitalGainControlMode;
            rx.DigitalGainControlModeChannel1 = DigitalGainControlMode;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
%         function testADRV9002RxENSMPorts(testCase,ENSMPortControl)
%             rx = adi.ADRV9002.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.ENSMPortModeChannel0 = ENSMPortControl;
%             rx.ENSMPortModeChannel1 = ENSMPortControl;
%             [out, valid] = rx();
%             rx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%         end

        function testADRV9002RxInterfaceGain(testCase,InterfaceGain)
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.InterfaceGainChannel0 = InterfaceGain;
            rx.InterfaceGainChannel0 = InterfaceGain;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testADRV9002RxTracking(testCase,Tracking)
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.([Tracking,'Channel0']) = true;
            rx.([Tracking,'Channel1']) = true;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end

        function testADRV9002TxTracking(testCase,TxTracking)
            tx = adi.ADRV9002.Tx('uri',testCase.uri);
            tx.EnabledChannels = 1;
            tx.([TxTracking,'Channel0']) = true;
            tx.([TxTracking,'Channel1']) = true;
            c = complex(randn(1024,1));
            [valid] = tx(c);
            tx.release();
            testCase.verifyTrue(valid);
        end
        
%         function testADRV9002RxCustomFilter(testCase)
%             % Test Rx Custom filters
%             rx = adi.ADRV9002.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.EnableCustomProfile = true;
%             rx.CustomProfileFileName = 'FDD_20MHz_2rx_2tx_LO_2_4G.json';
%             [out, valid] = rx();
%             % Check sample rate
%             sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
%             rx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyEqual(double(sr),3000000,'Incorrect sample rate');
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%         end
        
%         function testADRV9002RxCustomFilterLTE40MHz(testCase)
%             % Test Rx Custom filters
%             rx = adi.ADRV9002.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.EnableCustomProfile = true;
%             rx.CustomProfileFileName = 'FDD_40MHz_2rx_2tx_LO_2_4G.json';
%             [out, valid] = rx();
%             % Check sample rate
%             sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
%             rx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyEqual(double(sr),23040000,'Incorrect sample rate');
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%         end
        
%         function testADRV9002TxCustomFilter(testCase)
%             % Test Tx Custom filters
%             tx = adi.ADRV9002.Tx('uri',testCase.uri);
%             tx.EnabledChannels = 1;
%             tx.EnableCustomFilter = true;
%             tx.CustomFilterFileName = 'customADRV9002filter.ftr';
%             data = complex(randn(1e4,1),randn(1e4,1));
%             [valid] = tx(data);
%             % Check sample rate
%             sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
%             sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
%             tx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
%             testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
%         end
%         
%         function testADRV9002TxCustomFilterLTE(testCase)
%             % Test Tx Custom filters
%             tx = adi.ADRV9002.Tx('uri',testCase.uri);
%             tx.EnabledChannels = 1;
%             tx.EnableCustomFilter = true;
%             tx.CustomFilterFileName = 'LTE15_MHz.ftr';
%             data = complex(randn(1e4,1),randn(1e4,1));
%             [valid] = tx(data);
%             % Check sample rate
%             sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
%             sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
%             tx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyEqual(double(sr1),23040000,'Incorrect sample rate');
%             testCase.verifyEqual(double(sr2),23040000,'Incorrect sample rate');
%         end

        function testADRV9002RxLTE1_4(testCase)
            % Test Rx Custom filters
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.json');
            rx.CustomStreamFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.stream');
            [out, valid] = rx();
            % Check sample rate
            sr = rx.SamplingRate;
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr),7680000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end

        function testADRV9002TxLTE1_4(testCase)
            % Test Tx Custom filters
            tx = adi.ADRV9002.Tx('uri',testCase.uri);
            tx.EnabledChannels = 1;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.json');
            tx.CustomStreamFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.stream');
            data = complex(randn(1e4,1),randn(1e4,1));
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),7680000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),7680000,'Incorrect sample rate');
        end
        
        function testADRV9002RxClearing(testCase)
            % Verify clearing of system objects is working in all cases
            rx = adi.ADRV9002.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e1');
            end
            rx();
            if rx.Count ~= 1
                error('e2');
            end
            rx.release();
            if rx.Count ~= 0
                error('e3');
            end
            %
            rx = adi.ADRV9002.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e4');
            end
            rx();
            delete(rx)
            rx = adi.ADRV9002.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e5');
            end
            rx();            
            if rx.Count ~= 1
                error('e6');
            end
            %
            rx.release();
        end
        
        function testADRV9002RxWithTxDDS(testCase)
            % Test DDS output
            tx = adi.ADRV9002.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 5e5;
            tx.DDSFrequencies = repmat(toneFreq,2,2);
            tx.AttenuationChannel0 = -30;
            tx();
            sr = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            pause(1);
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            rx.release();
            assert(sr==sr2);

            % plot(real(out));
            % testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),sr);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testADRV9002RxWithTxData(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 0.12e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 1e4*10;
            swv1.SampleRate = 7.68e6;
            y = swv1();
            
            tx = adi.ADRV9002.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.json');
            tx.CustomStreamFileName = fullfile('adrv9002_profiles','lte_5_cmos_api_67_1_1.stream');
            tx(y);
            rx = adi.ADRV9002.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end

            % plot(real(out));
            % testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),rx.SamplingRate);
            rx.release();
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end

        function testADRV9002ManualGainControlError(testCase)
            rx = adi.ADRV9002.Rx;
            rx.uri = testCase.uri;

            % Set low speed profile < 1 MHz
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = which('lte_5_cmos_api_67_1_1.json');
            rx.CustomStreamFileName = which('lte_5_cmos_api_67_1_1.stream');

            rx.DigitalGainControlModeChannel0 = 'spi';
            rx.InterfaceGainChannel0 = '6dB';
            verifyError(testCase, @() rx(), ?MException);
        end

        function testADRV9002ManualGainControl(testCase)
            rx = adi.ADRV9002.Rx;
            rx.uri = testCase.uri;

            % Set low speed profile < 1 MHz
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = which('dmr_tes_v0_21_cmos_24ksps_api_67_1_1.json');
            rx.CustomStreamFileName = which('dmr_tes_v0_21_cmos_24ksps_api_67_1_1.bin');

            rx.DigitalGainControlModeChannel0 = 'spi';
            rx.InterfaceGainChannel0 = '6dB';
            [~,valid] = rx();
            testCase.assertTrue(valid);
        end


    end
    
end

