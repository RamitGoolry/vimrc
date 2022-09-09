local M = {}

-- base capabilities + cmp
M.capabilities = require'cmp_nvim_lsp'.update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ufo (folding) related capabilities
M.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
M.capabilities.offsetEncoding = {'utf-8'}

return M
