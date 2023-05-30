local NVIM_TREE_WIDTH_RATIO = 0.8
local NVIM_TREE_HEIGHT_RATIO = 0.5

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},

	view = {
		relativenumber = false,
		number = false,
		signcolumn = "yes",
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * NVIM_TREE_WIDTH_RATIO
				local window_h = screen_h * NVIM_TREE_HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
				- vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * NVIM_TREE_WIDTH_RATIO)
		end,
	},

	-- if you want sidebar
	-- view = {
		-- 	width = 30,
		-- 	hide_root_folder = true,
		-- 	side = "left",
		-- 	mappings = {
		-- 		custom_only = false,
		-- 		list = {},
		-- 	},
		-- 	number = false,
		-- 	relativenumber = false,
		-- 	signcolumn = "yes",
		-- },
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
	})
