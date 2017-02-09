"
" personal vimrc 
"
" Maintainer:	herotan24 <yuhua_tan24@sina.com>
" Last change:	2017 Feb 07
"

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
filetype off                  " required before vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'   " to add help file for fugittive, 
                              " run command below
                              " vim -u NONE -c "helptags vim-fugitive/doc" -c q
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/a.vim.git'

Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/taglist.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

call vundle#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
                        " (on the right side of the status line at the bottom)
set showcmd		" display incomplete commands 
                        " (show commands typing in command-mode, or show status
                        " when selecting in visual[block] mode)
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
" set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
" inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

set hlsearch    " highlight the search result
set nu          " print out the line number
colorscheme molokai

" NERDTree git indicator
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "!",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : "»",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "x",
    \ "Clean"     : "o",
    \ "Unknown"   : "*",
    \ }

" key-maps
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" air line
set laststatus=2
let g:airline#extensions#tabline#enable = 1
let g:airline_theme = "badwolf"

" taglist
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Hightlight_On_BufEnter = 1
let g:Tlist_Auto_Highlight_Tag = 1

