--- Set rose pine theme with specific style
---@param style 'main' | 'moon' | 'dawn'
return function(style)
    if style == 'dawn' then
        vim.o.background = 'light'
        style = 'main'
    else
        vim.o.background = 'dark'
    end
    require'nvpunk.util.try'.call(function()
        local t = require'rose-pine'
        t.setup {
            dark_variant = style,
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = false,
        }
        vim.cmd'colorscheme rose-pine'
        reload'nvpunk.theme_manager.lualine'('auto')
    end, {}, 'Failed to load theme onedark-' .. style, 'nvpunk.theme_manager')
end
