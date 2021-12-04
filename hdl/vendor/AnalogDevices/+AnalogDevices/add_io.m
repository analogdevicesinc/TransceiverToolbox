function add_io(hRD,project,fpga,type)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add AXI4 and AXI4-Lite slave interfaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
out = AnalogDevices.get_memory_axi_interface_info(fpga,lower(project));
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', out.InterfaceConnection, ...
    'BaseAddress',         out.BaseAddress, ...
    'MasterAddressSpace',  out.MasterAddressSpace);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add Reference design interfaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AnalogDevices.add_io_ports(hRD,lower(project),lower(type),lower(fpga));

end