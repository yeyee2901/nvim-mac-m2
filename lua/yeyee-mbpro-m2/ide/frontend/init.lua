local M = {}

M.init_frontend = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")
	local typescript = require("typescript")

	-- TYPESCRIPT LANGUAGE SERVER
	typescript.setup({
		disable_commands = true,
		debug = false,
		server = {
			capabilities = capabilities,
			on_attach = on_attach,
		}
	})

	-- TAILWINDCSS
	local tailwind_helper = require("yeyee-mbpro-m2.ide.frontend.tailwindcss")
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
		on_attach = tailwind_helper.update_on_attach(on_attach),
		settings = tailwind_helper.get_settings(),
	})

	-- ASTRO
	lspconfig.astro.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- ESLINT
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
end

return M
