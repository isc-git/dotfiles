-- current line displays absolute, others relative
vim.opt.number = true
vim.opt.relativenumber = true

-- command options
vim.opt.showcmd = true

-- tabs are 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto indent next line
vim.opt.smartindent = true

-- dont wrap line
vim.opt.wrap = false

-- search configuration
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- window configuration
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.signcolumn = "auto"
vim.opt.colorcolumn = "88"

-- disable banner
vim.g.netrw_banner = 0
-- set to tree-like
vim.g.netrw_liststyle = 3
-- return to last edited file
vim.g.netrw_altfile = 1
-- human readable file-size
vim.g.netrw_sizestyle = "H"
