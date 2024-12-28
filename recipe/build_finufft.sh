#!/usr/bin/env bash

set -euxo pipefail

if [[ "${target_platform}" == "osx-arm64" ]]; then
  export ARCH_FLAGS="-mcpu=apple-m3"
else
  export ARCH_FLAGS="-m${ARCH}"
fi

SKBUILD_CMAKE_DEFINE="FINUFFT_ARCH_FLAGS=${ARCH_FLAGS} FINUFFT_USE_OPENMP=ON" \
  "${PYTHON}" -m pip install --no-deps --no-build-isolation -vv "./python/${PKG_NAME}"
