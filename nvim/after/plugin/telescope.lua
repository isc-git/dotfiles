require("telescope").setup {
    extensions = {
        ["ui-select"] = {
        }
    }
}

require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')

-- navigation
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})

-- history
vim.keymap.set('n', '<leader>hc', builtin.command_history, {})
vim.keymap.set('n', '<leader>hs', builtin.search_history, {})

-- nvim random
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>vc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>vm', builtin.marks, {})
vim.keymap.set('n', '<leader>vs', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>vk', builtin.keymaps, {})

-- lsp
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>lg', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>lG', builtin.lsp_type_definitions, {})

vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lt', builtin.treesitter, {})
--vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>lw", function()
    vim.ui.input({ prompt = "symbols: " }, function(query)
        builtin.lsp_workspace_symbols({ query = query })
    end)
end, { desc = "LSP workspace symbols" })

vim.keymap.set('n', '<leader>lf', function()
    builtin.lsp_document_symbols({
        symbols = { "function", "method" },
    })
end, {})

vim.keymap.set('n', '<leader>lss', function()
    builtin.lsp_document_symbols({
        symbols = { "struct" },
    })
end, {})

vim.keymap.set('n', '<leader>le', function()
    builtin.lsp_document_symbols({
        symbols = { "enum" },
    })
end, {})
