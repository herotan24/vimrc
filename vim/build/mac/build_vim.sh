#!/bin/sh

export INSTALL_DIR=/usr/local

./configure --with-features=huge \
            --enable-python3interp=yes \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=${INSTALL_DIR} \
            --with-python3-config-dir=/Users/tanyuhua/.pyenv/versions/3.9.6/lib/python3.9/config-3.9-darwin/

# use pyenv to install pythong devel
# pyenv install 3.9.6

make VIMRUNTIMEDIR=${INSTALL_DIR}/share/vim/vim90
make install

rm -rf /usr/local/bin/vi
ln -s /usr/local/bin/vim /usr/local/bin/vi
