local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "html",
    "cssls",
    "jsonls",
    "emmet_ls",
    "eslint",
    "svelte",
    "astro",
    "tsserver",
    "tailwindcss",
    "terraformls",
    "tflint",
    "yamlls",
    "ansiblels",
    "gopls",
    "golangci_lint_ls",
    "dockerls",
    "pyright",
    "taplo",
    "sumneko_lua",
    "bashls"
})


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local server_with_disabled_formatting = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["tailwindcss"] = true,
    ["yamlls"] = true,
    ["phpactor"] = true
}

local use_formatter = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["yamlls"] = true,
    ["phpactor"] = true
}
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
lsp.set_preferences({
    sign_icons = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " "
    }
})
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    if server_with_disabled_formatting[client.name] then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        if use_formatter[client.name] then
            vim.keymap.set("n", "<leader>F", "<CMD>Format<CR>", opts)
        end
    else
        vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
    end
end)

lsp.setup()

require("luasnip.loaders.from_vscode").lazy_load()
