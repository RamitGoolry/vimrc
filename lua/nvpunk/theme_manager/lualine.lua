local filename_widget = {
    'filename',
    file_status = true,
    newfile_staus = true,
    path = 0,
    symbols = {
        modified = ' ',
        readonly = ' ',
        unnamed = '[No Name]',
        newfile = ' ',
    }
}

local diagnostics_widget = {
    'diagnostics',
    sources = {'nvim_diagnostic'},
    sections = {'error', 'warn', 'info', 'hint'},
    symbols = {
        error = ' ',
        warn = ' ',
        info = ' ',
    },
}

return function(theme)
    require'lualine'.setup{
        options = {
            theme = theme,
            section_separators = {'', ''},
            component_separators = {'│', '│'}
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = { filename_widget, diagnostics_widget },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { filename_widget, diagnostics_widget },
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {
            'nvim-tree', 'neo-tree'
        }
    }
end
