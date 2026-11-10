function exitcode = runHWTests(board)
% runHWTests  Run the hardware test classes for a board against a labgrid-booted device.
%
%   runHWTests(board)             board = device-tree style name, e.g. "zynq-zc706-adv7511-adrv9009"
%   exitcode = runHWTests(board)  0 all passed, 2 any failed, 3 any incomplete (no device)
%
% The board is booted by the labgrid coordinator, not by MATLAB:
%   CI:          matlab-hw-request.yml runs `adi-lg request --part <p> --run "matlab ... runHWTests('<board>')"`
%                and IIO_URI / LG_PLACE / LG_CARRIER are exported to MATLAB.
%   Interactive: setenv LG_COORDINATOR 10.0.0.41:20408; runHWTests('<board>') — each test class's
%                labgrid.fixtures.BoardFixture (test/labgrid-matlab submodule) requests the board itself.
%
% Results: <board>_HWTestResults.xml (JUnit), <board>_labgrid-summary.json, failures.txt.
% Never calls exit(): MATLAB R2025b can crash in exit() after writing the JUnit file, so CI
% reads pass/fail from the XML. Run `git submodule update --init --recursive` after cloning.

import matlab.unittest.constraints.ContainsSubstring;
import matlab.unittest.selectors.HasProcedureName;
import matlab.unittest.selectors.HasTag
import matlab.unittest.plugins.TestReportPlugin;

here = fileparts(mfilename('fullpath'));
if exist('labgrid.runTests', 'file') ~= 2
    addpath(fullfile(here, 'labgrid-matlab', 'toolbox'));
end

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
        at = 'AD9371';
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
    case "zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb"
        at = 'ADRV9009ZU11EG';
    case {"zynqmp-zcu102-rev10-adrv9009-fmcomms8"}
        at = 'FMComms8';
    otherwise
        error('%s unsupported for HW test harness', board);
end
ats = {'AD9361Tests','AD9363Tests','AD9364Tests','FMComms5Tests',...
        'AD9371Tests','ADRV9002Tests','ADRV9009Tests','ADRV9009ZU11EGTests',...
        'FMComms8Tests','DeployedLoopbackTests'};

if nargin == 0
    suite = testsuite(ats);
else
    suite = testsuite(ats);
    suite = selectIf(suite,HasProcedureName(ContainsSubstring(at,'IgnoringCase',true)));
    if strcmp(at,'ADRV9009')
        suite = selectIf(suite,~HasProcedureName(ContainsSubstring('ZU11EG','IgnoringCase',true)));
    end
end

if useNTags
    % Filter out tests that are not for the current board
    suite = selectIf(suite,~HasTag(ntags));
end


results = labgrid.runTests(suite, ...
    Plugins={LabgridHardwarePlugin()}, ...
    JUnit=board+"_HWTestResults.xml", ...
    Summary=board+"_labgrid-summary.json", ...
    Verbosity=1);

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
    elseif test.Incomplete && exitcode == 0
        exitcode = 3;
    end
end
fclose(fid);
save("BSPTest_" + string(datetime("now", Format="dd_MM_yyyy-HH_mm_ss")) + ".mat", 't');
bdclose('all');
end
