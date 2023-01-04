local ok, todo = pcall(require, "todo-comments")

if not ok then
    do
        return
    end
end

todo.setup()
