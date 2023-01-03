#!/bin/bash

export ACE_ROOT=/usr/include/ace
export TBB_ROOT_DIR=/usr/include/tbb

cd /root/vmangos
git clone -b development https://github.com/vmangos/core src
cd /root/vmangos/build
cmake /root/vmangos/src -DDEBUG=0 -DSUPPORTED_CLIENT_BUILD=5875 -DUSE_EXTRACTORS=1 -DCMAKE_INSTALL_PREFIX=/root/vmangos/out

make -j4
make install