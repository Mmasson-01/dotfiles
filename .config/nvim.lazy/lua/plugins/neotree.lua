return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    version = "v3.x",
    keys = {
        {
            "<leader>e",
            "<cmd>Neotree toggle reveal position=float<cr>",
            -- function()
            --     require("neo-tree.command").execute({ toggle = true })
            -- end,
            desc = "Explorer NeoTree (root dir)",
        },
    },
    opts = {
        git_status_async = true,
        filesystem = {
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            },
            use_libuv_file_watcher = true,
        },
        window = {
            position = "float",
            mappings = {
                ["<space>"] = "none",
            },
        },
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
        },
    },
}
