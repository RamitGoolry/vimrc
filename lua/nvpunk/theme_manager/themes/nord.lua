require'nvpunk.util.try'.call(function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_italic = true
    require'nord'.set()
    reload'nvpunk.theme_manager.lualine'('nord')
end, {}, 'Failed to load theme nord', 'nvpunk.theme_manager')
