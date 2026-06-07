

### Calling script must generated have system_top.bit


set cdir [pwd]
set sdk_loc $cdir/vivado_prj.sdk

### Copy common dependent files for ZCU102
file mkdir $cdir/boot
file copy -force $cdir/projects/common/boot/zynqmp.bif $cdir/boot/zynqmp.bif
file copy -force $cdir/projects/common/boot/bl31.elf $cdir/boot/bl31.elf
file copy -force $cdir/projects/common/boot/pmufw.elf $cdir/boot/pmufw.elf
file copy -force $cdir/projects/common/boot/u-boot-zcu.elf $cdir/boot/u-boot-zcu.elf
file copy -force $cdir/projects/common/boot/fsbl.elf $cdir/boot/fsbl.elf

### Copy system_top.bit into the output folder
file copy -force $cdir/vivado_prj.runs/impl_1/system_top.bit $cdir/boot/system_top.bit

### Build BOOT.BIN
cd $cdir/boot
exec bootgen -arch zynqmp -image zynqmp.bif -o BOOT.BIN -w
exit
