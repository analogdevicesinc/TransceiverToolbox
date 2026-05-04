%%QPSKTxRxVerification verification script for commhdlQPSKTxRx.slx model
%    This script generates reference data, collects simulation data, and
%    compares the reference data with simulation outputs.

%   Copyright 2020-2023 The MathWorks, Inc.

disp('Running the verification script');

%% Tx verification
%=================================================
% Generate reference data to compare Simulink Tx
%=================================================
[refTxWaveform,refQPSKSym] = generateQPSKTxReference(dataBits);

%=================================================
% Compare Tx constellation symbols with reference
%=================================================
payloadLen = Config.DataBitsPerPacket;
symPerFrame = Config.BitsPerPacket/2; % because QPSK

% The Simulink Tx model generates an initial frame gap of 1 frame. The
% symbols corresponding to the first frame are discarded.
errSym = simQPSKSym(symPerFrame+1:symPerFrame+length(refQPSKSym)) - refQPSKSym;
TxSymbolsMaxError = [max(abs(real(errSym))) max(abs(imag(errSym)))];
simTxWaveform(1:symPerFrame*Config.SamplesPerSymbol) = [];

% Discard all the extra samples from the simulation output greater than
% required length for comparison.
simTxWaveform = simTxWaveform(1:length(refTxWaveform));

% The initial RRC filter state for reference waveform is all zeros where as
% for Simulink waveform it is from the first dummy frame. So, the first
% (L - 1) samples may not match. Remove the initial (L - 1) samples.
% L = RRC filter length.
refTxWaveform = refTxWaveform(length(Config.RRCCoef):end);
simTxWaveform = simTxWaveform(length(Config.RRCCoef):end);

% Compare the samples
errWaveform = refTxWaveform - simTxWaveform;
TxWaveformMaxError = [max(abs(real(errWaveform))) max(abs(imag(errWaveform)))];

disp([newline 'QPSK Tx:']);
disp(['Maximum absolute symbol error: Real:' ...
    num2str(TxSymbolsMaxError(1)) ' Imaginary:' num2str(TxSymbolsMaxError(2))]);
disp([newline 'Maximum absolute RRC output error: Real:' ...
    num2str(TxWaveformMaxError(1)) ' Imaginary:' num2str(TxWaveformMaxError(2))]);

%% Rx verification

%=======================================
% Compare transmitted and received bits
%=======================================

srtLoc = find(RxOutSrt);
endLoc = find(RxOutEnd);

[RxBits,trueOffset] = getBitsofCorrectSyncedPackets(RxOut(:),simTimingOffset,srtLoc(:),endLoc(:),payloadLen);

for idx = length(srtLoc(:)):-1:1
    if isempty(RxBits{idx})
        simSyncedPackets(idx) = [];
        simTimingOffset(idx) = [];
        RxBits(idx) = [];
    end
end

% Compare packets that are detected correctly by using the timing offsets
% captured in simTimingOffset variable
falsePacketsNo = simSyncedPackets(simTimingOffset ~= trueOffset); % gather failed packets
falsePacketsNo(falsePacketsNo <= initFramesNotToCompareInRx) = [];
nErrPkts = numel(falsePacketsNo);
DBPP = Config.DataBitsPerPacket;

idx = find(simSyncedPackets <= initFramesNotToCompareInRx);
simSyncedPackets(idx) = [];
RxBits(idx) = [];

idx = find(simSyncedPackets > Nframes);
simSyncedPackets(idx) = [];
RxBits(idx) = [];

% Discard dataBits which are not synced
TxBits = reshape(dataBits,DBPP,[]);
TxBits = TxBits(:,simSyncedPackets);

% Compute errors
if ~isempty(simSyncedPackets)
    nErrBits = 0;
    nReceivedBits = 0;
    vPktNo = 1; % This variable counts the correct synced packets
    for pktNo = simSyncedPackets(:).'
        if any(pktNo == falsePacketsNo)
            vPktNo = vPktNo + 1;
        else
            nErrBits = nErrBits + nnz(TxBits(:,vPktNo)-RxBits{vPktNo});
            nReceivedBits = nReceivedBits + DBPP;
            vPktNo = vPktNo + 1;
        end
    end
else
    nErrBits = 0;
    nReceivedBits = 0;
end
nMissedPkts = Nframes-initFramesNotToCompareInRx-length(simSyncedPackets);
disp([newline 'QPSK Rx:']);
disp(['Initial frames not compared : ' num2str(initFramesNotToCompareInRx)]);
disp([newline 'Number of packets missed = ' num2str(nMissedPkts)...
    ' out of ' num2str(Nframes-initFramesNotToCompareInRx)]);
disp([newline 'Number of packets false detected = ' num2str(nErrPkts)...
    ' out of ' num2str(length(simSyncedPackets))]);
disp([newline 'Number of bits errored = ' num2str(nErrBits)...
    ' out of ' num2str(nReceivedBits)]);

%%
function [txWaveform,QPSKModSymbols] = generateQPSKTxReference(databits)
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
    for packetNo = 1:size(dataBitsPacketWise,2)
        ScrambledBitsPacketWise(:,packetNo) = scramble(dataBitsPacketWise(:,packetNo));
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

