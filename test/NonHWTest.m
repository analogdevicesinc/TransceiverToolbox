classdef NonHWTest < matlab.unittest.TestCase
    
    properties(TestParameter)
        rootClasses = {'AD9361','AD9363','AD9364'...
            'AD9371','ADRV9009','ADRV9002'}
        children = {'Rx','Tx'};
    end
    
   
    methods (Test)
        
        function call_constructors(testCase,rootClasses,children)
            sdr = eval(['adi.',rootClasses,'.',children,'()']);
            testCase.assertEqual(class(sdr),['adi.',rootClasses,'.',children]);
        end
        
    end

    
end

