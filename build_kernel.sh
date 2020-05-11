#!/bin/bash


OUT_DIR=out

# you should change the "CROSS_COMPILE" to right toolchain path (you downloaded)
# ex)CROSS_COMPILE={android platform directory you downloaded}/android/prebuilt/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=arm-linux-androideabi- KCFLAGS=-mno-android"

export PATH=/home/j6idot/ToolChains/arm-linux-androideabi-4.9/bin:$PATH
export ARCH=arm
export LOCALVERSION=-LiteE_j4corelte_Kernel

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} j4primelte_mea_open_defconfig
make -j64 ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage
