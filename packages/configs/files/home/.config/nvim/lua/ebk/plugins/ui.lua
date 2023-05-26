return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {},
    config = {
      options = {
        icons_enabled = true,
        theme = "powerline",
        ignore_focus = {
          "dap-repl",
          "dapui_console",
          "dapui_breakpoints",
          "dapui_scopes",
          "dapui_stacks",
          "dapui_watches",
        },
        globalstatus = true,
      },
    },
  }
}
