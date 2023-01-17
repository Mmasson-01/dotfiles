local ok, base64 = pcall(require, "b64")

if not ok then
    return
end

vim.keymap.set("v", "<leader>bae", ":lua require'b64'.encode()<CR>")
vim.keymap.set("v", "<leader>bad", ":lua require'b64'.decode()<CR>")

