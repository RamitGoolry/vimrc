local plugins = {
    -- better buffer line
    {'hoob3rt/lualine.nvim'},

    -- icons
    {'ryanoasis/vim-devicons'},

    -- file explorer, replaces nerdtree
    {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'},

    -- git gutter
    {'lewis6991/gitsigns.nvim'},

    -- treesitter based syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },

    -- rainbow delimiters (brackets etc)
    -- use 'p00f/nvim-ts-rainbow'

    -- better tabline
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    },

    -- color preview
    {'brenoprata10/nvim-highlight-colors'},

    -- completion icons
    {'onsails/lspkind-nvim'},

    -- diagnostic colors for all themes
    {'folke/lsp-colors.nvim'},

    -- show which key does what in long key combos
    {'folke/which-key.nvim'},

    -- Telescope: modular, powerful, extensible fuzzy finder
    {'nvim-telescope/telescope.nvim'},

    -- use telescope as a selector for code actions and more things
    {'nvim-telescope/telescope-ui-select.nvim'},

    -- toggle-able terminal (ctrl backslash)
    {'akinsho/toggleterm.nvim'},

    -- greeter
    {'goolord/alpha-nvim', branch = 'main'},

    -- pretty notifications
    {'rcarriga/nvim-notify'},

    -- replace vim.ui.input with pretty text entry
    {'stevearc/dressing.nvim'},

    -- disable relative numbers where they don't make sense
    {'sitiom/nvim-numbertoggle'},

    -- pretty and better folding
    {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},

    -- nice diffview
    {'sindrets/diffview.nvim'},

    -- replacement for messages, cmdline, popupmenu
    {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
        }
    }
}

-- information bar on top of windows (used for debug buttons)
-- if vim.fn.has('nvim-0.8') == 1 then
--     vim.list_extend(plugins, {'fgheng/winbar.nvim'})
-- end

return plugins
