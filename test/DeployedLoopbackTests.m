classdef DeployedLoopbackTests < HardwareTests
    % DeployedLoopbackTests Validates deployed generated bitstream images on hardware.
    % Tests both data path loopback and dynamic runtime channel scaling via
    % AXI4-Lite control registers.
    
    properties
        author = 'ADI'
        uri = 'ip:10.0.0.23'
    end
    
    methods (Test)
        function testDeployedLoopbackAndScaling(testCase)
            % Check device availability and initialize Tx/Rx System objects
            try
                rx = adi.AD9371.Rx('uri', testCase.uri);
                tx = adi.AD9371.Tx('uri', testCase.uri);
            catch ME
                disp(['Skipping DeployedLoopbackTests: ', ME.message]);
                assumeFail(testCase, 'Hardware target not available or unreachable.');
                return;
            end
            
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
            testCase.verifyTrue(valid1, 'RX data capture invalid');
            
            base_amplitude = mean(abs(double(rx_base)));
            testCase.verifyGreaterThan(base_amplitude, 0, 'Received zero amplitude data');
            
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
                testCase.verifyTrue(valid, sprintf('RX capture failed for scale factor %d', scale));
                
                current_amplitude = mean(abs(double(rx_data)));
                expected_amplitude = base_amplitude * scale;
                
                % Verify amplitude scales proportionally within tolerance
                testCase.verifyEqual(current_amplitude, expected_amplitude, 'RelTol', 0.15, ...
                    sprintf('Runtime channel scaling mismatch for scale factor %d', scale));
            end
            
            % Clean up resources
            rx.release();
            tx.release();
        end
    end
end
