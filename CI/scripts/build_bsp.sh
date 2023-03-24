#!/bin/bash
set -x

if [ -z "${HDLBRANCH}" ]; then
HDLBRANCH='hdl_2021_r1'
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

# Get required vivado version needed for HDL
if [ -f "hdl/library/scripts/adi_ip.tcl" ]; then
	TARGET="hdl/library/scripts/adi_ip.tcl"
else
	TARGET="hdl/library/scripts/adi_ip_xilinx.tcl"
fi
VER=$(awk '/set required_vivado_version/ {print $3}' $TARGET | sed 's/"//g')
echo "Required Vivado version ${VER}"
VIVADOFULL=${VER}
if [ ${#VER} = 8 ]
then
VER=${VER:0:6}
fi
VIVADO=${VER}

# Setup
source /opt/Xilinx/Vivado/$VIVADO/settings64.sh

# Pre-build IP library
# cd hdl/library
# make
# cd ../..

# Rename .prj files since MATLAB ignores then during packaging
FILES=$(grep -lrn hdl/projects/common -e '.prj' | grep -v Makefile | grep -v .git)
for f in $FILES
do
  echo "Updating prj reference in: $f"
  sed -i "s/\.prj/\.mk/g" "$f"
done
FILES=$(find hdl/projects/common -name "*.prj")
for f in $FILES
do
  DEST="${f::-3}mk"
  echo "Renaming: $f to $DEST"
  mv "$f" "$DEST"
done

# Remove git directory move to bsp folder
rm -fr hdl/.git*
TARGET="../hdl/vendor/AnalogDevices/vivado"
if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
fi
# Increase rx_clk period to fix timing failures for Pluto designs in R2021b
sed -i 's/16.27/30/' hdl/projects/pluto/system_constr.xdc
mv hdl $TARGET

# Post-process ports.json
cp ./scripts/ports.json ./
python3 ./scripts/read_ports_json.py
cp ports.json ../hdl/vendor/AnalogDevices/+AnalogDevices/

# Updates
cp scripts/matlab_processors.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/matlab_processors.tcl
cp scripts/adi_project_xilinx.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/adi_project_xilinx.tcl
cp scripts/system_project_rxtx.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/system_project_rxtx.tcl
cp scripts/adi_build.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/adi_build.tcl
cp scripts/adi_build_win.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/adi_build_win.tcl

# Copy fsbl files
cp scripts/fsbl_build_zynq.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/fsbl_build_zynq.tcl
cp scripts/fsbl_build_zynqmp.tcl ../hdl/vendor/AnalogDevices/vivado/projects/scripts/fsbl_build_zynqmp.tcl
cp scripts/pmufw_zynqmp.tcl  ../hdl/vendor/AnalogDevices/vivado/projects/scripts/pmufw_zynqmp.tcl
cp scripts/fixmake.sh  ../hdl/vendor/AnalogDevices/vivado/projects/scripts/fixmake.sh

# Copy boot files
mkdir ../hdl/vendor/AnalogDevices/vivado/projects/common/boot/
cp -r scripts/boot/* ../hdl/vendor/AnalogDevices/vivado/projects/common/boot/

echo 'puts "Skipping"' > ../hdl/vendor/AnalogDevices/vivado/library/axi_ad9361/axi_ad9361_delay.tcl
