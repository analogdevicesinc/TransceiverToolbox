classdef DemoTests < matlab.unittest.TestCase
    
    properties
        root = '';
    end
    
    methods(TestClassSetup)
        function addpaths(testCase)
            here = mfilename('fullpath');
            here = strsplit(here,'/');
            here = fullfile('/',here{1:end-2});
            testCase.root = here;
            addpath(genpath(fullfile(here,'trx_examples/targeting/tuneAGC-ad9361/support')));
            addpath(genpath(fullfile(here,'trx_examples/targeting/tuneAGC-ad9361/captures')));
            addpath(genpath(fullfile(here,'trx_examples/targeting/frequency-hopping')));
            addpath(genpath(fullfile(here,'trx_examples/targeting/loopback-delay-estimation')));
            addpath(genpath(fullfile(here,'hdl')));
        end
        function setupVivado(~)
            v=ver('matlab'); Release = v.Release;
            switch Release
                case '(R2017a)'
                    vivado = '2016.2';
                case '(R2017b)'
                    vivado = '2017.4';
                case '(R2018b)'
                    vivado = '2017.4';
                case '(R2019a)'
                    vivado = '2018.2';
                case '(R2019b)'
                    vivado = '2018.2';
                case '(R2020a)'
                    vivado = '2018.2';
            end
            if ispc
                hdlsetuptoolpath('ToolName', 'Xilinx Vivado', ...
                    'ToolPath', ['C:\Xilinx\Vivado\',vivado,'\bin\vivado.bat']);
            elseif isunix
                hdlsetuptoolpath('ToolName', 'Xilinx Vivado', ...
                    'ToolPath', ['/opt/Xilinx/Vivado/',vivado,'/bin/vivado']);
            end
            
        end
    end
    
    methods(Test)
        function buildHDLLoopbackDelayEstimation(testCase)
            cd(fullfile(testCase.root,'trx_examples/targeting/loopback-delay-estimation'));
            hdlworkflow;
            if ~isempty(out)
                disp(out.message);
            end
            % Check for system_top.bit
            if exist('hdl_prj/vivado_ip_prj/vivado_prj.runs/impl_1/system_top.bit', 'file') ~= 2
                error('system_top.bit not found');
            end
        end
        function buildHDLFrequencyHopper(testCase)
            cd(fullfile(testCase.root,'trx_examples/targeting/frequency-hopping'));
            hdlworkflow;
            if ~isempty(out)
                disp(out.message);
            end
            % Check for BOOT.BIN
            if exist('hdl_prj/vivado_ip_prj/boot/BOOT.BIN', 'file') ~= 2
                error('BOOT.BIN Failed');
            end
        end
        function buildHDLTuneAGC(testCase)
            cd(fullfile(testCase.root,'trx_examples/targeting/tuneAGC-ad9361'));
            hdlworkflow;
            if ~isempty(out)
                disp(out.message);
            end
            % Check for BOOT.BIN
            if exist('hdl_prj/vivado_ip_prj/boot/BOOT.BIN', 'file') ~= 2
                error('BOOT.BIN not found');
            end
        end
        function buildKernelFrequencyHopper(testCase)
            cd(fullfile(testCase.root,'trx_examples/targeting/frequency-hopping'));
            system('chmod +x build_kernel.sh');
            system('./build_kernel.sh');
            % Check for uImage
            if exist('linux/arch/arm/boot/uImage', 'file') ~= 2
                error('Kernel Build Failed');
            end
        end
    end
    
end
