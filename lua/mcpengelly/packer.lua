vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = { { "nvim-lua/plenary.nvim" } } })
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("theprimeagen/refactoring.nvim")
	use({ "theprimeagen/harpoon", branch = "harpoon2" })
	use("mbbill/undotree")
	use("folke/zen-mode.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip", tag = "v2.*", run = "make install_jsregexp" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	})
	use({
		"nvimtools/none-ls-extras.nvim",
	})
	use({
		"nvimtools/none-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons" })

	use({ "rmagatti/auto-session" })
	--use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	config = {
		clone_timeout = false, -- Menonaktifkan timeout
	}
end)
