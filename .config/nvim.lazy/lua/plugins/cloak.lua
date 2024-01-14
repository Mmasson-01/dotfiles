return {
    "laytan/cloak.nvim",
    opts = {
        enabled = true,
        highlight_group = "Comment",
        cloak_character = "*",
        patterns = { { file_pattern = ".env*", cloak_pattern = "=.+" } },
    },
}
