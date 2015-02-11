set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-smartinput'
Plugin 'mmozuras/vim-whitespace'

call vundle#end()


set noswapfile
set showmode
set showcmd
set ignorecase
set smartcase
set showbreak=...
set wrap linebreak nolist
set linespace=4
set showmatch
set number
set laststatus=2

set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.class,*.so,*.gcda

set fileencodings=utf-8
set hlsearch
set incsearch
"set viminfo='20,<50,s10,h
set visualbell t_vb=
set exrc
nmap <silent> <C-N> :silent noh<CR>

inoremap <Nul> <C-x><C-o>

autocmd VimResized * :wincmd = 

filetype plugin indent on
syntax on

set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" press gi followed by a character will insert that character at cursor
map gi i<space><esc>r


" these two maps enable you to press space to move cursor down a screen,
" and press backspace up a screen.
map <space> <c-f>
map <backspace> <c-b>

" use - to jump between windows
map - <c-w>w 
map _ <c-\>

set complete=.,w,b,u,t,i

set tags+=~/.system.tags

colorscheme desert

nnoremap <f12> :noh<cr>

set smarttab

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = ' -std=c++14'
let g:ycm_confirm_extra_conf = 0


