classdef ADRV9009Tests < HardwareTests
    
    properties
        uri = 'ip:analog';
        SamplingRateRX = 245.76e6;
        author = 'ADI';
    end
    
    properties (TestParameter)
        attribute_single_value = {
            % object, property, valtype, id, isOutput, attribute, start, stop, step, tol, repeats
            {'orx', 'AUXFrequency', 'LongLong', 'altvoltage1', true, 'AUX_OBS_RX_LO_frequency', 113e6, 6e9, 1e6, 4, 100};
            {'orx', 'CenterFrequency', 'LongLong', 'altvoltage0', true, 'frequency', 113e6, 6e9, 1e6, 4, 100}; % same channel accessed by rx and tx
            {'orx', 'Gain', 'Double', 'voltage2', false, 'hardwaregain', 1, 30, 0.5, 0, 20};
            {'rx', 'CenterFrequency', 'LongLong', 'altvoltage0', true, 'frequency', 113e6, 6e9, 1e6, 4, 100};
            {'rx', 'GainChannel0', 'Double', 'voltage0', false, 'hardwaregain', 1, 30, 0.5, 0, 20}; % setting large negative gain is accepted but writes positive value
            {'rx', 'GainChannel1', 'Double', 'voltage1', false, 'hardwaregain', 1, 30, 0.5, 0, 20};
            {'tx', 'CenterFrequency', 'LongLong', 'altvoltage0', true, 'frequency', 113e6, 6e9, 1e6, 4, 100}; % same channel accessed by rx
            {'tx', 'AttenuationChannel0', 'Double', 'voltage0', true, 'hardwaregain', -41.95, 0.0, 0.05, 0, 20};
            {'tx', 'AttenuationChannel1', 'Double', 'voltage1', true, 'hardwaregain', -41.95, 0.0, 0.05, 0, 20};
        }

        attribute_single_value_str = {
            % object, property, valtype, id, isOutput, attribute, options
            {'orx','EnableFrequencyHoppingModeCalibration','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_frm_en', logical([1 0])};
            {'orx', 'EnableQuadratureTracking', 'Bool', 'voltage2', false, 'quadrature_tracking_en', logical([0 1])};
            {'orx', 'LOSourceSelect', 'RAW', 'voltage2', false, 'rf_port_select', ["OBS_TX_LO","OBS_AUX_LO"]};
            {'rx', 'GainControlMode', 'RAW', 'voltage1', false, 'gain_control_mode', ["manual","slow_attack"]}; % write using channel 0, read using channel 1
            {'rx','EnableQuadratureCalibration','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_rx_qec_en', logical([0 1])};
            {'rx','EnablePhaseCorrection','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_rx_phase_correction_en', logical([0 1])};
            {'rx','EnableFrequencyHoppingModeCalibration','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_frm_en', logical([0 1])};
            {'rx', 'EnableQuadratureTrackingChannel0', 'Bool', 'voltage0', false, 'quadrature_tracking_en', logical([0 1])};
            {'rx', 'EnableQuadratureTrackingChannel1', 'Bool', 'voltage1', false, 'quadrature_tracking_en', logical([0 1])};
            {'rx', 'EnableHarmonicDistortionTrackingChannel0', 'Bool', 'voltage0', false, 'hd2_tracking_en', logical([0 1])};
            {'rx', 'EnableHarmonicDistortionTrackingChannel1', 'Bool', 'voltage1', false, 'hd2_tracking_en', logical([0 1])};
            {'tx','EnableQuadratureCalibration','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_tx_qec_en', logical([0 1])};
            {'tx','EnableLOLeakageCorrection','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_tx_lol_en', logical([0 1])};
            {'tx','EnableLOLeakageCorrectionExternal','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_tx_lol_ext_en', logical([0 1])};
            {'tx','EnableFrequencyHoppingModeCalibration','DeviceAttributeRAW','adrv9009','adrv9009','calibrate_frm_en', logical([0 1])};
            {'tx', 'EnableQuadratureTrackingChannel0', 'Bool', 'voltage0', true, 'quadrature_tracking_en', logical([0 1])};
            {'tx', 'EnableQuadratureTrackingChannel1', 'Bool', 'voltage1', true, 'quadrature_tracking_en', logical([0 1])};
            {'tx', 'EnableLOLeakageTrackingChannel0', 'Bool', 'voltage0', true, 'lo_leakage_tracking_en', logical([0 1])};
            {'tx', 'EnableLOLeakageTrackingChannel1', 'Bool', 'voltage1', true, 'lo_leakage_tracking_en', logical([0 1])};
        }

    end

    methods(TestClassSetup)
        % Check hardware connected
        function CheckForHardware(testCase)
            Device = @()adi.ADRV9009.Rx;
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

        function powerRx(orx)
            % Power down ORx
            orx.PowerdownChannel0 = true;
            orx.PowerdownChannel1 = true;
            orx();
            % Bring Rx back up
            rx = adi.ADRV9009.Rx('uri',orx.uri);
            rx.PowerdownChannel0 = false;
            rx.PowerdownChannel1 = false;
            rx();
            rx.release();
        end
    end
    
    methods (Test)
    
        function testADRV9009AttributeSingleValue(testCase,attribute_single_value)
            warning('off') % Mute: "... property is not relevant in this configuration of the System object."
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
                obj = adi.ADRV9009.Rx('uri',testCase.uri);
                if strcmp(property(1:end-1),'GainChannel')
                    obj.EnabledChannels = [1 2];
                    obj.GainControlMode = 'manual';
                end
            case 'tx'
                obj = adi.ADRV9009.Tx('uri',testCase.uri);
                obj.DataSource = 'DDS';
            case 'orx'
                obj = adi.ADRV9009.ORx('uri',testCase.uri);
                if strcmp(property,'AUXFrequency')
                    obj.LOSourceSelect = 'OBS_AUX_LO';
                end
            end
            obj();
            
            numints = round((stop-start)/step);
            for ii = 1:repeats
                ind = randi([0, numints]);
                write_val = start+(step*ind); 
                if strcmp(attr,'hardwaregain')
                    write_val = round(write_val,2);
                end
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

            if strcmp(object,'orx')
                testCase.powerRx(obj);
            end
            
            obj.release();
        end

        function testADRV9009AttributeSingleValueStr(testCase,attribute_single_value_str)
            object = (attribute_single_value_str{1});
            property = (attribute_single_value_str{2});
            valueType = (attribute_single_value_str{3});
            id = (attribute_single_value_str{4});
            isOutput = (attribute_single_value_str{5});
            attr = (attribute_single_value_str{6});
            option = (attribute_single_value_str{7});

            switch object
            case 'rx'
                obj = adi.ADRV9009.Rx('uri',testCase.uri);
                obj.EnabledChannels = [1 2];
            case 'tx'
                obj = adi.ADRV9009.Tx('uri',testCase.uri);
                obj.DataSource = 'DDS';
            case 'orx'
                obj = adi.ADRV9009.ORx('uri',testCase.uri);
            end

            if strcmp(property(1:end-1),'GainControlMode')
                id = 'voltage1';
                obj();
            end

            for ii = 1:length(option)
                obj.(property) = option(ii);
                obj();
                switch valueType
                case 'DeviceAttributeRAW'
                    ret_val = strcmp(obj.getDeviceAttributeRAW(attr,4),'1'); % returns char 1 or 0; confirm size_t len value
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

            if strcmp(object,'orx')
                testCase.powerRx(obj);
            end

            obj.release();
        end

    end
    
    methods (Test)
        
        function testADRV9009Rx(testCase)
            % Test Rx DMA data output
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            [out, valid] = rx();
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
        end
        
        function testADRV9009RxCustomProfile1(testCase)
            % Test Rx custom profiles
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            [out, valid] = rx();
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            txSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',true);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(rxSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
            testCase.verifyEqual(txSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
        end
        
        function testADRV9009RxCustomProfile2(testCase)
            % Test Rx custom profiles
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.EnableCustomProfile = true;
            rx.CustomProfileFileName = ...
                'Tx_BW400_IR491p52_Rx_BW200_OR245p76_ORx_BW400_OR491p52_DC245p76.txt';
            [out, valid] = rx();
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            txSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',true);
            rx.release();
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(rxSampleRate,int64(245.76e6),...
                'Invalid sample rate after profile write');
            testCase.verifyEqual(txSampleRate,int64(245.76e6*2),...
                'Invalid sample rate after profile write');
        end
%         
%         function testADRV9009RxCustomProfileZC706(testCase)
%             % Test Rx custom profiles
%             rx = adi.ADRV9009.Rx('uri',testCase.uri);
%             rx.EnabledChannels = 1;
%             rx.EnableCustomProfile = true;
%             rx.CustomProfileFileName = ...
%                 'Tx_BW100_IR122p88_Rx_BW100_OR122p88_ORx_BW100_OR122p88_DC122p88.txt';
%             [out, valid] = rx();
%             rxSampleRate = rx.getAttributeLongLong('voltage0',...
%                 'sampling_frequency',false);
%             rx.release();
%             testCase.verifyTrue(valid);
%             testCase.verifyGreaterThan(sum(abs(double(out))),0);
%             testCase.verifyEqual(rxSampleRate,int64(122880000),...
%                 'Invalid sample rate after profile write');
%         end
        
        function testADRV9009RxWithTxDDS(testCase)
            % Test DDS output
            tx = adi.ADRV9009.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq = 30e6;
            tx.DDSFrequencies = repmat(toneFreq,2,4);
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx();
            pause(1);
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,testCase.SamplingRateRX);
            freqEst = meanfreq(double(real(out)),rxSampleRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,toneFreq,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            
        end
        
        function testADRV9009RxWithTxDDSTwoChan(testCase)
            % Test DDS output
            tx = adi.ADRV9009.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            toneFreq1 = 30e6;
            toneFreq2 = 85e6;
            
            tx.DDSFrequencies = [toneFreq1,toneFreq1,toneFreq2,toneFreq2;...
                0,0,0,0];
            tx.DDSScales = [1,1,1,1;...
                0,0,0,0];
            tx.DDSPhases = [90000,0,90000,0;...
                0,0,0,0];
            
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx();
            pause(1);
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1,2];
            rx.kernelBuffersCount = 1;
            for k=1:10
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,rxSampleRate);
            freqEst = meanfreq(double(real(out)),rxSampleRate);

            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst(1),toneFreq1,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
            testCase.verifyEqual(freqEst(2),toneFreq2,'RelTol',0.01,...
                'Frequency of DDS tone unexpected')
        end
        
        function testADRV9009RxWithTxData(testCase)
            % Test Tx DMA data output
            amplitude = 2^15; frequency = 20e6;
            swv1 = dsp.SineWave(amplitude, frequency);
            swv1.ComplexOutput = true;
            swv1.SamplesPerFrame = 2^20;
            swv1.SampleRate = 245.76e6;
            y = swv1();
            
            tx = adi.ADRV9009.Tx('uri',testCase.uri);
            tx.DataSource = 'DMA';
            tx.EnableCyclicBuffers = true;
            tx.AttenuationChannel0 = -10;
            tx.EnableCustomProfile = true;
            tx.CustomProfileFileName = ...
                'Tx_BW200_IR245p76_Rx_BW200_OR245p76_ORx_BW200_OR245p76_DC245p76.txt';
            tx(y);
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = 1;
            rx.kernelBuffersCount = 1;
            for k=1:20
                valid = false;
                while ~valid
                    [out, valid] = rx();
                end
            end
            
            rxSampleRate = rx.getAttributeLongLong('voltage0',...
                'sampling_frequency',false);
            
            rx.release();

