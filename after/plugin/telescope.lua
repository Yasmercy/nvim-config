require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {

      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"

      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {

    --   picker_config_key = value,

    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local builtin = require('telescope.builtin')
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>ff',
    [[<Cmd>:silent Telescope find_files<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fr',
    [[<Cmd>:silent Telescope oldfiles<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fb',
    [[<Cmd>:silent Telescope buffers<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fi',
    [[<Cmd>:silent Telescope lsp_references<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fd',
    [[<Cmd>:silent Telescope lsp_definitions<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fz',
    [[<Cmd>:silent Telescope current_buffer_fuzzy_find<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>fs',
    [[<Cmd>:silent Telescope lsp_dynamic_workspace_symbols<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '<leader>ft',
    [[<Cmd>:silent Telescope treesitter<CR>]],
    kopts)
