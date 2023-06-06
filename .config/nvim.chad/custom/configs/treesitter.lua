local options = {
  auto_install = true,
  enable = true,
  ensure_installed = {
    "lua",
    "astro",
    "svelte",
    "bash",
    "go",
    "html",
    "dockerfile",
    "javascript",
    "jsdoc",
    "markdown",
    "toml",
    "tsx",
    "yaml",
    "typescript",
    "yaml",
    "hcl",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  autotag = { enable = true },
}

return options
