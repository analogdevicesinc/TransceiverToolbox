function out = get_memory_axi_interface_info(fpga,project)


switch project
    case 'adrv9002'
        switch fpga
            case {'ZCU102'}
                MasterIndex = 'M06';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9009'
        switch fpga
            case {'ZC706'}
                MasterIndex = 'M22';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                MasterIndex = 'M17';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9009zu11eg'
        switch lower(fpga)
            case 'adrv2crr_fmc'
                MasterIndex = 'M17';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9361-z7035'
        switch lower(fpga)
            case 'ccfmc_lvds'
                MasterIndex = 'M12';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ccbob_cmos','ccbob_lvds'}
                MasterIndex = 'M07';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ccbox_lvds','ccpackrf_lvds'}
                MasterIndex = 'M06';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9364-z7020'
        MasterIndex = 'M06';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'adrv9371'
        switch fpga
            case {'ZC706'}
                MasterIndex = 'M22';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                MasterIndex = 'M17';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'fmcomms2'
        switch fpga
            case {'ZC702','ZC706'}
                MasterIndex = 'M09';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case 'ZED'
                MasterIndex = 'M11';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                MasterIndex = 'M04';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'fmcomms5'
        MasterIndex = 'M10';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'pluto'
        MasterIndex = 'M06';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'fmcomms8'
        switch fpga
            case {'ZCU102'}
                MasterIndex = 'M14';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    otherwise
        error(sprintf('Unknown Project %s',project)); %#ok<*SPERR>
end

if contains(MasterAddressSpace,'ps8')
    interconnect = 'axi_hpm0_lpd_interconnect';
else
    interconnect = 'axi_gp0_interconnect';
end
InterfaceConnection = sprintf('%s/%s_AXI', interconnect, MasterIndex);

out = struct('InterfaceConnection', InterfaceConnection, ...
    'BaseAddress', BaseAddress, ...
    'MasterAddressSpace', MasterAddressSpace);
end
