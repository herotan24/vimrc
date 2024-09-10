
# adapter for debuggers to be installed( "!" 用于运行完后保持 log 信息显示 )
:VimspectorInstall! debugpy debugpy-python2 vscode-cpptools vscode-bash-debug CodeLLDB vscode-cpptools
# ***NOTE***: You set --basedir to /Users/tanyuhua/.vim/vimfiles/bundle/vimspector/python3/vimspector/../... Therefore you _must_ ensure this is in your vimrc:
# let g:vimspector_base_dir='/Users/tanyuhua/.vim/vimfiles/bundle/vimspector'

# or use install_gadget.py, 可能需要跟 vim 编译时候用的python版本匹配。
python3 install_gadget.py <args>

# vimrc
See vimspector/support/doc/example_vimrc.vim for a minimal example.

# 设置默认的 gadgets（adapter for debuggers），VimspectorInstall 不需要再带 gadgets
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

# 设置安装路径
let g:vimspector_base_dir=expand( '$HOME/.vim/vimspector-config' )

# VS-like keybindings
# to use Visual Studio-like mappings, add the following to your vimrc before loading vimspector:
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


# so vimrc should be like below
let g:vimspector_base_dir='/Users/tanyuhua/.vim/vimfiles/bundle/vimspector'

# FAQ
1. 远程登录启动的 gdb 可能会有权限问题，如：
lldb-mi a.out
(gdb)
    -file-exec-and-symbols "a.out"
    ^done
    (gdb)
    =library-loaded,id="/Users/tanyuhua/work/leetcodingExercise/a.out",target-name="/Users/tanyuhua/work/leetcodingExercise/a.out",host-name="/Users/tanyuhua/work/leetcodingExercise/a.out",symbols-loaded="1",symbols-path="/Users/tanyuhua/work/leetcodingExercise/a.out.dSYM/Contents/Resources/DWARF/a.out",loaded_addr="-",size="16384"

    r
    &"error: process exited with status -1 (this is a non-interactive debug session, cannot get permission to debug processes.)\n"

解决方案：
现在本地启动 tmux，然后再远程 attach 这个 session
