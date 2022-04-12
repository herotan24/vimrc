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
if has("unix")
  set rtp+=$VIM/vimfiles/bundle/Vundle.vim
  call vundle#begin('$VIM/vimfiles/bundle')
elseif has("win32")
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
  call vundle#begin('$HOME/vimfiles/bundle/')
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'hari-rangarajan/CCTree'
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'vim-scripts/a.vim.git'
"
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/ctrlp.vim'
"
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/TaskList.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"
"Plugin 'vim-scripts/cscope.vim'
"Plugin 'chazy/cscope_maps'
"Plugin 'vim-scripts/project.tar.gz'
"Plugin 'guns/xterm-color-table.vim'
"
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
Plugin 'Yggdroot/LeaderF'
Plugin 'Yggdroot/vim-mark' " mark.vim

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
"nnoremap [q :cprev<CR>
"nnoremap ]q :cnext<CR>
"nnoremap [Q :cfirst<CR>
"nnoremap ]Q :clast<CR>
"
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nnoremap <silent> <C-n>      :NERDTreeToggle<CR>
"nnoremap <silent> <F8>       :TlistToggle<CR>
"nnoremap <silent> <F7>       :TagbarToggle<CR>
"nnoremap          <leader>td :TagbarToggle<CR> :TaskList<CR>
"
" air line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"

"" taglist
"let g:Tlist_Use_Right_Window = 1
"let g:Tlist_Exit_OnlyWindow = 1
"let g:Tlist_GainFocus_On_ToggleOpen = 1
"let g:Tlist_Highlight_Tag_On_BufEnter = 1
"let g:Tlist_Auto_Highlight_Tag = 1
"let g:Tlist_Close_On_Select = 1
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
"
"" 
"" " better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<c-b>"
"" let g:UltiSnipsJumpForwardTrigger = "<tab>"
"" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"
"
set ignorecase
"
set ts=4
set expandtab
"
noremap gf *<C-o>
"
" LeaderF
let g:Lf_ReverseOrder = 1
nnoremap <leader>ff :Leaderf file<CR>
nnoremap <leader>ft :Leaderf tag<CR>
let g:Lf_PreviewResult = {
            \ 'File': 1,
            \ 'Buffer': 1,
            \ 'Mru': 1,
            \ 'Tag': 1,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 1,
            \ 'Colorscheme': 1,
            \ 'Rg': 1,
            \ 'Gtags': 1
            \}
