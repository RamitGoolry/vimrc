require'gitsigns'.setup {
    signs = {
        add = {
            hl = 'GitSignsAdd', text = '▌',
            numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn'
        },
        change = {
            hl = 'GitSignsChange', text = '▌',
            numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'
        },
        delete = {
            hl = 'GitSignsDelete', text = '契',
            numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = {
            hl = 'GitSignsDelete', text = '契',
            numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'
        },
        changedelete = {
            hl = 'GitSignsChange', text = '▌',
            numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'
        },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = require'nvpunk.preferences'.get_small_window_border(),
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}

local km = require'nvpunk.util.keymapper'

km.wk.register({ ['<leader>g'] = { name = ' Git' } }, { mode = 'n' })
km.nkeymap('<leader>gb', '<cmd>Gitsigns blame_line<cr>', ' Blame line')
km.nkeymap('<leader>g]', '<cmd>Gitsigns next_hunk<cr>', ' Next hunk')
km.nkeymap('<leader>g[', '<cmd>Gitsigns prev_hunk<cr>', ' Prev hunk')
km.nkeymap('<leader>g?', '<cmd>Gitsigns preview_hunk<cr>', ' Preview changes')
