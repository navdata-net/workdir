#!/bin/bash

YOCTO_BRANCH="rocko"
YOCTO_LAYERS=("git://git.openembedded.org/meta-openembedded" "https://github.com/meta-qt5/meta-qt5" "git://git.yoctoproject.org/meta-security" "git://git.yoctoproject.org/meta-raspberrypi" "https://github.com/navdata-net/meta-navdatanet")

PRE_MD5="`md5sum \"${0}\"`"
echo "Trying selfupdate."
git pull
POST_MD5="`md5sum \"${0}\"`"
[ "${PRE_MD5}" = "${POST_MD5}" ] || {
  echo "${0} was updated. Please rerun."
  exit
  }
echo

pushd . >/dev/null

echo "Fetching poky template."
[ -e 'poky' ] || git clone git://git.yoctoproject.org/poky.git
pushd poky >/dev/null
git pull
echo
popd >/dev/null

ENV="${1:-dev}"
#for ENV in dev prod ; do
  echo "Fetching ${ENV} environment: poky"
  pushd ${ENV} >/dev/null

  [ -e '.git' ] || {
    cp -arv ../poky/.git .
    git checkout master
    git reset --hard HEAD
    git checkout ${YOCTO_BRANCH}
    }

  git pull
  echo

  for LAYER in ${YOCTO_LAYERS[@]} ; do
    FOLDER="`echo ${LAYER} | sed 's%^.*/\(.*\)$%\1%g'`"
    echo "Fetching ${ENV} environment: ${FOLDER}"

    [ -e "${FOLDER}" ] || git clone -b ${YOCTO_BRANCH} "${LAYER}"

    pushd "${FOLDER}" >/dev/null
    git pull
    echo
    popd >/dev/null

    done

  popd >/dev/null
  #done

popd >/dev/null

