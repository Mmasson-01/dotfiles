require("options")
require("plugins")
require("remap")

-- Terraform LSP
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- Go LSP
vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]])


-- Coc OPTIONS
--vim.g.coc_global_extensions = {"coc-emmet", "coc-css", "coc-html", "coc-json", "coc-prettier", "coc-tsserver"}
-- vim.g.coc_global_extensions = {"coc-emmet"}

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
