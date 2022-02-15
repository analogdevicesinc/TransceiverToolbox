function hRD = plugin_rd(project, board, design)
% Reference design definition

%   Copyright 2014-2015 The MathWorks, Inc.

if (strcmpi(project, 'fmcomms2'))
    pname = 'FMCOMMS2/3';
else
    pname = upper(project);
end

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

% Create the reference design for the SOM-only
% This is the base reference design that other RDs can build upon
if strcmpi(project, 'pluto')
    hRD.ReferenceDesignName = sprintf('%s (%s)', pname, upper(design));
else
    hRD.ReferenceDesignName = sprintf('%s %s (%s)', pname, upper(board), upper(design));
end

% Determine the board name based on the design
if (strcmpi(project, 'pluto') || ...
        strcmpi(project, 'adrv9361-z7035') || ...
        strcmpi(project, 'adrv9364-z7020'))
    hRD.BoardName = sprintf('AnalogDevices %s', pname);
else
    hRD.BoardName = sprintf('AnalogDevices %s %s', pname, upper(board));
end

% Tool information
%hRD.SupportedToolVersion = {adi.Version.Vivado}; % FIXME
hRD.SupportedToolVersion = {'2019.1'};

% Get the root directory
rootDir = fileparts(strtok(mfilename('fullpath'), '+'));

% Design files are shared
hRD.SharedRD = true;
hRD.SharedRDFolder = fullfile(rootDir, 'vivado');

%% Set top level project pieces
hRD.addParameter( ...
    'ParameterID',   'carrier', ...
    'DisplayName',   'HDL Project Carrier', ...
    'DefaultValue',  lower(board));

hRD.BlockDesignName = 'system';

%% Add custom design files

% add custom Vivado design
if strcmpi(project, 'adrv9002')
    hRD.addParameter( ...
    'ParameterID',   'project', ...
    'DisplayName',   'HDL Project Subfolder', ...
    'DefaultValue',  'adrv9001');

    hRD.addCustomVivadoDesign( ...
        'CustomBlockDesignTcl', fullfile('projects', 'scripts', 'system_project_rxtx.tcl'), ...
        'CustomTopLevelHDL',    fullfile('projects', 'adrv9001', lower(board), 'system_top.v'));
    
    % custom constraint files
    hRD.CustomConstraints = {...
        fullfile('projects', 'adrv9001', lower(board), 'system_constr.xdc'), ...
        fullfile('projects', 'common', lower(board), sprintf('%s_system_constr.xdc', lower(board))), ...
        };
else
    hRD.addParameter( ...
    'ParameterID',   'project', ...
    'DisplayName',   'HDL Project Subfolder', ...
    'DefaultValue',  lower(project));

    hRD.addCustomVivadoDesign( ...
        'CustomBlockDesignTcl', fullfile('projects', 'scripts', 'system_project_rxtx.tcl'), ...
        'CustomTopLevelHDL',    fullfile('projects', lower(project), lower(board), 'system_top.v'));
    
    % custom constraint files
    hRD.CustomConstraints = {...
        fullfile('projects', lower(project), lower(board), 'system_constr.xdc'), ...
        fullfile('projects', 'common', lower(board), sprintf('%s_system_constr.xdc', lower(board))), ...
        };
end




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
AnalogDevices.add_clocks(hRD,project,design)

%% Add IO
AnalogDevices.add_io(hRD,project,board,design);
