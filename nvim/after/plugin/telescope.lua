require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")

-- buffer
vim.keymap.set("n", "<leader>bc", builtin.buffers, { desc = "Telescope buffers" })

-- file
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope git ls-files" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope old files" })

-- grep
vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>gb", builtin.current_buffer_fuzzy_find, { desc = "Telescope live fuzzy search in buffer" })

-- help
vim.keymap.set("n", "<leader>hpv", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>hpm", builtin.man_pages, { desc = "Telescope man pages" })
vim.keymap.set("n", "<leader>hps", builtin.spell_suggest, { desc = "Telescope spelling suggestions" })

-- history
vim.keymap.set("n", "<leader>hc", builtin.command_history, { desc = "Telescope lists command history" })
vim.keymap.set("n", "<leader>hs", builtin.search_history, { desc = "Telescope search history" })

-- vim settings
vim.keymap.set("n", "<leader>vk", builtin.keymaps, { desc = "Telescope lists normal mode keymappings" })
vim.keymap.set("n", "<leader>vc", builtin.colorscheme, { desc = "Telescope color schemes" })
vim.keymap.set("n", "<leader>vo", builtin.vim_options, { desc = "Telescope lists vim options" })
vim.keymap.set("n", "<leader>vr", builtin.registers, { desc = "Telescope lists vim registers" })
