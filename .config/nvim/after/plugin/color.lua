-- THEMES
local ok_catpuccin, catppuccin = pcall(require, "catppuccin")
if ok_catpuccin then
    catppuccin.setup({ transparent_background = true })
    vim.cmd("colorscheme catppuccin")
    vim.g.catppuccinflavour = "mocha"
end
vim.g.glow_use_pager = true
vim.g.glow_border = "shadow"
