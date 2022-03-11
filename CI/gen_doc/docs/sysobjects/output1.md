<header>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</header>



<div class="sysobj_h1">adi.Pluto.Rx</div>

<div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div>

<div class="sysobj_desc_title">Description</div>

<div class="sysobj_desc_txt">
The comm.SDRRxPluto System object™ is a signal source that receives data from an Analog Devices® ADALM-PLUTO radio. This connection enables you to simulate and develop various software-defined radio applications.

The following diagram shows the interaction between MATLAB®, the comm.SDRRxPluto System object, and the radio hardware.

</div>

<div class="sysobj_desc_title">Creation</div>

Syntax


<div class="sysobj_desc_title">Properties</div>

<div class="sysobj_desc_txt">
Unless otherwise indicated, properties are nontunable, which means you cannot change their values after calling the object. Objects lock when you call them, and the release function unlocks them.

If a property is tunable, you can change its value at any time.

For more information on changing property values, see System Design in MATLAB Using System Objects.

</div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CenterFrequency" aria-expanded="false" aria-controls="CenterFrequency">
      <span>CenterFrequency</span>
      </button>
    </h2>
    <div id="CenterFrequency" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF center frequency, specified in Hz as a scalar. The default is 2.4e9. This property is tunable.Help for adi.Pluto.Rx/CenterFrequency is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#SamplingRate" aria-expanded="false" aria-controls="SamplingRate">
      <span>SamplingRate</span>
      </button>
    </h2>
    <div id="SamplingRate" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Baseband sampling rate in Hz, specified as a scalar from 65105 to 61.44e6 samples per second.Help for adi.Pluto.Rx/SamplingRate is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RFBandwidth" aria-expanded="false" aria-controls="RFBandwidth">
      <span>RFBandwidth</span>
      </button>
    </h2>
    <div id="RFBandwidth" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        RF Bandwidth of front-end analog filter in Hz, specified as a scalar from 200 kHz to 56 MHz.Help for adi.Pluto.Rx/RFBandwidth is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainControlModeChannel0" aria-expanded="false" aria-controls="GainControlModeChannel0">
      <span>GainControlModeChannel0</span>
      </button>
    </h2>
    <div id="GainControlModeChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC modeHelp for adi.Pluto.Rx/GainControlModeChannel0 is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainChannel0" aria-expanded="false" aria-controls="GainChannel0">
      <span>GainChannel0</span>
      </button>
    </h2>
    <div id="GainChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Channel 0 gain, specified as a scalar from -3 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.Pluto.Rx/GainChannel0 is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainControlModeChannel1" aria-expanded="false" aria-controls="GainControlModeChannel1">
      <span>GainControlModeChannel1</span>
      </button>
    </h2>
    <div id="GainControlModeChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        specified as one of the following: 'slow_attack' — For signals with slowly changing power levels 'fast_attack' — For signals with rapidly changing power levels 'manual' — For setting the gain manually with the Gain property 'hybrid' — For configuring hybrid AGC modeHelp for adi.Pluto.Rx/GainControlModeChannel1 is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#GainChannel1" aria-expanded="false" aria-controls="GainChannel1">
      <span>GainChannel1</span>
      </button>
    </h2>
    <div id="GainChannel1" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Channel 1 gain, specified as a scalar from -3 dB to 71 dB. The acceptable minimum and maximum gain setting depends on the center frequency.Help for adi.Pluto.Rx/GainChannel1 is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#LoopbackMode" aria-expanded="false" aria-controls="LoopbackMode">
      <span>LoopbackMode</span>
      </button>
    </h2>
    <div id="LoopbackMode" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to set digital loopback mode, specified as 0, 1 or 2. Allows either to digitally loopback TX data into the RX path or vice versa. Value  | Mode ---------------------------  0 |  Disable  1 |  Digital TX -> Digital RX  2 |  RF RX -> RF TX Help for adi.Pluto.Rx/LoopbackMode is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableQuadratureTracking" aria-expanded="false" aria-controls="EnableQuadratureTracking">
      <span>EnableQuadratureTracking</span>
      </button>
    </h2>
    <div id="EnableQuadratureTracking" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to enable quadrature tracking, specified as true or false. When this property is true, IQ imbalance compensation is applied to the input signal.Help for adi.Pluto.Rx/EnableQuadratureTracking is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableRFDCTracking" aria-expanded="false" aria-controls="EnableRFDCTracking">
      <span>EnableRFDCTracking</span>
      </button>
    </h2>
    <div id="EnableRFDCTracking" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to enable RF DC tracking, specified as true or false. When this property is true, an RF DC blocking filter is applied to the input signal.Help for adi.Pluto.Rx/EnableRFDCTracking is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableBasebandDCTracking" aria-expanded="false" aria-controls="EnableBasebandDCTracking">
      <span>EnableBasebandDCTracking</span>
      </button>
    </h2>
    <div id="EnableBasebandDCTracking" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Option to enable baseband DC tracking, specified as true or false. When this property is true, a baseband DC blocking filter is applied to the input signal.Help for adi.Pluto.Rx/EnableBasebandDCTracking is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#RFPortSelect" aria-expanded="false" aria-controls="RFPortSelect">
      <span>RFPortSelect</span>
      </button>
    </h2>
    <div id="RFPortSelect" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        'A_BALANCED' 'B_BALANCED' 'C_BALANCED' 'A_N' 'A_P' 'B_N' 'B_P' 'C_N' 'C_P' 'TX_MONITOR1' 'TX_MONITOR2' 'TX_MONITOR1_2'Help for adi.Pluto.Rx/RFPortSelect is inherited from superclass ADI.AD9361.RX
      </div>
    </div>
  </div>
  </div>

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

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableCustomFilter" aria-expanded="false" aria-controls="EnableCustomFilter">
      <span>EnableCustomFilter</span>
      </button>
    </h2>
    <div id="EnableCustomFilter" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Enable use of custom filter file to set SamplingRate, RFBandwidth, and FIR in datapaths
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#CustomFilterFileName" aria-expanded="false" aria-controls="CustomFilterFileName">
      <span>CustomFilterFileName</span>
      </button>
    </h2>
    <div id="CustomFilterFileName" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Path to custom filter file created from filter wizard
      </div>
    </div>
  </div>
  </div>

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

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#uri" aria-expanded="false" aria-controls="uri">
      <span>uri</span>
      </button>
    </h2>
    <div id="uri" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Hostname or IP address of remote libIIO deviceHelp for adi.Pluto.Rx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>

<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#enIO" aria-expanded="false" aria-controls="enIO">
      <span>enIO</span>
      </button>
    </h2>
    <div id="enIO" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        If true, connects to libIIO device during simulationHelp for adi.Pluto.Rx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>


