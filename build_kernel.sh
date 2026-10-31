#!/usr/bin/env bash

set -e

# 当前脚本所在目录, 也就是 Linux 内核源码目录
KERNEL_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 默认输出目录: 源码目录下的 Build
KERNEL_OUT="${KERNEL_OUT:-${KERNEL_SRC}/Build}"

mkdir -p "${KERNEL_OUT}"

if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "  bash $0 x86_64_defconfig"
    echo "  bash $0 menuconfig"
    echo "  bash $0 -j\$(nproc)"
    echo "  bash $0 clean"
    echo "  bash $0 mrproper"
    exit 1
fi

echo "KERNEL_SRC = ${KERNEL_SRC}"
echo "KERNEL_OUT = ${KERNEL_OUT}"
echo "make -C ${KERNEL_SRC} O=${KERNEL_OUT} $*"

make -C "${KERNEL_SRC}" O="${KERNEL_OUT}" "$@"