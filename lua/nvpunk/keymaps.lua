-- lsp/buffer specific keymaps in lsp/keymaps.lua

local km = require'nvpunk.util.keymapper'

----------
---------- Leader
----------

--Remap semicolon as leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

----------
---------- Personal shortcuts
----------

-- RapidReturn Keymaps

km.nkeymap('rs', '<cmd>lua require("rapid_return").save()<cr>', '💾 Save Cursor')
km.nkeymap('rr', '<cmd>lua require("rapid_return").rewind()<cr>', '⏪ Rewind Cursor')
km.nkeymap('rf', '<cmd>lua require("rapid_return").forward()<cr>', '⏩ Forward Cursor')
km.nkeymap('rc', '<cmd>lua require("rapid_return").clear()<cr>', 'Clear All Cursors')


km.nkeymap('<leader>A', '<CMD>Alpha<CR>', ' Open Greeter')

-- Copilot Keymaps
km.nkeymap('<leader>Ce', '<cmd>Copilot enable<cr>', 'Enable Copilot')
km.nkeymap('<leader>Cd', '<cmd>Copilot disable<cr>', 'Disable Copilot')

-- Alt S takes a screenshot and saves in a folder called by the filename.img
-- with the name as datetime and inserts it in the text
-- local screenshot_sequence = "<Esc>:let scrotfname=@% . '.img/' . strftime('%FT%H_%M_%S') . '.png'<CR>:execute '!mkdir -p ' . @% . '.img'<CR>:execute '!gnome-screenshot -a -f \"' . scrotfname . '\"'<CR>:execute 'normal! a' . scrotfname<CR><Esc>"

-- km.inkeymap('<A-S>', screenshot_sequence, {noremap = true, silent = true})

-- Toggle File explorer
km.nkeymap('<leader>n', '<cmd>NvpunkExplorerToggle<cr>')

-- Keymaps for Goto Preview
km.nkeymap('<leader>pd', '<cmd>lua require("goto-preview").goto_preview_definition()<cr>', 'Open definition preview')
km.nkeymap('<leader>pt', '<cmd>lua require("goto-preview").goto_preview_type_implementation()<cr>', 'Open type preview')
km.nkeymap('<leader>pi', '<cmd>lua require("goto-preview").goto_preview_implementation()<cr>', 'Open implementation preview')
km.nkeymap('<leader>pr', '<cmd>lua require("goto-preview").goto_preview_references()<cr>', 'Open references preview')


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
---------- Trouble
----------

km.nkeymap('<leader>T', '<cmd>TroubleToggle<cr>', 'Trouble')


----------
---------- Undo Tree
----------

km.nkeymap('<leader>u', '<cmd>UndotreeToggle<cr>', 'Undo Tree')

----------
---------- Harpoon
----------

km.keymap('n', '<leader>a', '<cmd>lua require("harpoon.mark").add_file()<cr>', 'Harpoon Add File')
km.keymap('n', '<leader>;', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', 'Harpoon Quick Menu')
km.keymap('n', '<C-n>', '<cmd>lua require("harpoon.ui").nav_next()<cr>', 'Harpoon to next file')
km.keymap('n', '<C-p>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', 'Harpoon to previous file')

----------
---------- View Splitter
----------

km.nkeymap('<leader>%', '<cmd>vsplit<cr>', 'ﲖ Vertical Split')
km.nkeymap('<leader>"', '<cmd>split<cr>', 'ﲐ Horizontal Split')

----------
---------- Terminal splitter
----------

km.wk.register({ ['<leader>/'] = { name = ' Term Split' } })
km.nkeymap('<leader>/%', '<cmd>vs<cr><cmd>terminal<cr>', 'ﲖ Vertical')
km.nkeymap('<leader>/"', '<cmd>sp<cr><cmd>terminal<cr>', 'ﲐ Horizontal')

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
    '<cmd>h nvpunk-shortcuts-diffview<cr>',
    'Show Shortcuts'
)

----------
---------- Context Menu
----------

require'nvpunk.util.context_menu'.setup_rclick_menu_autocommands()
km.nkeymap('<A-m>', '<cmd>popup PopUp<cr>', 'Open Context Menu')
