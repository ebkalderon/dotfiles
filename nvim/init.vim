"
" nvim/init.vim
"

" General options
set cursorline
set fillchars+=vert:\│
set hidden
set hlsearch
set laststatus=2
set noshowmode
set number

if &filetype == "rust"
    set colorcolumn=100
else
    set colorcolumn=80
endif

" Backup options
set backup
set backupdir=~/.local/share/nvim/backup
set undofile

" Indentation options
set tabstop=4
set shiftwidth=4
set expandtab

" Color options
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
syntax on

" Allow transparent background
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE

" Called after Deoplete plugin is installed or updated
function! UpdateRemote(arg)
    UpdateRemotePlugins
endfunction

" Install Vundle plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': function('UpdateRemote') }
Plug 'Shougo/neoinclude.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'timonv/vim-cargo', { 'for': 'rust' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'zchee/deoplete-clang'

call plug#end()

" Racer configuration (needs `rustup` and `rust-nightly-src`)
let $RUST_SRC_PATH = "/usr/src/rust/src/"
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Syntastic configuration (needs `clang` and `g++`)
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++ -pedantic'
let g:syntastic_cpp_checkers = [ "clang_check", "gcc" ]
let g:syntastic_cpp_include_dirs = [ '~/Documents/amethyst/include', '/usr/include' ]
let g:syntastic_enable_signs = 1
let g:syntastic_mode_map = { "mode": "active" }

" Deoplete configuration (needs `clang`)
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'

" Lightline configuration (requires Powerline-patched font)
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'fugitive', 'filename' ] ],
    \     'right': [ [ 'syntastic', 'lineinfo' ],
    \                [ 'percent' ],
    \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component': {
    \     'lineinfo': ' %3l:%-2v'
    \ },
    \ 'component_function': {
    \     'fugitive': 'MyFugitive',
    \     'readonly': 'MyReadonly',
    \     'modified': 'MyModified',
    \     'filename': 'MyFilename'
    \ },
    \ 'component_expand': {
    \     'syntastic': 'SyntasticStatuslineFlag'
    \ },
    \ 'component_type': {
    \     'syntastic': 'error'
    \ },
    \ 'separator': {
    \     'left': '', 'right': ''
    \ },
    \ 'subseparator': {
    \     'left': '', 'right': ''
    \ }
\}

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyReadonly()
    return &readonly ? '' : ''
endfunction

" Integrate Fugitive into Lightline
function! MyFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

" Integrate Syntastic into Lightline
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.* call s:syntastic()
augroup end

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

