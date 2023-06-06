local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "astro-language-server",
        "svelte-language-server",
        "ansible-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "terraform-ls",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        "helm-ls",
        "bash-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "markdown",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "astro",
        "svelte",

        -- low level
        "go",

        -- devops
        "bash",
        "dockerfile",
        "toml",
        "yaml",
        "hcl",
        "terraform",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
    },
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "lua", "hcl", "astro", "svelte", "typescript", "javascript" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-project.nvim",
    },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
      telescope.load_extension "file_browser"
      telescope.load_extension "fzf"
      telescope.load_extension "project"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = true,
  },
  {
    "mbbill/undotree",
    config = true,
  },
  {
    "codota/tabnine-nvim",
    lazy = false,
    build = "./dl_binaries.sh",
    config = function()
      require "custom.configs.tabnine"
    end,
  },
  {
    "pearofducks/ansible-vim",
    build = function()
      vim.cmd [[au BufRead *.yaml,*.yml if search('hosts:\|tasks:\|roles:', 'nw') | set ft=yaml.ansible | endif]]
      vim.cmd [[au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible]]
    end,
  },
  {
    "hashivim/vim-terraform",
    config = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
    config = function()
      require "custom.configs.git-blame"
    end,
  },
}
return plugins
