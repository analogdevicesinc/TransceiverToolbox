function out = get_memory_axi_interface_info(fpga,project)


switch project
    case 'jupiter'
        InterfaceConnection = 'axi_hpm0_lpd_interconnect/M07_AXI';
        BaseAddress = '0x9D000000';
        MasterAddressSpace = 'sys_ps8/Data';
    case 'adrv9002'
        switch fpga
            case {'ZED'}
                % ZedBoard is Zynq-7000: DUT AXI4-Lite attaches to the PS7 GP0
                % master interconnect, which the adrv9001/zed base BD names
                % axi_gp0_interconnect (NOT axi_cpu_interconnect). At GP0 base
                % 0x43C00000 (GP0 = 0x40000000-0x7FFFFFFF). Base masters occupy
                % M00-M12, the 3 byte DMAs auto-assign M13-M15, so the AXI4-Lite
                % takes M16 (the zed case in matlab_processors.tcl grows the
                % interconnect by one to expose it).
                InterfaceConnection = 'axi_gp0_interconnect/M16_AXI';
                BaseAddress = '0x43C00000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                % ZCU102 is ZynqMP: the DUT AXI4-Lite attaches to the PS8
                % low-power-domain master interconnect (axi_hpm0_lpd), not the
                % Zynq-7000 axi_cpu_interconnect. M07 matches the JUPITER byte
                % topology (NUM_MI 8; byte DMAs auto-assign to M08-M10), which
                % the ADRV9002+ZCU102 byte composite reuses.
                InterfaceConnection = 'axi_hpm0_lpd_interconnect/M07_AXI';
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