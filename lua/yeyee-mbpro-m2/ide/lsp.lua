local M = {}

-- SECTION: GLOBAL VARS
MY_HOME = os.getenv("HOME")

-- SECTION: setup Mason
require("yeyee-mbpro-m2.ide.mason")

-- SECTION: SERVER SETTINGS
vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = "✗", texthl = "DiagnosticSignError", linehl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
)

vim.fn.sign_define("DiagnosticSignWarn", { text = "⁉", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.diagnostic.config({
	signs = true,
	virtual_text = false,
	update_in_insert = true,
	float = {
		border = "double",
	},
})

-- SECTION: SERVER SETUP
local lspconfig = require("lspconfig")
local saga = require("lspsaga")
saga.setup({
	border_style = "rounded",
	saga_winblend = 0,
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = false,
		cache_code_action = false,
		sign = false,
		update_time = 300,
		sign_priority = 20,
		virtual_text = false,
	},
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = "q",
	},

    -- code outline like in vsc*de
	show_outline = {
		win_position = "right",
		win_with = "",
		win_width = 40,
		auto_enter = true,
		auto_preview = true,
		virt_text = "┃",
		jump_key = "o",
		auto_refresh = true,
	},
	symbol_in_winbar = {
		enable = true,
		separator = " ",
		ignore_patterns={},
		hide_keyword = false,
		show_file = true,
		-- folder_level = 2,
		respect_root = true,
		color_mode = true,
		in_custom = false,
		file_formatter = "%:t",
		click_support = false,
	},
})

-- update LSP capabilities to include nvim-cmp (completion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities_updated = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities_updated.snippetSupport = true

local custom_on_attach = function(_, _)
	-- Better function signature hinting
	require("lsp_signature").on_attach({
		bind = true, -- Mandatory for config
		doc_lines = 5,
		fix_pos = false,
		hint_enable = true,
		hint_prefix = "🔍 ",
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 12,
		max_width = 120,
		handler_opts = {
			border = "double", -- single/double/shadow
		},

		floating_window = true,
		use_lspsaga = true,
	})
end

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup({
	cmd = { MY_HOME .. "/go/bin/gopls" },
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
    settings = {
        gopls = {
            buildFlags = {
                -- tell gopls to ignore the buildvcs attribute in go build system
                "-buildvcs=false",
            }
        }
    }
})

-- rustup component add rust-analyzer
-- rustup component add clippy
require("rust-tools").setup({
	server = {
		cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' } ,
		on_attach = custom_on_attach,
		capabilities = capabilities,
	},

	tools = {
		-- termopen / quickfix
		executor = require("rust-tools.executors").termopen,
		inlay_hints = {
			auto = true,
			only_current_line = true,
			show_parameter_hints = false,
			highlight = "Comment",
		},
	},
})

-- npm i -g pyright
lspconfig.pyright.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- FRONT END STUFFS
require("yeyee-mbpro-m2.ide.frontend").init_frontend(custom_on_attach, capabilities_updated)

-- JAVA STUFFS
require("yeyee-mbpro-m2.ide.java").init(custom_on_attach, capabilities_updated)

return M
