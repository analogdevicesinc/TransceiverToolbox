classdef (Abstract) Instr < matlab.System
   properties
       URI
       CenterFrequency
       SampleRate
   end
   
   methods
       Setup(obj)
       Tx(obj)
       Rx(obj)
       WaitTillComplete(obj)
       Release(obj)       
   end
   
   methods
      function sendCommand(obj,cmd)
          fprintf(obj.dev,cmd);
      end 
   end
end