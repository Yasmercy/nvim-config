return
{
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'simrat39/rust-tools.nvim',
            {
                'folke/neodev.nvim',
                config = true,
            },
            {
                'hrsh7th/cmp-nvim-lsp',
                config = true,
                dependencies = {
                    'williamboman/mason-lspconfig.nvim',
                    config = true,
                    dependencies = {
                        'williamboman/mason.nvim',
                        config = true,
                    },
                },
            },
        },
        config = function()
            -- TODO: fix this to use vim.lsp.buf actions rather than strings
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lsp_attach = function(_, bufnr)
                local bufopts = { buffer = bufnr, remap = false }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

                vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { buffer = bufnr })
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)

                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, bufopts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufopts)

                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, bufopts)

                vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { buffer = bufnr })
                vim.keymap.set('n', '<leader>cl', '<cmd>LspInfo<cr>', { buffer = bufnr })
            end

            local lspconfig = require('lspconfig')
            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_attach
            })
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_attach
            })
            lspconfig.texlab.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_attach
            })
            lspconfig.clangd.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_attach
            })
            lspconfig.pyright.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_attach
            })
        end,
    },
}
