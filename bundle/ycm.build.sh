#!/bin/sh

cd ./YouCompleteMe

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
