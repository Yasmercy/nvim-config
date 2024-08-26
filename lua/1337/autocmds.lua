vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.c0" },
    callback = function()
        vim.cmd [[setfiletype c]]
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})

vim.api.nvim_create_autocmd({ "BufWrite" }, {
    pattern = { "*.c0" },
    callback = function()
        vim.cmd [[LspStop]]
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = vim.lsp.buf.format
})
