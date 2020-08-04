classdef testAppGUI < matlab.uitest.TestCase    
    properties (TestParameter)
        PDSCHConstellation = {'1024QAM' , '256QAM', '64QAM', '16QAM', 'QPSK'};
        TMN = {'3.1b', '3.1a', '3.1', '3.2', '3.3'};
        BW = {'5 MHz', '10 MHz', '15 MHz', '20 MHz'};
        RBs = {25, 50, 75, 100};
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
        
        function testErrorVectorSpectrumPlotOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.EVMScCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.evmSCAxes, 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testErrorVectorTimePlotOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.EVMSymsCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.evmSymsAxes, 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testErrorVectorGridPlotOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.EVMRbCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.evmRBAxes, 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testConstellationPlotOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.ConstCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.constAxes, 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testPSDPlotOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PSDCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            isEmptyAxes = isempty(get(app.PSDAxes, 'Children'));
            testCase.verifyTrue(isEmptyAxes);
        end
        
        function testSSSChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.SSSCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            SSSConstellationMarkers = get(app.constAxes, 'Children');
            noSSSConstellationMarkers = true;
            for ii = 1:numel(SSSConstellationMarkers)
                if isequal(SSSConstellationMarkers(ii).Color, [0 0 1])
                    noSSSConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noSSSConstellationMarkers);
            
            SSSErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noSSSErrorVectorTimeMarkers = true;
            for ii = 1:numel(SSSErrorVectorTimeMarkers)
                if isequal(SSSErrorVectorTimeMarkers(ii).Color, [0 0 1])
                    noSSSErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noSSSErrorVectorTimeMarkers);
            
            SSSErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noSSSErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(SSSErrorVectorSpectrumMarkers)
                if isequal(SSSErrorVectorSpectrumMarkers(ii).Color, [0 0 1])
                    noSSSErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noSSSErrorVectorSpectrumMarkers);
            
            SSSErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noSSSErrorVectorGridMarkers = true;
            for ii = 1:numel(SSSErrorVectorGridMarkers)
                if isequal(SSSErrorVectorGridMarkers(ii).Color, [0 0 1])
                    noSSSErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noSSSErrorVectorGridMarkers);
        end
        
        function testPDSCHChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PDSCHCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PDSCHConstellationMarkers = get(app.constAxes, 'Children');
            noPDSCHConstellationMarkers = true;
            for ii = 1:numel(PDSCHConstellationMarkers)
                if isequal(PDSCHConstellationMarkers(ii).Color, [1 0 0])
                    noPDSCHConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDSCHConstellationMarkers);
            
            PDSCHErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPDSCHErrorVectorTimeMarkers = true;
            for ii = 1:numel(PDSCHErrorVectorTimeMarkers)
                if isequal(PDSCHErrorVectorTimeMarkers(ii).Color, [1 0 0])
                    noPDSCHErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDSCHErrorVectorTimeMarkers);
            
            PDSCHErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPDSCHErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PDSCHErrorVectorSpectrumMarkers)
                if isequal(PDSCHErrorVectorSpectrumMarkers(ii).Color, [1 0 0])
                    noPDSCHErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDSCHErrorVectorSpectrumMarkers);
            
            PDSCHErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPDSCHErrorVectorGridMarkers = true;
            for ii = 1:numel(PDSCHErrorVectorGridMarkers)
                if isequal(PDSCHErrorVectorGridMarkers(ii).Color, [1 0 0])
                    noPDSCHErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDSCHErrorVectorGridMarkers);
        end
        
        function testPBCHChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PBCHCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PBCHConstellationMarkers = get(app.constAxes, 'Children');
            noPBCHConstellationMarkers = true;
            for ii = 1:numel(PBCHConstellationMarkers)
                if isequal(PBCHConstellationMarkers(ii).Color, [0 1 0])
                    noPBCHConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPBCHConstellationMarkers);
            
            PBCHErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPBCHErrorVectorTimeMarkers = true;
            for ii = 1:numel(PBCHErrorVectorTimeMarkers)
                if isequal(PBCHErrorVectorTimeMarkers(ii).Color, [0 1 0])
                    noPBCHErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPBCHErrorVectorTimeMarkers);
            
            PBCHErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPBCHErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PBCHErrorVectorSpectrumMarkers)
                if isequal(PBCHErrorVectorSpectrumMarkers(ii).Color, [0 1 0])
                    noPBCHErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPBCHErrorVectorSpectrumMarkers);
            
            PBCHErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPBCHErrorVectorGridMarkers = true;
            for ii = 1:numel(PBCHErrorVectorGridMarkers)
                if isequal(PBCHErrorVectorGridMarkers(ii).Color, [0 1 0])
                    noPBCHErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPBCHErrorVectorGridMarkers);
        end       
        
        function testPCFICHChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PCFICHCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PCFICHConstellationMarkers = get(app.constAxes, 'Children');
            noPCFICHConstellationMarkers = true;
            for ii = 1:numel(PCFICHConstellationMarkers)
                if isequal(PCFICHConstellationMarkers(ii).Color, [0.5 0 0.5])
                    noPCFICHConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPCFICHConstellationMarkers);
            
            PCFICHErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPCFICHErrorVectorTimeMarkers = true;
            for ii = 1:numel(PCFICHErrorVectorTimeMarkers)
                if isequal(PCFICHErrorVectorTimeMarkers(ii).Color, [0.5 0 0.5])
                    noPCFICHErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPCFICHErrorVectorTimeMarkers);
            
            PCFICHErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPCFICHErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PCFICHErrorVectorSpectrumMarkers)
                if isequal(PCFICHErrorVectorSpectrumMarkers(ii).Color, [0.5 0 0.5])
                    noPCFICHErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPCFICHErrorVectorSpectrumMarkers);
            
            PCFICHErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPCFICHErrorVectorGridMarkers = true;
            for ii = 1:numel(PCFICHErrorVectorGridMarkers)
                if isequal(PCFICHErrorVectorGridMarkers(ii).Color, [0.5 0 0.5])
                    noPCFICHErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPCFICHErrorVectorGridMarkers);
        end 
        
        function testPHICHChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PHICHCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PHICHConstellationMarkers = get(app.constAxes, 'Children');
            noPHICHConstellationMarkers = true;
            for ii = 1:numel(PHICHConstellationMarkers)
                if isequal(PHICHConstellationMarkers(ii).Color, [1 0.6 0])
                    noPHICHConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPHICHConstellationMarkers);
            
            PHICHErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPHICHErrorVectorTimeMarkers = true;
            for ii = 1:numel(PHICHErrorVectorTimeMarkers)
                if isequal(PHICHErrorVectorTimeMarkers(ii).Color, [1 0.6 0])
                    noPHICHErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPHICHErrorVectorTimeMarkers);
            
            PHICHErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPHICHErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PHICHErrorVectorSpectrumMarkers)
                if isequal(PHICHErrorVectorSpectrumMarkers(ii).Color, [1 0.6 0])
                    noPHICHErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPHICHErrorVectorSpectrumMarkers);
            
            PHICHErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPHICHErrorVectorGridMarkers = true;
            for ii = 1:numel(PHICHErrorVectorGridMarkers)
                if isequal(PHICHErrorVectorGridMarkers(ii).Color, [1 0.6 0])
                    noPHICHErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPHICHErrorVectorGridMarkers);
        end
        
        function testPDCCHChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PDCCHCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PDCCHConstellationMarkers = get(app.constAxes, 'Children');
            noPDCCHConstellationMarkers = true;
            for ii = 1:numel(PDCCHConstellationMarkers)
                if isequal(PDCCHConstellationMarkers(ii).Color, [1 1 0])
                    noPDCCHConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDCCHConstellationMarkers);
            
            PDCCHErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPDCCHErrorVectorTimeMarkers = true;
            for ii = 1:numel(PDCCHErrorVectorTimeMarkers)
                if isequal(PDCCHErrorVectorTimeMarkers(ii).Color, [1 1 0])
                    noPDCCHErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDCCHErrorVectorTimeMarkers);
            
            PDCCHErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPDCCHErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PDCCHErrorVectorSpectrumMarkers)
                if isequal(PDCCHErrorVectorSpectrumMarkers(ii).Color, [1 1 0])
                    noPDCCHErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDCCHErrorVectorSpectrumMarkers);
            
            PDCCHErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPDCCHErrorVectorGridMarkers = true;
            for ii = 1:numel(PDCCHErrorVectorGridMarkers)
                if isequal(PDCCHErrorVectorGridMarkers(ii).Color, [1 1 0])
                    noPDCCHErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPDCCHErrorVectorGridMarkers);
        end       
        
        function testPSSChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.PSSCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            PSSConstellationMarkers = get(app.constAxes, 'Children');
            noPSSConstellationMarkers = true;
            for ii = 1:numel(PSSConstellationMarkers)
                if isequal(PSSConstellationMarkers(ii).Color, [1 0 1])
                    noPSSConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPSSConstellationMarkers);
            
            PSSErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noPSSErrorVectorTimeMarkers = true;
            for ii = 1:numel(PSSErrorVectorTimeMarkers)
                if isequal(PSSErrorVectorTimeMarkers(ii).Color, [1 0 1])
                    noPSSErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPSSErrorVectorTimeMarkers);
            
            PSSErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noPSSErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(PSSErrorVectorSpectrumMarkers)
                if isequal(PSSErrorVectorSpectrumMarkers(ii).Color, [1 0 1])
                    noPSSErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPSSErrorVectorSpectrumMarkers);
            
            PSSErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noPSSErrorVectorGridMarkers = true;
            for ii = 1:numel(PSSErrorVectorGridMarkers)
                if isequal(PSSErrorVectorGridMarkers(ii).Color, [1 0 1])
                    noPSSErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noPSSErrorVectorGridMarkers);
        end        
        
        function testRSChannelOnOff(testCase)
            app = LTEApp;
            testCase.addTeardown(@delete,app);
            
            testCase.press(app.RSCheckBox);
            testCase.assertFalse(app.PlutoNotFound, 'Test Halted. Pluto Not Found.');
            testCase.press(app.StepButton);
            
            RSConstellationMarkers = get(app.constAxes, 'Children');
            noRSConstellationMarkers = true;
            for ii = 1:numel(RSConstellationMarkers)
                if isequal(RSConstellationMarkers(ii).Color, [0 1 1])
                    noRSConstellationMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noRSConstellationMarkers);
            
            RSErrorVectorTimeMarkers = get(app.evmSymsAxes, 'Children');
            noRSErrorVectorTimeMarkers = true;
            for ii = 1:numel(RSErrorVectorTimeMarkers)
                if isequal(RSErrorVectorTimeMarkers(ii).Color, [0 1 1])
                    noRSErrorVectorTimeMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noRSErrorVectorTimeMarkers);
            
            RSErrorVectorSpectrumMarkers = get(app.evmSCAxes, 'Children');
            noRSErrorVectorSpectrumMarkers = true;
            for ii = 1:numel(RSErrorVectorSpectrumMarkers)
                if isequal(RSErrorVectorSpectrumMarkers(ii).Color, [0 1 1])
                    noRSErrorVectorSpectrumMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noRSErrorVectorSpectrumMarkers);
            
            RSErrorVectorGridMarkers = get(app.evmRBAxes, 'Children');
            noRSErrorVectorGridMarkers = true;
            for ii = 1:numel(RSErrorVectorGridMarkers)
                if isequal(RSErrorVectorGridMarkers(ii).Color, [0 1 1])
                    noRSErrorVectorGridMarkers = false;
                    break;
                end
            end
            testCase.verifyTrue(noRSErrorVectorGridMarkers);
        end        
    end    
end