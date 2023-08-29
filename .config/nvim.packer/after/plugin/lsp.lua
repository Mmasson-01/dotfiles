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
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

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
  "lua_ls",
  "bashls",
  "volar",
}

local server_settings = {
  ["lua_ls"] = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
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
}

local server_with_disabled_formatting = {
  ["tsserver"] = true,
  ["lua_ls"] = true,
  ["tailwindcss"] = true,
  ["yamlls"] = true,
  ["phpactor"] = true,
  ["cssls"] = true,
}

local use_formatter = {
  ["tsserver"] = true,
  ["cssls"] = true,
  ["lua_ls"] = true,
  ["yamlls"] = true,
  ["phpactor"] = true,
}

local null_ls_format = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
  bufnr = bufnr
end

mason.setup()
mason_lsp.setup({
  ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

-- The biding for every servers
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, bufopts)
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, bufopts)
  vim.keymap.set("n", "gt", function()
    vim.lsp.buf.type_definition()
  end, bufopts)
  vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
  end, bufopts)
  vim.keymap.set("n", "gi", function()
    vim.lsp.buf.implementation()
  end, bufopts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, bufopts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, bufopts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, bufopts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, bufopts)
  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, bufopts)
  vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
  end, bufopts)
  vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
  end, bufopts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, bufopts)

  if server_with_disabled_formatting[client.name] then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    if use_formatter[client.name] then
      vim.keymap.set("n", "<leader>F", null_ls_format, bufopts)
    end
  else
    vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
  end

  if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
    vim.diagnostic.disable(bufnr)
    vim.defer_fn(function()
      vim.diagnostic.reset(nil, bufnr)
    end, 1000)
  end
end

for _, server in pairs(servers) do
  lsp[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = server_settings[server],
  })
end
