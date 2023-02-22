local M = {}
local km = require'nvpunk.util.keymapper'

M.set_lsp_keymaps = function(client, bufnr, extra_keymaps)
    local bm = km.create_bufkeymapper(bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        local group = 'lsp_document_highlight'
        vim.api.nvim_create_augroup(
            group,
            { clear = true }
        )
        vim.api.nvim_create_autocmd('CursorHold', {
            callback = vim.lsp.buf.document_highlight,
            buffer = vim.api.nvim_get_current_buf(),
            group = group,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            callback = vim.lsp.buf.clear_references,
            buffer = vim.api.nvim_get_current_buf(),
            group = group,
        })
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    --
    bm.nkeymap('tD', function()
      vim.cmd 'tab split'
      vim.lsp.buf.declaration()
    end, 'Tab split definition')

    bm.nkeymap('td', function()
      vim.cmd 'tab split'
      vim.lsp.buf.definition()
    end, 'Tab split definition')

    bm.nkeymap('gD', function()
        --vim.cmd'tab split'
        vim.lsp.buf.declaration()
    end, 'Declaration')
    bm.nkeymap('gd', function()
        --vim.cmd'tab split'
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
    bm.nkeymap('<leader>ca', vim.lsp.buf.code_action, 'Code actions')

    km.wk.register({ ['<leader>v'] = { name = 'Diagnostics Virutal Text' } }, { mode = 'n', buffer = bufnr })
    bm.nkeymap('<leader>vd', function() vim.diagnostic.config({ virtual_text = false }) end, 'Disable')
    bm.nkeymap('<leader>ve', function() vim.diagnostic.config({ virtual_text = true }) end, 'Enable')

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        bm.nkeymap('<space>f', function() vim.lsp.buf.format({async = true}) end, 'Format')
    end
    -- TODO range_formatting is deprecated, use format with range option
    -- if client.server_capabilities.documentRangeFormattingProvider then
    --     bm.xkeymap('<space>f', vim.lsp.buf.range_formatting, 'Format range')
    -- end

    if extra_keymaps ~= nil then extra_keymaps(bm) end
end

return M
