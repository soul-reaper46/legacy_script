#! /bin/bash

#curl https://raw.githubusercontent.com/Rpingat/legacy_script/master/thunder.sh > script_build.sh

export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/ravi
prebuilts/misc/linux-x86/ccache/ccache -M 50G
wait
. build/envsetup.sh
wait
lunch thunder_lettuce-userdebug
wait
#ccache -c
wait
make clean&&make clobber
export KBUILD_BUILD_USER=SeekNDstroy
export KBUILD_BUILD_HOST=ThunderBuildBot
rm -rf out -j4

make bacon -j8
