classdef AD936x_LTETests < LTETests
    properties (TestParameter)
        AD936xClassTx = {adi.AD9361.Tx};
        AD936xClassRx = {adi.AD9361.Rx};
        LOFreqs = {2400e6};
    end
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
    end
    
    properties (Access = protected)
        Tx
        Rx
    end
    
    properties
        ClassName
        LOFreq
        TMN
        BW
    end
    
    properties (Constant)
        filters_dir = 'ad936x_filters';
    end
    
    properties % demodulation-related
        TestSettings = ...
            struct(...
            'TxGain', -10,...
            'Backoff', -3, ...
            'RxGainMode', 'slow_attack')
    end
    
    methods(Access = protected)
        function ConfigHW(testCase, TxClass, RxClass)
            % tx setup
            testCase.Tx = TxClass;
            testCase.Tx.CenterFrequency = testCase.LOFreq;
            testCase.Tx.AttenuationChannel0 = testCase.TestSettings.TxGain;
            testCase.Tx.EnableCyclicBuffers = true;
            testCase.Tx.EnableCustomFilter = true;
            
            % rx setup
            testCase.Rx = RxClass;
            testCase.Rx.CenterFrequency = testCase.LOFreq;
            testCase.Rx.EnableCustomFilter = true;
            testCase.Rx.GainControlModeChannel0 = ...
                testCase.TestSettings.RxGainMode;
            testCase.Rx.kernelBuffersCount = 1;
            testCase.Rx.SamplesPerFrame = ...
                testCase.setRxSamplesPerFrame(testCase.BW);
            
            % configure custom filter settings
            switch (testCase.BW)
                case '5MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, testCase.filters_dir, 'LTE5_MHz.ftr');
                case '10MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, testCase.filters_dir, 'LTE10_MHz.ftr');
                case '15MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, testCase.filters_dir, 'LTE15_MHz.ftr');
                case '20MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, testCase.filters_dir, 'LTE20_MHz.ftr');
                otherwise
                    st = dbstack;
                    error('unsupported BW option in LTE test harness - %s\n', testCase.BW);
            end
            testCase.Rx.CustomFilterFileName = testCase.Tx.CustomFilterFileName;
        end
    end
    
    methods(Test)
        function CheckForHardware(testCase, AD936xClassTx, ...
                AD936xClassRx)
            % tx and rx setup
            testCase.Tx = AD936xClassTx;
            testCase.Rx = AD936xClassRx;
            
            dev = @()testCase.Rx;
            testCase.CheckDevice('ip', dev, testCase.Rx.uri(4:end), false);
        end
        
        function TestAcrossLOFreqsTMNsBWs(testCase, AD936xClassTx, ...
                AD936xClassRx, LOFreqs, TMNs, BWs)            
            % run test
            testCase.ClassName = class(testCase);
            testCase.LOFreq = LOFreqs;
            testCase.TMN = TMNs;
            testCase.BW = BWs;
            testCase.RunTest(AD936xClassTx, AD936xClassRx);
        end
    end
end