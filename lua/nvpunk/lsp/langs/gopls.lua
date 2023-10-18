local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				nilness = true,
				unusedwrite = true,
				useany = true,
			},
			experimentalPostfixCompletions = true,
			staticcheck = true,
			gofumpt = true,
		},
	},
})
