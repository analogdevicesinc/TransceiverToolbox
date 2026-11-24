# ADRV9009-ZU11EG on ADRV2CRR-FMC boot files

`adi_build.tcl` packs these files with the generated `system_top.bit` into
`BOOT.BIN` (`bootgen -arch zynqmp -image zynq.bif`).

| File | Source | sha256 |
|------|--------|--------|
| `fsbl.elf` | Vitis 2025.1 `zynqmp_fsbl`, generated from the hdl_2026_r1 `adrv9009zu11eg` XSA | `e4d1ec5a59fc191dba790dca2d0a59802d9abd9028aed8ca3ea91b9eb758845c` |
| `pmufw.elf` | Vitis 2025.1 `zynqmp_pmufw`, same XSA | `07e3bd0519301c7bf028bdf056ed027e3c0861dcbb8a20f6c76e2e9086abdeab` |
| `bl31.elf` | Xilinx arm-trusted-firmware tag `xilinx-v2025.1` (v2.12.0) | `4df34ae5f41c742c6ea7abdb4d54f0b8403bb280c88b6c7ef1197193f3d246c3` |
| `u-boot.elf` | ADI `u-boot_adi_zynqmp_adrv9009_zu11eg_adrv2crr_fmc.elf` (U-Boot 2018.01-21439-gd244ce5) | `4abab00190fc6234f12c45201edfd19809e9b49e9b5f92fc89e9c322734bfae0` |

`zynq.bif` is a copy of `../zcu102/zynq.bif`.

## How these were produced

FSBL and PMU firmware (the XSA is the project's
`write_hw_platform -fixed -minimal` output after `generate_target`):

```tcl
set hw [hsi::open_hw_design system_top.xsa]
hsi::generate_app -hw $hw -os standalone -proc psu_cortexa53_0 -app zynqmp_fsbl -compile -sw fsbl -dir fsbl
hsi::generate_app -hw $hw -os standalone -proc psu_pmu_0 -app zynqmp_pmufw -compile -sw pmufw -dir pmufw
```

ARM trusted firmware (this design enables only PS UART1, on MIO 16..17):

```sh
git clone --depth 1 --branch xilinx-v2025.1 https://github.com/Xilinx/arm-trusted-firmware.git
make -C arm-trusted-firmware CROSS_COMPILE=aarch64-linux-gnu- PLAT=zynqmp RESET_TO_BL31=1 ZYNQMP_CONSOLE=cadence1 bl31
```

U-Boot is copied unmodified from the ADI Kuiper `2025-03-18-ADI-Kuiper-full.img`
file `zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb/bootgen_sysfiles.tgz`.
It's the same U-Boot build that the other carriers in this directory use.

## Why the Kuiper FSBL isn't used

That archive also ships an FSBL, PMU firmware and bl31 from Vitis 2023.2.
Its FSBL carries the processing-system init (`psu_init`) for the hdl_2023_r2
design. In hdl_2026_r1, the design's AXI port widths differ: it sets HPC0 and
HPC1 (`0xFD360000`, `0xFD370000`) and no longer sets HP3 (`0xFD3B0000`). FSBL
and PMU firmware therefore have to come from the current design's XSA. If a
future HDL release changes the PS settings, regenerate all three files from one
Xilinx release and update this table.
