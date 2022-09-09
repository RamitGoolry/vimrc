--- Set onedark theme with specific style
-- @param style 'dark' | 'darker' | 'cool' | 'deep' | 'warm' | 'warmer'
return function(style)
    require'nvpunk.util.try'.call(function()
        local t = require'onedark'
        t.setup {
            style = style
        }
        t.load()
        require'nvpunk.theme_manager.lualine'('onedark')
    end, {}, 'Failed to load theme onedark-' .. style, 'nvpunk.theme_manager')
end
