#!/usr/bin/env bash

set -euxo pipefail

if [[ $PKG_NAME == "finufft" ]]; then

    SKBUILD_CMAKE_DEFINE=FINUFFT_ARCH_FLAGS="-m${ARCH}" FINUFFT_USE_OPENMP=ON \
        "${PYTHON}" -m pip install --no-deps --no-build-isolation -vv ./python/finufft

elif [[ $PKG_NAME == "cufinufft" ]]; then

    SKBUILD_CMAKE_DEFINE=FINUFFT_ARCH_FLAGS="-m${ARCH}" FINUFFT_USE_OPENMP=ON \
        "${PYTHON}" -m pip install --no-deps --no-build-isolation -vv ./python/cufinufft

fi
