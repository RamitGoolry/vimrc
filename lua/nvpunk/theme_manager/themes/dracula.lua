require'nvpunk.util.try'.load_theme('dracula', function()
    require'dracula'.setup {
        italic_comment = true
    }
    vim.cmd[[colorscheme dracula]]
    reload'nvpunk.theme_manager.lualine'('dracula-nvim')
end)
