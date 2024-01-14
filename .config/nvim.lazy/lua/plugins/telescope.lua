return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-project.nvim",
        "ThePrimeagen/git-worktree.nvim",
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
        { "<leader>fw", ":Telescope git_worktree<CR>", silent = true, desc = "Git worktrees" },
        { "<leader>fh", ":Telescope help_tags<CR>", silent = true, desc = "Help tags" },
        {
            "<leader>bf",
            ":Telescope buffers<CR>",
            silent = true,
            desc = "Open buffer browser",
        },
        { "<leader>pp", ":Telescope project<CR>", silent = true, desc = "Open workspaces" },
        { "<C-p>", ":Telescope git_files<CR>", silent = true, desc = "Open git files" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local fb_actions = telescope.extensions.file_browser.actions

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "^.git[/]",
                    "node_modules",
                    "vendor",
                    ".*[.]lock",
                    ".terragrunt-cache",
                },
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
                        ".terragrunt-cache",
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
                    respect_gitignore = false,
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
        telescope.load_extension("git_worktree")

        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
    end,
}
