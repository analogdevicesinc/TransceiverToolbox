%% Input data generation script for commhdlQPSKTxRx.slx. 
% This script generates inputs to the transmitter. This script is called in
% Input Data subsystem Mask Initialization in the commhdlQPSKTxRx.slx

%   Copyright 2020-2023 The MathWorks, Inc. 

% Each message is 112 bits
% numOfMsgs = 2;
% [bits,info] = generateHelloworldMsgBits(numOfMsgs)
% size(bits)
%%
% a = reshape(repmat(randsrc(2240*1,1,[0,1],RandStream('mcg16807','Seed',0)), 59,1), [2240*59,1]);
% b = reshape(repmat(randsrc(2240*1,1,[0,1],RandStream('mcg16807','Seed',0)), 59,1), [2240*59,1]);
% 
% disp(isequal(a,b))

%%
dataBits = eval(get_param(qpskFindTxInputData(gcs),'dataBits'));
Rsym = eval(get_param(qpskFindTxInputData(gcs),'Rsym'));
validateattributes(dataBits,{'double'},{'binary','column','finite'},'','dataBits');
validateattributes(Rsym,{'double'},{'finite','scalar','positive'},'','Rsym');

Config = commhdlQPSKTxRxParameters;
% chart parameter for the Tx Message Generator (configurable packet size)
dataBitsPerPacket = Config.DataBitsPerPacket;

Nframes             = length(dataBits)/Config.DataBitsPerPacket;
if (Nframes - floor(Nframes)) ~= 0
    error('Number of dataBits must be integer multiple of 2240');
end

dataIn              = dataBits;
validIn             = true(size(dataIn));

% Generate validIn according to effective bit rate
dataIn = [zeros(length(Config.Preamble),Nframes);reshape(dataIn,Config.DataBitsPerPacket,Nframes)];
validIn = [false(length(Config.Preamble),Nframes);reshape(validIn,Config.DataBitsPerPacket,Nframes)];
dataIn = dataIn(:);
validIn = validIn(:);

CSLatency              = 5;
SSLatency              = 17;
PDLatency              = 44;
PALatency              = 101;
FCLatency              = 2;
QPSKDemodLatency       = 3;
DescramblerLatency     = 2;

stopTime =  (CSLatency + SSLatency)/(Rsym) + (DescramblerLatency+12)/(Rsym) ...
    + (PDLatency + PALatency + FCLatency + QPSKDemodLatency + 8)/(Rsym) ...
    + ((Nframes+1+1+1) * Config.BitsPerPacket/2)/(Rsym);

% Set number of initial frames to remove from comparison which may involve
% in transient response. You can compare all the samples if transient response
% is also of interest by setting the below variable to 0.
initFramesNotToCompareInRx = 29;
save('init_data.mat');
