" Custom acm_cpp filetype, which copes cpp filetype + adds additional custom stuff
" ftplugin settings

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" import all settings from cpp filetype
runtime! ftplugin/cpp.vim

set autowriteall          " autowrite always
set clipboard=unnamedplus " register + is essentially equal to register "

" maps
" compile and run
nnoremap <F10> :argdo write<CR><CR>:first<CR>:terminal acm % -o %:r && ./%:r < in<CR>
" only run
nnoremap <F9> :argdo write<CR><CR>:first<CR>:terminal ./%:r < in<CR>
