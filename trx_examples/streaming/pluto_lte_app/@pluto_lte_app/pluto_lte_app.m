classdef pluto_lte_app < matlab.apps.AppBase

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
        SummaryTable                  matlab.ui.control.Table
        PDSCHConstellationLabel
        PDSCHConstellationValLabel
        PowerBalacingConstellationLabel
        PowerBalacingConstellationValLabel
    end

    
    properties (Access = private)
        PlutoConnectionTimer % Timer to periodically check connection to Pluto     
        txsim = struct
        rxsim = struct
    end
    
    properties (Access = public)
        test_settings = struct('DeviceIP', 'ip:192.168.2.1',...
            'TxGain', -10, 'RxGainMode', 'slow_attack',...
            'RxBufferSize', 2^19, 'SamplingRate', 1e6)
        stop_test = false
    end
    
    methods (Access = public)
        
        function PlutoConnectionFcn(app,~,~)
            connectedRadios = findPlutoRadio;
            if ~isempty(connectedRadios)                
                status = ['Found Pluto. Radio Id: ''' connectedRadios.RadioID ''', SerialNum: ''' connectedRadios.SerialNum '''.'];
                app.Label.Text = {status};
            else                
                status = 'Pluto not found.';
                app.Label.Text = {status};
            end            
        end
        
    end
    
    methods (Access = private)
        
        function SDRLoopbackLTEEVMTest(app)
            count = 1;
            while (true)
                drawnow;
                if (app.stop_test)
                    app.PlayButton.Enable = 'on';           
                    app.stop_test = false;
                    return;
                end
                            
                app.ListBox.Items = [app.ListBox.Items,...
                   sprintf('Trial #%d: \n', count)]; 
                scroll(app.ListBox,'bottom');                 
                
                % LTE ETM Tx
                [eNodeBOutput, config] = app.TransmitterLTE();

                % stop if stop button has been pressed
                drawnow;
                if (app.stop_test)
                    app.PlayButton.Enable = 'on';           
                    app.stop_test = false;
                    return;
                end
                
                % Pluto captures
                dataRx = app.PlutoRadio(eNodeBOutput);

                % stop if stop button has been pressed
                drawnow;
                if (app.stop_test)
                    app.PlayButton.Enable = 'on';           
                    app.stop_test = false;
                    return;
                end
                
                % LTE ETM Rx
                app.ReceiverLTE(dataRx,config.txsim.SamplingRate,config.etm);
                count = count + 1;
            end
            
        end
        
        % function declarations 
        [eNodeBOutput, config] = TransmitterLTE(app)        
        dataRx = PlutoRadio(app, eNodeBOutput)                    
        ReceiverLTE(app, dataRx,samplingrate,configuration)        
        [finalEVM,plots] = local_PDSCHEVM(app, enb,cec,rxWaveform,varargin)        
        W = getEVMWindow(app, enb)
        foffset = frequencyOffsetCellRS(app, enb,cec,rxgrid)   
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.PlutoConnectionFcn();
        end

        % Button pushed function: FindPlutoButton
        function FindPlutoButtonPushed(app, event)
            app.PlutoConnectionFcn();
        end

        % Close request function: 
        % LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure
        function LTEeNBTxConformanceTestsUsingPlutoSDRUIFigureCloseRequest(app, event)
            delete(app);
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            app.PlutoConnectionFcn();
            if strcmp(app.Label.Text, 'Pluto not found.')
                return;
            end               
            
            app.PlayButton.Enable = 'off';
            
            % call loopback EVM test function
            app.SDRLoopbackLTEEVMTest();
            
            msg = sprintf('Test stopped.\n');
            app.Label.Text = {msg}; 
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            app.stop_test = true;
            app.Label.Text = {'Stopping test after finishing the current run...'}; 
            scroll(app.ListBox,'bottom');            
        end
        
        % Value changed function: TMNDropDown
        function TMNDropDownValueChanged(app, event)            
            value = app.TMNDropDown.Value;
            switch (value)
                case '3.1'
                    app.PDSCHConstellationValLabel.Text = '64-QAM';
                    app.constAxes.cla;
                    M = 64;
                    x = (0:M-1)';
                    y = qammod(x,M);
                    plot(app.constAxes, real(y)/6, imag(y)/6,...
                    'g', 'Marker','+', 'LineStyle', 'none');
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
                    'g', 'Marker','+', 'LineStyle', 'none');
                    drawnow;
                case '3.3'
                    app.PDSCHConstellationValLabel.Text = 'QPSK'; 
                    app.constAxes.cla;
                    M = 4;
                    x = (0:M-1)';
                    y = qammod(x,M);
                    plot(app.constAxes, 0.25*sqrt(2)*real(y), 0.25*sqrt(2)*imag(y),...
                    'g', 'Marker','+', 'LineStyle', 'none');
                    drawnow;
            end
        end
        
        % Value changed function: BWDropDown
        function BWDropDownValueChanged(app, event)            
        end
        
        function RCDropDownValueChanged(app, event)
            if ~(app.RMCButton.Value)
                app.RMCButton.Value = true;
                app.ETMLabel.Value = false;
            end
            value = app.RCDropDown.Value;
            switch (value)
                case 'R.4'
                    app.PDSCHConstellationValLabel.Text = 'QPSK';
                case 'R.5'
                    app.PDSCHConstellationValLabel.Text = '64-QAM';
                case 'R.6'
                    app.PDSCHConstellationValLabel.Text = '64-QAM';
                case 'R.7'
                    app.PDSCHConstellationValLabel.Text = '64-QAM';
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
            app.BWDropDown.ValueChangedFcn = createCallbackFcn(app, @BWDropDownValueChanged, true);
                        
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
            app.PlayButton.Icon = 'play.png';
            app.PlayButton.Layout.Row = 1;
            app.PlayButton.Layout.Column = [1 2];
            app.PlayButton.Text = '';

            % Create StopButton
            app.StopButton = uibutton(app.GridLayout, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Icon = 'stop.png';
            app.StopButton.Layout.Row = 2;
            app.StopButton.Layout.Column = [1 2];
            app.StopButton.Text = '';

            % Create ListBox
            app.ListBox = uilistbox(app.Panel);
            app.ListBox.Items = {};
            app.ListBox.Position = [8 380 375 240];
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
            'g', 'Marker','+', 'LineStyle', 'none');
            drawnow;

            % Create Panel_13
            app.Panel_13 = uipanel(app.Panel);
            app.Panel_13.Position = [8 2 375 375];
            
            % Create SummaryTable
            app.SummaryTable = uitable(app.Panel_13);
            s1 = uistyle;
            s1.HorizontalAlignment = 'left';
            app.SummaryTable.ColumnName = {'Property'; 'Value'};
            app.SummaryTable.RowName = [];
            app.SummaryTable.Position = [6 8 363 359];            
            app.SummaryTable.Data = cell(8,2);
            app.SummaryTable.Data{1,1} = 'CP Mode';
            s1.FontColor = 'black';
            addStyle(app.SummaryTable,s1,'cell',[1 1]);
            addStyle(app.SummaryTable,s1,'cell',[1 2]);
            
            app.SummaryTable.Data{2,1} = 'Cell ID';
            s1.FontColor = 'cyan';
            addStyle(app.SummaryTable,s1,'cell',[2 1]);
            addStyle(app.SummaryTable,s1,'cell',[2 2]);
            
            app.SummaryTable.Data{3,1} = 'Estimated Frame Offset';
            s1.FontColor = 'blue';
            addStyle(app.SummaryTable,s1,'cell',[3 1]);
            addStyle(app.SummaryTable,s1,'cell',[3 2]);
            
            app.SummaryTable.Data{4,1} = 'Estimated Freq. Offset';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable,s1,'cell',[4 1]);
            addStyle(app.SummaryTable,s1,'cell',[4 2]);
            
            app.SummaryTable.Data{5,1} = 'Estimated IQ Offset';
            s1.FontColor = 'green';
            addStyle(app.SummaryTable,s1,'cell',[5 1]);
            addStyle(app.SummaryTable,s1,'cell',[5 2]);
            
            app.SummaryTable.Data{6,1} = 'PBCH EVM %';
            s1.FontColor = 'magenta';
            addStyle(app.SummaryTable,s1,'cell',[6 1]);
            addStyle(app.SummaryTable,s1,'cell',[6 2]);
                        
            app.SummaryTable.Data{7,1} = 'PCFICH EVM %';
            s1.FontColor = 'black';
            addStyle(app.SummaryTable,s1,'cell',[7 1]);
            addStyle(app.SummaryTable,s1,'cell',[7 2]);
            
            app.SummaryTable.Data{8,1} = 'PHICH EVM %';
            s1.FontColor = 'cyan';
            addStyle(app.SummaryTable,s1,'cell',[8 1]);
            addStyle(app.SummaryTable,s1,'cell',[8 2]);
            
            app.SummaryTable.Data{9,1} = 'PDCCH EVM %';
            s1.FontColor = 'blue';
            addStyle(app.SummaryTable,s1,'cell',[9 1]);
            addStyle(app.SummaryTable,s1,'cell',[9 2]);
            
            app.SummaryTable.Data{10,1} = 'RS EVM %';
            s1.FontColor = 'red';
            addStyle(app.SummaryTable,s1,'cell',[10 1]);
            addStyle(app.SummaryTable,s1,'cell',[10 2]);
            
            app.SummaryTable.Data{11,1} = 'PSS EVM %';
            s1.FontColor = 'green';
            addStyle(app.SummaryTable,s1,'cell',[11 1]);
            addStyle(app.SummaryTable,s1,'cell',[11 2]);
            
            app.SummaryTable.Data{12,1} = 'SSS EVM %';
            s1.FontColor = 'magenta';
            addStyle(app.SummaryTable,s1,'cell',[12 1]);
            addStyle(app.SummaryTable,s1,'cell',[12 2]);
            
            app.SummaryTable.Data{13,1} = 'Mean Low Edge PDSCH EVM %';
            s1.FontColor = 'black';
            addStyle(app.SummaryTable,s1,'cell',[13 1]);
            addStyle(app.SummaryTable,s1,'cell',[13 2]);
            
            app.SummaryTable.Data{14,1} = 'Mean High Edge PDSCH EVM %';
            s1.FontColor = 'cyan';
            addStyle(app.SummaryTable,s1,'cell',[14 1]);
            addStyle(app.SummaryTable,s1,'cell',[14 2]);
            
            app.SummaryTable.Data{15,1} = 'Mean Overall PDSCH EVM %';
            s1.FontColor = 'blue';
            addStyle(app.SummaryTable,s1,'cell',[15 1]);
            addStyle(app.SummaryTable,s1,'cell',[15 2]);
            
            setColumnFormat(java(app.SummaryTable), repmat( {'numeric'}, 1, size(app.SummaryTable.Data,2) ) );

            % Create Label
            app.Label = uilabel(app.Panel);
            app.Label.Position = [395 760 1045 27];
            app.Label.Text = '';
            app.Label.FontColor = 'b';

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Position = [1448 760 85 30];
            app.Image.ImageSource = 'Analog_Devices_Logo.png';

            % Create Panel_4
            app.Panel_4 = uipanel(app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure);
            app.Panel_4.BorderType = 'none';
            app.Panel_4.Position = [1433 2 101 31];

            % Show the figure after all components are created
            app.LTEeNBTxConformanceTestsUsingPlutoSDRUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = pluto_lte_app

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