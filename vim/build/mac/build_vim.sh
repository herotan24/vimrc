#!/bin/sh

export INSTALL_DIR=/usr/local

./configure --with-features=huge \
            --enable-python3interp=yes \
            --enable-gui=auto \
            --enable-cscope \
            --enable-multibyte \
            --prefix=${INSTALL_DIR} \
            --with-python3-config-dir=/Users/tanyuhua/.pyenv/versions/3.8.19/lib/python3.8/config-3.8-darwin

            #--with-python3-config-dir=/opt/homebrew/opt/python@3.12/Frameworks/Python.framework/Versions/3.12/lib/python3.12/config-3.12-darwin

# use pyenv to install pythong devel
# pyenv install 3.8.19
# 然后在需要编译的路径配置 python
# pyenv local 3.8.19
# 编译 Ycm 的时候同样需要

make VIMRUNTIMEDIR=${INSTALL_DIR}/share/vim/vim90 -j
make -j install

# 如果出现 YouCompleteMe unavailable: dlopen(/Users/tanyuhua/.pyenv/versions/3.8.19/lib/python3.8/lib-dynload/_socket.cpython-38-darwin.so, 0x0002): symbol not found in flat namespace '_PyByteArray_Type'
# 尝试重拷贝 /usr/local/bin/vim (make install 中有 strips 操作)
cp -rf ./src/vim /usr/local/bin/vim

ln -sf /usr/local/bin/vim /usr/local/bin/vi
