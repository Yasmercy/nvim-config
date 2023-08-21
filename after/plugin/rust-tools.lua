local rust_tools = require('rust-tools')
function on_attach(client, bufnr)
    vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { buffer = bufnr })
    vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })

    vim.keymap.set('n', 'gI', '<cmd>Telescope lsp_implementations<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'K', '<cmd>RustHoverActions<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, { buffer = bufnr })

end
rust_tools.setup({
    tools = {

        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            highlight = "Comment"
        }
    },
    server = {on_attach = on_attach, standalone = true}
})
