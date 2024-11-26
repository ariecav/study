
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
		use { 'wbthomason/packer.nvim' }
		use { 'catppuccin/nvim', as = "catppuccin" }
		use {'nvim-telescope/telescope.nvim', tag = '0.1.8',
					requires = { {'nvim-lua/plenary.nvim'} }}	
		use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
		use('nvim-treesitter/playground')
		use('theprimeagen/harpoon')
		use('mbbill/undotree')
		use("folke/zen-mode.nvim")
		use {'nvim-telescope/telescope-ui-select.nvim'}
		use {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
		}

		use {
				"nvim-neo-tree/neo-tree.nvim",
				branch = "v3.x",
				requires = { 
						"nvim-lua/plenary.nvim",
						"MunifTanjim/nui.nvim"}
				}

				use {
						'hrsh7th/nvim-cmp',         -- Required
						'hrsh7th/cmp-nvim-lsp',     -- Required
						'hrsh7th/cmp-buffer',       -- Optional
						'hrsh7th/cmp-path',         -- Optional
						'saadparwaiz1/cmp_luasnip', -- Optional
						'hrsh7th/cmp-nvim-lua',     -- Optional
						'rafamadriz/friendly-snippets'} -- Optional

						-- friendly-snippets
						use	{'L3MON4D3/LuaSnip',
								tag = "v2.*",
										run = "make install_jsregexp"}

						use {'nvim-tree/nvim-tree.lua',
								dependencies = 'nvim-tree/nvim-web-devicons'}

						use {'rmagatti/auto-session'}
						use {
								"windwp/nvim-autopairs",
								event = "InsertEnter",
								config = function()
										require("nvim-autopairs").setup {}
								end
						}
						use {
								'nvimtools/none-ls.nvim',
								'jose-elias-alvarez/null-ls.nvim',
								'MunifTanjim/prettier.nvim'
						}


vim.api.nvim_create_autocmd("FileType", {
    pattern = {"ejs"},
    callback = function()
        vim.bo.filetype = "html"  -- Set filetype to HTML for EJS files
    end,
})

end
)
