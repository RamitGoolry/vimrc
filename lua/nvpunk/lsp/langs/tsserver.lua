local lspconfig = require('lspconfig')

return function()
  lspconfig["tsserver"].setup({
    on_attach = function(client, bufnr)
       --require("twoslash-queries").attach(client, bufnr)
    end
  })
end
