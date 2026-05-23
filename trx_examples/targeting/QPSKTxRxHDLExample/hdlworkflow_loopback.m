%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 25.2 (R2025b) at 12:58:46 on 21/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\work\datalink\TransceiverToolbox\trx_examples\targeting\QPSKTxRxHDLExample\hdlworkflow_rx_debug.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'commhdlQPSKTxRxLoopback/TxRxLoopback'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','commhdlQPSKTxRxLoopback/TxRxLoopback');
%--------------------------------------------------------------------------

%% Load the Model
load_system('commhdlQPSKTxRxLoopback');
set_param('commhdlQPSKTxRxLoopback/TxRxLoopback', 'TreatAsAtomicUnit', 'on'); save_system('commhdlQPSKTxRxLoopback',[],'OverwriteIfChangedOnDisk',true);

%% Restore the Model to default HDL parameters
%hdlrestoreparams('commhdlQPSKTxRxLoopback/TxRxLoopback');

%% Model HDL Parameters
%% Set Model 'commhdlQPSKTxRxLoopback' HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback', 'ClockRatePipelining', 'off');
hdlset_param('commhdlQPSKTxRxLoopback', 'HDLSubsystem', 'commhdlQPSKTxRxLoopback/TxRxLoopback');
hdlset_param('commhdlQPSKTxRxLoopback', 'LUTMapToRAM', 'off');
hdlset_param('commhdlQPSKTxRxLoopback', 'ProjectFolder', 'hdl_prj_jupiter_loopback');
hdlset_param('commhdlQPSKTxRxLoopback', 'ReferenceDesign', 'JUPITER (RX)');
hdlset_param('commhdlQPSKTxRxLoopback', 'ReferenceDesignParameter', {'project','jupiter_sdr','ref_design','rx','preprocess','off','postprocess','off','number_of_inputs','4','number_of_bits','16','number_of_valids','1','multiple','1','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'});
hdlset_param('commhdlQPSKTxRxLoopback', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('commhdlQPSKTxRxLoopback', 'SynthesisToolChipFamily', 'Zynq UltraScale+');
hdlset_param('commhdlQPSKTxRxLoopback', 'SynthesisToolDeviceName', 'xczu3eg-sfva625-2-e');
hdlset_param('commhdlQPSKTxRxLoopback', 'SynthesisToolPackageName', '');
hdlset_param('commhdlQPSKTxRxLoopback', 'SynthesisToolSpeedValue', '');
hdlset_param('commhdlQPSKTxRxLoopback', 'TargetDirectory', 'hdl_prj_jupiter_loopback/hdlsrc');
hdlset_param('commhdlQPSKTxRxLoopback', 'TargetLanguage', 'Verilog');
hdlset_param('commhdlQPSKTxRxLoopback', 'TargetPlatform', 'AnalogDevices JUPITER');
hdlset_param('commhdlQPSKTxRxLoopback', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/validIn', 'IOInterface', 'IP Valid Rx Data IN');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/validIn', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/dataInI', 'IOInterface', 'ADRV9002 ADC Data I0 [0:15]');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/dataInI', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/dataInQ', 'IOInterface', 'ADRV9002 ADC Data Q0 [0:15]');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/dataInQ', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
% rstCS (carrier-sync reset) exposed as AXI4-Lite so the host can reset the
% carrier synchronizer for a clean re-acquisition (write 1 then 0 to x"110").
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/rstCS', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/rstCS', 'IOInterfaceMapping', 'x"110"');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/iq_debug_mux', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/iq_debug_mux', 'IOInterfaceMapping', 'x"10C"');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay11', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay7', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/No HDL', 'Architecture', 'No HDL');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay11', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay12', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay13', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay17', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay18', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay25', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay28', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay36', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay38', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay39', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay41', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay8', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay10', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay16', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay8', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay5', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay2', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay2', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay6', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/FIFO/Validate Input Push Pop/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL/No HDL1', 'Architecture', 'No HDL');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay14', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay9', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/No HDL/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/FIFO/Validate Input Push Pop/No HDL', 'Architecture', 'No HDL');

% Set Outport HDL parameters

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/count_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/count_out', 'IOInterfaceMapping', 'x"100"');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/packets_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/packets_out', 'IOInterfaceMapping', 'x"104"');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/bit_errors_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRxLoopback/TxRxLoopback/bit_errors_out', 'IOInterfaceMapping', 'x"108"');

% Set Outport HDL parameters

% Set Outport HDL parameters

% Set Outport HDL parameters

% Set Outport HDL parameters

% Set Outport HDL parameters


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_jupiter_loopback';
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
hWC.RunExternalBuild = false;
hWC.EnableDesignCheckpoint = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Custom;
%hWC.CustomBuildTclFile = 'C:\work\datalink\TransceiverToolbox\CI\scripts\adi_build.tcl';
hWC.CustomBuildTclFile = '/home/tcollins/dev/qpsk_ai/TransceiverToolbox/CI/scripts/adi_build.tcl';
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
hdlcoder.runWorkflow('commhdlQPSKTxRxLoopback/TxRxLoopback', hWC, 'Verbosity', 'on');
