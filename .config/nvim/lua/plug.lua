local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('scrooloose/nerdtree', {on = {'NERDTreeToggle', 'NERDTree'}})

--Devops
Plug 'stephpy/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'

--Web development
Plug('evanleck/vim-svelte', {branch = 'main'})
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/html5.vim'
Plug 'ryanoasis/vim-devicons'

vim.call('plug#end')

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {}
vim.g.NERDTreeStatusline = '' 

vim.g.coc_global_extensions = {"coc-emmet", "coc-css", "coc-html", "coc-json", "coc-prettier", "coc-tsserver"}
