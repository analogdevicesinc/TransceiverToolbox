

<!-- <div class="sysobj_h1">adi.AD9363.Tx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.AD9363.Tx System object is a signal sink that can<br>    transmit complex data from the AD9364.<br> <br>    tx = adi.AD9363.Tx;<br>    tx = adi.AD9363.Tx('uri','ip:192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/AD9363.pdf">AD9363 Datasheet</a><br> <br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.AD9363.Tx
dev = adi.AD9363.Tx(Name, Value)
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
    <p style="padding: 0px;">RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.Help for adi.AD9363.Tx/CenterFrequency is inherited from superclass ADI.AD9361.TX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('SamplingRate')" class="collapsible-property collapsible-property-SamplingRate">SamplingRate <span style="text-align:right" class="plus-SamplingRate">+</span></button>
  <div class="content content-SamplingRate" style="display: none;">
    <p style="padding: 0px;">Baseband sampling rate in Hz, specified as a scalar from 65105 to 61.44e6 samples per second.Help for adi.AD9363.Tx/SamplingRate is inherited from superclass ADI.AD9361.TX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFBandwidth')" class="collapsible-property collapsible-property-RFBandwidth">RFBandwidth <span style="text-align:right" class="plus-RFBandwidth">+</span></button>
  <div class="content content-RFBandwidth" style="display: none;">
    <p style="padding: 0px;">RF Bandwidth of front-end analog filter in Hz, specified as a scalar from 200 kHz to 56 MHz.Help for adi.AD9363.Tx/RFBandwidth is inherited from superclass ADI.AD9361.TX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel0')" class="collapsible-property collapsible-property-AttenuationChannel0">AttenuationChannel0 <span style="text-align:right" class="plus-AttenuationChannel0">+</span></button>
  <div class="content content-AttenuationChannel0" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.Help for adi.AD9363.Tx/AttenuationChannel0 is inherited from superclass ADI.AD9361.TX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel1')" class="collapsible-property collapsible-property-AttenuationChannel1">AttenuationChannel1 <span style="text-align:right" class="plus-AttenuationChannel1">+</span></button>
  <div class="content content-AttenuationChannel1" style="display: none;">
    <p style="padding: 0px;">Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.Help for adi.AD9363.Tx/AttenuationChannel1 is inherited from superclass ADI.AD9361.TX</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFPortSelect')" class="collapsible-property collapsible-property-RFPortSelect">RFPortSelect <span style="text-align:right" class="plus-RFPortSelect">+</span></button>
  <div class="content content-RFPortSelect" style="display: none;">
    <p style="padding: 0px;">'A' 'B'Help for adi.AD9363.Tx/RFPortSelect is inherited from superclass ADI.AD9361.TX</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.AD9363.Tx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.AD9363.Tx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DataSource')" class="collapsible-property collapsible-property-DataSource">DataSource <span style="text-align:right" class="plus-DataSource">+</span></button>
  <div class="content content-DataSource" style="display: none;">
    <p style="padding: 0px;">Data source, specified as one of the following: 'DMA' — Specify the host as the source of the data. 'DDS' — Specify the DDS on the radio hardware as the source of the data. In this case, each channel has two additive tones.Help for adi.AD9363.Tx/DataSource is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSFrequencies')" class="collapsible-property collapsible-property-DDSFrequencies">DDSFrequencies <span style="text-align:right" class="plus-DDSFrequencies">+</span></button>
  <div class="content content-DDSFrequencies" style="display: none;">
    <p style="padding: 0px;">Frequencies values in Hz of the DDS tone generators. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.AD9363.Tx/DDSFrequencies is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSScales')" class="collapsible-property collapsible-property-DDSScales">DDSScales <span style="text-align:right" class="plus-DDSScales">+</span></button>
  <div class="content content-DDSScales" style="display: none;">
    <p style="padding: 0px;">Scale of DDS tones in range [0,1]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.AD9363.Tx/DDSScales is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DDSPhases')" class="collapsible-property collapsible-property-DDSPhases">DDSPhases <span style="text-align:right" class="plus-DDSPhases">+</span></button>
  <div class="content content-DDSPhases" style="display: none;">
    <p style="padding: 0px;">Phases of DDS tones in range [0,360000]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.AD9363.Tx/DDSPhases is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('EnableCyclicBuffers')" class="collapsible-property collapsible-property-EnableCyclicBuffers">EnableCyclicBuffers <span style="text-align:right" class="plus-EnableCyclicBuffers">+</span></button>
  <div class="content content-EnableCyclicBuffers" style="display: none;">
    <p style="padding: 0px;">Enable Cyclic Buffers, configures transmit buffers to be cyclic, which makes them continuously repeatHelp for adi.AD9363.Tx/EnableCyclicBuffers is inherited from superclass ADI.COMMON.DDS</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Configure device
tx = adi.adi.AD9363.Tx;
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