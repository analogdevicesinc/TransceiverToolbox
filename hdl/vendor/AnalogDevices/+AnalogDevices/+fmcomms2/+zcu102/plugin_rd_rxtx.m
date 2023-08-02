function hRD = plugin_rd_rxtx
    % Reference design definition

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('FMComms2', 'ZCU102', 'Rx & Tx');
