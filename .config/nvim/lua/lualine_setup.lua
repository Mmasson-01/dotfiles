local ok, lualine = pcall(require, "lualine")
if not ok then
    do
        return
    end
end

lualine.setup({
  options = {
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'buffers'},
    lualine_x = {'tabs'},
    lualine_y = {'progress'},
    lualine_z = {
      { 'diagnostics',
        sources = {'nvim_diagnostic', 'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    }
  }
})
-- lualine.setup({
--     options = {
--         icons_enabled = true,
--         theme = "catppuccin",
--         component_separators = { left = "", right = "" },
--         section_separators = { left = "", right = "" },
--         disabled_filetypes = {},
--         always_divide_middle = true,
--         globalstatus = true,
--     },
--     sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch", "diff", "diagnostics" },
--         lualine_c = {
--             {
--                 "%f",
--                 color = {
--                     gui = "bold",
--                 },
--             },
--         },
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { "fileformat", "filetype", "location" },
--     },
--     inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = {},
--     },
--     tabline = {},
--     extensions = {},
-- })
