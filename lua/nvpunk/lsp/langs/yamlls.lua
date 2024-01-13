local lspconfig = require('lspconfig')

return function()
	lspconfig.yamlls.setup({
		capabilities = {
			textDocument = {
				-- This is to get UFO to work with yaml
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		},
		settings = {
			yaml = {
				validate = false,
			},
		},
	})
end
