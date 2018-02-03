#!/bin/bash

MYSD="/dev/sdb"
echo "Make sure ${MYSD} is your SD card first and edit this file accordingly. Doom awaits you if you dont."

CFG="/workdir/config/${1}.tbz"
[ -f "${CFG}" ] || { echo "Missing config" ; exit 1 ; }

echo "Writing image."
dd bs=4M if=/workdir/dev/build/tmp/deploy/images/raspberrypi3-64/navdatanet-station-raspberrypi3-64.rpi-sdimg of=${MYSD} || { echo "Failed to write image." ; exit 1 ; }
sync

echo "Mountig SD"
mount ${MYSD} /mnt/tmp || exit 1

echo "Entering FS"
pushd /mnt/tmp >/dev/null || exit 1

echo "Deploying config ${1}."
rm -f etc/rtklib/rtkrcv.conf
tar -xvjf "${CFG}"

popd >/dev/null

umount ${MYSD}
sync

echo "Completed."

