-- automatically install packer
local install_path = vim.fn.stdpath 'data' ..
                                    '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    print 'Installing packer...'
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end


local _packer_opts = {
    display = {
        -- Have packer use a popup window
        open_fn = function()
            return require('packer.util').float {
                border = require'nvpunk.preferences'.get_window_border()
            }
        end,
    },
}

if vim.fn.has('macunix') == 1 then
    -- fix PackerSync freezing on mac
    _packer_opts.max_jobs = 4
end

packer.init(_packer_opts)

packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- load plugins from the various plugins lists
    for _, section in ipairs(require'nvpunk.plugins_list') do
        for _, plugin in ipairs(section) do
            use(plugin)
        end
    end

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)

if PACKER_BOOTSTRAP then
    local grp = vim.api.nvim_create_augroup('OnPackerComplete', { clear = true })
    vim.api.nvim_create_autocmd(
        { 'User PackerComplete' }, {
            command = 'lua require"nvpunk.plugins_conf"',
            group = grp
        }
    )
else
    require'nvpunk.plugins_conf'
end
