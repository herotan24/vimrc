#!/bin/sh

cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/tmp/llvm . ../YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
