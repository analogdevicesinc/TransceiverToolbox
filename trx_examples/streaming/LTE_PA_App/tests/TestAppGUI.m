classdef TestAppGUI < matlab.uitest.TestCase    
    properties (TestParameter)
        PDSCHConstellation = {'1024QAM' , '256QAM', '64QAM', '16QAM', 'QPSK'};
        TMN = {'3.1b', '3.1a', '3.1', '3.2', '3.3'};
        BW = {'5 MHz', '10 MHz', '15 MHz', '20 MHz'};
        RBs = {25, 50, 75, 100};
        axesName = {'evmSyms','evmRB', 'evmSC', 'PSD', 'const'};
        plotCheckBox = {'EVMSyms','EVMRb', 'EVMSc', 'PSD', 'Const'};
        channelCheckBox = {'PBCH', 'PCFICH', 'PHICH', 'PDCCH', 'RS', 'PSS', 'SSS', 'PDSCH'};
        channelColor = {[0 1 0], [0.5 0 0.5], [1 0.6 0], [1 1 0], [0 1 1], [1 0 1], [0 0 1], [1 0 0]};
    end
    
    methods(TestClassSetup)
        function setPath(~)
            addpath('..\');            
        end
    end

    methods (Test, ParameterCombination='sequential')
        function testPDSCHConstellation(testCase, PDSCHConstellation, TMN)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.choose(app.TMNDropDown, PDSCHConstellation);
            expTMN = TMN;
            obsTMN = app.TMNValue;
            testCase.verifyEqual(obsTMN, expTMN);
        end        
        
        function testBWSelection(testCase, BW, RBs)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.choose(app.BWDropDown, BW);
            expRBs = RBs;
            obsRBs = app.RBs;
            expSCs = expRBs*12;
            obsSCs = app.numSCs;
            
            testCase.verifyEqual(obsRBs, expRBs);
            testCase.verifyEqual(obsSCs, expSCs);
        end
        
        function testPlotsOnOff(testCase, axesName, plotCheckBox)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.(strcat(plotCheckBox, 'CheckBox')));
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.(strcat(axesName, 'Axes')), 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testChannelOnOff(testCase, channelCheckBox, channelColor)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.(strcat(channelCheckBox, 'CheckBox')));
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            ConstellationMarkers = get(app.constAxes, 'Children');
            noConstellationMarkers = true;
            for ii = 1:numel(ConstellationMarkers)
                if isequal(ConstellationMarkers(ii).Color, channelColor)
                    noConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noConstellationMarkers);
            
            ErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noErrorVectorTimeMarkers = true;
            for ii = 1:numel(ErrorVectorTimeMarkers)
                if isequal(ErrorVectorTimeMarkers(ii).Color, channelColor)
                    noErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noErrorVectorTimeMarkers);
            
            ErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(ErrorVectorSpectrumMarkers)
                if isequal(ErrorVectorSpectrumMarkers(ii).Color, channelColor)
                    noErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noErrorVectorSpectrumMarkers);
            
            ErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noErrorVectorGridMarkers = true;
            for ii = 1:numel(ErrorVectorGridMarkers)
                if isequal(ErrorVectorGridMarkers(ii).Color, channelColor)
                    noErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noErrorVectorGridMarkers);
        end        
    end
    
    methods (Test)
        function testStepButton(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);          
            
            isEmptyErrorVectorTime = isempty(get(app.evmSymsAxes, 'Children'));
            testCase.verifyFalse(isEmptyErrorVectorTime);
            isEmptyErrorVectorSpectrum = isempty(get(app.evmSCAxes, 'Children'));
            testCase.verifyFalse(isEmptyErrorVectorSpectrum);
            isEmptyErrorVectorGrid = isempty(get(app.evmRBAxes, 'Children'));
            testCase.verifyFalse(isEmptyErrorVectorGrid);
            isEmptyScatterPlot = isempty(get(app.constAxes, 'Children'));
            testCase.verifyFalse(isEmptyScatterPlot);
            isEmptyPSDPlot = isempty(get(app.PSDAxes, 'Children'));
            testCase.verifyFalse(isEmptyPSDPlot);
        end
    end    
end