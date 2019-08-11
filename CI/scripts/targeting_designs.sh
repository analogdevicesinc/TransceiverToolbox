#!/bin/bash

MLFLAGS="-nodisplay -nodesktop -nosplash -r"

if [ -z "$MLRELEASE" ]
then
	MLRELEASE=R2019a
fi

MLPATH=/usr/local/MATLAB

cd ../.. 
source /opt/Xilinx/Vivado/2018.2/settings64.sh
Xvfb :77 &
export DISPLAY=:77
export SWT_GTK3=0
source /opt/Xilinx/Vivado/2018.2/settings64.sh
$MLPATH/$MLRELEASE/bin/matlab $MLFLAGS "addpath(genpath('test'));addpath(genpath('deps'));runDemoTests;"
kill -9 `pidof Xvfb`
