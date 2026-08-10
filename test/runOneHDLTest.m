function runOneHDLTest(pattern)
% Run a single BSPTests HDL build (SynthesizeDesign=false) for one config.
% Temporary harness for validating the Vivado 2025.1 / hdl_2026_r1 bump.
import matlab.unittest.TestSuite
import matlab.unittest.parameters.Parameter

if nargin < 1
    pattern = '*fmcomms2.zed.plugin_rd_rx';
end

setenv('CUSTOM_VIVADO_PATH','/tools/Xilinx/2025.1/Vivado/bin/vivado');

% Some reference designs (e.g. adrv9009) only register after a customization
% refresh + rehash (DemoTests does this; BSPTests does not).
try, Advisor.Manager.refresh_customizations; catch, end
rehash toolboxcache

param = Parameter.fromData('SynthesizeDesign',{false});
suite = TestSuite.fromClass(?BSPTests,'ExternalParameters',param);
suite = suite.selectIf('ParameterProperty','configs','ParameterName',pattern);
fprintf('Selected %d test(s) for pattern %s\n', numel(suite), pattern);

runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail',4);
results = runner.run(suite);
disp(table(results));
for t = results
    if t.Failed
        fprintf('FAILED: %s\n', t.Name);
    end
end
end
