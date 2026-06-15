function hP = plugin_board()
% ZedBoard (Zynq-7000) board plugin for the ADRV9002.

%   Copyright 2015 The MathWorks, Inc.

% Call the common board definition function
hP = AnalogDevices.plugin_board('ADRV9002', 'ZED');
