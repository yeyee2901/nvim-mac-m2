if not pcall(require, "cmp") then
	return
end

-- SECTION: Ultisnips Snippet engine
-- Calling ExpandTrigger,
-- will make nvim-cmp completion behave
-- like a UltiSnips placeholder.
-- now nvim-cmp depends on snippet engine
local options = {
	UltiSnipsExpandTrigger = "<M-CR>",
	UltiSnipsJumpForwardTrigger = "<M-CR>",
	UltiSnipsJumpBackwardTrigger = "<M-BS>",
	UltiSnipsListSnippets = "<C-?>",
	UltiSnipsEditSplit = "vertical",
}

for opt, val in pairs(options) do
	vim.g[opt] = val
end

-- SECTION: Nvim-Cmp Autocomplete engine
vim.o.completeopt = "menuone,noselect"
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'vim-dadbod-completion' }, -- database completion on dbui-mode
		{ name = "nvim_lua" },
		{ name = 'path' },
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-q>"] = cmp.mapping.close(),
		["<C-c>"] = cmp.mapping.complete(), -- open completion menu
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
})
