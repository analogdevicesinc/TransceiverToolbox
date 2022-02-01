#!/bin/bash
set -x

if [ -z "${HDLBRANCH}" ]; then
HDLBRANCH='hdl_2019_r2'
fi

# Script is designed to run from specific location
scriptdir=`dirname "$BASH_SOURCE"`
cd $scriptdir
cd ..

# Get HDL
if [ -d "hdl" ]; then
    rm -rf "hdl"
fi
for i in {1..5}
do
	if git clone --single-branch -b $HDLBRANCH https://github.com/analogdevicesinc/hdl.git
	then
	   break
	fi
	if [ -d "hdl" ]; then
	   break
	fi
done
if [ ! -d "hdl" ]; then
   echo "HDL clone failed"
   exit 1
fi

# Pre-build IP library
cd hdl/library
make
cd ../..

# Remove git directory move to bsp folder
rm -fr hdl/.git*
TARGET="../hdl/vendor/AnalogDevices/vivado"
if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
fi
mv hdl $TARGET

# Updates
cp scripts_v2/matlab_processors.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/matlab_processors.tcl
cp scripts_v2/adi_project_xilinx.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/adi_project_xilinx.tcl
cp scripts_v2/system_project_rxtx.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/system_project_rxtx.tcl

echo 'puts "Skipping"' > ../hdl/vendor/AnalogDevices/vivado/library/axi_ad9361/axi_ad9361_delay.tcl
