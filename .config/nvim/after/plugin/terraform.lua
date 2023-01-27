-- Terraform LSP
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

-- Terraform
vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>")
vim.keymap.set("n", "<leader>tv", ":!terraform validate<CR>")
vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>")
