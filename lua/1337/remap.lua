vim.g.mapleader = ";"

vim.cmd [[
    nnoremap <nowait><leader>l :Lexplore <bar> 2windo NetrwC<cr> execute silent  wincmd w<cr>
]]

