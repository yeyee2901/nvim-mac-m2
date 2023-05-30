local map = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

-- SET LEADER KEY
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

VISUAL_MODE_MAPPING = {
	-- DELETE TO VOID BUFFER
	{ ["<Leader>d"] = '"_d' },

	-- PASTE, but do not replace yank register
	{ ["<Leader>p"] = '"_dP'},
}

INSERT_MODE_MAPPING = {
	-- DELETING (do not copy to copy register, except when using 'd'-key action)
	{ ["<C-w>"] = '<Esc>vb"_di' },

	-- LSP helper in insert mode
	{ ["<C-K>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
}

NORMAL_MODE_MAPPING = {
	-- KINDA WEIRD, but i'm tired of "not an editor command: W"  :)
	{ ["[["] = ":w<CR>" },
	{ ["]]"] = ":bd<CR>" },
	{ ["[]"] = ":q<CR>" },

	-- DELETING (do not copy to copy register, except when using 'd'-key action)
	{ ["x"] = 'v"_d' },

	-- SESSION
	{ ["<Leader>So"] = "<cmd>source Session.vim<CR>" },
	{ ["<Leader>Ss"] = "<cmd>mksession!<CR>" },

	-- ENABLE FOLDING (for some reason harus di manual)
	{ ["<Leader>zf"] = ":set foldmethod=indent<CR>" },

	-- QUICKFIX LIST NAVIGATION
	{ ["<Leader>cn"] = "<cmd>cnext<CR>" ,},
	{ ["<Leader>cp"] = "<cmd>cprevious<CR>" ,},
	{ ["<Leader>cq"] = "<cmd>cclose<CR>" ,},
	{ ["<Leader>co"] = "<cmd>copen<CR>" ,},

	-- WINDOW MOVEMENT KEYMAPS
	{ ["<C-h>"] = "<C-w>h" },
	{ ["<C-l>"] = "<C-w>l" },
	{ ["<C-j>"] = "<C-w>j" },
	{ ["<C-k>"] = "<C-w>k" },

	-- OPEN SPLIT WINDOW
	{ ["sh"] = "<C-w>s" },
	{ ["sv"] = "<C-w>v" },
	{ ["sq"] = "<C-w>q" },

	-- PLUGIN: barbar.nvim
	{ ["<Tab>l"] = "<cmd>BufferNext<CR>" },
	{ ["<Tab>h"] = "<cmd>BufferPrevious<CR>" },
	{ ["<Tab>1"] = "<cmd>BufferGoto 1<CR>" },
	{ ["<Tab>2"] = "<cmd>BufferGoto 2<CR>" },
	{ ["<Tab>3"] = "<cmd>BufferGoto 3<CR>" },
	{ ["<Tab>4"] = "<cmd>BufferGoto 4<CR>" },
	{ ["<Tab>5"] = "<cmd>BufferGoto 5<CR>" },
	{ ["<Tab>6"] = "<cmd>BufferGoto 6<CR>" },
	{ ["<Tab>7"] = "<cmd>BufferGoto 7<CR>" },
	{ ["<Tab>8"] = "<cmd>BufferGoto 8<CR>" },
	{ ["<Tab>9"] = "<cmd>BufferGoto 9<CR>" },
	{ ["<Tab>0"] = "<cmd>BufferLast<CR>" },
	{ ["<Tab>p"] = "<cmd>BufferPin<CR>" },
	{ ["<Tab><Tab>"] = "<cmd>BufferPick<CR>" },
	{ ["<Tab>H"] = "<cmd>BufferMovePrevious<CR>" },
	{ ["<Tab>L"] = "<cmd>BufferMoveNext<CR>" },
	{ ["<Tab>q"] = "<cmd>BufferClose<CR>" },
	{ ["<Tab>Q"] = "<cmd>BufferCloseAllButPinned<CR>" },

	-- PLUGIN: Nvim-tree
	{ ["<Leader>n"] = "<cmd>NvimTreeToggle<CR>" },

	-- PLUGIN: Telescope
	{ ["<Leader>t?"] = "<cmd>Telescope keymaps<CR>" },
	{ ["<Leader>th"] = "<cmd>Telescope help_tags<CR>" },
	{ ["<Leader>tc"] = "<cmd>Telescope commands<CR>" },
	{ ["<Leader>tf"] = "<cmd>Telescope find_files<CR>" },
	{ ["<Leader>tb"] = "<cmd>Telescope buffers<CR>" },
	{ ["<Leader>tz"] = "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
	{ ["<Leader>ts"] = "<cmd>Telescope live_grep<CR>" },
	{ ["<Leader>tt"] = "<cmd>Telescope treesitter<CR>" },
	{ ["<Leader>td"] = "<cmd>Telescope diagnostics<CR>" },
	{ ["<Leader>tls"] = "<cmd>Telescope lsp_document_symbols<CR>" },
	{ ["<Leader>tld"] = "<cmd>Telescope lsp_definitions<CR>" },
	{ ["<Leader>tli"] = "<cmd>Telescope lsp_implementations<CR>" },
	{ ["<Leader>tlr"] = "<cmd>Telescope lsp_references<CR>" },
	{ ["<Leader>tgb"] = "<cmd>Telescope git_branches<CR>" },
	{ ["<Leader>tgs"] = "<cmd>Telescope git_status<CR>" },
	{ ["<Leader>tgf"] = "<cmd>Telescope git_files<CR>" },
	{ ["<Leader>tgca"] = "<cmd>Telescope git_commits<CR>" },
	{ ["<Leader>tgcb"] = "<cmd>Telescope git_bcommits<CR>" },
	{ ["<C-s>"] = "<cmd>Telescope ultisnips<CR>" },

	-- PLUGIN: Formatter.nvim
	{ ["<Leader>ff"] = "<cmd>Format<CR>" },

	-- PLUGIN: LSP
	{ ["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>" },
	{ ["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>" },
	{ ["gt"] = "<cmd>Lspsaga peek_type_definition<CR>" },
	{ ["<Leader>dj"] = "<cmd>Lspsaga diagnostic_jump_next<CR>" },
	{ ["<Leader>dk"] = "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
	{ ["<Leader>db"] = "<cmd>Lspsaga show_buf_diagnostics<CR>" },
	{ ["<Leader>dl"] = "<cmd>Lspsaga show_line_diagnostics<CR>" },
	{ ["<Leader>r"] = "<cmd>Lspsaga rename<CR>" },

	-- outline using LspSaga
	{ ["<Leader>o"] = "<cmd>Lspsaga outline<CR>" },

	-- PLUGIN: LSP saga
	{ ["<Leader>lp"] = "<cmd>Lspsaga peek_definition<CR>" },
	{ ["<Leader>la"] = "<cmd>Lspsaga code_action<CR>" },
	{ ["<Leader>lr"] = "<cmd>Lspsaga lsp_finder<CR>" },

	-- PLUGIN: Various golang related tools
	{ ["<Leader>Gt"] = "<cmd>GoAddTag<CR>" },
	{ ["<Leader>Gi"] = "<cmd>GoImport<CR>" },
	{ ["<Leader>Ga"] = "<cmd>GoImport<CR>" },
	{ ["<Leader>Gm"] = "<cmd>GoModTidy<CR>" },
	{ ["<Leader>GTf"] = "<cmd>GoTestFile -- -count=1<CR>" },
	{ ["<Leader>GI"] = "<cmd>Telescope goimpl<CR>" },
	{ ["<Leader>Gl"] = "<cmd>GoLint<CR>" },	-- requires golangci-lint (brew install)

	-- PLUGIN: go test
	{ ["<Leader>TF"] = "<cmd>TestFile<CR>"},
	{ ["<Leader>TT"] = "<cmd>TestNearest<CR>"},
	{ ["<Leader>TL"] = "<cmd>TestLast<CR>"},
	{ ["<Leader>TV"] = "<cmd>TestVisit<CR>"},

	-- PLUGIN: nvim dap (debugger)
	--	{ ["<Leader>dr"] = '<cmd>lua require("dap").run()<CR>' },
	--	{ ["<Leader>db"] = '<cmd>lua require("dap").toggle_breakpoint()<CR>' },
	--	{ ["<Leader>d<CR>"] = '<cmd>lua require("dap").continue()<CR>' },
	--	{ ["<Leader>dp"] = '<cmd>lua require("dap").pause()<CR>' },
	--	{ ["<Leader>dj"] = '<cmd>lua require("dap").step_over()<CR>' },
	--	{ ["<Leader>dJ"] = '<cmd>lua require("dap").step_into()<CR>' },
	--	{ ["<Leader>de"] = '<cmd>lua require("dapui").eval()<CR>' },
	--	{
	--		["<Leader>dq"] = '<cmd>lua require("dap").disconnect({ restart = false, terminateDebuggee = true }, function() require("dap").close() end)<CR>',
	--	},
}

---------------------------------------------
-- SET THE KEYMAPS
-- NORMAL MODE MAPPING
for _, mapping in pairs(NORMAL_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("n", lhs, rhs, opts)
	end
end

-- VISUAL MODE MAPPING
for _, mapping in pairs(VISUAL_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("v", lhs, rhs, opts)
	end
end

-- INSERT MODE MAPPING
for _, mapping in pairs(INSERT_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("i", lhs, rhs, opts)
	end
end
