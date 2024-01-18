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
import matlab.unittest.selectors.HasTag

useNTags = false; % Not tags

switch board
    case "pluto"
        at = 'AD9363';
    case {"zynq-adrv9361-z7035-bob-cmos", ...
            "socfpga_cyclone5_sockit_arradio", ...
            "zynq-zed-adv7511-ad9361-fmcomms2-3", ...
            "zynq-zc702-adv7511-ad9361-fmcomms2-3", ...
            "zynq-zc706-adv7511-ad9361-fmcomms2-3", ...
            "zynqmp-zcu102-rev10-ad9361-fmcomms2-3", ...
            "zynq-adrv9361-z7035-fmc", ...
            "zynq-adrv9361-z7035-box", ...
            "zynq-adrv9361-z7035-bob"}
        at = 'AD9361';
    case {"zynq-zc702-adv7511-ad9364-fmcomms4", ...
            "zynq-zc706-adv7511-ad9364-fmcomms4", ...
            "zynqmp-zcu102-rev10-ad9364-fmcomms4", ...
            "zynq-adrv9364-z7020-box", ...
            "zynq-adrv9364-z7020-bob", ...
            "zynq-adrv9364-z7020-bob-cmos", ...
            "zynq-zed-adv7511-ad9364-fmcomms4", ...
            "zynq-adrv9364-z7020-bob-vcmos", ...
            "zynq-adrv9364-z7020-bob-vlvds"}
        at = 'AD9364';
    case {"zynqmp-zcu102-rev10-ad9361-fmcomms5", ...
            "zynq-zc702-adv7511-ad9361-fmcomms5", ...
            "zynq-zc706-adv7511-ad9361-fmcomms5", ...
            "zynq-zc706-adv7511-ad9361-fmcomms5-ext-lo-adf5355"}
        at = 'FMComms5';
    case {"socfpga_arria10_socdk_adrv9371", ...
            "zynqmp-zcu102-rev10-adrv9371", ...
            "zynq-zc706-adv7511-adrv9371"}
        at = 'AD9371Tests';
    case {"zynq-zed-adv7511-adrv9002-vcmos", ...
        "zynq-zed-adv7511-adrv9002-rx2tx2-vcmos", ...
        "zynqmp-zcu102-rev10-adrv9002-vcmos", ...
        "zynqmp-zcu102-rev10-adrv9002-vlvds", ...
        "zynqmp-zcu102-rev10-adrv9002-rx2tx2-vcmos", ...
        "zynqmp-zcu102-rev10-adrv9002-rx2tx2-vlvds"}
        at = 'ADRV9002';
        useNTags = true;
        if contains(lower(board),'lvds')
            ntags = 'CMOS';
        else
            ntags = 'LVDS';
        end
    case {"socfpga_arria10_socdk_adrv9009", ...
            "zynqmp-zcu102-rev10-adrv9009", ...
            "zynq-zc706-adv7511-adrv9009"}
        at = 'ADRV9009';
    case {"zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb"}
        at = 'ADRV9009ZU11EGTests'
    case {"zynqmp-zcu102-rev10-adrv9009-fmcomms8"}
        at = 'FMComms8';
    otherwise
        error('%s unsupported for HW test harness', board);
end
ats = {'AD9361Tests','AD9363Tests','AD9364Tests','FMComms5Tests',...
        'AD9371Tests','ADRV9002Tests','ADRV9009Tests','FMComms8Tests',...
        'ADRV9009ZU11EGTests'};

if nargin == 0
    suite = testsuite(ats);
else
    suite = testsuite(ats);
    suite = selectIf(suite,HasProcedureName(ContainsSubstring(at,'IgnoringCase',true)));
end

if useNTags
    % Filter out tests that are not for the current board
    suite = selectIf(suite,~HasTag(ntags));
end


try
    
    runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail',1);
    runner.addPlugin(DiagnosticsValidationPlugin)
    xmlFile = board+"_HWTestResults.xml";
    plugin = XMLPlugin.producingJUnitFormat(xmlFile);
    
    runner.addPlugin(plugin);
    results = runner.run(suite);
    
    t = table(results);
    disp(t);
    disp(repmat('#',1,80));
    fid = fopen('failures.txt','a+');
    exitcode = 0;
    for test = results
        if test.Failed
            disp(test.Name);
            fprintf(fid,string(test.Name)+'\n');
            exitcode = 2;
        elseif test.Incomplete
            exitcode = 3;
        end
    end
    fclose(fid);
catch e
    disp(getReport(e,'extended'));
    bdclose('all');
    exit(1);
end
save(['BSPTest_',datestr(now,'dd_mm_yyyy-HH_MM_SS'),'.mat'],'t');
bdclose('all');
exit(exitcode);
end
