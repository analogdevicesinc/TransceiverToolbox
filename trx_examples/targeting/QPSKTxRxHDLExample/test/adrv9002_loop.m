% clear all;

uri = 'ip:10.0.0.233';

%% Tx set up
tx = adi.ADRV9002.Tx('uri',uri);
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.AttenuationChannel0 = -30;
tx.CenterFrequencyChannel0 = tx.CenterFrequencyChannel0 + 100e6;

% data = load('tx_capture.mat');
% x = data.tx_capture.Data;

frameSize = 2240;
dataBits = reshape(repmat(randsrc(frameSize*1,1,[0,1],RandStream('mcg16807','Seed',0)), 59,1), [frameSize*59,1]);
enabledScramble = false;
[x,refQPSKSym] = generateQPSKTxReference(dataBits, enabledScramble);

x = x ./ max(abs(x));
x = x.* 2^15;

tx(x);
pause(3);

%% Rx set up
rx = adi.ADRV9002.Rx('uri',uri);
rx.EnabledChannels = 1;
rx.kernelBuffersCount = 1;
rx.CenterFrequencyChannel0 = tx.CenterFrequencyChannel0 + 1e3;
rx.SamplesPerFrame = 2^20;

%% Run
for k=1:30
    valid = false;
    while ~valid
        [y, valid] = rx();
    end
end
tx.release();
rx.release();

% figure(1); 
% plot(0:numel(y)-1, real(y), 'r', 0:numel(y)-1, imag(y), 'b'); 
% xlim([0 250]); 
% xlabel('sample index'); 
% grid on;

%% To timeseries
% Scale
yy = double(y) ./ 2^13 * 3/2;
% yy = yy(1:2^19);

% Convert to timeseries Simulink can understand
sampleTime = 1/(Rsym*Config.SamplesPerSymbol);
% sampleTime = 1/1.92e6;
numSteps = length(yy);
time = sampleTime*[0:(numSteps-1)];
data = yy;
time = time';
% data = data.';
inputData = timeseries(data,time);
save("rx_capture_adrv9002.mat","inputData","-v7.3");

%%
function [txWaveform,QPSKModSymbols] = generateQPSKTxReference(databits, enableScramble)
% This function is a algorithmic equivalent of QPSK Tx subsystem
% in commhdlQPSKTxRx.slx. This will not generate frame gaps between the
% frames where as the Simulink model does.

    Params = commhdlQPSKTxRxParameters();

    Preamble = Params.Preamble;
    DataBitsPerPacket = Params.DataBitsPerPacket;
    RRCCoef = Params.RRCCoef;
    SamplesPerSymbol    = Params.SamplesPerSymbol;

    dataBitsPacketWise = reshape(databits,DataBitsPerPacket,[]);
    ScrambledBitsPacketWise = zeros(size(dataBitsPacketWise));
    if enableScramble
        for packetNo = 1:size(dataBitsPacketWise,2)
            ScrambledBitsPacketWise(:,packetNo) = scramble(dataBitsPacketWise(:,packetNo));
        end
    else
        packetNo = size(dataBitsPacketWise,2);
        ScrambledBitsPacketWise = dataBitsPacketWise;
    end
    BitsPacketWise = [repmat(Preamble,1,packetNo);ScrambledBitsPacketWise];
    QPSKModSymbols = QPSKModulate(BitsPacketWise(:));

    txWaveform = zeros(length(QPSKModSymbols)*SamplesPerSymbol,1);
    txWaveform(1:SamplesPerSymbol:end) = QPSKModSymbols;
    txWaveform = filter(RRCCoef,1,txWaveform);

end

function QPSKMod = QPSKModulate(sdata)

    sdataI = sdata(1:2:end);
    sdataQ = sdata(2:2:end);
    QPSKMod = pskmod(sdataI*2+sdataQ,4,pi/4,'gray');

end

function output = scramble(input)

    scramblePoly = [1 0 0 1 0 0 0];
    init_state = [1 0 1 1 1 0 1];
    currentState = init_state;
    output = zeros(size(input));
    for i = 1:length(input)
        bit = mod(nnz(currentState(scramblePoly == 1)),2);
        output(i) = bitxor(input(i),bit);
        currentState(1) = currentState(2);
        currentState(2) = currentState(3);
        currentState(3) = currentState(4);
        currentState(4) = currentState(5);
        currentState(5) = currentState(6);
        currentState(6) = currentState(7);
        currentState(7) = bit;
    end

end

function [RxBits,trueOffset] = getBitsofCorrectSyncedPackets(rxOut,simTimingOffset,srtLoc,endLoc,payloadLen)

    data = cell(length(srtLoc),1);
    for i = 1:length(srtLoc)
        if any(srtLoc(i) == endLoc-payloadLen+1)
            data{i} = rxOut(srtLoc(i):srtLoc(i)+payloadLen-1);
        end
    end
    data = data(:);
    trueOffset    = mode(simTimingOffset);
    RxBits = data;

end

