require'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'pyright',
        'vuels',
        'yamlls',
        'clangd',
        'lemminx',
        'ltex',
        'jsonls',
        'vimls',
        'html',
        'emmet_ls',
        'sumneko_lua',
        'cssls',
        'cmake',
        'rust_analyzer',
        'jdtls'
    }
}
require'mason-lspconfig'.setup_handlers {
    require'nvpunk.lsp.langs.default'.setup,
    ['pyright'] = require'nvpunk.lsp.langs.pyright',
    ['sumneko_lua'] = require'nvpunk.lsp.langs.sumneko_lua',
    ['jdtls'] = require'nvpunk.lsp.langs.nvim_jdtls',
}
