function r = board_variants
% Board plugin registration file
% 1. Any registration file with this name on MATLAB path will be picked up
% 2. Registration file returns a cell array pointing to the location of
%    the board plugins
% 3. Board plugin must be a package folder accessible from MATLAB path,
%    and contains a board definition file

r = { ...
    'AnalogDevices.adrv9002.zcu102.plugin_rd_rx', ...
    %'AnalogDevices.adrv9002.zcu102.plugin_rd_rxtx', ...
    %'AnalogDevices.adrv9002.zcu102.plugin_rd_tx', ...
    };
end
% LocalWords:  Zynq ZC
