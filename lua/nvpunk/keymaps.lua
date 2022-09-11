-- lsp/buffer specific keymaps in lsp/keymaps.lua

local km = require'nvpunk.util.keymapper'

----------
---------- Leader
----------

--Remap space as leader key
km.keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------
---------- Personal shortcuts
----------

require'nvpunk.util.keymapper'.nkeymap('<leader>A', '<CMD>Alpha<CR>', ' Open Greeter')

-- Alt ^ wraps selection in <sup>whatever</sup>
-- Alt _ wraps selection in <sub>whatever</sub>
-- km.vkeymap('<A-^>', 'c<sup><Esc>pa</sup><Esc>')
-- km.vkeymap('<A-_>', 'c<sub><Esc>pa</sub><Esc>')
-- km.inkeymap('<A-^>', '<Esc>s<sup><Esc>pa</sup>')
-- km.inkeymap('<A-_>', '<Esc>s<sub><Esc>pa</sub>')

-- Alt S takes a screenshot and saves in a folder called by the filename.img
-- with the name as datetime and inserts it in the text
-- local screenshot_sequence = "<Esc>:let scrotfname=@% . '.img/' . strftime('%FT%H_%M_%S') . '.png'<CR>:execute '!mkdir -p ' . @% . '.img'<CR>:execute '!gnome-screenshot -a -f \"' . scrotfname . '\"'<CR>:execute 'normal! a' . scrotfname<CR><Esc>"

-- km.inkeymap('<A-S>', screenshot_sequence, {noremap = true, silent = true})

----------
---------- Tweaks to defaults
----------

-- hold on to selection when changing indentation
km.vkeymap('<', '<gv')
km.vkeymap('>', '>gv')

-- move selection
km.vkeymap('<A-k>', ':m \'<-2<CR>gv=gv')
km.vkeymap('<A-j>', ':m \'>+1<CR>gv=gv')  -- this doesn't seem to work

-- pasting in visual mode doesn't overwrite the clipboard content
km.vkeymap('p', '"_dP')

-- esc goes to normal mode in terminal windows
km.tkeymap('<Esc><Esc>', '<C-\\><C-n>')

----------
---------- Telescope
----------

km.wk.register({ ['<leader>t'] = { name = ' Telescope' } }, { mode = 'n' })
km.nkeymap('<leader>tf', function()
    require'telescope.builtin'.find_files(
        require'telescope.themes'.get_dropdown { previewer = false }
    )
end, 'Open file')
km.nkeymap('<leader>tg', '<cmd>Telescope live_grep<cr>', 'Live grep')
km.nkeymap('<leader>tr', '<cmd>Telescope lsp_references<cr>', 'Browse references')
km.nkeymap('<leader>th', function()
    require'telescope.builtin'.oldfiles(
        require'telescope.themes'.get_dropdown { previewer = false }
    )
end, 'Recent files')

----------
---------- Gitsigns
----------

km.wk.register({ ['<leader>g'] = { name = ' Git' } }, { mode = 'n' })
km.nkeymap('<leader>gb', '<cmd>Gitsigns blame_line<cr>', ' Blame line')
km.nkeymap('<leader>g]', '<cmd>Gitsigns next_hunk<cr>', ' Next hunk')
km.nkeymap('<leader>g[', '<cmd>Gitsigns prev_hunk<cr>', ' Prev hunk')
km.nkeymap('<leader>g?', '<cmd>Gitsigns preview_hunk<cr>', ' Preview changes')

----------
---------- NvimTree
----------

km.nkeymap('ge', '<cmd>NvimTreeToggle<CR>', 'פּ Toggle Explorer')

----------
---------- Trouble
----------

km.nkeymap('<leader>T', '<cmd>TroubleToggle<cr>', 'Trouble')

----------
---------- Notify
----------

km.wk.register({ ['<leader>n'] = { name = ' Notifications' } }, { mode = 'n' })
km.nkeymap('<leader>nd', '<cmd>lua require"notify".dismiss()<cr>', 'Dismiss Notifications')

----------
---------- DAP
----------

