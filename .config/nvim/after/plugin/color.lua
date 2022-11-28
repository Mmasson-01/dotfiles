-- THEMES
local ok_catpuccin, catppuccin = pcall(require, "catppuccin")
if ok_catpuccin then
    catppuccin.setup({ transparent_background = true })
    vim.cmd("colorscheme catppuccin")
    vim.g.catppuccinflavour = "mocha"
end
