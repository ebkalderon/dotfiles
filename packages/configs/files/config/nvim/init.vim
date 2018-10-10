"
" nvim/init.vim
"

" Enable UTF8 file encoding
set encoding=utf-8
scriptencoding utf-8

" General options
set cursorline
set fillchars+=vert:\│
set hidden
set hlsearch
set laststatus=2
set noshowmode
set number

" Enable copying between tmux instances
set clipboard^=unnamed

" Enable mouse scrolling in vim instead of tmux history buffer
set mouse=a

" Backup options
set backup
set backupdir=~/.local/share/nvim/backup
set undofile

" Indentation options
set expandtab
set shiftwidth=4
set tabstop=4
set colorcolumn=80
set textwidth=80
augroup AutoIndentation
    autocmd!
    autocmd FileType css,html,scss,sh,yaml setlocal shiftwidth=2 tabstop=2
    autocmd FileType rust setlocal colorcolumn=99 textwidth=99
    autocmd FileType sh setlocal textwidth=0
augroup end

" Color options
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
syntax on

" Allow transparent background
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE

" Install plugins
call plug#begin()

if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
endif

Plug 'alvan/vim-closetag', { 'for': ['html', 'phtml', 'xhtml'] }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'gluon-lang/vim-gluon', { 'for': 'gluon' }
Plug 'itchyny/lightline.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'thyrgle/vim-dyon', { 'for': 'dyon' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'timonv/vim-cargo', { 'for': 'rust' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }

call plug#end()

" FZF configuration
augroup AutoFzf
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <c-p> :FZF .<CR>

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
\ }

let g:fzf_colors = {
    \ 'fg': ['fg', 'Normal'],
    \ 'bg': ['bg', 'Normal'],
    \ 'hl': ['fg', 'Comment'],
    \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+': ['fg', 'Statement'],
    \ 'info': ['fg', 'PreProc'],
    \ 'border': ['fg', 'Ignore'],
    \ 'prompt': ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker': ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header': ['fg', 'Comment']
\ }

" Javacomplete2 configuration
augroup AutoJavacomplete2
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup end

" Deoplete configuration (needs `clang`)
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'

" LanguageClient configuration
"
" Language | Server installation
" ---------|------------------------------------------------------------------
" Python   | sudo pip install python-language-server
" Rust     | rustup component add rls-preview rust-analysis rust-src --toolchain nightly
set hidden

let g:languageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Lightline configuration (requires Powerline-patched font)
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \     'left': [['mode', 'paste'],
    \              ['fugitive', 'filename']],
    \     'right': [['neomake', 'lineinfo'],
    \               ['percent'],
    \               ['fileformat', 'fileencoding', 'filetype']]
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
    \     'neomake': 'neomake#statusline#LoclistStatus'
    \ },
    \ 'component_type': {
    \     'neomake': 'error'
    \ },
    \ 'separator': {
    \     'left': '', 'right': ''
    \ },
    \ 'subseparator': {
    \     'left': '', 'right': ''
    \ }
\ }

function! MyFilename()
    return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' !=# MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
    if &filetype ==# 'help'
        return ''
    elseif &modified
        return '+'
    elseif &modifiable
        return ''
    else
        return ''
    endif
endfunction

function! MyReadonly()
    return &readonly ? '' : ''
endfunction

" Integrate Fugitive into Lightline
function! MyFugitive()
    if exists('*fugitive#head')
        let s:head = fugitive#head()
        return strlen(s:head) ? ' '.s:head : ''
    endif
    return ''
endfunction

" Integrate Neomake into Lightline
augroup AutoNeomake
    autocmd!
    autocmd User NeomakeFinished | call lightline#update()
    autocmd BufWritePost *.* Neomake
augroup end
