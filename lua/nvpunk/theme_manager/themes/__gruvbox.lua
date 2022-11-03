--- Set gruvbox-baby theme with specific style
---@param style 'medium' | 'dark'
return function(style)
    require'nvpunk.util.try'.load_theme('gruvbox-' .. style, function()
        vim.g.gruvbox_baby_background_color = style
        -- vim.g.gruvbox_baby_use_original_palette = true
        vim.g.gruvbox_baby_telescope_theme = 0
        vim.cmd[[colorscheme gruvbox-baby]]
        reload'nvpunk.theme_manager.lualine'('gruvbox-baby')
    end)
end
