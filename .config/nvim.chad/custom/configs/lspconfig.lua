local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

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
  "dockerls",
  "lua_ls",
  "bashls",
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

for _, server in pairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = server_settings[server],
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
