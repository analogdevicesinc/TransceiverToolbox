function [rd, boardName] = hdlcoder_ref_design_customization
% Reference design plugin registration file
% 1. The registration file with this name inside of a board plugin folder 
%    will be picked up
% 2. Any registration file with this name on MATLAB path will also be picked up
% 3. The registration file returns a cell array pointing to the location of 
%    the reference design plugins
% 4. The registration file also returns its associated board name
% 5. Reference design plugin must be a package folder accessible from 
%    MATLAB path, and contains a reference design definition file

rd = {'AnalogDevicesDemo.adrv9364z7020.ccbob_lvds_hop.rxtx.plugin_rd', ...
     };

boardName = 'AnalogDevicesDemo adrv9364z7020 bob lvds hop (Rx & Tx)';

end

