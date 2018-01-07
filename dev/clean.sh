#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
mkdir todelete
mv bitbake-cookerdaemon.log todelete/
mv cache todelete/
mv sstate-cache todelete/
mv tmp todelete/
rm -rf todelete
popd >/dev/null

