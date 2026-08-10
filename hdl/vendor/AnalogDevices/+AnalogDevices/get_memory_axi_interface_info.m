function out = get_memory_axi_interface_info(fpga,project)
% Returns the HDL Coder AXI4-Lite master interface connection for the DUT IP.
%
% hdl_2026_r1 renamed the ADI reference-design CPU interconnect and switched
% it to SmartConnect. The instance name now depends on the PS type:
%   Zynq-7000 (sys_ps7) -> axi_gp0_interconnect
%   ZynqMP    (sys_ps8) -> axi_hpm0_lpd_interconnect
% MasterIndex is the base design's master count -- the extra (highest-index)
% master port that matlab_processors.tcl::preprocess_bd reserves for the DUT
% IP. These indices are carried over from the hdl_2022_r2 designs and were
% confirmed unchanged for fmcomms2/ZED; other boards should be re-confirmed
% against a build (preprocess_bd prints "base_NUM_MI=" for each design).

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
                % hdl_2026_r1: base grew by one master vs hdl_2022_r2 (was M21).
                MasterIndex = 'M22';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                % hdl_2026_r1: base grew by one master vs hdl_2022_r2 (was M16).
                MasterIndex = 'M17';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    case 'adrv9009zu11eg'
        switch lower(fpga)
            case 'adrv2crr_fmc'
                % 13 unconditional ad_cpu_interconnect calls in
                % adrv9009zu11eg_bd.tcl + 4 in adrv2crr_fmc_bd.tcl => base
                % masters M00..M16, so preprocess_bd's extra master is M17.
                % Confirm against the "preprocess_bd base_NUM_MI=" print.
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
            case {'ccbox_lvds'}
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
                % hdl_2026_r1: base grew by one master vs hdl_2022_r2 (was M21).
                MasterIndex = 'M22';
                BaseAddress = '0x50000000';
                MasterAddressSpace = 'sys_ps7/Data';
            case {'ZCU102'}
                % hdl_2026_r1: base grew by one master vs hdl_2022_r2 (was M16).
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
        % hdl_2026_r1: base design grew by one master vs hdl_2022_r2 (was M05).
        MasterIndex = 'M06';
        BaseAddress = '0x43C00000';
        MasterAddressSpace = 'sys_ps7/Data';
    case 'fmcomms8'
        switch fpga
            case {'ZCU102'}
                % hdl_2026_r1: base grew by one master vs hdl_2022_r2 (was M13).
                MasterIndex = 'M14';
                BaseAddress = '0x9D000000';
                MasterAddressSpace = 'sys_ps8/Data';
            otherwise
                error(sprintf('Unknown Project FPGA %s/%s',project,fpga)); %#ok<*SPERR>
        end
    otherwise
        error(sprintf('Unknown Project %s',project)); %#ok<*SPERR>
end

% Resolve the (renamed) SmartConnect CPU interconnect instance from PS type.
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
