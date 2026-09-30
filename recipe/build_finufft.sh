#!/usr/bin/env bash

set -euxo pipefail

if [[ "${target_platform}" == "osx-arm64" ]]; then
  export ARCH_FLAGS="-mcpu=apple-m3"
elif [[ "${target_platform}" == "linux-aarch64" ]]; then
  export ARCH_FLAGS="-march=armv8-a"
else
  export ARCH_FLAGS="-m${ARCH}"
fi

# Variants built in the same job share the work dir. Clear the cached CMake build so each
# variant is configured with its own compiler flags (e.g. microarch_level).
rm -rf "./python/${PKG_NAME}/build"

# finufft 2.5.1 fetches CCCL 3.0.2, whose CUB fails on aarch64 + CUDA 13.4 (NVIDIA/cccl#6099).
# 3.2.x has the fix; 3.3+ drops transitive thrust includes that 2.5.1 relies on. Remove on next release.
SKBUILD_CMAKE_ARGS="-DFINUFFT_ARCH_FLAGS=${ARCH_FLAGS};-DFINUFFT_USE_OPENMP=ON;-DCMAKE_CUDA_ARCHITECTURES=all-major;-DCUDA12_CCCL_VERSION=3.2.1" \
  "${PYTHON}" -m pip install --no-deps --no-build-isolation -vv "./python/${PKG_NAME}"
