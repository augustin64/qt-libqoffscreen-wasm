#!/bin/bash
set -euo pipefail

ICU_VERSION="${1:-${ICU_VERSION:-}}"
if [[ -z "$ICU_VERSION" ]]; then
  echo "Usage: $0 <icu-version>"
  exit 1
fi

if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be run as root (use sudo)."
  exit 1
fi

if [[ "$ICU_VERSION" == "73" ]]; then
  echo "Installing libicu73 from GitHub"
  DL_LINK="https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-Ubuntu22.04-x64.tgz"
  curl -sSL "$DL_LINK" > icu.tgz
  tar -xzvf icu.tgz
  rm icu/readme.txt
  cp -a icu/* /
  exit 0
fi
