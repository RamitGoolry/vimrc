-- ensure dap is loaded
local dap = require'dap'

-- redefine signs and relative colors
vim.fn.sign_define(
    'DapBreakpoint',
    {text='', texthl='DiagnosticSignError', linehl='', numhl=''}
)
vim.fn.sign_define(
    'DapBreakpointRejected',
    {text='', texthl='DiagnosticSignWarn', linehl='', numhl=''}
)
vim.fn.sign_define(
    'DapStopped',
    {text='', texthl='GitSignsDelete', linehl='GitSignsDeleteLn', numhl=''}
)

require'nvpunk.dap.dapui_conf'

-- languages

require'nvpunk.dap.langs.cpp'
require'nvpunk.dap.langs.python'

-- keymaps

require'nvpunk.dap.keymaps'
