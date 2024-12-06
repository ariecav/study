echo"Nvim start from arie"
set relativenumber
set tabstop=2
syntax on
set clipboard=unnamedplus

lua require('arie.remap')
lua require('arie.set')
lua require('arie.packer')
autocmd BufNewFile,BufRead *.ejs set filetype=html

let g:clipboard = {
    \ 'name': 'win32yank-wsl',
    \ 'copy': {
        \ '+': 'win32yank.exe -i --crlf',
        \ '*': 'win32yank.exe -i --crlf',
    \ },
    \ 'paste': {
        \ '+': 'win32yank.exe -o --lf',
        \ '*': 'win32yank.exe -o --lf',
    \ },
    \ 'cache_enabled': 0,
\ }
