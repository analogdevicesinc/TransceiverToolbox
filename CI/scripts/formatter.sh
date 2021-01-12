#!/bin/bash
if [ -z "$MLRELEASE" ]
then
	MLRELEASE=R2018b
fi
if [ -z "$MLPATH" ]
then
	MLPATH=/usr/local/MATLAB
fi

# apt-get install python3-pip
# pip3 install invoke
invoke --list
Xvfb :77 &
export DISPLAY=:77
export SWT_GTK3=0
invoke format --mlpath=$MLPATH --mlrelease=$MLRELEASE
kill -9 `pidof Xvfb`
