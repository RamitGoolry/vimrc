return {
	-- better buffer line
	{ 'hoob3rt/lualine.nvim' },

	-- icons
	{ 'ryanoasis/vim-devicons' },

	-- file explorer
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'main',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
			's1n7ax/nvim-window-picker',
		},
	},

	-- Fugitive : Git Wrapper
	{ 'tpope/vim-fugitive' },

	-- git gutter
	{ 'lewis6991/gitsigns.nvim' },

	-- git blame
	{ 'APZelos/blamer.nvim' },

	-- generate git permalinks
	{
		'ruifm/gitlinker.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
	},

	-- treesitter based syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	},

	-- treesitter based context
	{
		'nvim-treesitter/nvim-treesitter-context',
		run = function()
			require('nvim-treesitter-context').setup({})
			vim.cmd([[TSContextEnable]])
		end,
	},

	{ 'nvim-treesitter/playground' },

	-- rainbow delimiters (brackets etc)
	-- { 'p00f/nvim-ts-rainbow' },

	-- better tabline
	{
		'akinsho/bufferline.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
	},

	-- color preview
	{ 'brenoprata10/nvim-highlight-colors' },

	-- completion icons
	{ 'onsails/lspkind-nvim' },

	-- diagnostic colors for all themes
	{ 'folke/lsp-colors.nvim' },

	-- show which key does what in long key combos
	{ 'folke/which-key.nvim' },

	-- Telescope: modular, powerful, extensible fuzzy finder
	{ 'nvim-telescope/telescope.nvim' },

	-- use telescope as a selector for code actions and more things
	{ 'nvim-telescope/telescope-ui-select.nvim' },

	-- greeter
	{ 'goolord/alpha-nvim', branch = 'main' },

	-- pretty notifications
	{ 'rcarriga/nvim-notify' },

	-- replace vim.ui.input with pretty text entry
	{ 'stevearc/dressing.nvim' },

	-- pretty and better folding
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
	},

	-- nice diffview
	{ 'sindrets/diffview.nvim' },

	-- indentation marks
	{ 'lukas-reineke/indent-blankline.nvim' },

	-- replacement for messages, cmdline, popupmenu
	-- {
	--     'folke/noice.nvim',
	--     dependencies = {
	--         'MunifTanjim/nui.nvim',
	--     }
	-- }

	-- breadcrumbs
	{ 'SmiteshP/nvim-navic' },

	-- better quick fix pane
	{ 'kevinhwang91/nvim-bqf' },

	-- Copilot : AI Assisted Development (Disabled by default)
	{ 'github/copilot.vim' },

	-- Goto Preview
	{
		'rmagatti/goto-preview',
		--'~/Desktop/Code/goto-preview',
		config = function()
			require('goto-preview').setup({
				height = 20,
				width = 80,
			})
		end,
	},

	-- NERDCommenter : Easy commenting
	{ 'preservim/nerdcommenter' },

	-- Undotree : Code History
	{ 'mbbill/undotree' },

	-- Harpoon : Fast file navigation
	{ 'ThePrimeagen/harpoon' },

	-- RapidReturn : Stack based return jumps
	--{'~/Desktop/Code/RapidReturn'}
	{ 'RamitGoolry/RapidReturn' },

	-- Todo Comments : Highight TODOs and other keywords
	{ 'folke/todo-comments.nvim' },

	-- TrueZen : Distraction Free Mode
	{
		'Pocco81/true-zen.nvim',
		config = function()
			require('true-zen').setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	},

	{
		'jackMort/ChatGPT.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
	},
}
