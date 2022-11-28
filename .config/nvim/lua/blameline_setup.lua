-- Lua
local ok, git_blame = pcall(require, "gitblame")

if not ok then
    return
end


git_blame.is_blame_text_available() -- Returns a boolean value indicating whether blame message is available
git_blame.get_current_blame_text() --  Returns a string with blame message
