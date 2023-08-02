function hP = plugin_board()
    % Zynq Platform PCore
    % Use Plugin API to create board plugin object

    %   Copyright 2015 The MathWorks, Inc.

    % Call the common board definition function
    hP = AnalogDevices.plugin_board('adrv9361-z7035');
