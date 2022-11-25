local nnoremap = require("keymap").nnoremap
local tnoremap = require("keymap").tnoremap
local inoremap = require("keymap").inoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-b>", "<cmd>silent NERDTreeToggle<CR>")
nnoremap("<leader>pf", "<cmd>CocCommand prettier.forceFormatDocument<CR>")
inoremap("<C-c>", "<Esc>")

--Navigate buffers
nnoremap("<leader>bn", ":bnext<CR>")
nnoremap("<leader>bp", ":bprevious<CR>")
nnoremap("<leader>bf", ":bfirst<CR>")
nnoremap("<leader>bl",":blast<CR>")

-- Move between panels
--use alt+hjkl to move between split/vsplit panels
nnoremap("<A-h>", "<C-\\><C-n><C-w>h")
nnoremap("<A-j>", "<C-\\><C-n><C-w>j")
nnoremap("<A-k>", "<C-\\><C-n><C-w>k")
nnoremap("<A-l>", "<C-\\><C-n><C-w>l")
nnoremap("<A-h>", "<C-w>h")
nnoremap("<A-j>", "<C-w>j")
nnoremap("<A-k>", "<C-w>k")
nnoremap("<A-l>", "<C-w>l")

nnoremap("ccd", ":CocList diagnostics<CR>")

-- Terraform
nnoremap("<leader>ti", ":!terraform init<CR>")
nnoremap("<leader>tv", ":!terraform validate<CR>")
nnoremap("<leader>tp", ":!terraform plan<CR>")

-- Glow
nnoremap("<C-p>", "<cmd>Glow<CR>")

