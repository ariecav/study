local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})

local lsecop = require("telescope")
lsecop.setup({
	extension = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

lsecop.load_extension("ui-select")

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

vim.keymap.set({ "n", "x" }, "<leader>rr", function()
	require("telescope").extensions.refactoring.refactors()
end)
