#!/bin/bash
#

#Custom Build Script

#
# Copyright © 2016, "Pavu(ZaMaSu)" <pravinchaudharyn@gmail.com>
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#

# Init Script
KERNEL_DIR=$PWD
KERNEL="Image.gz-dtb"
KERN_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
BASE_VER="Codex"
VER="-v1-$(date +"%Y-%m-%d"-%H%M)-"
BUILD_START=$(date +"%s")


# Color Code Script
black='\e[0;30m'        # Black
red='\e[0;31m'          # Red
green='\e[0;32m'        # Green
yellow='\e[0;33m'       # Yellow
blue='\e[0;34m'         # Blue
purple='\e[0;35m'       # Purple
cyan='\e[0;36m'         # Cyan
white='\e[0;37m'        # White
nocol='\033[0m'         # Default

# Tweakable Stuff
export ARCH=arm64
export CROSS_COMPILE=/home/axel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export SUBARCH=arm64
export KBUILD_BUILD_USER="axel"
export KBUILD_BUILD_HOST="codex-bot"


#COMPILATION SCRIPTS
echo -e "${green}"
echo "--------------------------------------------------------"
echo "      Initializing build to compile Ver: $VER    "
echo "--------------------------------------------------------"

echo -e "$yellow***********************************************"
echo "         Creating Output Directory: out      "
echo -e "***********************************************$nocol"

mkdir -p out

echo -e "$red***********************************************"
echo "          Cleaning Up Before Compile          "
echo -e "***********************************************$nocol"

make O=out clean 
make O=out mrproper

echo -e "$yellow***********************************************"
echo "          Initialising DEFCONFIG        "
echo -e "***********************************************$nocol"

make O=out whyred-perf_defconfig

echo -e "$yellow***********************************************"
echo "          Cooking Codex!!        "
echo -e "***********************************************$nocol"

make O=out -j$(nproc --all)

if ! [ -a $ZIMAGE ];
then
echo -e "$Red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi


#BUILD TIME
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$Yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"

