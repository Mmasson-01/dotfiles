vim.cmd[[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'

    --Markdown preview
    use 'ellisonleao/glow.nvim'
    --LSP autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    --File browsing
    use 'nvim-telescope/telescope-file-browser.nvim'

    --Buffer navigation
    use 'nvim-lualine/lualine.nvim'

    --debugging
    use 'nvim-telescope/telescope-dap.nvim'

    --Telescope Requirements
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    
    --Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    --devicons
    use 'kyazdani42/nvim-web-devicons'
end)
