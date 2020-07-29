classdef ADRV9002Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
    end
    
    methods(TestClassSetup)
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
            df = fs/nSamp;  freqRangeRx = (-fs/2:df:fs/2-df).'/1000;
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

%             plot(real(out));
%             testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),sr);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
%         function testADRV9002RxWithTxData(testCase)
%             % Test Tx DMA data output
%             amplitude = 2^15; frequency = 0.12e6;
%             swv1 = dsp.SineWave(amplitude, frequency);
%             swv1.ComplexOutput = true;
%             swv1.SamplesPerFrame = 1e4*10;
%             swv1.SampleRate = 3e6;
%             y = swv1();
%             
%             tx = adi.ADRV9002.Tx('uri',testCase.uri);
%             tx.DataSource = 'DMA';
%             tx.EnableCyclicBuffers = true;
%             tx.AttenuationChannel0 = -10;
%             tx(y);
%             rx = adi.ADRV9002.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.kernelBuffersCount = 1;
%             for k=1:10
%                 valid = false;
%                 while ~valid
%                     [out, valid] = rx();
%                 end
%             end
%             rx.release();
% 
% %             plot(real(out));
% %             testCase.estFrequency(out,rx.SamplingRate);
%             freqEst = meanfreq(double(real(out)),rx.SamplingRate);
%             
%             testCase.verifyTrue(valid);
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%             testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
%                 'Frequency of ML tone unexpected')
%         end
    end
    
end

