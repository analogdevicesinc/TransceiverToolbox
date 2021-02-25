classdef ADIRFSOM_LTETests < LTETests
    properties (TestParameter)
        LOFreqs = num2cell(70e6:100e6:6000e6);
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
        function ConfigHW(testCase)
            % tx setup
            testCase.Tx = adi.AD9361.Tx;
            testCase.Tx.uri = testCase.uri;
            testCase.Tx.CenterFrequency = testCase.LOFreq;
            testCase.Tx.AttenuationChannel0 = testCase.TestSettings.TxGain;
            testCase.Tx.EnableCyclicBuffers = true;
            testCase.Tx.EnableCustomFilter = true;
            
            % rx setup
            testCase.Rx = adi.AD9361.Rx;
            testCase.Rx.uri = testCase.uri;
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
                        fullfile(testCase.root, filesep, ...
                        testCase.filters_dir, filesep, 'LTE5_MHz.ftr');
                case '10MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, filesep, ...
                        testCase.filters_dir, filesep, 'LTE10_MHz.ftr');
                case '15MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, filesep, ...
                        testCase.filters_dir, filesep, 'LTE15_MHz.ftr');
                case '20MHz'
                    testCase.Tx.CustomFilterFileName = ...
                        fullfile(testCase.root, filesep, ...
                        testCase.filters_dir, filesep, 'LTE20_MHz.ftr');
                otherwise
                    st = dbstack;
                    error('unsupported BW option in LTE test harness - %s\n', testCase.BW);
            end
            testCase.Rx.CustomFilterFileName = testCase.Tx.CustomFilterFileName;
        end
    end
    
    methods(Test)
        function TestAcrossLOFreqsTMNsBWs(testCase, LOFreqs, TMNs, BWs)            
            % run test
            testCase.ClassName = class(testCase);
            testCase.LOFreq = LOFreqs;
            testCase.TMN = TMNs;
            testCase.BW = BWs;
            testCase.RunTest();
        end
    end
end