classdef TestQPSKModel < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
        function cleanEnv(~)

        end
    end

    methods (TestMethodSetup)
        % Setup for each test
        function cleanUpEnv(~)
            % bdclose('all');
        end
    end

    methods (TestMethodTeardown)
        function cleanupEnv(~)
            % bdclose('all');
        end
    end

    methods (Test)
        % Test methods

        function testRunStockConfiguration(testCase)
            % Close existing
            bdclose('all');
            pause(2);
            % Run model
            % sim('commhdlQPSKTxRx');
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

        function testRunCustomConfiguration(testCase)
            % Close existing
            % bdclose('all');
            pause(1);
            open_system('commhdlQPSKTxRx');
            pause(1);

            use_tx_model_source = 'false'; % must be string
            use_scrambling = "false"; % must be string

            set_param("commhdlQPSKTxRx/TxSourceControl", "Value", use_tx_model_source)
            set_param("commhdlQPSKTxRx/QPSK Rx/HDL Data Descrambler/EnableScrambling",...
                "Value", use_scrambling);
            set_param("commhdlQPSKTxRx/QPSK Tx/HDL Data Scrambler/EnableScrambling",...
                "Value", use_scrambling);

            % Run model
            sim('commhdlQPSKTxRx');
            pause(5);

            % Check errors
            load('init_data.mat'); %#ok<LOAD>
            QPSKTxRxVerification;
            testCase.verifyEqual(nMissedPkts,0);
            testCase.verifyEqual(nErrBits,0);
            testCase.verifyEqual(nReceivedBits,67200);
        end
    end

end