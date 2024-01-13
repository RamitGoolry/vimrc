local lspconfig = require('lspconfig')

return function()
	lspconfig.helm_ls.setup({
		settings = {
			['helm-ls'] = {
				yamlls = {
					path = 'yaml-language-server',
				},
			},
		},
	})
end
