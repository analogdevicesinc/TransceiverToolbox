function hRD = plugin_rd_rxtx
    % Reference design definition

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('adrv9361-z7035', 'ccbob_cmos', 'Rx & Tx');
