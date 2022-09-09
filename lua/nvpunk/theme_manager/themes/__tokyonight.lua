--- Set tokyonight theme with specific style
-- @param style 'storm' | 'night' | 'day'
return function(style)
    require'nvpunk.util.try'.call(function()
        vim.g.tokyonight_style = style
        vim.g.tokyonight_sidebars = {
            'NvimTree'
        }
        vim.g.tokyonight_dark_sidebar = true
        vim.cmd[[colorscheme tokyonight]]
        require'nvpunk.theme_manager.lualine'('tokyonight')
    end,
    {}, 'Failed to load theme tokyonight-' .. style, 'nvpunk.theme_manager')
end
