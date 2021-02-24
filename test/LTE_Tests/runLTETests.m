import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
suite = TestSuite.fromClass(?PlutoLTETests);
runner = TestRunner.withTextOutput('LoggingLevel',4);
runner.addPlugin(details_recording_plugin);
results = runner.run(suite);

% for i = 1:numel(results)
%     results(1).Details
% end