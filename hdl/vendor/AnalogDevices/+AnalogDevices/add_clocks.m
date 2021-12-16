function add_clocks(hRD,project)

switch lower(project)
    case 'fmcomms2'
        hRD.addClockInterface( ...
            'ClockConnection',   'util_ad9361_divclk/clk_out', ...
            'ResetConnection',   'util_ad9361_divclk_reset/peripheral_aresetn');
    case 'adrv9002'
        hRD.addClockInterface( ...
            'ClockConnection',   'sys_ps8/pl_clk0', ...
            'ResetConnection',   'sys_rstgen/peripheral_aresetn');
    % case 'adrv9009'
    end
end
