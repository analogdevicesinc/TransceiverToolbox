function hP = plugin_board()
% Zynq Platform PCore
% Use Plugin API to create board plugin object

% Call the common board definition function
hP = AnalogDevices.plugin_board('FMComms2', 'ZC702');

