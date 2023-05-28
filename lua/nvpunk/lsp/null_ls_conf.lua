local mason_null_ls = require'mason-null-ls'
local null_ls = require'null-ls'

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason_null_ls.setup {
    ensure_installed = {
        'stylua', 'jq', 'prettier', 'alex'
    },
    automatic_installation = true,
    automatic_setup = true,
}

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup {
    debug = true,
    sources = {
        formatting.stylua.with {
            extra_args = {
                '--quote-style', 'ForceSingle',
                '--indent-width', '4',
                '--column-width', '80'
            }
        },
        formatting.black,
        formatting.prettier,
		diagnostics.eslint,
		formatting.gofmt,
		formatting.goimports,
		--formatting.golangci_lint,
        -- diagnostics.flake8,
        -- null_ls.builtins.completion.spell,
    },
    on_init = function(new_client, _)
        new_client.offset_encoding = 'utf-8'
    end,

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end
			})
		end
	end
}

mason_null_ls.setup_handlers()
