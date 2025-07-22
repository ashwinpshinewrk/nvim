
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.o.termguicolors = true
require("config.lazy")

vim.cmd[[colorscheme tokyonight-night]]
