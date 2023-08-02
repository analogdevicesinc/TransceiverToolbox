function hRD = plugin_rd_rxtx
    % Reference design definition

    % Call the common reference design definition function
    hRD = AnalogDevices.plugin_rd('adrv9364-z7020', 'ccbob_lvds', 'Rx & Tx');
