
# 外网安装方法：
sh ycm.build.sh

# 内网安装方法：适用于无法直接访问外网环境，但需要其他机器可以访问外网，辅助下载必要文件
#
# 在有外网权限的机器上
# 1. 执行下载脚本
sh ycm.in.net.install.1st.manual.download.sh
# 
# 内网机器上
# 2. 清理子模块配置（如果外网机器是 mac，内网机器是 linux，需要执行这一部）
sh ycm.in.net.install.2nd.clean.submodules.sh
# 3. 将手动下载的文件拷贝到指定目录，同时修改必要的脚本（删除自动下载部分）
sh ycm.in.net.install.3rd.use.local.dowloads.sh


