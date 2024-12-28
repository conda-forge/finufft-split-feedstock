@echo ON

set "SKBUILD_CMAKE_DEFINE=FINUFFT_USE_OPENMP=OFF"
%PYTHON% -m pip install --no-deps --no-build-isolation -vv ./python/finufft
