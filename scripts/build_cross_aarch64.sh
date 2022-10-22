#!/usr/bin/env bash
set -x

git submodule update --progress --init --recursive
cd llvm-project
cmake -S llvm -B build_aarch64 \
    -GNinja \
    -DCMAKE_SYSTEM_NAME="Linux" \
    -DCMAKE_CROSSCOMPILING=ON \
    -DCMAKE_INSTALL_PREFIX=install_aarch64 \
    -DLLVM_TARGET_ARCH=AArch64 \
    -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc \
    -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ \
    -DLLVM_TARGETS_TO_BUILD=AArch64 \
    -DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-linux-gnueabihf \
    -DLLVM_ENABLE_PROJECTS="clang" \
    -DCMAKE_BUILD_TYPE=Release
cmake --build build_aarch64
cmake --build build_aarch64 --target install
