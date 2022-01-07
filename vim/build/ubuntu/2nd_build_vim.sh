#!/bin/bash

./configure --with-features=huge \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=/usr/local \

make VIMRUNTIMEDIR=/usr/share/vim/vim80
make install

ln -s /usr/local/bin/vim /usr/local/bin/vi
