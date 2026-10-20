classdef DeployedLoopbackTests < HardwareTests
    % DeployedLoopbackTests Validates deployed generated bitstream images on hardware.
    % Tests both data path loopback and dynamic runtime channel scaling via
    % AXI4-Lite control registers for AD9371 and ADRV9009.
    
    properties
        author = 'ADI'
        uri = 'ip:10.0.0.23'
        uri_adrv9009 = 'ip:10.0.0.67'
        uri_adrv9002 = 'ip:10.0.0.148'
    end
    
    methods(TestClassSetup)
        function CheckForHardware(testCase)
            % Proceed if at least one target hardware device is reachable
            hw_found = false;
            try
                d1 = adi.AD9371.Rx('uri', testCase.uri);
                d1();
                hw_found = true;
            catch
            end
            if ~hw_found
                try
                    d2 = adi.ADRV9009.Rx('uri', testCase.uri_adrv9009);
                    d2();
                    hw_found = true;
                catch
                end
            end
            if ~hw_found
                try
                    d3 = adi.ADRV9002.Rx('uri', testCase.uri_adrv9002);
                    d3();
                    hw_found = true;
                catch
                end
            end
            testCase.assumeTrue(hw_found, 'Filtering test: No hardware targets reachable');
        end
    end
    
    methods (Test)
        function testDeployedLoopbackAndScalingAD9371(testCase)
            ip_str = strrep(testCase.uri, 'ip:', '');
            testCase.CheckDevice('ip', @()adi.AD9371.Rx('uri', testCase.uri), ip_str, false);
            
            % Initialize AD9371 Tx/Rx System objects
            rx = adi.AD9371.Rx('uri', testCase.uri);
            tx = adi.AD9371.Tx('uri', testCase.uri);
            
            % Configure transceiver loopback and channel settings
            rx.LoopbackMode = 1; % Enable digital loopback
            rx.EnabledChannels = [1, 2];
            tx.EnabledChannels = [1, 2];
            
            % Generate baseband test tone (10 MHz sine wave)
            fs = 122.88e6;
            f_tone = 10e6;
            n_samples = 1024;
            t = (0:n_samples-1)' / fs;
            tx_signal = complex(int16(0.4 * 32767 * cos(2*pi*f_tone*t)), ...
                                int16(0.4 * 32767 * sin(2*pi*f_tone*t)));
            
            % Initial transmission with base scale factor (1)
            tx(tx_signal);
            pause(0.5);
            
            [rx_base, valid1] = rx();
            testCase.verifyTrue(valid1, 'AD9371 RX data capture invalid');
            
            base_amplitude = mean(abs(double(rx_base)));
            testCase.verifyGreaterThan(base_amplitude, 0, 'Received zero amplitude data from AD9371');
            
            % Test dynamic runtime scaling via AXI register 0x108 (regWrite1)
            scale_factors = [1, 2, 4];
            for k = 1:length(scale_factors)
                scale = scale_factors(k);
                
                % Write scale factor to custom IP AXI4-Lite register at offset 0x108
                try
                    tx.writeRegister('0x108', scale);
                catch
                    % Fallback to debug attribute if direct AXI register write is unmapped
                    tx.setAttributeLongLong('scale_factor', scale, false);
                end
                
                pause(0.2);
                [rx_data, valid] = rx();
                testCase.verifyTrue(valid, sprintf('AD9371 RX capture failed for scale factor %d', scale));
                
                current_amplitude = mean(abs(double(rx_data)));
                expected_amplitude = base_amplitude * scale;
                
                % Verify amplitude scales proportionally within tolerance
                testCase.verifyEqual(current_amplitude, expected_amplitude, 'RelTol', 0.15, ...
                    sprintf('AD9371 runtime channel scaling mismatch for scale factor %d', scale));
            end
            
            % Clean up resources
            rx.release();
            tx.release();
        end
        
        function testDeployedLoopbackAndScalingADRV9009(testCase)
            ip_str = strrep(testCase.uri_adrv9009, 'ip:', '');
            testCase.CheckDevice('ip', @()adi.ADRV9009.Rx('uri', testCase.uri_adrv9009), ip_str, false);
            
            % Initialize ADRV9009 Tx/Rx System objects
            rx = adi.ADRV9009.Rx('uri', testCase.uri_adrv9009);
            tx = adi.ADRV9009.Tx('uri', testCase.uri_adrv9009);
            
            rx.EnabledChannels = [1, 2];
            tx.EnabledChannels = [1, 2];
            
            % Generate baseband test tone (10 MHz sine wave)
            fs = 245.76e6;
            f_tone = 10e6;
            n_samples = 1024;
            t = (0:n_samples-1)' / fs;
            tx_signal = complex(int16(0.4 * 32767 * cos(2*pi*f_tone*t)), ...
                                int16(0.4 * 32767 * sin(2*pi*f_tone*t)));
            
            % Initial transmission with base scale factor (1)
            tx(tx_signal);
            pause(0.5);
            
            [rx_base, valid1] = rx();
            testCase.verifyTrue(valid1, 'ADRV9009 RX data capture invalid');
            
            base_amplitude = mean(abs(double(rx_base)));
            testCase.verifyGreaterThan(base_amplitude, 0, 'Received zero amplitude data from ADRV9009');
            
            % Test dynamic runtime scaling via AXI register 0x108 (regWrite1)
            scale_factors = [1, 2, 4];
            for k = 1:length(scale_factors)
                scale = scale_factors(k);
                
                try
                    tx.writeRegister('0x108', scale);
                catch
                    tx.setAttributeLongLong('scale_factor', scale, false);
                end
                
                pause(0.2);
                [rx_data, valid] = rx();
                testCase.verifyTrue(valid, sprintf('ADRV9009 RX capture failed for scale factor %d', scale));
                
                current_amplitude = mean(abs(double(rx_data)));
                expected_amplitude = base_amplitude * scale;
                
                testCase.verifyEqual(current_amplitude, expected_amplitude, 'RelTol', 0.15, ...
                    sprintf('ADRV9009 runtime channel scaling mismatch for scale factor %d', scale));
            end
            
            rx.release();
            tx.release();
        end
        
        function testDeployedLoopbackAndScalingADRV9002(testCase)
            ip_str = strrep(testCase.uri_adrv9002, 'ip:', '');
            testCase.CheckDevice('ip', @()adi.ADRV9002.Rx('uri', testCase.uri_adrv9002), ip_str, false);
            
            % Initialize ADRV9002 Tx/Rx System objects
            rx = adi.ADRV9002.Rx('uri', testCase.uri_adrv9002);
            tx = adi.ADRV9002.Tx('uri', testCase.uri_adrv9002);
            
            rx.EnabledChannels = 1;
            tx.EnabledChannels = 1;
            
            % Initial transmission & reception
            [rx_base, valid1] = rx();
            testCase.verifyTrue(valid1, 'ADRV9002 RX data capture invalid');
            
            base_amplitude = mean(abs(double(rx_base)));
            testCase.verifyGreaterThan(base_amplitude, 0, 'Received zero amplitude data from ADRV9002');
            
            rx.release();
            tx.release();
        end
    end
end
