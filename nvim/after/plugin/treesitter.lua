require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        -- list of language that will be disabled
        disable = {},
    },
}
