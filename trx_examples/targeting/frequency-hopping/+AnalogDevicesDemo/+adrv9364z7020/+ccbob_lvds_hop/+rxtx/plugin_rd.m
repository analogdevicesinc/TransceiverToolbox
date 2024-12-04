function hRD = plugin_rd
% Reference design definition

%   Copyright 2014-2015 The MathWorks, Inc.

% Call the common reference design definition function
hRD = AnalogDevicesDemo.adrv9364z7020.common.plugin_rd('ccbob_lvds_hop', 'Rx & Tx');
AnalogDevicesDemo.adrv9364z7020.ccbob_lvds_hop.rxtx.add_rx_tx_io(hRD);