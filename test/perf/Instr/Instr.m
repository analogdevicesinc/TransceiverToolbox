classdef (Abstract) Instr < matlab.System
   properties (Abstract)
       URI
       CenterFrequency
       FrequencyBias
       SampleRate
   end
   
   properties (Access = private)
       Device
       DeviceSetup = false
   end
   
   methods (Abstract)
       Setup(obj)      
   end
   
   methods
      function sendCommand(obj,cmd)
          fprintf(obj.Device,cmd);
      end 
      
      function WaitTillComplete(obj)
          % Wait until instrument operation is complete
          operationComplete = str2double(query(obj.Device,'*OPC?'));
          while ~operationComplete
              operationComplete = str2double(query(obj.Device,'*OPC?'));
          end
      end
      
      function DisplayInstrumentErrors(obj)
          % Display any instrument errors
          instrumentError = query(obj.Device,'SYSTem:ERRor?');
          errors = 0; 
          maxErrors = 10;
          while ~contains(lower(instrumentError),'no error') && (errors<maxErrors)
              fprintf('\tInstrument Error: %s',instrumentError);
              instrumentError = query(obj.Device,'SYSTem:ERRor:NEXT?');
              errors = errors + 1;
          end
      end
      
      function Release(obj)
          % Clear connected devices
          g = instrfind;
          if ~isempty(g)
              fclose(g);
              fclose(obj.Device); 
              delete(obj.Device);
          end
          obj.DeviceiceSetup = false;
      end
      
   end
end