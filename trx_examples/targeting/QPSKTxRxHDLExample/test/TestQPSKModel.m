classdef TestQPSKModel < matlab.unittest.TestCase

    properties(TestParameter)
        gain = num2cell(linspace(0.2,2,20));
    end

    properties
        root = '';
    end
    
    methods(TestClassSetup)
        function addpaths(testCase)
            here = mfilename('fullpath');
            here = strsplit(here,filesep);
            if isunix
                here = fullfile(filesep,here{1:end-2});
            end
            testCase.root = here;
        end
    end

    methods (TestMethodTeardown)
        function cleanupEnv(~)
            bdclose('all');
        end
    end

    methods (Test)
        % Test methods

        function testRunStockConfiguration(testCase)
            % Close existing
            bdclose('all');
            pause(2);
            % Run model
            open_system('commhdlQPSKTxRx_REF');
            pause(10);
            % commhdlQPSKTxRxModelInit;
            % clear simTimingOffset;
            sim('commhdlQPSKTxRx_REF');
            pause(5);
            % Check errors
            load('init_data.mat');
            QPSKTxRxVerification;
            testCase.verifyEqual(nMissedPkts,0);
            testCase.verifyEqual(nErrBits,0);
            testCase.verifyEqual(nReceivedBits,67200);
        end

        function testRunCustomConfiguration(testCase, gain)
            disp(gain);
            % Close existing
            bdclose('all');

            %% Open model
            pause(1);
            open_system('commhdlQPSKTxRx');
            pause(1);

            %% Run with stock settings
            % % Set params
            % use_tx_model_source = 'true'; % must be string
            % use_scrambling = "false"; % must be string
            % rx_datafile = 'rx_capture.mat';
            % 
            % set_param("commhdlQPSKTxRx/TxSourceControl", "Value", use_tx_model_source)
            % set_param("commhdlQPSKTxRx/QPSK Rx/HDL Data Descrambler/EnableScrambling",...
            %     "Value", use_scrambling);
            % set_param("commhdlQPSKTxRx/QPSK Tx/HDL Data Scrambler/EnableScrambling",...
            %     "Value", use_scrambling);
            % set_param("commhdlQPSKTxRx/RxCaptureFromHW",...
            %     "FileName", rx_datafile);
            % 
            % % Run model
            % sim('commhdlQPSKTxRx');
            % pause(5);
            % disp('----------------');
            % load('init_data.mat'); %#ok<LOAD>
            % QPSKTxRxVerification; % 32534

            %% Loop through radio
            % load('init_data.mat'); %#ok<LOAD>  Need Rsym
            % adrv9002_loop;

            %% Run with new captured data
            use_tx_model_source = 'false'; % must be string
            use_scrambling = "false"; % must be string
            rx_datafile = 'rx_capture_adrv9002.mat';

            set_param("commhdlQPSKTxRx/TxSourceControl", "Value", use_tx_model_source)
            set_param("commhdlQPSKTxRx/QPSK Rx/HDL Data Descrambler/EnableScrambling",...
                "Value", use_scrambling);
            set_param("commhdlQPSKTxRx/QPSK Tx/HDL Data Scrambler/EnableScrambling",...
                "Value", use_scrambling);
            set_param("commhdlQPSKTxRx/Gain2",...
                "Gain", string(gain));
            set_param("commhdlQPSKTxRx/RxCaptureFromHW",...
                "FileName", rx_datafile);

            % Run model
            sim('commhdlQPSKTxRx');
            pause(5);
            disp('----------------');


            %% Check errors
            load('init_data.mat'); %#ok<LOAD>
            QPSKTxRxVerification; % 32534
            testCase.verifyEqual(nMissedPkts,0);
            % testCase.verifyEqual(nErrBits,0);
            ber = nErrBits / nReceivedBits;
            testCase.verifyLessThanOrEqual(ber, 0.01);
            testCase.verifyGreaterThanOrEqual(nReceivedBits, 10000);
        end
    end

end