#!/bin/sh

export LDFLAGS="-rdynamic"

export INSTALL_DIR=/usr/local

./configure --with-features=huge \
            --enable-pythoninterp=no \
            --with-python-config-dir=/usr/lib64/python2.7/config/ \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/local/lib/python3.11/config-3.11-x86_64-linux-gnu \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=${INSTALL_DIR} \

make distclean
make VIMRUNTIMEDIR=${INSTALL_DIR}/share/vim/vim90 -j2
make install

ln -s /usr/local/bin/vim /usr/local/bin/vi
