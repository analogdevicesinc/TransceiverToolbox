classdef (Abstract) LTETests < matlab.unittest.TestCase & ...
        LTE_DemodTMN & HardwareTests
    properties (TestParameter)
        TMNs = {'3.1','3.1a','3.1b','3.2','3.3'};
        BWs = {'5MHz','10MHz','15MHz','20MHz'};        
    end
    
    properties (Abstract, TestParameter) % TRx-dependent
        LOFreqs        
    end
    
    properties (Abstract, Access = protected)
        Tx
        Rx
    end
    
    properties (Abstract) % demodulation-related
        ClassName
        LOFreq
        TMN
        BW
        TestSettings
    end
    
    properties (Access = protected)
        root
    end
    
    properties (Access = protected)
        ETM
        EVMData
    end
    
    methods (TestClassSetup)
        function addpaths(testCase)
            here = mfilename('fullpath');
            here = strsplit(here,filesep);
            if ispc
                here = fullfile(here{1:end-1});
            else
                here = fullfile(filesep,here{1:end-1});
            end
            testCase.root = here;
        end
    end
    
    methods (Static, Access = protected)
        function SamplesPerFrame = setRxSamplesPerFrame(BW)
            switch (BW)
                case {'5MHz', '10MHz'}
                    SamplesPerFrame = 2^19;        
                case {'15MHz', '20MHz'}
                    SamplesPerFrame = 2^20;        
                otherwise
                    st = dbstack;
                    error("unknown option %s in %s", BW, st.name);
            end
        end
    end
    
    methods (Abstract, Test)
        TestAcrossLOFreqsTMNsBWs(testCase, LOFreqs, TMNs, BWs)
    end
    
    methods (Abstract, Access = protected)
        ConfigHW(testCase)
    end
    
    methods (Access = protected)
        function Gen_LTE_TMN_Wf_And_Transmit(testCase)
            % generate LTE waveform
            [dataOutput, testCase.ETM] = LTE_DemodTMN.GenLTEWaveform(testCase.TMN, testCase.BW);
            
            % transmit data
            testCase.Tx(dataOutput);
        end
        
        function Receive_LTE_TMN_Wf_And_Demod(testCase)
            % receive data
            for k=1:20
                len = 0;
                while len == 0
                    [dataInput, len] = testCase.Rx();
                end
            end
            dataInput = double(dataInput);   
            
            % demodulate received LTE waveform
            testCase.EVMData = LTE_DemodTMN.DemodLTEWaveform(dataInput, testCase.ETM);
        end
        
        function ValidateEVM(testCase)
            import matlab.unittest.constraints.IsLessThan
            
            testCase.assertThat(testCase.EVMData.evmRMSCh.PBCH, IsLessThan(5), 'evmPBCH');
            testCase.assertThat(testCase.EVMData.evmRMSCh.PCFICH, IsLessThan(5), 'evmPCFICH');
            testCase.assertThat(testCase.EVMData.evmRMSCh.PHICH, IsLessThan(5), 'evmPHICH');
            testCase.assertThat(testCase.EVMData.evmRMSCh.PDCCH, IsLessThan(5), 'evmPDCCH');
            testCase.assertThat(testCase.EVMData.evmRMSCh.RS, IsLessThan(5), 'evmRS');
            testCase.assertThat(testCase.EVMData.evmRMSCh.PSS, IsLessThan(5), 'evmPSS');
            testCase.assertThat(testCase.EVMData.evmRMSCh.SSS, IsLessThan(5), 'evmSSS');
            testCase.assertThat(testCase.EVMData.evmRMSCh.PDSCH, IsLessThan(5), 'evmPDSCH');
        end
        
        function RunTest(testCase, TxClass, RxClass)
            % configure hardware
            testCase.ConfigHW(TxClass, RxClass);
            
            % transmit waveform
            testCase.Gen_LTE_TMN_Wf_And_Transmit();
            
            % receive waveform and demodulate
            testCase.Receive_LTE_TMN_Wf_And_Demod();            
            
            % validate and record log data
            testCase.ValidateEVM();
            
            % release Tx and Rx system objects            
            release(testCase.Tx);
            release(testCase.Rx);
        end
    end
end