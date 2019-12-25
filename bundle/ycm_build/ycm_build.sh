#!/bin/sh

cmake -G "Unix Makefiles" \
      -DCMAKE_CXX_COMPILER=/usr/bin/gcc \
      -DPATH_TO_LLVM_ROOT=/usr/lib/llvm-3.9/ \
      -DPYTHON_INCLUDE_DIR=/usr/include/python3.6 \
      -DPYTHON_LIBRARY=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6.so \
      -DUSE_PYTHON2=OFF \
      . \
      ../YouCompleteMe/third_party/ycmd/cpp

cmake --build . --target ycm_core --config Release
