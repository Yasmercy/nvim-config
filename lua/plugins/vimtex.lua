return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
        vim.g.tex_conceal = 'abdmg'
        vim.g.vimtex_toc_config = {
            name = 'ToC',
            layers = { 'content', 'todo', 'include' },
            show_help = false
        }
    end
}
