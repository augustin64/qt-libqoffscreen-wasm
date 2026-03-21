#!/bin/bash

Qt_VER=$1

[[ $Qt_VER ]] || exit 1

# from https://stackoverflow.com/a/4024263
verlte() {
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

verlt() {
    [ "$1" = "$2" ] && return 1 || verlte $1 $2
}

if $(verlt $Qt_VER 6.7.0) ; then
  ICU_VERSION=56
else
  ICU_VERSION=73
fi

echo $ICU_VERSION
