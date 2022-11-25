local ignored_filetypes_dict = {}
for _, f in ipairs(require'nvpunk.util.nonfile_buffers') do
    ignored_filetypes_dict[f] = true
end

require'bufferline'.setup{
    options = {
        mode = 'tabs',  -- 'buffers' | 'tabs'
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        -- 'slant' | 'padded_slant' | 'thin' | 'thick'
        separator_style = require'nvpunk.preferences'.get_tab_style(),
        custom_filter = function(buf_number, buf_numbers)
            -- return true if filetype is to be ignored
            return ignored_filetypes_dict[vim.bo[buf_number].filetype] == nil
        end,
    }
}
