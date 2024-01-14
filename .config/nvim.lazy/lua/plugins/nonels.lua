return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local check_eslint_config = function(utils)
            return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
        end
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "astro" },
                }),
                null_ls.builtins.diagnostics.eslint_d.with({
                    condition = check_eslint_config,
                }),
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.golines,
                -- null_ls.builtins.formatting.yamlfmt,
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.formatting.terraform_fmt.with({
                    extra_filetypes = { "hcl" },
                }),
            },
            on_attach = function(client, bufnr)
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
            end,
        })
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
    end,
}
