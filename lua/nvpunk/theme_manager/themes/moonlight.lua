require'nvpunk.util.try'.call(function()
    vim.g.moonlight_italic_comments = true
    vim.g.moonlight_italic_keywords = true
    vim.g.moonlight_italic_functions = true
    vim.g.moonlight_contrast = true
    vim.g.moonlight_borders = true
    vim.g.moonlight_disable_background = false
    require'moonlight'.set()
    reload'nvpunk.theme_manager.lualine'('moonlight')
end, {}, 'Failed to load theme moonlight', 'nvpunk.theme_manager')
