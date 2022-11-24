-- OTIONS
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Globals
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1
vim.g.fzf_action = {['ctrl-t'] = 'tab split', ['ctrl-s'] = 'split', ['ctrl-v'] = "vsplit"}
vim.cmd("let $FZF_DEFAULT_COMMAND = 'ag -g \"\"'")
