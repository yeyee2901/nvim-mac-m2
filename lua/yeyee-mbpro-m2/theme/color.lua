local ok, bluloco = pcall(require, "bluloco")
if not ok then
	return
end

bluloco.setup({
	-- "auto" | "dark" | "light"
	style = "dark",
	transparent = true,
	italics = true,

	-- bluoco colors are enabled in gui terminals per default.
	terminal = vim.fn.has("gui_running") == 1,
	guicursor   = true,
})

vim.cmd('colorscheme bluloco')

-- ADDTIONAL CUSTOM HIGHLIGHT -----------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Set transparent background for Nvim-Tree
local user_augroup_transparent = augroup("_UserAugroupTransparent", { clear = true })

-- nvim tree to transparent
autocmd({"VimEnter"}, {
	group = user_augroup_transparent,
	pattern = "NvimTree",
	callback = function()
		vim.cmd[[highlight NvimTreeFolderIcon guibg=NONE]]
		vim.cmd[[highlight NvimTreeNormalNC guibg=NONE]]
	end,
})

-- telescope to transparent
autocmd({ "VimEnter" }, {
	group = user_augroup_transparent,
	pattern = "*",
	callback = function()
		vim.cmd([[hi TelescopeBorder guibg=NONE]])
		vim.cmd([[highlight NormalFloat guibg=NONE]])
	end,
})
