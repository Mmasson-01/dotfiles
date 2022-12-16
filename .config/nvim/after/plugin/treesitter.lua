local ok, configs = pcall(require, "nvim-treesitter.configs")

if ok then
    configs.setup({
        additional_vim_regex_highlighting = false,
        auto_install = true,
        enable = true,
        ensure_installed = {
            "hcl",
            "astro",
            "bash",
            "css",
            "dockerfile",
            "graphql",
            "go",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "markdown",
            "php",
            "python",
            "rust",
            "scss",
            "sql",
            "svelte",
            "toml",
            "tsx",
            "yaml",
            "typescript",
        },
        ignore_install = { "phpdoc" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    })
end
