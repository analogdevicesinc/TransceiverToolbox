<header>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</header>



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

<div class="sysobj_desc_title">Usage</div>

<div class="sysobj_desc_txt">
Creation
</div>

```matlab
dev = adi.ADRV9002.Rx
dev = adi.ADRV9002.Rx(Name, Value)
```

<div class="sysobj_desc_title">Properties</div>

<div class="sysobj_desc_txt">
<span>
Unless otherwise indicated, properties are nontunable, which means you cannot change their values after calling the object. Objects lock when you call them, and the release function unlocks them.
<br><br>
If a property is tunable, you can change its value at any time.
<br><br>
For more information on changing property values, see <a href="https://www.mathworks.com/help/matlab/matlab_prog/system-design-in-matlab-using-system-objects.html">System Design in MATLAB Using System Objects.</a>
</span>
</div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ENSMModeChannel0" aria-expanded="false" aria-controls="ENSMModeChannel0">
      <span>ENSMModeChannel0</span>
      </button>
    </h2>
    <div id="ENSMModeChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'calibrated' 'primed' 'rf_enabled'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ENSMModeChannel1" aria-expanded="false" aria-controls="ENSMModeChannel1">
      <span>ENSMModeChannel1</span>
      </button>
    </h2>
    <div id="ENSMModeChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'calibrated' 'primed' 'rf_enabled'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#InterfaceGainChannel0" aria-expanded="false" aria-controls="InterfaceGainChannel0">
      <span>InterfaceGainChannel0</span>
      </button>
    </h2>
    <div id="InterfaceGainChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        This is the final gain in the digital path with possible values: -36:6:18 This gain should be selected based on primary signal bandwidth. For narrowband applications higher levels of interface gain should be used (0:18) to allow signal level and analog noise to dominate. For wideband applications this gain should be reduced or disabled since quantization noise is minimal.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#InterfaceGainChannel1" aria-expanded="false" aria-controls="InterfaceGainChannel1">
      <span>InterfaceGainChannel1</span>
      </button>
    </h2>
    <div id="InterfaceGainChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        This is the final gain in the digital path with possible values: -36:6:18 This gain should be selected based on primary signal bandwidth. For narrowband applications higher levels of interface gain should be used (0:18) to allow signal level and analog noise to dominate. For wideband applications this gain should be reduced or disabled since quantization noise is minimal.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DigitalGainControlModeChannel0" aria-expanded="false" aria-controls="DigitalGainControlModeChannel0">
      <span>DigitalGainControlModeChannel0</span>
      </button>
    </h2>
    <div id="DigitalGainControlModeChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        The digital gain control has two major purposes, one for gain correction which is to correct the small step size inaccuracy in analog front-end attenuation and the other for gain compensation which is to compensate for the entire analog front-end attenuation. The digital gain block is controlled by the Rx gain table. Different digital gain will be applied when configured in gain correction or gain compensation mode. The Rx gain table has a unique front-end attenuator setting, with a corresponding amount of digital gain, programmed at each index of the table. In the end of the Rx data path, the interface gain could be further applied by using a “Slicer” block for 2 major purposes. One is to avoid digital saturation in gain compensation mode. The other one is to ensure the overall SNR is limited only by analog noise and unaffected by quantization noise. Gain correction should be used when external components (LNA or DSA) does not need to be controlled. Compensation should be used for external LNA or DSA control. Gain control is specified as one of the following: 'AutomaticGainCorrection' - Automatically adjust interface gain 'ManualGainCorrection' - Manually adjust interface gain 'AutomaticGainCompensation' - Automatically adjust interface gain and external gain element 'ManualGainCompensation' - Manually adjust interface gain and external gain element
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DigitalGainControlModeChannel1" aria-expanded="false" aria-controls="DigitalGainControlModeChannel1">
      <span>DigitalGainControlModeChannel1</span>
      </button>
    </h2>
    <div id="DigitalGainControlModeChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        The digital gain control has two major purposes, one for gain correction which is to correct the small step size inaccuracy in analog front-end attenuation and the other for gain compensation which is to compensate for the entire analog front-end attenuation. The digital gain block is controlled by the Rx gain table. Different digital gain will be applied when configured in gain correction or gain compensation mode. The Rx gain table has a unique front-end attenuator setting, with a corresponding amount of digital gain, programmed at each index of the table. In the end of the Rx data path, the interface gain could be further applied by using a “Slicer” block for 2 major purposes. One is to avoid digital saturation in gain compensation mode. The other one is to ensure the overall SNR is limited only by analog noise and unaffected by quantization noise. Gain correction should be used when external components (LNA or DSA) does not need to be controlled. Compensation should be used for external LNA or DSA control. Gain control is specified as one of the following: 'AutomaticGainCorrection' - Automatically adjust interface gain 'ManualGainCorrection' - Manually adjust interface gain 'AutomaticGainCompensation' - Automatically adjust interface gain and external gain element 'ManualGainCompensation' - Manually adjust interface gain and external gain element
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AttenuationChannel0" aria-expanded="false" aria-controls="AttenuationChannel0">
      <span>AttenuationChannel0</span>
      </button>
    </h2>
    <div id="AttenuationChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Must be greater than 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AttenuationChannel1" aria-expanded="false" aria-controls="AttenuationChannel1">
      <span>AttenuationChannel1</span>
      </button>
    </h2>
    <div id="AttenuationChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Must be greater than 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ENSMPortModeChannel0" aria-expanded="false" aria-controls="ENSMPortModeChannel0">
      <span>ENSMPortModeChannel0</span>
      </button>
    </h2>
    <div id="ENSMPortModeChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'spi' 'pin'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ENSMPortModeChannel1" aria-expanded="false" aria-controls="ENSMPortModeChannel1">
      <span>ENSMPortModeChannel1</span>
      </button>
    </h2>
    <div id="ENSMPortModeChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'spi' 'pin'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainControllerSourceChannel0" aria-expanded="false" aria-controls="GainControllerSourceChannel0">
      <span>GainControllerSourceChannel0</span>
      </button>
    </h2>
    <div id="GainControllerSourceChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'spi' 'pin' 'automatic'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainControllerSourceChannel1" aria-expanded="false" aria-controls="GainControllerSourceChannel1">
      <span>GainControllerSourceChannel1</span>
      </button>
    </h2>
    <div id="GainControllerSourceChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'spi' 'pin' 'automatic'
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#PowerdownChannel0" aria-expanded="false" aria-controls="PowerdownChannel0">
      <span>PowerdownChannel0</span>
      </button>
    </h2>
    <div id="PowerdownChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#PowerdownChannel1" aria-expanded="false" aria-controls="PowerdownChannel1">
      <span>PowerdownChannel1</span>
      </button>
    </h2>
    <div id="PowerdownChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AGCTrackingChannel0" aria-expanded="false" aria-controls="AGCTrackingChannel0">
      <span>AGCTrackingChannel0</span>
      </button>
    </h2>
    <div id="AGCTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        AGC on the fly tracking calibration for Channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AGCTrackingChannel1" aria-expanded="false" aria-controls="AGCTrackingChannel1">
      <span>AGCTrackingChannel1</span>
      </button>
    </h2>
    <div id="AGCTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        AGC on the fly tracking calibration for Channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#BBDCRejectionTrackingChannel0" aria-expanded="false" aria-controls="BBDCRejectionTrackingChannel0">
      <span>BBDCRejectionTrackingChannel0</span>
      </button>
    </h2>
    <div id="BBDCRejectionTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Baseband DC rejection on the fly tracking calibration for Channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#BBDCRejectionTrackingChannel1" aria-expanded="false" aria-controls="BBDCRejectionTrackingChannel1">
      <span>BBDCRejectionTrackingChannel1</span>
      </button>
    </h2>
    <div id="BBDCRejectionTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Baseband DC rejection on the fly tracking calibration for Channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#HDTrackingChannel0" aria-expanded="false" aria-controls="HDTrackingChannel0">
      <span>HDTrackingChannel0</span>
      </button>
    </h2>
    <div id="HDTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Harmonic Distortion on the fly tracking calibration for Channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#HDTrackingChannel1" aria-expanded="false" aria-controls="HDTrackingChannel1">
      <span>HDTrackingChannel1</span>
      </button>
    </h2>
    <div id="HDTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Harmonic Distortion on the fly tracking calibration for Channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#QuadratureFICTrackingChannel0" aria-expanded="false" aria-controls="QuadratureFICTrackingChannel0">
      <span>QuadratureFICTrackingChannel0</span>
      </button>
    </h2>
    <div id="QuadratureFICTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Quadrature Error Correction Narrowband FIC on the fly tracking calibration for channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#QuadratureFICTrackingChannel1" aria-expanded="false" aria-controls="QuadratureFICTrackingChannel1">
      <span>QuadratureFICTrackingChannel1</span>
      </button>
    </h2>
    <div id="QuadratureFICTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Quadrature Error Correction Narrowband FIC on the fly tracking calibration for channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#QuadratureWidebandPolyTrackingChannel0" aria-expanded="false" aria-controls="QuadratureWidebandPolyTrackingChannel0">
      <span>QuadratureWidebandPolyTrackingChannel0</span>
      </button>
    </h2>
    <div id="QuadratureWidebandPolyTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Quadrature Error Correction Wideband Poly on the fly tracking calibration for channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#QuadratureWidebandPolyTrackingChannel1" aria-expanded="false" aria-controls="QuadratureWidebandPolyTrackingChannel1">
      <span>QuadratureWidebandPolyTrackingChannel1</span>
      </button>
    </h2>
    <div id="QuadratureWidebandPolyTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Quadrature Error Correction Wideband Poly on the fly tracking calibration for channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RFDCTrackingChannel0" aria-expanded="false" aria-controls="RFDCTrackingChannel0">
      <span>RFDCTrackingChannel0</span>
      </button>
    </h2>
    <div id="RFDCTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF DC on the fly tracking calibration for channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RFDCTrackingChannel1" aria-expanded="false" aria-controls="RFDCTrackingChannel1">
      <span>RFDCTrackingChannel1</span>
      </button>
    </h2>
    <div id="RFDCTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF DC on the fly tracking calibration for channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RSSITrackingChannel0" aria-expanded="false" aria-controls="RSSITrackingChannel0">
      <span>RSSITrackingChannel0</span>
      </button>
    </h2>
    <div id="RSSITrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RSSI on the fly tracking calibration for channel 0
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RSSITrackingChannel1" aria-expanded="false" aria-controls="RSSITrackingChannel1">
      <span>RSSITrackingChannel1</span>
      </button>
    </h2>
    <div id="RSSITrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RSSI on the fly tracking calibration for channel 1
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RSSIChannel0" aria-expanded="false" aria-controls="RSSIChannel0">
      <span>RSSIChannel0</span>
      </button>
    </h2>
    <div id="RSSIChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Received signal strength indicator. This valid is only valid once the object has been stepped and MATLAB connects to hardware
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RSSIChannel1" aria-expanded="false" aria-controls="RSSIChannel1">
      <span>RSSIChannel1</span>
      </button>
    </h2>
    <div id="RSSIChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Received signal strength indicator. This valid is only valid once the object has been stepped and MATLAB connects to hardware
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#SamplesPerFrame" aria-expanded="false" aria-controls="SamplesPerFrame">
      <span>SamplesPerFrame</span>
      </button>
    </h2>
    <div id="SamplesPerFrame" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Number of samples per frame, specified as an even positive integer from 2 to 16,777,216. Using values less than 3660 can yield poor performance.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableCustomProfile" aria-expanded="false" aria-controls="EnableCustomProfile">
      <span>EnableCustomProfile</span>
      </button>
    </h2>
    <div id="EnableCustomProfile" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Enable use of custom Profile file to set SamplingRate, RFBandwidth, and other features of transceiver
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CustomProfileFileName" aria-expanded="false" aria-controls="CustomProfileFileName">
      <span>CustomProfileFileName</span>
      </button>
    </h2>
    <div id="CustomProfileFileName" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Path to custom Profile file created from profile wizard
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CustomStreamFileName" aria-expanded="false" aria-controls="CustomStreamFileName">
      <span>CustomStreamFileName</span>
      </button>
    </h2>
    <div id="CustomStreamFileName" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Path to custom stream file created from profile wizard
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#SamplingRate" aria-expanded="false" aria-controls="SamplingRate">
      <span>SamplingRate</span>
      </button>
    </h2>
    <div id="SamplingRate" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Baseband sampling rate in Hz, specified as a scalar in samples per second. This is a read-only property
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CenterFrequencyChannel0" aria-expanded="false" aria-controls="CenterFrequencyChannel0">
      <span>CenterFrequencyChannel0</span>
      </button>
    </h2>
    <div id="CenterFrequencyChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CenterFrequencyChannel1" aria-expanded="false" aria-controls="CenterFrequencyChannel1">
      <span>CenterFrequencyChannel1</span>
      </button>
    </h2>
    <div id="CenterFrequencyChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#NCOCorrectionFrequencyChannel0" aria-expanded="false" aria-controls="NCOCorrectionFrequencyChannel0">
      <span>NCOCorrectionFrequencyChannel0</span>
      </button>
    </h2>
    <div id="NCOCorrectionFrequencyChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        NCO correction frequency, specified in Hz as a scalar. The default is 0. This property is tunable.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#NCOCorrectionFrequencyChannel1" aria-expanded="false" aria-controls="NCOCorrectionFrequencyChannel1">
      <span>NCOCorrectionFrequencyChannel1</span>
      </button>
    </h2>
    <div id="NCOCorrectionFrequencyChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        NCO correction frequency, specified in Hz as a scalar. The default is 0. This property is tunable.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnabledChannels" aria-expanded="false" aria-controls="EnabledChannels">
      <span>EnabledChannels</span>
      </button>
    </h2>
    <div id="EnabledChannels" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Indexs of channels to be enabled. Input should be a [1xN] vector with the indexes of channels to be enabled. Order is irrelevant
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#uri" aria-expanded="false" aria-controls="uri">
      <span>uri</span>
      </button>
    </h2>
    <div id="uri" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9002.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#enIO" aria-expanded="false" aria-controls="enIO">
      <span>enIO</span>
      </button>
    </h2>
    <div id="enIO" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        If true, connects to libIIO device during simulationHelp for adi.ADRV9002.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>