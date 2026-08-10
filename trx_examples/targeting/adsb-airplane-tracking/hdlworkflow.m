%--------------------------------------------------------------------------
% HDL Workflow Script
% ADS-B (Mode S extended squitter) receiver targeting ADRV9361-Z7035.
%
% This script was generated using the following parameter values:
%     DUT       : 'adsb_rx_targeting/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','adsb_rx_targeting/HDL_DUT');
%
% The DUT sits inline between the AD9361 ADC FIFO and the ADC packer: it
% consumes 'AD9361 ADC Data I0/Q0' qualified by 'IP Valid Rx Data IN', and
% drives 'IP Data 0..3 OUT' / 'IP Data Valid OUT'. Channels 0/1 pass the raw
% baseband through; channels 2/3 carry the detected frame stream.
%--------------------------------------------------------------------------

%% Load the Model
load_system('adsb_rx_targeting');

%% Model HDL Parameters
%% Set Model 'adsb_rx_targeting' HDL parameters
hdlset_param('adsb_rx_targeting', 'HDLSubsystem', 'adsb_rx_targeting/HDL_DUT');
hdlset_param('adsb_rx_targeting', 'ReferenceDesign', 'ADRV9361-Z7035 CCFMC_LVDS (RX)');
hdlset_param('adsb_rx_targeting', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('adsb_rx_targeting', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('adsb_rx_targeting', 'SynthesisToolDeviceName', 'xc7z035i');
hdlset_param('adsb_rx_targeting', 'SynthesisToolPackageName', 'fbg676');
hdlset_param('adsb_rx_targeting', 'SynthesisToolSpeedValue', '-2L');
hdlset_param('adsb_rx_targeting', 'TargetDirectory', 'hdl_prj\hdlsrc');
hdlset_param('adsb_rx_targeting', 'TargetLanguage', 'Verilog');
hdlset_param('adsb_rx_targeting', 'TargetPlatform', 'AnalogDevices ADRV9361-Z7035');
hdlset_param('adsb_rx_targeting', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('adsb_rx_targeting/HDL_DUT', 'AXI4SlaveIDWidth', '12');
hdlset_param('adsb_rx_targeting/HDL_DUT', 'ProcessorFPGASynchronization', 'Free running');

%% Inport HDL parameters
% Baseband samples from the AD9361 ADC FIFO
hdlset_param('adsb_rx_targeting/HDL_DUT/rx_I', 'IOInterface', 'AD9361 ADC Data I0');
hdlset_param('adsb_rx_targeting/HDL_DUT/rx_I', 'IOInterfaceMapping', '[0:15]');

hdlset_param('adsb_rx_targeting/HDL_DUT/rx_Q', 'IOInterface', 'AD9361 ADC Data Q0');
hdlset_param('adsb_rx_targeting/HDL_DUT/rx_Q', 'IOInterfaceMapping', '[0:15]');

% Sample-qualifying strobe. The detector runs one step per asserted valid,
% so the AD9361 must be configured for 4 MSPS (4 samples per 1 Mbps PPM
% symbol) for the correlation timing to match the algorithm.
hdlset_param('adsb_rx_targeting/HDL_DUT/rx_valid', 'IOInterface', 'IP Valid Rx Data IN');
hdlset_param('adsb_rx_targeting/HDL_DUT/rx_valid', 'IOInterfaceMapping', '[0]');

% Runtime control
hdlset_param('adsb_rx_targeting/HDL_DUT/sync_threshold', 'IOInterface', 'AXI4-Lite');
hdlset_param('adsb_rx_targeting/HDL_DUT/sync_threshold', 'IOInterfaceMapping', 'x"100"');

hdlset_param('adsb_rx_targeting/HDL_DUT/enable', 'IOInterface', 'AXI4-Lite');
hdlset_param('adsb_rx_targeting/HDL_DUT/enable', 'IOInterfaceMapping', 'x"104"');

%% Outport HDL parameters
% Channels 0/1: raw baseband pass-through, so the host can still see the signal.
hdlset_param('adsb_rx_targeting/HDL_DUT/out_I', 'IOInterface', 'IP Data 0 OUT');
hdlset_param('adsb_rx_targeting/HDL_DUT/out_I', 'IOInterfaceMapping', '[0:15]');

hdlset_param('adsb_rx_targeting/HDL_DUT/out_Q', 'IOInterface', 'IP Data 1 OUT');
hdlset_param('adsb_rx_targeting/HDL_DUT/out_Q', 'IOInterfaceMapping', '[0:15]');

% Channels 2/3: frame stream. A 0x5AA5 marker word is followed by seven
% 16-bit words carrying the 112-bit squitter; zero-filled otherwise.
hdlset_param('adsb_rx_targeting/HDL_DUT/frame_word', 'IOInterface', 'IP Data 2 OUT');
hdlset_param('adsb_rx_targeting/HDL_DUT/frame_word', 'IOInterfaceMapping', '[0:15]');

hdlset_param('adsb_rx_targeting/HDL_DUT/status_word', 'IOInterface', 'IP Data 3 OUT');
hdlset_param('adsb_rx_targeting/HDL_DUT/status_word', 'IOInterfaceMapping', '[0:15]');

% Valid is a straight pass-through of the input strobe. Gating it on frame
% detection would starve the DMA and block adi.AD9361.Rx until a buffer
% eventually filled -- minutes, or never, in quiet airspace.
hdlset_param('adsb_rx_targeting/HDL_DUT/out_valid', 'IOInterface', 'IP Data Valid OUT');
hdlset_param('adsb_rx_targeting/HDL_DUT/out_valid', 'IOInterfaceMapping', '[0]');

% Status registers
hdlset_param('adsb_rx_targeting/HDL_DUT/detect_count', 'IOInterface', 'AXI4-Lite');
hdlset_param('adsb_rx_targeting/HDL_DUT/detect_count', 'IOInterfaceMapping', 'x"108"');

hdlset_param('adsb_rx_targeting/HDL_DUT/crc_pass_count', 'IOInterface', 'AXI4-Lite');
hdlset_param('adsb_rx_targeting/HDL_DUT/crc_pass_count', 'IOInterfaceMapping', 'x"10C"');

hdlset_param('adsb_rx_targeting/HDL_DUT/last_maxSync', 'IOInterface', 'AXI4-Lite');
hdlset_param('adsb_rx_targeting/HDL_DUT/last_maxSync', 'IOInterfaceMapping', 'x"110"');

%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.ReferenceDesignToolVersion = '2025.1';
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
hWC.GenerateIPCoreReport = false;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = false;

% Set properties related to 'RunTaskGenerateSoftwareInterfaceModel' Task
hWC.OperatingSystem = '';

% Set properties related to 'RunTaskBuildFPGABitstream' Task
% The ADI build script packages a bootable BOOT.BIN, which the hardware
% test needs to bring the design up on the target.
hWC.RunExternalBuild = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Custom;
hWC.CustomBuildTclFile = '../../../hdl/vendor/AnalogDevices/vivado/projects/scripts/adi_build.tcl';

% Set properties related to 'RunTaskProgramTargetDevice' Task
hWC.ProgrammingMethod = hdlcoder.ProgrammingMethod.Download;

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
try
    hdlcoder.runWorkflow('adsb_rx_targeting/HDL_DUT', hWC, 'Verbosity', 'on');
    bdclose('all');
    out = [];
catch ME
    if exist('hdl_prj/vivado_ip_prj/boot/BOOT.BIN','file')
       ME = [];
    end
    out = ME;%.identifier
end
