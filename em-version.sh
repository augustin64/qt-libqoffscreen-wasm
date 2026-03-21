#!/bin/bash
# Determines the Emscripten version to use with a certain version of Qt.
# https://doc.qt.io/qt-6/wasm.html

Qt_VER=$1

[[ $Qt_VER ]] || exit 1

case "${Qt_VER}" in 
 5.12.*) EM_VERSION=1.38.16;;
 5.13.*) EM_VERSION=1.38.27;;
 5.13.*-multithreading) EM_VERSION=1.38.30;;
 5.14.*) EM_VERSION=1.38.27;;
 5.13.*-multithreading) EM_VERSION=1.38.30;;
 5.15.*) EM_VERSION=1.39.8;;
 6.2.*) EM_VERSION=2.0.14;;
 6.3.*) EM_VERSION=3.0.0;;
 6.4.*) EM_VERSION=3.1.14;;
 6.5.*) EM_VERSION=3.1.25;;
 6.6.*) EM_VERSION=3.1.37;;
 6.7.*) EM_VERSION=3.1.50;;
 6.8.*) EM_VERSION=3.1.56;;
 6.9.*) EM_VERSION=3.1.70;;
 6.10.*) EM_VERSION=4.0.7;;
 *) echo "Unsupported Qt version '${Qt_VER}'"; exit 1;;
esac

echo $EM_VERSION
