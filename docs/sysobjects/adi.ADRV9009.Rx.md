

<!-- <div class="sysobj_h1">adi.ADRV9009.Rx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9009.Rx System object is a signal source that can receive<br>    complex data from the ADRV9009.<br> <br>    rx = adi.ADRV9009.Rx;<br>    rx = adi.ADRV9009.Rx('uri','ip:192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9009.pdf">ADRV9009 Datasheet</a><br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9009.Rx
dev = adi.ADRV9009.Rx(Name, Value)
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
    <p style="padding: 0px;">specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'manual' — For setting the gain manually with the Gain property</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel0')" class="collapsible-property collapsible-property-GainChannel0">GainChannel0 <span style="text-align:right" class="plus-GainChannel0">+</span></button>
  <div class="content content-GainChannel0" style="display: none;">
    <p style="padding: 0px;">Channel 0 gain, specified as a scalar from 1 dB to 30 dB. The acceptable minimum and maximum gain setting depends on the center frequency.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainChannel1')" class="collapsible-property collapsible-property-GainChannel1">GainChannel1 <span style="text-align:right" class="plus-GainChannel1">+</span></button>
  <div class="content content-GainChannel1" style="display: none;">
    <p style="padding: 0px;">Channel 1 gain, specified as a scalar from 1 dB to 30 dB. The acceptable minimum and maximum gain setting depends on the center frequency.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel0')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel0">EnableQuadratureTrackingChannel0 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel0">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel1')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel1">EnableQuadratureTrackingChannel1 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel1">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableHarmonicDistortionTrackingChannel0')" class="collapsible-property collapsible-property-EnableHarmonicDistortionTrackingChannel0">EnableHarmonicDistortionTrackingChannel0 <span style="text-align:right" class="plus-EnableHarmonicDistortionTrackingChannel0">+</span></button>
  <div class="content content-EnableHarmonicDistortionTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableHarmonicDistortionTrackingChannel1')" class="collapsible-property collapsible-property-EnableHarmonicDistortionTrackingChannel1">EnableHarmonicDistortionTrackingChannel1 <span style="text-align:right" class="plus-EnableHarmonicDistortionTrackingChannel1">+</span></button>
  <div class="content content-EnableHarmonicDistortionTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureCalibration')" class="collapsible-property collapsible-property-EnableQuadratureCalibration">EnableQuadratureCalibration <span style="text-align:right" class="plus-EnableQuadratureCalibration">+</span></button>
  <div class="content content-EnableQuadratureCalibration" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature calibration on initialization, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnablePhaseCorrection')" class="collapsible-property collapsible-property-EnablePhaseCorrection">EnablePhaseCorrection <span style="text-align:right" class="plus-EnablePhaseCorrection">+</span></button>
  <div class="content content-EnablePhaseCorrection" style="display: none;">
    <p style="padding: 0px;">Option to enable phase tracking, specified as true or false. When this property is true, Phase differences between transceivers will be deterministic across power cycles and LO changes</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel0')" class="collapsible-property collapsible-property-PowerdownChannel0">PowerdownChannel0 <span style="text-align:right" class="plus-PowerdownChannel0">+</span></button>
  <div class="content content-PowerdownChannel0" style="display: none;">
    <p style="padding: 0px;">Logical which will power down RX channel 0 when set</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel1')" class="collapsible-property collapsible-property-PowerdownChannel1">PowerdownChannel1 <span style="text-align:right" class="plus-PowerdownChannel1">+</span></button>
  <div class="content content-PowerdownChannel1" style="display: none;">
    <p style="padding: 0px;">Logical which will power down RX channel 1 when set</p>
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
  <button type="button" onclick="collapse('EnableFrequencyHoppingModeCalibration')" class="collapsible-property collapsible-property-EnableFrequencyHoppingModeCalibration">EnableFrequencyHoppingModeCalibration <span style="text-align:right" class="plus-EnableFrequencyHoppingModeCalibration">+</span></button>
  <div class="content content-EnableFrequencyHoppingModeCalibration" style="display: none;">
    <p style="padding: 0px;">Option to enable frequency hopping mode VCO calibration, specified as true or false. When this property is true, at initialization VCO calibration lookup table is populated</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9009.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9009.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Rx set up
rx = adi.adi.ADRV9009.Rx.Rx('uri','ip:analog.local');
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