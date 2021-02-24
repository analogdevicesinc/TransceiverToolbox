import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.XMLPlugin

at = {'Pluto_LTETests', 'ADIRFSOM_LTETests'};
suite = testsuite(at);
xmlFile = 'LTETestResults.xml';
runner = TestRunner.withTextOutput('LoggingLevel',4);
runner.addPlugin(details_recording_plugin);
plugin = XMLPlugin.producingJUnitFormat(xmlFile);    
runner.addPlugin(plugin);
results = runner.run(suite);
exit(any([results.Failed]));