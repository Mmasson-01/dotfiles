return {
    "sindrets/diffview.nvim",
    config = function()
        -- diff
        -- vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent = true })
        -- vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { silent = true })
    end,
    keys = {
        {
            "<leader>do",
            ":DiffviewOpen<CR>",
            desc = "Open Diffview tool",
        },
        {
            "<leader>dc",
            ":DiffviewClose<CR>",
            desc = "Close Diffview tool",
        },
    },
}
