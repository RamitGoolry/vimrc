require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'gopls',
		'html',
		'jsonls',
		'ltex',
		'pyright',
		'rust_analyzer',
		'tsserver',
		'vimls',
	},
})
require('mason-lspconfig').setup_handlers({
	require('nvpunk.lsp.langs.default').setup,
	['pyright'] = require('nvpunk.lsp.langs.pyright'),
	['jdtls'] = require('nvpunk.lsp.langs.nvim_jdtls'),
	['ltex'] = require('nvpunk.lsp.langs.ltex'),
	['tsserver'] = require('nvpunk.lsp.langs.tsserver'),
	['lua_ls'] = require('nvpunk.lsp.langs.lua_ls'),
	['helm_ls'] = require('nvpunk.lsp.langs.helm_ls'),
	['yamlls'] = require('nvpunk.lsp.langs.yamlls'),
	--['rust_analyzer'] = require'nvpunk.lsp.langs.rust_analyzer'
})
