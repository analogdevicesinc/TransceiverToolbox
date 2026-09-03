function results = runOneHDLTest(pattern, synthesizeDesign)
%RUNONEHDLTEST Run one BSPTests configuration with Vivado 2025.1.

if nargin < 1
    pattern = '*fmcomms2.zed.plugin_rd_rx';
end
if nargin < 2
    synthesizeDesign = false;
end

import matlab.unittest.TestSuite
import matlab.unittest.parameters.Parameter

setenv('CUSTOM_VIVADO_PATH','/tools/Xilinx/2025.1/Vivado/bin/vivado');
try
    Advisor.Manager.refresh_customizations;
catch
end
rehash toolboxcache

param = Parameter.fromData('SynthesizeDesign',{logical(synthesizeDesign)});
suite = TestSuite.fromClass(?BSPTests,'ExternalParameters',param);
suite = suite.selectIf('ParameterProperty','configs','ParameterName',pattern);
assert(numel(suite) == 1, 'Expected one HDL test for %s; selected %d.', ...
    pattern, numel(suite));

runner = matlab.unittest.TestRunner.withTextOutput('OutputDetail',4);
results = runner.run(suite);
assert(all([results.Passed]), 'HDL build failed: %s', results(1).Name);
end
