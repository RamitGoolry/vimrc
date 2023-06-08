local lspconfig = require('lspconfig')

return function()
	lspconfig['rust_analyzer'].setup({
		on_attach = function(client, bufnr) end,
	})
end
