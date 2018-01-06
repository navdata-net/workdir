#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
bitbake rpi-basic-image parted ntp nginx rrdtool pylongps rtklibexplorer
#bitbake ntp
#bitbake nginx
#bitbake rrdtool
#bitbake pylongps
#bitbake rtklibexplorer
bitbake package-index
popd >/dev/null

