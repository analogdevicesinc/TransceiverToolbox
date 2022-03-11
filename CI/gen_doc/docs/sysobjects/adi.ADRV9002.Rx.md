

<!-- <div class="sysobj_h1">adi.ADRV9002.Rx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9002.Rx System object is a signal source that can receive<br>    complex data from the ADRV9002.<br> <br>    rx = adi.ADRV9002.Rx;<br>    rx = adi.ADRV9002.Rx('uri','ip:192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/ADRV9002.pdf">ADRV9002 Datasheet</a><br>
</span>

</div>

<div class="sysobj_desc_title">Creation</div>

The class can be instantiated in the following way with and without property name value pairs.

```matlab
dev = adi.ADRV9002.Rx
dev = adi.ADRV9002.Rx(Name, Value)
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
  <button type="button" onclick="collapse('InterfaceGainChannel0')" class="collapsible-property collapsible-property-InterfaceGainChannel0">InterfaceGainChannel0 <span style="text-align:right" class="plus-InterfaceGainChannel0">+</span></button>
  <div class="content content-InterfaceGainChannel0" style="display: none;">
    <p style="padding: 0px;">This is the final gain in the digital path with possible values: -36:6:18 This gain should be selected based on primary signal bandwidth. For narrowband applications higher levels of interface gain should be used (0:18) to allow signal level and analog noise to dominate. For wideband applications this gain should be reduced or disabled since quantization noise is minimal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('InterfaceGainChannel1')" class="collapsible-property collapsible-property-InterfaceGainChannel1">InterfaceGainChannel1 <span style="text-align:right" class="plus-InterfaceGainChannel1">+</span></button>
  <div class="content content-InterfaceGainChannel1" style="display: none;">
    <p style="padding: 0px;">This is the final gain in the digital path with possible values: -36:6:18 This gain should be selected based on primary signal bandwidth. For narrowband applications higher levels of interface gain should be used (0:18) to allow signal level and analog noise to dominate. For wideband applications this gain should be reduced or disabled since quantization noise is minimal.</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DigitalGainControlModeChannel0')" class="collapsible-property collapsible-property-DigitalGainControlModeChannel0">DigitalGainControlModeChannel0 <span style="text-align:right" class="plus-DigitalGainControlModeChannel0">+</span></button>
  <div class="content content-DigitalGainControlModeChannel0" style="display: none;">
    <p style="padding: 0px;">The digital gain control has two major purposes, one for gain correction which is to correct the small step size inaccuracy in analog front-end attenuation and the other for gain compensation which is to compensate for the entire analog front-end attenuation. The digital gain block is controlled by the Rx gain table. Different digital gain will be applied when configured in gain correction or gain compensation mode. The Rx gain table has a unique front-end attenuator setting, with a corresponding amount of digital gain, programmed at each index of the table. In the end of the Rx data path, the interface gain could be further applied by using a “Slicer” block for 2 major purposes. One is to avoid digital saturation in gain compensation mode. The other one is to ensure the overall SNR is limited only by analog noise and unaffected by quantization noise. Gain correction should be used when external components (LNA or DSA) does not need to be controlled. Compensation should be used for external LNA or DSA control. Gain control is specified as one of the following: 'AutomaticGainCorrection' - Automatically adjust interface gain 'ManualGainCorrection' - Manually adjust interface gain 'AutomaticGainCompensation' - Automatically adjust interface gain and external gain element 'ManualGainCompensation' - Manually adjust interface gain and external gain element</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('DigitalGainControlModeChannel1')" class="collapsible-property collapsible-property-DigitalGainControlModeChannel1">DigitalGainControlModeChannel1 <span style="text-align:right" class="plus-DigitalGainControlModeChannel1">+</span></button>
  <div class="content content-DigitalGainControlModeChannel1" style="display: none;">
    <p style="padding: 0px;">The digital gain control has two major purposes, one for gain correction which is to correct the small step size inaccuracy in analog front-end attenuation and the other for gain compensation which is to compensate for the entire analog front-end attenuation. The digital gain block is controlled by the Rx gain table. Different digital gain will be applied when configured in gain correction or gain compensation mode. The Rx gain table has a unique front-end attenuator setting, with a corresponding amount of digital gain, programmed at each index of the table. In the end of the Rx data path, the interface gain could be further applied by using a “Slicer” block for 2 major purposes. One is to avoid digital saturation in gain compensation mode. The other one is to ensure the overall SNR is limited only by analog noise and unaffected by quantization noise. Gain correction should be used when external components (LNA or DSA) does not need to be controlled. Compensation should be used for external LNA or DSA control. Gain control is specified as one of the following: 'AutomaticGainCorrection' - Automatically adjust interface gain 'ManualGainCorrection' - Manually adjust interface gain 'AutomaticGainCompensation' - Automatically adjust interface gain and external gain element 'ManualGainCompensation' - Manually adjust interface gain and external gain element</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel0')" class="collapsible-property collapsible-property-AttenuationChannel0">AttenuationChannel0 <span style="text-align:right" class="plus-AttenuationChannel0">+</span></button>
  <div class="content content-AttenuationChannel0" style="display: none;">
    <p style="padding: 0px;">Must be greater than 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AttenuationChannel1')" class="collapsible-property collapsible-property-AttenuationChannel1">AttenuationChannel1 <span style="text-align:right" class="plus-AttenuationChannel1">+</span></button>
  <div class="content content-AttenuationChannel1" style="display: none;">
    <p style="padding: 0px;">Must be greater than 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('ENSMPortModeChannel0')" class="collapsible-property collapsible-property-ENSMPortModeChannel0">ENSMPortModeChannel0 <span style="text-align:right" class="plus-ENSMPortModeChannel0">+</span></button>
  <div class="content content-ENSMPortModeChannel0" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('ENSMPortModeChannel1')" class="collapsible-property collapsible-property-ENSMPortModeChannel1">ENSMPortModeChannel1 <span style="text-align:right" class="plus-ENSMPortModeChannel1">+</span></button>
  <div class="content content-ENSMPortModeChannel1" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainControllerSourceChannel0')" class="collapsible-property collapsible-property-GainControllerSourceChannel0">GainControllerSourceChannel0 <span style="text-align:right" class="plus-GainControllerSourceChannel0">+</span></button>
  <div class="content content-GainControllerSourceChannel0" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin' 'automatic'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('GainControllerSourceChannel1')" class="collapsible-property collapsible-property-GainControllerSourceChannel1">GainControllerSourceChannel1 <span style="text-align:right" class="plus-GainControllerSourceChannel1">+</span></button>
  <div class="content content-GainControllerSourceChannel1" style="display: none;">
    <p style="padding: 0px;">specified as one of the following: 'spi' 'pin' 'automatic'</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel0')" class="collapsible-property collapsible-property-PowerdownChannel0">PowerdownChannel0 <span style="text-align:right" class="plus-PowerdownChannel0">+</span></button>
  <div class="content content-PowerdownChannel0" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('PowerdownChannel1')" class="collapsible-property collapsible-property-PowerdownChannel1">PowerdownChannel1 <span style="text-align:right" class="plus-PowerdownChannel1">+</span></button>
  <div class="content content-PowerdownChannel1" style="display: none;">
    <p style="padding: 0px;"></p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AGCTrackingChannel0')" class="collapsible-property collapsible-property-AGCTrackingChannel0">AGCTrackingChannel0 <span style="text-align:right" class="plus-AGCTrackingChannel0">+</span></button>
  <div class="content content-AGCTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">AGC on the fly tracking calibration for Channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('AGCTrackingChannel1')" class="collapsible-property collapsible-property-AGCTrackingChannel1">AGCTrackingChannel1 <span style="text-align:right" class="plus-AGCTrackingChannel1">+</span></button>
  <div class="content content-AGCTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">AGC on the fly tracking calibration for Channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('BBDCRejectionTrackingChannel0')" class="collapsible-property collapsible-property-BBDCRejectionTrackingChannel0">BBDCRejectionTrackingChannel0 <span style="text-align:right" class="plus-BBDCRejectionTrackingChannel0">+</span></button>
  <div class="content content-BBDCRejectionTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Baseband DC rejection on the fly tracking calibration for Channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('BBDCRejectionTrackingChannel1')" class="collapsible-property collapsible-property-BBDCRejectionTrackingChannel1">BBDCRejectionTrackingChannel1 <span style="text-align:right" class="plus-BBDCRejectionTrackingChannel1">+</span></button>
  <div class="content content-BBDCRejectionTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Baseband DC rejection on the fly tracking calibration for Channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('HDTrackingChannel0')" class="collapsible-property collapsible-property-HDTrackingChannel0">HDTrackingChannel0 <span style="text-align:right" class="plus-HDTrackingChannel0">+</span></button>
  <div class="content content-HDTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Harmonic Distortion on the fly tracking calibration for Channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('HDTrackingChannel1')" class="collapsible-property collapsible-property-HDTrackingChannel1">HDTrackingChannel1 <span style="text-align:right" class="plus-HDTrackingChannel1">+</span></button>
  <div class="content content-HDTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Harmonic Distortion on the fly tracking calibration for Channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureFICTrackingChannel0')" class="collapsible-property collapsible-property-QuadratureFICTrackingChannel0">QuadratureFICTrackingChannel0 <span style="text-align:right" class="plus-QuadratureFICTrackingChannel0">+</span></button>
  <div class="content content-QuadratureFICTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction Narrowband FIC on the fly tracking calibration for channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureFICTrackingChannel1')" class="collapsible-property collapsible-property-QuadratureFICTrackingChannel1">QuadratureFICTrackingChannel1 <span style="text-align:right" class="plus-QuadratureFICTrackingChannel1">+</span></button>
  <div class="content content-QuadratureFICTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction Narrowband FIC on the fly tracking calibration for channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureWidebandPolyTrackingChannel0')" class="collapsible-property collapsible-property-QuadratureWidebandPolyTrackingChannel0">QuadratureWidebandPolyTrackingChannel0 <span style="text-align:right" class="plus-QuadratureWidebandPolyTrackingChannel0">+</span></button>
  <div class="content content-QuadratureWidebandPolyTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction Wideband Poly on the fly tracking calibration for channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('QuadratureWidebandPolyTrackingChannel1')" class="collapsible-property collapsible-property-QuadratureWidebandPolyTrackingChannel1">QuadratureWidebandPolyTrackingChannel1 <span style="text-align:right" class="plus-QuadratureWidebandPolyTrackingChannel1">+</span></button>
  <div class="content content-QuadratureWidebandPolyTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">Quadrature Error Correction Wideband Poly on the fly tracking calibration for channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFDCTrackingChannel0')" class="collapsible-property collapsible-property-RFDCTrackingChannel0">RFDCTrackingChannel0 <span style="text-align:right" class="plus-RFDCTrackingChannel0">+</span></button>
  <div class="content content-RFDCTrackingChannel0" style="display: none;">
    <p style="padding: 0px;">RF DC on the fly tracking calibration for channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RFDCTrackingChannel1')" class="collapsible-property collapsible-property-RFDCTrackingChannel1">RFDCTrackingChannel1 <span style="text-align:right" class="plus-RFDCTrackingChannel1">+</span></button>
  <div class="content content-RFDCTrackingChannel1" style="display: none;">
    <p style="padding: 0px;">RF DC on the fly tracking calibration for channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RSSITrackingChannel0')" class="collapsible-property collapsible-property-RSSITrackingChannel0">RSSITrackingChannel0 <span style="text-align:right" class="plus-RSSITrackingChannel0">+</span></button>
  <div class="content content-RSSITrackingChannel0" style="display: none;">
    <p style="padding: 0px;">RSSI on the fly tracking calibration for channel 0</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RSSITrackingChannel1')" class="collapsible-property collapsible-property-RSSITrackingChannel1">RSSITrackingChannel1 <span style="text-align:right" class="plus-RSSITrackingChannel1">+</span></button>
  <div class="content content-RSSITrackingChannel1" style="display: none;">
    <p style="padding: 0px;">RSSI on the fly tracking calibration for channel 1</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RSSIChannel0')" class="collapsible-property collapsible-property-RSSIChannel0">RSSIChannel0 <span style="text-align:right" class="plus-RSSIChannel0">+</span></button>
  <div class="content content-RSSIChannel0" style="display: none;">
    <p style="padding: 0px;">Received signal strength indicator. This valid is only valid once the object has been stepped and MATLAB connects to hardware</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('RSSIChannel1')" class="collapsible-property collapsible-property-RSSIChannel1">RSSIChannel1 <span style="text-align:right" class="plus-RSSIChannel1">+</span></button>
  <div class="content content-RSSIChannel1" style="display: none;">
    <p style="padding: 0px;">Received signal strength indicator. This valid is only valid once the object has been stepped and MATLAB connects to hardware</p>
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
    <p style="padding: 0px;">Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9002.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>
<div class="property">
  <button type="button" onclick="collapse('enIO')" class="collapsible-property collapsible-property-enIO">enIO <span style="text-align:right" class="plus-enIO">+</span></button>
  <div class="content content-enIO" style="display: none;">
    <p style="padding: 0px;">If true, connects to libIIO device during simulationHelp for adi.ADRV9002.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE</p>
  </div>
  </div>

<div class="sysobj_desc_title">Example Usage</div>

```

%% Rx set up
rx = adi.adi.ADRV9002.Rx.Rx('uri','ip:analog.local');
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