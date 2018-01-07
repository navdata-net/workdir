#!/bin/bash
pushd . >/dev/null
. ./oe-init-build-env ${1}
pwd
rm -f bitbake-cookerdaemon.log
rm -rf cache
rm -rf sstate-cache
rm -rf tmp
popd >/dev/null

