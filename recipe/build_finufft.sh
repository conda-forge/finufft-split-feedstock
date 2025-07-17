#!/usr/bin/env bash

set -euxo pipefail

if [[ "${target_platform}" == "osx-arm64" ]]; then
  export ARCH_FLAGS="-mcpu=apple-m3"
else
  export ARCH_FLAGS="-m${ARCH}"
fi

SKBUILD_CMAKE_ARGS="-DFINUFFT_ARCH_FLAGS=${ARCH_FLAGS};-DFINUFFT_USE_OPENMP=ON;-DCMAKE_CUDA_ARCHITECTURES=all-major" \
  "${PYTHON}" -m pip install --no-deps --no-build-isolation -vv "./python/${PKG_NAME}"
