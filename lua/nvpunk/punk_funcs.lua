local M = {}

M.nvpunk_install_dir = vim.fn.stdpath 'config'

M.nvpunk_update = function()
    vim.notify'Updating Nvpunk...'
    vim.fn.system {
        'git', 'pull', '-C',
        M.nvpunk_install_dir
    }
    vim.notify'Nvpunk Updated'
end

vim.api.nvim_create_user_command(
    'NvpunkUpdate',
    function(_) M.nvpunk_update() end,
    { nargs = 0 }
)

return M
