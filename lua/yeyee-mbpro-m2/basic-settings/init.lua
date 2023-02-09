local opt = {
	encoding = "utf8",

	-- line number
	number = true,

	-- sync system clipboard
	clipboard = "unnamed", -- on mac, it requires pbcopy

	-- who needs mouse
	mouse = "",

	-- disable backup
	swapfile = false,

	-- indentation settings
	smartindent = true,
	smarttab = true,
	-- expandtab = true, -- tab turns into spaces
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4, -- Default

	-- line wrapping
	wrap = false,

	-- ignore case for search commands
	ignorecase = true,
	timeout = true, -- set keystroke timeout to be longer
	timeoutlen = 2000, -- in this case 2 seconds (pardon, I have slow hand sickness)
	updatetime = 1000,
	hlsearch = false,

	-- hide buffers
	hidden = true,

	-- true color
	termguicolors = true,

	-- cursorline
	cursorline = false,

	-- incremental search splits in new window below
	inccommand = "split",

	-- sign column (required for gitsigns gutter)
	signcolumn = "yes",


	-- disable color column (that line delimiter thingy)
	colorcolumn = "0",

	-- lazy redraw the screen (reduces load)
	lazyredraw = true,

	-- window splits will open on right-below current window
	splitbelow = true,
	splitright = true,

	-- single statusline
	-- 3 = global
	-- 2 = each window
	laststatus = 3,

	-- %f = show filename by default, requires neovim 0.8.0
	winbar = "%f",
}

-- Allow Lua syntax in vimscripts ('l' = lua)
vim.g.vimsyn_embed = "l"

vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")

-- set all options
for option, value in pairs(opt) do
	vim.opt[option] = value
end

require("yeyee-mbpro-m2.basic-settings.autocmd")
