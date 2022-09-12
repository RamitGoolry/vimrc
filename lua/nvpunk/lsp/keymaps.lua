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

    bm.nkeymap('gD', function()
        vim.cmd'tab split'
        vim.lsp.buf.declaration()
    end, 'Declaration')
    bm.nkeymap('gd', function()
        vim.cmd'tab split'
        vim.lsp.buf.definition()
    end, 'Definition')
    bm.nkeymap('K', vim.lsp.buf.hover)
    bm.nkeymap('gI', vim.lsp.buf.implementation, 'Implementation')
    bm.inkeymap('<C-k>', vim.lsp.buf.signature_help)
    km.wk.register({ ['<leader>w'] = { name = 'Workspace' } }, { mode = 'n', buffer = bufnr })
    bm.nkeymap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add folder')
    bm.nkeymap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove folder')
    bm.nkeymap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List folders')
    -- bm.nkeymap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Open definition')
    bm.nkeymap('<leader>rn', vim.lsp.buf.rename, 'Rename')
    bm.nkeymap('gr', vim.lsp.buf.references, 'References')
    bm.nkeymap('<leader>e', vim.diagnostic.open_float, 'Show diagnostics')
    bm.nkeymap('[d', vim.diagnostic.goto_prev, 'Prev diagnostic')
    bm.nkeymap(']d', vim.diagnostic.goto_next, 'Next diagnostic')
    -- bm.nkeymap('<leader>q', vim.diagnostic.setloclist)
    bm.inkeymap('<C-f>', vim.lsp.buf.code_action)
    bm.nkeymap('<leader>ca', vim.lsp.buf.code_action, 'Code actions')

    km.wk.register({ ['<leader>v'] = { name = 'Diagnostics Virutal Text' } }, { mode = 'n', buffer = bufnr })
    bm.nkeymap('<leader>vd', function() vim.diagnostic.config({ virtual_text = false }) end, 'Disable')
    bm.nkeymap('<leader>ve', function() vim.diagnostic.config({ virtual_text = true }) end, 'Enable')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        bm.nkeymap('<space>f', vim.lsp.buf.formatting, 'Format')
    end
    if client.resolved_capabilities.document_range_formatting then
        bm.xkeymap('<space>f', vim.lsp.buf.range_formatting, 'Format range')
    end
end

return M
