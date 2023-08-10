classdef BSPEmu < matlab.unittest.TestCase
    
    properties(TestParameter)
        EmulationEnabled = {true};
    end

    properties
        hardwareMapYAML = 'adi_hardware_map.yml';
        hardwareMapYAMLCustomPath = '';
        data_devices = {};
        iioIsRunning = false;
    end

    properties(Abstract)
        hardware
        uri
    end
        
    methods(TestClassTeardown)
        function stopServer(testCase)
            if ~testCase.EmulationEnabled{1}
                return;
            end
            if testCase.isRunningIIOEmu()
                testCase.stopIIOEmu();
            end
        end
    end
    
    methods(TestClassSetup)
        function startServer(testCase)
            testCase.startIIOemu();
        end
    end
    
    methods(TestMethodTeardown)
        function restartStopServer(testCase)
            if ~testCase.EmulationEnabled{1}
                return;
            end
            if ~testCase.iioIsRunning

                testCase.stopIIOEmu();
            end
        end
    end
    
    methods
        function startIIOemu(testCase)

            if ~testCase.EmulationEnabled{1}
                return;
            end
            if strcmpi(testCase.hardware, '')
                error('Please set the hardware property');
            end
            % Read yaml configuration file
            [pathstr, ~, ~] = fileparts(mfilename('fullpath'));
            emu_path = fullfile(pathstr, 'emu');
            if ~isempty(testCase.hardwareMapYAMLCustomPath)
                yamlConfigPath = testCase.hardwareMapYAMLCustomPath;
            else
                yamlConfigPath = fullfile(emu_path, testCase.hardwareMapYAML);
            end

            yData = yaml.loadFile(yamlConfigPath);

            % Lookup hardware in yaml
            xml_path = '';
            data_devices = {};
            fieldNames = fieldnames(yData);
            for k=1:length(fieldNames)
                if strcmp(fieldNames{k}, testCase.hardware)
                    % Check if emulate struct exists
                    hw = yData.(fieldNames{k});
                    for l=1:length(hw)
                        if isstruct(hw{l})
                            s = hw{l};
                            fieldNames_s = fieldnames(s);
                            for m=1:length(fieldNames_s)
                                if strcmp(fieldNames_s{m}, 'emulate')
                                    % Check if filename exists
                                    emulate = s.(fieldNames_s{m});
                                    for e = 1:length(emulate)
                                        if isfield(emulate{e}, 'filename')
                                            xml_path = emulate{e}.filename;
                                        end
                                        if isfield(emulate{e}, 'data_devices')
                                            data_devices = emulate{e}.data_devices;
                                        end
                                    end
                                end
                            end

                        end
                    end
                end

            end

            xml_path = fullfile(emu_path,'devices',xml_path);

            if isempty(xml_path)
                error('Could not find xml file for hardware %s', testCase.hardware);
            end
            if isempty(data_devices)
                warning('Could not find data_devices for hardware %s', testCase.hardware);
            end

            % Check if iio-emu is already running and if its the same xml file
            ir = testCase.isRunningIIOEmu();
            if strcmpi(testCase.hardwareMapYAML, xml_path) && ir
                testCase.iioIsRunning = true;
                return;
            elseif ir
                testCase.stopIIOEmu();
            end

            testCase.hardwareMapYAML = xml_path;
            testCase.data_devices = data_devices;

            % Start iio-emu server
            cmd = {'iio-emu', 'generic', char(testCase.hardwareMapYAML)};
            if ~isempty(testCase.data_devices)
                for k=1:length(testCase.data_devices)
                    cmd = [cmd, sprintf('%s@data.bin',testCase.data_devices{k})];
                end
            end

            % Verify iio-emu binary on path
            [status, cmdout] = system('which iio-emu');
            if status ~= 0
                error('Could not find ii-emu binary on path\n -- Output: %s', cmdout);
            end

            % Verify the xml file exists
            [status, cmdout] = system(sprintf('ls %s', testCase.hardwareMapYAML));
            if status ~= 0
                error('Could not find xml file %s\n -- Output: %s', testCase.hardwareMapYAML, cmdout);
            end

            % Create empty datafile
            fid = fopen('data.bin', 'w');
            fclose(fid);

            % Remove log file
            if exist('log.txt', 'file')
                delete('log.txt');
            end


            % Start iio-emu within a background screen session
            cmd = sprintf('screen -L -Logfile log.txt -S iio_emu -d -m bash -c "sleep 1; export LD_LIBRARY_PATH=/tmp; exec %s"', strjoin(cmd));
            [status, cmdout] = system(cmd);
            if status ~= 0
                error('Could not start iio-emu\n -- Output: %s', cmdout);
            end


            disp('Waiting 2 seconds for iio-emu to start');
            pause(3);
            

            % Read log txt file
            if exist('log.txt', 'file')
                filetext = fileread('log.txt');
                if isempty(filetext)
                    warning('log.txt is empty');
                end
                disp("log: ");
                disp(filetext);
            end

            % Verify iio-emu is running
            [status, cmdout] = system('ps -ef | grep iio-emu');
            if status ~= 0
                error('iio-emu is not running\n -- Output: %s', cmdout);
            end

            testCase.iioIsRunning = true;
            testCase.uri = 'ip:127.0.0.1';

            % Stop iio-emu
            % system('screen -S iio_emu -X quit');

        end

        function stopIIOEmu(testCase)
            % Stop iio-emu
            disp('Stopping iio-emu');
            system('screen -S iio_emu -X quit');
        end

        function status = isRunningIIOEmu(testCase)
            % Verify iio-emu is running
            [status, cmdout] = system('ps -ef | grep iio-emu');
            status = status == 0;
        end

    end

end
