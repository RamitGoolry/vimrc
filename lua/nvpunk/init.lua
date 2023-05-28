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
