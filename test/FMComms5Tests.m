classdef FMComms5Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
    end
    
    properties (TestParameter)
        EnChsSingleCombos = num2cell(nchoosek(1:4, 1));
        EnChsTupleCombos = mat2cell(nchoosek(1:4, 2), ones(1, nchoosek(4, 2)));
        AllEnChsCombos = [num2cell(nchoosek(1:4, 1)).'...
            mat2cell(nchoosek(1:4, 2), ones(1, nchoosek(4, 2))).'...
            mat2cell(nchoosek(1:4, 4), 1)];     
    end
    
    methods(TestClassSetup)
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.FMComms5.Rx;
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
        
        function testFMComms5RxDMA(testCase, AllEnChsCombos)
            % Test Rx DMA data output
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = AllEnChsCombos;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            for ii = 1:numel(AllEnChsCombos)
                testCase.verifyNotEqual(diff(abs(double(out(:,ii)))), ...
                    zeros(numel(out(:,ii))-1, 1));
            end
            if (numel(AllEnChsCombos) > 1)
                for ii = 2:numel(AllEnChsCombos)
                    testCase.verifyNotEqual(sum(abs(double(out(:,1)))), ...
                        sum(abs(double(out(:,ii)))));                    
                end
            end
        end
        
        function testFMComms5RxCustomFilterSingle(testCase, EnChsSingleCombos)
            % Test Rx Custom filters
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = EnChsSingleCombos;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'customAD9361filter.ftr';
            [out, valid] = rx();
            % Check sample rate
            if (EnChsSingleCombos < 3)
                sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            else
                sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            end
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr),3000000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyNotEqual(diff(abs(double(out))), ...
                zeros(numel(out)-1, 1));
        end
        
        function testFMComms5RxCustomFilterTuple(testCase, EnChsTupleCombos)
            % Test Rx Custom filters
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = EnChsTupleCombos;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'customAD9361filter.ftr';
            [out, valid] = rx();
            % Check sample rate
            if (EnChsTupleCombos(1) < 3)
                sr1 = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            else
                sr1 = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            end
            if (EnChsTupleCombos(2) < 3)
                sr2 = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            else
                sr2 = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            end
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testFMComms5RxCustomFilterChipsAandB(testCase)
            % Test Rx Custom filters
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1 2 3 4];
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'customAD9361filter.ftr';
            [out, valid] = rx();
            % Check sample rate
            sr1 = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = rx.getAttributeLongLong('voltage1','sampling_frequency',false);
            sr3 = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            sr4 = rx.getAttributeLongLong('voltage1','sampling_frequency',false,rx.iioDevPHYChipB);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr3),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr4),3000000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out(1,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(2,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(3,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(4,:)))),0);
        end
        
        function testFMComms5RxCustomFilterLTE(testCase, EnChsSingleCombos)
            % Test Rx Custom filters
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = EnChsSingleCombos;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'LTE15_MHz.ftr';
            [out, valid] = rx();
            % Check sample rate
            if (EnChsSingleCombos < 3)
                sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            else
                sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            end
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr),23040000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyNotEqual(diff(abs(double(out))), ...
                zeros(numel(out)-1, 1));
        end
        
        function testFMComms5RxCustomFilterLTEChipsAandB(testCase)
            % Test Rx Custom filters
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1 2 3 4];
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'LTE15_MHz.ftr';
            [out, valid] = rx();
            % Check sample rate
            sr1 = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = rx.getAttributeLongLong('voltage1','sampling_frequency',false);
            sr3 = rx.getAttributeLongLong('voltage0','sampling_frequency',false,rx.iioDevPHYChipB);
            sr4 = rx.getAttributeLongLong('voltage1','sampling_frequency',false,rx.iioDevPHYChipB);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr3),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr4),23040000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out(1,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(2,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(3,:)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(4,:)))),0);
        end
        
        function testFMComms5TxCustomFilterChipA(testCase)
            % Test Tx Custom filters
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.EnabledChannels = [1 2];
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'customAD9361filter.ftr';
            data = [complex(randn(1e4,1),randn(1e4,1)) ...
                complex(randn(1e4,1),randn(1e4,1))];
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            sr3 = tx.getAttributeLongLong('voltage1','sampling_frequency',false);
            sr4 = tx.getAttributeLongLong('voltage1','sampling_frequency',true);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr3),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr4),3000000,'Incorrect sample rate');
        end
        
        function testFMComms5TxCustomFilterChipB(testCase)
            % Test Tx Custom filters
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.EnabledChannels = [3 4];
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'customAD9361filter.ftr';
            data = [complex(randn(1e4,1),randn(1e4,1)) ...
                complex(randn(1e4,1),randn(1e4,1))];
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false,tx.iioDevPHYChipB);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true,tx.iioDevPHYChipB);
            sr3 = tx.getAttributeLongLong('voltage1','sampling_frequency',false,tx.iioDevPHYChipB);
            sr4 = tx.getAttributeLongLong('voltage1','sampling_frequency',true,tx.iioDevPHYChipB);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr3),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr4),3000000,'Incorrect sample rate');
        end
        
        function testFMComms5TxCustomFilterLTEChipA(testCase)
            % Test Tx Custom filters
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.EnabledChannels = 1;
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'LTE15_MHz.ftr';
            data = complex(randn(1e4,1),randn(1e4,1));
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),23040000,'Incorrect sample rate');
        end
        
        function testFMComms5TxCustomFilterLTEChipB(testCase)
            % Test Tx Custom filters
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.EnabledChannels = 3;
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'LTE15_MHz.ftr';
            data = complex(randn(1e4,1),randn(1e4,1));
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false,tx.iioDevPHYChipB);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true,tx.iioDevPHYChipB);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),23040000,'Incorrect sample rate');
        end
        
        function testFMComms5RxClearing(testCase)
            % Verify clearing of system objects is working in all cases
            rx = adi.FMComms5.Rx();
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
            rx = adi.FMComms5.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e4');
            end
            rx();
            delete(rx)
            rx = adi.FMComms5.Rx();
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
        
        function testFMComms5RxWithTxDDSChipA1Rx(testCase)
            % Test DDS output
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 4e5;
            tx.DDSFrequencies = repmat(toneFreq,2,2);
            tx.AttenuationChannel0 = -10;
            tx.SamplingRate = 3e6;
            tx();
            pause(1);
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            rx.SamplingRate = 3e6;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

            freqEst = meanfreq(double(real(out)),rx.SamplingRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testFMComms5RxWithTxDDSChipA2Rx(testCase)
            % Test DDS output
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.EnabledChannels = [1 2];
            tx.DataSource = 'DDS';
            toneFreq = 5e5;
            tx.DDSFrequencies = repmat(toneFreq,2,2);
            tx.DDSScales = [1,1;1,1];
            tx.AttenuationChannel0 = -10;
            tx.SamplingRate = 3e6;
            tx();
            pause(1);
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1 2];
            rx.kernelBuffersCount = 1;
            rx.SamplingRate = 3e6;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

            freqEst = meanfreq(double(real(out(:,1))),rx.SamplingRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out(:,1)))),0);
            testCase.verifyGreaterThan(sum(abs(double(out(:,2)))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')            
            
        end
        
        function testFMComms5RxWithTxDDSChipB1Rx(testCase)
            % Test DDS output
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 6e5;
            tx.DDSFrequenciesChipB = repmat(toneFreq,2,2);
            tx();
            pause(1);
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = 3;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

            freqEst = meanfreq(double(real(out)),rx.SamplingRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end        
        
        function testFMComms5RxWithTxDataChipA1Rx(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 0.12e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 1e4*10;
            swv1.SampleRate = 3e6;
            y = swv1();
            
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx(y);
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

            freqEst = meanfreq(double(real(out)),rx.SamplingRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
        
        function testFMComms5RxWithTxDataChipB1Rx(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 0.12e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 1e5;
            swv1.SampleRate = 3e6;
            y = swv1();
            
            tx = adi.FMComms5.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx.EnabledChannels = 3;
            tx(y);
            rx = adi.FMComms5.Rx('uri',testCase.uri);
            rx.EnabledChannels = 3;
            rx.kernelBuffersCount = 1;
            for k=1:20
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

            freqEst = meanfreq(double(out),rx.SamplingRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
        
    end
    
end