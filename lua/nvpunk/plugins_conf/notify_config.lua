vim.notify = require'notify'
local notify = vim.notify

vim.notify = function(msg, ...) -- Suppress multiple different encodings warning
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end

local km = require'nvpunk.util.keymapper'
km.wk.register({ ['<leader>n'] = { name = ' Notifications' } }, { mode = 'n' })
km.nkeymap(
    '<leader>nd',
    function() require'notify'.dismiss() end,
    'Dismiss Notifications'
)
km.nkeymap(
    '<leader>nl',
    function() require'telescope'.extensions.notify.notify() end,
    'List Notifications'
)
