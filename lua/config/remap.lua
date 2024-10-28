vim.g.mapleader = ";"

vim.keymap.set('n', '<leader>sv', ':silent !pdflatex main.tex<cr>')
vim.keymap.set('n', '<leader>za', ':silent !zathura main.pdf&<cr>')
