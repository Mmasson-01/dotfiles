local ok_mason, mason = pcall(require, "mason")
local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
local ok_lsp, lsp = pcall(require, "lspconfig")
-- Completion specifics
local ok_cmp, cmp = pcall(require, "cmp")
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local ok_snip, luasnip = pcall(require, "luasnip")
-- Language specifics

local ready = ok_mason and ok_mason_lsp and ok_lsp and ok_cmp_lsp and ok_snip and ok_cmp

if not ready then
    do
        return
    end
end

require("luasnip.loaders.from_vscode").lazy_load()
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local servers = {
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
    "bashls",
    "phpactor"
}

local server_settings = {
    ["sumneko_lua"] = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

local server_with_disabled_formatting = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["tailwindcss"] = true,
    ["yamlls"] = true
}

local use_formatter = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["yamlls"] = true
}

mason.setup()
mason_lsp.setup({
    ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

-- The biding for every servers
local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, bufopts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, bufopts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, bufopts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, bufopts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, bufopts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, bufopts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, bufopts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, bufopts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, bufopts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, bufopts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, bufopts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, bufopts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, bufopts)

    if server_with_disabled_formatting[client.name] then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        if use_formatter[client.name] then
            vim.keymap.set("n", "<leader>F", "<CMD>Format<CR>", bufopts)
        end
    else
        vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
    end
end

for _, server in pairs(servers) do
        lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server_settings[server],
        })
end

-- Completion stuffs
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
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
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users
        { name = "buffer" }
    }),
})


-- organize imports
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function OrganizeImports(timeoutms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

