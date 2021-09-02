#!/bin/bash

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

bash configure --prefix=$PREFIX --build=${BUILD}

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
