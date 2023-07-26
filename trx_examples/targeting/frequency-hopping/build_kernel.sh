#!/bin/bash

# Build kernel
git clone -b 2021_R2 --depth=1 https://github.com/analogdevicesinc/linux.git
cd linux
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
source /opt/Xilinx/Vivado/2021.2/settings64.sh
cp ../hopper.patch .
git apply --reject hopper.patch
if [ "$?" != "0" ]; then
	exit 1
fi
make zynq_xcomm_adv7511_defconfig
make -j4 UIMAGE_LOADADDR=0x8000 uImage
