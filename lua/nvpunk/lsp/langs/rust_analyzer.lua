local inlay_hints = require('lsp-inlayhints')
local lspconfig = require('lspconfig')

return function()
	lspconfig['rust_analyzer'].setup({
		on_attach = function(client, bufnr)
			inlay_hints.on_attach(client, bufnr)
		end,
	})
end
