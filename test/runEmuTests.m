function results = runEmuTests(bindings, junitFile)
% runEmuTests Run the hardware-free tests of the libiio v1 port
%   RESULTS = runEmuTests(BINDINGS) runs IIOv1EmuTests. BINDINGS is the
%   folder "matlab" of a libiio-conv checkout in which the MEX file was
%   built (it holds the package "iio" and iio_mex.mexa64). Without
%   BINDINGS the package must be on the path already.
%
%   RESULTS = runEmuTests(BINDINGS, JUNITFILE) also writes the results
%   to JUNITFILE in JUnit format.
%
%   An error is raised when a test failed or did not complete, or when
%   no test ran. MATLAB is not closed.

import matlab.unittest.TestRunner
import matlab.unittest.TestSuite
import matlab.unittest.plugins.XMLPlugin

here = fileparts(mfilename('fullpath'));
addpath(here);
addpath(fileparts(here));   % the toolbox: +adi
if nargin >= 1 && ~isempty(bindings)
    assert(isfolder(bindings), 'runEmuTests:noBindings', ...
        'Not a folder: %s', bindings);
    addpath(bindings);
end

suite = TestSuite.fromClass(?IIOv1EmuTests);
runner = TestRunner.withTextOutput('OutputDetail', 3);
if nargin >= 2 && ~isempty(junitFile)
    runner.addPlugin(XMLPlugin.producingJUnitFormat(junitFile));
end
results = runner.run(suite);
disp(table(results));

assert(~isempty(results), 'runEmuTests:noTests', 'No test ran.');
bad = [results.Failed] | [results.Incomplete];
assert(~any(bad), 'runEmuTests:failed', ...
    '%d of %d tests failed or did not complete.', nnz(bad), numel(results));
end
