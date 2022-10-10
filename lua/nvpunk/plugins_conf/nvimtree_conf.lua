require'nvim-tree'.setup {
    disable_netrw = true,
    -- autoclose when it's the last window
    -- auto_close = true,
    -- open_on_tab = true,
    hijack_cursor = false,
    update_cwd = true,
    -- show diagnostics in file view
    diagnostics = {
        enable = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    system_open = {
        cmd = 'xdg-open',
        args = {}
    },
    renderer = {
        indent_markers = {
            enable = false
        },
        highlight_git = true,
        icons = {
            show = {
                folder_arrow = true,
                folder = true,
                file = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                git = {
                    unstaged = '',
                    staged = '',
                    unmerged = '',
                    renamed = '➜',
                    deleted = '',
                    untracked = '',
                    ignored = '◌',
                },
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                }
            }
        }
    },
    view = {
        mappings = {
            list = {
                { key = {'<CR>', '<2-LeftMouse>'}, action = 'edit' },
                { key = 'i', action = 'split' },
                { key = 's', action = 'vsplit' },
                { key = 'r', action = 'refresh' },
                { key = 'yy', action = 'copy_name' },
                { key = 'gy', action = 'copy_absolute_path' },
                { key = '<space>fyy', action = 'copy' },
                { key = '<space>fp', action = 'paste' },
                { key = '^', action = 'dir_up' },
                { key = '?', action = 'toggle_help' },
                { key = 't', action = 'tabnew' },
                { key = '<F2>', action = 'rename' },
                { key = '<space>xo', action = 'system_open' },
                { key = '<C-h>', action = 'toggle_git_ignored' },
                { key = '<space>fn', action = 'create' },
                -- preview opens the file keeping the cursor in the tree,
                -- not very useful
                -- { key = '<space>P', action = 'preview' }
            },
            custom_only = true
        },
        number = false, relativenumber = false,
        signcolumn = 'yes'
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                exclude = {
                    filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                    buftype = { 'nofile', 'terminal', 'help' },
                },
            },
        }
    }
}

local km = require'nvpunk.util.keymapper'
km.nkeymap('ge', '<cmd>NvimTreeToggle<CR>', 'פּ Toggle Explorer')

-- register shortcuts with whichkey
-- enable when this (vvv) gets solved and restrict to the NvimTree type
-- https://github.com/folke/which-key.nvim/issues/281
-- local wk = require'which-key'
-- wk.register({ ['<space>xo'] = { name = 'Open…' } }, { mode = 'n' })
-- -- wk.register({ ['<space>P'] = { name = ' Preview' } }, { mode = 'n' })
-- wk.register({ ['<space>f'] = { name = 'File Operations' } }, { mode = 'n' })
-- wk.register({ ['<space>fyy'] = { name = ' Copy File' } }, { mode = 'n' })
-- wk.register({ ['<space>fp'] = { name = ' Paste File' } }, { mode = 'n' })
