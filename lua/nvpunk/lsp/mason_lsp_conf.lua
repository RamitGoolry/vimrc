require'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'emmet_ls',
        'html',
        'jdtls',
        'jsonls',
        'ltex',
        'pyright',
        'rust_analyzer',
        'tsserver',
        'vimls',
        'vuels',
        'yamlls',
    }
}
require'mason-lspconfig'.setup_handlers {
    require'nvpunk.lsp.langs.default'.setup,
    ['pyright'] = require'nvpunk.lsp.langs.pyright',
    ['jdtls'] = require'nvpunk.lsp.langs.nvim_jdtls',
    ['ltex'] = require'nvpunk.lsp.langs.ltex',
    ['tsserver'] = require'nvpunk.lsp.langs.tsserver',
    ['lua_ls'] = require'nvpunk.lsp.langs.lua_ls'
}
