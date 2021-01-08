%% ANALOG DEVICES INC. TRANSCEIVER TOOLBOX SUPPORT PACKAGE
% Analog Devices Inc. Transceiver Toolbox Support Package for Analog 
% Devices transceivers enable the user in designing and prototyping 
% practical wireless systems. Using MATLAB system objects provided with 
% this support package, you can use ADI transceiver products to either 
% capture streaming RF data and apply signal processing algorithms in 
% MATLAB or utilize the provided HDL infrastructre to develop targetable 
% designs that process RF data on the fly, thereby facilitating 
% the design, development and testing of modem designs under real-world 
% conditions. 
% 
% <libiioCore.html libiio Core Concepts>
%{
Refer to existing documentation as much as possible. Only provide an 
overview from a MATLAB perspective.
%}
% 
% <CodeExamples.html Code Examples>
%{
Describe API in a unified manner to appeal to all users regardless of 
whether Pluto, AD936x, AD937x, ADRV900x is being used to run code examples.
%}
% 
% <Examples.html Targeting>
%{
What does HDL coder do?
IQ in IQ out
Valid in Valid out
Discussion on targeting from a non-AD9361 perspective since MATLAB
documentation has AD9361 perspective on HDL. Point to wiki page on 
Transceiver toolbox. But, update it first. 
%}
% 
% <Examples.html Featured Examples>
%{
Streaming Examples
Targeting Examples (Workflow from MATLAB Algorithm implementation to FPGA 
targeting) - point to the donut diagram 
Show examples the way MATLAB doc shows - demos.xml, similarly, see if there is an apps.xml 
published examples, 
%}
% 
% <AdvTopics.html Advanced(?) Topics>
% 
%{
State Management 
- When you change an attribute, when does it take effect?
- What happens when you run the system object operator?
- CenterFrequency gets written to hardware immediately in ADITB, not so in
MWTB. Illustrate by sine wave, FFT plot or iio_attr commands. 
Attributes
Debug Attributes
Fast lock/frequency hopping
...
...
AGC Tuning (For AD936x)
%}
%
% <ForDevs.html For Developers>