"
" nvim/init.vim
"

" Install plugins
call plug#begin()

if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
endif

Plug 'alvan/vim-closetag', { 'for': ['html', 'phtml', 'xhtml'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss'] }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }
Plug 'gluon-lang/vim-gluon', { 'for': 'gluon' }
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'mattn/webapi-vim', { 'for': 'rust' }
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'ron-rs/ron.vim', { 'for': 'ron' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'thyrgle/vim-dyon', { 'for': 'dyon' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'timonv/vim-cargo', { 'for': 'rust' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-surround'
Plug 'troydm/zoomwintab.vim'
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'wannesm/wmgraphviz.vim', { 'for': 'dot' }

call plug#end()

" Enable UTF8 file encoding
set encoding=utf-8
scriptencoding utf-8

" General options
set cursorline
set hidden
set hlsearch
set laststatus=2
set noshowmode
set number

" Enable copying between tmux instances and the system keyboard
set clipboard^=unnamed,unnamedplus

" Enable mouse scrolling in vim instead of tmux history buffer
set mouse=a

" Backup options
set backup
set backupdir=~/.local/share/nvim/backup
set undofile

" Global indentation options
set colorcolumn=80
set expandtab
set shiftwidth=4
set tabstop=4

" Color options
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
syntax on

" Allow transparent background
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi VertSplit ctermbg=NONE guibg=NONE

" Graphical styling
set fillchars+=vert:\│
augroup AutoTerminal
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup end

" Allow leaving embedded terminal with <Esc>
tnoremap <Esc> <C-\><C-n>

" Allow for visual search and replacement of text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Allow for Sublime Text style line reordering
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
inoremap <S-Up> <Esc>:m .-2<CR>==gi
inoremap <S-Down> <Esc>:m .+1<CR>==gi
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" coc.nvim configuration
"
" Language   | Server installation                               | Extension?
" -----------|---------------------------------------------------|------------------
" Bash       | yarn global add bash-language-server              |
" CSS/SCSS   |                                                   | coc-css
" Dockerfile | yarn global add dockerfile-language-server-nodejs |
" Gluon      | cargo install gluon_language-server               |
" HTML       |                                                   | coc-html
" Java       |                                                   | coc-java
" JS/TS      | yarn global add typescript tslint eslint          | coc-tsserver
" JSON       |                                                   | coc-json
" Markdown   | yarn global add markdownlint-cli # diagnostic-ls  |
" Nix        | <install Nix from script/package> # diagnostic-ls |
" Python     |                                                   | coc-python
" Rust       | rustup component add rust-analysis rust-src       | coc-rust-analyzer
" Vimscript  | sudo -H pip install vim-vint # diagnostic-ls      |
" YAML       |                                                   | coc-yaml
"
" Entries marked with `diagnostic-ls` require the `diagnostic-languageserver`
" binary to be accessible in the `$PATH`. To install it, run:
"
"   yarn global add diagnostic-languageserver
"
" This should enable arbitrary linters and syntax checkers to be hooked up as a
" language server to coc.nvim.
set updatetime=300
call coc#add_extension(
    \ 'coc-css',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-rust-analyzer',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-yaml'
\ )

let $NVIM_COC_LOG_LEVEL = 'trace'
let $RUST_LOG = 'nix_language_server=debug,tower_lsp=trace'

" Use tab for trigger completion with characters ahead and navigate
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    call CocAction('doHover')
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)
nnoremap <silent> <F5> :<C-u>CocList<CR>
nnoremap <silent> <M-f> :<C-u>CocCommand rust-analyzer.toggleInlayHints<CR>

inoremap <silent> <expr> <C-space> coc#refresh()

" FZF configuration
augroup AutoFzf
    autocmd! FileType fzf
    autocmd FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    if has('nvim')
        autocmd TermOpen * tnoremap <Esc> <c-\><c-n>
        autocmd FileType fzf tunmap <Esc>
    endif
augroup end

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <C-x><C-k> <plug>(fzf-complete-word)
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-j> <plug>(fzf-complete-file)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir !=# ''
        call fzf#vim#gitfiles(git_dir, fzf#vim#with_preview('right'))
    else
        call fzf#vim#files('.', fzf#vim#with_preview('right'))
    endif
endfunction
command! ProjectFiles execute s:find_files()

nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <C-s> :BLines<CR>

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

" Lightline configuration (requires Powerline-patched font)
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \     'left': [['mode', 'paste'],
    \              ['fugitive', 'filename'],
    \              ['coc_error', 'coc_warning', 'coc_info', 'coc_hint']],
    \     'right': [['lineinfo'],
    \               ['percent'],
    \               ['coc_status', 'fileformat', 'fileencoding', 'filetype']]
    \ },
    \ 'component': {
    \     'lineinfo': ' %3l:%-2v'
    \ },
    \ 'component_function': {
    \     'fugitive': 'MyFugitive',
    \     'readonly': 'MyReadonly',
    \     'modified': 'MyModified',
    \     'filename': 'MyFilename',
    \     'coc_status': 'LightlineCocStatus',
    \ },
    \ 'component_expand': {
    \     'coc_error': 'LightlineCocErrors',
    \     'coc_warning': 'LightlineCocWarnings',
    \     'coc_info': 'LightlineCocInfos',
    \     'coc_hint': 'LightlineCocHints',
    \ },
    \ 'component_type': {
    \     'coc_error': 'error',
    \     'coc_warning': 'warning',
    \     'coc_info': 'tabsel',
    \     'coc_hint': 'middle',
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

" Integrate coc.nvim into Lightline
augroup AutoCoc
    autocmd!
    autocmd User CocDiagnosticChange call lightline#update()
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd FileType list set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
        return ''
    endif
    try
        let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
    catch
        let s = '•'
    endtry
    return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
    return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
    return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
    return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
    return s:lightline_coc_diagnostic('hints', 'hint')
endfunction

function! LightlineCocStatus() abort
    try 
        let status = get(g:, 'coc_status', '')
    catch
        let status = ''
    endtry
    return status
endfunction
