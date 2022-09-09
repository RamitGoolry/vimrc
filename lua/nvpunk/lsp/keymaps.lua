local M = {}
local km = require'nvpunk.util.keymapper'

M.set_lsp_keymaps = function(client, bufnr)
    local bm = km.create_bufkeymapper(bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
              augroup lsp_document_highlight
                  autocmd! * <buffer>
                  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            false
        )
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings

    bm.nkeymap('gD', '<Cmd>tab split<CR><Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration')
    bm.nkeymap('gd', '<Cmd>tab split<CR><Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition')
    bm.nkeymap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    bm.nkeymap('gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
    bm.inkeymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    km.wk.register({ ['<leader>w'] = { name = 'Workspace' } }, { mode = 'n', buffer = bufnr })
    bm.nkeymap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add folder')
    bm.nkeymap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove folder')
    bm.nkeymap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List folders')
    bm.nkeymap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Open definition')
    bm.nkeymap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
    bm.nkeymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'References')
    bm.nkeymap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostics')
    -- nbufkeymap('<space>e', '<cmd>lua vim.diagnostic.show()<CR>')
    bm.nkeymap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Prev diagnostic')
    bm.nkeymap('<A-E>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    bm.nkeymap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic')
    bm.nkeymap('<A-e>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    bm.nkeymap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    bm.inkeymap('<C-f>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    bm.nkeymap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code actions')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        bm.nkeymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format')
    end
    if client.resolved_capabilities.document_range_formatting then
        bm.vkeymap('<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', 'Format range')
    end
end

return M
