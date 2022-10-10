vim.notify = require'notify'

local km = require'nvpunk.util.keymapper'
km.wk.register({ ['<leader>n'] = { name = ' Notifications' } }, { mode = 'n' })
km.nkeymap('<leader>nd', '<cmd>lua require"notify".dismiss()<cr>', 'Dismiss Notifications')
km.nkeymap('<leader>nl', '<cmd>Telescope notify<cr>', 'List Notifications')
