function hRD = plugin_rd_rxtx
    % Reference design definition

    %   Copyright 2014-2015 The MathWorks, Inc.

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('adrv9002', 'ZCU102', 'Rx & Tx - Rx is faster or has priority');
