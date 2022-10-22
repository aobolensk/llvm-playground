#!/usr/bin/env bash
set -x

git submodule update --progress --init --recursive
cd llvm-project
cmake -S llvm -B build \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=install \
    -DLLVM_ENABLE_PROJECTS="clang" \
    -DCMAKE_BUILD_TYPE=Release
cmake --build build
cmake --build build --target install
