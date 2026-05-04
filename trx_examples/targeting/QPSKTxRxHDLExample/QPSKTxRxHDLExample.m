%% HDL QPSK Transmitter and Receiver
% This example shows how to implement a QPSK transmitter and receiver in
% Simulink(R) that is optimized for HDL code generation and hardware
% implementation.
 
%  Copyright 2020-2023 The MathWorks, Inc.
 
%%
% The model shown in this example modulates data based on quadrature phase
% shift keying (QPSK). The goal of this example is to model an HDL QPSK
% communications system that can transmit and recover information for a
% real-time system. The receiver implements symbol timing synchronization
% and carrier frequency and phase synchronization, which are essential in a
% single-carrier communications system.

%% System Specifications
% This section explains the specifications of the transmitter and receiver
% used in this example. The transmitter uses a packet-based frame format.
% To generate a preamble sequence, each bit of the 13-bit Barker sequence
% is repeated twice such that the same bit is modulated in the in-phase and
% quadrature-phase by the QPSK Modulator. The preamble sequence is
% followed by 2240 bits of payload data. The transmitter runs using a root
% raised cosine (RRC) pulse-shaping filter with a roll-off factor of 0.5,
% resulting in a bandwidth of 1.5 times the symbol rate. It uses four
% samples per symbol, resulting in a sample rate of four times the symbol
% rate. The RRC impulse response spans over four adjacent symbols. The bit
% rate is twice the symbol rate. The effective average bit rate is the bit
% rate times the frame efficiency. The frame efficiency is (2240/(2240+26))
% , which equals to 0.9885.

%%
% The default symbol rate is set to 1.92 Mbaud, which results in a
% bandwidth of 1.5 times 1.92e6, which equals to 2.88 MHz, and a sample
% rate of 4 times 1.92e6, which equals to 7.68 Msps, bit rate of 2 times
% 1.92e6, which equals to 3.84 Mbps. The effective average bit rate
% supported by this system is 0.9885 times 3.84e6, which equals to 3.7959
% Mbps. The entire system runs at a single maximum clock rate of 7.68 MHz.
% To achieve lower sample rates, the valid signal is handled accordingly.
% These specifications vary with the symbol rate.

%% Model Architecture
% This section explains the high-level architecture of the QPSK transmitter
% and receiver as shown in the block diagram. The QPSK transmitter samples the
% input at a bit rate of twice the symbol rate. The Data Generator &
% Packetizer collects the data bits, generates the preamble bits, and forms
% the packet bits. The HDL Data Scrambler scrambles the data bits of each
% packet to increase bit transitions and avoid long running sequences of
% the same bit. The QPSK Modulator modulates the packet bits to generate
% QPSK symbols. The RRC Transmit Filter upsamples and pulse-shapes the QPSK
% symbols to generate the Tx Waveform at a sample rate of four times that
% of the symbol rate. The QPSK receiver samples the input at the
% transmission rate. The Digital AGC performs gain control to the desired
% amplitude level of the received waveform. The RRC Receive Filter performs
% matched filtering on the AGC output. The Frequency and Time Synchronizer
% performs synchronization operations and generates QPSK symbols for each
% packet. The QPSK Demodulator demodulates the QPSK symbols to generate
% packet bits. The HDL Data Descrambler descrambles the packet data bits
% that stream out of the receiver.

%%
% 
% <<../QPSKBlockDiagram.png>>
% 


%% File Structure
% The example contains the following Simulink model and MATLAB(R) scripts.

%%
% 
% * |commhdlQPSKTxRx|         &mdash; Top-level Simulink model
% * |commhdlQPSKTxRxParameters| &mdash; Generates parameters for QPSK Tx and
% QPSK Rx required for initialization
% * |commhdlQPSKTxRxModelInit|  &mdash; Initializes the |commhdlQPSKTxRx|
% model
% * |generateHelloworldMsgBits| &mdash; Generates "Hello world _xxx_ "
% message bits. _xxx_ refers to values from 000 to 100.


