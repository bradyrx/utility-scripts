#!/bin/bash
echo "ssh -N -L 8888:`hostname`:8877 -L 8787:`hostname`:8787 ${USER}@cheyenne.ucar.edu"
jupyter lab --no-browser --ip=`hostname` --port=8877
