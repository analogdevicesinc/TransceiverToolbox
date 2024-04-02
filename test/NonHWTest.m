classdef NonHWTest < matlab.unittest.TestCase
    properties(TestParameter)
        rootClasses = getClasses();
    end
        
    methods (Test)
        function call_constructors(testCase,rootClasses)
            sdr = eval(['adi.',rootClasses,'()']);
            testCase.assertEqual(class(sdr),['adi.',rootClasses]);
        end
    end
end