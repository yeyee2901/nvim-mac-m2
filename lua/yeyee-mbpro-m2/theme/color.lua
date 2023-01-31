local ok, nightfox = pcall(require, "nightfox")
if not ok then
    return
end

nightfox.setup({
	options = {
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled",
		transparent = true,
		terminal_colors = true,
		dim_inactive = false,
		styles = {
			comments = "italic",
			conditionals = "bold,italic",
			constants = "bold",
			functions = "bold",
			keywords = "bold,italic",
			numbers = "NONE",
			operators = "NONE",
			strings = "italic",
			types = "bold",
			variables = "NONE",
		},

		inverse = {
			match_paren = false,
			visual = false,
			search = false,
		},

		modules = {
			barbar = true,
			cmp = true,
			dap_ui = true,
			diagnostic = { enable = true },
			gitsigns = true,
			lsp_saga = true,
			nvimtree = true,
			treesitter = true,
			telescope = true,
		},
	},
	palettes = {},
	specs = {},
	groups = {
		all = {
			["@property"] = { link = "Identifier" }, -- kayaknya authornya kelewatan satu identifier ini
		},
	},
})

vim.cmd([[ colorscheme nightfox ]])

-- ADDTIONAL CUSTOM HIGHLIGHT -----------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Set transparent background for Nvim-Tree
local user_augroup_transparent = augroup("_UserAugroupTransparent", { clear = true })

-- nvim tree to transparent
autocmd({"BufEnter", "VimEnter", "FileType"}, {
    group = user_augroup_transparent,
    pattern = "NvimTree",
    callback = function()
        vim.cmd[[highlight NvimTreeFolderIcon guibg=NONE]]
        vim.cmd[[highlight NvimTreeNormalNC guibg=NONE]]
    end,
})

-- telescope to transparent
autocmd({ "BufEnter" }, {
    group = user_augroup_transparent,
    pattern = "*",
    callback = function()
        vim.cmd([[hi TelescopeNormal guibg=NONE]])
        vim.cmd([[hi TelescopePreviewTitle guibg=NONE]])
        vim.cmd([[hi TelescopePromptTitle guibg=NONE]])
        vim.cmd([[hi Normal guibg=NONE]])
        vim.cmd([[highlight NormalFloat guibg=NONE]])
    end,
})

