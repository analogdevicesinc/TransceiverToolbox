classdef LTEApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure  matlab.ui.Figure
        Panel                         matlab.ui.container.Panel
        TestConfigurationButtonGroup  matlab.ui.container.ButtonGroup
        RMCButton                     matlab.ui.control.RadioButton
        ETMLabel                      matlab.ui.control.Label
        dBPercentDropDown             matlab.ui.control.DropDown
        TMNDropDown                   matlab.ui.control.DropDown
        TMNDropDownLabel              matlab.ui.control.Label
        BWDropDown                    matlab.ui.control.DropDown
        BWDropDownLabel               matlab.ui.control.Label
        RCDropDown                    matlab.ui.control.DropDown
        RCDropDownLabel               matlab.ui.control.Label
        Panel_14                      matlab.ui.container.Panel
        GridLayout                    matlab.ui.container.GridLayout
        PlayStopButton                matlab.ui.control.Button
        StepButton                    matlab.ui.control.Button
        DocButton                     matlab.ui.control.Button
        GridButton                    matlab.ui.control.Button
        StatusLight                   matlab.ui.control.Lamp
        LOEditFieldLabel              matlab.ui.control.Label
        LOEditField                   matlab.ui.control.NumericEditField
        MHzLabel                      matlab.ui.control.Label
        VerLabel                      matlab.ui.control.Label
        FindPlutoButton               matlab.ui.control.Button
        ListBox                       matlab.ui.control.ListBox
        Panel_8                       matlab.ui.container.Panel
        PSDAxes                       matlab.ui.control.UIAxes
        Panel_9                       matlab.ui.container.Panel
        evmSymsAxes                   matlab.ui.control.UIAxes
        Panel_10                      matlab.ui.container.Panel
        evmSCAxes                     matlab.ui.control.UIAxes
        Panel_11                      matlab.ui.container.Panel
        evmRBAxes                     matlab.ui.control.UIAxes
        Panel_12                      matlab.ui.container.Panel
        constAxes                     matlab.ui.control.UIAxes
        Panel_13                      matlab.ui.container.Panel
        Label                         matlab.ui.control.Label
        Image                         matlab.ui.control.Image
        Panel_4                       matlab.ui.container.Panel
        SummaryTable1                  matlab.ui.control.Table
        SummaryTable2                  matlab.ui.control.Table
        SummaryTable3                  matlab.ui.control.Table
        PDSCHConstellationLabel
        PDSCHConstellationValLabel
        PowerBalacingConstellationLabel
        PowerBalacingConstellationValLabel
        PBCHCheckBox
        PCFICHCheckBox
        PHICHCheckBox
        PDCCHCheckBox
        RSCheckBox
        PSSCheckBox
        SSSCheckBox
        PDSCHCheckBox
        EVMScCheckBox
        EVMRbCheckBox
        EVMSymsCheckBox
        ConstCheckBox
        PSDCheckBox
        TabGroup
        Tab1
        Tab2
        Tab3
    end
    
    properties (Access = private) 
        EVMSymbolRMSPlotLine
        EVMSymbolPeakPlotLine
        EVMScRMSPlotLine
        EVMScRMSAvgPlotLine
        EVMRbRMSAvgPlotLine
        EVMSymbolRMSAvgPlotLine
        ConstPlot
        EVMRbPlot
        EVMPlot
        
        evmRSSymPlot
        evmPSSSymPlot
        evmSSSSymPlot
        evmPBCHSymPlot
        evmPCFICHSymPlot
        evmPHICHSymPlot
        evmPDCCHSymPlot
        evmPDSCHSymPlot
        
        evmRSRbPlot
        evmPSSRbPlot
        evmSSSRbPlot
        evmPBCHRbPlot
        evmPCFICHRbPlot
        evmPHICHRbPlot
        evmPDCCHRbPlot
        evmPDSCHRbPlot
        
        evmRSScPlot
        evmPSSScPlot
        evmSSSScPlot
        evmPBCHScPlot
        evmPCFICHScPlot
        evmPHICHScPlot
        evmPDCCHScPlot
        evmPDSCHScPlot
                
        evmScRMSAvg = []
        evmRbRMSAvg = []
        evmSymbolRMSAvg = []        
        numSCs
        RBs
        evmGridFrame = []
    end
    
    properties (SetAccess = private, SetObservable)
        LTEAppInternalsProp
    end
    
    properties (Access = public)
        PlutoNotFound = true   
        TMNValue
        SummaryTable1_Data
        SummaryTable2_Data
        SummaryTable3_Data
        PlayStopButtonState % true - Play; false - Stop
        StepOrPlayButton
        GridAxes
        GridFig
        GridFigTitle
    end
    
    events
        Play
        Stop
    end
    
    methods (Access = public)
    end    

    % Callbacks that handle component events
    methods (Access = private)
        
        % Method to handle change in CyclicPrefix
        function handleCyclicPrefix(app, ~, ~)
            app.SummaryTable1_Data(1, 1) = ...
                {sprintf('%s', app.LTEAppInternalsProp.CyclicPrefix)};              
        end
        
        % Method to handle change in NCellID
        function handleNCellID(app, ~, ~)
            app.SummaryTable1_Data(2, 1) = ...
                {sprintf('%d', num2str(app.LTEAppInternalsProp.NCellID))};                        
        end
        
        % Method to handle change in FrameOffset
        function handleFrameOffset(app, ~, ~)
            app.SummaryTable1_Data(3, 1) = ...
                {sprintf('%2.3f ms', 1e3*app.LTEAppInternalsProp.FrameOffset)};
        end
        
        % Method to handle change in FrameOffset
        function handleFreqOffset(app, ~, ~)
            app.SummaryTable1_Data(4, 1) = ...
                {sprintf('%2.3f Hz (%2.3f ppb)', app.LTEAppInternalsProp.FreqOffset, ...
                1e3*app.LTEAppInternalsProp.FreqOffset/app.LOEditField.Value)};
        end
        
        % Method to handle change in IQOffset
        function handleIQOffset(app, ~, ~)
            app.SummaryTable1_Data(5, 1) = ...
                {sprintf('%2.3f', ...
                app.LTEAppInternalsProp.IQOffset)};                
        end
    
        % Method to handle change in PSD_y
        function handlePSD(app, ~, ~)
            if (app.PSDCheckBox.Value)
            app.PSDAxes.XLim = ...
                [-0.5 0.5]*app.LTEAppInternalsProp.SamplingRate*1e-6;
            plot(app.PSDAxes, app.LTEAppInternalsProp.PSD_x*1e-6, ...
                app.LTEAppInternalsProp.PSD_y, 'y'); 
            end
        end
    
        % Method to handle change in PBCH EVM
        function handlePBCH_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(1, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_pbch_RMS))}; 
            else
                app.SummaryTable2_Data(1, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_pbch_RMS)}; 
            end
            app.SummaryTable3_Data(1, 1) = app.SummaryTable3_Data(1, 1)+app.LTEAppInternalsProp.evm_pbch_RMS;
            app.SummaryTable3_Data(1, 2) = app.SummaryTable3_Data(1, 2)+1;
        end
        
        % Method to handle change in PCFICH EVM
        function handlePCFICH_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(2, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_pcfich_RMS))}; 
            else
                app.SummaryTable2_Data(2, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_pcfich_RMS)}; 
            end
            app.SummaryTable3_Data(2, 1) = app.SummaryTable3_Data(2, 1)+app.LTEAppInternalsProp.evm_pcfich_RMS;
            app.SummaryTable3_Data(2, 2) = app.SummaryTable3_Data(2, 2)+1;
        end
        
        % Method to handle change in PHICH EVM
        function handlePHICH_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(3, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_phich_RMS))};  
            else
                app.SummaryTable2_Data(3, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_phich_RMS)};  
            end
            app.SummaryTable3_Data(3, 1) = app.SummaryTable3_Data(4, 1)+app.LTEAppInternalsProp.evm_phich_RMS;
            app.SummaryTable3_Data(3, 2) = app.SummaryTable3_Data(4, 2)+1;
        end
        
        % Method to handle change in PDCCH EVM
        function handlePDCCH_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(4, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_pdcch_RMS))};  
            else
                app.SummaryTable2_Data(4, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_pdcch_RMS)};  
            end
            app.SummaryTable3_Data(4, 1) = app.SummaryTable3_Data(3, 1)+app.LTEAppInternalsProp.evm_pdcch_RMS;
            app.SummaryTable3_Data(4, 2) = app.SummaryTable3_Data(3, 2)+1;
        end
        
        % Method to handle change in RS EVM
        function handleRS_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(5, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_rs_RMS))};  
            else
                app.SummaryTable2_Data(5, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_rs_RMS)};  
            end
            app.SummaryTable3_Data(5, 1) = app.SummaryTable3_Data(5, 1)+app.LTEAppInternalsProp.evm_rs_RMS;
            app.SummaryTable3_Data(5, 2) = app.SummaryTable3_Data(5, 2)+1;
        end
        
        % Method to handle change in PSS EVM
        function handlePSS_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(6, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_pss_RMS))};
            else
                app.SummaryTable2_Data(6, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_pss_RMS)};
            end
            app.SummaryTable3_Data(6, 1) = app.SummaryTable3_Data(6, 1)+app.LTEAppInternalsProp.evm_pss_RMS;
            app.SummaryTable3_Data(6, 2) = app.SummaryTable3_Data(6, 2)+1;
        end
        
        % Method to handle change in SSS EVM
        function handleSSS_RMS_EVM(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(7, 1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.evm_sss_RMS))};
            else
                app.SummaryTable2_Data(7, 1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.evm_sss_RMS)};                
            end
            app.SummaryTable3_Data(7, 1) = app.SummaryTable3_Data(7, 1)+app.LTEAppInternalsProp.evm_sss_RMS;
            app.SummaryTable3_Data(7, 2) = app.SummaryTable3_Data(7, 2)+1;
        end
        
        % Method to handle EVM vs Symbols plot
        function handleEVMSymbol(app, ~, ~)  
            if (app.EVMSymsCheckBox.Value)
            SubFrameIndex = app.LTEAppInternalsProp.SubFrameIndex;
            evmGrid = app.LTEAppInternalsProp.evmSC.EVMGrid;   
            evmSymbolRMS = app.LTEAppInternalsProp.evmSymbol.RMS;
            if (SubFrameIndex == 0)
                hold(app.evmSymsAxes,'off');
                
                app.evmSymbolRMSAvg = [app.evmSymbolRMSAvg zeros(140, 1)];
                app.evmSymbolRMSAvg(1:length(evmSymbolRMS), end) = evmSymbolRMS;
            else
                app.evmSymbolRMSAvg(SubFrameIndex*14+(1:length(evmSymbolRMS)), end) = evmSymbolRMS;  
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'RS')
                if (app.RSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xRS = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.RSInd, 14);
                        temp_xRS(1:length(newX)) = newX;
                        
                        temp_yRS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.RSEVMInd;
                        temp_yRS(1:length(newX)) = newY;
                                        
                        app.evmRSSymPlot = plot(app.evmSymsAxes, temp_xRS, temp_yRS,...
                            'csq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xRS = app.evmRSSymPlot.XData;
                        indm10 = find(temp_xRS == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.RSInd, 14);
                        
                        app.evmRSSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmRSSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.RSEVMInd;
                        
                        
                    end                    
                end                
            end

            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PSS')
                if (app.PSSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPSS = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PSSInd, 14);
                        temp_xPSS(1:length(newX)) = newX;
                        
                        temp_yPSS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PSSEVMInd;
                        temp_yPSS(1:length(newX)) = newY;
                                               
                        app.evmPSSSymPlot = plot(app.evmSymsAxes, temp_xPSS, temp_yPSS,...
                            'm', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xPSS = app.evmPSSSymPlot.XData;
                        indm10 = find(temp_xPSS == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PSSInd, 14);
                        
                        app.evmPSSSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPSSSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PSSEVMInd;
                        
                    end                    
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'SSS')
                if (app.SSSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xSSS = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.SSSInd, 14);
                        temp_xSSS(1:length(newX)) = newX;
                        
                        temp_ySSS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.SSSEVMInd;
                        temp_ySSS(1:length(newX)) = newY;
                                               
                        app.evmSSSSymPlot = plot(app.evmSymsAxes, temp_xSSS, temp_ySSS,...
                            'b', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xSSS = app.evmSSSSymPlot.XData;
                        indm10 = find(temp_xSSS == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.SSSInd, 14);
                        
                        app.evmSSSSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmSSSSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.SSSEVMInd;
                        
                    end
                end
            end
             
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PHICH')
                if (app.PHICHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPHICH = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PHICHInd, 14);
                        temp_xPHICH(1:length(newX)) = newX;
                        
                        temp_yPHICH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PHICHEVMInd;
                        temp_yPHICH(1:length(newX)) = newY;
                                               
                        app.evmPHICHSymPlot = plot(app.evmSymsAxes, temp_xPHICH, temp_yPHICH,...
                            'color', [1 0.6 0], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xPHICH = app.evmPHICHSymPlot.XData;
                        indm10 = find(temp_xPHICH == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PHICHInd, 14);
                        
                        app.evmPHICHSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPHICHSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PHICHEVMInd;
                        
                    end                    
                end
            end

            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PCFICH')
                if (app.PCFICHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPCFICH = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PCFICHInd, 14);
                        temp_xPCFICH(1:length(newX)) = newX;
                        
                        temp_yPCFICH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PCFICHEVMInd;
                        temp_yPCFICH(1:length(newX)) = newY;
                                               
                        app.evmPCFICHSymPlot = plot(app.evmSymsAxes, temp_xPCFICH, temp_yPCFICH,...
                            'color', [0.5 0 0.5], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xPCFICH = app.evmPCFICHSymPlot.XData;
                        indm10 = find(temp_xPCFICH == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PCFICHInd, 14);
                        
                        app.evmPCFICHSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPCFICHSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PCFICHEVMInd;
                        
                    end
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PBCH')
                if (app.PBCHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPBCH = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PBCHInd, 14);
                        temp_xPBCH(1:length(newX)) = newX;
                        
                        temp_yPBCH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PBCHEVMInd;
                        temp_yPBCH(1:length(newX)) = newY;
                                               
                        app.evmPBCHSymPlot = plot(app.evmSymsAxes, temp_xPBCH, temp_yPBCH,...
                            'g', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xPBCH = app.evmPBCHSymPlot.XData;
                        indm10 = find(temp_xPBCH == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PBCHInd, 14);
                        
                        app.evmPBCHSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPBCHSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PBCHEVMInd;
                        
                    end                    
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PDCCH')
                if (app.PDCCHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPDCCH = -10*ones(1e4, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PDCCHInd, 14);
                        temp_xPDCCH(1:length(newX)) = newX;
                        
                        temp_yPDCCH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PDCCHEVMInd;
                        temp_yPDCCH(1:length(newX)) = newY;
                                               
                        app.evmPDCCHSymPlot = plot(app.evmSymsAxes, temp_xPDCCH, temp_yPDCCH,...
                            'y', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSymsAxes,'on');                    
                    else
                        temp_xPDCCH = app.evmPDCCHSymPlot.XData;
                        indm10 = find(temp_xPDCCH == -10, 1);
                        newX = SubFrameIndex*14+...
                            mod(app.LTEAppInternalsProp.EqGridStruct.PDCCHInd, 14);
                        
                        app.evmPDCCHSymPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPDCCHSymPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PDCCHEVMInd;
                        
                    end
                end
            end
            
            if (SubFrameIndex == 0)                
                if (app.PDSCHCheckBox.Value)
                    temp_bigX = [];
                    temp_bigY = [];
                    for ii = 1:size(evmGrid, 1)
                        temp_x = 1:length(evmSymbolRMS);                    
                        temp_y = evmGrid(ii, :);
                        iy = (temp_y~=0);
                        temp_bigX = [temp_bigX temp_x(iy)-1];
                        temp_bigY = [temp_bigY temp_y(iy)];
                    end      
                    
                    temp_xPDSCH = -10*ones(1e6, 1);
                    temp_xPDSCH(1:length(temp_bigX)) = temp_bigX;
                    temp_yPDSCH = -10*ones(1e6, 1);
                    temp_yPDSCH(1:length(temp_bigX)) = temp_bigY;                        
                        
                    app.evmPDSCHSymPlot = plot(app.evmSymsAxes, temp_xPDSCH, ...
                            temp_yPDSCH, 'r', 'Marker', 'sq', 'MarkerSize', 2, ...
                            'LineStyle', 'none');                    
                end
                hold(app.evmSymsAxes,'on');
                app.EVMPlot = plot(app.evmSymsAxes, 1:14, mean(app.evmSymbolRMSAvg(1:length(evmSymbolRMS), end), 2), 'w', 'Linewidth', 1.5);
            else                
                if (app.PDSCHCheckBox.Value)
                    temp_bigX = [];
                    temp_bigY = [];
                    for ii = 1:size(evmGrid, 1)
                        temp_x = 1:length(evmSymbolRMS);                    
                        temp_y = evmGrid(ii, :);
                        iy = (temp_y~=0);
                        temp_bigX = [temp_bigX SubFrameIndex*14+(temp_x(iy)-1)];
                        temp_bigY = [temp_bigY temp_y(iy)];                        
                    end
                    
                    temp_xPDSCH = app.evmPDSCHSymPlot.XData;
                    indm10 = find(temp_xPDSCH == -10, 1);
                    
                    app.evmPDSCHSymPlot.XData(indm10+(0:length(temp_bigX)-1)) = temp_bigX;
                    app.evmPDSCHSymPlot.YData(indm10+(0:length(temp_bigX)-1)) = temp_bigY;
                    
                    app.EVMPlot = plot(app.evmSymsAxes, 1:SubFrameIndex*14+length(evmSymbolRMS), mean(app.evmSymbolRMSAvg(1:SubFrameIndex*14+length(evmSymbolRMS), end), 2), 'w', 'Linewidth', 1.5);
                end
            end 
            
            drawnow;  
            end
        end
        
        % Method to handle EVM vs Subcarriers plot
        function handleEVMSc(app, ~, ~)
            SubFrameIndex = app.LTEAppInternalsProp.SubFrameIndex;
            if (SubFrameIndex == 0)
                hold(app.evmRBAxes,'off');
                hold(app.evmSCAxes,'off');
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'RS')
                localRSInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.RSInd, app.numSCs);
                if (app.RSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xRS = -10*ones(1e4, 1);
                        newX = localRSInd;
                        temp_xRS(1:length(newX)) = newX;
                        
                        temp_yRS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.RSEVMInd;
                        temp_yRS(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmRSScPlot = plot(app.evmSCAxes, temp_xRS, temp_yRS,...
                            'c', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xRS = -10*ones(1e4, 1);
                        newX = 1+localRSInd/12;
                        temp_xRS(1:length(newX)) = newX;
                                                
                        if (app.EVMRbCheckBox.Value) 
                        app.evmRSRbPlot = plot(app.evmRBAxes, temp_xRS, temp_yRS,...
                            'c', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xRS = app.evmRSScPlot.XData;
                        indm10 = find(temp_xRS == -10, 1);
                        newX = localRSInd;
                        
                        app.evmRSScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmRSScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.RSEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xRS = app.evmRSRbPlot.XData;
                        indm10 = find(temp_xRS == -10, 1);
                        newX = 1+localRSInd/12;                        
                        
                        app.evmRSRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmRSRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.RSEVMInd;
                        hold(app.evmRBAxes,'on'); 
                        end
                    end                    
                end
            end
                        
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PSS')
                localPSSInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.PSSInd, app.numSCs);
                if (app.PSSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPSS = -10*ones(1e4, 1);
                        newX = localPSSInd;
                        temp_xPSS(1:length(newX)) = newX;
                        
                        temp_yPSS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PSSEVMInd;
                        temp_yPSS(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmPSSScPlot = plot(app.evmSCAxes, temp_xPSS, temp_yPSS,...
                            'm', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xPSS = -10*ones(1e4, 1);
                        newX = 1+localPSSInd/12;
                        temp_xPSS(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmPSSRbPlot = plot(app.evmRBAxes, temp_xPSS, temp_yPSS,...
                            'm', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xPSS = app.evmPSSScPlot.XData;
                        indm10 = find(temp_xPSS == -10, 1);
                        newX = localPSSInd;
                        
                        app.evmPSSScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPSSScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PSSEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xPSS = app.evmPSSRbPlot.XData;
                        indm10 = find(temp_xPSS == -10, 1);
                        newX = 1+localPSSInd/12;
                        
                        app.evmPSSRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPSSRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PSSEVMInd;
                        hold(app.evmRBAxes,'on');   
                        end
                    end                    
                end
            end

            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'SSS')
                localSSSInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.SSSInd, app.numSCs);
                if (app.SSSCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xSSS = -10*ones(1e4, 1);
                        newX = localSSSInd;
                        temp_xSSS(1:length(newX)) = newX;
                        
                        temp_ySSS = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.SSSEVMInd;
                        temp_ySSS(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmSSSScPlot = plot(app.evmSCAxes, temp_xSSS, temp_ySSS,...
                            'b', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xSSS = -10*ones(1e4, 1);
                        newX = 1+localSSSInd/12;
                        temp_xSSS(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmSSSRbPlot = plot(app.evmRBAxes, temp_xSSS, temp_ySSS,...
                            'b', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xSSS = app.evmSSSScPlot.XData;
                        indm10 = find(temp_xSSS == -10, 1);
                        newX = localSSSInd;
                        
                        app.evmSSSScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmSSSScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.SSSEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xSSS = app.evmSSSRbPlot.XData;
                        indm10 = find(temp_xSSS == -10, 1);
                        newX = 1+localSSSInd/12;
                        
                        app.evmSSSRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmSSSRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.SSSEVMInd;
                        hold(app.evmRBAxes,'on'); 
                        end
                    end                    
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PDCCH')
                localPDCCHInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.PDCCHInd, app.numSCs);
                if (app.PDCCHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPDCCH = -10*ones(1e4, 1);
                        newX = localPDCCHInd;
                        temp_xPDCCH(1:length(newX)) = newX;
                        
                        temp_yPDCCH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PDCCHEVMInd;
                        temp_yPDCCH(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmPDCCHScPlot = plot(app.evmSCAxes, temp_xPDCCH, temp_yPDCCH,...
                            'y', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xPDCCH = -10*ones(1e4, 1);
                        newX = 1+localPDCCHInd/12;
                        temp_xPDCCH(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmPDCCHRbPlot = plot(app.evmRBAxes, temp_xPDCCH, temp_yPDCCH,...
                            'y', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xPDCCH = app.evmPDCCHScPlot.XData;
                        indm10 = find(temp_xPDCCH == -10, 1);
                        newX = localPDCCHInd;
                        
                        app.evmPDCCHScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPDCCHScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PDCCHEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xPDCCH = app.evmPDCCHRbPlot.XData;
                        indm10 = find(temp_xPDCCH == -10, 1);
                        newX = 1+localPDCCHInd/12;
                        
                        app.evmPDCCHRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPDCCHRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PDCCHEVMInd;
                        hold(app.evmRBAxes,'on');  
                        end
                    end                    
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PHICH')
                localPHICHInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.PHICHInd, app.numSCs);
                if (app.PHICHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPHICH = -10*ones(1e4, 1);
                        newX = localPHICHInd;
                        temp_xPHICH(1:length(newX)) = newX;
                        
                        temp_yPHICH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PHICHEVMInd;
                        temp_yPHICH(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmPHICHScPlot = plot(app.evmSCAxes, temp_xPHICH, temp_yPHICH,...
                            'color', [1 0.6 0], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xPHICH = -10*ones(1e4, 1);
                        newX = 1+localPHICHInd/12;
                        temp_xPHICH(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmPHICHRbPlot = plot(app.evmRBAxes, temp_xPHICH, temp_yPHICH,...
                            'color', [1 0.6 0], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xPHICH = app.evmPHICHScPlot.XData;
                        indm10 = find(temp_xPHICH == -10, 1);
                        newX = localPHICHInd;
                        
                        app.evmPHICHScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPHICHScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PHICHEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xPHICH = app.evmPHICHRbPlot.XData;
                        indm10 = find(temp_xPHICH == -10, 1);
                        newX = 1+localPHICHInd/12;
                        
                        app.evmPHICHRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPHICHRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PHICHEVMInd;
                        hold(app.evmRBAxes,'on');  
                        end
                    end                    
                end                
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PCFICH')
                localPCFICHInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.PCFICHInd, app.numSCs);
                if (app.PCFICHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPCFICH = -10*ones(1e4, 1);
                        newX = localPCFICHInd;
                        temp_xPCFICH(1:length(newX)) = newX;
                        
                        temp_yPCFICH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PCFICHEVMInd;
                        temp_yPCFICH(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmPCFICHScPlot = plot(app.evmSCAxes, temp_xPCFICH, temp_yPCFICH,...
                            'color', [0.5 0 0.5], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xPCFICH = -10*ones(1e4, 1);
                        newX = 1+localPCFICHInd/12;
                        temp_xPCFICH(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmPCFICHRbPlot = plot(app.evmRBAxes, temp_xPCFICH, temp_yPCFICH,...
                            'color', [0.5 0 0.5], 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xPCFICH = app.evmPCFICHScPlot.XData;
                        indm10 = find(temp_xPCFICH == -10, 1);
                        newX = localPCFICHInd;
                        
                        app.evmPCFICHScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPCFICHScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PCFICHEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xPCFICH = app.evmPCFICHRbPlot.XData;
                        indm10 = find(temp_xPCFICH == -10, 1);
                        newX = 1+localPCFICHInd/12;
                        
                        app.evmPCFICHRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPCFICHRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PCFICHEVMInd;
                        hold(app.evmRBAxes,'on'); 
                        end
                    end                    
                end
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PBCH')
                localPBCHInd = ...
                    mod(app.LTEAppInternalsProp.EqGridStruct.PBCHInd, app.numSCs);
                if (app.PBCHCheckBox.Value)
                    if (SubFrameIndex == 0)
                        temp_xPBCH = -10*ones(1e4, 1);
                        newX = localPBCHInd;
                        temp_xPBCH(1:length(newX)) = newX;
                        
                        temp_yPBCH = -10*ones(1e4, 1);
                        newY = app.LTEAppInternalsProp.EqGridStruct.PBCHEVMInd;
                        temp_yPBCH(1:length(newX)) = newY;
                                               
                        if (app.EVMScCheckBox.Value)
                        app.evmPBCHScPlot = plot(app.evmSCAxes, temp_xPBCH, temp_yPBCH,...
                            'g', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        hold(app.evmSCAxes,'on');         
                        end
                        
                        temp_xPBCH = -10*ones(1e4, 1);
                        newX = 1+localPBCHInd/12;
                        temp_xPBCH(1:length(newX)) = newX;
                        
                        if (app.EVMRbCheckBox.Value) 
                        app.evmPBCHRbPlot = plot(app.evmRBAxes, temp_xPBCH, temp_yPBCH,...
                            'g', 'Marker','sq', 'MarkerSize', 2, 'LineStyle', 'none');
                        
                        hold(app.evmRBAxes,'on');
                        end
                        
                    else
                        if (app.EVMScCheckBox.Value)
                        temp_xPBCH = app.evmPBCHScPlot.XData;
                        indm10 = find(temp_xPBCH == -10, 1);
                        newX = localPBCHInd;
                        
                        app.evmPBCHScPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPBCHScPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PBCHEVMInd;
                        hold(app.evmSCAxes,'on');   
                        end
                        
                        if (app.EVMRbCheckBox.Value) 
                        temp_xPBCH = app.evmPBCHRbPlot.XData;
                        indm10 = find(temp_xPBCH == -10, 1);
                        newX = 1+localPBCHInd/12;
                        
                        app.evmPBCHRbPlot.XData(indm10+(0:length(newX)-1)) = newX;
                        app.evmPBCHRbPlot.YData(indm10+(0:length(newX)-1)) = ...
                            app.LTEAppInternalsProp.EqGridStruct.PBCHEVMInd;
                        hold(app.evmRBAxes,'on');    
                        end
                    end                    
                end
            end
            
            if (app.EVMScCheckBox.Value)                        
            evmGrid = app.LTEAppInternalsProp.evmSC.EVMGrid;
            evmScRMS = app.LTEAppInternalsProp.evmSC.RMS;
            
            app.evmScRMSAvg = [app.evmScRMSAvg evmScRMS];
            app.evmScRMSAvg(isnan(app.evmScRMSAvg))=0;
            tmpScAvg = zeros(size(app.evmScRMSAvg, 1), 1);
            for ii = 1:size(app.evmScRMSAvg, 1)
                tmp = app.evmScRMSAvg(ii, :);
                tmpNZ = find(tmp);
                if isempty(tmpNZ)
                    tmpScAvg(ii) = 0;
                else
                    tmpScAvg(ii) = mean(tmp(tmpNZ));
                end
            end
            if (app.LTEAppInternalsProp.SubFrameIndex == 0)
                if (app.PDSCHCheckBox.Value)
                    temp_bigX = [];
                    temp_bigY = [];
                    for ii = 1:size(evmGrid, 2)
                        temp_x = 1:length(evmScRMS);                    
                        temp_y = evmGrid(:, ii);
                        iy = (temp_y~=0);
                        temp_bigX = [temp_bigX temp_x(iy)];
                        temp_bigY = [temp_bigY temp_y(iy).'];
                    end                  
                    
                    temp_xPDSCH = -10*ones(1e6, 1);
                    temp_xPDSCH(1:length(temp_bigX)) = temp_bigX;
                    temp_yPDSCH = -10*ones(1e6, 1);
                    temp_yPDSCH(1:length(temp_bigX)) = temp_bigY;                        
                        
                    app.evmPDSCHScPlot = plot(app.evmSCAxes, temp_xPDSCH, ...
                            temp_yPDSCH, 'r', 'Marker', 'sq', 'MarkerSize', 2, ...
                            'LineStyle', 'none');   
                end
                hold(app.evmSCAxes,'on');
                app.EVMScRMSAvgPlotLine = plot(app.evmSCAxes, 1:length(evmScRMS), tmpScAvg, 'w', 'Linewidth', 1.5);            
                hold(app.evmRBAxes,'on');                    
            else
                if (app.PDSCHCheckBox.Value)
                    temp_bigX = [];
                    temp_bigY = [];
                    for ii = 1:size(evmGrid, 2)
                        temp_x = 1:length(evmScRMS);                    
                        temp_y = evmGrid(:, ii);
                        iy = (temp_y~=0);
                        temp_bigX = [temp_bigX temp_x(iy)];
                        temp_bigY = [temp_bigY temp_y(iy).'];
                    end                  
                    
                    temp_xPDSCH = app.evmPDSCHScPlot.XData;
                    indm10 = find(temp_xPDSCH == -10, 1);
                    
                    app.evmPDSCHScPlot.XData(indm10+(0:length(temp_bigX)-1)) = temp_bigX;
                    app.evmPDSCHScPlot.YData(indm10+(0:length(temp_bigX)-1)) = temp_bigY;
                end
                hold(app.evmSCAxes,'on');
                delete(app.EVMScRMSAvgPlotLine);
                app.EVMScRMSAvgPlotLine = plot(app.evmSCAxes, 1:length(evmScRMS), tmpScAvg, 'w', 'Linewidth', 1.5);            
                hold(app.evmRBAxes,'on');                    
            end 
            drawnow; 
            end
        end
        
        % Method to handle EVM vs resource blocks plot
        function handleEVMRb(app, ~, ~)
            if (app.EVMRbCheckBox.Value) 
            SubFrameIndex = app.LTEAppInternalsProp.SubFrameIndex; 
            delete(app.EVMRbRMSAvgPlotLine);
            evmGrid = app.LTEAppInternalsProp.evmSC.EVMGrid;
            evmRbRMS = app.LTEAppInternalsProp.evmRB.RMS;
            
            app.evmRbRMSAvg = [app.evmRbRMSAvg evmRbRMS];
            app.evmRbRMSAvg(isnan(app.evmRbRMSAvg))=0;
            tmpRbAvg = zeros(size(app.evmRbRMSAvg, 1), 1);
            for ii = 1:size(app.evmRbRMSAvg, 1)
                tmp = app.evmRbRMSAvg(ii, :);
                tmpNZ = find(tmp);
                if isempty(tmpNZ)
                    tmpRbAvg(ii) = 0;
                else
                    tmpRbAvg(ii) = mean(tmp(tmpNZ));
                end
            end
            if (app.PDSCHCheckBox.Value)
                for rb = 0:app.RBs-1
                    rbGridtemp = evmGrid(rb*12 + (1:12),:,:);                
                    rbGrid(:, rb+1) = rbGridtemp(:);
                end

                temp_bigX = [];
                temp_bigY = [];
                for ii = 1:size(rbGrid, 1)
                    temp_x = 1:app.RBs;
                    temp_y = rbGrid(ii, :);
                    iy = (temp_y~=0);
                    temp_bigX = [temp_bigX temp_x(iy)];
                    temp_bigY = [temp_bigY temp_y(iy)];
                end        
                
                if (SubFrameIndex == 0)
                    temp_xPDSCH = -10*ones(1e6, 1);
                    temp_xPDSCH(1:length(temp_bigX)) = temp_bigX;
                    temp_yPDSCH = -10*ones(1e6, 1);
                    temp_yPDSCH(1:length(temp_bigX)) = temp_bigY;                        
                        
                    app.evmPDSCHRbPlot = plot(app.evmRBAxes, temp_xPDSCH, ...
                            temp_yPDSCH, 'r', 'Marker', 'sq', 'MarkerSize', 2, ...
                            'LineStyle', 'none');   
                else
                    temp_xPDSCH = app.evmPDSCHRbPlot.XData;
                    indm10 = find(temp_xPDSCH == -10, 1);
                    
                    app.evmPDSCHRbPlot.XData(indm10+(0:length(temp_bigX)-1)) = temp_bigX;
                    app.evmPDSCHRbPlot.YData(indm10+(0:length(temp_bigX)-1)) = temp_bigY;
                end                
            end
            hold(app.evmRBAxes,'on');                
            app.EVMRbRMSAvgPlotLine = plot(app.evmRBAxes, 1:length(evmRbRMS), ...
                tmpRbAvg, 'wsq', 'MarkerFaceColor', 'w', ...
                'MarkerSize', 3, 'Linewidth', 1.5);            
            drawnow; 
            end
        end
        
        % Method to handle received vs reference symbols constellation plot
        function handleDemodSyms(app, ~, ~)
            if (app.ConstCheckBox.Value)
            rxSymbols = app.LTEAppInternalsProp.DemodSyms.Rec;
            refSymbols = app.LTEAppInternalsProp.DemodSyms.Ref;
            
            if (app.LTEAppInternalsProp.SubFrameIndex == 0)
                hold(app.constAxes,'off'); 
            end
            
            if (app.PDSCHCheckBox.Value)
                app.ConstPlot = plot(app.constAxes, real(rxSymbols), imag(rxSymbols),...
                    'r', 'Marker','.', 'LineStyle', 'none');
                hold(app.constAxes,'on');     
                app.ConstPlot = plot(app.constAxes, real(refSymbols), imag(refSymbols),...
                    'w', 'Marker','+', 'LineStyle', 'none');  
            end
            
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PBCH')
                if (app.PBCHCheckBox.Value)
                    app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.PBCH), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.PBCH),...
                       'g', 'Marker','.', 'LineStyle', 'none');
                   hold(app.constAxes,'on');   
                   app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_PBCH_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_PBCH_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                   
                end
            end               
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PCFICH')
                if (app.PCFICHCheckBox.Value)
                app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.PCFICH), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.PCFICH),...
                   'color', [0.5 0 0.5], 'Marker','.', 'LineStyle', 'none');
               hold(app.constAxes,'on');    
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_PCFICH_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_PCFICH_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PHICH')
                if (app.PHICHCheckBox.Value)
               app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.PHICH), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.PHICH),...
                   'color', [1 0.5 0], 'Marker','.', 'LineStyle', 'none');
               hold(app.constAxes,'on');     
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_PHICH_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_PHICH_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PDCCH')
                if (app.PDCCHCheckBox.Value)
               app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.PDCCH), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.PDCCH),...
                   'y', 'Marker','.', 'LineStyle', 'none');
               hold(app.constAxes,'on');     
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_PDCCH_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_PDCCH_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'RS')
                if (app.RSCheckBox.Value)
               app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.RS), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.RS),...
                   'c', 'Marker','.', 'LineStyle', 'none');
               hold(app.constAxes,'on');     
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_RS_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_RS_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'PSS')
                if (app.PSSCheckBox.Value)
               app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.PSS), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.PSS),...
                   'm', 'Marker','.', 'LineStyle', 'none');
               hold(app.constAxes,'on');    
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_PSS_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_PSS_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            if isfield(app.LTEAppInternalsProp.EqGridStruct, 'SSS')
                if (app.SSSCheckBox.Value)
                app.ConstPlot = plot(app.constAxes, ...
                   real(app.LTEAppInternalsProp.EqGridStruct.SSS), ...
                   imag(app.LTEAppInternalsProp.EqGridStruct.SSS),...
                   'b', 'Marker','.', 'LineStyle', 'none'); 
               hold(app.constAxes,'on');     
               app.ConstPlot = plot(app.constAxes, ...
                       real(app.LTEAppInternalsProp.EqGridStruct.ref_SSS_Symbols), ...
                       imag(app.LTEAppInternalsProp.EqGridStruct.ref_SSS_Symbols),...
                       'w', 'Marker','+', 'LineStyle', 'none');
                end
            end
            
            drawnow; 
            end
        end
        
        % Method to handle changes in FrameEVM
        function handleFrameEVM(app, ~, ~)
            msg = sprintf('Mean low edge EVM, frame %d: %0.3f%%\n', ...
               app.LTEAppInternalsProp.nFrame-1, app.LTEAppInternalsProp.FrameEVM.Low.RMS*100); 
            app.Label.Text = {msg};
            
            msg = sprintf('Mean high edge EVM, frame %d: %0.3f%%\n', ...
               app.LTEAppInternalsProp.nFrame-1, app.LTEAppInternalsProp.FrameEVM.High.RMS*100); 
            app.Label.Text = {msg};
            pad='     ';
            scroll(app.ListBox,'bottom'); 
        end
        
        function handlePDSCHevm(app, ~, ~)
            if strcmp(app.dBPercentDropDown.Value, 'dB')
                app.SummaryTable2_Data(8,1) = ...
                    {sprintf('%2.3f', 20*log10(0.01*app.LTEAppInternalsProp.PDSCHevm))};
            else
                app.SummaryTable2_Data(8,1) = ...
                    {sprintf('%2.3f', app.LTEAppInternalsProp.PDSCHevm)};
            end
            app.SummaryTable3_Data(8, 1) = app.SummaryTable3_Data(8, 1)+app.LTEAppInternalsProp.PDSCHevm;
            app.SummaryTable3_Data(8, 2) = app.SummaryTable3_Data(8, 2)+1;
        end
        
        % Method to handle changes in FinalEVM
        function handleFinalEVM(app, ~, ~)
            app.ListBox.Items = [app.ListBox.Items, ...
                sprintf('Mean overall EVM - %0.3f%%\n', ...
                app.LTEAppInternalsProp.FinalEVM.RMS*100)]; 
            scroll(app.ListBox,'bottom');
        end
        
        % Code that executes after component creation
        function startupFcn(app)
            app.GridFigTitle = ' ';
            app.PlayStopButtonState = false;
            app.LTEAppInternalsProp = LTEAppInternals(app);
            
            addlistener(app.LTEAppInternalsProp, 'CyclicPrefix', 'PostSet', @app.handleCyclicPrefix);
            addlistener(app.LTEAppInternalsProp, 'FrameOffset', 'PostSet', @app.handleFrameOffset);
            addlistener(app.LTEAppInternalsProp, 'NCellID', 'PostSet', @app.handleNCellID);
            addlistener(app.LTEAppInternalsProp, 'FreqOffset', 'PostSet', @app.handleFreqOffset);
            addlistener(app.LTEAppInternalsProp, 'IQOffset', 'PostSet', @app.handleIQOffset);
            addlistener(app.LTEAppInternalsProp, 'PSD_y', 'PostSet', @app.handlePSD);
                      
            addlistener(app.LTEAppInternalsProp, 'evm_pbch_RMS', 'PostSet', @app.handlePBCH_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_pcfich_RMS', 'PostSet', @app.handlePCFICH_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_pdcch_RMS', 'PostSet', @app.handlePDCCH_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_phich_RMS', 'PostSet', @app.handlePHICH_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_rs_RMS', 'PostSet', @app.handleRS_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_pss_RMS', 'PostSet', @app.handlePSS_RMS_EVM);
            addlistener(app.LTEAppInternalsProp, 'evm_sss_RMS', 'PostSet', @app.handleSSS_RMS_EVM);            
            
            addlistener(app.LTEAppInternalsProp, 'evmSymbol', 'PostSet', @app.handleEVMSymbol);            
            addlistener(app.LTEAppInternalsProp, 'evmSC', 'PostSet', @app.handleEVMSc);            
            addlistener(app.LTEAppInternalsProp, 'evmRB', 'PostSet', @app.handleEVMRb);            
            addlistener(app.LTEAppInternalsProp, 'PDSCHevm', 'PostSet', @app.handlePDSCHevm);                        
            addlistener(app.LTEAppInternalsProp, 'DemodSyms', 'PostSet', @app.handleDemodSyms);            
            
            if ~isdeployed
                % check MATLAB version
                if ~contains(version, 'R2020a')
                    app.Label.Text = 'LTE Performance Analyzer App requires MATLAB R2020a.';
                    return;
                end
                
                % check for other toolbox dependencies
                has_tbs = cell(4, 1);
                toolboxes = ver;
                tbs_needed = {'Communications Toolbox', 'DSP System Toolbox', ...
                    'LTE Toolbox', 'Signal Processing Toolbox'};
                count = 0;
                for ii = 1:length(toolboxes)
                   if contains(toolboxes(ii).Name, tbs_needed)                       
                       count = count+1;
                       has_tbs{count} = toolboxes(ii).Name;
                   end
                end
                if (count < 4)
                    has_tbs(count:end) = [];
                    missing_tbs = setdiff(tbs_needed, has_tbs);
                    msg = 'The following toolboxes are required:';
                    for ii = 1:numel(missing_tbs)
                        msg = strcat(msg, " ", missing_tbs{ii}, ",");
                    end
                    msg = char(msg);
                    msg(end) = '.';
                    app.Label.Text = msg;
                    return;
                end
                
                % check that Pluto HSP is installed
                addons = matlab.addons.installedAddons;
                num_addons = 1:size(addons, 1);
                inds = ismember(addons.Name,'Communications Toolbox Support Package for Analog Devices ADALM-Pluto Radio');
                if isequal(inds, ones(size(addons, 1), 1))                    
                    app.Label.Text = 'LTE Performance Analyzer App requires Communications Toolbox Support Package for Analog Devices ADALM-Pluto Radio, Version 20.1.0 or later.';
                    return;
                end
                pluto_addon = num_addons(inds);
                pluto_addon_ver = table2cell(addons(pluto_addon,2));
                ver_split = strsplit(pluto_addon_ver{1},'.');
                maj_num = str2double(ver_split{1});
                if (maj_num < 20)
                    app.Label.Text = 'LTE Performance Analyzer App requires Communications Toolbox Support Package for Analog Devices ADALM-Pluto Radio, Version 20.1.0 or later.';
                    return;
                end
            end
            
            app.LTEAppInternalsProp.PlutoConnectionFcn(app);
            if app.PlutoNotFound                
                return;
            end            
        end

        % Button pushed function: FindPlutoButton
        function FindPlutoButtonPushed(app, ~)
            app.PlutoConnectionFcn();
        end

        % Close request function: 
        % LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure
        function LTEeNBTxConformanceTestsUsingPlutoSDRUIFigureCloseRequest(app, ~)
            delete(app);
        end

        % Button pushed function: PlayStopButton
        function PlayStopButtonPushed(app, ~)
            app.DocButton.Enable = 'off'; 
            app.GridButton.Enable = 'off'; 
            app.PlayStopButtonState = ~app.PlayStopButtonState;
            app.StepOrPlayButton = 'play';
            
            if app.PlayStopButtonState
                app.SummaryTable1_Data = cell(6, 1);
                app.SummaryTable2_Data = cell(8, 1);
                app.SummaryTable3_Data = zeros(8, 3);
                app.evmScRMSAvg = [];
                app.evmRbRMSAvg = [];
                app.evmSymbolRMSAvg = [];
                app.evmGridFrame = [];
                cla(app.PSDAxes); drawnow; 
                cla(app.evmRBAxes); drawnow; 
                cla(app.evmSCAxes); drawnow; 
                cla(app.evmSymsAxes); drawnow; 
                cla(app.constAxes); drawnow;                
                                
                if strcmp(app.BWDropDown.Value, '3 MHz')
                    app.evmSCAxes.XLim = [1 15*12];
                    app.evmRBAxes.XLim = [1 15];
                    app.numSCs = 15*12;
                    app.RBs = 15;
                elseif strcmp(app.BWDropDown.Value, '5 MHz')
                    app.evmSCAxes.XLim = [1 25*12];
                    app.evmRBAxes.XLim = [1 25];
                    app.numSCs = 25*12;
                    app.RBs = 25;
                elseif strcmp(app.BWDropDown.Value, '10 MHz')
                    app.evmSCAxes.XLim = [1 50*12];
                    app.evmRBAxes.XLim = [1 50];
                    app.numSCs = 50*12;
                    app.RBs = 50;
                elseif strcmp(app.BWDropDown.Value, '15 MHz')
                    app.evmSCAxes.XLim = [1 75*12];
                    app.evmRBAxes.XLim = [1 75];
                    app.numSCs = 75*12;
                    app.RBs = 75;                    
                elseif strcmp(app.BWDropDown.Value, '20 MHz')
                    app.evmSCAxes.XLim = [1 100*12];
                    app.evmRBAxes.XLim = [1 100];
                    app.numSCs = 100*12;
                    app.RBs = 100;                    
                end
                
                app.PBCHCheckBox.Enable = 'off';
                app.PCFICHCheckBox.Enable = 'off';
                app.PHICHCheckBox.Enable = 'off';
                app.PDCCHCheckBox.Enable = 'off';
                app.RSCheckBox.Enable = 'off';
                app.PSSCheckBox.Enable = 'off';
                app.SSSCheckBox.Enable = 'off';
                app.PDSCHCheckBox.Enable = 'off';
                app.EVMScCheckBox.Enable = 'off';
                app.EVMRbCheckBox.Enable = 'off';
                app.EVMSymsCheckBox.Enable = 'off';
                app.ConstCheckBox.Enable = 'off';
                app.PSDCheckBox.Enable = 'off';
                
                app.StepButton.Enable = 'off'; 
                app.dBPercentDropDown.Enable = 'off';
                app.TMNDropDown.Enable = 'off';
                app.BWDropDown.Enable = 'off';
                app.LOEditField.Enable = 'off';
                notify(app, 'Play');            
            else
                app.Label.Text = {'Test stopped.'}; 
                notify(app, 'Stop');
                app.StepButton.Enable = 'on'; 
                
                app.PBCHCheckBox.Enable = 'on';
                app.PCFICHCheckBox.Enable = 'on';
                app.PHICHCheckBox.Enable = 'on';
                app.PDCCHCheckBox.Enable = 'on';
                app.RSCheckBox.Enable = 'on';
                app.PSSCheckBox.Enable = 'on';
                app.SSSCheckBox.Enable = 'on';
                app.PDSCHCheckBox.Enable = 'on';
                app.EVMScCheckBox.Enable = 'on';
                app.EVMRbCheckBox.Enable = 'on';
                app.EVMSymsCheckBox.Enable = 'on';
                app.ConstCheckBox.Enable = 'on';
                app.PSDCheckBox.Enable = 'on';
                
                drawnow; 
            end
            drawnow; 
        end

        % Button pushed function: StepButton
        function StepButtonPushed(app, ~)
            app.StepOrPlayButton = 'step';
            app.StepButton.Enable = 'off'; 
            app.PlayStopButton.Enable = 'off'; 
            app.DocButton.Enable = 'off'; 
            app.GridButton.Enable = 'off';    
            app.dBPercentDropDown.Enable = 'off';
            app.TMNDropDown.Enable = 'off';
            app.BWDropDown.Enable = 'off';
            app.LOEditField.Enable = 'off';
            
            app.SummaryTable1_Data = cell(6, 1);
            app.SummaryTable2_Data = cell(8, 1);
            app.SummaryTable3_Data = zeros(8, 3);
            app.evmScRMSAvg = [];
            app.evmRbRMSAvg = [];
            app.evmSymbolRMSAvg = [];
            app.evmGridFrame = [];
            cla(app.PSDAxes); drawnow; 
            cla(app.evmRBAxes); drawnow; 
            cla(app.evmSCAxes); drawnow; 
            cla(app.evmSymsAxes); drawnow; 
            cla(app.constAxes); drawnow;                
            
            if strcmp(app.BWDropDown.Value, '3 MHz')
                app.evmSCAxes.XLim = [1 15*12];
                app.evmRBAxes.XLim = [1 15];
                app.numSCs = 15*12;
                app.RBs = 15;
            elseif strcmp(app.BWDropDown.Value, '5 MHz')
                app.evmSCAxes.XLim = [1 25*12];
                app.evmRBAxes.XLim = [1 25];
                app.numSCs = 25*12;
                app.RBs = 25;
            elseif strcmp(app.BWDropDown.Value, '10 MHz')
                app.evmSCAxes.XLim = [1 50*12];
                app.evmRBAxes.XLim = [1 50];
                app.numSCs = 50*12;
                app.RBs = 50;
            elseif strcmp(app.BWDropDown.Value, '15 MHz')
                app.evmSCAxes.XLim = [1 75*12];
                app.evmRBAxes.XLim = [1 75];
                app.numSCs = 75*12;
                app.RBs = 75;
            elseif strcmp(app.BWDropDown.Value, '20 MHz')
                app.evmSCAxes.XLim = [1 100*12];
                app.evmRBAxes.XLim = [1 100];
                app.numSCs = 100*12;
                app.RBs = 100;
            end

            app.PBCHCheckBox.Enable = 'off';
            app.PCFICHCheckBox.Enable = 'off';
            app.PHICHCheckBox.Enable = 'off';
            app.PDCCHCheckBox.Enable = 'off';
            app.RSCheckBox.Enable = 'off';
            app.PSSCheckBox.Enable = 'off';
            app.SSSCheckBox.Enable = 'off';
            app.PDSCHCheckBox.Enable = 'off';
            app.EVMScCheckBox.Enable = 'off';
            app.EVMRbCheckBox.Enable = 'off';
            app.EVMSymsCheckBox.Enable = 'off';
            app.ConstCheckBox.Enable = 'off';
            app.PSDCheckBox.Enable = 'off';
            
            notify(app, 'Play');            
        end
        
        % Button pushed function: DocButton
        function DocButtonPushed(app, ~)
            web('https://wiki.analog.com/resources/tools-software/transceiver-toolbox/examples/pluto_lte_app', '-browser')            
        end            
        
        % Button pushed function: GridButton
        function GridButtonPushed(app, ~)
            if isgraphics(app.GridFig)
                close(app.GridFig);
            end
            % close(findobj('type','figure','name',app.GridFigTitle));
            app.GridFig = uifigure('Color','w','Position',[0 40 1540 799],'Visible', 'off');
            app.GridFigTitle = sprintf('Resource Grid for TMN: %s, Bandwidth: %s', ...
                app.TMNValue, app.BWDropDown.Value);
            app.GridFig.Name = app.GridFigTitle;
            app.GridAxes = uiaxes(app.GridFig,'Position',[10 10 1530 789],'Visible', 'off');
            
            app.GridAxes.cla;
            BW = app.BWDropDown.Value(find(~isspace(app.BWDropDown.Value)));
            tmCfg = lteTestModel(app.TMNValue,BW);
            [~, txGrid, ~] = lteTestModelTool(tmCfg);
            PlotTransmitResourceGrid(app.GridAxes, tmCfg, txGrid);
            app.GridFig.Visible = 'on';
            app.GridAxes.Visible = 'on';
            disableDefaultInteractivity(app.GridAxes);
            app.GridAxes.Toolbar.Visible = 'off';
        end            
                
        function TMNDropDownValueChanged(app, ~)            
            app.SummaryTable1.Data{1,2} = [];
            app.SummaryTable1.Data{2,2} = [];
            app.SummaryTable1.Data{3,2} = [];
            app.SummaryTable1.Data{4,2} = [];
            app.SummaryTable1.Data{5,2} = [];
            app.SummaryTable1.Data{6,2} = [];
            
            app.SummaryTable2.Data{1,3} = [];
            app.SummaryTable2.Data{2,3} = [];
            app.SummaryTable2.Data{3,3} = [];
            app.SummaryTable2.Data{4,3} = [];
            app.SummaryTable2.Data{5,3} = [];
            app.SummaryTable2.Data{6,3} = [];
            app.SummaryTable2.Data{7,3} = [];
            app.SummaryTable2.Data{8,3} = [];
            
            app.SummaryTable3.Data{1,2} = [];
            app.SummaryTable3.Data{2,2} = [];
            app.SummaryTable3.Data{3,2} = [];
            app.SummaryTable3.Data{4,2} = [];
            app.SummaryTable3.Data{5,2} = [];
            app.SummaryTable3.Data{6,2} = [];
            app.SummaryTable3.Data{7,2} = [];
            app.SummaryTable3.Data{8,2} = [];
            
            value = app.TMNDropDown.Value;            
            switch (value)
                case '1024QAM'                    
                    app.TMNValue = '3.1b';
                    app.PDSCHConstellationValLabel.Text = '3.1b';                     
                case '256QAM'                    
                    app.TMNValue = '3.1a';
                    app.PDSCHConstellationValLabel.Text = '3.1a'; 
                case '64QAM'                    
                    app.TMNValue = '3.1';
                    app.PDSCHConstellationValLabel.Text = '3.1'; 
                case '16QAM'                    
                    app.TMNValue = '3.2';
                    app.PDSCHConstellationValLabel.Text = '3.2'; 
                case 'QPSK'                    
                    app.TMNValue = '3.3';
                    app.PDSCHConstellationValLabel.Text = '3.3'; 
            end
            drawnow; 
        end
          
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure and hide until all components are created
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure = uifigure('Visible', 'off');
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Position = [0 40 1540 799];
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Name = 'LTE eNB Transceiver Performance Analyzer';
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.CloseRequestFcn = createCallbackFcn(app, @LTEeNBTxConformanceTestsUsingPlutoSDRUIFigureCloseRequest, true);
            
            % Create Panel
            app.Panel = uipanel(app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure);
            app.Panel.Position = [1 1 1545 795];

            % Create TestConfigurationButtonGroup
            app.TestConfigurationButtonGroup = uibuttongroup(app.Panel);
            app.TestConfigurationButtonGroup.TitlePosition = 'centertop';
            app.TestConfigurationButtonGroup.Title = 'E-UTRA Test Model (E-TM) Configuration';
            app.TestConfigurationButtonGroup.Position = [8 627 375 161];
            app.TestConfigurationButtonGroup.FontWeight = 'bold';

            % Create TMNDropDown
            app.TMNDropDown = uidropdown(app.TestConfigurationButtonGroup);
            app.TMNDropDown.Items = {'1024QAM', '256QAM', '64QAM', '16QAM', 'QPSK'};
            app.TMNDropDown.FontColor = [1 0 0];
            app.TMNDropDown.Position = [139 108 95 22];
            app.TMNDropDown.Value = '64QAM';
            app.TMNValue = '3.1';
            app.TMNDropDown.ValueChangedFcn = createCallbackFcn(app, @TMNDropDownValueChanged, true);

            % Create TMNDropDownLabel
            app.TMNDropDownLabel = uilabel(app.TestConfigurationButtonGroup);
            app.TMNDropDownLabel.HorizontalAlignment = 'right';
            app.TMNDropDownLabel.FontColor = [1 0 0];
            app.TMNDropDownLabel.Position = [3 110 125 22];
            app.TMNDropDownLabel.Text = 'PDSCH Constellation';

            % Create BWDropDown
            app.BWDropDown = uidropdown(app.TestConfigurationButtonGroup);
            app.BWDropDown.Items = {'5 MHz', '10 MHz', '15 MHz', '20 MHz'};
            app.BWDropDown.Value = '5 MHz';
            app.BWDropDown.FontColor = [1 0 0];
            app.BWDropDown.Position = [139 72.5 95 22];                
                        
            % Create LOEditFieldLabel
            app.LOEditFieldLabel = uilabel(app.TestConfigurationButtonGroup);
            app.LOEditFieldLabel.HorizontalAlignment = 'right';
            app.LOEditFieldLabel.Position = [48 10 75 22];
            app.LOEditFieldLabel.Text = 'LO (MHz)';
            
            % Create LOEditField
            app.LOEditField = uieditfield(app.TestConfigurationButtonGroup, 'numeric');
            app.LOEditField.Position = [135 10 100 22];
            app.LOEditField.Value = 2400;
            app.LOEditField.Limits = [325 3800];

            % Create BWDropDownLabel
            app.BWDropDownLabel = uilabel(app.TestConfigurationButtonGroup);
            app.BWDropDownLabel.HorizontalAlignment = 'right';
            app.BWDropDownLabel.FontColor = [1 0 0];
            app.BWDropDownLabel.Position = [63 75 65 22];
            app.BWDropDownLabel.Text = 'Bandwidth';

            % Create PDSCHConstellationLabel
            app.PDSCHConstellationLabel = uilabel(app.TestConfigurationButtonGroup);
            app.PDSCHConstellationLabel.HorizontalAlignment = 'right';
            app.PDSCHConstellationLabel.Position = [3 40 125 22];
            app.PDSCHConstellationLabel.Text = 'TM Number';
            app.PDSCHConstellationLabel.FontColor = 'red';
            
            % Create PDSCHConstellationValLabel
            app.PDSCHConstellationValLabel = uilabel(app.TestConfigurationButtonGroup);
            app.PDSCHConstellationValLabel.Position = [140 40 75 22];   
            app.PDSCHConstellationValLabel.Text = '3.1';
            app.PDSCHConstellationValLabel.FontColor = 'red';
            
            % Create Panel_14
            app.Panel_14 = uipanel(app.TestConfigurationButtonGroup);
            app.Panel_14.Position = [240 5 130 130];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.Panel_14);

            % Create PlayStopButton
            app.PlayStopButton = uibutton(app.GridLayout, 'push');
            app.PlayStopButton.ButtonPushedFcn = createCallbackFcn(app, @PlayStopButtonPushed, true);
            app.PlayStopButton.Icon = which('play.png');
            app.PlayStopButton.Layout.Row = 1;
            app.PlayStopButton.Layout.Column = 1;
            app.PlayStopButton.Text = '';
            app.PlayStopButton.Tooltip = {'Capture/Stop'};

            % Create StepButton
            app.StepButton = uibutton(app.GridLayout, 'push');
            app.StepButton.ButtonPushedFcn = createCallbackFcn(app, @StepButtonPushed, true);
            app.StepButton.Icon = which('step.png');
            app.StepButton.Layout.Row = 1;
            app.StepButton.Layout.Column = 2;
            app.StepButton.Text = '';
            app.StepButton.Tooltip = {'Single frame capture'};
            
            % Create DocButton
            app.DocButton = uibutton(app.GridLayout, 'push');
            app.DocButton.ButtonPushedFcn = createCallbackFcn(app, @DocButtonPushed, true);
            app.DocButton.Icon = which('doc.png');
            app.DocButton.Layout.Row = 2;
            app.DocButton.Layout.Column = 2;
            app.DocButton.Text = '';
            app.DocButton.Tooltip = {'Open app documentation in web browser'};
            
            % Create DocButton
            app.GridButton = uibutton(app.GridLayout, 'push');
            app.GridButton.ButtonPushedFcn = createCallbackFcn(app, @GridButtonPushed, true);
            app.GridButton.Icon = which('grid.png');
            app.GridButton.Layout.Row = 2;
            app.GridButton.Layout.Column = 1;
            app.GridButton.Text = '';
            app.GridButton.Tooltip = {'Show resource grid'};

            % Create TabGroup
            app.TabGroup = uitabgroup(app.Panel);
            app.TabGroup.Position = [8 380 375 240];
                        
            % Create Tab1
            app.Tab1 = uitab(app.TabGroup);
            app.Tab1.Title = 'Subframe EVM';
            
            % Create Tab2
            app.Tab2 = uitab(app.TabGroup);
            app.Tab2.Title = 'Frame EVM';
            
            % Create Tab3
            app.Tab3 = uitab(app.TabGroup);
            app.Tab3.Title = 'Demodulation Summary';
            
            % Create Panel_8
            app.Panel_8 = uipanel(app.Panel);
            app.Panel_8.Position = [393 380 758 375];

            % Create PSDAxes
            app.PSDAxes = uiaxes(app.Panel_8);
            title(app.PSDAxes, '')
            ylabel(app.PSDAxes, 'power (dBFS)')
            xlabel(app.PSDAxes, 'FREQUENCY (MHZ)')
            app.PSDAxes.TickLength = [0.1 0.1];
            app.PSDAxes.GridColor = [1 1 1];
            app.PSDAxes.GridAlpha = 0.15;
            app.PSDAxes.MinorGridColor = [1 1 1];
            app.PSDAxes.XColor = [0.149 0.149 0.149];
            app.PSDAxes.Color = [0 0 0];
            app.PSDAxes.XGrid = 'on';
            app.PSDAxes.XMinorGrid = 'on';
            app.PSDAxes.YGrid = 'on';
            app.PSDAxes.YMinorGrid = 'on';
            app.PSDAxes.Position = [9 8 739 361];
            app.PSDAxes.YLim = [-140 -30];
            app.PSDAxes.XLim = [-20 20];
            title(app.PSDAxes, 'Spectrum');
            app.PSDAxes.Toolbar.Visible = 'off';
            disableDefaultInteractivity(app.PSDAxes);
            
            % Create PSDCheckBox
            app.PSDCheckBox = uicheckbox(app.Panel_8);
            app.PSDCheckBox.Text = '';
            app.PSDCheckBox.Position = [347 341.5 20 30];
            app.PSDCheckBox.Value = true;

            % Create Panel_9
            app.Panel_9 = uipanel(app.Panel);
            app.Panel_9.Position = [8 2 375 375];

            % Create evmSymsAxes
            app.evmSymsAxes = uiaxes(app.Panel_9);
            title(app.evmSymsAxes, 'Error Vector Time')
            xlabel(app.evmSymsAxes, 'SYMBOLS')
            ylabel(app.evmSymsAxes,  'EVM %')
            app.evmSymsAxes.GridColor = [0.651 0.651 0.651];
            app.evmSymsAxes.Color = [0 0 0];
            app.evmSymsAxes.XGrid = 'on';
            app.evmSymsAxes.YGrid = 'on';
            app.evmSymsAxes.Position = [7 9 358 359];
            app.evmSymsAxes.YLim = [0 10];
            app.evmSymsAxes.XLim = [1 140];  
            app.evmSymsAxes.Toolbar.Visible = 'off';
            disableDefaultInteractivity(app.evmSymsAxes);
            
            % Create VerLabel
            app.VerLabel = uilabel(app.Panel_9);
            app.VerLabel.HorizontalAlignment = 'left';
            app.VerLabel.Position = [7 2 50 22];
            app.VerLabel.FontColor = 'blue';
            app.VerLabel.FontSize = 20;
            app.VerLabel.FontWeight = 'bold';
            app.VerLabel.FontAngle = 'italic';
            app.VerLabel.Text = 'v0.8';                
            
            % Create EVMSymsCheckBox
            app.EVMSymsCheckBox = uicheckbox(app.Panel_9);
            app.EVMSymsCheckBox.Text = '';
            app.EVMSymsCheckBox.Position = [125 341.5 20 30];
            app.EVMSymsCheckBox.Value = true;
                
            % Create Panel_10
            app.Panel_10 = uipanel(app.Panel);
            app.Panel_10.Position = [393 2 758 375]; 

            % Create evmSCAxes
            app.evmSCAxes = uiaxes(app.Panel_10);
            title(app.evmSCAxes, 'Error Vector Spectrum')
            xlabel(app.evmSCAxes, 'SUBCARRIERS')
            ylabel(app.evmSCAxes,  'EVM %')
            app.evmSCAxes.GridColor = [0.651 0.651 0.651];
            app.evmSCAxes.Color = [0 0 0];
            app.evmSCAxes.YLim = [0 10];            
            app.evmSCAxes.XGrid = 'on';
            app.evmSCAxes.YGrid = 'on';
            app.evmSCAxes.Position = [9 9 739 359];
            app.evmSCAxes.XLim = [1 25*12];  
            app.evmSCAxes.Toolbar.Visible = 'off';
            disableDefaultInteractivity(app.evmSCAxes);
            app.numSCs = 25*12;
            
            % Create EVMScCheckBox
            app.EVMScCheckBox = uicheckbox(app.Panel_10);
            app.EVMScCheckBox.Text = '';
            app.EVMScCheckBox.Position = [300 341.5 20 30];
            app.EVMScCheckBox.Value = true;

            % Create Panel_11
            app.Panel_11 = uipanel(app.Panel);
            app.Panel_11.Position = [1160 2 375 375];

            % Create evmRBAxes
            app.evmRBAxes = uiaxes(app.Panel_11);
            title(app.evmRBAxes, 'Error Vector Grid')
            xlabel(app.evmRBAxes, 'RB')
            ylabel(app.evmRBAxes,  'EVM %')
            app.evmRBAxes.GridColor = [0.651 0.651 0.651];
            app.evmRBAxes.Color = [0 0 0];
            app.evmRBAxes.YLim = [0 10];
            app.evmRBAxes.XGrid = 'on';
            app.evmRBAxes.YGrid = 'on';
            app.evmRBAxes.Position = [6 9 359 359];
            app.evmRBAxes.XLim = [1 25];
            app.evmRBAxes.Toolbar.Visible = 'off';
            disableDefaultInteractivity(app.evmRBAxes);
            
            % Create EVMRbCheckBox
            app.EVMRbCheckBox = uicheckbox(app.Panel_11);
            app.EVMRbCheckBox.Text = '';
            app.EVMRbCheckBox.Position = [125 341.5 20 30];
            app.EVMRbCheckBox.Value = true;

            % Create Panel_12
            app.Panel_12 = uipanel(app.Panel);
            app.Panel_12.Position = [1160 380 375 375];

            % Create constAxes
            app.constAxes = uiaxes(app.Panel_12);
            title(app.constAxes, 'Scatterplot')
            xlabel(app.constAxes, 'I')
            ylabel(app.constAxes, 'Q')
            app.constAxes.GridColor = [0.651 0.651 0.651];
            app.constAxes.Color = [0 0 0];
            app.constAxes.XGrid = 'on';
            app.constAxes.YGrid = 'on';
            app.constAxes.XLim = [-1.5 1.5];
            app.constAxes.YLim = [-1.5 1.5];
            set(app.constAxes, 'YTickLabel', []);
            set(app.constAxes, 'XTickLabel', []);            
            app.constAxes.Position = [9 8 358 359];
            app.constAxes.Toolbar.Visible = 'off';
            disableDefaultInteractivity(app.constAxes);
            app.constAxes.cla;
            
            % Create ConstCheckBox
            app.ConstCheckBox = uicheckbox(app.Panel_12);
            app.ConstCheckBox.Text = '';
            app.ConstCheckBox.Position = [140 341.5 20 30];
            app.ConstCheckBox.Value = true;
            
            % Create SummaryTable1
            app.SummaryTable1 = uitable(app.Tab3);
            app.SummaryTable1.ColumnWidth = {190,170};
            s1 = uistyle;
            s1.HorizontalAlignment = 'left';
            app.SummaryTable1.ColumnName = {'Property'; 'Value'};
            app.SummaryTable1.RowName = [];
            app.SummaryTable1.Position = [6 45 363 164];            
            app.SummaryTable1.Data = cell(6,2);
            
            app.SummaryTable1.Data{1,1} = 'CP Mode';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[1 1]);
            addStyle(app.SummaryTable1,s1,'cell',[1 2]);
            
            app.SummaryTable1.Data{2,1} = 'Cell ID';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[2 1]);
            addStyle(app.SummaryTable1,s1,'cell',[2 2]);
            
            app.SummaryTable1.Data{3,1} = 'Estimated Frame Offset';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[3 1]);
            addStyle(app.SummaryTable1,s1,'cell',[3 2]);
            
            app.SummaryTable1.Data{4,1} = 'Estimated Freq. Offset';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[4 1]);
            addStyle(app.SummaryTable1,s1,'cell',[4 2]);
            
            app.SummaryTable1.Data{5,1} = 'Estimated IQ Offset';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[5 1]);
            addStyle(app.SummaryTable1,s1,'cell',[5 2]);
           
            app.SummaryTable1.Data{6,1} = 'Data EVM';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[6 1]);
            addStyle(app.SummaryTable1,s1,'cell',[6 2]);
            
            % Create SummaryTable2
            app.SummaryTable2 = uitable(app.Tab1);
            app.SummaryTable2.ColumnWidth = {190,170};
            s2 = uistyle;
            s2.HorizontalAlignment = 'left';
            app.SummaryTable2.ColumnName = {' ';'Channel'; 'EVM'};
            app.SummaryTable2.RowName = [];
            app.SummaryTable2.Position = [6 6 363 209];            
            app.SummaryTable2.Data = cell(8,3);
            set(app.SummaryTable2,'ColumnWidth', {30, 165, 165})
            
            s2.FontColor = 'green';
            addStyle(app.SummaryTable2,s2,'cell',[1 2]);
            addStyle(app.SummaryTable2,s2,'cell',[1 3]);
            app.SummaryTable2.Data{1,2} = 'PBCH';
            
            % Create PBCHCheckBox
            app.PBCHCheckBox = uicheckbox(app.Tab1);
            app.PBCHCheckBox.Text = '';
            app.PBCHCheckBox.FontColor = 'green';
            app.PBCHCheckBox.Position = [15 161 363 30];
            app.PBCHCheckBox.Value = true;
            
            s2.FontColor = [.5 0 .5];
            addStyle(app.SummaryTable2,s2,'cell',[2 2]);
            addStyle(app.SummaryTable2,s2,'cell',[2 3]);
            app.SummaryTable2.Data{2,2} = 'PCFICH';
            
            % Create PCFICHCheckBox
            app.PCFICHCheckBox = uicheckbox(app.Tab1);
            app.PCFICHCheckBox.Text = '';
            app.PCFICHCheckBox.FontColor = [.5 0 .5];
            app.PCFICHCheckBox.Position = [15 139 363 30];
            app.PCFICHCheckBox.Value = true;
            
            s2.FontColor = [1 0.5 0];
            addStyle(app.SummaryTable2,s2,'cell',[3 2]);
            addStyle(app.SummaryTable2,s2,'cell',[3 3]);
            app.SummaryTable2.Data{3,2} = 'PHICH';
            
            % Create PHICHCheckBox
            app.PHICHCheckBox = uicheckbox(app.Tab1);
            app.PHICHCheckBox.Text = '';
            app.PHICHCheckBox.FontColor = [1 0 .5];
            app.PHICHCheckBox.Position = [15 117 363 30];
            app.PHICHCheckBox.Value = true;
            
            s2.FontColor = 'yellow';
            addStyle(app.SummaryTable2,s2,'cell',[4 2]);
            addStyle(app.SummaryTable2,s2,'cell',[4 3]);
            app.SummaryTable2.Data{4,2} = 'PDCCH';
            
            % Create PDCCHCheckBox
            app.PDCCHCheckBox = uicheckbox(app.Tab1);
            app.PDCCHCheckBox.Text = '';
            app.PDCCHCheckBox.FontColor = 'yellow';
            app.PDCCHCheckBox.Position = [15 94.5 363 30];
            app.PDCCHCheckBox.Value = true;
            
            s2.FontColor = 'cyan';
            addStyle(app.SummaryTable2,s2,'cell',[5 2]);
            addStyle(app.SummaryTable2,s2,'cell',[5 3]);
            app.SummaryTable2.Data{5,2} = 'RS';
            
            % Create RSCheckBox
            app.RSCheckBox = uicheckbox(app.Tab1);
            app.RSCheckBox.Text = '';
            app.RSCheckBox.FontColor = 'cyan';
            app.RSCheckBox.Position = [15 72 363 30];
            app.RSCheckBox.Value = true;
            
            s2.FontColor = 'magenta';
            addStyle(app.SummaryTable2,s2,'cell',[6 2]);
            addStyle(app.SummaryTable2,s2,'cell',[6 3]);
            app.SummaryTable2.Data{6,2} = 'P-SS';
            
            % Create PSSCheckBox
            app.PSSCheckBox = uicheckbox(app.Tab1);
            app.PSSCheckBox.Text = '';
            app.PSSCheckBox.FontColor = 'magenta';
            app.PSSCheckBox.Position = [15 49.5 363 30];
            app.PSSCheckBox.Value = true;
            
            s2.FontColor = 'blue';
            addStyle(app.SummaryTable2,s2,'cell',[7 2]);
            addStyle(app.SummaryTable2,s2,'cell',[7 3]);
            app.SummaryTable2.Data{7,2} = 'S-SS';
            
            % Create SSSCheckBox
            app.SSSCheckBox = uicheckbox(app.Tab1);
            app.SSSCheckBox.Text = '';
            app.SSSCheckBox.FontColor = 'blue';
            app.SSSCheckBox.Position = [15 27 363 30];
            app.SSSCheckBox.Value = true;
            
            s2.FontColor = 'red';
            addStyle(app.SummaryTable2,s2,'cell',[8 2]);
            addStyle(app.SummaryTable2,s2,'cell',[8 3]);
            app.SummaryTable2.Data{8,2} = 'PDSCH';
            
            % Create PSSCheckBox
            app.PDSCHCheckBox = uicheckbox(app.Tab1);
            app.PDSCHCheckBox.Text = '';
            app.PDSCHCheckBox.FontColor = 'red';
            app.PDSCHCheckBox.Position = [15 4 363 30];
            app.PDSCHCheckBox.Value = true;
            
            % Create TMNDropDown
            app.dBPercentDropDown = uidropdown(app.Tab1);
            app.dBPercentDropDown.Items = {'dB','%'};
            app.dBPercentDropDown.FontColor = [0 0 0];
            app.dBPercentDropDown.Position = [245 190 60 20];
            app.dBPercentDropDown.Value = 'dB';
            
            
            % Create SummaryTable3
            app.SummaryTable3 = uitable(app.Tab2);
            app.SummaryTable3.ColumnWidth = {190,170};
            s2 = uistyle;
            s2.HorizontalAlignment = 'left';
            s2.FontColor = 'green';
            addStyle(app.SummaryTable3,s2,'cell',[1 1]);
            addStyle(app.SummaryTable3,s2,'cell',[1 2]);
            app.SummaryTable3.ColumnName = {'Channel'; 'EVM'};
            app.SummaryTable3.RowName = [];
            % app.SummaryTable3.Position = [6 6 363 253];            
            app.SummaryTable3.Position = [6 6 363 209];            
            app.SummaryTable3.Data = cell(8,2);
            app.SummaryTable3.Data{1,1} = ' PBCH';
            
            s2.FontColor = [.5 0 .5];
            addStyle(app.SummaryTable3,s2,'cell',[2 1]);
            addStyle(app.SummaryTable3,s2,'cell',[2 2]);
            app.SummaryTable3.Data{2,1} = ' PCFICH';
            
            s2.FontColor = [1 0.5 0];
            addStyle(app.SummaryTable3,s2,'cell',[3 1]);
            addStyle(app.SummaryTable3,s2,'cell',[3 2]);
            app.SummaryTable3.Data{3,1} = ' PHICH';
            
            s2.FontColor = 'yellow';
            addStyle(app.SummaryTable3,s2,'cell',[4 1]);
            addStyle(app.SummaryTable3,s2,'cell',[4 2]);
            app.SummaryTable3.Data{4,1} = ' PDCCH';
            
            s2.FontColor = 'cyan';
            addStyle(app.SummaryTable3,s2,'cell',[5 1]);
            addStyle(app.SummaryTable3,s2,'cell',[5 2]);
            app.SummaryTable3.Data{5,1} = ' RS';
            
            s2.FontColor = 'magenta';
            addStyle(app.SummaryTable3,s2,'cell',[6 1]);
            addStyle(app.SummaryTable3,s2,'cell',[6 2]);
            app.SummaryTable3.Data{6,1} = ' P-SS';
            
            s2.FontColor = 'blue';
            addStyle(app.SummaryTable3,s2,'cell',[7 1]);
            addStyle(app.SummaryTable3,s2,'cell',[7 2]);
            app.SummaryTable3.Data{7,1} = ' S-SS';
            
            s2.FontColor = 'red';
            addStyle(app.SummaryTable3,s2,'cell',[8 1]);
            addStyle(app.SummaryTable3,s2,'cell',[8 2]);
            app.SummaryTable3.Data{8,1} = ' PDSCH';
            
            setColumnFormat(java(app.SummaryTable1), repmat( {'numeric'}, 1, size(app.SummaryTable1.Data,2) ) );
            setColumnFormat(java(app.SummaryTable2), repmat( {'numeric'}, 1, size(app.SummaryTable2.Data,2) ) );
            setColumnFormat(java(app.SummaryTable3), repmat( {'numeric'}, 1, size(app.SummaryTable3.Data,2) ) );

            % Create Label
            app.Label = uilabel(app.Panel);
            app.Label.Position = [395 760 1045 27];
            app.Label.Text = '';
            app.Label.FontColor = 'b';

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Position = [1448 760 85 30];
            app.Image.ImageSource = which('Analog_Devices_Logo.png');

            % Show the figure after all components are created
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LTEApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure)
            delete(app.GridFig);
        end
    end
end

function PlotResourceGrid(GridAxes,grid,colors)      
     
    % Determine number of subcarriers 'K' and number of OFDM symbols 'L'
    % in input resource grid
    K = size(grid,1);
    L = size(grid,2);
    
    % Pad edges of resource grid and colors
    grid = [zeros(K,1) grid zeros(K,2)];
    grid = [zeros(1,L+3); grid; zeros(2,L+3)];    
    colors = [zeros(K,1) colors zeros(K,2)];
    colors = [zeros(1,L+3); colors; zeros(1,L+3)];    
    for k = 1:K+3
        for l = L+3:-1:2
            if (grid(k,l)==0 && grid(k,l-1)~=0)
                grid(k,l) = grid(k,l-1);                
            end
        end
    end    
    for l = 1:L+3
        for k = K+3:-1:2
            if (grid(k,l)==0 && grid(k-1,l)~=0)
                grid(k,l) = grid(k-1,l);  
            end
        end
    end     
    
    % Create resource grid power matrix, with a floor of -40dB
    powers = 20*log10(grid+1e-2);
    
    % Create surface plot of powers
    h = surf(GridAxes, (-1:L+1)-0.5,(-1:K+1)-0.5,powers,colors);                    
     
    % Create and apply color map
    map=[0.50 0.50 0.50; ...
         0.75 0.75 0.75; ...
         0.00 1.00 1.00; ...
         1.00 0.20 0.60; ...
         0.00 0.00 1.00; ...
         0.00 1.00 0.00; ...
         0.50 0.00 0.50; ...
         1.00 0.50 0.00; ...
         1.00 1.00 0.00; ...
         1.00 0.00 0.00; ...
         1.00 1.00 1.00; ...
         1.00 0.00 0.00; ...
         ];     
    caxis(GridAxes, [0 12])
    colormap(GridAxes, map);
    set(h,'EdgeColor',[0.25 0.25 0.25]);
    
    % Set view and axis ranges
    az = -12.5;
    el = 66;
    view(GridAxes, az,el);
    axis(GridAxes, [-1.5 L+0.5 -1.5 K+0.5 min(powers(:))-5 max(powers(:))+5]);

    % Set plot axis labels
    zlabel(GridAxes, 'Power (dB)');
    ylabel(GridAxes, 'Subcarrier index');
    xlabel(GridAxes, 'OFDM symbol index');        
    
end

function PlotTransmitResourceGrid(GridAxes,enb,grid)
                
    % Create patches (outside of final view) to facilitate the creation 
    % of the legend
    hold(GridAxes, 'on');
    for i=1:9
        patch(GridAxes, [-2 -3 -3 -2],[-2 -2 -3 -3],i);
    end            
    
    % Obtain resource grid colorization
    colors = IdentifyDLChannels(enb,grid);
    
    % Plot resource grid
    PlotResourceGrid(GridAxes,abs(grid),colors);
    
    % Add plot title and set view
    view(GridAxes, [0 90]);
    
    % Add legend
    legend(GridAxes, 'unused','Cell RS','PSS','SSS','PBCH','PCFICH','PHICH', ...
            'PDCCH','PDSCH','Location','NorthEastOutside');

end

function colors = IdentifyDLChannels(enb,grid)
    
    % Initialization of output
    colors = ones(size(grid));
    
    % Determine subframe length 'L' (in OFDM symbols) and the number of 
    % subframes 'nsf' in the input grid 
    dims = lteDLResourceGridSize(enb);
    L = dims(2);
    nsf = size(grid,2)/L;
    
    % Initialization of PDSCH physical resource block set
    enb.PDSCH.PRBSet = (0:enb.NDLRB-1).';
    
    % Loop for each subframe
    for i=0:nsf-1

        % Configure subframe number
        enb.NSubframe=mod(i,10);   
        
        % Create empty resource grid
        sfcolors = lteDLResourceGrid(enb);  
    
        % Colourize the Resource Elements for each channel and signal
        sfcolors(lteCellRSIndices(enb,0)) = 1;
        sfcolors(ltePSSIndices(enb,0)) = 2;
        sfcolors(lteSSSIndices(enb,0)) = 3;
        sfcolors(ltePBCHIndices(enb)) = 4;
        duplexingInfo = lteDuplexingInfo(enb);
         if (duplexingInfo.NSymbolsDL~=0)
             sfcolors(ltePCFICHIndices(enb)) = 5;
             sfcolors(ltePHICHIndices(enb)) = 6;
             sfcolors(ltePDCCHIndices(enb)) = 7;
             sfcolors(ltePDSCHIndices(enb,enb.PDSCH,enb.PDSCH.PRBSet)) = 8;
         end
        
        % Set current subframe into output
        colors(:,i*L+(1:L)) = colors(:,i*L+(1:L)) + sfcolors;
    end
end