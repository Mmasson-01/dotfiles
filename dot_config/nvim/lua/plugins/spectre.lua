return {
    "nvim-pack/nvim-spectre",
    commit = "97cfd1b0f5a6ab35979ce1bee6c17f54745fd1e5",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = true,
    keys = {
        {
            "<leader>S",
            ":Spectre<CR>",
            silent = true,
            desc = "Toggle Spectre",
        },
    },
}
