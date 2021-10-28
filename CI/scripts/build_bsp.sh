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

# Remove git directory move to bsp folder
rm -fr hdl/.git*
TARGET="../hdl/vendor/AnalogDevices/vivado"
if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
fi
mv hdl $TARGET