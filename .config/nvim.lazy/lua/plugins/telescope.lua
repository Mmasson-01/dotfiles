return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
  },
  keys = {
    {
      "<leader>fd",
      ":Telescope file_browser<CR>",
      silent = true,
      desc = "Open file browser (project dir)",
    },
    {
      "<leader>fb",
      ":Telescope file_browser path=%:p:h<CR>",
      silent = true,
      desc = "Open file browser (current dir)",
    },
    { "<leader>ff", ":Telescope find_files<CR>", silent = true, desc = "Find file" },
    { "<leader>fg", ":Telescope live_grep<CR>", silent = true, desc = "Live grep" },
    { "<leader>bf", ":Telescope buffers<CR>", silent = true, desc = "Open buffer browser" },
    { "<leader>pp", ":Telescope project<CR>", silent = true, desc = "Open workspaces" },
    { "<C-p>", ":Telescope git_files<CR>", silent = true, desc = "Open git files" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = telescope.extensions.file_browser.actions

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "^.git[/]", "node_modules", "vendor", ".*[.]lock", "\\.terragrunt-cache" },
      },
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type",
            "f",
            "-H",
            "-E",
            "node_modules",
            "-E",
            "cache",
            "-E",
            ".git",
            "-E",
            ".env*",
            "-E",
            "Pods",
            "-I",
          },
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
          respect_gitignore = true,
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<A-t>"] = fb_actions.change_cwd,
              ["<C-t>"] = actions.select_tab,
            },
          },
        },
        project = {
          base_dirs = {
            "~/workspaces/",
          },
          theme = "dropdown",
          hidden_files = true,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "ignore_case",
        },
      },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("project")
  end,
}
