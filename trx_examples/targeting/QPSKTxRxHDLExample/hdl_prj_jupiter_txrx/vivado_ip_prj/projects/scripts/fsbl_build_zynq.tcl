

### Calling script must generated have system_top.bit


set cdir [pwd]
set sdk_loc $cdir/vivado_prj.sdk

### Copy common dependent files for ZCU102
file mkdir $cdir/boot
file copy -force $cdir/projects/common/boot/zynq.bif $cdir/boot/zynq.bif
if {$argc == 1} {
	file copy -force $cdir/projects/common/boot/[lindex $argv 0]/u-boot.elf $cdir/boot/u-boot.elf
} else {
	file copy -force $cdir/projects/common/boot/u-boot.elf $cdir/boot/u-boot.elf
}

### Copy system_top.bit into the output folder
file copy -force $cdir/projects/common/boot/fsbl.elf $cdir/boot/fsbl.elf
file copy -force $cdir/vivado_prj.runs/impl_1/system_top.bit $cdir/boot/system_top.bit

### Build BOOT.BIN
cd $cdir/boot
exec bootgen -arch zynq -image zynq.bif -o BOOT.BIN -w
exit
