local tabnine = require "tabnine"
tabnine.setup {
  disable_auto_comment = true,
  accept_keymap = "<C-q>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt" },
  log_file_path = nil, -- absolute path to Tabnine log file
}
require("tabnine.status").status()
