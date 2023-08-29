-- local ok_diffview, diffview = pcall(require, "diffview")
-- local ok_gitblame, git_blame = pcall(require, "gitblame")
-- local ok_signs, gitsigns = pcall(require, "gitsigns")
--
-- local ready = not ok_diffview and ok_gitblame and ok_signs
--
-- if not ready then
--     do
--         return
--     end
-- end

require("gitsigns").setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
})

require("diffview").setup()

local git_blame = require("gitblame")
git_blame.is_blame_text_available() -- Returns a boolean value indicating whether blame message is available
git_blame.get_current_blame_text() --  Returns a string with blame message
