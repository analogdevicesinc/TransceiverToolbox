classdef HardwareTests < matlab.unittest.TestCase
    
    properties (Abstract)
        author
        uri
    end
    
    methods(TestClassSetup)
        function UpdateURIFromEnv(testCase)
            urienv = getenv('IIO_URI');
            if ~isempty(urienv)
                fprintf('Overriding default URI with: %s\n',urienv);
                testCase.uri = urienv;
            end
        end
    end
    
    methods
        % Check hardware connected
        function CheckDevice(testCase,type,Dev,ip,istx)
            try
                switch type
                    case 'usb'
                        d = Dev();
                    case 'ip'
                        if strcmp(testCase.author,'MathWorks')
                            d= Dev();
                            d.IPAddress = ip;
                        else
                            d= Dev();
                            d.uri = ['ip:',ip];
                        end
                    otherwise
                        error('Unknown interface type');
                end
                if istx
                    d(complex(randn(1024,1),randn(1024,1)));
                else
                    d();
                end
                
            catch ME
                disp(ME.message);
                assumeFail(testCase,'Filtering test: No device found');
            end
        end
        
    end
    
end
