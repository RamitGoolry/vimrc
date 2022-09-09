require'bufferline'.setup{
    options = {
        mode = 'tabs',  -- only show native tabs, alternative: 'buffers'
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        separator_style = 'thin',  -- slant, thick
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            return not (
                vim.bo[buf_number].filetype == '' or
                vim.bo[buf_number].filetype == 'packer' or
                vim.bo[buf_number].filetype == 'terminal' or
                vim.bo[buf_number].filetype == 'TelescopePrompt' or
                vim.bo[buf_number].filetype == 'alpha' or
                vim.bo[buf_number].filetype == 'NvimTree'
            )
        end,
    }
}
