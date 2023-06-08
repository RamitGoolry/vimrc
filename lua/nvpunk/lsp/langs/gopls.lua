local inlay_hints = require('lsp-inlayhints')
local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		inlay_hints.on_attach(client, bufnr)
	end,
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})
