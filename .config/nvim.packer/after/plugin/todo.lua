local ok, todo = pcall(require, "todo-comments")

if not ok then
    do
        return
    end
end

todo.setup()
vim.keymap.set("n", "<leader>tt", "<CMD>TodoTelescope<CR>")
vim.keymap.set("n", "<leader>tl", "<CMD>TodoLocList<CR>")
