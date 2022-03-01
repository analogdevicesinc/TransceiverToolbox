function out = get_memory_axi_interface_info(fpga,project)


switch project
    case 'adrv9002'
        switch fpga
            case {'ZCU102'}
                InterfaceConnection = 'axi_cpu_interconnect/M06_AXI';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9009'
        switch fpga
            case {'ZC706'}
                InterfaceConnection = 'axi_cpu_interconnect/M21_AXI';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                InterfaceConnection = 'axi_cpu_interconnect/M16_AXI';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9361-z7035'
        switch lower(fpga)
            case 'ccfmc_lvds'
                InterfaceConnection = 'axi_cpu_interconnect/M12_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ccbob_cmos','ccbob_lvds'}
                InterfaceConnection = 'axi_cpu_interconnect/M07_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ccbox_lvds','ccpackrf_lvds'}
                InterfaceConnection = 'axi_cpu_interconnect/M06_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9364-z7020'
        InterfaceConnection = 'axi_cpu_interconnect/M06_AXI';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'adrv9371'
        switch fpga
            case {'ZC706'}
                InterfaceConnection = 'axi_cpu_interconnect/M21_AXI';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                InterfaceConnection = 'axi_cpu_interconnect/M16_AXI';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
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
            case {'ZCU102'}
                InterfaceConnection = 'axi_cpu_interconnect/M04_AXI';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'fmcomms5'
        InterfaceConnection = 'axi_cpu_interconnect/M10_AXI';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'pluto'
        InterfaceConnection = 'axi_cpu_interconnect/M05_AXI';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'fmcomms8'
        switch fpga
            case {'ZCU102'}
                InterfaceConnection = 'axi_cpu_interconnect/M13_AXI';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
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