%             plot(real(out));
%             testCase.estFrequency(out,testCase.SamplingRateRX);
            freqEst = meanfreq(double(real(out)),rxSampleRate);
            
            testCase.verifyTrue(valid);
            testCase.verifyGreaterThan(sum(abs(double(out))),0);
            testCase.verifyEqual(freqEst,frequency,'RelTol',0.01,...
                'Frequency of ML tone unexpected')
        end
        
        function testADRV9009TxPowerdown(testCase)
            % Test Powerdown and up of TX
            tx = adi.ADRV9009.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx.PowerdownChannel0 = true;
            tx.PowerdownChannel1 = true;
            tx();
            tx.release();
            tx = adi.ADRV9009.Tx('uri',testCase.uri);
            tx.DataSource = 'DDS';
            tx.PowerdownChannel0 = false;
            tx.PowerdownChannel1 = false;
            tx();
            tx.release();
        end

        function testADRV9009RxPowerdown(testCase)
            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.EnabledChannels = [1 2];
            rx.PowerdownChannel0 = true;
            rx.PowerdownChannel1 = true;
            rx();
            [out, valid] = rx();
            rx.release();

            testCase.verifyTrue(valid);
            testCase.verifyEqual(sum(sum(abs(double(out)))),0);

            rx = adi.ADRV9009.Rx('uri',testCase.uri);
            rx.PowerdownChannel0 = false;
            rx.PowerdownChannel1 = false;
            rx();
            rx.release();
        end
            
        function testADRV9009ORxPowerdown(testCase)
            orx = adi.ADRV9009.ORx('uri',testCase.uri);
            orx.PowerdownChannel0 = true;
            orx.PowerdownChannel1 = true;
            orx();
            [out, valid] = orx();

            testCase.verifyTrue(valid);
            testCase.verifyEqual(sum(abs(double(out))),0);

            testCase.powerRx(orx);
            orx.release();
        end
        
    end
    
end

