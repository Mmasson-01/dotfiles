-- INIT PLUGINS FIRST
vim.g.mapleader = " "

-- OPTIONS
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.winbar = "%f %m"
vim.opt.wrap = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitbelow = true
vim.opt.splitright = true

require("mmasson")

