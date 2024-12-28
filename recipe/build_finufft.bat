@echo ON

set "SKBUILD_CMAKE_ARGS=-DFINUFFT_USE_OPENMP=OFF;-DFINUFFT_FFTW_SUFFIX="
%PYTHON% -m pip install --no-deps --no-build-isolation -vv ./python/finufft
