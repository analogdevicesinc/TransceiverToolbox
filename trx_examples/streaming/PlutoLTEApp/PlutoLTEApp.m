classdef PlutoLTEApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure  matlab.ui.Figure
        Panel                         matlab.ui.container.Panel
        TestConfigurationButtonGroup  matlab.ui.container.ButtonGroup
        RMCButton                     matlab.ui.control.RadioButton
        ETMLabel                      matlab.ui.control.Label
        TMNDropDown                   matlab.ui.control.DropDown
        TMNDropDownLabel              matlab.ui.control.Label
        BWDropDown                    matlab.ui.control.DropDown
        BWDropDownLabel               matlab.ui.control.Label
        RCDropDown                    matlab.ui.control.DropDown
        RCDropDownLabel               matlab.ui.control.Label
        Panel_14                      matlab.ui.container.Panel
        GridLayout                    matlab.ui.container.GridLayout
        PlayButton                    matlab.ui.control.Button
        StopButton                    matlab.ui.control.Button
        StatusLight                   matlab.ui.control.Lamp
        LOEditFieldLabel              matlab.ui.control.Label
        LOEditField                   matlab.ui.control.NumericEditField
        MHzLabel                      matlab.ui.control.Label
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
        PDSCHConstellationLabel
        PDSCHConstellationValLabel
        PowerBalacingConstellationLabel
        PowerBalacingConstellationValLabel
    end
    
    properties (Access = private)        
        EVMSymbolRMSPlotLine
        EVMSymbolPeakPlotLine
        EVMScRMSPlotLine
        EVMScPeakPlotLine
        EVMRbRMSPlotLine
        EVMRbPeakPlotLine
        RecConstPlot
        RefConstPlot
    end
    
    properties (SetAccess = private, SetObservable)
        PlutoLTEAppInternalsProp
    end
    
    properties (Access = public)
        PlutoNotFound = true        
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
            app.SummaryTable1.Data(1, 2) = ...
                {sprintf('%s', app.PlutoLTEAppInternalsProp.CyclicPrefix)};            
        end
        
        % Method to handle change in NCellID
        function handleNCellID(app, ~, ~)
            app.SummaryTable1.Data(2, 2) = ...
                {sprintf('%d', num2str(app.PlutoLTEAppInternalsProp.NCellID))};            
        end
        
        % Method to handle change in FrameOffset
        function handleFrameOffset(app, ~, ~)
            app.SummaryTable1.Data(3, 2) = ...
                {sprintf('%0.3f ms', 1e3*app.PlutoLTEAppInternalsProp.FrameOffset)};
        end
        
        % Method to handle change in FrameOffset
        function handleFreqOffset(app, ~, ~)
            app.SummaryTable1.Data(4, 2) = ...
                {sprintf('%f Hz', app.PlutoLTEAppInternalsProp.FreqOffset)};
        end
        
        % Method to handle change in IQOffset
        function handleIQOffset(app, ~, ~)
            app.SummaryTable1.Data(5, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.IQOffset)};                
        end
    
        % Method to handle change in PSD_y
        function handlePSD(app, ~, ~)
            app.PSDAxes.XLim = ...
                [-0.5 0.5]*app.PlutoLTEAppInternalsProp.SamplingRate*1e-6;
            plot(app.PSDAxes, app.PlutoLTEAppInternalsProp.PSD_x*1e-6, ...
                app.PlutoLTEAppInternalsProp.PSD_y, 'y');                
        end
    
        % Method to handle change in PBCH EVM
        function handlePBCH_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(1, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_pbch_RMS)};                
        end
        
        % Method to handle change in PCFICH EVM
        function handlePCFICH_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(2, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_pcfich_RMS)};                
        end
        
        % Method to handle change in PDCCH EVM
        function handlePDCCH_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(3, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_pdcch_RMS)};                
        end
        
        % Method to handle change in PHICH EVM
        function handlePHICH_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(4, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_phich_RMS)};                
        end
        
        % Method to handle change in RS EVM
        function handleRS_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(5, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_rs_RMS)};                
        end
        
        % Method to handle change in PSS EVM
        function handlePSS_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(6, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_pss_RMS)};                
        end
        
        % Method to handle change in SSS EVM
        function handleSSS_RMS_EVM(app, ~, ~)
            app.SummaryTable2.Data(7, 2) = ...
                {sprintf('%f', app.PlutoLTEAppInternalsProp.evm_sss_RMS)};                
        end
        
        % Method to handle EVM vs Symbols plot
        function handleEVMSymbol(app, ~, ~)
            count = app.PlutoLTEAppInternalsProp.count;
            evmSymbolRMS = app.PlutoLTEAppInternalsProp.evmSymbol.RMS;
            evmSymbolPeak = app.PlutoLTEAppInternalsProp.evmSymbol.Peak;
            
            if (app.PlutoLTEAppInternalsProp.SubFrameIndex == 0)
                app.evmSymsAxes.YLim = [0 10];
                app.EVMSymbolRMSPlotLine = plot(app.evmSymsAxes, count:count+length(evmSymbolRMS)-1, evmSymbolRMS, 'color',[1 0.6 0], 'Marker', '.');
                hold(app.evmSymsAxes,'on');                
                app.EVMSymbolPeakPlotLine = plot(app.evmSymsAxes, count:count+length(evmSymbolPeak)-1, evmSymbolPeak, 'c', 'Marker', '.');
                legend(app.evmSymsAxes,{'\color{white} RMS','\color{white} Peak'}); 
                hold(app.evmSymsAxes,'off');
            else
                app.EVMSymbolRMSPlotLine.YData = [app.EVMSymbolRMSPlotLine.YData evmSymbolRMS.'];
                app.EVMSymbolPeakPlotLine.YData = [app.EVMSymbolPeakPlotLine.YData evmSymbolPeak.'];
                app.EVMSymbolRMSPlotLine.XData = [app.EVMSymbolRMSPlotLine.XData (count:count+length(evmSymbolRMS)-1)];
                app.EVMSymbolPeakPlotLine.XData = [app.EVMSymbolPeakPlotLine.XData (count:count+length(evmSymbolPeak)-1)];
            end   
            drawnow limitrate;
        end
        
        % Method to handle EVM vs Subcarriers plot
        function handleEVMSc(app, ~, ~)
            app.evmSCAxes.YLim = [0 10];
            evmScRMS = app.PlutoLTEAppInternalsProp.evmSC.RMS;
            evmScPeak = app.PlutoLTEAppInternalsProp.evmSC.Peak;
            
            if (app.PlutoLTEAppInternalsProp.SubFrameIndex == 0)
                hold(app.evmSCAxes,'off');
                app.EVMScRMSPlotLine = plot(app.evmSCAxes, 1:length(evmScRMS), evmScRMS, 'r.-');
                hold(app.evmSCAxes,'on');                
                app.EVMScPeakPlotLine = plot(app.evmSCAxes, 1:length(evmScPeak), evmScPeak, 'g.-');            
                legend(app.evmSCAxes,{'\color{white} RMS','\color{white} Peak'});                 
            else
                app.EVMScRMSPlotLine.YData = evmScRMS;
                app.EVMScPeakPlotLine.YData = evmScPeak;
            end             
            drawnow limitrate;
        end
        
        % Method to handle EVM vs resource blocks plot
        function handleEVMRb(app, ~, ~)
            app.evmRBAxes.YLim = [0 10];
            evmRbRMS = app.PlutoLTEAppInternalsProp.evmRB.RMS;
            evmRbPeak = app.PlutoLTEAppInternalsProp.evmRB.Peak;
            
            if (app.PlutoLTEAppInternalsProp.SubFrameIndex == 0)
                hold(app.evmRBAxes,'off');            
                app.EVMRbRMSPlotLine = plot(app.evmRBAxes, 1:length(evmRbRMS), evmRbRMS, ...
                    'color', [1 0.4 0.6], 'Marker', '.', 'LineStyle', '-');
                hold(app.evmRBAxes,'on');
                app.EVMRbPeakPlotLine = plot(app.evmRBAxes, 1:length(evmRbPeak), evmRbPeak, 'w.-');
                legend(app.evmRBAxes,{'\color{white} RMS','\color{white} Peak'}); 
            else
                app.EVMRbRMSPlotLine.YData = evmRbRMS.';
                app.EVMRbPeakPlotLine.YData = evmRbPeak.';
            end
            drawnow limitrate;        
        end
        
        % Method to handle received vs reference symbols constellation plot
        function handleDemodSyms(app, ~, ~)
            rxSymbols = app.PlutoLTEAppInternalsProp.DemodSyms.Rec;
            refSymbols = app.PlutoLTEAppInternalsProp.DemodSyms.Ref;
            
            if (app.PlutoLTEAppInternalsProp.SubFrameIndex == 0)
                hold(app.constAxes,'off'); 
                app.RecConstPlot = plot(app.constAxes, real(rxSymbols), imag(rxSymbols),...
                    'r', 'Marker','.', 'LineStyle', 'none');
                hold(app.constAxes,'on');     
                app.RefConstPlot = plot(app.constAxes, real(refSymbols), imag(refSymbols),...
                    'c', 'Marker','+', 'LineStyle', 'none');

            else
                app.RecConstPlot.YData = imag(rxSymbols).';
                app.RefConstPlot.YData = imag(refSymbols).';
                app.RecConstPlot.XData = real(rxSymbols).';
                app.RefConstPlot.XData = real(refSymbols).';
            end            
            drawnow limitrate; 
        end
        
        % Method to handle changes in FrameEVM
        function handleFrameEVM(app, ~, ~)
            msg = sprintf('Mean low edge EVM, frame %d: %0.3f%%\n', ...
               app.PlutoLTEAppInternalsProp.nFrame-1, app.PlutoLTEAppInternalsProp.FrameEVM.Low.RMS*100); 
            app.Label.Text = {msg};
            app.SummaryTable2.Data(8,2) = {sprintf('%0.3f', 100*app.PlutoLTEAppInternalsProp.FrameEVM.Low.RMS)};

            msg = sprintf('Mean high edge EVM, frame %d: %0.3f%%\n', ...
               app.PlutoLTEAppInternalsProp.nFrame-1, app.PlutoLTEAppInternalsProp.FrameEVM.High.RMS*100); 
            app.Label.Text = {msg};
            pad='     ';
            app.SummaryTable2.Data(9,2) = {sprintf('%0.3f %s', 100*app.PlutoLTEAppInternalsProp.FrameEVM.High.RMS, pad)};
            
            app.ListBox.Items = [app.ListBox.Items, sprintf('Mean EVM for frame %d: %0.3f%%\n', ...
                app.PlutoLTEAppInternalsProp.nFrame-1, ...
                app.PlutoLTEAppInternalsProp.FrameEVM.Overall(app.PlutoLTEAppInternalsProp.nFrame).RMS*100)]; 
            scroll(app.ListBox,'bottom'); 
        end
        
        % Method to handle changes in FinalEVM
        function handleFinalEVM(app, ~, ~)
            app.ListBox.Items = [app.ListBox.Items, ...
                sprintf('Mean overall EVM for trial: %0.3f%%\n', ...
                app.PlutoLTEAppInternalsProp.FinalEVM.RMS*100)]; 
            scroll(app.ListBox,'bottom');
            app.SummaryTable2.Data(10,2) = {sprintf('%0.3f', ...
                app.PlutoLTEAppInternalsProp.FinalEVM.RMS*100)};
        end
        
        % Code that executes after component creation
        function startupFcn(app)
            app.PlutoLTEAppInternalsProp = PlutoLTEAppInternals(app);
            
            addlistener(app.PlutoLTEAppInternalsProp, 'CyclicPrefix', 'PostSet', @app.handleCyclicPrefix);
            addlistener(app.PlutoLTEAppInternalsProp, 'FrameOffset', 'PostSet', @app.handleFrameOffset);
            addlistener(app.PlutoLTEAppInternalsProp, 'NCellID', 'PostSet', @app.handleNCellID);
            addlistener(app.PlutoLTEAppInternalsProp, 'FreqOffset', 'PostSet', @app.handleFreqOffset);
            addlistener(app.PlutoLTEAppInternalsProp, 'IQOffset', 'PostSet', @app.handleIQOffset);
            addlistener(app.PlutoLTEAppInternalsProp, 'PSD_y', 'PostSet', @app.handlePSD);
                        
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_pbch_RMS', 'PostSet', @app.handlePBCH_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_pcfich_RMS', 'PostSet', @app.handlePCFICH_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_pdcch_RMS', 'PostSet', @app.handlePDCCH_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_phich_RMS', 'PostSet', @app.handlePHICH_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_rs_RMS', 'PostSet', @app.handleRS_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_pss_RMS', 'PostSet', @app.handlePSS_RMS_EVM);
            addlistener(app.PlutoLTEAppInternalsProp, 'evm_sss_RMS', 'PostSet', @app.handleSSS_RMS_EVM);            
            
            addlistener(app.PlutoLTEAppInternalsProp, 'evmSymbol', 'PostSet', @app.handleEVMSymbol);            
            addlistener(app.PlutoLTEAppInternalsProp, 'evmSC', 'PostSet', @app.handleEVMSc);            
            addlistener(app.PlutoLTEAppInternalsProp, 'evmRB', 'PostSet', @app.handleEVMRb);            
            addlistener(app.PlutoLTEAppInternalsProp, 'FrameEVM', 'PostSet', @app.handleFrameEVM);            
            addlistener(app.PlutoLTEAppInternalsProp, 'FinalEVM', 'PostSet', @app.handleFinalEVM);            
            
            addlistener(app.PlutoLTEAppInternalsProp, 'DemodSyms', 'PostSet', @app.handleDemodSyms);            
            
            app.PlutoLTEAppInternalsProp.PlutoConnectionFcn(app);
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

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, ~)
            app.PlayButton.Enable = 'off';            
            notify(app, 'Play');
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, ~)
            app.Label.Text = {'Test stopped.'}; 
            notify(app, 'Stop');
        end
        
        % Value changed function: TMNDropDown
        function TMNDropDownValueChanged(app, ~)            
            value = app.TMNDropDown.Value;
            switch (value)
                case '3.1'
                    app.PDSCHConstellationValLabel.Text = '64-QAM';
                    app.constAxes.cla;
                    M = 64;
                    x = (0:M-1)';
                    y = qammod(x,M);
                    plot(app.constAxes, real(y)/6, imag(y)/6,...
                    'c', 'Marker','+', 'LineStyle', 'none');
                    drawnow;
                case '3.1a'
                    app.PDSCHConstellationValLabel.Text = '256-QAM';
                case '3.1b'
                    app.PDSCHConstellationValLabel.Text = '1024-QAM';
                case '3.2'
                    app.PDSCHConstellationValLabel.Text = '16-QAM';
                    app.constAxes.cla;
                    M = 16;
                    x = (0:M-1)';
                    y = qammod(x,M);
                    plot(app.constAxes, real(y)/(3*sqrt(2)), imag(y)/(3*sqrt(2)),...
                    'c', 'Marker','+', 'LineStyle', 'none');
                    drawnow;
                case '3.3'
                    app.PDSCHConstellationValLabel.Text = 'QPSK'; 
                    app.constAxes.cla;
                    M = 4;
                    x = (0:M-1)';
                    y = qammod(x,M);
                    plot(app.constAxes, 0.25*sqrt(2)*real(y), 0.25*sqrt(2)*imag(y),...
                    'c', 'Marker','+', 'LineStyle', 'none');
                    drawnow;
            end
        end
            
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure and hide until all components are created
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure = uifigure('Visible', 'off');
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Position = [0 40 1540 799];
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Name = 'LTE eNB Transmitter Conformance Tests Using PlutoSDR';
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.CloseRequestFcn = createCallbackFcn(app, @LTEeNBTxConformanceTestsUsingPlutoSDRUIFigureCloseRequest, true);

            % Create Panel
            app.Panel = uipanel(app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure);
            app.Panel.Position = [1 1 1545 795];

            % Create TestConfigurationButtonGroup
            app.TestConfigurationButtonGroup = uibuttongroup(app.Panel);
            app.TestConfigurationButtonGroup.TitlePosition = 'centertop';
            app.TestConfigurationButtonGroup.Title = 'Test Configuration';
            app.TestConfigurationButtonGroup.Position = [8 627 375 161];

            % Create ETMButton
            app.ETMLabel = uilabel(app.TestConfigurationButtonGroup);
            app.ETMLabel.Text = '     E-TM';
            app.ETMLabel.FontColor = [1 0 0];
            app.ETMLabel.Position = [121 120 68 22];
            app.ETMLabel.FontWeight = 'bold';
            app.ETMLabel.FontSize = 13;

            % Create TMNDropDown
            app.TMNDropDown = uidropdown(app.TestConfigurationButtonGroup);
            app.TMNDropDown.Items = {'3.1', '3.2', '3.3'};
            app.TMNDropDown.FontColor = [1 0 0];
            app.TMNDropDown.Position = [139 94 81 22];
            app.TMNDropDown.Value = '3.1';
            app.TMNDropDown.ValueChangedFcn = createCallbackFcn(app, @TMNDropDownValueChanged, true);

            % Create TMNDropDownLabel
            app.TMNDropDownLabel = uilabel(app.TestConfigurationButtonGroup);
            app.TMNDropDownLabel.HorizontalAlignment = 'right';
            app.TMNDropDownLabel.FontColor = [1 0 0];
            app.TMNDropDownLabel.Position = [99 94 31 22];
            app.TMNDropDownLabel.Text = 'TMN';

            % Create BWDropDown
            app.BWDropDown = uidropdown(app.TestConfigurationButtonGroup);
            app.BWDropDown.Items = {'5 MHz', '10 MHz'};
            app.BWDropDown.Value = '5 MHz';
            app.BWDropDown.FontColor = [1 0 0];
            app.BWDropDown.Position = [139 65 81 22];            
                        
            % Create LOEditFieldLabel
            app.LOEditFieldLabel = uilabel(app.TestConfigurationButtonGroup);
            app.LOEditFieldLabel.HorizontalAlignment = 'right';
            app.LOEditFieldLabel.Position = [48 5 75 22];
            app.LOEditFieldLabel.Text = 'LO (MHz)';
            
            % Create LOEditField
            app.LOEditField = uieditfield(app.TestConfigurationButtonGroup, 'numeric');
            app.LOEditField.Position = [135 5 77 22];
            app.LOEditField.Value = 2400;

            % Create BWDropDownLabel
            app.BWDropDownLabel = uilabel(app.TestConfigurationButtonGroup);
            app.BWDropDownLabel.HorizontalAlignment = 'right';
            app.BWDropDownLabel.FontColor = [1 0 0];
            app.BWDropDownLabel.Position = [99 65 25 22];
            app.BWDropDownLabel.Text = 'BW';

            % Create PDSCHConstellationLabel
            app.PDSCHConstellationLabel = uilabel(app.TestConfigurationButtonGroup);
            app.PDSCHConstellationLabel.HorizontalAlignment = 'right';
            app.PDSCHConstellationLabel.Position = [3 35 125 22];
            app.PDSCHConstellationLabel.Text = 'PDSCH Constellation';
            app.PDSCHConstellationLabel.FontColor = [0 0 1];
            app.PDSCHConstellationLabel.FontWeight = 'bold';
            
            % Create PDSCHConstellationValLabel
            app.PDSCHConstellationValLabel = uilabel(app.TestConfigurationButtonGroup);
            app.PDSCHConstellationValLabel.Position = [140 35 75 22];   
            app.PDSCHConstellationValLabel.Text = '64-QAM';
            app.PDSCHConstellationValLabel.FontColor = [0 0 1];
            
            % Create Panel_14
            app.Panel_14 = uipanel(app.TestConfigurationButtonGroup);
            app.Panel_14.Position = [240 0 130 130];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.Panel_14);

            % Create PlayButton
            app.PlayButton = uibutton(app.GridLayout, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Icon = '.\img\play.png';
            app.PlayButton.Layout.Row = 1;
            app.PlayButton.Layout.Column = [1 2];
            app.PlayButton.Text = '';

            % Create StopButton
            app.StopButton = uibutton(app.GridLayout, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Icon = '.\img\stop.png';
            app.StopButton.Layout.Row = 2;
            app.StopButton.Layout.Column = [1 2];
            app.StopButton.Text = '';

            % Create ListBox
            app.ListBox = uilistbox(app.Panel);
            app.ListBox.Items = {};
            app.ListBox.Position = [8 420 375 200];
            app.ListBox.Value = {};

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
            title(app.PSDAxes, 'SPECTROGRAM');

            % Create Panel_9
            app.Panel_9 = uipanel(app.Panel);
            app.Panel_9.Position = [393 1 375 375];

            % Create evmSymsAxes
            app.evmSymsAxes = uiaxes(app.Panel_9);
            title(app.evmSymsAxes, 'EVM VS SYMBOLS')
            xlabel(app.evmSymsAxes, 'SYMBOLS')
            ylabel(app.evmSymsAxes,  'EVM %')
            app.evmSymsAxes.GridColor = [0.651 0.651 0.651];
            app.evmSymsAxes.Color = [0 0 0];
            app.evmSymsAxes.XGrid = 'on';
            app.evmSymsAxes.YGrid = 'on';
            app.evmSymsAxes.Position = [7 9 358 359];

            % Create Panel_10
            app.Panel_10 = uipanel(app.Panel);
            app.Panel_10.Position = [776 1 375 375];

            % Create evmSCAxes
            app.evmSCAxes = uiaxes(app.Panel_10);
            title(app.evmSCAxes, 'EVM VS SUBCARRIERS')
            xlabel(app.evmSCAxes, 'SUBCARRIERS')
            ylabel(app.evmSCAxes,  'EVM %')
            app.evmSCAxes.GridColor = [0.651 0.651 0.651];
            app.evmSCAxes.Color = [0 0 0];
            app.evmSCAxes.XGrid = 'on';
            app.evmSCAxes.YGrid = 'on';
            app.evmSCAxes.Position = [9 9 357 359];

            % Create Panel_11
            app.Panel_11 = uipanel(app.Panel);
            app.Panel_11.Position = [1160 1 375 375];

            % Create evmRBAxes
            app.evmRBAxes = uiaxes(app.Panel_11);
            title(app.evmRBAxes, 'EVM VS RESOURCE BLOCKS')
            xlabel(app.evmRBAxes, 'RB')
            ylabel(app.evmRBAxes,  'EVM %')
            app.evmRBAxes.GridColor = [0.651 0.651 0.651];
            app.evmRBAxes.Color = [0 0 0];
            app.evmRBAxes.XGrid = 'on';
            app.evmRBAxes.YGrid = 'on';
            app.evmRBAxes.Position = [6 9 359 359];

            % Create Panel_12
            app.Panel_12 = uipanel(app.Panel);
            app.Panel_12.Position = [1160 380 375 375];

            % Create constAxes
            app.constAxes = uiaxes(app.Panel_12);
            title(app.constAxes, 'SCATTERPLOT')
            xlabel(app.constAxes, 'I')
            ylabel(app.constAxes, 'Q')
            app.constAxes.GridColor = [0.651 0.651 0.651];
            app.constAxes.Color = [0 0 0];
            app.constAxes.XGrid = 'on';
            app.constAxes.YGrid = 'on';
            app.constAxes.Position = [9 8 358 359];
            app.constAxes.cla;
            M = 64;
            x = (0:M-1)';
            y = qammod(x,M);
            plot(app.constAxes, real(y)/6, imag(y)/6,...
            'c', 'Marker','+', 'LineStyle', 'none');
            drawnow;

            % Create Panel_13
            app.Panel_13 = uipanel(app.Panel);
            app.Panel_13.Position = [8 2 375 415];
            
            % Create SummaryTable1
            app.SummaryTable1 = uitable(app.Panel_13);
            app.SummaryTable1.ColumnWidth = {190,170};
            s1 = uistyle;
            s1.HorizontalAlignment = 'left';
            app.SummaryTable1.ColumnName = {'Property'; 'Value'};
            app.SummaryTable1.RowName = [];
            app.SummaryTable1.Position = [6 270 363 141];            
            app.SummaryTable1.Data = cell(5,2);
            
            app.SummaryTable1.Data{1,1} = 'CP Mode';
            s1.FontColor = 'black';
            addStyle(app.SummaryTable1,s1,'cell',[1 1]);
            addStyle(app.SummaryTable1,s1,'cell',[1 2]);
            
            app.SummaryTable1.Data{2,1} = 'Cell ID';
            s1.FontColor = 'cyan';
            addStyle(app.SummaryTable1,s1,'cell',[2 1]);
            addStyle(app.SummaryTable1,s1,'cell',[2 2]);
            
            app.SummaryTable1.Data{3,1} = 'Estimated Frame Offset';
            s1.FontColor = 'blue';
            addStyle(app.SummaryTable1,s1,'cell',[3 1]);
            addStyle(app.SummaryTable1,s1,'cell',[3 2]);
            
            app.SummaryTable1.Data{4,1} = 'Estimated Freq. Offset';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable1,s1,'cell',[4 1]);
            addStyle(app.SummaryTable1,s1,'cell',[4 2]);
            
            app.SummaryTable1.Data{5,1} = 'Estimated IQ Offset';
            s1.FontColor = 'green';
            addStyle(app.SummaryTable1,s1,'cell',[5 1]);
            addStyle(app.SummaryTable1,s1,'cell',[5 2]);
            
            % Create SummaryTable2
            app.SummaryTable2 = uitable(app.Panel_13);
            app.SummaryTable2.ColumnWidth = {190,170};
            s2 = uistyle;
            s2.HorizontalAlignment = 'left';
            app.SummaryTable2.ColumnName = {'Metric'; 'Value'};
            app.SummaryTable2.RowName = [];
            app.SummaryTable2.Position = [6 6 363 253];            
            app.SummaryTable2.Data = cell(8,2);
            
            app.SummaryTable2.Data{1,1} = 'PBCH EVM %';
            s2.FontColor = 'magenta';
            addStyle(app.SummaryTable2,s2,'cell',[1 1]);
            addStyle(app.SummaryTable2,s2,'cell',[1 2]);
                        
            app.SummaryTable2.Data{2,1} = 'PCFICH EVM %';
            s2.FontColor = 'black';
            addStyle(app.SummaryTable2,s2,'cell',[2 1]);
            addStyle(app.SummaryTable2,s2,'cell',[2 2]);
            
            app.SummaryTable2.Data{3,1} = 'PHICH EVM %';
            s2.FontColor = 'cyan';
            addStyle(app.SummaryTable2,s2,'cell',[3 1]);
            addStyle(app.SummaryTable2,s2,'cell',[3 2]);
            
            app.SummaryTable2.Data{4,1} = 'PDCCH EVM %';
            s2.FontColor = 'blue';
            addStyle(app.SummaryTable2,s2,'cell',[4 1]);
            addStyle(app.SummaryTable2,s2,'cell',[4 2]);
            
            app.SummaryTable2.Data{5,1} = 'RS EVM %';
            s2.FontColor = 'red';
            addStyle(app.SummaryTable2,s2,'cell',[5 1]);
            addStyle(app.SummaryTable2,s2,'cell',[5 2]);
            
            app.SummaryTable2.Data{6,1} = 'PSS EVM %';
            s2.FontColor = 'green';
            addStyle(app.SummaryTable2,s2,'cell',[6 1]);
            addStyle(app.SummaryTable2,s2,'cell',[6 2]);
            
            app.SummaryTable2.Data{7,1} = 'SSS EVM %';
            s2.FontColor = 'magenta';
            addStyle(app.SummaryTable2,s2,'cell',[7 1]);
            addStyle(app.SummaryTable2,s2,'cell',[7 2]);
            
            app.SummaryTable2.Data{8,1} = 'Mean Low Edge PDSCH EVM %';
            s2.FontColor = 'black';
            addStyle(app.SummaryTable2,s2,'cell',[8 1]);
            addStyle(app.SummaryTable2,s2,'cell',[8 2]);
            
            app.SummaryTable2.Data{9,1} = 'Mean High Edge PDSCH EVM %';
            s2.FontColor = 'cyan';
            addStyle(app.SummaryTable2,s2,'cell',[9 1]);
            addStyle(app.SummaryTable2,s2,'cell',[9 2]);
            
            app.SummaryTable2.Data{10,1} = 'Mean Overall PDSCH EVM %';
            s2.FontColor = 'blue';
            addStyle(app.SummaryTable2,s2,'cell',[10 1]);
            addStyle(app.SummaryTable2,s2,'cell',[10 2]);
            
            setColumnFormat(java(app.SummaryTable1), repmat( {'numeric'}, 1, size(app.SummaryTable1.Data,2) ) );
            setColumnFormat(java(app.SummaryTable2), repmat( {'numeric'}, 1, size(app.SummaryTable2.Data,2) ) );

            % Create Label
            app.Label = uilabel(app.Panel);
            app.Label.Position = [395 760 1045 27];
            app.Label.Text = '';
            app.Label.FontColor = 'b';

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Position = [1448 760 85 30]; % [15 700 90 90];
            app.Image.ImageSource = '.\img\Analog_Devices_Logo.png';

            % Show the figure after all components are created
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PlutoLTEApp

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
        end
    end
end