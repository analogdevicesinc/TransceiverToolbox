

<!-- <div class="sysobj_h1">adi.ADRV9361Z7035.Rx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9361Z7035.Rx System object is a signal source that can <br>    receive complex data from the ADRV9361Z7035.<br> <br>    rx = adi.ADRV9361Z7035.Rx;<br>    rx = adi.ADRV9361Z7035.Rx('uri','ip:192.168.2.1');<br> <br>    <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/adrv9361-z7035.html">Product Page</a><br> <br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9361Z7035.Rx
dev = adi.ADRV9361Z7035.Rx(Name, Value)
```

<div class="sysobj_desc_title">Properties</div>

<div class="sysobj_desc_txt">
<span>
Unless otherwise indicated, properties are non-tunable, which means you cannot change their values after calling the object. Objects lock when you call them, and the release function unlocks them.
<br><br>
If a property is tunable, you can change its value at any time.
<br><br>
For more information on changing property values, see <a href="https://www.mathworks.com/help/matlab/matlab_prog/system-design-in-matlab-using-system-objects.html">System Design in MATLAB Using System Objects.</a>
</span>
</div>
<div class="property">
  <button type="button" onclick="collapse('CenterFrequency')" class="collapsible-property collapsible-property-CenterFrequency">CenterFrequency <span style="text-align:right" class="plus-CenterFrequency">+</span></button>
  <div class="content content-CenterFrequency" style="display: none;">
    <p style="padding: 0px;">RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.Help for adi.ADRV9361Z7035.Rx/CenterFrequency is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('SamplingRate')" class="collapsible-property collapsible-property-SamplingRate">SamplingRate <span style="text-align:right" class="plus-SamplingRate">+</span></button>
  <div class="content content-SamplingRate" style="display: none;">
    <p style="padding: 0px;">Baseband sampling rate in Hz, specified as a scalar from 65105 to 61.44e6 samples per second.Help for adi.ADRV9361Z7035.Rx/SamplingRate is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFBandwidth')" class="collapsible-property collapsible-property-RFBandwidth">RFBandwidth <span style="text-align:right" class="plus-RFBandwidth">+</span></button>
  <div class="content content-RFBandwidth" style="display: none;">
    <p style="padding: 0px;">RF Bandwidth of front-end analog filter in Hz, specified as a scalar from 200 kHz to 56 MHz.Help for adi.ADRV9361Z7035.Rx/RFBandwidth is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainControlModeChannel0')" class="collapsible-property collapsible-property-GainControlModeChannel0">GainControlModeChannel0 <span style="text-align:right" class="plus-GainControlModeChannel0">+</span></button>
  <div class="content content-GainControlModeChannel0" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC modeHelp for adi.ADRV9361Z7035.Rx/GainControlModeChannel0 is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel0')" class="collapsible-property collapsible-property-GainChannel0">GainChannel0 <span style="text-align:right" class="plus-GainChannel0">+</span></button>
  <div class="content content-GainChannel0" style="display: none;">
    <p style="padding: 0px;">Channel 0 gain, specified as a scalar from -3 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.ADRV9361Z7035.Rx/GainChannel0 is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainControlModeChannel1')" class="collapsible-property collapsible-property-GainControlModeChannel1">GainControlModeChannel1 <span style="text-align:right" class="plus-GainControlModeChannel1">+</span></button>
  <div class="content content-GainControlModeChannel1" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC modeHelp for adi.ADRV9361Z7035.Rx/GainControlModeChannel1 is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel1')" class="collapsible-property collapsible-property-GainChannel1">GainChannel1 <span style="text-align:right" class="plus-GainChannel1">+</span></button>
  <div class="content content-GainChannel1" style="display: none;">
    <p style="padding: 0px;">Channel 1 gain, specified as a scalar from -3 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.ADRV9361Z7035.Rx/GainChannel1 is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LoopbackMode')" class="collapsible-property collapsible-property-LoopbackMode">LoopbackMode <span style="text-align:right" class="plus-LoopbackMode">+</span></button>
  <div class="content content-LoopbackMode" style="display: none;">
    <p style="padding: 0px;">Option to set digital loopback mode, specified as 0, 1 or 2. Allows either to digitally loopback TX data into the RX path or vice versa. Value  | Mode ---------------------------  0 |  Disable  1 |  Digital TX -> Digital RX  2 |  RF RX -> RF TX Help for adi.ADRV9361Z7035.Rx/LoopbackMode is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTracking')" class="collapsible-property collapsible-property-EnableQuadratureTracking">EnableQuadratureTracking <span style="text-align:right" class="plus-EnableQuadratureTracking">+</span></button>
  <div class="content content-EnableQuadratureTracking" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.Help for adi.ADRV9361Z7035.Rx/EnableQuadratureTracking is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableRFDCTracking')" class="collapsible-property collapsible-property-EnableRFDCTracking">EnableRFDCTracking <span style="text-align:right" class="plus-EnableRFDCTracking">+</span></button>
  <div class="content content-EnableRFDCTracking" style="display: none;">
    <p style="padding: 0px;">Option to enable RF DC tracking, specified as true or false. When this property is true, an RF DC blocking filter is applied to the input signal.Help for adi.ADRV9361Z7035.Rx/EnableRFDCTracking is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableBasebandDCTracking')" class="collapsible-property collapsible-property-EnableBasebandDCTracking">EnableBasebandDCTracking <span style="text-align:right" class="plus-EnableBasebandDCTracking">+</span></button>
  <div class="content content-EnableBasebandDCTracking" style="display: none;">
    <p style="padding: 0px;">Option to enable baseband DC tracking, specified as true or false. When this property is true, a baseband DC blocking filter is applied to the input signal.Help for adi.ADRV9361Z7035.Rx/EnableBasebandDCTracking is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFPortSelect')" class="collapsible-property collapsible-property-RFPortSelect">RFPortSelect <span style="text-align:right" class="plus-RFPortSelect">+</span></button>
  <div class="content content-RFPortSelect" style="display: none;">
    <p style="padding: 0px;">'A_BALANCED' 'B_BALANCED' 'C_BALANCED' 'A_N' 'A_P' 'B_N' 'B_P' 'C_N' 'C_P' 'TX_MONITOR1' 'TX_MONITOR2' 'TX_MONITOR1_2'Help for adi.ADRV9361Z7035.Rx/RFPortSelect is inherited from superclass ADI.AD9361.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('SamplesPerFrame')" class="collapsible-property collapsible-property-SamplesPerFrame">SamplesPerFrame <span style="text-align:right" class="plus-SamplesPerFrame">+</span></button>
  <div class="content content-SamplesPerFrame" style="display: none;">
    <p style="padding: 0px;">Number of samples per frame, specified as an even positive integer from 2 to 16,777,216. Using values less than 3660 can yield poor performance.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableCustomFilter')" class="collapsible-property collapsible-property-EnableCustomFilter">EnableCustomFilter <span style="text-align:right" class="plus-EnableCustomFilter">+</span></button>
  <div class="content content-EnableCustomFilter" style="display: none;">
    <p style="padding: 0px;">Enable use of custom filter file to set SamplingRate, RFBandwidth, and FIR in datapaths</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CustomFilterFileName')" class="collapsible-property collapsible-property-CustomFilterFileName">CustomFilterFileName <span style="text-align:right" class="plus-CustomFilterFileName">+</span></button>
  <div class="content content-CustomFilterFileName" style="display: none;">
    <p style="padding: 0px;">Path to custom filter file created from filter wizard</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnabledChannels')" class="collapsible-property collapsible-property-EnabledChannels">EnabledChannels <span style="text-align:right" class="plus-EnabledChannels">+</span></button>
  <div class="content content-EnabledChannels" style="display: none;">
    <p style="padding: 0px;">Indexs of channels to be enabled. Input should be a [1xN] vector with the indexes of channels to be enabled. Order is irrelevant</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('uri')" class="collapsible-property collapsible-property-uri">uri <span style="text-align:right" class="plus-uri">+</span></button>
  <div class="content content-uri" style="display: none;">
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9361Z7035.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9361Z7035.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Rx set up
rx = adi.adi.ADRV9361Z7035.Rx.Rx('uri','ip:analog.local');
rx.CenterFrequency = 1e9;
rx.EnabledChannels = 1;
%% Run
for k=1:10
    valid = false;
    while ~valid
        [out, valid] = rx();
    end
end

```