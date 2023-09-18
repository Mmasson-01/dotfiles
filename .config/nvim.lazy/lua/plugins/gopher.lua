return {
  "olexsmir/gopher.nvim",
  keys = {
    {
      "<leader>gsj",
      "<cmd> GoTagAdd json<CR>",
      silent = true,
      desc = "Add json struct tags",
    },
    {
      "<leader>gsy",
      "<cmd> GoTagAdd yaml<CR>",
      silent = true,
      desc = "Add yaml struct tags",
    },
  },
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
