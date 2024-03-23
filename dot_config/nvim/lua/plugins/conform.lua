return {
    "stevearc/conform.nvim", -- Format plugin
    lazy = false,
    keys = {
        {
            "<leader>F",
            '<CMD>lua require("conform").format({ lsp_fallback = true, async = true })<CR>',
            desc = "Format code",
        },
    },
    opts = {
        formatters_by_ft = {
            javascript = { { "eslint_c", "prettierd" } },
            javascriptreact = { { "eslint_c", "prettierd" } },
            typescript = { { "eslint_c", "prettierd" } },
            typescriptreact = { { "eslint_c", "prettierd" } },
            astro = { { "eslint_c", "prettierd" } },
            hcl = { "terraform_fmt" },
            html = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            json = { "prettierd" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
            bash = { "shfmt" },
            sh = { "shfmt" },
            python = { "black" },
            tf = { "terraform_fmt" },
            lua = { "stylua" },
        },
        format_on_save = {
            quiet = true,
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
    config = function(_, opts)
        local conform = require("conform")
        local util = require("conform.util")

        -- Custom formatters
        local formatters = {
            eslint_c = {
                command = util.from_node_modules("eslint_d"),
                args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
                cwd = util.root_file({
                    ".eslintrc",
                    ".eslintrc.js",
                }),
                condition = function(self, ctx)
                    return util.root_file({ ".eslintrc", ".eslintrc.js" })(self, ctx) ~= nil
                end,
            },
        }

        opts["formatters"] = formatters
        conform.setup(opts)
    end,
}
