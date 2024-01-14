return {
    "neovim/nvim-lspconfig", -- LSP config

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "simrat39/rust-tools.nvim", -- Rust Custom LSP
        "hrsh7th/cmp-nvim-lsp",     -- LSP completion
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Base
        require("fidget").setup({})
        local mason = require("mason")
        local mason_lsp = require("mason-lspconfig")
        local lsp = require("lspconfig")

        -- Tools
        local cmp_lsp = require("cmp_nvim_lsp")

        local signs = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

        local servers = {
            "svelte",
            "bashls",
            "tsserver",
            "yamlls",
            "jsonls",
            "html",
            "cssls",
            "lua_ls",
            "dockerls",
            "tailwindcss",
            "taplo",
            "astro",
            "gopls",
            "templ",
            -- "htmx-lsp", -- required cargo
            -- "rust_analyzer",
            "terraformls",
            "tflint",
            "ansiblels",
        }

        local server_settings = {
            ["lua_ls"] = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                },
            },
            -- yamlls lsp configuration for neovim
            ["yamlls"] = {
                yaml = {
                    keyOrdering = false,
                },
            },
            ["gopls"] = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
            ["tailwindcss"] = {
                filetypes = {
                    "templ",
                },
                init_options = {
                    userLanguages = {
                        templ = "html",
                    },
                },
            },
        }

        mason.setup()
        mason_lsp.setup({ ensure_installed = servers })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_lsp.default_capabilities(capabilities)

        -- The biding for every servers
        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, bufopts)
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, bufopts)
            -- replace by trouble
            -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, bufopts)
            -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
        end

        for _, server in pairs(servers) do
            lsp[server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = server_settings[server],
            })
        end

        vim.diagnostic.config({
            virtual_text = true,
        })

        require("lspconfig").tailwindcss.setup({
            filetypes = {
                "templ",
            },
            init_options = {
                userLanguages = {
                    templ = "html",
                },
            },
        })
    end,
}
