#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
bitbake rpi-basic-image parted e2fsprogs curl ntp nginx rrdtool pylongps rtklibexplorer
bitbake package-index
popd >/dev/null

