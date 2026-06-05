%--------------------------------------------------------------------------
% HDL Workflow Script -- ADRV9002 PRBS digital-loopback interface test
%
% Adapted from hdlworkflow_loopback.m. Targets the PRBSLoopback DUT onto the
% JUPITER (ADRV9002) rxtx reference design: PRBS generated out the DAC data
% lanes, returned by the chip's SSI digital loopback, checked on the ADC data
% lanes. AXI4-Lite exposes control + per-lane error counters + lock status.
%
% Prereq: run build_prbs_model() first to create commhdlPRBSLoopback.slx, and
% have PRBSEngine.m + prbs15/9_gen16/chk16.m on the path. Requires Vivado
% 2025.1 for the bitstream build task.
%
%   DUT : 'commhdlPRBSLoopback/PRBSLoopback'
%--------------------------------------------------------------------------

%% Load the Model
load_system('commhdlPRBSLoopback');
set_param('commhdlPRBSLoopback/PRBSLoopback', 'TreatAsAtomicUnit', 'on');
save_system('commhdlPRBSLoopback', [], 'OverwriteIfChangedOnDisk', true);

%% Model HDL Parameters
hdlset_param('commhdlPRBSLoopback', 'ClockRatePipelining', 'off');
hdlset_param('commhdlPRBSLoopback', 'HDLSubsystem', 'commhdlPRBSLoopback/PRBSLoopback');
hdlset_param('commhdlPRBSLoopback', 'LUTMapToRAM', 'off');
hdlset_param('commhdlPRBSLoopback', 'ProjectFolder', 'hdl_prj_jupiter_prbs');
hdlset_param('commhdlPRBSLoopback', 'ReferenceDesign', 'JUPITER (RX & TX - RX IS FASTER OR HAS PRIORITY)');
hdlset_param('commhdlPRBSLoopback', 'ReferenceDesignParameter', {'project','jupiter_sdr','ref_design','rxtx','preprocess','off','postprocess','off','number_of_inputs','4','number_of_bits','16','number_of_valids','1','multiple','1','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'});
hdlset_param('commhdlPRBSLoopback', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('commhdlPRBSLoopback', 'SynthesisToolChipFamily', 'Zynq UltraScale+');
hdlset_param('commhdlPRBSLoopback', 'SynthesisToolDeviceName', 'xczu3eg-sfva625-2-e');
hdlset_param('commhdlPRBSLoopback', 'SynthesisToolPackageName', '');
hdlset_param('commhdlPRBSLoopback', 'SynthesisToolSpeedValue', '');
hdlset_param('commhdlPRBSLoopback', 'TargetDirectory', 'hdl_prj_jupiter_prbs/hdlsrc');
hdlset_param('commhdlPRBSLoopback', 'TargetLanguage', 'Verilog');
hdlset_param('commhdlPRBSLoopback', 'TargetPlatform', 'AnalogDevices JUPITER');
hdlset_param('commhdlPRBSLoopback', 'Workflow', 'IP Core Generation');

% Subsystem: free-running (no processor handshake), like the QPSK loopback DUT.
hdlset_param('commhdlPRBSLoopback/PRBSLoopback', 'ProcessorFPGASynchronization', 'Free running');

%% Port -> reference-design interface mappings
% --- Rx data in (ADRV9002 ADC -> FPGA) ---
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_validIn', 'IOInterface', 'IP Valid Rx Data IN');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_validIn', 'IOInterfaceMapping', '[0]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_dataInI', 'IOInterface', 'ADRV9002 ADC Data I0 [0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_dataInI', 'IOInterfaceMapping', '[0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_dataInQ', 'IOInterface', 'ADRV9002 ADC Data Q0 [0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/adc_dataInQ', 'IOInterfaceMapping', '[0:15]');

% --- AXI4-Lite control in ---
% prbs_control: bit0 reset/resync, bit1 gen_enable, bit2 inject_error.
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/prbs_control', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/prbs_control', 'IOInterfaceMapping', 'x"100"');

% --- Tx data out (FPGA -> ADRV9002 DAC). Same DAC interface the QPSK cable
%     loopback proved reaches the chip (ADRV9002 DAC Data I0/Q0, NOT IP Data
%     X OUT which is the rx-group DMA capture stream). ---
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_dataOutI', 'IOInterface', 'ADRV9002 DAC Data I0 [0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_dataOutI', 'IOInterfaceMapping', '[0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_dataOutQ', 'IOInterface', 'ADRV9002 DAC Data Q0 [0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_dataOutQ', 'IOInterfaceMapping', '[0:15]');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_validOut', 'IOInterface', 'IP Load Tx Data OUT');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/tx_validOut', 'IOInterfaceMapping', '[0]');

% --- AXI4-Lite status out ---
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/sample_count', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/sample_count', 'IOInterfaceMapping', 'x"104"');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/bit_errors_I', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/bit_errors_I', 'IOInterfaceMapping', 'x"108"');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/bit_errors_Q', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/bit_errors_Q', 'IOInterfaceMapping', 'x"10C"');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/lock_status', 'IOInterface', 'AXI4-Lite');
hdlset_param('commhdlPRBSLoopback/PRBSLoopback/lock_status', 'IOInterfaceMapping', 'x"110"');

%% Workflow Configuration
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');
hWC.ProjectFolder = 'hdl_prj_jupiter_prbs';
hWC.AllowUnsupportedToolVersion = true;
hWC.ReferenceDesignToolVersion = '2025.1';
hWC.IgnoreToolVersionMismatch = false;

hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskGenerateSoftwareInterface = true;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskProgramTargetDevice = false;

hWC.GenerateIPCoreReport = true;
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = false;

hWC.GenerateSoftwareInterfaceModel = false;
hWC.OperatingSystem = 'Linux';
hWC.HostTargetInterface = 'Ethernet';
hWC.GenerateHostInterfaceModel = false;
hWC.GenerateHostInterfaceScript = false;

hWC.RunExternalBuild = false;
hWC.EnableDesignCheckpoint = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Custom;
hWC.CustomBuildTclFile = '/home/tcollins/dev/qpsk_ai/TransceiverToolbox/CI/scripts/adi_build.tcl';
hWC.DefaultCheckpointFile = 'Default';
hWC.RoutedDesignCheckpointFilePath = '';
hWC.MaxNumOfCoresForBuild = '';

hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('commhdlPRBSLoopback/PRBSLoopback', hWC, 'Verbosity', 'on');
