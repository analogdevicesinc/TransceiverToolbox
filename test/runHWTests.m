function runHWTests(board)

import matlab.unittest.TestRunner;
import matlab.unittest.TestSuite;
import matlab.unittest.plugins.TestReportPlugin;
import matlab.unittest.plugins.XMLPlugin
import matlab.unittest.plugins.DiagnosticsValidationPlugin
import matlab.unittest.parameters.Parameter
import matlab.unittest.plugins.ToUniqueFile;
import matlab.unittest.plugins.TAPPlugin;
import matlab.unittest.constraints.ContainsSubstring;
import matlab.unittest.selectors.HasName;
import matlab.unittest.selectors.HasProcedureName;

switch board
    case "pluto"
        at = 'AD9363Tests';
    case {"zynq-adrv9361-z7035-bob-cmos", ...
            "socfpga_cyclone5_sockit_arradio", ...
            "zynq-zed-adv7511-ad9361-fmcomms2-3", ...
            "zynq-zc702-adv7511-ad9361-fmcomms2-3", ...
            "zynq-zc706-adv7511-ad9361-fmcomms2-3", ...
            "zynqmp-zcu102-rev10-ad9361-fmcomms2-3", ...
            "zynq-adrv9361-z7035-fmc", ...
            "zynq-adrv9361-z7035-box", ...
            "zynq-adrv9361-z7035-bob"}
        at = 'AD9361Tests';
    case {"zynq-zc702-adv7511-ad9364-fmcomms4", ...
            "zynq-zc706-adv7511-ad9364-fmcomms4", ...
            "zynqmp-zcu102-rev10-ad9364-fmcomms4", ...
            "zynq-adrv9364-z7020-box", ...
            "zynq-adrv9364-z7020-bob", ...
            "zynq-adrv9364-z7020-bob-cmos", ...
            "zynq-zed-adv7511-ad9364-fmcomms4"}
        at = 'AD9364Tests';
    case {"zynqmp-zcu102-rev10-ad9361-fmcomms5", ...
            "zynq-zc702-adv7511-ad9361-fmcomms5", ...
            "zynq-zc706-adv7511-ad9361-fmcomms5", ...
            "zynq-zc706-adv7511-ad9361-fmcomms5-ext-lo-adf5355"}
        at = 'FMComms5Tests';
    case {"socfpga_arria10_socdk_adrv9371", ...
            "zynqmp-zcu102-rev10-adrv9371", ...
            "zynq-zc706-adv7511-adrv9371"}
    case {"socfpga_arria10_socdk_adrv9009", ...
            "zynqmp-zcu102-rev10-adrv9009", ...
            "zynq-zc706-adv7511-adrv9009", ...
            "zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb"}
        at = 'ADRV9009Tests';
    case {"socfpga_arria10_socdk_daq2", ...
            "zynqmp-zcu102-rev10-fmcdaq2", ...
            "zynq-zc706-adv7511-fmcdaq2"}
        at = 'DAQ2Tests';
    otherwise
        error('%s unsupported for HW test harness', board);
end
ats = {'AD9361Tests','AD9363Tests','AD9364Tests','FMComms5Tests',...
        'AD9371Tests','ADRV9009Tests','DAQ2Tests'};

if nargin == 0
    suite = testsuite(ats);
else
    suite = testsuite(ats);
    suite = selectIf(suite,HasProcedureName(ContainsSubstring(at,'IgnoringCase',true)));
end

try
    
    runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail',1);
    runner.addPlugin(DiagnosticsValidationPlugin)
    xmlFile = 'HWTestResults.xml';
    plugin = XMLPlugin.producingJUnitFormat(xmlFile);
    
    runner.addPlugin(plugin);
    results = runner.run(suite);
    
    t = table(results);
    disp(t);
    disp(repmat('#',1,80));
    for test = results
        if test.Failed
            disp(test.Name);
        end
    end
catch e
    disp(getReport(e,'extended'));
    bdclose('all');
    exit(1);
end
save(['BSPTest_',datestr(now,'dd_mm_yyyy-HH:MM:SS'),'.mat'],'t');
bdclose('all');
exit(any([results.Failed]));
