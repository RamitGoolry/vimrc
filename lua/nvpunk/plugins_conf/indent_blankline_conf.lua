vim.g.indent_blankline_filetype_exclude = require('nvpunk.util.nonfile_buffers')
vim.g.indent_blankline_enabled =
	require('nvpunk.preferences').get_indent_blankline_enabled()

--require('indent_blankline').setup({
--show_current_context = true,
--show_current_context_start = true,
--})
