%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 9.7 (R2019b) at 16:00:44 on 06/12/2019
% This script was generated using the following parameter values:
%     Filename  : 'C:\git\ad9361_loopbackdelay_estimation\hdlworkflow.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'loopback_delay_estimation/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','loopback_delay_estimation/HDL_DUT');
%--------------------------------------------------------------------------

% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! %
% Design unsupported in Transceiver Toolbox v22.2.1 and v22.2.2
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! %

%% Load the Model
load_system('loopback_delay_estimation');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('loopback_delay_estimation/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'loopback_delay_estimation' HDL parameters
hdlset_param('loopback_delay_estimation', 'HDLSubsystem', 'loopback_delay_estimation/HDL_DUT');
hdlset_param('loopback_delay_estimation', 'ReferenceDesign', 'Receive and transmit path');
hdlset_param('loopback_delay_estimation', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('loopback_delay_estimation', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('loopback_delay_estimation', 'SynthesisToolDeviceName', 'xc7z035i');
hdlset_param('loopback_delay_estimation', 'SynthesisToolPackageName', 'fbg676');
hdlset_param('loopback_delay_estimation', 'SynthesisToolSpeedValue', '-2L');
hdlset_param('loopback_delay_estimation', 'TargetDirectory', 'hdl_prj\hdlsrc');
hdlset_param('loopback_delay_estimation', 'TargetFrequency', 6.144000e+01);
hdlset_param('loopback_delay_estimation', 'TargetLanguage', 'Verilog');
hdlset_param('loopback_delay_estimation', 'TargetPlatform', 'ADI RF SOM');
hdlset_param('loopback_delay_estimation', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT', 'AXI4SlaveIDWidth', '12');
hdlset_param('loopback_delay_estimation/HDL_DUT', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_0', 'IOInterface', 'DMA Tx I1 In [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_0', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_1', 'IOInterface', 'DMA Tx Q1 In [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_1', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_enable', 'IOInterface', 'DMA Tx Valid In');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_dma_enable', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/pulse1', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/pulse1', 'IOInterfaceMapping', 'x"108"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/max_index', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/max_index', 'IOInterfaceMapping', 'x"110"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/real0', 'IOInterface', 'Baseband Rx I1 In [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/real0', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/imag0', 'IOInterface', 'Baseband Rx Q1 In [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/imag0', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/loopback', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/loopback', 'IOInterfaceMapping', 'x"100"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/threshold', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/threshold', 'IOInterfaceMapping', 'x"104"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/debug', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/debug', 'IOInterfaceMapping', 'x"10C"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Max Iterations', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/Max Iterations', 'IOInterfaceMapping', 'x"114"');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Rx Valid In', 'IOInterface', 'Baseband Rx Valid In');
hdlset_param('loopback_delay_estimation/HDL_DUT/Rx Valid In', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/RxI', 'IOInterface', 'AD9361 ADC Data I0 [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/RxI', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/RxQ', 'IOInterface', 'AD9361 ADC Data Q0 [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/RxQ', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/Scale Factor', 'IOInterface', 'AD9361 ADC Data Q0 [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/Scale Factor', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/Max Iterations', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/Delay Estimation and Compensation/Max Iterations', 'IOInterfaceMapping', 'x"104"');

hdlset_param('loopback_delay_estimation/HDL_DUT/Gain and Phase Mismatch Compensation/Reciprocal2', 'Architecture', 'ShiftAdd');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_real', 'IOInterface', 'Baseband Tx I1 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_real', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_imag', 'IOInterface', 'Baseband Tx Q1 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_imag', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_enable ', 'IOInterface', 'Baseband Tx Valid Out');
hdlset_param('loopback_delay_estimation/HDL_DUT/tx_enable ', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/out1', 'IOInterface', 'DMA Rx I1 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/out1', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/out2', 'IOInterface', 'DMA Rx Q1 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/out2', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_I', 'IOInterface', 'DMA Rx I2 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_I', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_Q', 'IOInterface', 'DMA Rx Q2 Out [0:15]');
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_Q', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_dma_enable', 'IOInterface', 'DMA Rx Valid Out');
hdlset_param('loopback_delay_estimation/HDL_DUT/rx_dma_enable', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/scale_factorI', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/scale_factorI', 'IOInterfaceMapping', 'x"11C"');

% Set Outport HDL parameters
hdlset_param('loopback_delay_estimation/HDL_DUT/scale_factorQ', 'IOInterface', 'AXI4-Lite');
hdlset_param('loopback_delay_estimation/HDL_DUT/scale_factorQ', 'IOInterfaceMapping', 'x"118"');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.ReferenceDesignToolVersion = '2021.2';
hWC.IgnoreToolVersionMismatch = true;
hWC.AllowUnsupportedToolVersion = true;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskGenerateSoftwareInterfaceModel = false;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskProgramTargetDevice = false;

% Set properties related to 'RunTaskGenerateRTLCodeAndIPCore' Task
hWC.IPCoreRepository = '';
hWC.GenerateIPCoreReport = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = false;

% Set properties related to 'RunTaskGenerateSoftwareInterfaceModel' Task
hWC.OperatingSystem = '';

% Set properties related to 'RunTaskBuildFPGABitstream' Task
hWC.RunExternalBuild = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Default;
hWC.CustomBuildTclFile = '';

% Set properties related to 'RunTaskProgramTargetDevice' Task
hWC.ProgrammingMethod = hdlcoder.ProgrammingMethod.Download;

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
try
    hdlcoder.runWorkflow('loopback_delay_estimation/HDL_DUT', hWC, 'Verbosity', 'on');
    bdclose('all');
    out = [];
catch ME
    if exist('hdl_prj/vivado_ip_prj/vivado_prj.runs/impl_1/system_top.bit','file')
       ME = []; 
    end
    out = ME;%.identifier
end

%% Run the workflow
