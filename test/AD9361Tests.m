classdef AD9361Tests < HardwareTests
    
    properties
        uri = 'ip:localhost';
        author = 'ADI';
    end

    properties (TestParameter)
        attribute_single_value = {
                % property, attr, start, stop, step, tol, repeats
                {'rx.SamplingRate', 'sampling_frequency', 2.084e6, 61.44e6, 10e3, 4, 20}; %repeats: 20, 100, 20
                {'rx.CenterFrequency', 'frequency', 70e6, 6e9, 1e6, 4, 100};
                {'rx.RFBandwidth', 'rf_bandwidth', 200e3, 56e6, 10e3, 30, 20};
                {'tx.CenterFrequency', 'frequency', 47e6, 6e9, 1e6, 4, 100};
                {'tx.RFBandwidth', 'rf_bandwidth',  200e3, 56e6, 10e3, 30, 20};
                {'tx.AttenuationChannel0', 'hardwaregain', -89.75, 0.0, 0.25, 0, 20};
                {'tx.AttenuationChannel1', 'hardwaregain', -89.75, 0.0, 0.25, 0, 20};
            }
        attribute_single_value_str = {
                % attr, option
                {'rx.GainControlModeChannel0','gain_control_mode',["manual","slow_attack","fast_attack","hybrid"]};
                {'rx.GainControlModeChannel1','gain_control_mode',["manual","slow_attack","fast_attack","hybrid"]};
                {'rx.RFPortSelect','rf_port_select',["A_BALANCED","B_BALANCED","C_BALANCED","A_N","A_P","B_N","B_P",...
                            "C_N","C_P","TX_MONITOR1","TX_MONITOR2","TX_MONITOR1_2"]};
                {'rx.LoopbackMode','loopback',[0, 1, 2]};
                {'rx.EnableQuadratureTracking', 'quadrature_tracking_en', logical([0 1])};
                {'rx.EnableRFDCTracking', 'rf_dc_offset_tracking_en', logical([0 1])};
                {'rx.EnableBasebandDCTracking', 'bb_dc_offset_tracking_en', logical([0 1])};
                {'tx.RFPortSelect','rf_port_select',["A", "B"]};
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

    methods (Test, ParameterCombination='sequential')
    
        function testAD9361AttributeSingleValue(testCase,attribute_single_value)
            warning('off') % Mute: "The AttenuationChannel1 property is not relevant in this configuration of the System object."
            property = (attribute_single_value{1});
            obj = property(1:2);
            property(1:3) = [];
            attr = (attribute_single_value{2});
            start = (attribute_single_value{3});
            stop = (attribute_single_value{4});
            step = (attribute_single_value{5});
            tol = (attribute_single_value{6});
            repeats = (attribute_single_value{7});

            isOutput = strcmp(obj,'tx');
            if strcmp(property,'CenterFrequency')
                    id = sprintf('altvoltage%d',strcmp(obj,'tx'));
                    isOutput = true;
            elseif strcmp(property(1:end-1),'AttenuationChannel')
                    id = sprintf('voltage%s', property(end));
            else
                id = 'voltage1';
            end

            rx = adi.AD9361.Rx('uri',testCase.uri);
            rx(); %FIXME: RFBandwidth read errors without stepping before writing
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx();

            numints = round((stop-start)/step);
            for ii = 1:repeats
                ind = randi([0, numints]);
                write_val = start+(step*ind);
                if strcmp(obj,'rx')
                    rx.(property) = write_val;
                    rx();
                    ret_val = double(rx.getAttributeLongLong(id,attr,isOutput));
                elseif strcmp(obj,'tx')
                    tx.(property) = write_val;
                    tx();
                    if strcmp(property(1:end-1),'AttenuationChannel')
                        ret_val = double(tx.getAttributeDouble(id,attr,isOutput));
                    else
                        ret_val = double(tx.getAttributeLongLong(id,attr,isOutput));
                    end
                end
                testCase.verifyEqual(ret_val,write_val,'AbsTol',tol,...
                    [(property), ': Actual value written to device outside tolerance']);
            end
            rx.release();
            tx.release();
        end

        function testAD9361AttributeSingleValueStr(testCase,attribute_single_value_str)
            obj = (attribute_single_value_str{1});
            property = obj(4:end);
            obj(3:end) = [];
            attr = (attribute_single_value_str{2});
            option = (attribute_single_value_str{3});

            rx = adi.AD9361.Rx('uri',testCase.uri);
            tx = adi.AD9361.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';

            if strcmp(property(1:end-1),'GainControlModeChannel')
                id = sprintf('voltage%d',strcmp(property(end),'1'));
                rx();
            else
                id = 'voltage1';
            end

            for ii = 1:length(option)
                if strcmp(obj,'rx')
                    rx.(property) = option(ii);
                    rx();
                    if strcmp(property,'LoopbackMode')
                        ret_val = rx.getDebugAttributeLongLong(attr);
                    elseif strcmp(property,'EnableQuadratureTracking') | ... 
                            strcmp(property,'EnableRFDCTracking') | ... 
                            strcmp(property,'EnableBasebandDCTracking')
                        ret_val = rx.getAttributeBool(id,attr,false);
                    else
                        ret_val = rx.getAttributeRAW(id,attr,false);
                    end
                    if ~strcmp(property(1:end-1),'GainControlModeChannel')
                        rx.release(); %Releasing here will not work for GainControlMode
                    end
                elseif strcmp(obj,'tx')
                    tx.(property) = option(ii);
                    tx();
                    ret_val = tx.getAttributeRAW(id,attr,true);
                    tx.release(); %Release required before writing to nontunable property
                end
                testCase.verifyTrue(strcmp(string(ret_val),string(option(ii))),...
                    [(attr), ': Cannot set channel attritute to ', string(option(ii))])
            end
            rx.release();
            tx.release();
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

