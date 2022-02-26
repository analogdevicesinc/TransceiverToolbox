function hB = plugin_board(project, board)
% Use Plugin API to create board plugin object

if nargin < 2
    board = "";
end    
hB = hdlcoder.Board;

if strcmpi(project,'fmcomms2')
    pname = 'FMCOMMS2/3';
else
    pname = project;
end

% Target Board Information
hB.BoardName    = sprintf('AnalogDevices %s', upper(pname));
if nargin > 1
    hB.BoardName    = sprintf('%s %s', hB.BoardName, upper(board));
end

% FPGA Device
hB.FPGAVendor   = 'Xilinx';

% Determine the device based on the board
switch lower(project)
    case 'adrv9002'
        switch(upper(board))
            % 	case 'ZC706'
            % 		hB.FPGADevice   = sprintf('xc7%s', 'z045');
            % 		hB.FPGAPackage  = 'ffg900';
            % 		hB.FPGASpeed    = '-2';
            case 'ZCU102'
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
                hB.FPGAFamily   = 'Zynq UltraScale+';
            otherwise
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
                hB.FPGAFamily   = 'Zynq';
        end
    case {'adrv9009','fmcomms8'}
        switch(upper(board))
        % 	case 'ZC706'
        % 		hB.FPGADevice   = sprintf('xc7%s', 'z045');
        % 		hB.FPGAPackage  = 'ffg900';
        % 		hB.FPGASpeed    = '-2';
            case 'ZCU102'
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
                hB.FPGAFamily   = 'Zynq UltraScale+';
            otherwise
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
                hB.FPGAFamily   = 'Zynq';
        end
    case 'adrv9361-z7035'
        hB.FPGADevice   = sprintf('xc7%s', 'z035i');
        hB.FPGAPackage  = 'fbg676';
        hB.FPGASpeed    = '-2L';
        hB.FPGAFamily   = 'Zynq';
    case 'adrv9364-z7020'
        hB.FPGADevice   = sprintf('xc7%s', 'z020');
        hB.FPGAPackage  = 'clg400';
        hB.FPGASpeed    = '-1';
        hB.FPGAFamily   = 'Zynq';
    case 'fmcomms2'
        switch(upper(board))
            case 'ZCU102'
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
                hB.FPGAFamily   = 'Zynq UltraScale+';
            case 'ZC706'
                hB.FPGADevice   = sprintf('xc7%s', 'z045');
                hB.FPGAPackage  = 'ffg900';
                hB.FPGASpeed    = '-2';
                hB.FPGAFamily   = 'Zynq';
            case 'ZC702'
                hB.FPGADevice   = sprintf('xc7%s', 'z020');
                hB.FPGAPackage  = 'clg484';
                hB.FPGASpeed    = '-1';	
                hB.FPGAFamily   = 'Zynq';
            case 'ZED'
                hB.FPGADevice   = sprintf('xc7%s', 'z020');
                hB.FPGAPackage  = 'clg484';
                hB.FPGASpeed    = '-1';	
                hB.FPGAFamily   = 'Zynq';
            otherwise
                error(sprintf('Unknown board: %s',board));
        end
    case 'fmcomms5'
        switch(upper(board))
            case 'ZC706'
                hB.FPGADevice   = sprintf('xc7%s', 'z045');
                hB.FPGAPackage  = 'ffg900';
                hB.FPGASpeed    = '-2';
                hB.FPGAFamily   = 'Zynq';
            case 'ZC702'
                hB.FPGADevice   = sprintf('xc7%s', 'z020');
                hB.FPGAPackage  = 'clg484';
                hB.FPGASpeed    = '-1';	
                hB.FPGAFamily   = 'Zynq';
            otherwise
                hB.FPGADevice   = sprintf('xc7%s', 'z045');
                hB.FPGAPackage  = 'ffg900';
                hB.FPGASpeed    = '-2';
                hB.FPGAFamily   = 'Zynq';
        end
    case 'pluto'
        hB.FPGAFamily   = 'Zynq';
        hB.FPGADevice   = sprintf('xc7%s', 'z010');
        hB.FPGAPackage  = 'clg225';
        hB.FPGASpeed    = '-1';	
    case 'adrv9371'
        switch(upper(board))
            case 'ZC706'
                hB.FPGAFamily   = 'Zynq';
                hB.FPGADevice   = sprintf('xc7%s', 'z045');
                hB.FPGAPackage  = 'ffg900';
                hB.FPGASpeed    = '-2';
            case 'ZCU102'
                hB.FPGAFamily   = 'Zynq UltraScale+';
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
            otherwise
                hB.FPGAFamily   = 'Zynq UltraScale+';
                hB.FPGADevice   = sprintf('xc%s', 'zu9eg-ffvb1156-2-e');
                hB.FPGAPackage  = '';
                hB.FPGASpeed    = '';
        end
end

% Tool Info
hB.SupportedTool = {'Xilinx Vivado'};

% FPGA JTAG chain position
hB.JTAGChainPosition = 2;

%% Add interfaces
% Standard "External Port" interface

