require("1337.set")
require("1337.lazy")

--treesitter
require("nvim-treesitter.configs").setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}

-- luasnip
vim.cmd[[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
]]
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/1337/LuaSnip/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config
    -- Enable autotriggered snippets
    enable_autosnippets = true,
    -- Use Tab (or some other key if you prefer) to trigger visual selection
    store_selection_keys = "<Tab>",
})

-- lsp
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').pylsp.setup({})
lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
