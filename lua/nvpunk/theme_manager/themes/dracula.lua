require'nvpunk.util.try'.call(function()
    require'dracula'.setup {
        italic_comment = true
    }
    vim.cmd[[colorscheme dracula]]
    reload'nvpunk.theme_manager.lualine'('dracula-nvim')
end, {}, 'Failed to load theme dracula', 'nvpunk.theme_manager')
