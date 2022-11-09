#!/bin/bash

set -x

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./config

bash configure --prefix=$PREFIX --disable-all-programs --enable-libuuid

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make tests
fi
make install

rm -fr $PREFIX/share
