function hRD = plugin_rd_tx
    % Reference design definition

    %   Copyright 2014-2015 The MathWorks, Inc.

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('adrv9009', 'ZCU102', 'Tx');
