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


# Get required vivado version needed for HDL
if [ -f "hdl/library/scripts/adi_ip.tcl" ]; then
	TARGET="hdl/library/scripts/adi_ip.tcl"
else
	TARGET="hdl/library/scripts/adi_ip_xilinx.tcl"
fi
VER=$(awk '/set REQUIRED_VIVADO_VERSION/ {print $3}' $TARGET | sed 's/"//g')
echo "Required Vivado version ${VER}"
VIVADOFULL=${VER}
if [ ${#VER} = 8 ]
then
VER=${VER:0:6}
fi
VIVADO=${VER}

# Setup
source /opt/Xilinx/Vivado/$VIVADO/settings64.sh

# Update build scripts and force vivado versions
cp scripts/adi_ip.tcl hdl/library/scripts/
VERTMP=$(awk '/set REQUIRED_VIVADO_VERSION/ {print $3}' hdl/library/scripts/adi_ip.tcl | sed 's/"//g')
grep -rl ${VERTMP} hdl/library/scripts | xargs sed -i -e "s/${VERTMP}/${VIVADOFULL}/g"

# Update relative paths
FILES=$(grep -lrnw hdl/projects -e "\.\.\/common" | grep -v Makefile)
for f in $FILES
do
  echo "Updating relative paths of: $f"
  DEVICE=$(echo "$f"| cut -d "/" -f 3)
  STR="\$ad_hdl_dir\/projects\/$DEVICE"
  sed -i "s/\.\.\/common/$STR\/common/g" "$f"
done

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

# Remove intel
rm -rf hdl/projects/common/intel
rm -rf hdl/library/intel

# Remove references to GHDL crap
wget https://raw.githubusercontent.com/analogdevicesinc/hdl/hdl_2018_r2/library/scripts/adi_env.tcl
mv adi_env.tcl hdl/library/scripts/
cp scripts/adi_env.tcl hdl/projects/scripts/

cp scripts/adi_project_xilinx.tcl hdl/projects/scripts/
cp scripts/adi_ip_xilinx.tcl hdl/library/scripts/

# Update cores to move relative paths locally
sed -i 's/add_files/add_files\ -copy_to\ \[pwd\]\ -force/g'  hdl/library/jesd204/axi_jesd204_common/axi_jesd204_common_ip.tcl

# Update new folder names
sed -i 's/util_cdc/analog_lib.com_user_util_cdc_1.0/g' hdl/projects/common/xilinx/adi_fir_filter_bd.tcl
sed -i 's/util_fir_int/analog_lib.com_user_util_fir_int_1.0/g' hdl/projects/adrv9009/common/adrv9009_bd.tcl
sed -i 's/util_fir_int/analog_lib.com_user_util_fir_int_1.0/g' hdl/projects/adrv9371x/common/adrv9371x_bd.tcl

# Pack IP cores
pwd
echo "Starting IP core packaging"
#vivado -verbose -mode batch -source scripts/pack_all_ips.tcl > /dev/null 2>&1
vivado -verbose -mode batch -source scripts/pack_all_ips.tcl > log.txt

# Repack i2s and i2c cores to include xml files
cd hdl/library/axi_i2s_adi/
pwd
ls
#unzip analog.com_user_axi_i2s_adi_1.0.zip -d tmp
unzip analog_lib.com_user_axi_i2s_adi_1.0.zip -d tmp
#rm analog.com_user_axi_i2s_adi_1.0.zip
rm analog_lib.com_user_axi_i2s_adi_1.0.zip
ls
cp *.xml tmp/
cd tmp
#zip -r analog.com_user_axi_i2s_adi_1.0.zip *
zip -r analog_lib.com_user_axi_i2s_adi_1.0.zip *
#cp analog.com_user_axi_i2s_adi_1.0.zip ../
cp analog_lib.com_user_axi_i2s_adi_1.0.zip ../
cd ../../../..

pwd

cd hdl/library/util_i2c_mixer/
#unzip analog.com_user_util_i2c_mixer_1.0.zip -d tmp/
unzip analog_lib.com_user_util_i2c_mixer_1.0.zip -d tmp/
#rm analog.com_user_util_i2c_mixer_1.0.zip
rm analog_lib.com_user_util_i2c_mixer_1.0.zip
cp *.xml tmp/
cd tmp
#zip -r analog.com_user_util_i2c_mixer_1.0.zip *
zip -r analog_lib.com_user_util_i2c_mixer_1.0.zip *
#cp analog.com_user_util_i2c_mixer_1.0.zip ../
cp analog_lib.com_user_util_i2c_mixer_1.0.zip ../
cd ../../../..

pwd

# Rename zips so they do not overwrite one another
cd hdl/library/jesd204
FILES=$(find . -name "*.zip")
for f in $FILES
do
    M=${f:2}
    mv -- "$M" .
done
cd ../../..

#cd hdl/library/jesd204
#FILES=$(find . -name "*.zip")
#for f in $FILES
#do
#    echo "Renaming $f"
#    M=${f:2}
#    echo "Repacking $M"
#    FN=${M::-4}
#    unzip $M -d $FN
#    mv -- "$FN" "jesd204_${FN}"
#    cd "jesd204_${FN}"
#    zip -r "jesd204_${FN}.zip" *
#    cd ..
#    mv "jesd204_${FN}/jesd204_${FN}.zip" .
#    rm -rf "jesd204_${FN}"
#    rm $M
#done
#cd ../../..

cd hdl/library/xilinx
FILES=$(find . -name "*.zip")
for f in $FILES
do
    M=${f:2}
    mv -- "$M" .
done
cd ../../..

#cd hdl/library/xilinx
#FILES=$(find . -name "*.zip")
#for f in $FILES
#do
#    echo "Renaming $f"
#    M=${f:2}
#    echo "Repacking $M"
#    FN=${M::-4}
#    unzip $M -d $FN
#    mv -- "$FN" "xilinx_${FN}"
#    cd "xilinx_${FN}"
#    zip -r "xilinx_${FN}.zip" *
#    cd ..
#    mv "xilinx_${FN}/xilinx_${FN}.zip" .
#    rm -rf "xilinx_${FN}"
#    rm $M
#done
#cd ../../..


# Move all cores
echo "Moving all cores"
vivado -mode batch -source scripts/copy_all_packed_ips.tcl || true

cp -r hdl/library/util_pack/*.zip hdl/library/
cp -r hdl/library/jesd204/*.zip hdl/library/
cp -r hdl/library/xilinx/*.zip hdl/library/
cp -r hdl/projects/common common
cp -r hdl/projects/scripts/adi_board.tcl .

mv hdl/projects projects_premerge
# Remove pluto since its manually updated
rm -rf projects_premerge/pluto
cp -r projects hdl/
cp -R projects_premerge/* hdl/projects/
rm -rf projects_premerge

cp -R common/* hdl/projects/common/
rm -rf common
mv adi_board.tcl hdl/projects/scripts/

# Update tcl scripts and additional IP cores (MUX)
cp scripts/adi_project.tcl hdl/projects/scripts/
cp scripts/adi_build.tcl hdl/projects/scripts/
cp ip/*.zip hdl/library/

# Update vivado version in MATLAB API and build script
DEFAULT_V_VERSION='2017.4'
cd ..
echo "SED 1"
grep -rl ${DEFAULT_V_VERSION} hdl/vendor/AnalogDevices/+AnalogDevices | grep -v MODEM | xargs sed -i "s/${DEFAULT_V_VERSION}/$VIVADO/g"
cd CI
echo "SED 2"
grep -rl ${DEFAULT_V_VERSION} hdl/projects/scripts | xargs sed -i "s/${DEFAULT_V_VERSION}/$VIVADOFULL/g"

# Remove extra projects
FILES=$(find hdl/projects)
for f in $FILES
do
  if [[ "$f" == 'adrv9009' ]]; then
    continue
  elif [[ "$f" == 'adrv9371x' ]]; then
    continue
  elif [[ "$f" == 'fmcomms2' ]]; then
    continue
  elif [[ "$f" == 'fmcomms5' ]]; then
    continue
  elif [[ "$f" == 'pluto' ]]; then
    continue
  elif [[ "$f" == 'adrv9001' ]]; then
    continue
  elif [[ "$f" == 'adrv9361z7035' ]]; then
    continue
  elif [[ "$f" == 'adrv9364z7020' ]]; then
    continue
  fi
  rm -rf "hdl/projects/$f"
  
done

# Remove git directory move to bsp folder
rm -fr hdl/.git*
TARGET="../hdl/vendor/AnalogDevices/vivado"
if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
fi
cp -r hdl $TARGET


# Cleanup
rm vivado_*
rm vivado.jou
rm vivado.log
rm -rf hdl
