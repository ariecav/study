require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "html", "ts_ls", "pyright"}
}
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.eslint_d 
    },
})
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

local lsp = require('lspconfig')
lsp.pyright.setup{
capabilities = capabilities}
lsp.html.setup{
capabilities = capabilities}
lsp.lua_ls.setup{
capabilities = capabilities}
lsp.ts_ls.setup{ 
capabilities = capabilities}



  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, {})

  vim.keymap.set("n", "<leader>jd", vim.diagnostic.open_float, {})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
vim.diagnostic.config({
    virtual_text = true
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"ejs"},
    callback = function()
        vim.bo.filetype = "html"  -- Treat EJS files as HTML for syntax highlighting and LSP features
    end,
})
