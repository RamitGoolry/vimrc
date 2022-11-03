require'nvpunk.util.try'.load_theme('barstrata', function()
    vim.cmd'colorscheme barstrata'
    reload'nvpunk.theme_manager.lualine'('barstrata')
end)
