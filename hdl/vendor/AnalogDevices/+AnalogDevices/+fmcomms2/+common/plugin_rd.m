function hRD = plugin_rd(board, design)
% Reference design definition

%   Copyright 2014-2015 The MathWorks, Inc.

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

% Create the reference design for the SOM-only
% This is the base reference design that other RDs can build upon
hRD.ReferenceDesignName = sprintf('FMCOMMS2/3 %s (%s)', upper(board), upper(design));

% Determine the board name based on the design
hRD.BoardName = sprintf('AnalogDevices FMCOMMS2/3 %s', upper(board));

% Tool information
hRD.SupportedToolVersion = {'2019.1'};

% Get the root directory
rootDir = fileparts(strtok(mfilename('fullpath'), '+'));

% Design files are shared
hRD.SharedRD = true;
hRD.SharedRDFolder = fullfile(rootDir, 'vivado');

%% Set top level project pieces
hRD.addParameter( ...
    'ParameterID',   'project', ...
    'DisplayName',   'HDL Project Subfolder', ...
    'DefaultValue',  'fmcomms2');
hRD.addParameter( ...
    'ParameterID',   'carrier', ...
    'DisplayName',   'HDL Project Carrier', ...
    'DefaultValue',  lower(board));

%% Add custom design files
% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', fullfile('projects', 'scripts', 'system_project_rxtx.tcl'), ...
    'CustomTopLevelHDL',    fullfile('projects', 'fmcomms2', lower(board), 'system_top.v'));

hRD.BlockDesignName = 'system';	
	
% custom constraint files
hRD.CustomConstraints = {...
    fullfile('projects', 'fmcomms2', lower(board), 'system_constr.xdc'), ...
    fullfile('projects', 'common', lower(board), sprintf('%s_system_constr.xdc', lower(board))), ...
    };

% custom source files
hRD.CustomFiles = {...
    fullfile('projects')...,
	fullfile('library')...,
    };

hRD.addParameter( ...
    'ParameterID',   'ref_design', ...
    'DisplayName',   'Reference Type', ...
    'DefaultValue',  lower(design));

hRD.addParameter( ...
    'ParameterID',   'fpga_board', ...
    'DisplayName',   'FPGA Boad', ...
    'DefaultValue',  upper(board));
	
%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',   'util_ad9361_divclk/clk_out', ...
    'ResetConnection',   'util_ad9361_divclk_reset/peripheral_aresetn');
	
