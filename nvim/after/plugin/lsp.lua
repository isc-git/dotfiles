local on_attach = function(client, bufnr)
    -- Format on save if supported
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type Definition" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

    -- help
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = "rounded" })
    end, { buffer = bufnr, desc = "Hover" })
    vim.keymap.set('n', 'gs', function()
        vim.lsp.buf.signature_help({ border = "rounded"})
    end, { buffer = bufnr, desc = "Signature Help" })

    -- diagnostics navigation
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = bufnr, desc = "Line Diagnostics" })
    vim.keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -1 })
    end, { buffer = bufnr, desc = "Prev Diagnostic" })
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.jump({ count = 1 })
    end, { buffer = bufnr, desc = "Next Diagnostic" })
end


-- mason to automatically set up language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
        end,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            })
        end,
    },
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = function() luasnip.jump(1) end,
        ['<C-b>'] = function() luasnip.jump(-1) end,
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        --['<CR>'] = cmp.mapping.confirm({ select = true }),
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})