km.wk.register({ ['<leader>b'] = { name = ' Debug' } }, { mode = 'n' })
km.nkeymap('<leader>bb', '<cmd>DapToggleBreakpoint<cr>', 'Toggle Breakpoint')
km.nkeymap('<leader>bc', '<cmd>DapContinue<cr>', 'Continue')
km.nkeymap('<leader>bl', '<cmd>DapShowLog<cr>', 'Show Log')
km.nkeymap('<leader>br', '<cmd>DapToggleRepl<cr>', 'Toggle Repl')
km.nkeymap('<leader>bO', '<cmd>DapStepOut<cr>', 'Step Out')
km.nkeymap('<leader>bi', '<cmd>DapStepInto<cr>', 'Step Into')
km.nkeymap('<leader>bo', '<cmd>DapStepOver<cr>', 'Step Over')
km.nkeymap('<leader>bk', '<cmd>DapTerminate<cr>', 'Terminate')
km.nkeymap('<leader>bu', '<cmd>lua require"dapui".toggle()<cr>', ' DAP UI')

----------
---------- Terminal splitter
----------

km.wk.register({ ['<leader>/'] = { name = ' Term Split' } })
km.nkeymap('<leader>/v', '<cmd>vs<cr><cmd>terminal<cr>', 'ﲖ Vertical')
km.nkeymap('<leader>/h', '<cmd>sp<cr><cmd>terminal<cr>', 'ﲐ Horizontal')

----------
---------- Diff View
----------

km.wk.register({ ['<leader>?'] = { name = ' Diff View' } })
km.nkeymap('<leader>?o', '<cmd>DiffviewOpen<cr>', 'DiffviewOpen')
km.nkeymap('<leader>?c', '<cmd>DiffviewClose<cr>', 'DiffviewClose')
km.nkeymap('<leader>?r', '<cmd>DiffviewRefresh<cr>', 'DiffviewRefresh')
km.nkeymap('<leader>?f', '<cmd>DiffviewToggleFiles<cr>', 'DiffviewToggleFiles')

km.nkeymap('<leader>?0', '<cmd>DiffviewOpen HEAD<cr>', 'DiffviewOpen HEAD')
km.nkeymap('<leader>?1', '<cmd>DiffviewOpen HEAD^<cr>', 'DiffviewOpen HEAD^')
km.nkeymap('<leader>?2', '<cmd>DiffviewOpen HEAD^^<cr>', 'DiffviewOpen HEAD^^')
km.nkeymap('<leader>?3', '<cmd>DiffviewOpen HEAD^^^<cr>', 'DiffviewOpen HEAD^^^')
km.nkeymap('<leader>?4', '<cmd>DiffviewOpen HEAD^^^^<cr>', 'DiffviewOpen HEAD^^^^')

km.nkeymap(
    '<leader>?H',
    '<cmd>lua vim.notify("]c → next difference\\n[c → previous difference\\ndo → diff obtain\\ndp → diff put", "info", {title = "Diff View Shortcuts"})<cr>',
    'Show Shortcuts'
)

----------
---------- Context Menu
----------

local ContextMenu = require'nvpunk.util.context_menu'

local function context_menu_func()
    ContextMenu(
        'Choose a category',
        {
            'LSP',
        },
        {
            function() ContextMenu(
                'Chose an LSP action',
                {
                    'Code Actions              <C-f>',
                    'Go to Declaration            gD',
                    'Go to Definition             gd',
                    'Go to Implementation         gI',
                    'Signature Help            <C-k>',
                    'Rename                <space>rn',
                    'References                   gr',
                    'Expand Diagnostics     <space>e',
                    'Auto Format            <space>f',
                },
                {
                    vim.lsp.buf.code_action,
                    function()
                        vim.cmd[[tab split]]
                        vim.lsp.buf.declaration()
                    end,
                    function()
                        vim.cmd[[tab split]]
                        vim.lsp.buf.definition()
                    end,
                    vim.lsp.buf.implementation,
                    vim.lsp.buf.signature_help,
                    vim.lsp.buf.rename,
                    vim.lsp.buf.references,
                    vim.diagnostic.open_float,
                    vim.lsp.buf.formatting,
                }
            ) end,
        }
    )
end

local context_menu_km = {
    '<A-m>',
    context_menu_func,
    ' Context Menu'
}
km.nkeymap(unpack(context_menu_km))
km.ikeymap(unpack(context_menu_km))
