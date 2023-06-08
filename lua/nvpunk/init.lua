local try = require('nvpunk.util.try')
try.require('impatient')
reload = require('nvpunk.util.reload')
require('nvpunk.vim_conf')
require('nvpunk.gui_conf')
require('nvpunk.punk_funcs')
require('nvpunk.util.user_conf').export_user_conf_path()
require('nvpunk.plugins')
require('nvpunk.util.user_conf').user_init()

vim.cmd([[
  command! Goharness call append(line('.'), 'fmt.Println("TEST") // TODO: @ramit')
]])

vim.cmd([[
  command! Goiferr call append(line('.'), ['if err != nil {', '   return err, nil', '}'])
]])

-- Use Harpoon to load up all files
-- Step 1 : Check if vim has any commands passed to it
if vim.fn.argc() == 0 then
	local harpoon = require('harpoon.mark')
	local length = harpoon.get_length()

	for i = 1, length do
		local file_table = harpoon.get_marked_file(i)
		-- filename, row, col
		if i == 1 then
			vim.cmd('e ' .. file_table.filename)
			vim.fn.cursor(file_table.row, file_table.col)
		else
			vim.cmd('tabe ' .. file_table.filename)
			vim.fn.cursor(file_table.row, file_table.col)
		end
	end
end
