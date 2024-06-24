#!/bin/sh

# for absl
ABSL_DIR=absl
cp -rf $ABSL_DIR YouCompleteMe/third_party/ycmd/cpp/

# 定义要修改的文件
FILE="YouCompleteMe/third_party/ycmd/cpp/CMakeLists.txt"

# 检查文件是否存在
if [ ! -f "$FILE" ]; then
    echo "Error: 文件 ${FILE} 不存在."
    exit 1
fi

# 替换掉下载 ABSEIL 的操作
# 使用awk处理多行模式匹配和替换，并检查是否有匹配
found=0
awk '
BEGIN { skip = 0 }
/^if \( USE_SYSTEM_ABSEIL \)/ { found=1; print "#"$0; skip = 1; next }
/^endif()/ {
    if (skip) {
        print "#"$0;
        print "add_subdirectory(absl)";
        skip = 0;
        next;
    }
}
{ if (skip) print "#"$0; else print $0 }
END { if (!found) print "NO_MATCH" }
' $FILE > tmpfile

# 检查是否有匹配的内容
if grep -q "NO_MATCH" tmpfile; then
    echo "Error: 未找到匹配的内容。"
    rm tmpfile
    exit 1
else
    mv tmpfile $FILE
    echo "操作完成。"
fi

# for clang
cp libclang-14.0.0-x86_64-unknown-linux-gnu.tar.bz2 ./YouCompleteMe/third_party/ycmd/clang_archives/
