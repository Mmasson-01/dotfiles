local ok_m, m = pcall(require, "mapx")
local ok_telescope, telescope = pcall(require, "telescope")
local builtin = require("telescope.builtin")
local ready = ok_m and ok_telescope

if not ready then
    do
        return
    end
end

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = { "^.git[/]", "node_modules", "vendor", ".lock" },
    },
    pickers = {
          find_command = {
          "fd",
          "--type",
          "f",
          "-H",
          "-E",
          "node_modules",
          "-E",
          ".git",
          "-E",
          ".venv",
          "-I",
        }
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
                "~/Workspaces/",
                "~/Workspaces/",
            },
            theme = "dropdown",
            hidden_files = true
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
telescope.load_extension("neoclip")

m.noremap("<leader>fb", ":Telescope file_browser path=%:p:h<CR>", "silent")
m.noremap("<leader>ff", ":Telescope find_files<CR>", "silent")
m.noremap("<leader>fg", ":Telescope live_grep<CR>", "silent")
m.noremap("<leader>fd", ":Telescope buffers<CR>", "silent")
m.noremap("<leader>fsg", ":Telescope grep_string<CR>", "silent")
m.noremap("<leader>pp", ":Telescope project<CR>", "silent")
m.noremap("<leader>nc", ":Telescope neoclip<CR>", "silent")
m.noremap(
    "<C-f>",
    ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top word_match='-w'<CR>",
    "silent"
)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
