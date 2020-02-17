"
" nvim/ftdetect/jinja.tera.vim
"

" Open *.tera documents with Jinja2 syntax.
augroup AutoTera
  autocmd!
  autocmd BufNewFile,BufRead *.tera set syntax=jinja
augroup end
