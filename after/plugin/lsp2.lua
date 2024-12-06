local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	lsp_attach = lsp_attach,
	float_border = "rounded",
	sign_text = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "eslint", "html", "cssls" },
	handlers = {

		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		ts_ls = function()
			require("lspconfig").ts_ls.setup({
				single_file_support = false,
				on_attach = function(client, bufnr)
					print("hi ts_ls")
				end,
			})
		end,
		html = function()
			require("lspconfig").html.setup({
				single_file_support = false,
				on_attach = function(client, bufnr)
					print("hi html")
				end,
			})
		end,
	},
})

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
