local ok, nullls = pcall(require, "null-ls")
local check_eslint_config = function(utils)
  return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
end
local check_prettier_config = function(utils)
  return utils.root_has_file({ ".prettierrc" })
end

if ok then
  local sources = {
    nullls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "md",
        "txt",
      },
      only_local = "node_modules/.bin",
    }),
    -- nullls.builtins.formatting.prettier.with({
    --   condition = check_prettier_config,
    -- }),
    nullls.builtins.formatting.eslint.with({
      condition = check_eslint_config,
    }),
    nullls.builtins.formatting.terraform_fmt.with({
      extra_filetypes = { "hcl" },
    }),
    nullls.builtins.formatting.stylua.with({
      filetypes = {
        "lua",
      },
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    }),
    nullls.builtins.code_actions.shellcheck,
  }
  nullls.setup({ sources = sources, debug = true })
end
