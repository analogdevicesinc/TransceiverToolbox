<header>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</header>



<!-- <div class="sysobj_h1">adi.ADRV9371.Tx</div> -->

<!-- <div class="sysobj_top_desc">
Receive data from Analog Devices AD9361 transceiver
</div> -->

<!-- <div class="sysobj_desc_title">Description</div> -->

<div class="sysobj_desc_txt">
<span>
    The adi.ADRV9371.Tx System object is a signal sink that can send<br>    complex data to the ADRV9371.<br> <br>    tx = adi.AD9371.Tx;<br>    tx = adi.AD9371.Tx('uri','ip:192.168.2.1');<br> <br>    <a href="https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/EVAL-ADRV9371.html">Product Page</a>    <br> <br>
</span>

</div>

<div class="sysobj_desc_title">Usage</div>

<div class="sysobj_desc_txt">
Creation
</div>

```matlab
dev = adi.ADRV9371.Tx
dev = adi.ADRV9371.Tx(Name, Value)
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
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#AttenuationChannel0" aria-expanded="false" aria-controls="AttenuationChannel0">
      <span>AttenuationChannel0</span>
      </button>
    </h2>
    <div id="AttenuationChannel0" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.Help for adi.ADRV9371.Tx/AttenuationChannel0 is inherited from superclass ADI.AD9371.TX
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
        Attentuation specified as a scalar from -89.75 to 0 dB with a resolution of 0.25 dB.Help for adi.ADRV9371.Tx/AttenuationChannel1 is inherited from superclass ADI.AD9371.TX
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
        Hostname or IP address of remote libIIO deviceHelp for adi.ADRV9371.Tx/uri is inherited from superclass MATLABSHARED.LIBIIO.BASE
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
        If true, connects to libIIO device during simulationHelp for adi.ADRV9371.Tx/enIO is inherited from superclass MATLABSHARED.LIBIIO.BASE
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DataSource" aria-expanded="false" aria-controls="DataSource">
      <span>DataSource</span>
      </button>
    </h2>
    <div id="DataSource" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Data source, specified as one of the following: 'DMA' — Specify the host as the source of the data. 'DDS' — Specify the DDS on the radio hardware as the source of the data. In this case, each channel has two additive tones.Help for adi.ADRV9371.Tx/DataSource is inherited from superclass ADI.COMMON.DDS
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DDSFrequencies" aria-expanded="false" aria-controls="DDSFrequencies">
      <span>DDSFrequencies</span>
      </button>
    </h2>
    <div id="DDSFrequencies" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Frequencies values in Hz of the DDS tone generators. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9371.Tx/DDSFrequencies is inherited from superclass ADI.COMMON.DDS
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DDSScales" aria-expanded="false" aria-controls="DDSScales">
      <span>DDSScales</span>
      </button>
    </h2>
    <div id="DDSScales" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Scale of DDS tones in range [0,1]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9371.Tx/DDSScales is inherited from superclass ADI.COMMON.DDS
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#DDSPhases" aria-expanded="false" aria-controls="DDSPhases">
      <span>DDSPhases</span>
      </button>
    </h2>
    <div id="DDSPhases" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Phases of DDS tones in range [0,360000]. For complex data devices the input is a [2xN] matrix where N is the available channels on the board. For complex data devices this is at most max(EnabledChannels)*2. For non-complex data devices this is at most max(EnabledChannels). If N < this upper limit, other DDSs are not set.Help for adi.ADRV9371.Tx/DDSPhases is inherited from superclass ADI.COMMON.DDS
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>
<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="sysobj_prop accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#EnableCyclicBuffers" aria-expanded="false" aria-controls="EnableCyclicBuffers">
      <span>EnableCyclicBuffers</span>
      </button>
    </h2>
    <div id="EnableCyclicBuffers" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        Enable Cyclic Buffers, configures transmit buffers to be cyclic, which makes them continuously repeatHelp for adi.ADRV9371.Tx/EnableCyclicBuffers is inherited from superclass ADI.COMMON.DDS
      </div>
    </div>
  </div>
  </div>
  <div class='gap'></div>