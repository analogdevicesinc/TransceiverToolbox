classdef HardwarePerformanceTests < HardwareTestGeneric
    
    methods(Test)
                                
        function LTE_R4_AD9361(testCase)
            
            %% Required test configs
            testCase.author = 'ADI';
            testname = 'LTE_R4_AD9361_ADI';
            
            Frequencies = (0.4:0.1:5).*1e9;
            Tx = struct;
            Tx.Device = @()adi.AD9361.Tx;
            Tx.Gain = -10;
            Tx.Address = 'ip:192.168.86.36';
            Tx.SamplingRate = 1e6;
            
            Rx = struct;
            Rx.Device = @()adi.AD9361.Rx;
            Rx.GainMode = 'slow_attack';
            Rx.Gain = NaN;
            Rx.Address = 'ip:192.168.86.36';
            Rx.SamplingRate = 1e6;
            
            ExtendedTxParams = [];
            ExtendedRxParams = [];
            
            %% Check hardware connected
            testCase.CheckDevice('ip',Tx.Device,Tx.Address(4:end),true);
            testCase.CheckDevice('ip',Rx.Device,Rx.Address(4:end),false);
            
            %% Run Test
%             logs = testCase.SDRLoopbackLTEEVMTest('R4',Frequencies,...
%                 Tx,Rx,ExtendedTxParams,ExtendedRxParams,testname);
            logs = testCase.SDRLoopbackLTEEVMTest('LTE10',Frequencies,...
                Tx,Rx,ExtendedTxParams,ExtendedRxParams,testname);
            
            %% Log data
            filename = [testname,'_',num2str(int32(now)),'.mat'];
            save(filename,'logs');
            
        end

        function LTE10_ADRV9361_PXA(testCase)
            
            import matlab.unittest.plugins.DiagnosticsRecordingPlugin
            
            %% Required test configs
            testname = 'LTE10_ADRV9361_SOM';
            testCase.author = 'ADI';
            Frequencies = (0.4:0.25:5.8).*1e9;
            testCase.LoopIterationsPerFrequency = 4;
%             testCase.EnabledCalibration = false;
            
            Tx = struct;
            Tx.Device = @()adi.AD9361.Tx();
            Tx.Gain = -10;
            Tx.Address = 'ip:10.48.65.110';
            Tx.SamplingRate = 15.36e6;
            
            Rx = struct;
            Rx.Device = @()N9030A();
            Rx.Gain = 10;
            Rx.Address = '10.48.65.120';
            Rx.SamplingRate = 15.36e6;
            Rx.GainMode = NaN;
            
            % ADRV9361 Specific parameters
            Tx.CustomFilterFilename = 'LTE10_MHz.ftr';
            
            ExtendedTxParams = [];
            ExtendedRxParams = [];
            
            %% Check hardware connected
            testCase.CheckDevice('ip',Tx.Device,Tx.Address(4:end),true);
            
            %% Run Test
            logs = testCase.SDRLoopbackLTEEVMTest('LTE10',Frequencies,...
                Tx,Rx,ExtendedTxParams,ExtendedRxParams,testname);
            
            %% Log data
            filename = [testname,'_',num2str(int32(now)),'.mat'];
            save(filename,'logs');
            
        end

        function LTE10_MXG_To_ADRV9361(testCase)
            
            import matlab.unittest.plugins.DiagnosticsRecordingPlugin
            
            %% Test configs
            Frequencies = (0.4:0.1:5).*1e9;
            testname = 'LTE10_ADRV9361_SOM_RX_MXG';
            testCase.author = 'ADI';
            
            testCase.LoopIterationsPerFrequency = 4;
%             testCase.EnabledCalibration = false;
            
            Tx = struct;
            Tx.Device = @()N5182B();
            Tx.Gain = -20;
            Tx.Address = '10.48.65.125';
            Tx.SamplingRate = 15.36e6;
            
            Rx = struct;
            Rx.Device = @()adi.AD9361.Rx();
            Rx.Gain = NaN; %% Does not matter
            Rx.Address = 'ip:10.48.65.110';
%             Rx.SamplingRate = 122.88e6;
            Rx.SamplingRate = 15.36e6;
            Rx.GainMode = 'slow_attack';
            
            % ADRV9361 Specific parameters
            Rx.CustomFilterFilename = 'LTE10_MHz.ftr';
            
            ExtendedTxParams = [];
            ExtendedRxParams = [];
            
            %% Check hardware connected
            testCase.CheckDevice('ip',Rx.Device,Rx.Address(4:end),false);
            
            %% Run Test
            logs = testCase.SDRLoopbackLTEEVMTest('LTE10',Frequencies,...
                Tx,Rx,ExtendedTxParams,ExtendedRxParams,testname);
            
            %% Log data
            filename = [testname,'_',num2str(int32(now)),'.mat'];
            save(filename,'logs');
            
        end       
        
    end
    
end
