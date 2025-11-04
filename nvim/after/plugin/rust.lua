vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			command = "clippy",
		},
	},
})
