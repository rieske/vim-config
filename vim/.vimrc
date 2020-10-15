set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'kana/vim-smartinput'
Plugin 'mmozuras/vim-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/a.vim' " switch between .h and .c

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

Plugin 'udalov/kotlin-vim'

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

set backspace=indent,eol,start

" these two maps enable you to press space to move cursor down a screen,
" and press backspace up a screen.
map <space> <c-f>
map <backspace> <c-b>

" use - to jump between windows
map - <c-w>w
map _ <c-\>

set complete=.,w,b,u,t,i
set completeopt=menu,popup

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
set statusline+=%*
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-go
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
let g:go_doc_popup_window = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
"au filetype go inoremap <buffer> . .<C-x><C-o>

" NERDtree

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

"Switch between different windows by their direction`
no <C-j> <C-w>j| "switching to below window
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window
no <C-h> <C-w>h| "switching to left window

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction

nnoremap <C-g> :call ToggleNerdTree()<CR>

" LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f1> <plug>(lsp-document-diagnostics)
    nmap <buffer> <s-k> <plug>(lsp-hover)
    nmap <buffer> <f6> <plug>(lsp-rename)
    nmap <buffer> <f7> <plug>(lsp-references)
    nmap <buffer> <f8> <plug>(lsp-implementation)
    " refer to doc to add more commands
endfunction

let g:lsp_highlight_references_enabled = 1
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

let g:lsp_settings = {
            \    'clangd': {'cmd': ['clangd', '-cross-file-rename']}
\}
