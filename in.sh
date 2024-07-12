#!/bin/sh


INSTALL_PATH=~/.vim
INSTALL_VIMFILES_PATH=$INSTALL_PATH/vimfiles
INSTALL_VIMRC_PATH=$INSTALL_PATH/vimrc
SOURCE_DIR=$(cd `dirname $0`; pwd)

mkdir -p $INSTALL_PATH

if [ -d $INSTALL_VIMFILES_PATH ]
then
    echo "backuping $INSTALL_VIMFILES_PATH"
    mv $INSTALL_VIMFILES_PATH $INSTALL_VIMFILES_PATH.$$$$
fi

if [ -f $INSTALL_VIMRC_PATH ]
then
    echo "backuping $INSTALL_VIMRC_PATH"
    mv $INSTALL_VIMRC_PATH $INSTALL_VIMRC_PATH.$$$$
fi

ln -s $SOURCE_DIR $INSTALL_VIMFILES_PATH
ln -s $SOURCE_DIR/vimrc $INSTALL_VIMRC_PATH

# for vimspector
mkdir -p $INSTALL_PATH/pack/plugins/opt
ln -sf $INSTALL_PATH/vimfiles/bundle/vimspector $INSTALL_PATH/pack/plugins/opt/vimspector
