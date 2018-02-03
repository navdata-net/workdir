#!/bin/bash

for i in base rover cons lcd ; do
  rm ${i}.tbz
  pushd $i
  tar -cvjf ../${i}.tbz .
  popd
  done
