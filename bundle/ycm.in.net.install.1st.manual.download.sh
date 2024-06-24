#!/bin/sh
set -e

# for absl
ABSL_DIR=absl
if [ ! -d "$ABSL_DIR" ]; then
    git clone https://github.com/abseil/abseil-cpp.git ABSL_DIR
fi

cd absl
git checkout 3b4a16abad2c2ddc494371cc39a2946e36d35d11
cd -

echo "如果命令行下载不成功，用浏览器下载后，放置到指定目录"

# for clang
wget https://github.com/ycm-core/llvm/releases/download/14.0.0/libclang-14.0.0-x86_64-unknown-linux-gnu.tar.bz2 

# for clangd
wget https://github.com/ycm-core/llvm/releases/download/14.0.0/clangd-14.0.0-x86_64-unknown-linux-gnu.tar.bz2
