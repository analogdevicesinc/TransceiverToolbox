classdef ADRV9002_LTETests < LTETests
    properties (TestParameter)
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
        DeviceName
        LOFreq
        TMN
        BW
    end
    
    properties % demodulation-related
        TestSettings = struct('TxAttn', -10, 'Backoff', -3)        
    end
    
    properties (ClassSetupParameter)
        ADRV9002Device = {'ADRV9002'};
    end
    
    methods (TestClassSetup)
        function CheckForHardware(testCase, ADRV9002Device)
            % check tx
            dev = @()adi.(genvarname(ADRV9002Device)).Tx;
            testCase.uri = 'ip:192.168.100.2';
            testCase.CheckDevice('ip', dev, testCase.uri(4:end), true);
            % check rx
            dev = @()adi.(genvarname(ADRV9002Device)).Rx;
            testCase.CheckDevice('ip', dev, testCase.uri(4:end), false);
            
            testCase.DeviceName = ADRV9002Device;
        end
    end
    
    methods(Access = protected)
        function ConfigHW(testCase)
            % tx setup
            testCase.Tx = adi.(genvarname(testCase.DeviceName)).Tx;
            testCase.Tx.CenterFrequencyChannel0 = testCase.LOFreq;
            testCase.Tx.AttenuationChannel0 = testCase.TestSettings.TxAttn;
            testCase.Tx.EnableCyclicBuffers = true;
            testCase.Tx.EnabledChannels = 1;
            testCase.Tx.uri = testCase.uri;
            
            % rx setup
            testCase.Rx = adi.(genvarname(testCase.DeviceName)).Rx;
            testCase.Rx.CenterFrequencyChannel0 = testCase.LOFreq;
            testCase.Rx.kernelBuffersCount = 1;
            testCase.Rx.SamplesPerFrame = ...
                testCase.setRxSamplesPerFrame(testCase.BW);
            testCase.Rx.EnabledChannels = 1;    
            testCase.Rx.uri = testCase.Tx.uri;
        end
    end
    
    methods(Test)
        function TestAcrossLOFreqsTMNsBWs(testCase, LOFreqs, TMNs, BWs)
            % run test
            testCase.LOFreq = LOFreqs;
            testCase.TMN = TMNs;
            testCase.BW = BWs;
            testCase.RunTest();
        end
    end
end