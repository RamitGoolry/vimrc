if vim.fn.has('nvim-0.8') == 1 then
    require'winbar'.setup {
        enabled = true,

        show_file_path = false,
        show_symbols = true,

        colors = {
            path = '', -- You can customize colors like #c946fd
            file_name = '',
            symbols = '',
        },

        icons = {
            file_icon_default = '',
            seperator = '>',
            editor_state = '●',
            lock_icon = '',
        },

        exclude_filetype = require'nvpunk.util.nonfile_buffers'
    }
end
