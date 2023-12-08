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
vim.keymap.set("n", "<leader>bd", ":bp|bd#<CR>")

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

vim.keymap.set("n", "<up>", "<nop>", { silent = true })
vim.keymap.set("n", "<down>", "<nop>", { silent = true })
vim.keymap.set("n", "<left>", "<nop>", { silent = true })
vim.keymap.set("n", "<right>", "<nop>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
-- -- tab navigation
vim.keymap.set("n", "<S-H>", ":tabprev<CR>", { silent = true })
vim.keymap.set("n", "<S-L>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>TT", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>TC", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<S-<", "<cmd>-tabmove<cr>", { desc = "Move tab to left", silent = true, noremap = true })
vim.keymap.set("n", "<S->", "<cmd>+tabmove<cr>", { desc = "Move tab to right", silent = true })
-- -- window navigatio
vim.keymap.set("n", "<C-J>", "<C-w><C-j>")
vim.keymap.set("n", "<C-K>", "<C-w><C-k>")
vim.keymap.set("n", "<C-H>", "<C-w><C-h>")
vim.keymap.set("n", "<C-L>", "<C-w><C-l>")
-- Resize window
vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

vim.keymap.set("n", "<leader>cf", "<CMD>let @+=expand('%:.')<CR>", { desc = "Copy relative file name", silent = true })
