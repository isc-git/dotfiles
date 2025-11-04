vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

local ToggleVirtualLines = function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end

vim.keymap.set("n", "td", ToggleVirtualLines, { desc = "Toggle diagnostic virtual_lines" })
