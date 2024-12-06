require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all" (the four listed parsers should always be installed)
		ensure_installed = { "c", "lua", "vim", "javascript", "typescript", "html" },
		sync_install = false,
		auto_install = true,
		highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
		},
		filetype_to_parsername = {
				ejs = "html",  -- Treat EJS files as HTML
		},
}
