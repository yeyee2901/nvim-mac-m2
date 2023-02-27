local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- HIGHLIGHT ON YANK -----------------------------------------
-- provides better experience on knowing which one is copied
local yank_group = augroup("_UserYankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({
			timeout = 300,
			on_visual = false,
		})
	end,
})


-- TODO: for some reason, ini "expandtab" ga ke set setting-nya, jadi harus di manual pakai autocmd
-- setiap enter file
local expandtab_group = augroup("_UserExpandTabGroup", { clear = true })
autocmd({ "BufEnter", "WinEnter", "FileType" }, {
    group = expandtab_group,
    pattern = { "go", "python", "rust", "proto" },
    callback = function()
        vim.cmd([[ set expandtab ]])
    end
})


autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
