local lspconfig = require('lspconfig')

return function()
  lspconfig["rust_analyzer"].setup({
    on_attach = function(client, bufnr)
      local rust_tools = require('rust-tools')
      rust_tools.setup()
    end
  })
end
