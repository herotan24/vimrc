set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" cfg of common
 set nu

" cfg of tab
 set autoindent
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set expandtab

" cfg of voice"
 set noeb
 set vb

" NERDTree setting 
"
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" open NERDTree on startup, and have my cursor start in the other window
" autocmd vimenter * wincmd p
" open a NERDTree automatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

 " Colour Scheme
 colorscheme desert
