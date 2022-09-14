#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib

PYVER=`python -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))'`

bash build.sh -l $LIBRARY_PATH
cp -r hapog.py ${PREFIX}/bin
cp -r hapog_build/hapog ${PREFIX}/bin
cp -r hapog ${PREFIX}/lib/python${PYVER}/site-packages/

ln -s ${PREFIX}/bin/hapog ${PREFIX}/bin/hapog_bin  # workaround for some hardcoded stuff

chmod a+x ${PREFIX}/bin/hapog ${PREFIX}/bin/hapog_bin ${PREFIX}/bin/hapog.py
