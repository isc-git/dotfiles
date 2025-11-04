return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},

			highlight = {
				enable = true,
				disable = {},
			},

			-- syntax based indentation
			indent = { enable = true },

			-- syntax based selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})

		-- set folding method to syntax-based
		vim.opt.foldenable = false
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
}
