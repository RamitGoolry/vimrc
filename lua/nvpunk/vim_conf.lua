-- not necessary?
vim.cmd('set nocompatible')

local vim_opts = {
<<<<<<< Updated upstream
    backup = false,  -- backup file before overwriting it
    -- clipboard = 'unnamedplus'  -- set clipboard to X clipboard
    cmdheight = 1,  -- lines for showing messages in the bottom command line
    completeopt = {'menuone', 'noselect'},  -- always show completion popup,
                                            -- don't autoselect
    conceallevel = 0,  -- don't conceal conceal-able things
    fileencoding = 'utf-8',  -- just for good measure
    hlsearch = true,  -- traditional search behavior, show all matches
                      -- until you :noh
    ignorecase = true,  -- case insensitive search
    smartcase = true,  -- case sensitive if using caps
    mouse = 'a',  -- enable mouse
    pumheight = 10,  -- popup menu height
    showtabline = 2,  -- always show tabline
    splitbelow = true,  -- hsplits open below current window
    splitright = true,  -- vsplits open right of the current window
    swapfile = false,
    termguicolors = true,
    undofile = false,  -- disable persistent undos
    updatetime = 300,  -- faster completion
    writebackup = false,
    expandtab = false,  -- use spaces instead of tabulations
    shiftwidth = 4,  -- tab = 2 spaces
    tabstop = 4,  -- if there are tabulations, show them as 4 spaces
    cursorline = true,  -- highlight cursor line
    signcolumn = 'yes:2',  -- always show sign column (git gutter?)
	number = true,
	relativenumber = true,
	--statuscolumn = '%l %r ',
    wrap = true,  -- would want this off, but it's good for markdown and txt...
    -- scrolloff = 8,  -- always keep 8 lines below the cursor
    -- sidescrolloff = 8,  -- similar to above, for hscroll
    -- show the 80 columns mark
    colorcolumn = require'nvpunk.preferences'.get_column_mark_enabled() and {100} or {},
    timeoutlen = 500,
    -- hidden = true,  -- allow hidden buffers (mostly for toggleterm)
    mousescroll = 'ver:3,hor:6',
    autoindent = true,
    smartindent=true
    --  
=======
	backup = false, -- backup file before overwriting it
	-- clipboard = 'unnamedplus'  -- set clipboard to X clipboard
	cmdheight = 1, -- lines for showing messages in the bottom command line
	completeopt = { 'menuone', 'noselect' }, -- always show completion popup,
	-- don't autoselect
	conceallevel = 0, -- don't conceal conceal-able things
	fileencoding = 'utf-8', -- just for good measure
	hlsearch = true, -- traditional search behavior, show all matches
	-- until you :noh
	ignorecase = true, -- case insensitive search
	smartcase = true, -- case sensitive if using caps
	mouse = 'a', -- enable mouse
	pumheight = 10, -- popup menu height
	showtabline = 2, -- always show tabline
	splitbelow = true, -- hsplits open below current window
	splitright = true, -- vsplits open right of the current window
	swapfile = false,
	termguicolors = true,
	undofile = false, -- disable persistent undos
	updatetime = 300, -- faster completion
	writebackup = false,
	expandtab = false, -- use spaces instead of tabulations
	shiftwidth = 4, -- tab = 2 spaces
	tabstop = 4, -- if there are tabulations, show them as 4 spaces
	cursorline = true, -- highlight cursor line
	signcolumn = 'yes:2', -- always show sign column (git gutter?)
	number = true,
	relativenumber = true,
	--statuscolumn = '%l %r ',
	wrap = true, -- would want this off, but it's good for markdown and txt...
	-- scrolloff = 8,  -- always keep 8 lines below the cursor
	-- sidescrolloff = 8,  -- similar to above, for hscroll
	-- show the 80 columns mark
	colorcolumn = require('nvpunk.preferences').get_column_mark_enabled() and {
		120,
	} or {},
	timeoutlen = 500,
	-- hidden = true,  -- allow hidden buffers (mostly for toggleterm)
	mousescroll = 'ver:3,hor:6',
	autoindent = true,
	smartindent = true,
	--
>>>>>>> Stashed changes
}

-- unsure what it does, docs:
-- https://neovim.io/doc/user/options.html#'shortmess'
vim.opt.shortmess:append('c')
-- make these commands go to the next line if at the end
vim.opt.whichwrap:append('<,>,[,],h,l')

for k, v in pairs(vim_opts) do
	vim.opt[k] = v
end

vim.cmd('filetype plugin indent on')

-- for vim-hugo to stop complaining with markdown
vim.g.markdown_fenced_languages = {}

-- recognize blueprint files
vim.cmd('au BufNewFile,BufRead *.blp setf blueprint')
