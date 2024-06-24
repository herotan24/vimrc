#!/bin/bash

# 递归函数来遍历子模块
function recurse_submodules {
    local path=$1
    # 对当前路径执行 git clean
    git -C "$path" clean -f -d
    echo "Cleaned $path"

    # 获取所有子模块的路径
    local submodules=($(git -C "$path" config --file .gitmodules --get-regexp path | awk '{ print $2 }'))
    for submodule in "${submodules[@]}"; do
        # 对每一个子模块递归调用此函数
        recurse_submodules "$path/$submodule"
    done
}

# 从仓库根目录开始
cd ..

# 开始执行脚本的主入口点，从当前目录开始
recurse_submodules .

