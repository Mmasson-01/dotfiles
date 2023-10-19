return {
  "hrsh7th/nvim-cmp", -- Completion engine

  dependencies = {
    "L3MON4D3/LuaSnip", -- Snippets engine
    "hrsh7th/cmp-nvim-lsp", -- LSP completion
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),
    })
    --
    --   cmp.setup({
    --     snippet = {
    --       expand = function(args)
    --         luasnip.lsp_expand(args.body) -- For `luasnip` users.
    --       end,
    --     },
    --     mapping = cmp.mapping.preset.insert({
    --       ["<C-Space>"] = cmp.mapping.complete(),
    --       ["<C-e>"] = cmp.mapping.abort(),
    --       ["<CR>"] = cmp.mapping.confirm({
    --         behavior = cmp.ConfirmBehavior.Replace,
    --         select = true,
    --       }),
    --       ["<Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --           cmp.select_next_item()
    --         elseif luasnip.expand_or_jumpable() then
    --           luasnip.expand_or_jump()
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --       ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --           cmp.select_prev_item()
    --         elseif luasnip.jumpable(-1) then
    --           luasnip.jump(-1)
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --     }),
    --     sources = cmp.config.sources({
    --       { name = "nvim_lsp" },
    --       { name = "luasnip" },
    --     }),
    --   })
  end,
}
