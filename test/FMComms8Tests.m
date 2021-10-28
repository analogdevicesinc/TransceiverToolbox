classdef FMComms8Tests < HardwareTests
    
    properties
        uri = 'ip:analog-2.local';
        SamplingRateRX = 245.76e6;
        author = 'ADI';
    end
    
    methods(TestClassSetup)
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.FMComms8.Rx;
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
        
        function testFMComms8Rx(testCase)
            % Test Rx DMA data output
            for k=1:4
                rx = adi.FMComms8.Rx('uri',testCase.uri);
                rx.EnabledChannels = 1;
                [out, valid] = rx();
                rx.release();
                testCase.verifyTrue(valid);
                testCase.verifyGreaterThan(sum(abs(double(out))),0);
            end
        end
        
        function testFMComms8Tx(testCase)
            % Test Rx DMA data output
            data = complex(randn(2^14,1));
            for k=1:4
                tx = adi.FMComms8.Tx('uri',testCase.uri);
                tx.EnabledChannels = 1;
                valid = tx(data);
                tx.release();
                testCase.verifyTrue(valid);
            end
        end
        
        function testFMComms8RxCustomProfile1(testCase)
            % Test Rx custom profiles
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            [out, valid] = rx();
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            txSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',true);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(rxSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
            testCase.verifyEqual(txSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
        end
        
        function testFMComms8RxCustomProfile2(testCase)
            % Test Rx custom profiles
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = ...
                'Tx_BW400_IR491p52_Rx_BW200_OR245p76_ORx_BW400_OR491p52_DC245p76.txt';
            [out, valid] = rx();
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            txSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',true);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(rxSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
            testCase.verifyEqual(txSampleRate,int64(245.76e6*2),...
                'Invalid sample rate after profile write');
        end
%         
%         function testFMComms8RxCustomProfileZC706(testCase)
%             % Test Rx custom profiles
%             rx = adi.FMComms8.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.EnableCustomProfile = true;
%             rx.CustomProfileFileName = ...
%                 'Tx_BW100_IR122p88_Rx_BW100_OR122p88_ORx_BW100_OR122p88_DC122p88.txt';
%             [out, valid] = rx();
%             rxSampleRate = rx.getAttributeLongLong('voltage0',...
%                 'sampling_frequency',false);
%             rx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%             testCase.verifyEqual(rxSampleRate,int64(122880000),...
%                 'Invalid sample rate after profile write');
%         end
        
        function testFMComms8RxWithTxDDS(testCase)
            % Test DDS output
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 30e6;
            tx.DDSFrequencies = repmat(toneFreq,2,4);
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx();
            pause(1);
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rxSampleRate);
            freqEst = meanfreq(double(real(out)),rxSampleRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testFMComms8RxWithTxDDSTwoChan(testCase)
            % Test DDS output
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq1 = 30e6;
            toneFreq2 = 85e6;
            
            tx.DDSFrequencies = [toneFreq1,toneFreq1,toneFreq2,toneFreq2;...
                0,0,0,0];
            tx.DDSScales = [1,1,1,1;...
                0,0,0,0];
            tx.DDSPhases = [90000,0,90000,0;...
                0,0,0,0];
            
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx();
            pause(1);
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1,2];
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rxSampleRate);
            freqEst = meanfreq(double(real(out)),rxSampleRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst(1),toneFreq1,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            testCase.verifyEqual(freqEst(2),toneFreq2,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
        end
        
        function testFMComms8RxWithTxData(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 20e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 2^20;
            swv1.SampleRate = 245.76e6;
            y = swv1();
            
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx(y);
            pause(3);
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:20
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();
            tx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rxSampleRate);
            freqEst = meanfreq(double(real(out)),rxSampleRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
        
        function testFMComms8TxPowerdown(testCase)
            % Test Powerdown and up of TX
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx.PowerdownChannel0 = true;
            tx.PowerdownChannel1 = true;
            tx.PowerdownChannel0ChipB = true;
            tx.PowerdownChannel1ChipB = true;
            tx();
            tx.release();
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx.PowerdownChannel0 = false;
            tx.PowerdownChannel1 = false;
            tx.PowerdownChannel0ChipB = false;
            tx.PowerdownChannel1ChipB = false;
            tx();
            tx.release();
        end
        
        function testFMComms8TxRuntimeChanges(testCase)
            % Change attributes at runtime
            tx = adi.FMComms8.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx();
            for k=-20:1:-10
                tx.AttenuationChannel0 = k;
                tx.AttenuationChannel1 = k;
                tx.AttenuationChannel0ChipB = k;
                tx.AttenuationChannel1ChipB = k;
            end
            tx.release();
        end

        function testFMComms8RxRuntimeChanges(testCase)
            % Change attributes at runtime
            rx = adi.FMComms8.Rx('uri',testCase.uri);
            rx();
            rx.GainControlMode = 'manual';
            rx.GainControlModeChipB = 'manual';
            for k=0:1
                rx.EnableQuadratureTrackingChannel0ChipB = k;
                rx.EnableQuadratureTrackingChannel1ChipB = k;
                rx.EnableQuadratureTrackingChannel0 = k;
                rx.EnableQuadratureTrackingChannel1 = k;
                rx.GainChannel0ChipB = k;
                rx.GainChannel1ChipB = k;
                rx.GainChannel0 = k;
                rx.GainChannel1 = k;
            end
            rx.GainControlMode = 'slow_attack';
            rx.GainControlModeChipB = 'slow_attack';
            rx.release();
        end

        
        
    end
    
end

