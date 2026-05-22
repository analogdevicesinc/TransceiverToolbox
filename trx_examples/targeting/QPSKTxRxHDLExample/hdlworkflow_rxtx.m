%==========================================================================
% hdlworkflow_rxtx.m  --  RX & TX variant of the QPSK Receiver HDL workflow
%
% Same DUT (commhdlQPSKTxRx/Receiver) and port mappings as
% hdlworkflow_rx_debug.m, but targets the JUPITER (RX & TX - RX IS FASTER ...)
% reference design (ref_design='rxtx') so the TX datapath is fully
% instantiated and validated for *sustained* host transmit.
%
% Rationale: the RX-only build (hdlworkflow_rx_debug.m) gives only a ~1 s host
% TX burst then stops (confirmed via an independent Pluto on TX1). This RX&TX
% build provides a proper TX datapath so the loopback (and Pluto) can capture
% a continuous QPSK and finally localize the residual 90-deg/50%-BER issue.
%
% Builds into hdl_prj_jupiter_rxtx/ (separate from the RX build). rstCS is
% still exposed at AXI x"110"; BIST at x"100"/x"104"/x"108"; iq_debug_mux x"10C".
%==========================================================================

%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 25.2 (R2025b) at 12:58:46 on 21/05/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\work\datalink\TransceiverToolbox\trx_examples\targeting\QPSKTxRxHDLExample\hdlworkflow_rx_debug.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'commhdlQPSKTxRx/Receiver'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','commhdlQPSKTxRx/Receiver');
%--------------------------------------------------------------------------

%% Load the Model
load_system('commhdlQPSKTxRx');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('commhdlQPSKTxRx/Receiver');

%% Model HDL Parameters
%% Set Model 'commhdlQPSKTxRx' HDL parameters
hdlset_param('commhdlQPSKTxRx', 'ClockRatePipelining', 'off');
hdlset_param('commhdlQPSKTxRx', 'HDLSubsystem', 'commhdlQPSKTxRx/Receiver');
hdlset_param('commhdlQPSKTxRx', 'LUTMapToRAM', 'off');
hdlset_param('commhdlQPSKTxRx', 'ProjectFolder', 'hdl_prj_jupiter_rxtx');
hdlset_param('commhdlQPSKTxRx', 'ReferenceDesign', 'JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)');
hdlset_param('commhdlQPSKTxRx', 'ReferenceDesignParameter', {'project','jupiter_sdr','ref_design','rxtx','preprocess','off','postprocess','off','number_of_inputs','4','number_of_bits','16','number_of_valids','1','multiple','1','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'});
hdlset_param('commhdlQPSKTxRx', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolChipFamily', 'Zynq UltraScale+');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolDeviceName', 'xczu3eg-sfva625-2-e');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolPackageName', '');
hdlset_param('commhdlQPSKTxRx', 'SynthesisToolSpeedValue', '');
hdlset_param('commhdlQPSKTxRx', 'TargetDirectory', 'hdl_prj_jupiter_rxtx/hdlsrc');
hdlset_param('commhdlQPSKTxRx', 'TargetLanguage', 'Verilog');
hdlset_param('commhdlQPSKTxRx', 'TargetPlatform', 'AnalogDevices JUPITER');
hdlset_param('commhdlQPSKTxRx', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/validIn', 'IOInterface', 'IP Valid Rx Data IN');
hdlset_param('commhdlQPSKTxRx/Receiver/validIn', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/dataInI', 'IOInterface', 'ADRV9002 ADC Data I0 [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/dataInI', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/dataInQ', 'IOInterface', 'ADRV9002 ADC Data Q0 [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/dataInQ', 'IOInterfaceMapping', '[0:15]');

% Set Inport HDL parameters
% rstCS (carrier-sync reset) exposed as AXI4-Lite so the host can reset the
% carrier synchronizer for a clean re-acquisition (write 1 then 0 to x"110").
hdlset_param('commhdlQPSKTxRx/Receiver/rstCS', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Receiver/rstCS', 'IOInterfaceMapping', 'x"110"');

% Set Inport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/iq_debug_mux', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Receiver/iq_debug_mux', 'IOInterfaceMapping', 'x"10C"');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay11', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Raise Power to 4/Delay7', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/No HDL', 'Architecture', 'No HDL');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay11', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay12', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay13', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay17', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay18', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay25', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay28', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay36', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay38', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay39', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay41', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay8', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay10', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay16', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay8', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Corrector/Reciprocal/Function Impl/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay5', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction/Phase Ambiguity Estimator/Delay9', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay2', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay1', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay2', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay3', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay4', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Correlator/Magnitude Squared and Moving Sum/Delay6', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/FIFO/Validate Input Push Pop/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector/Timing Adjust/No HDL/No HDL1', 'Architecture', 'No HDL');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay14', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay15', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay6', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay7', 'ResetType', 'none');

% Set Delay HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Interpolation Filter/Delay9', 'ResetType', 'none');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/No HDL/No HDL', 'Architecture', 'No HDL');

hdlset_param('commhdlQPSKTxRx/Receiver/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer/Rate Handle/FIFO/Validate Input Push Pop/No HDL', 'Architecture', 'No HDL');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/rxDiagBus', 'IOInterface', 'No Interface Specified');
hdlset_param('commhdlQPSKTxRx/Receiver/rxDiagBus', 'IOInterfaceMapping', '');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/count_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Receiver/count_out', 'IOInterfaceMapping', 'x"100"');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/packets_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Receiver/packets_out', 'IOInterfaceMapping', 'x"104"');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/bit_errors_out', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlQPSKTxRx/Receiver/bit_errors_out', 'IOInterfaceMapping', 'x"108"');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/debugI', 'IOInterface', 'IP Data 0 OUT [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/debugI', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/debugQ', 'IOInterface', 'IP Data 1 OUT [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/debugQ', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/debugValid', 'IOInterface', 'IP Data Valid OUT');
hdlset_param('commhdlQPSKTxRx/Receiver/debugValid', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/debugI1', 'IOInterface', 'IP Data 2 OUT [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/debugI1', 'IOInterfaceMapping', '[0:15]');

% Set Outport HDL parameters
hdlset_param('commhdlQPSKTxRx/Receiver/debugQ1', 'IOInterface', 'IP Data 3 OUT [0:15]');
hdlset_param('commhdlQPSKTxRx/Receiver/debugQ1', 'IOInterfaceMapping', '[0:15]');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_jupiter_rxtx';
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
hdlcoder.runWorkflow('commhdlQPSKTxRx/Receiver', hWC, 'Verbosity', 'on');
