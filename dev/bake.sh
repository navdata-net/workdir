#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
bitbake navdatanet-station
bitbake package-index
popd >/dev/null

