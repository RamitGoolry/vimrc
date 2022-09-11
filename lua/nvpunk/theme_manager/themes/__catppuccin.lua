--- Set catpuccin theme with specific style
---@param style 'macchiato' | 'latte' | 'frappe' | 'macchiato' | 'mocha'
return function(style)
    require'nvpunk.util.try'.call(function()
        vim.g.catppuccin_flavour = style
        local t = require'catppuccin'
        t.setup {
            dim_inactive = {
                enabled = true,
                shade = 'dark',
                percentage = 0.15
            },
            term_colors = true,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
                coc_nvim = false,
                lsp_trouble = true,
                cmp = true,
                lsp_saga = true,
                gitgutter = true,
                gitsigns = true,
                telescope = true,
                nvimtree = true,
                dap = {
                    enabled = true, enable_ui = true,
                },
                which_key = true,
                indent_blankline = {
                    enabled = false,
                    colored_indent_levels = false,
                },
                dashboard = false,
                neogit = false,
                vim_sneak = false,
                fern = false,
                markdown = true,
                lightspeed = false,
                ts_rainbow = false,
                hop = false,
                notify = true,
                symbols_outline = true,
                mini = true,
                vimwiki = false,
                beacon = false,
                navic = { enabled = false, custom_bg = 'NONE', },
                overseer = false,
            },
        }
        t.load()
        vim.cmd[[colorscheme catppuccin]]
        require'nvpunk.theme_manager.lualine'('catppuccin')
    end,
    {}, 'Failed to load theme catppuccin-' .. style, 'nvpunk.theme_manager')
end
