#!/bin/bash

./configure --with-features=huge \
            --enable-pythoninterp \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=/usr/local \

make VIMRUNTIMEDIR=/usr/share/vim/vim80
make install

ln -s /usr/local/bin/vim /usr/local/bin/vi
