return {
    'vimwiki/vimwiki',
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki/text',
                path_html = '~/vimwiki/html',
                syntax = 'default',
                ext = '.wiki',
                template_path = '~/vimwiki/templates',
                template_ext = '.html',
            },
        }
    end,
}
