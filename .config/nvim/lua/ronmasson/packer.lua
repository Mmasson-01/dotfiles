local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Check packer installation
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")
vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])
local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("b0o/mapx.nvim")
    use({"catppuccin/nvim", as = "catppuccin"})
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use('theprimeagen/harpoon')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    --Telescope
    use({
        { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-project.nvim" },
        { "AckslD/nvim-neoclip.lua" },
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- Debugging
            { 'mfussenegger/nvim-dap'},
            { 'rcarriga/nvim-dap-ui'},
            { 'theHamsta/nvim-dap-virtual-text'}
        }
    }

    use("mhartington/formatter.nvim")
    use("mfussenegger/nvim-lint")

    use("numToStr/FTerm.nvim")
    use("numToStr/Comment.nvim")
    use('mbbill/undotree')
    use("kdheepak/lazygit.nvim")
    use("f-person/git-blame.nvim")
    use("lewis6991/gitsigns.nvim")
    use("sindrets/diffview.nvim", { requires = "nvim-lua/plenary.nvim" })
    use("hashivim/vim-terraform")
    use("tpope/vim-sleuth")
    use("lukas-reineke/indent-blankline.nvim")
    use("ur4ltz/surround.nvim")
    -- use("kylechui/nvim-surround")
    use("windwp/nvim-autopairs") -- install without yarn or npm
    use("windwp/nvim-ts-autotag")
    use({"folke/todo-comments.nvim"})
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    use('taybart/b64.nvim')
    use("nvim-tree/nvim-tree.lua")
end)
