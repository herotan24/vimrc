#!/bin/bash

TARGET_SOFT=`dpkg -l | grep vim | awk '{print $2}' `
echo 'original software to be uninstall:' 
echo $TARGET_SOFT
apt remove $TARGET_SOFT

apt-get install libncurses5-dev
