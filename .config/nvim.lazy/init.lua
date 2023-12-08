require("ron.options")
require("ron.keymaps")

-- PACKAGE MANAGER INSTALLATION
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_version = "v9.18.1"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=" .. lazy_version, -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS
require("lazy").setup("plugins")
-- require("tabnine").setup({
--   disable_auto_comment = true,
--   accept_keymap = "<C-q>",
--   dismiss_keymap = "<C-]>",
--   debounce_ms = 800,
--   suggestion_color = { gui = "#808080", cterm = 244 },
--   exclude_filetypes = { "TelescopePrompt", "markdown" },
--   log_file_path = nil, -- absolute path to Tabnine log file
-- })
-- require("tabnine.status").status()
-- vim.keymap.set("n", "<leader>tc", "", { noremap = true, callback = require("tabnine.chat").open })
-- vim.keymap.set("x", "<leader>tc", "", { noremap = true, callback = require("tabnine.chat").open })
-- vim.keymap.set("i", "<leader>tc", "", { noremap = true, callback = require("tabnine.chat").open })
