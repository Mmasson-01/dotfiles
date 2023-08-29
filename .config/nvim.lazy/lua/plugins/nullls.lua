return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local check_eslint_config = function(utils)
      return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
    end

    local check_prettier_config = function(utils)
      return utils.root_has_file({ ".prettierrc" })
    end

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    local sources = {
      null_ls.builtins.formatting.prettier.with({
        condition = check_prettier_config,
      }),
      null_ls.builtins.formatting.eslint.with({
        condition = check_eslint_config,
      }),
      null_ls.builtins.formatting.terraform_fmt.with({
        extra_filetypes = { "hcl" },
      }),
      null_ls.builtins.formatting.stylua.with({
        filetypes = {
          "lua",
        },
        args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
      }),
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines,
    }

    null_ls.setup({ sources = sources, debug = true, on_attach = on_attach})
  end,
}