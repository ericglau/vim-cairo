" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Initialize plugin system
call plug#end()

au BufReadPost *.cairo set filetype=cairo
au Filetype cairo set syntax=cairo

let g:LanguageClient_serverCommands = {
\ 'cairo': ['node', '~/.vim/cairo-ls/server/out/server.js', '--stdio']
                        \ }

let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile =  expand('~/.vim/cairo-ls/cairo-language-client.log')
let g:LanguageClient_serverStderr = expand('~/.vim/cairo-ls/cairo-language-server.log')

nnoremap <silent> <F4> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_definition()<CR>
