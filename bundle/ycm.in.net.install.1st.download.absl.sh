#!/bin/sh
set -e

ABSL_DIR=absl
if [ ! -d "$ABSL_DIR" ]; then
    git clone https://github.com/abseil/abseil-cpp.git ABSL_DIR
fi

cd absl
git checkout 3b4a16abad2c2ddc494371cc39a2946e36d35d11
cd -
