function hRD = plugin_rd(project, board, design)
% Reference design definition

%   Copyright 2014-2015 The MathWorks, Inc.

if (strcmpi(project, 'fmcomms2'))
    pname = 'FMCOMMS2/3';    
else
    pname = upper(project);
end

ppath = project;
if (contains(project, 'adrv936'))
    ppath =  strrep(project,'-','');    
end
if strcmpi(project, 'adrv9002')
    ppath = 'adrv9001';
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
    'ParameterID',   'project', ...
    'DisplayName',   'HDL Project Subfolder', ...
    'DefaultValue',  lower(ppath));

hRD.addParameter( ...
    'ParameterID',   'carrier', ...
    'DisplayName',   'HDL Project Carrier', ...
    'DefaultValue',  lower(board));


%% Add custom design files
% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', fullfile('projects', 'scripts', 'system_project_rxtx.tcl'), ...
    'CustomTopLevelHDL',    fullfile('projects', lower(ppath), lower(board), 'system_top.v'));

hRD.BlockDesignName = 'system';

% custom constraint files
if contains(project, 'adrv936')
    board_type = strsplit(board,'_');
    hRD.CustomConstraints = {...
        fullfile('projects', lower(ppath), 'common', strcat(board_type{1}, '_constr.xdc')), ...
        fullfile('projects', lower(ppath), 'common', strcat(lower(ppath), '_constr.xdc')), ...
        fullfile('projects', lower(ppath), 'common', strcat(lower(ppath), '_constr_', board_type{2}, '.xdc')), ...
        };
elseif contains(project, 'pluto')
    hRD.CustomConstraints = {...
        fullfile('projects', 'pluto', 'system_constr.xdc'), ...
        ...%fullfile('projects', 'common', lower(board), sprintf('%s_system_constr.xdc', lower(board))), ...
        };
else
    hRD.CustomConstraints = {...
        fullfile('projects', lower(ppath), lower(board), 'system_constr.xdc'), ...
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
