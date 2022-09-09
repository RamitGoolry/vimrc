local M = {}

M.nvpunk_update = function()
    vim.notify('Updating Nvpunk...', 'info', {
        title = 'Nvpunk Update'
    })
    require'plenary.job':new({
        command = '/usr/bin/git',
        args = {
            '-C', vim.fn.stdpath'config',
            'pull'
        },
        on_exit = function(_, res)
            if res == 0 then
                vim.notify('Nvpunk updated', 'info', {
                    title = 'Nvpunk Update'
                })
            else
                vim.notify('Nvpunk update failed', 'error', {
                    title = 'Nvpunk Update'
                })
            end
        end
    }):start()
end

vim.api.nvim_create_user_command(
    'NvpunkUpdate',
    function(_) M.nvpunk_update() end,
    { nargs = 0 }
)

return M
