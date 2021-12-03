function out = get_memory_axi_interface_info(fpga,project)


switch project
    case 'fmcomms2'
        switch fpga
            case {'ZC702','ZC706'}
                InterfaceConnection = 'axi_cpu_interconnect/M09_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case 'ZED'
                InterfaceConnection = 'axi_cpu_interconnect/M11_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    otherwise
        error(sprintf('Unknown Project %s',project)); %#ok<*SPERR>
end

out = struct('InterfaceConnection', InterfaceConnection, ...
    'BaseAddress', BaseAddress, ...
    'MasterAddressSpace', MasterAddressSpace);
end