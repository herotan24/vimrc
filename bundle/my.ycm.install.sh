#!/bin/sh

while true
do
    ./install.py --clangd-completer --go-completer --java-completer --verbose
    if [ $? != 0 ]
    then
        echo "fail"
    else
        echo "ok"
        exit 0
    fi
    sleep 1
done
