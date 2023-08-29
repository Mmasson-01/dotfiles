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
