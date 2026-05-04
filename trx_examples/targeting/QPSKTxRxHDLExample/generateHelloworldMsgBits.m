%generateHelloworldMsgBits generates Hello world xxx messages.
%   [bits,info] = generateHelloworldMsgBits(numOfMsgs) returns bits
%   generated from the "Hello world xxx" messages using 7-bit ASCII code
%   for each character. The info output has the message itself. This
%   function generates maximum of 100 messages. Each "Hello world xxx"
%   message including the new line character has 16 characters.  
%
%   For example, 20 messages = 20x16 = 320 characters = 320x7 = 2240 bits =
%   1 frame data bits. Similarly, 100 messages correspond to 5 frames.

%   Copyright 2020 The MathWorks, Inc. 

function [bits,info] = generateHelloworldMsgBits(numOfMsgs)

  if numOfMsgs < 1 || numOfMsgs > 100
      error('number of messages must be between 1 to 100')
  end
  info = [];
  for i = 0:numOfMsgs-1
      if i < 10
          serialnumber = ['00' num2str(i)];
      else
          serialnumber = ['0' num2str(i)];
      end
      info = [info 'Hello world ' serialnumber newline]; %#ok<AGROW>
  end
  
%   disp(info); % uncomment this line to print messages
  
  bits = dec2bin(info).';
  bits = bits(:) - '0';

  
end