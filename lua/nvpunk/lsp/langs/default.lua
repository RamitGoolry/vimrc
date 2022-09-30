local M = {}

local lspconfig = require'lspconfig'
local default_opts = {
    on_attach = function(client, bufnr)
        require'nvpunk.lsp.keymaps'.set_lsp_keymaps(client, bufnr)
        require'nvpunk.util.context_menu'.set_lsp_rclick_menu()
        require'aerial'.on_attach(client, bufnr)
    end,
    root_dir = vim.loop.cwd,
    capabilities = require'nvpunk.lsp.capabilities'.capabilities,
    settings = {
        telemetry = { enable = false }
    },
    offset_encoding = 'utf-8',
}
M.default_opts = default_opts
M.add_to_default = function(opts)
    return vim.tbl_deep_extend('force', default_opts, opts)
end
M.setup = function(server_name)
    lspconfig[server_name].setup(default_opts)
end

return M
