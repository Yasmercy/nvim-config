local rust_tools = require('rust-tools')
function attach(client, bufnr)
    local bufopts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, bufopts)
    vim.keymap.set("n", "<leader>vd",
        function() vim.diagnostic.open_float() end, bufopts)

    vim.keymap.set("n", "<leader>vws",
        function() vim.lsp.buf.workleader_symbol() end, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
        bufopts)

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, bufopts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { buffer = bufnr })
    vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<cr>', { buffer = bufnr })

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
    server = { on_attach = attach, standalone = true }
})

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')
lspconfig.kotlin_language_server.setup({ on_attach = attach})
lspconfig.lua_ls.setup({ on_attach = attach })
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        attach(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
    end
})


require("clangd_extensions").setup({
    inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100
    }
})
