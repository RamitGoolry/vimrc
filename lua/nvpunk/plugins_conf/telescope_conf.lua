local telescope = require'telescope'

local actions = require'telescope.actions'

telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'smart' },
    },
    extensions = {
        ['ui-select'] = {
            require'telescope.themes'.get_dropdown({})
        }
    }
}

telescope.load_extension('ui-select')

-- keymaps for telescope in keymaps.lua
