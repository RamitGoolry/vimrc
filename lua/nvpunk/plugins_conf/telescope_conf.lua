local telescope = require('telescope')

local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'smart' },
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({}),
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

telescope.load_extension('ui-select')

local km = require('nvpunk.util.keymapper')

km.wk.register({ ['<leader>t'] = { name = ' Telescope' } }, { mode = 'n' })
km.nkeymap('<leader>ff', function()
	require('telescope.builtin').find_files(
		require('telescope.themes').get_dropdown({ previewer = false })
	)
end, 'Open file')
km.nkeymap('<leader>fg', '<cmd>Telescope live_grep<cr>', 'Live grep')
km.nkeymap('<leader>tr', '<cmd>Telescope lsp_references<cr>', '🔭 References')
km.nkeymap(
	'<leader>ti',
	'<cmd>Telescope lsp_implementations<cr>',
	'🔭 Implementations'
)
km.nkeymap('<leader>fh', function()
	require('telescope.builtin').oldfiles(
		require('telescope.themes').get_dropdown({ previewer = false })
	)
end, 'Recent files')
km.nkeymap(
	'<leader>fH',
	'<cmd>h nvpunk-shortcuts-telescope<cr>',
	'Show Shortcuts'
)
