#!/bin/bash

for i in `ls -1 -d */ | sed 's%^\(.*\)/$%\1%'` ; do
  [ -f ${i}.tbz ] && rm ${i}.tbz
  pushd $i
  tar -cvjf ../${i}.tbz .
  popd
  done
