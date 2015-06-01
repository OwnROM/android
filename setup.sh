#!/bin/bash
clear
echo Installing Dependencies!
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-6-jre openjdk-6-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib openjdk-7-jdk android-tools-* liblz4-*
y
clear
echo Dependencies have been installed
echo Downloading repo
mkdir ~/bin
export PATH=~/bin:$PATH >> ~/.bashrc
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
clear
echo repo has been Downloaded!
sleep 3
clear
echo Where do you want to initialize OwnROM source? Enter the desired directory name similar to this:
echo " /home/$USER/OwnROM or /media/$USER/yourdrive/OwnROM"
read ownpath
echo Initializing RR Source at $ownpath in 1...
sleep 1
mkdir -p $ownpath
cd $ownpath
repo init -u https://github.com/OwnROM/android
echo OwnROM Source Code has been initialized!
echo Starting Source Download...
sleep 3
        echo Enter number of jobs to repo sync with.
        repo sync -j$jobs
        clear
                echo How much CCache do you want to utilize?
                echo If you dont want CCache or are not sure, type 0
                read ccsize
                echo Enter path to directory you want to use for ccache.
                echo Something like /home/$USER/.ccache
                read ccpath
                export USE_CCACHE=1 >> ~/.bashrc
                export CCACHE_DIR=$ccpath >> ~/.bashrc
                prebuilts/misc/linux-x86/ccache/ccache -M $ccsize
        echo Choose device from lunch menu
	lunch
	time mka ownrom
