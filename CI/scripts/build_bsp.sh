#!/bin/bash
set -xe

if [ -z "${HDLBRANCH}" ]; then
HDLBRANCH='hdl_2021_r2'
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

if [ -z "${VIVADO}" ]; then
   echo "VIVADO not set, will parse HDL"

   # Get required vivado version needed for HDL
   TARGET="hdl/scripts/adi_env.tcl"
   # Use grep to find the line containing "set required_vivado_version"
   matched_line=$(grep 'set required_vivado_version' "$TARGET")

   # Use awk to extract the version number
   VIVADO=$(echo "$matched_line" | awk -F'"' '{print $2}')

   # Print the extracted version number
   echo "Parsed Vivado Version: $VIVADO"
fi

# If not of the form 20xx.x, exit
if [[ ! $VIVADO =~ ^20[0-9]{2}\.[0-9]$ ]]; then
    echo "Vivado version not of the form 20xx.x"
    exit 1
fi

# Update vivado version in MATLAB files
echo "Updating toolbox files to use desired Vivado version"
cd ..
# Update Version.m
sed -i "s/Vivado = .*/Vivado = \'${VIVADO}\';/" +adi/Version.m
# Update plugin_rd
sed -i "s/hRD\.SupportedToolVersion = .*/hRD\.SupportedToolVersion = {\'${VIVADO}\'};/" hdl/vendor/AnalogDevices/+AnalogDevices/plugin_rd.m

# Demos
cd trx_examples
# Update all occurances of hWC.ReferenceDesignToolVersion = '20XX.X'; to use new version
FILES=$(grep -lrn . -e 'hWC.ReferenceDesignToolVersion =')
for f in $FILES; do
   echo "Updating: $f"
   sed -i "s/hWC\.ReferenceDesignToolVersion = .*/hWC\.ReferenceDesignToolVersion = \'${VIVADO}\';/" "$f"
done
# Update all occurances of hRD.SupportedToolVersion = {'20XX.X'}; to use new version
FILES=$(grep -lr . -e 'hRD.SupportedToolVersion =')
for f in $FILES; do
   echo "Updating: $f"
   sed -i "s/hRD\.SupportedToolVersion = .*/hRD\.SupportedToolVersion = {\'${VIVADO}\'};/" "$f"
done
# Update all occurances of Vivado sourcing
FILES=$(grep -lrn . -e 'source /opt/Xilinx/Vivado/20')
for f in $FILES; do
   echo "Updating: $f"
   sed -i "s/source \/opt\/Xilinx\/Vivado\/20.*/source \/opt\/Xilinx\/Vivado\/${VIVADO}\/settings64.sh/" "$f"
done
cd ..

# Tests
cd test
# Update line 35 of DemoTests.m to use new version
sed -i "35s/.*/            testCase.setupVivado('${VIVADO}');/" DemoTests.m
sed -i "47s/.*/            testCase.setupVivado('${VIVADO}');/" DemoTests.m
sed -i "59s/.*/            testCase.setupVivado('${VIVADO}');/" DemoTests.m

cd ..

cd CI

# Setup
# source /opt/Xilinx/Vivado/$VIVADO/settings64.sh

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
# update .mk to .prj in zc706_plddr3_dacfifo_bd.tcl
sed -i 's/.mk/.prj/' hdl/projects/common/zc706/zc706_plddr3_dacfifo_bd.tcl
sed -i '10i   file copy -force $ad_hdl_dir/projects/common/zc706/zc706_plddr3_mig.mk $ad_hdl_dir/projects/common/zc706/zc706_plddr3_mig.prj' hdl/projects/common/zc706/zc706_plddr3_dacfifo_bd.tcl
# Update ADRV9001 design to include util_sync as dependent IP
sed -i '23i   # Custom Sync IP' hdl/projects/adrv9001/zcu102/Makefile
sed -i '24i   LIB_DEPS += util_sync/util_delay' hdl/projects/adrv9001/zcu102/Makefile
sed -i '25i   LIB_DEPS += util_sync/sync_fast_to_slow' hdl/projects/adrv9001/zcu102/Makefile
sed -i '26i   LIB_DEPS += util_sync/sync_slow_to_fast' hdl/projects/adrv9001/zcu102/Makefile

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

# Copy additional IP files
cp -r scripts/library/* ../hdl/vendor/AnalogDevices/vivado/library/
mkdir -p ../test/hdl/vendor/AnalogDevices/vivado
cp ../hdl/vendor/AnalogDevices/vivado/quiet.mk ../test/hdl/vendor/AnalogDevices/vivado

echo 'puts "Skipping"' > ../hdl/vendor/AnalogDevices/vivado/library/axi_ad9361/axi_ad9361_delay.tcl
