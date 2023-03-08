require("go").setup({
	goimport = "gopls", -- if set to 'gopls' will use golsp format
	gofmt = "gopls", -- if set to gopls will use golsp format
	max_line_len = 90,
	tag_transform = "snakecase",
	test_dir = "",

	-- go install github.com/kyoh86/richgo@latest
	test_runner = "richgo",

	comment_placeholder = "   ",
	lsp_cfg = false, -- false: use your own lspconfig
	lsp_on_attach = false, -- use on_attach from go.nvim
	lsp_codelens = false,
	dap_debug = false,
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_inlay_hints = {
		enable = false,
	},
})
