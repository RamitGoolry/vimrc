-- automatically install packer
local install_path = vim.fn.stdpath 'data' ..
                                    '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    print 'Installing packer...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    --------
    -------- Themes
    --------

    use 'navarasu/onedark.nvim'
    use {'catppuccin/nvim', as = 'catppuccin'}
    use 'Mofiqul/dracula.nvim'
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/nord.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'tanvirtin/monokai.nvim'
    use 'shaunsingh/moonlight.nvim'
    use 'NTBBloodbath/doom-one.nvim'
    use 'sam4llis/nvim-tundra'
    use 'EdenEast/nightfox.nvim'

    --------
    -------- Interface
    --------

    -- better buffer line
    use 'hoob3rt/lualine.nvim'

    -- icons
    use 'ryanoasis/vim-devicons'

    -- file explorer, replaces nerdtree
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- git gutter
    use 'lewis6991/gitsigns.nvim'

    -- treesitter based syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }

    -- rainbow delimiters (brackets etc)
    -- use 'p00f/nvim-ts-rainbow'

    -- better tabline
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- color preview
    use 'brenoprata10/nvim-highlight-colors'

    -- completion icons
    use 'onsails/lspkind-nvim'

    -- diagnostic colors for all themes
    use 'folke/lsp-colors.nvim'

    -- show which key does what in long key combos
    use 'folke/which-key.nvim'

    -- Telescope: modular, powerful, extensible fuzzy finder
    use 'nvim-telescope/telescope.nvim'

    -- use telescope as a selector for code actions and more things
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- toggle-able terminal (ctrl backslash)
    use 'akinsho/toggleterm.nvim'

    -- greeter
    use {'goolord/alpha-nvim', branch = 'main'}

    -- pretty notifications
    use 'rcarriga/nvim-notify'

    -- replace vim.ui.input with pretty text entry
    use 'stevearc/dressing.nvim'

    -- disable relative numbers where they don't make sense
    use 'sitiom/nvim-numbertoggle'

    -- pretty and better folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- nice diffview
    use 'sindrets/diffview.nvim'

    --------
    -------- Previewers
    --------

    -- empty

    --------
    -------- Shortcuts
    --------

    -- dependency for emmet
    use 'mattn/webapi-vim'

    -- great html shortcuts
    use 'mattn/emmet-vim'

    -- comment shortcuts
    use 'numToStr/Comment.nvim'

    -- auto insert matching brackets and quotes
    use 'windwp/nvim-autopairs'

    -- many modules, I use mini.surround for surrounding text
    use 'echasnovski/mini.nvim'

    -- For quickly switching between camel and snake case etc
    use 'arthurxavierx/vim-caser'

    --------
    -------- Languages
    --------

    use 'petRUShka/vim-opencl'
    use 'arrufat/vala.vim'
    use 'tikhomirov/vim-glsl'
    -- typescript (2 plugins)
    use 'neomake/neomake'
    use 'HerringtonDarkholme/yats.vim'
    -- polyglot again because some languages aren't supported by treesitter
    use 'sheerun/vim-polyglot'
    -- XML, HTML tag autoclosing (requires treesitter)
    -- doesn't work right now
    -- use { 'windwp/nvim-ts-autotag', requires = 'nvim-treesitter/nvim-treesitter' }
    -- For automatic code formatting
    use 'sbdchd/neoformat'
    -- For hugo templating
    use 'phelipetls/vim-hugo'

    --------
    -------- LSP
    --------

    -- install language servers with mason

    -- nvim built-in lsp additional stuff
    -- easier lsp configuration, required by lspsaga
    use 'neovim/nvim-lspconfig'

    -- lua based snippets
    use {'L3MON4D3/LuaSnip', requires = {
        'rafamadriz/friendly-snippets'
    }}

    -- completion
    use {'hrsh7th/nvim-cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'lukas-reineke/cmp-under-comparator'
    }}
    -- diagnostics and code actions?
    -- use 'glepnir/lspsaga.nvim'

    -- code outline (classes, functions, vars...)
    use 'simrat39/symbols-outline.nvim'

    -- step by step signature help
    use 'ray-x/lsp_signature.nvim'

    -- diagnostics tray
    use 'folke/trouble.nvim'

    -- Use Neovim as a language server to inject LSP diagnostics,
    -- code actions, and more via Lua.
    use 'jose-elias-alvarez/null-ls.nvim'

    -- java language server from eclipse
    use 'mfussenegger/nvim-jdtls'

    -- show language server starting progress in the lower left corner
    use 'j-hui/fidget.nvim'

    --------
    -------- DAP
    --------

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'

    --------
    -------- Tools and plugins management

    -- plugin installer and manager for LSP, DAP, formatters and more
    use 'williamboman/mason.nvim'

    -- bridge mason and lspconfig
    use 'williamboman/mason-lspconfig.nvim'

    --------
    -------- Plumbing and other misc
    --------

    -- utility functions; common dependency
    use 'nvim-lua/plenary.nvim'

    -- compile lua and make nvim faster
    use 'lewis6991/impatient.nvim'

    -- automatic mkdir on new file save if dir does not exist
    use 'jghauser/mkdir.nvim'

    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)

if PACKER_BOOTSTRAP then
    local grp = vim.api.nvim_create_augroup('OnPackerComplete', { clear = true })
    vim.api.nvim_create_autocmd(
        { 'User PackerComplete' }, {
            command = 'lua require"nvpunk.plugins_conf"',
            group = grp
        }
    )
else
    require'nvpunk.plugins_conf'
end
