# Analog Devices, Inc. Transceiver Toolbox

Toolbox created by ADI to be used with MATLAB and Simulink with ADI transceivers.

License : [![License](https://img.shields.io/badge/license-ADI_BSD-blue.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/blob/main/LICENSE)
Latest Release : [![GitHub release](https://img.shields.io/github/release/analogdevicesinc/TransceiverToolbox.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)
Downloads :  [![Github All Releases](https://img.shields.io/github/downloads/analogdevicesinc/TransceiverToolbox/total.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)

As with many open source packages, we use [GitHub](https://github.com/analogdevicesinc/TransceiverToolbox) to do develop and maintain the source, and [Jenkins](https://jenkins.com/) for continuous integration.
  - If you want to just use TransceiverToolbox, we suggest using the [latest release](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest).
  - If you think you have found a bug in the release, or need a feature which isn't in the release, try the latest **untested** builds from the main branch.

| HDL Branch        | MATLAB Release |  Installer Package  |
|:-----------------:|:--------------:|:-------------------:|
| 2026_R1           | R2025b         | <a href="https://github.com/analogdevicesinc/TransceiverToolbox/releases/tag/latest"><img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" data-canonical-src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" height="40" /></a>|

If you use it, and like it - please let us know. If you use it, and hate it - please let us know that too.

## Supported Tools and Releases

We provide support across two releases of MATLAB. This does not mean older releases will not work but they are not maintained. Currently supported tools are:
- Bug fixes only: MATLAB R2023b with Vivado 2022.2
- Bug fixes and new features: MATLAB R2025b with Vivado 2025.1

## Support and Documentation

All support questions should be posted in our [EngineerZone](https://ez.analog.com/sw-interface-tools) forums. Documentation is included within the toolbox but additional documentation is available on the [ADI Wiki](https://wiki.analog.com/resources/tools-software/transceiver-toolbox).

## Building & Installing

If you don't want to use the toolbox installers you can manually build the toolbox. Should be a quick matter of `make build`:

```
rgetz@pinky:~/TransceiverToolbox$ make -C CI/scripts/ build 
```

Then simply add the `hdl` folder to your MATLAB path `addpath(genpath('hdl'))`

## Hardware Testing with labgrid

The MATLAB hardware tests (`runHWTests`) connect to a board over a libIIO URI
and honor the `IIO_URI` environment variable. They assume the board is already
powered, booted, and reachable.

[labgrid-plugins](https://github.com/tfcollins/labgrid-plugins)
can provision that board automatically—power it, boot the FPGA/SoC, verify
iiod, and hand MATLAB the resulting URI locally or in GitHub Actions.

The mapping from a labgrid place (tagged with `carrier` / `daughter-board`) to
the MATLAB board reference name that `runHWTests` expects lives in
[`test/hw_ci/board_map.yaml`](test/hw_ci/board_map.yaml).

Run locally against a coordinator place:

```bash
pip install "labgrid-plugins[kuiper] @ git+https://github.com/tfcollins/labgrid-plugins.git@v3.5"

MATLAB_BIN=/mnt/onetb/MATLAB/R2025b/bin/matlab
adi-lg request --part adrv9009 --carrier zc706 --wait 300 \
  --run "$MATLAB_BIN -batch \"addpath(genpath('hdl')); addpath(genpath('test')); runHWTests('zynq-zc706-adv7511-adrv9009')\""
```

This reserves and boots the board, exports `IIO_URI` while `runHWTests` runs,
and then releases the place. The GitHub Actions equivalent is
[`.github/workflows/hw-matlab.yml`](.github/workflows/hw-matlab.yml). See the
[MATLAB Hardware CI guide](https://adi-labgrid-plugins.readthedocs.io/en/latest/user-guide/matlab-hw-ci.html)
for details.

Older Zynq-7000 U-Boot builds, including the AD9371/ZC706 image, may ignore a
nonstandard `tftpdstport` and always request boot files on UDP 69. The labgrid
runner must either redirect UDP 69 to its managed TFTP port or use the
exporter's published port-69 TFTP service. Exporter hostnames (for example
`bq`) must also resolve on the runner because the serial console is exposed by
RFC2217. A missing port redirect appears as `TFTP server died; starting again`
in U-Boot; an unresolved exporter appears as an RFC2217 `getaddrinfo` error.
