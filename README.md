# Analog Devices, Inc. Transceiver Toolbox

Toolbox created by ADI to be used with MATLAB and Simulink with ADI transceivers.

License : [![License](https://img.shields.io/badge/license-ADI_BSD-blue.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/blob/master/LICENSE)
Latest Release : [![GitHub release](https://img.shields.io/github/release/analogdevicesinc/TransceiverToolbox.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)
Downloads :  [![Github All Releases](https://img.shields.io/github/downloads/analogdevicesinc/TransceiverToolbox/total.svg)](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest)

As with many open source packages, we use [GitHub](https://github.com/analogdevicesinc/TransceiverToolbox) to do develop and maintain the source, and [Jenkins](https://jenkins.com/) for continuous integration.
  - If you want to just use TransceiverToolbox, we suggest using the [latest release](https://github.com/analogdevicesinc/TransceiverToolbox/releases/latest).
  - If you think you have found a bug in the release, or need a feature which isn't in the release, try the latest **untested** builds from the master branch.

| HDL Branch        | MATLAB Release |  Installer Package  |
|:-----------------:|:--------------:|:-------------------:|
| 2022_R2           | R2023b         | <a href="https://github.com/analogdevicesinc/TransceiverToolbox/releases/tag/latest"><img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" data-canonical-src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" height="40" /></a>|

If you use it, and like it - please let us know. If you use it, and hate it - please let us know that too.

## Supported Tools and Releases

We provide support across two releases of MATLAB. This does not mean older releases will not work but they are not maintained. Currently supported tools are:
- Bug fixes only: MATLAB R2022b with Vivado 2021.2
- Bug fixes and new features: MATLAB R2023b with Vivado 2022.2

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

[adi-labgrid-plugins](https://github.com/analogdevicesinc/adi-labgrid-plugins)
provisions that board automatically — power, boot the FPGA/SoC, verify iiod
is up, hand MATLAB the URI — both locally and in GitHub Actions.

### CI triggers

Hardware CI runs via
[`.github/workflows/hw-matlab-request.yml`](.github/workflows/hw-matlab-request.yml)
(reusable `matlab-hw-request.yml@v3`):

- **Nightly** — `0 5 * * *` UTC (offset from bespoke `hw-matlab.yml` at 08:00).
- **Push to `master`**.
- **`workflow_dispatch`** — manual trigger from the Actions UI.
- **Pull request** — only when the PR carries the `hw-test` label (add it to
  request a hardware run on your branch).

Both `hw-matlab.yml` (legacy) and `hw-matlab-request.yml` (v3) run in parallel
during the migration window.

### Board map

The mapping from a labgrid coordinator place (tagged `carrier` /
`daughter-board` / `hdl-config`) to the MATLAB board string that
`runHWTests(board)` expects lives in
[`test/hw_ci/board_map.yaml`](test/hw_ci/board_map.yaml).
The most-specific matching row wins; a row without `carrier` is a
carrier-agnostic fallback. Keep this file in sync with the `switch` in
`test/runHWTests.m` when adding boards.

### Local repro

Request a board from the coordinator, boot it, and run the tests locally:

```bash
adi-lg request --part <part> --carrier <carrier> --wait 300 \
  --run "matlab -batch \"addpath(genpath('hdl')); addpath(genpath('test')); runHWTests('<matlab_board>')\""
```

Replace `<part>`, `<carrier>`, and `<matlab_board>` with values from
`test/hw_ci/board_map.yaml` (e.g. `adrv9009`, `zcu102`,
`zynqmp-zcu102-rev10-adrv9009`). See the
[MATLAB Hardware CI guide](https://adi-labgrid-plugins.readthedocs.io/en/latest/user-guide/matlab-hw-ci.html)
for full coordinator setup details.

