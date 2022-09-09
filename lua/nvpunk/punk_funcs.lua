local nvpunk_install_dir = vim.fn.stdpath 'config'

vim.api.nvim_create_user_command(
    'NvpunkUpdate', function(_)
        vim.fn.system {
            'git', 'pull', '-C',
            nvpunk_install_dir
        }
    end, { nargs = 0 }
)
