return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp", -- Completion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion
            "hrsh7th/cmp-path", -- LSP completion
            "hrsh7th/cmp-buffer", -- LSP completion
        },
        enabled = function()
            local disabled = false
            disabled = disabled or (vim.api.nvim_buf_get_option(0, "buftype") == "prompt")
            return not disabled
        end,
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.filetype_extend("typescript", { "tsdoc" })
            luasnip.filetype_extend("javascript", { "jsdoc" })
            luasnip.filetype_extend("lua", { "luadoc" })
            luasnip.filetype_extend("sh", { "shelldoc" })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end),

                    -- ["<Tab>"] = nil,
                    -- ["<S-Tab>"] = nil,
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "path" },
                    { name = "buffer" },
                }),
            })
        end,
    },
}
