%% Input data generation script for commhdlQPSKTxRx.slx. 
% This script generates inputs to the transmitter. This script is called in
% Input Data subsystem Mask Initialization in the commhdlQPSKTxRx.slx

%   Copyright 2020-2023 The MathWorks, Inc. 

dataBits = eval(get_param([gcs '/Input Data'],'dataBits'));
Rsym = eval(get_param([gcs '/Input Data'],'Rsym'));
validateattributes(dataBits,{'double'},{'binary','column','finite'},'','dataBits');
validateattributes(Rsym,{'double'},{'finite','scalar','positive'},'','Rsym');

Config = commhdlQPSKTxRxParameters;

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
