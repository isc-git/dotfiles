local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
    -- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
    -- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
    -- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
    -- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
    -- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
    -- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
    -- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
    -- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
    -- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
    -- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
    -- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
    -- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
    lsp_zero.default_keymaps({ buffer = bufnr })

    -- may break with multiple language servers on a file
    lsp_zero.buffer_autoformat()
end)

-- mason to automatically set up language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    handlers = {
        lsp_zero.default_setup,
        --- the name of the handler must be the same
        --- as the name of the language server
        rust_analyzer = function()
            --- in this function you can setup
            --- the language server however you want.
            --- in this example we just use lspconfig

            require('lspconfig').rust_analyzer.setup({
                -- in here you can add your own
                -- custom configuration
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    }
                }
            })
        end,
    },
})

-- some more bindings
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

-- PATCH: https://www.reddit.com/r/neovim/comments/15dfx4g/help_lsp_diagnostics_are_not_being_displayed/
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*" },
    callback = function()
        vim.diagnostic.enable(0)
    end
})
