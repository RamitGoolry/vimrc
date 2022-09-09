--- Set gruvbox-baby theme with specific style
-- @param style 'medium' | 'dark'
return function(style)
    require'nvpunk.util.try'.call(function()
        vim.g.gruvbox_baby_background_color = style
        -- vim.g.gruvbox_baby_use_original_palette = true
        vim.g.gruvbox_baby_telescope_theme = 0
        vim.cmd[[colorscheme gruvbox-baby]]
        require'nvpunk.theme_manager.lualine'('gruvbox-baby')
    end,
    {}, 'Failed to load theme tokyonight-' .. style, 'nvpunk.theme_manager')
end
