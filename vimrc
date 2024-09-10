"
" personal vimrc 
"
" Maintainer:	herotan24 <yuhua_tan24@sina.com>
" Last change:  2022-01-09

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" for vundle configuration
" required before vundle
filetype off

" set the runtime path to include Vundle and initialize
if has("mac")
  set rtp+=~/.vim/vimfiles/bundle/Vundle.vim
  call vundle#begin('~/.vim/vimfiles/bundle')
elseif has("unix")
  set rtp+=~/.vim/vimfiles/bundle/Vundle.vim
  call vundle#begin('~/.vim/vimfiles/bundle')
elseif has("win32")
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
  call vundle#begin('$HOME/vimfiles/bundle/')
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'hari-rangarajan/CCTree'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/a.vim.git'
"
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'wenlongche/SrcExpl'
"
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"
"
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
Plugin 'Yggdroot/LeaderF'
Plugin 'Yggdroot/vim-mark' " mark.vim
Plugin 'vim-scripts/TagHighlight'

Plugin 'WolfgangMehner/bash-support'
Plugin 'Exafunction/codeium.vim'
Plugin 'puremourning/vimspector'

call vundle#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200     " keep 200 lines of command line history
set ruler           " show the cursor position all the time
                    " (on the right side of the status line at the bottom)
set showcmd         " display incomplete commands 
                    " (show commands typing in command-mode, or show status
                    " when selecting in visual[block] mode)
set wildmenu        " display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" 当一行内容显示超过窗口宽度时，不换行显示
set nowrap

" 实时搜索
if has('reltime')
  set incsearch
endif

" 高亮搜索结果
set hlsearch    " highlight the search result

" 显示行号
set nu 

" Ctrl-A 和 Ctrl-X 的操作排除八进制数（通常大部分使用者不关注八进制数）
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" 使能鼠标模式(all，包括n, v, i, c, h,)
if has('mouse')
  set mouse=a
endif

colorscheme molokai
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  let c_curly_error=1
endif


"let NERDTreeDirArrowExpandable = "+"
"let NERDTreeDirArrowCollapsible = "-"
"
"" NERDTree git indicator
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "!",
"    \ "Staged"    : "+",
"    \ "Untracked" : "?",
"    \ "Renamed"   : ">",
"    \ "Unmerged"  : "=",
"    \ "Deleted"   : "-",
"    \ "Dirty"     : "x",
"    \ "Clean"     : "o",
"    \ "Unknown"   : "*",
"    \ }
"
"" key-maps
nnoremap <F9> :cprev<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <F10> :cnext<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <leader><F9> :cfirst<CR>
nnoremap <leader><F10> :cfirst<CR>
"
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nnoremap <silent> <C-n>      :NERDTreeToggle<CR>
"nnoremap <silent> <F7>       :TagbarToggle<CR>
"nnoremap          <leader>td :TagbarToggle<CR> :TaskList<CR>
"
" air line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"

" taglist
nnoremap <silent> <F8>       :TlistToggle<CR>
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Highlight_Tag_On_BufEnter = 1
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Close_On_Select = 1
let g:Tlist_Show_Menu=1
let g:Tlist_Show_One_File=1
let g:Tlist_Auto_Update=1
if has("mac")
    let g:Tlist_Ctags_Cmd="/opt/homebrew/bin/ctags"
elseif has("unix")
    let g:Tlist_Ctags_Cmd="/usr/bin/ctags"
elseif has("win32")
    let g:Tlist_Ctags_Cmd="ctags.exe"
endif
let g:Tlist_Display_Prototype=0
let g:Tlist_Display_Tag_Scope=1

" SrcExpl
" // The switch of the Source Explorer 
nmap <F7> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins except
" // itself are using buffers. And you need add their buffer names into below list
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" // The color schemes used by Source Explorer. There are five color schemes
" // supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" // will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [
        \ "Red",
        \ "Cyan",
        \ "Green",
        \ "Yellow",
        \ "Magenta"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 0

" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F11>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F12>" 




"
"" ctrlp.vim
"" Change the default mapping and the default command to invoke CtrlP:
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"""
""" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
"let g:ctrlp_working_path_mode = 'c'
"" 'c' - the directory of the current file.
"" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
"" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
""  0 or '' (empty string) - disable this feature.
""
"" Define additional root markers with the g:ctrlp_root_markers option.
""
"" exclude files and directories using Vim's wildignore and CtrlP's own
"" g:ctrlp_custom_ignore:
"if has('win32')
"	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"elseif has('unix') 
"	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"elseif has('mac')
"	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"endif
""let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
""
"" Use a custom file listing command:
"" if has('win32')
"" 	let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"" elseif has('unix') 
"" 	let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"" elseif has('mac')
"" 	let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"" endif
"
"" make YCM compatible with UltiSnips (using supertab)
"" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"" let g:SuperTabDefaultCompletionType = '<C-n>'
"if has('Win32')
"	let g:ycm_global_ycm_extra_conf = 'C:\Users\Administrator\vimfiles\.ycm_extra_conf.py'
"else
"	let g:ycm_global_ycm_extra_conf = '$VIM/vimfiles/.ycm_extra_conf.py'
"endif
if has("mac")
  let g:ycm_global_ycm_extra_conf = '$HOME/.vim/vimfiles/.ycm_extra_conf.py'
elseif has('unix') 
  let g:ycm_global_ycm_extra_conf = '~/.vim/vimfiles/.ycm_extra_conf.py'
endif

set keywordprg=man\ 3

