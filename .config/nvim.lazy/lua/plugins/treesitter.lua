return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter.configs")
        local ts_context_commentstring = require("ts_context_commentstring")

        ts.setup({
            enable = true,
            ensure_installed = {
                "hcl",
                "bash",
                "dockerfile",
                "go",
                "templ",
                "html",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "markdown",
                "php",
                "python",
                -- "rust",
                "sql",
                "toml",
                "yaml",
                "graphql",
                "astro",
                "svelte",
                "css",
                "scss",
                "javascript",
                "tsx",
                "typescript",
            },
            ignore_install = { "phpdoc" },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })
        ts_context_commentstring.setup({})
    end,
}
