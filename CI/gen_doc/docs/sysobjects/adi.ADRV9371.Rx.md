

<!-- <div class="sysobj_h1">adi.ADRV9371.Rx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9371.Rx System object is a signal source that can receive<br>    complex data from the ADRV9371.<br> <br>    rx = adi.AD9371.Rx;<br>    rx = adi.AD9371.Rx('uri','ip:192.168.2.1');<br> <br>    <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/EVAL-ADRV9371.html">Product Page</a>    <br> <br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9371.Rx
dev = adi.ADRV9371.Rx(Name, Value)
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
  <button type="button" onclick="collapse('GainControlMode')" class="collapsible-property collapsible-property-GainControlMode">GainControlMode <span style="text-align:right" class="plus-GainControlMode">+</span></button>
  <div class="content content-GainControlMode" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC modeHelp for adi.ADRV9371.Rx/GainControlMode is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel0')" class="collapsible-property collapsible-property-GainChannel0">GainChannel0 <span style="text-align:right" class="plus-GainChannel0">+</span></button>
  <div class="content content-GainChannel0" style="display: none;">
    <p style="padding: 0px;">Channel 0 gain, specified as a scalar from -4 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.ADRV9371.Rx/GainChannel0 is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel1')" class="collapsible-property collapsible-property-GainChannel1">GainChannel1 <span style="text-align:right" class="plus-GainChannel1">+</span></button>
  <div class="content content-GainChannel1" style="display: none;">
    <p style="padding: 0px;">Channel 1 gain, specified as a scalar from -4 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.ADRV9371.Rx/GainChannel1 is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LoopbackMode')" class="collapsible-property collapsible-property-LoopbackMode">LoopbackMode <span style="text-align:right" class="plus-LoopbackMode">+</span></button>
  <div class="content content-LoopbackMode" style="display: none;">
    <p style="padding: 0px;">Option to set digital loopback mode, specified as 0 or 1. Allows digital loopback of TX data into the RX path. Value  | Mode ---------------------------  0 |  Disable  1 |  EnableHelp for adi.ADRV9371.Rx/LoopbackMode is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel0')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel0">EnableQuadratureTrackingChannel0 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel0">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.Help for adi.ADRV9371.Rx/EnableQuadratureTrackingChannel0 is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel1')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel1">EnableQuadratureTrackingChannel1 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel1">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.Help for adi.ADRV9371.Rx/EnableQuadratureTrackingChannel1 is inherited from superclass ADI.AD9371.RX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('SamplesPerFrame')" class="collapsible-property collapsible-property-SamplesPerFrame">SamplesPerFrame <span style="text-align:right" class="plus-SamplesPerFrame">+</span></button>
  <div class="content content-SamplesPerFrame" style="display: none;">
    <p style="padding: 0px;">Number of samples per frame, specified as an even positive integer from 2 to 16,777,216. Using values less than 3660 can yield poor performance.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableCustomProfile')" class="collapsible-property collapsible-property-EnableCustomProfile">EnableCustomProfile <span style="text-align:right" class="plus-EnableCustomProfile">+</span></button>
  <div class="content content-EnableCustomProfile" style="display: none;">
    <p style="padding: 0px;">Enable use of custom Profile file to set SamplingRate, RFBandwidth, and FIR in datapaths</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CustomProfileFileName')" class="collapsible-property collapsible-property-CustomProfileFileName">CustomProfileFileName <span style="text-align:right" class="plus-CustomProfileFileName">+</span></button>
  <div class="content content-CustomProfileFileName" style="display: none;">
    <p style="padding: 0px;">Path to custom Profile file created from profile wizard</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CenterFrequency')" class="collapsible-property collapsible-property-CenterFrequency">CenterFrequency <span style="text-align:right" class="plus-CenterFrequency">+</span></button>
  <div class="content content-CenterFrequency" style="display: none;">
    <p style="padding: 0px;">RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9371.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9371.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Rx set up
rx = adi.adi.ADRV9371.Rx.Rx('uri','ip:analog.local');
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