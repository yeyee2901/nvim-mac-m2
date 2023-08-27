local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

    -- UI stuffs
	use({ "EdenEast/nightfox.nvim" })
	use({ "uloco/bluloco.nvim", requires = { 'rktjmp/lush.nvim' } })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
    use({
        "glepnir/dashboard-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    })

    -- IDE experience (LSP, treesitter, etc)
	use({ "onsails/lspkind-nvim" })
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "honza/vim-snippets" })
	use({ "SirVer/ultisnips" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-path" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "jose-elias-alvarez/typescript.nvim" })

	-- LSP helper
	use({ "williamboman/mason.nvim", })
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = { "neovim/nvim-lspconfig" },
	})

    -- file explorer
    use({
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    })

	use({ "tpope/vim-commentary" })

	-- surrounding symbols editing
	use({ "tpope/vim-surround" })

	-- highlight todo comments
    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    -- UTILITIES END ----------

    -- TELESCOPE
	use({ 
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
	use({ 
        "fhill2/telescope-ultisnips.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
    })

    -- GIT
    use({ "lewis6991/gitsigns.nvim" })
    use({ "tpope/vim-fugitive" })

    -- WINDOW TINT
    use ({ "levouh/tint.nvim" })

    -- GOLANG UTILS
	use({ "ray-x/go.nvim" })
	use({ "ray-x/guihua.lua" })

    -- FORMATTER
	use({ "mhartington/formatter.nvim" })

	-- GOIMPL
	use {
		'edolphin-ydf/goimpl.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-telescope/telescope.nvim'},
			{'nvim-treesitter/nvim-treesitter'},
		},
	}

	-- RUST TOOLS
	use { 'simrat39/rust-tools.nvim' }

	-- TEST DRIVEN DEVELOPMENT
	use { 'vim-test/vim-test' }

	-- FOR CSS COLORS
	use ({ "norcalli/nvim-colorizer.lua" })

	-- CHAT LGBT
	use ({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

	-- Database
	use ({
		"kristijanhusak/vim-dadbod-ui",
		requires = {
			"tpope/vim-dadbod",
			"kristijanhusak/vim-dadbod-completion",
		},
	})
end)
