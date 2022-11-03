--- Set onedark theme with specific style
---@param style 'dark' | 'darker' | 'cool' | 'deep' | 'warm' | 'warmer'
return function(style)
    require'nvpunk.util.try'.load_theme('onedark-' .. style, function()
        local t = require'onedark'
        t.setup {
            style = style
        }
        t.load()
        reload'nvpunk.theme_manager.lualine'('onedark')
    end)
end
