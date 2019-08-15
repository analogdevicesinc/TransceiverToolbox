classdef AD9361Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
    end
    
    methods(TestClassSetup)
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.AD9361.Rx;
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
        
        function testAD9361Rx(testCase)
            % Test Rx DMA data output
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testAD9361RxCustomFilter(testCase)
            % Test Rx DMA data output
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'customAD9361filter.ftr';
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testAD9361RxClearing(testCase)
            % Verify clearing of system objects is working in all cases
            rx = adi.AD9361.Rx();
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
            rx = adi.AD9361.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e4');
            end
            rx();
            delete(rx)
            rx = adi.AD9361.Rx();
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
        
        function testAD9361RxWithTxDDS(testCase)
            % Test DDS output
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 5e5;
            tx.DDSFrequencies = repmat(toneFreq,2,2);
            tx.AttenuationChannel0 = -10;
            tx();
            pause(1);
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),rx.SamplingRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testAD9361RxWithTxData(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 0.12e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 1e4*10;
            swv1.SampleRate = 3e6;
            y = swv1();
            
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx(y);
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),rx.SamplingRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
    end
    
end

