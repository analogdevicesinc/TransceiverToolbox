function hP = plugin_board()
% Zynq Platform PCore
% Use Plugin API to create board plugin object

% Call the common board definition function
hP = AnalogDevices.adrv9364z7020.common.plugin_board('bob lvds hop', 'Rx & Tx');

