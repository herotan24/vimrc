#!/bin/sh

export LDFLAGS="-rdynamic"

export INSTALL_DIR=/usr/local

make distclean
./configure --with-features=huge \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=${INSTALL_DIR}

#--enable-pythoninterp=yes \
#--with-python-config-dir=/usr/lib64/python2.7/config/ \

make VIMRUNTIMEDIR=${INSTALL_DIR}/share/vim/vim90 -j2
make install

ln -s /usr/local/bin/vim /usr/local/bin/vi
