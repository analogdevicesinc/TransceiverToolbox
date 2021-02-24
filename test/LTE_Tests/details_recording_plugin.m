classdef details_recording_plugin < matlab.unittest.plugins.TestRunnerPlugin
    properties (Constant,Access = private)
        TxAttnField = 'TxAttn';
        RxGainControlModeField = 'RxGainControlMode';
        ClassNameField = 'ClassName';
        LOFreqField = 'LOFreq';
        TMNField = 'TMN';
        BWField = 'BW';
        evmPBCHField = 'evmPBCH';
        evmPCFICHField = 'evmPCFICH';
        evmPHICHField = 'evmPHICH';
        evmPDCCHField = 'evmPDCCH';
        evmRSField = 'evmRS';
        evmPSSField = 'evmPSS';
        evmSSSField = 'evmSSS';
        evmPDSCHField = 'evmPDSCH';        
    end

    methods (Access = protected)
        function runSession(plugin,pluginData)
            resultDetails = pluginData.ResultDetails;
            resultDetails.append(plugin.ClassNameField,{})
            resultDetails.append(plugin.LOFreqField,{})
            resultDetails.append(plugin.evmPBCHField,{})
            resultDetails.append(plugin.evmPCFICHField,{})
            resultDetails.append(plugin.evmPHICHField,{})
            resultDetails.append(plugin.evmPDCCHField,{})
            resultDetails.append(plugin.evmRSField,{})
            resultDetails.append(plugin.evmPSSField,{})
            resultDetails.append(plugin.evmSSSField,{})
            resultDetails.append(plugin.evmPDSCHField,{})
            runSession@matlab.unittest.plugins.TestRunnerPlugin(plugin,pluginData);
        end
    end

    methods (Access = protected)
        function fixture = createSharedTestFixture(plugin, pluginData)
            fixture = createSharedTestFixture@...
                matlab.unittest.plugins.TestRunnerPlugin(plugin, pluginData);
            resultDetails = pluginData.ResultDetails;
            fixture.addlistener('AssertionPassed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
            fixture.addlistener('AssertionFailed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
        end

        function testCase = createTestClassInstance(plugin,pluginData)
            testCase = createTestClassInstance@...
                matlab.unittest.plugins.TestRunnerPlugin(plugin,pluginData);
            resultDetails = pluginData.ResultDetails;
            testCase.addlistener('AssertionPassed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
            testCase.addlistener('AssertionFailed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
        end

        function testCase = createTestMethodInstance(plugin,pluginData)
            testCase = createTestMethodInstance@...
                matlab.unittest.plugins.TestRunnerPlugin(plugin,pluginData);
            resultDetails = pluginData.ResultDetails;
            testCase.addlistener('AssertionPassed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
            testCase.addlistener('AssertionFailed',...
                @(~,evd)plugin.reactToAssertion(evd,resultDetails));
        end
    end

    methods (Access = private)
        function reactToAssertion(plugin,evd,resultDetails)
            if strcmp(evd.TestDiagnostic, 'evmPBCH')
                resultDetails.append(plugin.ClassNameField,{evd.Source.ClassName})
                resultDetails.append(plugin.TxAttnField,{evd.Source.TestSettings.TxGain})
                resultDetails.append(plugin.RxGainControlModeField,{evd.Source.TestSettings.RxGainMode})
                resultDetails.append(plugin.LOFreqField,{evd.Source.LOFreq})
                resultDetails.append(plugin.TMNField,{evd.Source.TMN})
                resultDetails.append(plugin.BWField,{evd.Source.BW})
                
                resultDetails.append(plugin.evmPBCHField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmPCFICH')
                resultDetails.append(plugin.evmPCFICHField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmPHICH')
                resultDetails.append(plugin.evmPHICHField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmPDCCH')
                resultDetails.append(plugin.evmPDCCHField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmRS')
                resultDetails.append(plugin.evmRSField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmPSS')
                resultDetails.append(plugin.evmPSSField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmSSS')
                resultDetails.append(plugin.evmSSSField,{evd.ActualValue})
            elseif strcmp(evd.TestDiagnostic, 'evmPDSCH')
                resultDetails.append(plugin.evmPDSCHField,{evd.ActualValue})
            end            
        end
    end
end
