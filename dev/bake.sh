#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
bitbake rpi-basic-image
bitbake package-index
popd >/dev/null

