#!/bin/sh

cd ./YouCompleteMe

# use pyenv to install pythong devel
# pyenv install 3.8.19
# 然后在需要编译的路径配置 python
# pyenv local 3.8.19
# 编译 vim 的时候同样需要

while true
do
    #./install.py --clangd-completer --go-completer --java-completer --verbose
    ./install.py --clangd-completer --verbose --force-sudo
    if [ $? != 0 ]
    then
        echo "fail"
    else
        echo "ok"
        exit 0
    fi
    sleep 1
done

cd -
