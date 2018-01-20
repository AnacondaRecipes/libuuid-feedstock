#!/bin/bash

bash configure --prefix=$PREFIX --build=${BUILD}

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
