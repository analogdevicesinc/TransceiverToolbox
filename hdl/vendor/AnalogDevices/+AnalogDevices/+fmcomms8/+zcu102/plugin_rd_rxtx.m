function hRD = plugin_rd_rxtx
    % Reference design definition

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('FMCOMMS8', 'ZCU102', 'Rx & Tx');
