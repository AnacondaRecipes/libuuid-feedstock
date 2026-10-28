#!/bin/bash
set -ex

# Get an updated config.sub and config.guess
cp "$BUILD_PREFIX"/share/gnuconfig/config.* ./config

bash configure --prefix="$PREFIX" \
    --disable-all-programs \
    --enable-libuuid \
    --disable-static

make -j"${CPU_COUNT}" libuuid.la
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" != "1" ]]; then
    make -j"${CPU_COUNT}" test_uuid_parser test_uuid_time
    ./test_uuid_parser
    ./test_uuid_time
fi

# Install only the library and development files; util-linux owns the UUID manpages.
make install-usrlib_execLTLIBRARIES install-uuidincHEADERS install-pkgconfigDATA
