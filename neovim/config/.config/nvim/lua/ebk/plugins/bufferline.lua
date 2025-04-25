-- https://github.com/akinsho/bufferline.nvim

---@type LazySpec
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
      },
    },
    keys = {
      { "<S-Left>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<S-Right>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<A-S-Left>", "<Cmd>BufferLineMovePrev<CR>", desc = "Shift buffer left" },
      { "<A-S-Right>", "<Cmd>BufferLineMoveNext<CR>", desc = "Shift buffer right" },
      { "<C-x>", "<Cmd>bdelete!<CR>", desc = "Close buffer" },
      { "gb", "<Cmd>BufferLinePick<CR>", desc = "Pick [b]uffer" },
      { "gd", "<Cmd>BufferLinePickClose<CR>", desc = "Pick buffer to close" },
    },
  },
}
