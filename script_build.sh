#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/Rpingat/legacy_script/master/script_build.sh > script_build.sh

username=yourname

# colors
export TERM=xterm

    red=$(tput setaf 1) # red
    grn=$(tput setaf 2) # green
    blu=$(tput setaf 4) # blue
    cya=$(tput setaf 6) # cyan
    txtrst=$(tput sgr0) # Reset

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/$username/ccache
prebuilts/misc/linux-x86/ccache/ccache -M 100G
export KBUILD_BUILD_USER=SeekNDstroy
export KBUILD_BUILD_HOST=ThunderServer

# clean
if [ "$make_clean" = "yes" ];
then
make clean && make clobber
wait
echo -e ${cya}"OUT dir from your repo deleted"${txtrst};
fi

# build
. build/envsetup.sh
lunch aosp_mido-userdebug
make bacon -j6
