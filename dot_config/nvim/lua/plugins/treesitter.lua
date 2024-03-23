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
                "astro",
                "svelte",
                "css",
                "scss",
                "javascript",
                "tsx",
                "typescript",
            },
            ignore_install = { "phpdoc" },
            highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
            indent = { enable = true },
            -- autotag = { enable = true },
        })
        ts_context_commentstring.setup({})
        -- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_config()
        -- treesitter_parser_config.templ = {
        --     install_info = {
        --         url = "https://github.com/vrischmann/tree-sitter-templ.git",
        --         files = { "src/parser.c", "src/scanner.cc" },
        --         branch = "master",
        --     },
        -- }
        -- vim.treesitter.language.register("templ", "templ")
    end,
}
