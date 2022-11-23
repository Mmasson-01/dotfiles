local nnoremap = require("mmasson.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>lg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("C-f", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>")
nnoremap("<leader>b", "<cmd>NERDTreeToggle<CR>")
