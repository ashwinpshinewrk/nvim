
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.o.termguicolors = true
require("config.lazy")
require("config.mapping")
vim.cmd[[colorscheme tokyonight-night]]