%% System Interface
% This figure shows the top-level model of the QPSK transmitter and
% receiver system.

%%
Modelname      = 'commhdlQPSKTxRx';
open_system(Modelname);

%%
% *Transmitter Inputs*
% 
% * *dataIn* &mdash;  Input data, specified as a Boolean scalar.
% * *validIn* &mdash; Control signal to validate the *dataIn*, specified as
% a Boolean scalar.

%%
% *Transmitter Outputs*
%
% * *dataOut* &mdash; Output transmitted waveform, returned as 16-bit
% complex data at a sample rate four times that of the symbol rate.
% * *validOut* &mdash; Control signal to validate the *dataOut*, returned
% as a Boolean scalar.
% * *txDiagBus* &mdash; Status signal with diagnostic outputs, returned as
% a Bus signal.
% * *dataReady* &mdash; Signal to indicate a ready for the input signals,
% returned as a Boolean scalar.


%%
% *Receiver Inputs*
% 
% * *dataIn* &mdash;  Input data, specified as a 16-bit complex data with
% sample rate as the transmitter output.
% * *validIn* &mdash; Control signal to validate the *dataIn*, specified as
% a Boolean scalar.

%%
% *Receiver Outputs*
%
% * *dataOut* &mdash; Decoded output data bits, returned as a Boolean
% scalar.
% * *ctrlOut* &mdash; Bus signal with start, end, and valid signals,
% returned as a bus signal.
% * *rxDiagBus* &mdash; Status signal with diagnostic outputs, returned as
% a bus signal.

%% Transmitter Structure
% This figure shows the top-level model of the |QPSK Tx| subsystem.

open_system([Modelname '/QPSK Tx']);

%%
% *Bit Packetizer*
%
% The |Bit Packetizer| subsystem consists of a |Data Bits FIFO| subsystem and a
% |Preamble Bits Generator| subsystem. It stores input data and reads it out
% whenever required. It also generates the dataReady signal to indicate if
% the transmitter is ready to accept input data.
% 

open_system([Modelname '/QPSK Tx/Bit Packetizer']);

%%
% The |Data Bits FIFO| subsystem collects input data bits and stores them in
% a RAM. The RAM can fit two data packets to store the current data packet
% while reading out the previous packet. The |RAM Frame Status Indicator|
% function counts the number of packets currently stored in RAM. The
% subsystem reads data from the RAM only if at least one packet is
% available.
% 

open_system([Modelname '/QPSK Tx/Bit Packetizer/Data Bits FIFO']);

%%
% The |Preamble Bits Generator| subsystem gives out valid preamble sequence
% if there is at least one packet available in the RAM. Otherwise, it gives
% out random sequence.


%%
% *HDL Data Scrambler*
%
% The |HDL Data Scrambler| subsystem scrambles the data bits in each packet
% by using the control signals generated by the |Bits Generator| subsystem.

open_system([Modelname '/QPSK Tx/HDL Data Scrambler']);

%%
% *QPSK Modulator*

%%
% The |QPSK Modulator| subsystem uses the <docid:comm_ref#fp245939 QPSK
% Modulator Baseband> block to modulate the preamble and data bits to
% generate QPSK symbols. It uses a gray mapping as described in this table.

disp(table(...
categorical({'00'; '01'; '11'; '10'}),...
categorical({num2str(1*exp(1i*pi/4));num2str(1i*exp(1i*pi/4));num2str(-1*exp(1i*pi/4));num2str(-1i*exp(1i*pi/4))}),...
        'VariableNames',...
        {'Bits','Mapping'}));

open_system([Modelname '/QPSK Tx/QPSK Modulator']); 

%%
% *RRC Transmit Filter*

