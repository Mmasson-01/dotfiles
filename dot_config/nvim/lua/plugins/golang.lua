return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  keys = {
    {
      "<leader>db",
      "<cmd> DapToggleBreakpoint <CR>",
      silent = true,
      desc = "Add breakpoint at line",
    },
    {
      "<leader>dus",
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      silent = true,
      desc = "Open debugging sidebar",
    },
    {
      "<leader>dgt",
      function()
        require("dap-go").debug_test()
      end,
      silent = true,
      desc = "Debug go test",
    },
    {
      "<leader>dgl",
      function()
        require("dap-go").debug_last()
      end,
      silent = true,
      desc = "Debug last go test",
    },
  },
  config = function()
    local dap_go = require("dap-go")

    dap_go.setup({})
  end,
}
