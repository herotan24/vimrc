#!/bin/sh
set -e

git clone https://github.com/abseil/abseil-cpp.git YouCompleteMe/third_party/ycmd/cpp/absl/
cd YouCompleteMe/third_party/ycmd/cpp/absl/
git checkout 3b4a16abad2c2ddc494371cc39a2946e36d35d11
cd -
