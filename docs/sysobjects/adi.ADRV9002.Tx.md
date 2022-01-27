

<!-- <div class="sysobj_h1">adi.ADRV9002.Tx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9002.Tx System object is a signal sink that can tranmsit<br>    complex data from the ADRV9002.<br> <br>    tx = adi.ADRV9002.Tx;<br>    tx = adi.ADRV9002.Tx('uri','ip:192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9002.pdf">ADRV9002 Datasheet</a><br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9002.Tx
dev = adi.ADRV9002.Tx(Name, Value)
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
  <button type="button" onclick="collapse('ENSMModeChannel0')" class="collapsible-property collapsible-property-ENSMModeChannel0">ENSMModeChannel0 <span style="text-align:right" class="plus-ENSMModeChannel0">+</span></button>
  <div class="content content-ENSMModeChannel0" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'calibrated' 'primed' 'rf_enabled'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('ENSMModeChannel1')" class="collapsible-property collapsible-property-ENSMModeChannel1">ENSMModeChannel1 <span style="text-align:right" class="plus-ENSMModeChannel1">+</span></button>
  <div class="content content-ENSMModeChannel1" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'calibrated' 'primed' 'rf_enabled'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel0')" class="collapsible-property collapsible-property-AttenuationChannel0">AttenuationChannel0 <span style="text-align:right" class="plus-AttenuationChannel0">+</span></button>
  <div class="content content-AttenuationChannel0" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel1')" class="collapsible-property collapsible-property-AttenuationChannel1">AttenuationChannel1 <span style="text-align:right" class="plus-AttenuationChannel1">+</span></button>
  <div class="content content-AttenuationChannel1" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationControlModeChannel0')" class="collapsible-property collapsible-property-AttenuationControlModeChannel0">AttenuationControlModeChannel0 <span style="text-align:right" class="plus-AttenuationControlModeChannel0">+</span></button>
  <div class="content content-AttenuationControlModeChannel0" style="display: none;">
    <p style="padding: 0px;">Control attenuation through: - bypass - spi - pin</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationControlModeChannel1')" class="collapsible-property collapsible-property-AttenuationControlModeChannel1">AttenuationControlModeChannel1 <span style="text-align:right" class="plus-AttenuationControlModeChannel1">+</span></button>
  <div class="content content-AttenuationControlModeChannel1" style="display: none;">
    <p style="padding: 0px;">Control attenuation through: - bypass - spi - pin</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PortEnableControlChannel0')" class="collapsible-property collapsible-property-PortEnableControlChannel0">PortEnableControlChannel0 <span style="text-align:right" class="plus-PortEnableControlChannel0">+</span></button>
  <div class="content content-PortEnableControlChannel0" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PortEnableControlChannel1')" class="collapsible-property collapsible-property-PortEnableControlChannel1">PortEnableControlChannel1 <span style="text-align:right" class="plus-PortEnableControlChannel1">+</span></button>
  <div class="content content-PortEnableControlChannel1" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('ClosedLoopTrackingChannel0')" class="collapsible-property collapsible-property-ClosedLoopTrackingChannel0">ClosedLoopTrackingChannel0 <span style="text-align:right" class="plus-ClosedLoopTrackingChannel0">+</span></button>
  <div class="content content-ClosedLoopTrackingChannel0" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('ClosedLoopTrackingChannel1')" class="collapsible-property collapsible-property-ClosedLoopTrackingChannel1">ClosedLoopTrackingChannel1 <span style="text-align:right" class="plus-ClosedLoopTrackingChannel1">+</span></button>
  <div class="content content-ClosedLoopTrackingChannel1" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LOLeakageTrackingChannel0')" class="collapsible-property collapsible-property-LOLeakageTrackingChannel0">LOLeakageTrackingChannel0 <span style="text-align:right" class="plus-LOLeakageTrackingChannel0">+</span></button>
  <div class="content content-LOLeakageTrackingChannel0" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LOLeakageTrackingChannel1')" class="collapsible-property collapsible-property-LOLeakageTrackingChannel1">LOLeakageTrackingChannel1 <span style="text-align:right" class="plus-LOLeakageTrackingChannel1">+</span></button>
  <div class="content content-LOLeakageTrackingChannel1" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LoopbackDelayTrackingChannel0')" class="collapsible-property collapsible-property-LoopbackDelayTrackingChannel0">LoopbackDelayTrackingChannel0 <span style="text-align:right" class="plus-LoopbackDelayTrackingChannel0">+</span></button>
  <div class="content content-LoopbackDelayTrackingChannel0" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('LoopbackDelayTrackingChannel1')" class="collapsible-property collapsible-property-LoopbackDelayTrackingChannel1">LoopbackDelayTrackingChannel1 <span style="text-align:right" class="plus-LoopbackDelayTrackingChannel1">+</span></button>
  <div class="content content-LoopbackDelayTrackingChannel1" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PACorrectionTrackingChannel0')" class="collapsible-property collapsible-property-PACorrectionTrackingChannel0">PACorrectionTrackingChannel0 <span style="text-align:right" class="plus-PACorrectionTrackingChannel0">+</span></button>
  <div class="content content-PACorrectionTrackingChannel0" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PACorrectionTrackingChannel1')" class="collapsible-property collapsible-property-PACorrectionTrackingChannel1">PACorrectionTrackingChannel1 <span style="text-align:right" class="plus-PACorrectionTrackingChannel1">+</span></button>
  <div class="content content-PACorrectionTrackingChannel1" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureTrackingChannel0')" class="collapsible-property collapsible-property-QuadratureTrackingChannel0">QuadratureTrackingChannel0 <span style="text-align:right" class="plus-QuadratureTrackingChannel0">+</span></button>
  <div class="content content-QuadratureTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction on the fly tracking calibration for channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureTrackingChannel1')" class="collapsible-property collapsible-property-QuadratureTrackingChannel1">QuadratureTrackingChannel1 <span style="text-align:right" class="plus-QuadratureTrackingChannel1">+</span></button>
  <div class="content content-QuadratureTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction on the fly tracking calibration for channel 1</p>
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
    <p style="padding: 0px;">Enable use of custom Profile file to set SamplingRate, RFBandwidth, and other features of transceiver</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CustomProfileFileName')" class="collapsible-property collapsible-property-CustomProfileFileName">CustomProfileFileName <span style="text-align:right" class="plus-CustomProfileFileName">+</span></button>
  <div class="content content-CustomProfileFileName" style="display: none;">
    <p style="padding: 0px;">Path to custom Profile file created from profile wizard</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CustomStreamFileName')" class="collapsible-property collapsible-property-CustomStreamFileName">CustomStreamFileName <span style="text-align:right" class="plus-CustomStreamFileName">+</span></button>
  <div class="content content-CustomStreamFileName" style="display: none;">
    <p style="padding: 0px;">Path to custom stream file created from profile wizard</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('SamplingRate')" class="collapsible-property collapsible-property-SamplingRate">SamplingRate <span style="text-align:right" class="plus-SamplingRate">+</span></button>
  <div class="content content-SamplingRate" style="display: none;">
    <p style="padding: 0px;">Baseband sampling rate in Hz, specified as a scalar in samples per second. This is a read-only property</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CenterFrequencyChannel0')" class="collapsible-property collapsible-property-CenterFrequencyChannel0">CenterFrequencyChannel0 <span style="text-align:right" class="plus-CenterFrequencyChannel0">+</span></button>
  <div class="content content-CenterFrequencyChannel0" style="display: none;">
    <p style="padding: 0px;">RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('CenterFrequencyChannel1')" class="collapsible-property collapsible-property-CenterFrequencyChannel1">CenterFrequencyChannel1 <span style="text-align:right" class="plus-CenterFrequencyChannel1">+</span></button>
  <div class="content content-CenterFrequencyChannel1" style="display: none;">
    <p style="padding: 0px;">RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('NCOCorrectionFrequencyChannel0')" class="collapsible-property collapsible-property-NCOCorrectionFrequencyChannel0">NCOCorrectionFrequencyChannel0 <span style="text-align:right" class="plus-NCOCorrectionFrequencyChannel0">+</span></button>
  <div class="content content-NCOCorrectionFrequencyChannel0" style="display: none;">
    <p style="padding: 0px;">NCO correction frequency, specified in Hz as a scalar. The default is 0. This property is tunable.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('NCOCorrectionFrequencyChannel1')" class="collapsible-property collapsible-property-NCOCorrectionFrequencyChannel1">NCOCorrectionFrequencyChannel1 <span style="text-align:right" class="plus-NCOCorrectionFrequencyChannel1">+</span></button>
  <div class="content content-NCOCorrectionFrequencyChannel1" style="display: none;">
    <p style="padding: 0px;">NCO correction frequency, specified in Hz as a scalar. The default is 0. This property is tunable.</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9002.Tx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9002.Tx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DataSource')" class="collapsible-property collapsible-property-DataSource">DataSource <span style="text-align:right" class="plus-DataSource">+</span></button>
  <div class="content content-DataSource" style="display: none;">
    <p style="padding: 0px;">Data source, specified as one of the following: 'DMA' — Specify the host as the source of the data. 'DDS' — Specify the DDS on the radio hardware as the source of the data. In this case, each channel has two additive tones.Help for adi.ADRV9002.Tx/DataSource is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSFrequencies')" class="collapsible-property collapsible-property-DDSFrequencies">DDSFrequencies <span style="text-align:right" class="plus-DDSFrequencies">+</span></button>
  <div class="content content-DDSFrequencies" style="display: none;">
    <p style="padding: 0px;">Frequencies values in Hz of the DDS tone generators. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9002.Tx/DDSFrequencies is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSScales')" class="collapsible-property collapsible-property-DDSScales">DDSScales <span style="text-align:right" class="plus-DDSScales">+</span></button>
  <div class="content content-DDSScales" style="display: none;">
    <p style="padding: 0px;">Scale of DDS tones in range [0,1]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9002.Tx/DDSScales is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSPhases')" class="collapsible-property collapsible-property-DDSPhases">DDSPhases <span style="text-align:right" class="plus-DDSPhases">+</span></button>
  <div class="content content-DDSPhases" style="display: none;">
    <p style="padding: 0px;">Phases of DDS tones in range [0,360000]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9002.Tx/DDSPhases is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableCyclicBuffers')" class="collapsible-property collapsible-property-EnableCyclicBuffers">EnableCyclicBuffers <span style="text-align:right" class="plus-EnableCyclicBuffers">+</span></button>
  <div class="content content-EnableCyclicBuffers" style="display: none;">
    <p style="padding: 0px;">Enable Cyclic Buffers, configures transmit buffers to be cyclic, which makes them continuously repeatHelp for adi.ADRV9002.Tx/EnableCyclicBuffers is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Configure device
tx = adi.adi.ADRV9002.Tx;
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