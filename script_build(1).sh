#! /bin/bash

export USE_CCACHE=1
export CCACHE_DIR=/home/tacoscanterbury
prebuilts/misc/linux-x86/ccache/ccache -M 50G
wait
. build/envsetup.sh
wait
lunch cm_device-userdebug
wait
#ccache -c
wait
make clean&&make clobber
export KBUILD_BUILD_USER=
export KBUILD_BUILD_HOST=StayXtreme
rm -rf out -j4

make bacon -j8