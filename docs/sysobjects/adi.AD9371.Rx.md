<header>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</header>



<div class="sysobj_h1">adi.AD9371.Rx</div>

<div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div>

<div class="sysobj_desc_title">Description</div>

<div class="sysobj_desc_txt">
<span>
    The adi.AD9371.Rx System object is a signal source that can receive<br>    complex data from the AD9371.<br> <br>    rx = adi.AD9371.Rx;<br>    rx = adi.AD9371.Rx('uri','192.168.2.1');<br> <br>    <a href="http://www.analog.com/media/en/technical-documentation/data-sheets/AD9371.pdf">AD9371 Datasheet</a><br>    Documentation for adi.AD9371.Rx<br>       doc adi.AD9371.Rx<br>
</span>

</div>

<div class="sysobj_desc_title">Usage</div>

<div class="sysobj_desc_txt">
Creation
</div>

```matlab
dev = adi.AD9371.Rx
dev = adi.AD9371.Rx(Name, Value)
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
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainControlMode" aria-expanded="false" aria-controls="GainControlMode">
      <span>GainControlMode</span>
      </button>
    </h2>
    <div id="GainControlMode" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC mode
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainChannel0" aria-expanded="false" aria-controls="GainChannel0">
      <span>GainChannel0</span>
      </button>
    </h2>
    <div id="GainChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Channel 0 gain, specified as a scalar from -4 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainChannel1" aria-expanded="false" aria-controls="GainChannel1">
      <span>GainChannel1</span>
      </button>
    </h2>
    <div id="GainChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Channel 1 gain, specified as a scalar from -4 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#LoopbackMode" aria-expanded="false" aria-controls="LoopbackMode">
      <span>LoopbackMode</span>
      </button>
    </h2>
    <div id="LoopbackMode" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to set digital loopback mode, specified as 0 or 1. Allows digital loopback of TX data into the RX path. Value  | Mode ---------------------------  0 |  Disable  1 |  Enable
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableQuadratureTrackingChannel0" aria-expanded="false" aria-controls="EnableQuadratureTrackingChannel0">
      <span>EnableQuadratureTrackingChannel0</span>
      </button>
    </h2>
    <div id="EnableQuadratureTrackingChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableQuadratureTrackingChannel1" aria-expanded="false" aria-controls="EnableQuadratureTrackingChannel1">
      <span>EnableQuadratureTrackingChannel1</span>
      </button>
    </h2>
    <div id="EnableQuadratureTrackingChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.
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
        Enable use of custom Profile file to set SamplingRate, RFBandwidth, and FIR in datapaths
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
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CenterFrequency" aria-expanded="false" aria-controls="CenterFrequency">
      <span>CenterFrequency</span>
      </button>
    </h2>
    <div id="CenterFrequency" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
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
        Hostname or IP address of remote libIIO deviceHelp for adi.AD9371.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE
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
        If true, connects to libIIO device during simulationHelp for adi.AD9371.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>