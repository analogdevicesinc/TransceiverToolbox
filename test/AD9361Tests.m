classdef AD9361Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        author = 'ADI';
    end

    properties (TestParameter)
        attribute_single_value = {
                % object, property, valtype, id, isOutput, attribute, start, stop, step, tol, repeats
                {'rx', 'SamplingRate', 'LongLong', 'voltage1', false, 'sampling_frequency', 2.084e6, 61.44e6, 10e3, 4, 20};
                {'rx', 'CenterFrequency', 'LongLong', 'altvoltage0', true, 'frequency', 70e6, 6e9, 1e6, 4, 100};
                {'rx', 'RFBandwidth', 'LongLong', 'voltage0', false, 'rf_bandwidth', 200e3, 56e6, 10e3, 30, 20};
                {'rx', 'GainChannel0', 'Double', 'voltage0', false, 'hardwaregain', -3, 71, 1, 0, 20};
                {'rx', 'GainChannel1', 'Double', 'voltage1', false, 'hardwaregain', -3, 71, 1, 0, 20};
                {'tx', 'CenterFrequency', 'LongLong', 'altvoltage1', true, 'frequency', 47e6, 6e9, 1e6, 4, 100};
                {'tx', 'RFBandwidth', 'LongLong', 'voltage1', true, 'rf_bandwidth',  200e3, 56e6, 10e3, 30, 20};
                {'tx', 'AttenuationChannel0', 'Double', 'voltage0', true, 'hardwaregain', -89.75, 0.0, 0.25, 0, 20};
                {'tx', 'AttenuationChannel1', 'Double', 'voltage1', true, 'hardwaregain', -89.75, 0.0, 0.25, 0, 20};
            }
        attribute_single_value_str = {
                % attr, option
                {'rx', 'GainControlModeChannel0', 'RAW', 'voltage0', false, 'gain_control_mode',["manual","slow_attack","fast_attack","hybrid"]};
                {'rx', 'GainControlModeChannel1', 'RAW', 'voltage1', false, 'gain_control_mode',["manual","slow_attack","fast_attack","hybrid"]};
                {'rx', 'RFPortSelect', 'RAW', 'voltage1', false,'rf_port_select',["A_BALANCED","B_BALANCED","C_BALANCED","A_N","A_P","B_N","B_P",...
                            "C_N","C_P","TX_MONITOR1","TX_MONITOR2","TX_MONITOR1_2"]};
                {'rx', 'LoopbackMode', 'DebugLongLong', 'voltage1', false, 'loopback',[0, 1, 2]};
                {'rx', 'EnableQuadratureTracking', 'Bool', 'voltage1', false, 'quadrature_tracking_en', logical([0 1])};
                {'rx', 'EnableRFDCTracking', 'Bool', 'voltage1', false, 'rf_dc_offset_tracking_en', logical([0 1])};
                {'rx', 'EnableBasebandDCTracking', 'Bool', 'voltage1', false, 'bb_dc_offset_tracking_en', logical([0 1])};
                {'tx', 'RFPortSelect', 'RAW', 'voltage1', true, 'rf_port_select',["A", "B"]};
            }
    end
    
    methods(TestClassSetup)
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.AD9361.Rx;
            testCase.CheckDevice('ip',Device,testCase.uri(4:end),false);
        end
    end
    
    methods (Static)
        function estFrequency(data,fs)
            nSamp = length(data);
            FFTRxData  = fftshift(10*log10(abs(fft(data))));
            df = fs/nSamp;  freqRangeRx = (-fs/2:df:fs/2-df).'/1000;
            plot(freqRangeRx, FFTRxData);
        end
    end
    
    methods (Test)
    
        function testAD9361AttributeSingleValue(testCase,attribute_single_value)
            warning('off') % Mute: "The AttenuationChannel1 property is not relevant in this configuration of the System object."
            object = (attribute_single_value{1});
            property = (attribute_single_value{2});
            valueType = (attribute_single_value{3});
            id = (attribute_single_value{4});
            isOutput = (attribute_single_value{5});
            attr = (attribute_single_value{6});
            start = (attribute_single_value{7});
            stop = (attribute_single_value{8});
            step = (attribute_single_value{9});
            tol = (attribute_single_value{10});
            repeats = (attribute_single_value{11});
            
            switch object
            case 'rx'
                obj = adi.AD9361.Rx('uri',testCase.uri);
                if strcmp(property(1:end-1),'GainChannel')
                    obj.EnabledChannels = [1 2];
                    obj.(strcat('GainControlModeChannel',property(end))) = 'manual';
                end
            case 'tx'
                obj = adi.AD9361.Tx('uri',testCase.uri);
                obj.DataSource = 'DDS';
            end
            obj(); %FIXME: RFBandwidth read errors without stepping before writing
            
            numints = round((stop-start)/step);
            for ii = 1:repeats
                ind = randi([0, numints]);
                write_val = start+(step*ind);
                obj.(property) = write_val;
                obj();
                switch valueType
                    case 'LongLong'
                        ret_val = double(obj.getAttributeLongLong(id,attr,isOutput));
                    case 'Double'
                        ret_val = double(obj.getAttributeDouble(id,attr,isOutput));
                end
                testCase.verifyEqual(ret_val,write_val,'AbsTol',tol,...
                    sprintf('%s.%s: Actual value written to device outside tolerance.', (object), (property)))
            end
            obj.release();

        end

        function testAD9361AttributeSingleValueStr(testCase,attribute_single_value_str)
            object = (attribute_single_value_str{1});
            property = (attribute_single_value_str{2});
            valueType = (attribute_single_value_str{3});
            id = (attribute_single_value_str{4});
            isOutput = (attribute_single_value_str{5});
            attr = (attribute_single_value_str{6});
            option = (attribute_single_value_str{7});

            switch object
            case 'rx'
                obj = adi.AD9361.Rx('uri',testCase.uri);
                obj.EnabledChannels = [1 2];
            case 'tx'
                obj = adi.AD9361.Tx('uri',testCase.uri);
                obj.DataSource = 'DDS';
            end

            if strcmp(property(1:end-1),'GainControlModeChannel')
                obj();
            end

            for ii = 1:length(option)
                obj.(property) = option(ii);
                obj();
                switch valueType
                case 'DebugLongLong'
                    ret_val = obj.getDebugAttributeLongLong(attr);
                case 'Bool'
                    ret_val = obj.getAttributeBool(id,attr,isOutput);
                case 'RAW'
                    ret_val = obj.getAttributeRAW(id,attr,isOutput);
                end
                if ~strcmp(property(1:end-1),'GainControlModeChannel')
                    obj.release(); %FIXME: Releasing here will not work for GainControlMode
                end
                testCase.verifyTrue(strcmp(string(ret_val),string(option(ii))),...
                    sprintf('%s.%s: Cannot set channel attribute to %s.', (object), (property), string(option(ii))))
            end
            obj.release();
        end
        
    end

    methods (Test)
        
        function testAD9361Rx(testCase)
            % Test Rx DMA data output
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testAD9361RxCustomFilter(testCase)
            % Test Rx Custom filters
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'customAD9361filter.ftr';
            [out, valid] = rx();
            % Check sample rate
            sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr),3000000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testAD9361RxCustomFilterLTE(testCase)
            % Test Rx Custom filters
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomFilter = true;
            rx.CustomFilterFileName = 'LTE15_MHz.ftr';
            [out, valid] = rx();
            % Check sample rate
            sr = rx.getAttributeLongLong('voltage0','sampling_frequency',false);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr),23040000,'Incorrect sample rate');
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testAD9361TxCustomFilter(testCase)
            % Test Tx Custom filters
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.EnabledChannels = 1;
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'customAD9361filter.ftr';
            data = complex(randn(1e4,1),randn(1e4,1));
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),3000000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),3000000,'Incorrect sample rate');
        end
        
        function testAD9361TxCustomFilterLTE(testCase)
            % Test Tx Custom filters
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.EnabledChannels = 1;
            tx.EnableCustomFilter = true;
            tx.CustomFilterFileName = 'LTE15_MHz.ftr';
            data = complex(randn(1e4,1),randn(1e4,1));
            [valid] = tx(data);
            % Check sample rate
            sr1 = tx.getAttributeLongLong('voltage0','sampling_frequency',false);
            sr2 = tx.getAttributeLongLong('voltage0','sampling_frequency',true);
            tx.release();
            testCase.verifyTrue(valid);
            testCase.verifyEqual(double(sr1),23040000,'Incorrect sample rate');
            testCase.verifyEqual(double(sr2),23040000,'Incorrect sample rate');
        end
        
        function testAD9361RxClearing(testCase)
            % Verify clearing of system objects is working in all cases
            rx = adi.AD9361.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e1');
            end
            rx();
            if rx.Count ~= 1
                error('e2');
            end
            rx.release();
            if rx.Count ~= 0
                error('e3');
            end
            %
            rx = adi.AD9361.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e4');
            end
            rx();
            delete(rx)
            rx = adi.AD9361.Rx();
            rx.uri = testCase.uri;
            if rx.Count ~= 0
                error('e5');
            end
            rx();            
            if rx.Count ~= 1
                error('e6');
            end
            %
            rx.release();
        end
        
        function testAD9361RxWithTxDDS(testCase)
            % Test DDS output
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 5e5;
            tx.DDSFrequencies = repmat(toneFreq,2,2);
            tx.AttenuationChannel0 = -10;
            tx.SamplingRate = 3e6;
            tx();
            pause(1);
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            rx.SamplingRate = 3e6;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),rx.SamplingRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testAD9361RxWithTxData(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 0.12e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 1e4*10;
            swv1.SampleRate = 3e6;
            y = swv1();
            
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx(y);
            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rx.SamplingRate);
            freqEst = meanfreq(double(real(out)),rx.SamplingRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
    end
    
end

