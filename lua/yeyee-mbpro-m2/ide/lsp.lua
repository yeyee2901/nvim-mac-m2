-- SECTION: GLOBAL VARS
MY_HOME = os.getenv("HOME")

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
		cache_code_action = true,
		sign = true,
		update_time = 300,
		sign_priority = 20,
		virtual_text = true,
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
-- local rust_tools = require("user.plugins.rust-tools")
-- rust_tools.init(
--     rust_tools.init_opts(capabilities_updated, custom_on_attach)
-- )

-- lspconfig.rust_analyzer.setup({
--     cmd = { "rustup", "run", "stable", "rust-analyzer" },
-- 	capabilities = capabilities_updated,
-- 	on_attach = custom_on_attach,
-- })

-- npm i -g pyright
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = custom_on_attach,
})

-- npm i -g intelephense
lspconfig.intelephense.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
lspconfig.tsserver.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g @astrojs/language-server
lspconfig.astro.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g eslint
lspconfig.eslint.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"astro",
	},
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "npm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "auto",
		},
	},
})

-- lua language server
-- lspconfig.sumneko_lua.setup({
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- })
