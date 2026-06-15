function [rd, boardName] = hdlcoder_ref_design_customization
% Reference design plugin registration file for ADRV9002 on ZedBoard.

%   Copyright 2013-2014 The MathWorks, Inc.

rd = {...
    'AnalogDevices.adrv9002.zed.plugin_rd_rxtx_byte', ...
    };

boardName = 'AnalogDevices ADRV9002 ZED';

end
