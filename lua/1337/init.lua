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
