local ignored_filetypes = {
    '',
    'packer',
    'TelescopePrompt',
    'alpha',
    'NvimTree',
}

local ignored_filetypes_dict = {}
for _, f in ipairs(ignored_filetypes) do
    ignored_filetypes_dict[f] = true
end

require'bufferline'.setup{
    options = {
        mode = 'tabs',  -- 'buffers' | 'tabs'
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        separator_style = 'slant',  -- 'thin' | 'thick' | 'slant'
        custom_filter = function(buf_number, buf_numbers)
            -- return true if filetype is to be ignored
            return ignored_filetypes_dict[vim.bo[buf_number].filetype] == nil
        end,
    }
}
