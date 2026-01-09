
# Installation

## Dependencies

The toolbox has different dependencies based on the features required. These are broken down into the base dependencies for data stream and control, and HDL code generation.

The base dependencies for the toolbox requires libIIO and the libIIO MATLAB bindings. There are three options for this install with different required MathWorks Toolboxes:

- [Communications Toolbox Support Package for Xilinx Zynq-Based Radio](https://www.mathworks.com/help/supportpkg/xilinxzynqbasedradio/index.html)
    - Communications Toolbox
    - Signal Processing Toolbox™
    - DSP System Toolbox™
- [Communications Toolbox Support Package for Analog Devices ADALM-Pluto Radio](https://www.mathworks.com/help/supportpkg/plutoradio/index.html)
    - Communications Toolbox
    - Signal Processing Toolbox™
    - DSP System Toolbox™
- [libIIO MATLAB Binding Standalone Installer (R2021b+)](https://github.com/mathworks/buildroot/releases/download/mathworks_zynq_R21.2.0/libiio.mlpkginstall)
    - Signal Processing Toolbox™


### HDL Generation Support

To leverage HDL-Coder and the reference designs with the toolbox requires the following components:

- Xilinx Vivado 2022.2
- Xilinx Vitis 2022.2
- Simulink
- [HDL-Coder™](https://www.mathworks.com/products/hdl-coder.html)
- [HDL Coder™ Support Package for Xilinx Zynq Platform](https://www.mathworks.com/matlabcentral/fileexchange/40447-hdl-coder-support-package-for-xilinx-zynq-platform)

## Connecting To Hardware

Transceiver Toolbox is designed and tested to work with ADI kernel drivers based in the IIO framework. The most common target platforms will utilize ADI's Kuiper Linux distribution or other buildroot based systems authored by ADI. These images have the necessary IIO drivers and libIIO support built-in. Since drivers can evolve over time, it is recommended to always the supported Kuiper released defined on the [Transceiver Toolbox Release Page](https://github.com/analogdevicesinc/TransceiverToolbox/releases).

To download and flash Kuiper images, refer to the [Kuiper Linux Documentation](https://wiki.analog.com/resources/tools-software/linux-software/kuiper-linux).

It is possible to use Transceiver Toolbox with custom Linux images as long as the necessary IIO drivers and libIIO support is included.

## Transceiver Toolbox Install

The Transceiver Toolbox itself can be installed either from:

- [MATLAB's Add-On Explorer](https://www.mathworks.com/products/matlab/add-on-explorer.html) 
- [GitHub Releases page](https://github.com/analogdevicesinc/TransceiverToolbox/releases).

:::{admonition} MATLAB Versions
:class: warning

Before installing Transceiver Toolbox check the [Release Page](https://github.com/analogdevicesinc/TransceiverToolbox/releases) to check for the lasted supported of MATLAB. The latest version is the one which is available in [Add-on Explorer](https://www.mathworks.com/products/matlab/add-on-explorer.html), since Add-On Explorer does not currently support hosting multiple versions. If you have an older release of MATLAB, download the MLTBX installer from matching release on the [Release Page](https://github.com/analogdevicesinc/TransceiverToolbox/releases).

:::


### Add-On Explorer Walkthrough

To install the toolbox from within MATLAB using the Add-On Explorer, first launch the Explorer from MATLAB's Home tab:

<img class="screenshot" src="/_static/assets/add_ex.png">

Search for the toolbox:

<!-- ![Add-On Explorer](assets/trx_search_wbox.png) -->
<img class="screenshot" src="/_static/assets/trx_search_wbox.png">

Select Transceiver Toolbox from results:

<!-- ![Add-On Explorer](assets/trx_search_find_wbox.png) -->
<img class="screenshot" src="/_static/assets/trx_search_find_wbox.png">


Select add:

<!-- ![Add-On Explorer](assets/addons_page_wbox.png) -->
<img class="screenshot" src="/_static/assets/addons_page_wbox.png">