local lspconfig = require('lspconfig')

return function()
  lspconfig["tsserver"].setup({
    on_attach = function(client, bufnr)
    end
  })
end
