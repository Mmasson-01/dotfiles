vim.cmd([[au BufRead *.yaml,*.yml if search('hosts:\|tasks:\|roles:', 'nw') | set ft=yaml.ansible | endif]])
vim.cmd([[au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible]])
