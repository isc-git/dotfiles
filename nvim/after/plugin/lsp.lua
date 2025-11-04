vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
vim.keymap.set("n", "gh", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

vim.keymap.set("n", "gR", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { buffer = bufnr, desc = "Hover diagnostics" })
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Line Diagnostics" })

local lsp_group = vim.api.nvim_create_augroup("my.lsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			local fmt_group = vim.api.nvim_create_augroup("my.lsp.format." .. args.buf, { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = fmt_group,
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({
						bufnr = args.buf,
						id = client.id,
						timeout_ms = 1000,
					})
				end,
			})
		end
	end,
})
