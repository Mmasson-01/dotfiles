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

-- Custom Globals for plugins
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1
vim.g.fzf_action = {['ctrl-t'] = 'tab split', ['ctrl-s'] = 'split', ['ctrl-v'] = "vsplit"}
vim.cmd("let $FZF_DEFAULT_COMMAND = 'ag -g \"\"'")

require("plugins")
require("remap")

-- Terraform LSP
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
--require'lspconfig'.terraformls.setup{}
--require'lspconfig'.tflint.setup{}

local ok_m, m = pcall(require, "mapx")

if ok_m then
    m.noremap("<up>", "<nop>", "silent")
    m.noremap("<down>", "<nop>", "silent")
    m.noremap("<left>", "<nop>", "silent")
    m.noremap("<right>", "<nop>", "silent")

    m.noremap("<leader>w", ":w<CR>", "silent")
    m.noremap("<leader>q", ":q<CR>", "silent")

    -- -- tab navigation
    m.noremap("<S-H>", ":tabprev<CR>", "silent")
    m.noremap("<S-L>", ":tabnext<CR>", "silent")
    m.noremap("<leader>TT", ":tabnew<CR>", "silent")
    m.noremap("<leader>TC", ":tabclose<CR>", "silent")

    -- -- window navigatio
    m.nnoremap("<C-J>", "<C-w><C-j>")
    m.nnoremap("<C-K>", "<C-w><C-k>")
    m.nnoremap("<C-H>", "<C-w><C-h>")
    m.nnoremap("<C-L>", "<C-w><C-l>")

    -- -- lazygit
    m.nnoremap("<leader>gg", ":LazyGit<CR>", "silent")
end
