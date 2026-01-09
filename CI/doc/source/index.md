<!-- Hide header and click button -->
<style>
  .md-typeset h1,
  .md-content__button {
    display: none;
  }
</style>

<br>
<center>
<div style="width:70%;">
<div id="indexlogo_dark">
<img src="_static/logos/logo_black.png" alt="PyADI-IIO Logo" />
</div>
<div id="indexlogo_light">
<img src="_static/logos/logo_white.png" alt="PyADI-IIO Logo" />
</div>
</div>
</center>

<!-- # Analog Devices, Inc. Transceiver Toolbox -->


ADI maintains a set of tools to model, interface, and target with ADI transceiver devices within MATLAB and Simulink. These are combined into single Toolbox which contains a set of Board Support Packages (BSP). The list of supported boards is provided below.

The following have device-specific implementations in MATLAB and Simulink. If a device has an IIO driver, MATLAB support is possible, but a device-specific MATLAB or Simulink interface may not exist yet.


| Evaluation Card | FPGA Board | Streaming Support | Targeting | Variants and Minimum Supported Release |
| --------- | --------- | --------- | --------- | --------- |
| Pluto |  | Yes | Yes | ADI (2018b) MathWorks (2017a) |
| FMComms2/3/4 | Zedboard | Yes | Yes | ADI (2018b) MathWorks (2014b) |
| | ZC702 | Yes | Yes | ADI (2018b) MathWorks (2014b) |
| | ZC706 | Yes | Yes | ADI (2018b) MathWorks (2014b) |
| | ZCU102 | Yes | Yes | ADI (2018b) MathWorks (2014b) |
| FMComms5 | ZC702 | Yes | Yes | ADI (2018b) MathWorks (2019a) |
| | ZC706 | Yes | Yes | ADI (2018b) MathWorks (2019a) |
| ARRADIO | Arrow SoCKit | Yes | No | ADI (2018b) |
| ADRV9361-Z7035 |  | Yes | Yes | ADI (2018b) MathWorks (2015b) |
| ADRV9364-Z7020 |  | Yes | Yes | ADI (2018b) |
| ADRV9371/5 | ZC706 | Yes | Yes | ADI (2018b) |
| | ZCU102 | Yes | Yes | ADI (2018b) |
| | ZYNQ3 | Yes | No | ADI (2018b) |
| ADRV9002 | ZCU102 | Yes | Yes | ADI (2020a) |
| Jupiter |  | Yes | No | ADI (2020a) |
| ADRV9009/8 | ZC706 | Yes | No | ADI (2018b) |
| | ZCU102 | Yes | Yes | ADI (2018b) |
| ADRV9009-ZU11EG |  | Yes | No | ADI (2020a) |



# Sections

```{eval-rst}
.. toctree::
   :maxdepth: 1

   install.md
   streaming.md
   targeting.md
   examples.md
   objects.md
   allrefdesigns.md

```

```{toctree}
:caption: Development

dev_hdl_workflow.md
```

