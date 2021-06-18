function hRD = plugin_rd
% Reference design definition

% Call the common reference design definition function
hRD = AnalogDevices.adrv9361z7035.common.plugin_rd('packrf-lvds', 'modem');
AnalogDevices.adrv9361z7035.ccpackrf_lvds_modem.add_rx_tx_io(hRD);