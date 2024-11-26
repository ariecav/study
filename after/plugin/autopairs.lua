-- ~/.config/nvim/lua/autopairs.lua

local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then return end

autopairs.setup({
    check_ts = true,  -- Mengaktifkan pemeriksaan Treesitter
    ts_config = {
        lua = { "string" },  -- Jangan tambahkan pasangan di node string Lua
        javascript = { "template_string" },  -- Jangan tambahkan pasangan di template string JavaScript
        java = false,  -- Jangan periksa Treesitter pada Java
    },
})

-- Integrasi dengan nvim-cmp (jika menggunakan)
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if cmp_autopairs_setup then
    local cmp_setup, cmp = pcall(require, "cmp")
    if cmp_setup then
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
end
