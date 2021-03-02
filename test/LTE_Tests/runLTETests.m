function results = runLTETests(BoardName)
    import matlab.unittest.TestSuite
    import matlab.unittest.TestRunner
    import matlab.unittest.plugins.XMLPlugin

    if nargin == 0
        error('BoardName cannot be empty to run LTE test harness');
    end
    
    switch BoardName
        case "pluto"
            at = 'Pluto_LTETests';
        case {"zynq-adrv9361-z7035-bob-cmos", ...
                "socfpga_cyclone5_sockit_arradio", ...
                "zynq-zed-adv7511-ad9361-fmcomms2-3", ...
                "zynq-zc702-adv7511-ad9361-fmcomms2-3", ...
                "zynq-zc706-adv7511-ad9361-fmcomms2-3", ...
                "zynqmp-zcu102-rev10-ad9361-fmcomms2-3", ...
                "zynq-adrv9361-z7035-fmc", ...
                "zynq-adrv9361-z7035-box", ...
                "zynq-adrv9361-z7035-bob"}
            at = 'ADIRFSOM_LTETests';
        otherwise
            error('%s unsupported for LTE test harness', BoardName);
    end
    suite = testsuite(at);
    xmlFile = 'LTETestResults.xml';
    runner = TestRunner.withTextOutput('LoggingLevel',4);
    runner.addPlugin(details_recording_plugin);
    plugin = XMLPlugin.producingJUnitFormat(xmlFile);
    runner.addPlugin(plugin);
    results = runner.run(suite);
    exit(any([results.Failed]));
end