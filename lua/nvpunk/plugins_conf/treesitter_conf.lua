-- local wk = require'which-key'

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    ignore_install = {'phpdoc', 'swift', 'fortran', 'php'},
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = '<leader>ss',
            node_incremental = '<Up>',
            scope_incremental = '<S-Up>',
            node_decremental = '<C-Up>',
        },
    },
    indent = {
        -- indentation with treesitter isn't great
        enable = false,
        disable = {
            'html', 'scss', 'css', 'yaml', 'python'
        }
    },
    autopairs = {
        enable = true
    },
    autotag = {  -- this is a plugin: nvim-ts-autotag
        enable = true,
        filetypes = {
            'html', 'xml', 'javascript', 'javascriptreact', 'typescriptreact',
            'svelte', 'vue'
        }
    }
}

-- wk.register {
--     ['<leader>s'] = { name = 'TreeSitter' }
-- }
