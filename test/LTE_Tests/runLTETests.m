function results = runLTETests(BoardName, LOStepSize)
    import matlab.unittest.parameters.Parameter
    import matlab.unittest.TestSuite
    import matlab.unittest.TestRunner
    import matlab.unittest.plugins.XMLPlugin

    if nargin == 0
        error('BoardName cannot be empty to run LTE test harness');
    end
    
    if nargin == 1
        LOStepSize = 500e6;
    end
    
    switch BoardName
        case "pluto"
            device = {'Pluto'};
            LOFreqs = num2cell(325e6:LOStepSize:3800e6);
            family = "catalina";
        case {"zynq-adrv9361-z7035-bob-cmos", ...
                "socfpga_cyclone5_sockit_arradio", ...
                "zynq-zed-adv7511-ad9361-fmcomms2-3", ...
                "zynq-zc702-adv7511-ad9361-fmcomms2-3", ...
                "zynq-zc706-adv7511-ad9361-fmcomms2-3", ...
                "zynqmp-zcu102-rev10-ad9361-fmcomms2-3", ...
                "zynq-adrv9361-z7035-fmc", ...
                "zynq-adrv9361-z7035-box", ...
                "zynq-adrv9361-z7035-bob"}
            device = {'AD9361'};
            LOFreqs = num2cell(70e6:LOStepSize:6000e6);
            family = "catalina";
        case {"zynq-zc702-adv7511-ad9364-fmcomms4", ...
                "zynq-zc706-adv7511-ad9364-fmcomms4", ...
                "zynqmp-zcu102-rev10-ad9364-fmcomms4", ...
                "zynq-adrv9364-z7020-box", ...
                "zynq-adrv9364-z7020-bob", ...
                "zynq-adrv9364-z7020-bob-cmos", ...
                "zynq-zed-adv7511-ad9364-fmcomms4"}
            device = {'AD9364'};
            LOFreqs = num2cell(70e6:LOStepSize:6000e6);
            family = "catalina";
        case {"zynqmp-zcu102-rev10-adrv9002"}
            device = {'ADRV9002'};
            LOFreqs = num2cell(2400e6);
            family = "navassa";
        otherwise
            error('%s unsupported for LTE test harness', BoardName);
    end
    
    % run parameterized LTE tests
    switch family
        case {"catalina"}
            params = Parameter.fromData('AD936xDevice', device, 'LOFreqs', LOFreqs);
            suite = TestSuite.fromClass(?AD936x_LTETests, 'ExternalParameters', params);
        case {"navassa"}
            params = Parameter.fromData('ADRV9002Device', device, 'LOFreqs', LOFreqs);
            suite = TestSuite.fromClass(?ADRV9002_LTETests, 'ExternalParameters', params);
        otherwise
            error('%s unsupported or unrecognized', family);
    end

    xmlFile = 'LTETestResults.xml';
    runner = TestRunner.withTextOutput('LoggingLevel',4);
    runner.addPlugin(details_recording_plugin);
    plugin = XMLPlugin.producingJUnitFormat(xmlFile);
    runner.addPlugin(plugin);
    results = runner.run(suite);
    try
        log_lte_evm_test(results);
    catch
        warning('telemetry not found');
    end
    
    if ~usejava('desktop')
        exit(any([results.Failed]));
    end
end