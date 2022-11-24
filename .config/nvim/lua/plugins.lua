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

local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    --use 'folke/tokyonight.nvim'
    use 'catppuccin/nvim'
   -- Better mappings
    use("b0o/mapx.nvim")
    
    -- Multi Cursor
    use {'mg979/vim-visual-multi', branch = 'master' }


    --Markdown preview
    use 'ellisonleao/glow.nvim'

        -- Native LSP
    use({
        "simrat39/rust-tools.nvim", -- Rust Custom LSP
        "L3MON4D3/LuaSnip", -- Snippets engine
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", -- LSP config
        "hrsh7th/nvim-cmp", -- Completion engine
        "hrsh7th/cmp-nvim-lsp", -- LSP completion
        "saadparwaiz1/cmp_luasnip", -- Snippets cmp
        "redhat-developer/yaml-language-server", -- Yaml LSP
    })
    require("lsp_setup")

    -- Custom linting
    use({
        "mfussenegger/nvim-lint",
        config = function()
            require("lint_setup")
        end,
    })

     -- Format
    use({
        "mhartington/formatter.nvim",
        config = function()
            require("formatter_setup")
        end,
    })
    
    --debugging
    use 'nvim-telescope/telescope-dap.nvim'

    
    --Telescope Requirements
    use 'nvim-lua/popup.nvim'
    
    
    -- Treesitter
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("autopairs_setup")
        end,
    })
    use({ "windwp/nvim-ts-autotag" })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("treesitter_setup")
        end,
    })
    

    -- Neoclip
    use({ "AckslD/nvim-neoclip.lua" })


    --Telescope
    use({
        { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-project.nvim" },
    })
    require("telescope_setup")


    -- Status Bar
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine_setup")
        end,
    })

    -- LazyGit integration
    use("kdheepak/lazygit.nvim")
    -- Git signals
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns_setup")
        end,
    })

    -- Terminal
    use({
        "numToStr/FTerm.nvim",
        config = function()
            require("fterm_setup")
        end,
    })

     -- Cloak
    use({
        "laytan/cloak.nvim",
        config = function()
            require("cloak_setup")
        end,
    })

    --devicons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
end)

