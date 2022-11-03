--- Set tokyonight theme with specific style
---@param style 'storm' | 'night' | 'day'
return function(style)
    vim.g.tokyonight_style = style
    vim.g.tokyonight_sidebars = {
        'NvimTree', 'aerial'
    }
    vim.g.tokyonight_dark_sidebar = true
    vim.cmd[[colorscheme tokyonight]]
    reload'nvpunk.theme_manager.lualine'('tokyonight')
end
