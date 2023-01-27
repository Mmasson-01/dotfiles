-- MMASSON REMAP
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>F", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Center when moving quick
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Navigate buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bf", ":bfirst<CR>")
vim.keymap.set("n", "<leader>bl", ":blast<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- Move between panels
--use alt+hjkl to move between split/vsplit panels
vim.keymap.set("n", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("n", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("n", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("n", "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Move text up and down
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


