function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
vim.g.catppuccinflavour = "macchiato"
-- THEMES
-- local ok_catpuccin, catppuccin = pcall(require, "catppuccin")
-- if ok_catpuccin then
--     catppuccin.setup({ transparent_background = true })
--     vim.cmd("colorscheme catppuccin")
--     vim.g.catppuccinflavour = "macchiato"
-- end
