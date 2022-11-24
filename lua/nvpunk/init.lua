local try = require'nvpunk.util.try'
try.require'impatient'
reload = require'nvpunk.util.reload'
require'nvpunk.vim_conf'
require'nvpunk.gui_conf'
require'nvpunk.punk_funcs'
require'nvpunk.util.user_conf'.export_user_conf_path()
require'nvpunk.plugins'
require'nvpunk.util.user_conf'.user_init()