%%
% The |RRC Transmit Filter| subsystem accepts input signals at a clock rate
% of 4 times the symbol rate that is a valid symbol followed by 3 zeros.
% This discrete valid signal is made continuous using the unit delay
% enabled block, which is equivalent to upsampling by 4. This upsampled
% signal is fed to the <docid:dsphdl_ref#bvi0_ng-1 Discrete FIR Filter>
% block with an RRC impulse response to pulse-shape the transmitter
% waveform. The receive filter in the QPSK receiver forms a matched
% filter to this transmit filter.

open_system([Modelname '/QPSK Tx/RRC Transmit Filter']);

%% Receiver Structure
% This figure shows the top-level overview of the |QPSK Rx| subsystem.

open_system([Modelname '/QPSK Rx']);

%%
% *Automatic Gain Control*

%%
% As the input signal amplitude affects the symbol and carrier synchronizer
% phase-locked loop (PLL) performance, the |Automatic Gain Control| subsystem
% is placed ahead of them. The magnitude squared output is compared with
% the AGC reference to generate an amplitude error. This error is
% multiplied with the loop gain and passed through an integrator to
% calculate the required gain. The resulted gain is multiplied with the AGC
% input to generate the AGC output. For more information, see Chapter 9.5
% of [ <#60 1> ].

open_system([Modelname '/QPSK Rx/Automatic Gain Control'],'force');

%%
% *RRC Receive Filter*

%%
% The RRC Receive Filter is a <docid:dsphdl_ref#bvi0_ng-1 Discrete FIR
% Filter> block with matched filter coefficients of the filter used
% for pulse-shaping in the transmitter. The RRC matched filtering generates
% an RC pulse-shaped waveform, which has zero ISI characteristics at
% maximum eye opening in the eye diagram of the waveform. Also, the
% matched filtering process maximizes the signal to noise power ratio
% (SNR) of the filter output.

%%
% *Frequency and Time Synchronizer*

%%
% The |Frequency and Time Synchronizer| subsystem performs symbol
% synchronization, coarse frequency compensation, carrier synchronization,
% and preamble detection for packet synchronization. It also estimates and
% resolves the phase ambiguity that is left uncorrected in carrier
% synchronization.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer']);

%%
% The |Symbol Synchronizer| subsystem is a PLL-based implementation. It
% generates samples at the optimum time instant (maximum eye opening
% instant) as described in Chapter 8.5 of [ <#60 1> ]. The subsystem
% generates one output sample for every four input samples. The
% |Interpolation Filter| subsystem implements a piecewise parabolic
% interpolator with a hardware resource efficient farrow structure as
% described in Chapter 8.4.2, and the farrow coefficients are tabulated in
% Table 8.4.1 (the free parameter $\alpha$ of the coefficients is taken as
% 0.5) of [ <#60 1> ]. This filter introduces fractional delays in the
% input waveform. The |Gardner TED| subsystem implements a Gardner timing
% error detector. The timing error detector is described in Chapter 8.4.1
% of [ <#60 1> ]. The |Loop Filter| subsystem filters the timing error and
% the timing error is passed on to the |Interpolation Control| function
% block. This block implements a mod-1 decrementing counter to calculate
% fractional delays based on the loop filtered timing error as described in
% Chapter 8.4.3 of [ <#60 1> ] to generate interpolants at optimum sampling
% instants. The |Rate Handle| subsystem selects samples if there is a
% strobe signal and stores them in a FIFO. These samples correspond to the
% maximum eye opening of the eye diagram before symbol synchronization.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Symbol Synchronizer']);

%%
% The |Coarse Frequency Compensator| subsystem raises the input sequence to a
% power of 4 in the |Raise Power to 4| subsystem. This eliminates the QPSK
% phase mapping dependency in the input sequence but reduces the estimation
% range by a factor of 4. This sequence streams into the |Coarse Frequency
% Estimator| subsystem. The estimate obtained from the |Coarse Frequency
% Estimator| subsystem is divided by 4 to remove the factor 4 due to raising
% to power 4 and get the normalized coarse frequency estimate. This
% estimate drives the <docid:dsphdl_ref#buh20ru-1 NCO> block to
% generate complex exponential phase that is conjugated and multiplied with
% the input sequence to correct the frequency offset.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator']);

%%
% The |Coarse Frequency Estimator| subsystem differentially detects the input
% sequence and extracts the complex frequency offset estimate in the input.
% This estimate is averaged for 2^15 consecutive estimates in the
% |Integrator| subsystem to get the final complex estimate. The
% <docid:dsphdl_ref#bua94sl-1 Complex to Magnitude-Angle> block
% extracts the frequency from the complex estimate in the |Extract Frequency| 
% subsystem.
%
% The frequency estimator estimates a normalized frequency (with respect to
% symbol rate) range of -0.125 to 0.125, which corresponds to a frequency
% offset range of -240 KHz to 240 KHz for a symbol rate of 1.92 Mbaud. The
% estimation accuracy is such that the residual frequency offset after
% coarse frequency offset correction is within the normalized frequency
% range of -0.0016 to 0.0016, which corresponds to a frequency offset range
% of -3 KHz to 3 KHz for a symbol rate of 1.92 Mbaud that the carrier
% synchronizer PLL converges.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Coarse Frequency Compensator/Coarse Frequency Estimator'])

%%
% The |Carrier Synchronizer| subsystem is a TYPE II PLL with a sinusoidal
% phase error detector, which operates at a 45 degrees operating point. The
% phase error detector is described in Chapter 7.2.2, and the design
% equations are described in the Appendix C of [ <#60 1> ]. A detailed
% analysis of TYPE II PLL with a zero operating point sinusoidal phase
% detector is described in Chapter 4 of [ <#60 2> ]. The sign function of the
% phase detector in the real and imaginary parts converts all of the angles
% in the 4 quadrants into a first-quadrant angle (0 to 90 degrees), which
% creates an ambiguity of 90,180,270 degrees for second (90 to 180
% degrees), third (-180 to -90 degrees) and fourth (-90 to 0 degrees)
% quadrant angles, respectively. The phase error is calculated as a
% deviation from the operating point (45 degrees) of the phase detector.
% The proportional plus integrator filter in the |Loop Filter| subsystem
% filters the phase error. The loop filter sets the normalized loop
% bandwidth (normalized by the sample rate) and the loop damping factor.
% The default normalized loop bandwidth is set to 0.005, and the default
% damping factor is set to 0.7071. The filtered error is given as a phase
% increment source to the |Direct Digital Synthesis| subsystem, which uses
% the <docid:dsphdl_ref#buh20ru-1 NCO> block for complex
% exponential phase generation. The complex exponential phase is used to
% correct the frequency and phase of the input. A detailed analysis of
% direct digital synthesis is described in Chapter 9.2.2 of [ <#60 1> ].

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Carrier Synchronizer']);

%%
% The |Preamble Detector| subsystem performs continuous correlation for the
% input with the Barker sequence. The correlation is implemented as
% convolution with the reversed Barker sequence as coefficients for the
% <docid:dsphdl_ref#bvi0_ng-1 Discrete FIR Filter> block, and
% the magnitude of the correlated output is found using the
% <docid:dsphdl_ref#bua94sl-1 Complex to Magnitude-Angle> block
% inside the |Correlator| subsystem. The magnitude of the correlation is
% compared with a threshold. The |Peak Search| subsystem begins searching for
% the maximum correlation peak that exceeded the threshold for every one
% frame duration and records the timing offset. The |Timing Adjust| subsystem
% synchronizes packet timing based on the timing offset to generate
% _syncPulse_ signal, which indicates a packet synchronized sample to the
% subsequent subsystem.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Preamble Detector']);

%%
% The |Phase Ambiguity Estimation and Correction| subsystem works based on
% the unique word method for phase ambiguity resolution described in
% Chapter 7.7.1 of [ <#60 1> ]. This method uses the preamble sequence as the
% reference sequence. The reference sequence is conjugated and multiplied
% with the preamble sequence in the input, and the residual phase is
% extracted as the phase ambiguity estimate. This estimate is used to
% correct the ambiguity by rotating the constellation in the opposite
% direction of ambiguity.

open_system([Modelname '/QPSK Rx/Frequency and Time Synchronizer/Phase Ambiguity Estimation and Correction']);

%%
% The |Packet Controller| subsystem generates control signals for the packet
% boundaries.

%%
% *QPSK Demodulator*

%%
% The |QPSK Demodulator| subsystem uses the <docid:comm_ref#fp245824 QPSK
% Demodulator Baseband> block to demodulate the packet synchronized symbols
% and generate bits.

%%
open_system([Modelname '/QPSK Rx/QPSK Demodulator']);

%% 
% *HDL Data Descrambler*

%%
% The |HDL Data Descrambler| subsystem descrambles the demodulated bits to
% generate the user bits. This subsystem is same as the scrambler used at
% the transmitter side.

%%
close_system(Modelname,0);

%% Run Model
% Open the |commhdlQPSKTxRx| model. You can set custom data on the |Input
% Data| subsystem mask and set the channel configuration on the |Channel|
% subsystem mask. Run the model. After simulation, the
% |QPSKTxRxVerification| script verifies the |commhdlQPSKTxRx| model
% outputs. This script generates a reference waveform to compare it with
% the transmitter output, and compares the transmitted bits with the
% receiver decoded user bits.

%%
load_system(Modelname);
open_system([Modelname '/Control Scope']);
sim(Modelname);

%%
open_system([Modelname '/Control Scope']);
close_system(Modelname,0);

%% Generate HDL Code
% To check and generate HDL code, you must have an HDL Coder(TM) license.

%%
% To generate the HDL code for the |QPSK Tx| and |QPSK Rx| subsystems, use
% the following commands:

%% 
% |makehdl('commhdlQPSKTxRx/QPSK Tx')|  and   |makehdl('commhdlQPSKTxRx/QPSK Rx')| 

%%
% To generate test bench, use the following commands:

%%
% |makehdltb('commhdlQPSKTxRx/QPSK Tx')|  and   |makehdltb('commhdlQPSKTxRx/QPSK Rx')| 

%%
% Test bench generation time depends on the simulation time.

%%
% The resulting HDL code is synthesized for the AMD(R) Zynq(R)-7000
% ZC706 evaluation board. The post place and route resource utilization is
% shown in this table. The maximum frequency of operation is 320 MHz for the 
% transmitter and 196 MHz for the receiver.

%%
F = table(...
    categorical({'Slice Registers'; 'Slice LUT'; 'RAMB36'; 'RAMB18'; ...
    'DSP48'}),...
    categorical({'250'; '137'; '0'; '1'; '18'}),...
    categorical({'14303'; '8884'; '5'; '1'; '118'}),...
    'VariableNames',...
    {'Resources','Tx Usage','Rx Usage'});

disp(F);

%% Further Exploration
% You can modify the channel conditions by tuning the variables listed in
% the following table. You can change these values on the |Channel|
% subsystem mask in the |commhdlQPSKTxRx| model.

disp(table(...
    categorical({'fractionalTimingOffset'; 'timingFrequencyOffset'; 'EbN0dB'; 'CFO'; 'CPO'}),...
    categorical({'Normalized timing phase offset specified in the range >= 0 and < 1';...
    'Timing frequency offset specified in PPM';...
    'Energy per information bit to single sided noise power spectral density specified in dB';
    'Carrier frequency offset specified in Hz';...
    'Carrier phase offset specified in degrees'}),...
    'VariableNames',...
    {'Variable Name','Description'}));

%% References
% 1. Michael Rice, _Digital Communications - A Discrete-Time
% Approach_, Prentice Hall, April 2008.
%
% 2. Floyd M.Gardner, _Phaselock Techniques_, Third Edition, John Wiley &
% Sons, Inc., 2005.
%
