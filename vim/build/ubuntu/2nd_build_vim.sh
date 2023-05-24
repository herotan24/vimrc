#!/bin/sh

export INSTALL_DIR=/usr/local

./configure --with-features=huge \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=${INSTALL_DIR} \

make VIMRUNTIMEDIR=${INSTALL_DIR}/share/vim/vim90
make install

ln -s /usr/local/bin/vim /usr/local/bin/vi
