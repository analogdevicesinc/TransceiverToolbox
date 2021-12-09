function add_clocks(hRD,project)

switch lower(project)
    case 'fmcomms2'
        hRD.addClockInterface( ...
            'ClockConnection',   'util_ad9361_divclk/clk_out', ...
            'ResetConnection',   'util_ad9361_divclk_reset/peripheral_aresetn');

    end
end
