#!/bin/sh

sys_vim_path=/usr/share/vim
sys_vim_files=$sys_vim_path/vimfiles
sys_vim_vimrc=$sys_vim_path/vimrc

if [ -d $sys_vim_files ]
then
    echo "backuping $sys_vim_files"
    mv $sys_vim_files $sys_vim_files.$$$$
fi

if [ -f $sys_vim_vimrc ]
then
    echo "backuping $sys_vim_vimrc"
    mv $sys_vim_vimrc $sys_vim_vimrc.$$$$
fi

ln -s `pwd` $sys_vim_files
ln -s `pwd`/vimrc $sys_vim_vimrc
