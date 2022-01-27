

<!-- <div class="sysobj_h1">adi.ADRV9009.Tx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9009.Tx System object is a signal sink that can tranmsit<br>    complex data from the ADRV9009.<br> <br>    tx = adi.ADRV9009.Tx;<br>    tx = adi.ADRV9009.Tx('uri','ip:192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9009.pdf">ADRV9009 Datasheet</a><br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9009.Tx
dev = adi.ADRV9009.Tx(Name, Value)
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
  <button type="button" onclick="collapse('AttenuationChannel0')" class="collapsible-property collapsible-property-AttenuationChannel0">AttenuationChannel0 <span style="text-align:right" class="plus-AttenuationChannel0">+</span></button>
  <div class="content content-AttenuationChannel0" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -41.95 to 0 dB with a resolution of 0.05 dB.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel1')" class="collapsible-property collapsible-property-AttenuationChannel1">AttenuationChannel1 <span style="text-align:right" class="plus-AttenuationChannel1">+</span></button>
  <div class="content content-AttenuationChannel1" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -41.95 to 0 dB with a resolution of 0.05 dB.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel0')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel0">EnableQuadratureTrackingChannel0 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel0">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the transmitted signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureTrackingChannel1')" class="collapsible-property collapsible-property-EnableQuadratureTrackingChannel1">EnableQuadratureTrackingChannel1 <span style="text-align:right" class="plus-EnableQuadratureTrackingChannel1">+</span></button>
  <div class="content content-EnableQuadratureTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the transmitted signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableLOLeakageTrackingChannel0')" class="collapsible-property collapsible-property-EnableLOLeakageTrackingChannel0">EnableLOLeakageTrackingChannel0 <span style="text-align:right" class="plus-EnableLOLeakageTrackingChannel0">+</span></button>
  <div class="content content-EnableLOLeakageTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, LO leakage compensation is applied to the transmitted signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableLOLeakageTrackingChannel1')" class="collapsible-property collapsible-property-EnableLOLeakageTrackingChannel1">EnableLOLeakageTrackingChannel1 <span style="text-align:right" class="plus-EnableLOLeakageTrackingChannel1">+</span></button>
  <div class="content content-EnableLOLeakageTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature tracking, specified as true or false. When this property is true, LO leakage compensation is applied to the transmitted signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableQuadratureCalibration')" class="collapsible-property collapsible-property-EnableQuadratureCalibration">EnableQuadratureCalibration <span style="text-align:right" class="plus-EnableQuadratureCalibration">+</span></button>
  <div class="content content-EnableQuadratureCalibration" style="display: none;">
    <p style="padding: 0px;">Option to enable quadrature calibration on initialization, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableLOLeakageCorrection')" class="collapsible-property collapsible-property-EnableLOLeakageCorrection">EnableLOLeakageCorrection <span style="text-align:right" class="plus-EnableLOLeakageCorrection">+</span></button>
  <div class="content content-EnableLOLeakageCorrection" style="display: none;">
    <p style="padding: 0px;">Option to enable phase tracking, specified as true or false. When this property is true, at initialization LO leakage correction will be applied</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableLOLeakageCorrectionExternal')" class="collapsible-property collapsible-property-EnableLOLeakageCorrectionExternal">EnableLOLeakageCorrectionExternal <span style="text-align:right" class="plus-EnableLOLeakageCorrectionExternal">+</span></button>
  <div class="content content-EnableLOLeakageCorrectionExternal" style="display: none;">
    <p style="padding: 0px;">Option to enable phase tracking, specified as true or false. When this property is true, at initialization LO leakage correction will be applied within an external loopback path. Note this requires external cabling.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel0')" class="collapsible-property collapsible-property-PowerdownChannel0">PowerdownChannel0 <span style="text-align:right" class="plus-PowerdownChannel0">+</span></button>
  <div class="content content-PowerdownChannel0" style="display: none;">
    <p style="padding: 0px;">Logical which will power down TX channel 0 when set</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel1')" class="collapsible-property collapsible-property-PowerdownChannel1">PowerdownChannel1 <span style="text-align:right" class="plus-PowerdownChannel1">+</span></button>
  <div class="content content-PowerdownChannel1" style="display: none;">
    <p style="padding: 0px;">Logical which will power down TX channel 1 when set</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9009.Tx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9009.Tx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DataSource')" class="collapsible-property collapsible-property-DataSource">DataSource <span style="text-align:right" class="plus-DataSource">+</span></button>
  <div class="content content-DataSource" style="display: none;">
    <p style="padding: 0px;">Data source, specified as one of the following: 'DMA' — Specify the host as the source of the data. 'DDS' — Specify the DDS on the radio hardware as the source of the data. In this case, each channel has two additive tones.Help for adi.ADRV9009.Tx/DataSource is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSFrequencies')" class="collapsible-property collapsible-property-DDSFrequencies">DDSFrequencies <span style="text-align:right" class="plus-DDSFrequencies">+</span></button>
  <div class="content content-DDSFrequencies" style="display: none;">
    <p style="padding: 0px;">Frequencies values in Hz of the DDS tone generators. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9009.Tx/DDSFrequencies is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSScales')" class="collapsible-property collapsible-property-DDSScales">DDSScales <span style="text-align:right" class="plus-DDSScales">+</span></button>
  <div class="content content-DDSScales" style="display: none;">
    <p style="padding: 0px;">Scale of DDS tones in range [0,1]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9009.Tx/DDSScales is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSPhases')" class="collapsible-property collapsible-property-DDSPhases">DDSPhases <span style="text-align:right" class="plus-DDSPhases">+</span></button>
  <div class="content content-DDSPhases" style="display: none;">
    <p style="padding: 0px;">Phases of DDS tones in range [0,360000]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9009.Tx/DDSPhases is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableCyclicBuffers')" class="collapsible-property collapsible-property-EnableCyclicBuffers">EnableCyclicBuffers <span style="text-align:right" class="plus-EnableCyclicBuffers">+</span></button>
  <div class="content content-EnableCyclicBuffers" style="display: none;">
    <p style="padding: 0px;">Enable Cyclic Buffers, configures transmit buffers to be cyclic, which makes them continuously repeatHelp for adi.ADRV9009.Tx/EnableCyclicBuffers is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Configure device
tx = adi.adi.ADRV9009.Tx;
tx.uri = "ip:analog.local";
tx.CenterFrequency = 1e9;
tx.DataSource = 'DMA';
tx.EnableCyclicBuffers = true;
tx.EnabledChannels = 1;
%% Generate tone
amplitude = 2^15; frequency = 0.12e6;
swv1 = dsp.SineWave(amplitude, frequency);
swv1.ComplexOutput = true;
swv1.SamplesPerFrame = 2^14;
swv1.SampleRate = tx.SamplingRate;
y = swv1();
% Send
tx(y);

```