--- Set nightfox theme with specific style
---@param style 'nightfox' | 'dayfox' | 'dawnfox' | 'duskfox' | 'nordfox' | 'terafox' | 'carbonfox'
return function(style)
    require'nvpunk.util.try'.call(function()
        require('nightfox').setup {
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath('cache') .. '/nightfox-' .. style,
                compile_file_suffix = '_compiled',  -- Compiled file suffix
                transparent = false, -- Disable setting background
                terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = true,  -- Non focused panes set to alternative background
                styles = {              -- Style to be applied to different syntax groups
                    comments = 'italic',    -- Value is any valid attr-list value `:help attr-list`
                    conditionals = 'NONE',
                    constants = 'bold',
                    functions = 'NONE',
                    keywords = 'NONE',
                    numbers = 'NONE',
                    operators = 'NONE',
                    strings = 'NONE',
                    types = 'NONE',
                    variables = 'NONE',
                },
                inverse = {  -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = {  -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {},
            specs = {},
            groups = {},
        }
        vim.cmd('colorscheme ' .. style)
        require'nvpunk.theme_manager.lualine'(style)
    end,
    {}, 'Failed to load theme nightfox-' .. style, 'nvpunk.theme_manager')
end
