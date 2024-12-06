require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_format = "fallback",
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	notify_no_formatters = true,
	formatters = {
		my_formatter = {
			command = "my_cmd",
			args = { "--stdin-from-filename", "$FILENAME" },
			range_args = function(self, ctx)
				return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
			end,
			stdin = true,
			cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
			require_cwd = true,
			tmpfile_format = ".conform.$RANDOM.$FILENAME",
			condition = function(self, ctx)
				return vim.fs.basename(ctx.filename) ~= "README.md"
			end,
			exit_codes = { 0, 1 },
			env = {
				VAR = "value",
			},
			inherit = true,
			prepend_args = { "--use-tabs" },
			append_args = { "--trailing-comma" },
		},
		other_formatter = function(bufnr)
			return {
				command = "my_cmd",
			}
		end,
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		--null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.completion.spell,
	},
})

vim.keymap.set("n", "<leader.gf", vim.lsp.buf.format, {})
