#!/bin/sh

set -e

echo "如果命令行下载不成功，用浏览器下载后，放置到指定目录"

wget https://github.com/ycm-core/llvm/releases/download/14.0.0/libclang-14.0.0-x86_64-unknown-linux-gnu.tar.bz2 

cp libclang-14.0.0-x86_64-unknown-linux-gnu.tar.bz2 ./YouCompleteMe/third_party/ycmd/clang_archives/
