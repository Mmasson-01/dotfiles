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
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])
local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- Better mappings
    use("b0o/mapx.nvim")
     -- Color & Theme
    use({ "catppuccin/nvim", as = "catppucin" })
    use 'kyazdani42/nvim-web-devicons'
   
    -- Status Bar
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine_setup")
        end,
    })

    -- Native LSP
    use({
        "L3MON4D3/LuaSnip", -- Snippets engine
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-buffer",
        "neovim/nvim-lspconfig", -- LSP config
        "hrsh7th/nvim-cmp", -- Completion engine
        "hrsh7th/cmp-nvim-lsp", -- LSP completion
        "saadparwaiz1/cmp_luasnip", -- Snippets cmp
        "rafamadriz/friendly-snippets" -- Vscode like snippets
    })
    require("lsp_setup")
    use("hashivim/vim-terraform")

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

    -- Terminal
    use({
        "numToStr/FTerm.nvim",
        config = function()
            require("fterm_setup")
        end,
    })

    -- Multi Cursor
    use({ "mg979/vim-visual-multi", branch = "master" })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("treesitter_setup")
        end,
        run = ":TSUpdate",
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("autopairs_setup")
        end,
    })
    use({ "windwp/nvim-ts-autotag" })

    --Telescope
    use({
        { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-project.nvim" },
    })
    require("telescope_setup")

    -- Neoclip
    use({ "AckslD/nvim-neoclip.lua" })
    -- Surround
    use({
        "ur4ltz/surround.nvim",
        config = function()
            require("surround_setup")
        end,
    })

    -- Auto indent detection
    -- Indentation and blank lines indicators
    use("tpope/vim-sleuth")
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indentblankline_setup")
        end,
    })

    -- Git Integrations
    use("kdheepak/lazygit.nvim")
    use({
        "f-person/git-blame.nvim",
        config = function()
            require("blameline_setup")
        end,
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns_setup")
        end,
    })
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("diffview_setup")
        end,
    })

    -- Auto Save
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("autosave_setup")
        end,
    })

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("comment_setup")
        end,
    })

    -- Cloak
    use({
        "laytan/cloak.nvim",
        config = function()
            require("cloak_setup")
        end,
    })

    -- Kitty Conf Highlighting
    use("fladson/vim-kitty")
    --Markdown preview
    use("ellisonleao/glow.nvim")
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
end)
