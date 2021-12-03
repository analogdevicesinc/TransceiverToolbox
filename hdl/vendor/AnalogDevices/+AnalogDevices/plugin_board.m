function hB = plugin_board(project, board)
% Use Plugin API to create board plugin object

hB = hdlcoder.Board;

if strcmpi(project,'fmcomms2')
    pname = 'FMCOMMS2/3';
else
    pname = project;
end

% Target Board Information
hB.BoardName    = sprintf('AnalogDevices %s %s', upper(pname), upper(board));

% FPGA Device
hB.FPGAVendor   = 'Xilinx';
hB.FPGAFamily   = 'Zynq';

% Determine the device based on the board
switch(upper(board))
	case 'ZC706'
		hB.FPGADevice   = sprintf('xc7%s', 'z045');
		hB.FPGAPackage  = 'ffg900';
		hB.FPGASpeed    = '-2';
	case 'ZC702'
		hB.FPGADevice   = sprintf('xc7%s', 'z020');
		hB.FPGAPackage  = 'clg484';
		hB.FPGASpeed    = '-1';	
	case 'ZED'
		hB.FPGADevice   = sprintf('xc7%s', 'z020');
		hB.FPGAPackage  = 'clg484';
		hB.FPGASpeed    = '-1';	
	otherwise
		hB.FPGADevice   = sprintf('xc7%s', 'z045');
		hB.FPGAPackage  = 'ffg900';
		hB.FPGASpeed    = '-2';
end

% Tool Info
hB.SupportedTool = {'Xilinx Vivado'};

% FPGA JTAG chain position
hB.JTAGChainPosition = 2;

%% Add interfaces
% Standard "External Port" interface

