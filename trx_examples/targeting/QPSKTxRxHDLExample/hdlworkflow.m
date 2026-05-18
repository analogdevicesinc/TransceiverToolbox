%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 25.2 (R2025b) at 15:19:11 on 18/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\work\datalink\TransceiverToolbox\trx_examples\targeting\QPSKTxRxHDLExample\hdlworkflow.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'commhdlQPSKTxRx/Transmitter'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','commhdlQPSKTxRx/Transmitter');
%--------------------------------------------------------------------------

%% Load the Model
load_system('commhdlQPSKTxRx');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('commhdlQPSKTxRx/Transmitter');

%% Model HDL Parameters
%% Set Model 'commhdlQPSKTxRx' HDL parameters
hdlset_param('commhdlQPSKTxRx', 'ClockRatePipelining', 'off');
hdlset_param('commhdlQPSKTxRx', 'HDLSubsystem', 'commhdlQPSKTxRx/Transmitter');
hdlset_param('commhdlQPSKTxRx', 'LUTMapToRAM', 'off');
hdlset_param('commhdlQPSKTxRx', 'ProjectFolder', 'hdl_prj_jupiter');
hdlset_param('commhdlQPSKTxRx', 'ReferenceDesign', 'JUPITER (TX)');
hdlset_param('commhdlQPSKTxRx', 'ReferenceDesignParameter', {'project','jupiter_sdr','ref_design','tx','preprocess','off','postprocess','off','number_of_inputs','4','number_of_bits','16','number_of_valids','1','multiple','1','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'});
hdlset_param('commhdlQPSKTxRx', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolChipFamily', 'Zynq UltraScale+');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolDeviceName', 'xczu3eg-sfva625-2-e');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolPackageName', '');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolSpeedValue', '');
hdlset_param('commhdlQPSKTxRx', 'TargetDirectory', 'hdl_prj_jupiter\hdlsrc');
hdlset_param('commhdlQPSKTxRx', 'TargetLanguage', 'Verilog');
hdlset_param('commhdlQPSKTxRx', 'TargetPlatform', 'AnalogDevices JUPITER');
hdlset_param('commhdlQPSKTxRx', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/debug', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Transmitter/debug', 'IOInterfaceMapping', 'x"100"');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/dataI', 'IOInterface', 'IP Data 0 IN [0:15]');
hdlset_param('commhdlQPSKTxRx/Transmitter/dataI', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/dataQ', 'IOInterface', 'IP Data 1 IN [0:15]');
hdlset_param('commhdlQPSKTxRx/Transmitter/dataQ', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/validIn', 'IOInterface', 'IP Valid Tx Data IN');
hdlset_param('commhdlQPSKTxRx/Transmitter/validIn', 'IOInterfaceMapping', '[0]');

hdlset_param('commhdlQPSKTxRx/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Transmitter/QPSK Tx/Bit Packetizer/Data Bits FIFO/No HDL/No HDL', 'Architecture', 'No HDL');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/dataOutI', 'IOInterface', 'ADRV9002 DAC Data I0 [0:15]');
hdlset_param('commhdlQPSKTxRx/Transmitter/dataOutI', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/dataOutQ', 'IOInterface', 'ADRV9002 DAC Data Q0 [0:15]');
hdlset_param('commhdlQPSKTxRx/Transmitter/dataOutQ', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/txDiagBus', 'IOInterface', 'No Interface Specified');
hdlset_param('commhdlQPSKTxRx/Transmitter/txDiagBus', 'IOInterfaceMapping', '');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/validOut', 'IOInterface', 'IP Load Tx Data OUT');
hdlset_param('commhdlQPSKTxRx/Transmitter/validOut', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Transmitter/complex', 'IOInterface', 'No Interface Specified');
hdlset_param('commhdlQPSKTxRx/Transmitter/complex', 'IOInterfaceMapping', '');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_jupiter';
hWC.AllowUnsupportedToolVersion = true;
hWC.ReferenceDesignToolVersion = '2025.1';
hWC.IgnoreToolVersionMismatch = false;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskGenerateSoftwareInterface = true;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskProgramTargetDevice = false;

% Set properties related to 'RunTaskGenerateRTLCodeAndIPCore' Task
hWC.GenerateIPCoreReport = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = false;

% Set properties related to 'RunTaskGenerateSoftwareInterface' Task
hWC.GenerateSoftwareInterfaceModel = false;
hWC.OperatingSystem = 'Linux';
hWC.HostTargetInterface = 'Ethernet';
hWC.GenerateHostInterfaceModel = false;
hWC.GenerateHostInterfaceScript = false;

% Set properties related to 'RunTaskBuildFPGABitstream' Task
hWC.RunExternalBuild = true;
hWC.EnableDesignCheckpoint = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Custom;
hWC.CustomBuildTclFile = 'C:\work\datalink\TransceiverToolbox\CI\scripts\adi_build.tcl';
hWC.DefaultCheckpointFile = 'Default';
hWC.RoutedDesignCheckpointFilePath = '';
hWC.MaxNumOfCoresForBuild = '';

% Set properties related to 'RunTaskProgramTargetDevice' Task
% hWC.ProgrammingMethod = hdlcoder.ProgrammingMethod.Download;
% hWC.IPAddress = '';
% hWC.SSHUsername = '';
% hWC.SSHPassword = '';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('commhdlQPSKTxRx/Transmitter', hWC, 'Verbosity', 'on');
