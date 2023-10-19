return {
  "f-person/git-blame.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local git_blame = require("gitblame")
    -- git_blame.is_blame_text_available() -- Returns a boolean value indicating whether blame message is available
    -- git_blame.get_current_blame_text() --
  end,
}
