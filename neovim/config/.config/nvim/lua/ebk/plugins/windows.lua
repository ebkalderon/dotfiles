-- https://github.com/anuvyklack/windows.nvim

---@type LazySpec
return {
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = { "anuvyklack/middleclass" },
    opts = {},
    keys = {
      { "<C-w>z", "<Cmd>WindowsMaximize<CR>", desc = "Zoom window" },
    },
    init = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 3
      vim.o.equalalways = true
    end,
  },
}
