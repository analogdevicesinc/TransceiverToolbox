function out = get_memory_axi_interface_info(fpga,project)


switch project
    case 'jupiter'
        InterfaceConnection = 'axi_hpm0_lpd_interconnect/M07_AXI';
        BaseAddress = '0x9D000000';
        MasterAddressSpace = 'sys_ps8/Data';
    case 'adrv9002'
        switch fpga
            case {'ZED'}
                % ZedBoard is Zynq-7000: the DUT AXI4-Lite runs on the IPCORE
                % clock (adc_1_clk), which is DEAD on cold boot until the ADRV9002
                % streams. The GP0 is ONE axi_smartconnect carrying every
                % sys_ps7/Data peripheral; a SmartConnect clocked on a dead domain
                % stalls its whole crossbar -> kernel cold-boot wedge. So the zed
                % case in matlab_processors.tcl inserts an axi_clock_converter
                % (modem_axi_cc) that crosses GP0/FCLK -> adc_1_clk on JUST the
                % modem branch, keeping the SmartConnect single-clock. HDL Coder
                % connects the DUT to the converter's adc_1_clk-side M_AXI; Vivado
                % assigns 0x43C00000 through it (sys_ps7 GP0 -> SmartConnect M16 ->
                % modem_axi_cc -> DUT).
                InterfaceConnection = 'modem_axi_cc/M_AXI';
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