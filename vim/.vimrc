set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-smartinput'
Plugin 'mmozuras/vim-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'

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
set wildignore+=*.o,*.obj,*.class,*.so,*.gcda,*.gcov,*.gcno,*.lo,*.la,*.out

set encoding=utf-8
set hlsearch
set incsearch
set visualbell t_vb=
set exrc
nmap <silent> <C-N> :silent noh<CR>

set autoread
set ruler

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

set backspace=indent,eol,start

" these two maps enable you to press space to move cursor down a screen,
" and press backspace up a screen.
map <space> <c-f>
map <backspace> <c-b>

" use - to jump between windows
map - <c-w>w
map _ <c-\>

set complete=.,w,b,u,t,i

set tags+=~/.system.tags

set background=light
colorscheme solarized
set t_Co=256
let g:solarized_termcolors=256

nnoremap <f12> :noh<cr>
nnoremap B ^
nnoremap E $

set smarttab

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:loaded_syntastic_java_javac_checker = 1

let g:syntastic_cpp_compiler_options = ' -std=c++14'

" vim-go
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
"au filetype go inoremap <buffer> . .<C-x><C-o>

" NERDtree
nnoremap <C-g> :NERDTreeToggle<CR>

