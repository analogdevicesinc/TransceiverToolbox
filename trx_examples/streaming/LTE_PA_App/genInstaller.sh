#!/bin/bash
PID=$($1/$2/bin/matlab $3 -r 'genLTEPAInstaller' &) 
echo "$PID"