"" 
"" " better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<c-b>"
"" let g:UltiSnipsJumpForwardTrigger = "<tab>"
"" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"
"
set ignorecase
"
"
noremap gf *<C-o>
"
if has("cscope")
    "set csprg=/usr/bin/cscope
    set csto=0 " use cscope data base first
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    nnoremap <leader>csa :cs find a <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>csf :cs find f <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>csi :cs find i <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>

    nnoremap <leader>cso :cs add cscope.out<CR>
    nnoremap <leader>csk :cs kill cscope.out<CR>

    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
endif

" LeaderF
let g:Lf_ReverseOrder = 1
let g:Lf_WildIgnore = {
                        \ 'dir' : ['.svn', '.git'],
                        \ 'file' : ['*.o', '*.ko']
                        \}
nnoremap <leader>ff :Leaderf file<CR>
nnoremap <leader>ft :Leaderf tag<CR>
"let g:Lf_PreviewResult = {
"            \ 'File': 1,
"            \ 'Buffer': 1,
"            \ 'Mru': 1,
"            \ 'Tag': 1,
"            \ 'BufTag': 1,
"            \ 'Function': 1,
"            \ 'Line': 1,
"            \ 'Colorscheme': 1,
"            \ 'Rg': 1,
"            \ 'Gtags': 1
"            \}

hi GlobalVariable cterm=NONE ctermfg=Brown
hi Member cterm=NONE ctermfg=Green
hi DefinedName cterm=NONE ctermfg=LightGray

"让vim记忆上次编辑的位置
autocmd BufReadPost *
           \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif
"让vim记忆上次编辑的位置

" for vim-mark
nnoremap <leader>n :MarkClear<CR>

" for tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent
set smartindent
set autoindent
set expandtab

vmap <leader>fc :!clang-format -style=file<CR>
nmap <leader>fc ggvG<leader>fc<C-o><C-o>

"YCM
"let g:ycm_auto_trigger = 0
imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)
let g:ycm_enable_semantic_highlighting=1
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>ygd :YcmCompleter GoTo<CR>
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ygt :YcmCompleter GoToType<CR>
nnoremap <leader>ygcr :YcmCompleter GoToCallers<CR>
let g:ycm_use_clangd=1
let g:ycm_auto_hover='None'
set completeopt=menuone,menu
" let g:ycm_confirm_extra_conf = 0

set guifont=Monaco:h14

" file format
nnoremap <leader>jfmt <Esc>:%!python3 -m json.tool<CR>

nnoremap <leader>vgrep <Esc>:vimgrep /<C-R>=expand("<cword>")<CR>/ **/* <CR>

" codium
" 关闭自动提示
let g:codeium_manual = v:true
" You might want to use `CycleOrComplete()` instead of `CycleCompletions(1)`.
" This will make the forward cycling of suggestions also trigger the first
" suggestion manually.
" 设置提示快捷键
inoremap <C-l> <Cmd>call codeium#CycleOrComplete()<CR>
inoremap <C-j> <Plug>(codeium-next)
inoremap <C-k> <Plug>(codeium-previous)

" vimspector
let g:vimspector_base_dir=expand('$HOME/.vim/vimfiles/bundle/vimspector')
packadd! vimspector
syntax enable
" filetype plugin indent on " already enabled
" key bindings for vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" nnoremap <Leader>dl <Plug>VimspectorLaunch
" nnoremap <Leader>dl :wa<CR>:call vimspector#LaunchWithSettings({'configuration': 'cpptools'})<CR>
nnoremap <Leader>dl :wa<CR>:call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
" nnoremap <leader>dll :call vimspector#LaunchWithSettings('cpptools')<CR>
nnoremap <Leader>dc <Plug>VimspectorContinue
nnoremap <Leader>ds <Plug>VimspectorStop
nnoremap <Leader>dr <Plug>VimspectorRestart
nnoremap <Leader>dp <Plug>VimspectorPause

nnoremap <Leader>dbw <Plug>VimspectorBreakpoints
nnoremap <Leader>dbl <Plug>VimspectorToggleBreakpoint
nnoremap <Leader>dbc <Plug>VimspectorToggleConditionalBreakpoint
nnoremap <Leader>dbf <Plug>VimspectorAddFunctionBreakpoint

nnoremap <Leader>dgc <Plug>VimspectorGoToCurrentLine
nnoremap <Leader>drc <Plug>VimspectorRunToCursor

nnoremap <Leader>dn <Plug>VimspectorStepOver
nnoremap <Leader>di <Plug>VimspectorStepInto
nnoremap <Leader>do <Plug>VimspectorStepOut
nnoremap <Leader>dn <Plug>VimspectorStepOver
nnoremap <Leader>di <Plug>VimspectorStepInto
nnoremap <Leader>do <Plug>VimspectorStepOut
nnoremap <Leader>dd <Plug>VimspectorDisassemble

nnoremap <Leader>duf <Plug>VimspectorUpFrame
nnoremap <Leader>ddf <Plug>VimspectorDownFrame

nnoremap <Leader>djnb <Plug>VimspectorJumpToNextBreakpoint
nnoremap <Leader>djpb <Plug>VimspectorJumpToPreviousBreakpoint
nnoremap <Leader>djpc <Plug>VimspectorJumpToProgramCounter

" 查看变量
highlight VimspectorBalloonEval guifg=white guibg=navy
nnoremap <Leader>dv <Plug>VimspectorBalloonEval
" 查看内存，需要光标处于有效地址位置
nnoremap <Leader>dm :call vimspector#ReadMemory() <CR>
" 添加表达式
nnoremap <Leader>dw :call vimspector#AddWatch(expand('<cword>'))<CR>
vnoremap <Leader>dw "zy:call vimspector#AddWatch(@z)<CR>

let g:ycm_semantic_triggers =  { 'VimspectorPrompt': [ '.', '->', ':', '<' ] }
